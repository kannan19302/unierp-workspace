#!/usr/bin/env node
/**
 * check-programme-claim.mjs — every repository has an owning programme, and a programme
 * writes only where it is entitled to.
 *
 * Programme 12 exists because a review found 21 of 29 repositories claimed by no programme at
 * all — including the identity provider and the contracts every client is generated from. Every
 * other programme consumed them and none evolved them, so `D001` (a 31,092-line schema against a
 * stated 3,000-line ceiling), `D008` and `D148` sat filed against code with no owner to fix them.
 * A defect against an unowned repository is a defect nobody will ever pick up.
 *
 * This gate is the mechanism that stops that recurring. It reads
 * `docs/programme/programme-claims.json` and enforces:
 *
 *   1. Every repository on disk has exactly one owning programme.
 *   2. Every claimed repository has a non-empty role.
 *   3. A programme writing to a repository it neither owns nor contributes to fails.
 *
 * Consumers are deliberately NOT stored in the manifest. They are derived here from the real
 * package.json graph, because a hand-maintained consumer list is a second source of truth that
 * drifts the first time someone adds a dependency — and this programme's whole invariant is that
 * a consumer cannot be broken silently.
 *
 *   node scripts/check-programme-claim.mjs                    validate the manifest
 *   node scripts/check-programme-claim.mjs --repo X --phase P12-001
 *                                                            may this phase write to X?
 *   node scripts/check-programme-claim.mjs --consumers        the live dependency graph
 */

import { readFileSync, readdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { programmeOf, isPhaseId } from "./lib/programme-ids.mjs";

const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = join(HERE, "..");
const FAMILY = join(ROOT, ".."); // the polyrepo parent holding every unierp-* repository
const MANIFEST = join(ROOT, "docs", "programme", "programme-claims.json");

const argv = process.argv.slice(2);
const opt = (n) => {
  const i = argv.indexOf(`--${n}`);
  return i === -1 ? null : argv[i + 1];
};

if (!existsSync(MANIFEST)) {
  console.error(
    `FAIL  ${MANIFEST} is missing.\n` +
      `      Every repository needs an owning programme; without this manifest none has one.`,
  );
  process.exit(1);
}
const manifest = JSON.parse(readFileSync(MANIFEST, "utf8"));
const claims = manifest.repos ?? {};

/** Repositories actually present in the family, from disk. */
function reposOnDisk() {
  if (!existsSync(FAMILY)) return [];
  return readdirSync(FAMILY, { withFileTypes: true })
    .filter((d) => d.isDirectory() && /^unierp-/.test(d.name))
    .map((d) => d.name)
    .sort();
}

/** The live consumer graph, derived from package.json rather than stored. */
function consumerGraph() {
  const pkgOwner = {}; // package name -> repo
  const deps = {};
  for (const repo of reposOnDisk()) {
    const pj = join(FAMILY, repo, "package.json");
    if (!existsSync(pj)) {
      deps[repo] = [];
      continue;
    }
    try {
      const p = JSON.parse(readFileSync(pj, "utf8"));
      if (p.name) pkgOwner[p.name] = repo;
      deps[repo] = Object.keys({
        ...p.dependencies,
        ...p.devDependencies,
        ...p.peerDependencies,
      });
    } catch {
      deps[repo] = [];
    }
  }
  const consumers = {};
  for (const repo of Object.keys(deps)) consumers[repo] = [];
  for (const [repo, list] of Object.entries(deps)) {
    for (const d of list) {
      const owner = pkgOwner[d];
      if (owner && owner !== repo) consumers[owner].push(repo);
    }
  }
  return consumers;
}

// ── --consumers ───────────────────────────────────────────────────────────────
if (argv.includes("--consumers")) {
  const consumers = consumerGraph();
  console.log("\nLive consumer graph (derived from package.json, never stored)\n");
  for (const repo of Object.keys(consumers).sort()) {
    const c = consumers[repo];
    console.log(
      `  ${repo.padEnd(32)} ${String(c.length).padStart(2)}  ${c.length ? c.join(", ") : "(no in-family consumer)"}`,
    );
  }
  console.log("");
  process.exit(0);
}

// ── --repo X --phase P12-001 ──────────────────────────────────────────────────
const repoArg = opt("repo");
const phaseArg = opt("phase");
if (repoArg) {
  if (!phaseArg || !isPhaseId(phaseArg)) {
    console.error(`FAIL  --repo needs --phase <ID>, e.g. --phase P12-001`);
    process.exit(1);
  }
  const programme = String(programmeOf(phaseArg));
  const claim = claims[repoArg];
  if (!claim) {
    console.error(
      `FAIL  ${repoArg} is claimed by no programme, so no phase may write to it.\n` +
        `      Add it to docs/programme/programme-claims.json with an owner and a role.`,
    );
    process.exit(1);
  }
  const owns = String(claim.owner) === programme;
  const contributes = Object.keys(claim.contributors ?? {}).includes(programme);
  if (!owns && !contributes) {
    const paths = Object.entries(claim.contributors ?? {})
      .map(([p, globs]) => `programme ${p} → ${globs.join(", ")}`)
      .join("; ");
    console.error(
      `FAIL  ${phaseArg} (programme ${programme}) may not write to ${repoArg}.\n` +
        `      ${repoArg} is owned by programme ${claim.owner}.` +
        (paths ? `\n      Declared contributors: ${paths}` : "\n      It has no declared contributors.") +
        `\n      Building another programme's deliverable duplicates planned work — file the\n` +
        `      need in 90-DEFECT-LOG.md or use that programme's precondition gate instead.`,
    );
    process.exit(1);
  }
  const scope = owns ? "owner" : `contributor, scoped to ${claim.contributors[programme].join(", ")}`;
  console.log(`OK    ${phaseArg} may write to ${repoArg} (${scope}).`);
  process.exit(0);
}

// ── default: validate the manifest ────────────────────────────────────────────
const failures = [];
const onDisk = reposOnDisk();

for (const [repo, claim] of Object.entries(claims)) {
  if (!claim.role || !String(claim.role).trim()) {
    failures.push(`${repo} is claimed but has no declared role. An owner without a stated responsibility is not an owner.`);
  }
  if (claim.owner === undefined || claim.owner === null) {
    failures.push(`${repo} has no owning programme.`);
  }
  if (!onDisk.includes(repo) && !claim.planned) {
    failures.push(
      `${repo} is claimed but is not on disk, and is not marked planned. Either it was renamed, or the claim is stale.`,
    );
  }
  if (claim.planned && onDisk.includes(repo)) {
    failures.push(
      `${repo} is marked planned by ${claim.planned} but already exists on disk. Remove the planned marker.`,
    );
  }
}

for (const repo of onDisk) {
  if (!claims[repo]) {
    failures.push(
      `${repo} exists on disk and is claimed by no programme. This is the exact condition ` +
        `Programme 12 was created to fix — an unowned repository accumulates defects nobody owns.`,
    );
  }
}

if (failures.length) {
  console.error(`\ncheck-programme-claim: ${failures.length} violation(s)\n`);
  for (const f of failures) console.error(`FAIL  ${f}`);
  console.error("");
  process.exit(1);
}

const owned = Object.values(claims).filter((c) => !c.planned).length;
const planned = Object.values(claims).filter((c) => c.planned).length;
console.log(
  `OK    ${onDisk.length} repositories on disk, all owned; ` +
    `${owned} claims active, ${planned} planned; every claim carries a role.`,
);
