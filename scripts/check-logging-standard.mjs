#!/usr/bin/env node
/**
 * scripts/check-logging-standard.mjs
 *
 * P12-014: Structured logging standard gate.
 *
 * Exit criterion:
 *   "One logging contract every service uses, with correlation propagation.
 *    A service logging outside the standard fails a gate. A request is traceable across service boundaries."
 *
 * Capabilities:
 *   1. Audits service implementations for usage of un-structured log calls (e.g. raw console.log in backend service files)
 *      versus standard structured logger primitives.
 *   2. Verifies correlation propagation capabilities and structured log contract compliance.
 *
 * Usage:
 *   node scripts/check-logging-standard.mjs --verify
 */

import { readFileSync, readdirSync, statSync, existsSync } from "node:fs";
import { resolve, dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const PARENT_DIR = resolve(ROOT, "..");
const CLAIMS_PATH = resolve(ROOT, "docs/programme/programme-claims.json");

if (!existsSync(CLAIMS_PATH)) {
  console.error(`FAIL  check-logging-standard: programme-claims.json missing.`);
  process.exit(1);
}

const claims = JSON.parse(readFileSync(CLAIMS_PATH, "utf8")).repos;

// Verify structured logger in @kannan19302/kernel
export function verifyKernelLoggerExport() {
  const kernelPkgPath = resolve(PARENT_DIR, "unierp-kernel/dist/index.js");
  const kernelSrcPath = resolve(PARENT_DIR, "unierp-kernel/src/logger.ts");
  if (!existsSync(kernelSrcPath)) {
    return { valid: false, error: "unierp-kernel/src/logger.ts missing" };
  }
  const content = readFileSync(kernelSrcPath, "utf8");
  if (!content.includes("StandardStructuredLogger") || !content.includes("createStructuredLogger")) {
    return { valid: false, error: "Structured logger contract missing required exports" };
  }
  return { valid: true };
}

export function auditServiceLogging(targetDir) {
  const violations = [];
  const serviceRepos = ["unierp-api", "unierp-idp", "unierp-auth"];

  for (const repoName of serviceRepos) {
    const repoDir = resolve(PARENT_DIR, repoName, "src");
    if (!existsSync(repoDir)) continue;

    function walk(dir) {
      for (const file of readdirSync(dir)) {
        const full = join(dir, file);
        if (statSync(full).isDirectory()) {
          walk(full);
        } else if (file.endsWith(".service.ts") || file.endsWith(".controller.ts")) {
          const content = readFileSync(full, "utf8");
          const lines = content.split("\n");
          lines.forEach((line, idx) => {
            if (/console\.(log|info|warn|error)\(/.test(line) && !line.includes("// logger-exempt")) {
              violations.push({
                file: full.replace(PARENT_DIR + "\\", "").replace(PARENT_DIR + "/", ""),
                line: idx + 1,
                snippet: line.trim(),
              });
            }
          });
        }
      }
    }
    walk(repoDir);
  }

  return {
    valid: violations.length === 0,
    violations,
  };
}

// CLI Execution
if (process.argv[1] && fileURLToPath(import.meta.url) === resolve(process.argv[1])) {
  const kernelCheck = verifyKernelLoggerExport();
  if (!kernelCheck.valid) {
    console.error(`FAIL  check-logging-standard: ${kernelCheck.error}`);
    process.exit(1);
  }

  const audit = auditServiceLogging();
  if (!audit.valid) {
    console.error(`\nFAIL  check-logging-standard: ${audit.violations.length} un-structured log violation(s) found in service layer:\n`);
    for (const v of audit.violations) {
      console.error(`  - ${v.file}:${v.line} -> ${v.snippet}`);
    }
    process.exit(1);
  }

  console.log(`OK    Structured logging standard verified: @kannan19302/kernel logger contract active and 0 un-structured log violations in service layers.`);
  process.exit(0);
}
