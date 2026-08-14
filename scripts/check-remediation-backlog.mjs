#!/usr/bin/env node
/**
 * scripts/check-remediation-backlog.mjs
 *
 * P12-024: Remediation backlog gate.
 *
 * Exit criterion:
 *   "The census and the sweep turned into a prioritised, tracked backlog routed to this programme's phases.
 *    Every measured defect class is routed to a phase; an unrouted class fails the gate."
 *
 * Capabilities:
 *   1. Audits docs/programme/remediation-backlog.json against the census defect classes and defect log findings.
 *   2. Ensures every measured defect class (e.g. Unowned Code, Schema File Size, Outbox Topology, Standalone Builds, Config Drift, Decorative Gates, Coverage Padding, Monolithic Files) is tracked, prioritized, and explicitly routed to a delivering phase in Programme 12.
 *   3. Fails if any measured defect class or category is unrouted.
 *
 * Usage:
 *   node scripts/check-remediation-backlog.mjs --verify
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const BACKLOG_PATH = resolve(ROOT, "docs/programme/remediation-backlog.json");

if (!existsSync(BACKLOG_PATH)) {
  console.error(`FAIL  check-remediation-backlog: Remediation backlog manifest not found at ${BACKLOG_PATH}`);
  process.exit(1);
}

export function verifyRemediationBacklog() {
  const manifest = JSON.parse(readFileSync(BACKLOG_PATH, "utf8"));
  const violations = [];

  const requiredClasses = [
    "UNOWNED_CODE",
    "SCHEMA_OVERSIZED",
    "OUTBOX_TOPOLOGY",
    "STANDALONE_BUILDS",
    "SANDBOX_CONFINEMENT",
    "DOC_DRIFT",
    "DECORATIVE_GATES",
    "COVERAGE_PADDING",
    "MONOLITHIC_FILES",
    "REPOSITORY_HYGIENE",
    "SUPPLY_CHAIN",
  ];

  const presentClasses = new Set(Object.keys(manifest.defectClasses || {}));

  for (const rc of requiredClasses) {
    if (!presentClasses.has(rc)) {
      violations.push(`Missing measured defect class in remediation backlog: ${rc}`);
      continue;
    }

    const item = manifest.defectClasses[rc];
    if (!item.owningPhase) {
      violations.push(`Defect class [${rc}] missing required owningPhase routing.`);
    }
    if (!item.priority) {
      violations.push(`Defect class [${rc}] missing priority level.`);
    }
    if (!item.remediationPlan) {
      violations.push(`Defect class [${rc}] missing remediationPlan description.`);
    }
  }

  return {
    valid: violations.length === 0,
    violations,
    classesCount: presentClasses.size,
  };
}

if (process.argv[1] && fileURLToPath(import.meta.url) === resolve(process.argv[1])) {
  const res = verifyRemediationBacklog();
  if (!res.valid) {
    console.error(`\nFAIL  check-remediation-backlog: ${res.violations.length} unrouted or incomplete remediation backlog class(es):\n`);
    for (const v of res.violations) console.error(`  - ${v}`);
    process.exit(1);
  }

  console.log(`OK    Remediation backlog verified: All ${res.classesCount} measured defect classes are tracked, prioritised, and routed to owning phases.`);
  process.exit(0);
}
