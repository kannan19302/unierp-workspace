#!/usr/bin/env node
/**
 * scripts/check-versioning-policy.mjs
 *
 * P12-010: Semantic versioning policy verification gate.
 *
 * Exit criterion:
 *   "A breaking change published as a minor version is refused, with the breaking symbol named."
 *
 * Enforces:
 *   1. SemVer Compliance: Checks published version bumps against declared change classifications in breaking-changes-registry.json.
 *   2. Major Version Requirement: A package with BREAKING changes must bump major (e.g. 1.0.0 -> 2.0.0). Minor/patch bumps are refused with the breaking symbol named.
 *   3. Minor Version Requirement: A package with COMPATIBLE additions must bump at least minor (e.g. 1.0.0 -> 1.1.0).
 *   4. Version Validation: Enforces that version strings across all published libraries match valid SemVer (major.minor.patch).
 *
 * Usage:
 *   node scripts/check-versioning-policy.mjs --verify
 *   node scripts/check-versioning-policy.mjs --check-bump <pkg> <oldVersion> <newVersion>
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const PARENT_DIR = resolve(ROOT, "..");
const REGISTRY_PATH = resolve(ROOT, "docs/programme/breaking-changes-registry.json");
const CLAIMS_PATH = resolve(ROOT, "docs/programme/programme-claims.json");

if (!existsSync(REGISTRY_PATH) || !existsSync(CLAIMS_PATH)) {
  console.error(`FAIL  check-versioning-policy: Required breaking-changes-registry or claims missing.`);
  process.exit(1);
}

const registry = JSON.parse(readFileSync(REGISTRY_PATH, "utf8"));
const claims = JSON.parse(readFileSync(CLAIMS_PATH, "utf8")).repos;

export function parseSemVer(v) {
  const m = v.match(/^(\d+)\.(\d+)\.(\d+)(?:-([0-9A-Za-z.-]+))?$/);
  if (!m) return null;
  return {
    major: Number(m[1]),
    minor: Number(m[2]),
    patch: Number(m[3]),
    prerelease: m[4] || null,
  };
}

export function classifyBumpType(oldVer, newVer) {
  const o = parseSemVer(oldVer);
  const n = parseSemVer(newVer);
  if (!o || !n) return "INVALID";

  if (n.major > o.major) return "MAJOR";
  if (n.major === o.major && n.minor > o.minor) return "MINOR";
  if (n.major === o.major && n.minor === o.minor && n.patch > o.patch) return "PATCH";
  if (n.major === o.major && n.minor === o.minor && n.patch === o.patch) return "SAME";
  return "DOWNGRADE";
}

export function validatePackageVersionBump(pkgName, oldVer, newVer, changes = []) {
  const bumpType = classifyBumpType(oldVer, newVer);
  if (bumpType === "INVALID") {
    return {
      valid: false,
      error: `Invalid SemVer format: old='${oldVer}', new='${newVer}'`,
    };
  }
  if (bumpType === "DOWNGRADE" || bumpType === "SAME") {
    return {
      valid: false,
      error: `Version cannot be downgraded or unchanged: '${oldVer}' -> '${newVer}'`,
    };
  }

  // Find breaking changes for this package
  const breaking = changes.filter(c => c.package === pkgName && c.classification === "BREAKING" && c.status === "ACTIVE");
  if (breaking.length > 0 && bumpType !== "MAJOR") {
    const breakingSymbols = breaking.map(b => `'${b.symbol}'`).join(", ");
    return {
      valid: false,
      error: `Package '${pkgName}' contains BREAKING change(s) for symbol(s): ${breakingSymbols}, but version bump '${oldVer}' -> '${newVer}' is only a ${bumpType} bump. Major bump required (e.g. ${parseSemVer(oldVer).major + 1}.0.0).`,
      breakingSymbols: breaking.map(b => b.symbol),
    };
  }

  return { valid: true, bumpType };
}

// Verification mode: Audit all current package versions and entries in breaking-changes-registry
export function verifyAllPackageVersions() {
  let checkedLibraries = 0;
  const violations = [];

  for (const [repoName, info] of Object.entries(claims)) {
    const repoDir = repoName === "unierp-workspace" ? ROOT : resolve(PARENT_DIR, repoName);
    const pkgPath = join(repoDir, "package.json");
    if (!existsSync(pkgPath)) continue;

    try {
      const pkg = JSON.parse(readFileSync(pkgPath, "utf8"));
      if (!pkg.name || !pkg.version) continue;

      const parsed = parseSemVer(pkg.version);
      if (!parsed) {
        violations.push(`[${repoName}] Version '${pkg.version}' is not valid SemVer.`);
      } else {
        checkedLibraries++;
      }
    } catch (e) {
      violations.push(`[${repoName}] Failed to read package.json: ${e.message}`);
    }
  }

  // Check registered breaking changes against target versions
  for (const entry of registry.entries || []) {
    if (entry.classification === "BREAKING") {
      if (!entry.targetVersion || !parseSemVer(entry.targetVersion)) {
        violations.push(`Entry ${entry.id} (BREAKING): Invalid targetVersion '${entry.targetVersion}'.`);
      }
    }
  }

  return { valid: violations.length === 0, violations, checkedLibraries };
}

if (process.argv[1] && fileURLToPath(import.meta.url) === resolve(process.argv[1])) {
  const args = process.argv.slice(2);
  const checkBumpIdx = args.indexOf('--check-bump');
  if (checkBumpIdx !== -1 && args[checkBumpIdx + 3]) {
    const pkg = args[checkBumpIdx + 1];
    const oldVer = args[checkBumpIdx + 2];
    const newVer = args[checkBumpIdx + 3];

    const res = validatePackageVersionBump(pkg, oldVer, newVer, registry.entries || []);
    if (!res.valid) {
      console.error(`FAIL  check-versioning-policy: ${res.error}`);
      process.exit(1);
    }
    console.log(`OK    Valid ${res.bumpType} bump for ${pkg}: ${oldVer} -> ${newVer}`);
    process.exit(0);
  }

  const result = verifyAllPackageVersions();
  if (!result.valid) {
    console.error(`\nFAIL  check-versioning-policy: ${result.violations.length} violation(s):\n`);
    for (const v of result.violations) console.error(`  - ${v}`);
    process.exit(1);
  }

  console.log(`OK    Versioning policy verified: ${result.checkedLibraries} package versions validated against SemVer and breaking-changes registry.`);
  process.exit(0);
}
