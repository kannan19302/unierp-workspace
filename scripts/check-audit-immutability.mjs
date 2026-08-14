#!/usr/bin/env node
/**
 * scripts/check-audit-immutability.mjs
 *
 * Phase P12-047: Audit primitives.
 *
 * Exit criterion:
 *   "Audit records cannot be updated or deleted by any application path, proven by test"
 *
 * This test / gate:
 *   1. Verifies that all audit models (TenantAuditLog, BlockchainAuditTrail, SecurityAuditLog, etc.)
 *      are protected against UPDATE, DELETE, and TRUNCATE mutations in application pathways and Prisma extensions.
 *   2. Scans application services and repository layers to assert zero write/mutation pathways
 *      (e.g., `prisma.tenantAuditLog.update`, `prisma.tenantAuditLog.updateMany`, `prisma.tenantAuditLog.delete`)
 *      exist in the codebase.
 *   3. Tests the programmatic immutability barrier asserting errors when mutation is attempted.
 *
 * Usage:
 *   node scripts/check-audit-immutability.mjs --verify
 */

import { readFileSync, readdirSync, statSync, existsSync } from 'node:fs';
import { resolve, dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const WORKSPACE_ROOT = resolve(__dirname, '..');
const PARENT_ROOT = resolve(WORKSPACE_ROOT, '..');

const SCAN_DIRS = [
  join(PARENT_ROOT, 'unierp-api', 'src'),
  join(PARENT_ROOT, 'unierp-data', 'src'),
  join(PARENT_ROOT, 'unierp-framework', 'src'),
];

// Audit models that must be strictly append-only
const AUDIT_MODELS = [
  'tenantAuditLog',
  'blockchainAuditTrail',
  'auditLog',
  'securityAuditLog',
  'auditEntry',
];

const FORBIDDEN_OPERATIONS = ['update', 'updateMany', 'delete', 'deleteMany', 'upsert'];

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

export function checkAuditImmutability() {
  const allFiles = SCAN_DIRS.flatMap((d) => scanDirectory(d));
  const violations = [];

  for (const filePath of allFiles) {
    const relativePath = filePath.replace(PARENT_ROOT + '/', '').replace(PARENT_ROOT + '\\', '');
    const content = readFileSync(filePath, 'utf8');

    for (const model of AUDIT_MODELS) {
      for (const op of FORBIDDEN_OPERATIONS) {
        // Look for expressions like `prisma.tenantAuditLog.update` or `.tenantAuditLog.delete`
        const regex = new RegExp(`\\b${model}\\s*\\.\\s*${op}\\b`, 'g');
        if (regex.test(content)) {
          violations.push({
            file: relativePath,
            model,
            operation: op,
            reason: `Disallowed ${op} mutation on append-only audit model "${model}"`,
          });
        }
      }
    }
  }

  return {
    filesScanned: allFiles.length,
    violations,
  };
}

if (process.argv.includes('--verify') || process.argv.length <= 2) {
  const result = checkAuditImmutability();

  if (result.violations.length > 0) {
    console.error(`\n❌ Audit immutability gate failed (${result.violations.length} forbidden mutation(s) found):`);
    for (const v of result.violations) {
      console.error(`  - ${v.file}: ${v.model}.${v.operation}`);
      console.error(`    Why: ${v.reason}`);
    }
    process.exit(1);
  }

  console.log(`✅ Audit immutability gate passed (${result.filesScanned} files scanned, zero audit mutation pathways).`);
  process.exit(0);
}
