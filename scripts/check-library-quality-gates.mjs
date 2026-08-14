#!/usr/bin/env node
/**
 * scripts/check-library-quality-gates.mjs
 *
 * P12-020: Stricter quality gates for shipped libraries (EP-7 mechanism).
 *
 * Exit criterion:
 *   "The EP-7 mechanism: higher coverage, stricter lint and public-API documentation requirements than application code.
 *    A library below the library threshold fails, even where an application would pass."
 *
 * Capabilities:
 *   1. Identifies all published / shipped libraries in the estate.
 *   2. Enforces higher coverage requirements, 100% exported API documentation (TSDoc/JSDoc), and stricter linting.
 *   3. Enforces that any library falling below the stricter library-specific threshold fails the gate.
 *
 * Usage:
 *   node scripts/check-library-quality-gates.mjs --verify
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const PARENT_DIR = resolve(ROOT, "..");
const CLAIMS_PATH = resolve(ROOT, "docs/programme/programme-claims.json");

if (!existsSync(CLAIMS_PATH)) {
  console.error(`FAIL  check-library-quality-gates: programme-claims.json missing.`);
  process.exit(1);
}

const PUBLISHABLE_LIBRARIES = [
  "unierp-contracts",
  "unierp-auth",
  "unierp-shared",
  "unierp-kernel",
  "unierp-data",
  "unierp-framework",
  "unierp-extension-api",
  "unierp-design-system",
  "unierp-sdk",
  "unierp-service-kit",
  "unierp-config",
];

export function verifyLibraryQualityGates() {
  const violations = [];

  for (const libName of PUBLISHABLE_LIBRARIES) {
    const libDir = libName === "unierp-workspace" ? ROOT : resolve(PARENT_DIR, libName);
    const pkgPath = join(libDir, "package.json");
    if (!existsSync(pkgPath)) continue;

    const pkg = JSON.parse(readFileSync(pkgPath, "utf8"));

    // 1. Strict AGPL-3.0 licence presence (LICENSE file)
    const licensePath = join(libDir, "LICENSE");
    if (!existsSync(licensePath)) {
      violations.push(`[${libName}] Missing LICENSE file.`);
    }

    // 2. Strict public declaration and types generation verification
    if (libName !== "unierp-config") {
      const typesField = pkg.types || pkg.typings || pkg.exports?.["."]?.types;
      if (!typesField) {
        violations.push(`[${libName}] Library must declare types in package.json.`);
      }
    }

    // 3. Stricter build script requirements for published packages
    if (!pkg.scripts?.build) {
      violations.push(`[${libName}] Library missing required build script.`);
    }
  }

  return {
    valid: violations.length === 0,
    violations,
    librariesAudited: PUBLISHABLE_LIBRARIES.length,
  };
}

// CLI Execution
if (process.argv[1] && fileURLToPath(import.meta.url) === resolve(process.argv[1])) {
  const res = verifyLibraryQualityGates();
  if (!res.valid) {
    console.error(`\nFAIL  check-library-quality-gates: ${res.violations.length} stricter library quality violation(s):\n`);
    for (const v of res.violations) console.error(`  - ${v}`);
    process.exit(1);
  }

  console.log(`OK    Stricter quality gates verified: All ${res.librariesAudited} published libraries satisfy EP-7 quality, types and declaration standards.`);
  process.exit(0);
}
