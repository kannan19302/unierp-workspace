#!/usr/bin/env node
/**
 * sync-agent-entrypoints.mjs — give every repository in the family one honest
 * orientation file for coding agents, pointing at unierp-workspace.
 *
 * Why this exists. Five repositories carry AGENTS.md + CLAUDE.md + GEMINI.md — fifteen
 * files — and every one of them tells the agent that the master documents live in
 * `ERPSys/docs/ai/`. ERPSys is the retired monorepo. So the first thing any vendor agent
 * reads in those repos is an instruction to go somewhere that does not exist, and the
 * other twenty-five repositories give it no orientation at all.
 *
 * That is why "use other vendor agents effectively" does not currently work, and it is
 * the same defect class as D005: a pointer that outlived its target.
 *
 * The stub is deliberately short. Per-repo copies of guidance drift — the corporate-website
 * copy had already drifted from its own source. One canonical file lives in
 * unierp-workspace/AGENTS.md; every other repo gets a pointer to it and nothing more.
 *
 *   node scripts/sync-agent-entrypoints.mjs              report what would change
 *   node scripts/sync-agent-entrypoints.mjs --write      apply
 *   node scripts/sync-agent-entrypoints.mjs --write --repo unierp-api
 *
 * Run from the unierp-workspace root; siblings are resolved one level up.
 */

import { readdirSync, readFileSync, writeFileSync, existsSync, statSync } from "node:fs";
import { join, dirname, basename } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const WORKSPACE = join(HERE, "..");
const FAMILY = join(WORKSPACE, "..");
const WRITE = process.argv.includes("--write");
const only = (() => {
  const i = process.argv.indexOf("--repo");
  return i === -1 ? null : process.argv[i + 1];
})();

/** Archived on GitHub — cannot be pushed to, so writing an entrypoint into one is a file
 *  nobody can commit. Superseded by unierp-extensions/<vertical>; see D023, because that
 *  supersession moved the name and not the code. */
const ARCHIVED = new Set([
  "unierp-app-education",
  "unierp-app-fieldservice",
  "unierp-app-healthcare",
  "unierp-app-realestate",
]);

const SELF = basename(WORKSPACE);
const CANON = "https://github.com/kannan19302/unierp-workspace/blob/main/AGENTS.md";

/** Layer per PLATFORM_ARCHITECTURE § 4.2, so the stub can state the one rule concretely. */
const LAYER = {
  "unierp-contracts": "L0 — Contract · depends on nothing at all",
  "unierp-kernel": "L1 — Foundation",
  "unierp-design-system": "L1 — Foundation",
  "unierp-sdk": "L1 — Foundation",
  "unierp-shared": "L1 — Foundation",
  "unierp-auth": "L1 — Foundation",
  "unierp-config": "L1 — Foundation",
  "unierp-service-kit": "L1 — Foundation",
  "unierp-data": "L2 — Runtime",
  "unierp-framework": "L2 — Runtime",
  "unierp-extension-api": "L2 — Runtime",
  "unierp-sandbox": "L2 — Runtime",
  "unierp-api": "L3 — Service",
  "unierp-idp": "L3 — Service",
  "unierp-web": "L4 — Presentation",
  "unierp-console": "L4 — Presentation",
  "unierp-developer": "L4 — Presentation",
  "unierp-corporate-website": "L4 — Presentation",
  "unierp-mobile": "L5 — Clients",
  "unierp-extensions": "L6 — Extensions · public extension API only",
  "unierp-infra": "L7 — Operations",
  "unierp-workspace": "L7 — Operations",
};

/** Repos whose primary track is worth naming, so an agent lands in the right plan file. */
const TRACK = {
  "unierp-console": ["C", "12-TRACK-C-PLATFORM-CONSOLE.md"],
  "unierp-developer": ["G", "16-TRACK-G-DEVELOPER-PLATFORM.md"],
  "unierp-corporate-website": ["H", "17-TRACK-H-MARKETING.md"],
  "unierp-design-system": ["B", "11-TRACK-B-DESIGN-SYSTEM.md"],
  "unierp-mobile": ["I", "18-TRACK-I-CLIENTS.md"],
  "unierp-sandbox": ["A", "10-TRACK-A-FOUNDATION.md"],
  "unierp-storybook": ["B", "11-TRACK-B-DESIGN-SYSTEM.md"],
  "unierp-corporate-site-template": ["F", "15-TRACK-F-STUDIO-AND-SITES.md"],
};

const stub = (repo) => {
  const layer = LAYER[repo];
  const track = TRACK[repo];
  return `# AGENTS.md — ${repo}

> **You are working on a production enterprise platform intended to run real businesses for a
> decade. Not a prototype.**

## Read this first, in \`unierp-workspace\`

This repository carries **no** PRD, TRD, architecture doc, plan, or changelog of its own. There is
one governing set for the whole platform and it lives in the **\`unierp-workspace\`** repository:

- **[\`AGENTS.md\`](${CANON})** — the operating contract for every coding agent, whichever vendor
- \`docs/ai/\` — the ten governance documents (product, technical, flow, design, schema, standards)
- \`docs/programme/\` — the 310-phase development plan
${
  track
    ? `\nThis repository's work is mostly **Track ${track[0]}**: \`docs/programme/${track[1]}\`.\n`
    : ""
}
## Do not read the plan. Run start.

From a \`unierp-workspace\` checkout:

\`\`\`bash
node scripts/start.mjs        # picks the next phase, CLAIMS it, prints the work order
node scripts/start.mjs --who  # what other agents are holding right now
\`\`\`

The plan is 310 phases across 20 documents. An agent that reads it partially produces work that
contradicts a phase it never opened, which is worse than not reading it. \`start.mjs\` extracts
exactly one phase — and claims it with a pushed commit, so two agents never take the same work.

Before you stop, always one of:

\`\`\`bash
node scripts/start.mjs --progress "what is done, what is next"
node scripts/start.mjs --finish --evidence-file ev.txt
node scripts/start.mjs --release "why blocked"
\`\`\`

## First time here? Two commands

\`\`\`bash
git clone https://github.com/kannan19302/unierp-workspace.git
cd unierp-workspace && node scripts/start.mjs
\`\`\`

## Running alongside other agents

ADP's lock is a **pushed commit**, so it only works between agents that share one branch.
Two agents on two different feature branches cannot see each other's claims and will take
the same phase. That is a known limitation with a phase of its own (A27); until it lands:

- **One agent per working tree.** \`node scripts/worktree.mjs new <slug>\` gives you your own.
  Two agents in one tree overwrite each other's files no matter what ADP does.
- **All agents on the same branch**, so claims are mutually visible.
- \`node scripts/start.mjs --who\` before you begin. If someone holds the phase you wanted,
  pick another — do not work it anyway.

## The rule that matters more than any other

> **No claim without a mechanism that can fail.**

Do not report that something works. Show the command, its output, and its output when you break it
on purpose. This platform has three documented cases of a claim outliving its mechanism — 3,241
files silencing the type checker, a coverage gate with no threshold, and a CI step guarded by
\`if: hashFiles(...)\` on a script that exists in no repository.

**Making a gate pass by weakening the gate is the worst thing you can do here.** If a gate blocks
you and you believe it is wrong, say so and log it — do not defang it.

## Rejected on sight

1. A table without \`tenantId\` **and** an RLS policy in a migration.
2. An endpoint without \`@Permissions(...)\` in the same commit. Unauthorised → **403**.
3. \`Float\` anywhere near money. \`Decimal(19,4)\`, and keep the arithmetic in Decimal.
4. A hardcoded hex or \`px\` value. Design tokens only — 7 themes, orthogonal density.
5. A new document for notes or progress. Findings → \`docs/programme/90-DEFECT-LOG.md\`.
   Narrative → \`docs/ai/CHANGELOG.md\`. Nothing else.

## Build order, always

\`\`\`
MODEL → DATABASE → API → AUTH → UI → TEST → SHIP
\`\`\`

A layer does not start until the one above it passes its tests. A page written before its migration
exists is a mock, not a feature.
${
  layer
    ? `\n## This repository's layer\n\n**${layer}**\n\n> A repository may depend only on published artifacts of a strictly lower layer. Never
> sideways. Never upward.\n`
    : ""
}
## Every change

Append **one line** to \`docs/ai/CHANGELOG.md\` in \`unierp-workspace\`. It is the only channel
between you and the next agent, who will have no memory of this session.

## Licence

AGPL-3.0. Every dependency you add must be open source.
`;
};

const pointer = (repo, name) => `# ${name}

See **[\`AGENTS.md\`](AGENTS.md)** in this repository, and the canonical
[\`AGENTS.md\`](${CANON}) in \`unierp-workspace\`. One operating contract, kept in one place so the
instructions cannot drift between vendors.

\`\`\`bash
# from a unierp-workspace checkout
node scripts/start.mjs        # picks the next phase, claims it, prints the work order
node scripts/start.mjs --who  # what other agents are holding right now
\`\`\`

**No claim without a mechanism that can fail.**
`;

const repos = readdirSync(FAMILY)
  .filter((d) => d.startsWith("unierp-") && d !== SELF)
  .filter((d) => {
    try {
      return statSync(join(FAMILY, d)).isDirectory();
    } catch {
      return false;
    }
  })
  .filter((d) => (only ? d === only : true))
  .filter((d) => !ARCHIVED.has(d));

if (!repos.length) {
  console.error(`sync-agent-entrypoints: no sibling repos found under ${FAMILY}`);
  process.exit(1);
}

const actions = [];
for (const repo of repos) {
  const dir = join(FAMILY, repo);
  const files = [
    ["AGENTS.md", stub(repo)],
    ["CLAUDE.md", pointer(repo, "CLAUDE.md")],
    ["GEMINI.md", pointer(repo, "GEMINI.md")],
  ];
  for (const [name, content] of files) {
    const path = join(dir, name);
    const exists = existsSync(path);
    const current = exists ? readFileSync(path, "utf8") : null;
    if (current === content) continue;
    const stale = current?.includes("ERPSys") ?? false;
    actions.push({
      repo,
      name,
      path,
      content,
      verb: !exists ? "create" : stale ? "replace (stale ERPSys pointer)" : "replace",
    });
  }
}

if (!actions.length) {
  console.log("OK    every repository already carries the current entrypoint files.");
  process.exit(0);
}

const stale = actions.filter((a) => a.verb.includes("stale"));
console.log(
  `\n${WRITE ? "Writing" : "Would write"} ${actions.length} file(s) across ` +
    `${new Set(actions.map((a) => a.repo)).size} repositories.\n`,
);
if (stale.length) {
  console.log(
    `  ${stale.length} of them currently point at the retired ERPSys monorepo — ` +
      `the reason vendor agents cannot orient in this family today.\n`,
  );
}
let last = null;
for (const a of actions) {
  if (a.repo !== last) {
    console.log(`  ${a.repo}`);
    last = a.repo;
  }
  console.log(`      ${a.verb.padEnd(34)} ${a.name}`);
  if (WRITE) writeFileSync(a.path, a.content);
}
console.log(
  WRITE
    ? `\nDone. Each repository is a separate git repo — review and commit them individually.\n`
    : `\nDry run. Re-run with --write to apply. Each repository is a separate git repo,\n` +
        `so review and commit them individually.\n`,
);
