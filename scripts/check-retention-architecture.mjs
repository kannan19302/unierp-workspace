#!/usr/bin/env node
/**
 * scripts/check-retention-architecture.mjs
 *
 * Phase P12-046: Retention primitives.
 *
 * Exit criterion:
 *   "A module implementing its own retention fails an architecture gate"
 *
 * This gate enforces that:
 *   1. No individual application module / service rolls its own ad-hoc purge or custom retention logic
 *      (e.g., raw `DELETE FROM ... WHERE created_at < NOW() - INTERVAL ...` without going through
 *      the canonical retention / legal hold manager).
 *   2. All retention workflows must route through canonical retention primitives (evaluateRetentionEligibility,
 *      legal hold verification, auditable purge execution).
 *   3. Fails CI if rogue ad-hoc retention / purge implementations are detected in application code.
 *
 * Usage:
 *   node scripts/check-retention-architecture.mjs --verify
 */

import { readFileSync, readdirSync, statSync, existsSync } from 'node:fs';
import { resolve, dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const WORKSPACE_ROOT = resolve(__dirname, '..');
const PARENT_ROOT = resolve(WORKSPACE_ROOT, '..');

// Directories to scan for illegal ad-hoc retention implementations
const SCAN_DIRS = [
  join(PARENT_ROOT, 'unierp-api', 'src'),
  join(PARENT_ROOT, 'unierp-data', 'src'),
  join(PARENT_ROOT, 'unierp-framework', 'src'),
];

// Anti-patterns: individual modules executing ad-hoc un-held purges
const FORBIDDEN_PATTERNS = [
  {
    pattern: /customRetentionPurge\s*\(/i,
    name: 'customRetentionPurge',
    reason: 'Ad-hoc custom retention purge method. Must use canonical retention service with legal hold checks.',
  },
  {
    pattern: /deleteMany\(\s*\{\s*where\s*:\s*\{\s*(?:createdAt|updatedAt)\s*:\s*\{\s*lt\s*:\s*(?:retentionDate|cutoff|purgeThreshold)/i,
    name: 'ad-hoc date-based deleteMany',
    reason: 'Direct date-based bulk deletion without verifying active legal holds.',
  },
  {
    pattern: /class\s+\w+RetentionService\b(?!\s+implements\s+IRetentionManager)/,
    name: 'unauthorized RetentionService class',
    reason: 'Per-module custom RetentionService class. Platform retention must be centralized.',
  },
];

function scanDirectory(dir, fileList = []) {
  if (!existsSync(dir)) return fileList;
  const entries = readdirSync(dir);
  for (const entry of entries) {
    if (entry === 'node_modules' || entry === 'dist' || entry === '.git') continue;
    const fullPath = join(dir, entry);
    const stat = statSync(fullPath);
    if (stat.isDirectory()) {
      scanDirectory(fullPath, fileList);
    } else if (/\.(ts|tsx|js|mjs)$/.test(entry) && !entry.includes('.spec.') && !entry.includes('.test.')) {
      fileList.push(fullPath);
    }
  }
  return fileList;
}

export function checkRetentionArchitecture() {
  const allFiles = SCAN_DIRS.flatMap((d) => scanDirectory(d));
  const violations = [];

  for (const filePath of allFiles) {
    const relativePath = filePath.replace(PARENT_ROOT + '/', '').replace(PARENT_ROOT + '\\', '');
    const content = readFileSync(filePath, 'utf8');

    for (const rule of FORBIDDEN_PATTERNS) {
      if (rule.pattern.test(content)) {
        violations.push({
          file: relativePath,
          rule: rule.name,
          reason: rule.reason,
        });
      }
    }
  }

  return {
    filesScanned: allFiles.length,
    violations,
  };
}

if (process.argv.includes('--verify') || process.argv.length <= 2) {
  const result = checkRetentionArchitecture();

  if (result.violations.length > 0) {
    console.error(`\n❌ Retention architecture gate failed (${result.violations.length} rogue retention implementation(s) found):`);
    for (const v of result.violations) {
      console.error(`  - ${v.file}: ${v.rule}`);
      console.error(`    Why: ${v.reason}`);
    }
    process.exit(1);
  }

  console.log(`✅ Retention architecture gate passed (${result.filesScanned} files scanned, zero rogue retention implementations).`);
  process.exit(0);
}
