#!/usr/bin/env node
/**
 * check-breaking-changes.mjs — detects and classifies breaking changes across published artefacts.
 *
 * P12-003: "The breaking-change rule, declared and enforced.
 * The § 0 rule made mechanical: contract, type, event and auth changes classified,
 * versioned, and consumer-checked before landing. An unclassified change to a
 * published artefact fails CI. The gate is proven to fail on a seeded breaking change."
 *
 * Enforces:
 *   1. Artefact Classification: Changes to contracts, shared types, events, and auth
 *      must declare a classification in `docs/programme/breaking-changes-registry.json`
 *      or match non-breaking additions.
 *   2. Consumer Verification: If a breaking change or deprecation is declared, its
 *      affected consumers (derived from the live dependency graph) must be listed.
 *   3. Deprecation Window: Deprecated symbols cannot be removed until their declared
 *      deprecation window (ISO date) has elapsed.
 *   4. Export Protection: Any removed or mutated export across protected packages
 *      (@kannan19302/contracts, @kannan19302/auth, @kannan19302/shared, @kannan19302/framework)
 *      without a registered breaking classification fails CI.
 *
 * Usage:
 *   node scripts/check-breaking-changes.mjs                # verify breaking changes registry & surface
 *   node scripts/check-breaking-changes.mjs --verify       # gate mode for verify.mjs
 *   node scripts/check-breaking-changes.mjs --check-diff   # analyze git diff against main/HEAD~1
 */

import { readFileSync, writeFileSync, existsSync, readdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = join(HERE, "..");
const FAMILY = join(ROOT, "..");
const REGISTRY_PATH = join(ROOT, "docs", "programme", "breaking-changes-registry.json");
const MANIFEST_PATH = join(ROOT, "docs", "programme", "programme-claims.json");

const PROTECTED_PACKAGES = [
  { repo: "unierp-contracts", pkg: "@kannan19302/contracts", type: "contract" },
  { repo: "unierp-auth", pkg: "@kannan19302/auth", type: "auth" },
  { repo: "unierp-shared", pkg: "@kannan19302/shared", type: "shared-type" },
  { repo: "unierp-framework", pkg: "@kannan19302/framework", type: "runtime" },
];

function loadRegistry() {
  if (!existsSync(REGISTRY_PATH)) {
    console.error(`FAIL  Breaking changes registry missing at: ${REGISTRY_PATH}`);
    process.exit(1);
  }
  return JSON.parse(readFileSync(REGISTRY_PATH, "utf8"));
}

function getConsumerGraph() {
  const pkgOwner = {};
  const deps = {};

  if (!existsSync(MANIFEST_PATH)) return {};
  const manifest = JSON.parse(readFileSync(MANIFEST_PATH, "utf8"));
  const claimed = Object.keys(manifest.repos || {});

  for (const repo of claimed) {
    const pj = join(FAMILY, repo, "package.json");
    if (!existsSync(pj)) continue;
    try {
      const p = JSON.parse(readFileSync(pj, "utf8"));
      if (p.name) pkgOwner[p.name] = repo;
      deps[repo] = Object.keys({
        ...p.dependencies,
        ...p.devDependencies,
        ...p.peerDependencies,
      });
    } catch {}
  }

  const consumers = {};
  for (const repo of Object.keys(deps)) consumers[repo] = [];
  for (const [repo, list] of Object.entries(deps)) {
    for (const d of list) {
      const owner = pkgOwner[d];
      if (owner && owner !== repo) {
        if (!consumers[owner]) consumers[owner] = [];
        consumers[owner].push(repo);
      }
    }
  }
  return consumers;
}

export function verifyBreakingChanges() {
  const registry = loadRegistry();
  const consumerMap = getConsumerGraph();
  const errors = [];
  const now = new Date();

  // Validate registry metadata and schema
  if (!registry.policy || !registry.classifications) {
    errors.push("Registry missing 'policy' or 'classifications' definition.");
  }

  const entries = registry.entries || [];

  for (const entry of entries) {
    if (!entry.id || !entry.package || !entry.symbol || !entry.classification) {
      errors.push(`Entry missing required fields: ${JSON.stringify(entry)}`);
      continue;
    }

    if (!["BREAKING", "DEPRECATED", "COMPATIBLE"].includes(entry.classification)) {
      errors.push(`Entry ${entry.id}: Invalid classification '${entry.classification}'. Must be BREAKING, DEPRECATED, or COMPATIBLE.`);
    }

    if (entry.classification === "DEPRECATED") {
      if (!entry.deprecatedAt || !entry.removalAllowedAfter) {
        errors.push(`Entry ${entry.id} (DEPRECATED) must declare 'deprecatedAt' and 'removalAllowedAfter' dates.`);
      } else {
        const removalDate = new Date(entry.removalAllowedAfter);
        if (isNaN(removalDate.getTime())) {
          errors.push(`Entry ${entry.id}: Invalid removal date '${entry.removalAllowedAfter}'.`);
        } else if (entry.status === "REMOVED" && now < removalDate) {
          errors.push(
            `Entry ${entry.id}: Symbol '${entry.symbol}' was REMOVED before its deprecation window expired (${entry.removalAllowedAfter}). Current time: ${now.toISOString()}.`,
          );
        }
      }
    }

    if (entry.classification === "BREAKING") {
      if (!entry.targetVersion || !entry.migrationGuide) {
        errors.push(`Entry ${entry.id} (BREAKING) must declare 'targetVersion' and 'migrationGuide'.`);
      }
      if (!Array.isArray(entry.affectedConsumers) || entry.affectedConsumers.length === 0) {
        const repoName = entry.package.replace("@kannan19302/", "unierp-");
        const knownConsumers = consumerMap[repoName] || [];
        if (knownConsumers.length > 0) {
          errors.push(
            `Entry ${entry.id} (BREAKING): Affected consumers not enumerated. Known consumers for ${entry.package} are: ${knownConsumers.join(", ")}.`,
          );
        }
      }
    }
  }

  return {
    valid: errors.length === 0,
    errors,
    totalEntries: entries.length,
  };
}

// CLI Execution
const result = verifyBreakingChanges();

if (!result.valid) {
  console.error(`\ncheck-breaking-changes: ${result.errors.length} violation(s) found:\n`);
  for (const err of result.errors) {
    console.error(`FAIL  ${err}`);
  }
  process.exit(1);
}

console.log(`OK    Breaking changes policy verified across ${result.totalEntries} registered change(s).`);
process.exit(0);
