#!/usr/bin/env node
/**
 * scripts/check-orphaned-defects.mjs
 *
 * P12-004: Orphaned-defect sweep gate.
 *
 * Scans `docs/programme/90-DEFECT-LOG.md` for any defect landing in a Programme 12-owned
 * repository (as declared in `docs/programme/programme-claims.json`). Verifies that
 * every such defect is explicitly mapped to a resolving phase or has a recorded,
 * documented reason it needs none in `docs/programme/orphaned-defect-routing.json`.
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const DEFECT_LOG_PATH = resolve(ROOT, "docs/programme/90-DEFECT-LOG.md");
const CLAIMS_PATH = resolve(ROOT, "docs/programme/programme-claims.json");
const ROUTING_PATH = resolve(ROOT, "docs/programme/orphaned-defect-routing.json");

if (!existsSync(DEFECT_LOG_PATH)) {
  console.error(`FAIL  Defect log not found: ${DEFECT_LOG_PATH}`);
  process.exit(1);
}

if (!existsSync(CLAIMS_PATH)) {
  console.error(`FAIL  Programme claims not found: ${CLAIMS_PATH}`);
  process.exit(1);
}

if (!existsSync(ROUTING_PATH)) {
  console.error(`FAIL  Orphaned defect routing registry not found: ${ROUTING_PATH}`);
  process.exit(1);
}

const claims = JSON.parse(readFileSync(CLAIMS_PATH, "utf8"));
const p12OwnedRepos = Object.entries(claims.repos)
  .filter(([_, info]) => info.owner === 12)
  .map(([name]) => name);

const routingRegistry = JSON.parse(readFileSync(ROUTING_PATH, "utf8"));
const defectLogContent = readFileSync(DEFECT_LOG_PATH, "utf8");

// Parse defects from 90-DEFECT-LOG.md
const lines = defectLogContent.split("\n");
const defects = [];
let currentDefect = null;

for (let i = 0; i < lines.length; i++) {
  const line = lines[i];
  if (line.startsWith("### D")) {
    if (currentDefect) defects.push(currentDefect);
    const idMatch = line.match(/^###\s+(D\d+)/);
    currentDefect = {
      id: idMatch ? idMatch[1] : null,
      header: line,
      lines: [line],
    };
  } else if (currentDefect) {
    currentDefect.lines.push(line);
  }
}
if (currentDefect) defects.push(currentDefect);

const violations = [];
let auditedCount = 0;

for (const defect of defects) {
  if (!defect.id) continue;
  const fullText = defect.lines.join("\n");
  const affectedP12Repos = p12OwnedRepos.filter((repo) => fullText.includes(repo));

  if (affectedP12Repos.length === 0) {
    continue;
  }

  auditedCount++;
  const routing = routingRegistry.routings?.[defect.id];

  if (!routing) {
    violations.push({
      defectId: defect.id,
      header: defect.header,
      repos: affectedP12Repos,
      reason: `Defect ${defect.id} impacts P12 repo(s) [${affectedP12Repos.join(", ")}] but has no entry in orphaned-defect-routing.json`,
    });
    continue;
  }

  if (!routing.owningPhase && !routing.noPhaseReason) {
    violations.push({
      defectId: defect.id,
      header: defect.header,
      repos: affectedP12Repos,
      reason: `Defect ${defect.id} entry in routing registry missing both owningPhase and noPhaseReason`,
    });
  }
}

if (violations.length > 0) {
  console.error(`\ncheck-orphaned-defects: ${violations.length} unrouted defect violation(s) found:\n`);
  for (const v of violations) {
    console.error(`FAIL  ${v.defectId}: ${v.reason}`);
  }
  process.exit(1);
}

console.log(`OK    All ${auditedCount} defect(s) impacting Programme 12 repositories are cleanly routed with owning phases or recorded justifications.`);
process.exit(0);
