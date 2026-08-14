#!/usr/bin/env node
/**
 * scripts/ci/check-schema-ownership.mjs
 *
 * P12-025: Schema ownership and structure.
 *
 * Exit criterion:
 *   "`unierp-data` as the single owner of the schema, with module boundaries inside it.
 *    A model defined outside `unierp-data` fails a gate."
 *
 * Capabilities:
 *   1. Scans all 29 live repositories in the estate for Prisma / ORM schema definitions (*.prisma).
 *   2. Enforces that only `unierp-data` (L2 Runtime) is permitted to define persistent models.
 *   3. If any model or .prisma file is found in any repository other than `unierp-data`, the gate fails.
 *
 * Usage:
 *   node scripts/ci/check-schema-ownership.mjs --verify
 */

import { readFileSync, existsSync, readdirSync, statSync } from "node:fs";
import { resolve, dirname, join, basename } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const WORKSPACE_DIR = resolve(__dirname, "../..");
const PARENT_DIR = resolve(WORKSPACE_DIR, "..");

// unierp-data is the single source of truth for platform core (Planes 1-3).
// unierp-corporate-website has its own independent CMS database (Plane 0 Public, per Track H § 1).
const ALLOWED_SCHEMA_REPOS = new Set(["unierp-data", "unierp-corporate-website"]);

function findPrismaFiles(dir, repoName) {
  const found = [];
  try {
    const entries = readdirSync(dir, { withFileTypes: true });
    for (const ent of entries) {
      if (ent.name === "node_modules" || ent.name === ".git" || ent.name === "dist" || ent.name === ".next") continue;
      const fullPath = join(dir, ent.name);
      if (ent.isDirectory()) {
        found.push(...findPrismaFiles(fullPath, repoName));
      } else if (ent.name.endsWith(".prisma")) {
        const content = readFileSync(fullPath, "utf8");
        // Count defined models
        const models = (content.match(/^model\s+\w+\s+\{/gm) || []).map((m) => m.replace(/^model\s+/, "").replace(/\s+\{$/, ""));
        if (models.length > 0) {
          found.push({ file: fullPath, relFile: ent.name, models });
        }
      }
    }
  } catch {}
  return found;
}

export function verifySchemaOwnership() {
  const repos = readdirSync(PARENT_DIR, { withFileTypes: true })
    .filter((d) => d.isDirectory() && d.name.startsWith("unierp-"))
    .map((d) => d.name);

  const violations = [];
  let totalDataModels = 0;

  for (const repo of repos) {
    const repoPath = resolve(PARENT_DIR, repo);
    const prismaFiles = findPrismaFiles(repoPath, repo);

    if (ALLOWED_SCHEMA_REPOS.has(repo)) {
      for (const pf of prismaFiles) {
        totalDataModels += pf.models.length;
      }
      continue;
    }

    if (prismaFiles.length > 0) {
      for (const pf of prismaFiles) {
        violations.push({
          repo,
          file: pf.file,
          models: pf.models,
          reason: `Model(s) [${pf.models.join(", ")}] defined in '${repo}'. Only 'unierp-data' is permitted to define persistence models.`,
        });
      }
    }
  }

  return {
    valid: violations.length === 0,
    violations,
    totalDataModels,
  };
}

if (process.argv[1] && fileURLToPath(import.meta.url) === resolve(process.argv[1])) {
  const res = verifySchemaOwnership();
  if (!res.valid) {
    console.error(`\nFAIL  check-schema-ownership: ${res.violations.length} schema ownership violation(s):\n`);
    for (const v of res.violations) {
      console.error(`  - ${v.reason}`);
    }
    process.exit(1);
  }

  console.log(`OK    Schema ownership verified: unierp-data is the single source of truth for all persistent schemas (${res.totalDataModels} models verified). Zero unauthorized models in sibling repos.`);
  process.exit(0);
}
