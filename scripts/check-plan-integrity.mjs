#!/usr/bin/env node
/**
 * check-plan-integrity.mjs — mechanical protection for docs/programme/.
 *
 * The programme's rules (docs/programme/README.md § 0) forbid renumbering a phase,
 * regenerating a plan document, dropping an exit criterion, or adding an undeclared
 * file to the folder. Documented rules are ignored — ARCHITECTURE_REVIEW § F2 is the
 * whole lesson: ten gates existed and almost none could fail. So the rules are checked
 * here, and this script is wired into CI as a blocking step.
 *
 *   node scripts/check-plan-integrity.mjs          verify (exit 1 on violation)
 *   node scripts/check-plan-integrity.mjs --init   write the manifest from the tree
 *   node scripts/check-plan-integrity.mjs --update  re-baseline after a deliberate
 *                                                   amendment (raises floors only)
 *
 * `--update` deliberately cannot LOWER a floor or drop an ID. A shrinking plan needs a
 * human decision recorded in the affected track's amendment log, not a flag.
 */

import { readFileSync, writeFileSync, readdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const PROGRAMME = join(HERE, "..", "docs", "programme");
const MANIFEST = join(PROGRAMME, "plan-manifest.json");

const mode = process.argv.includes("--init")
  ? "init"
  : process.argv.includes("--update")
    ? "update"
    : "verify";

/** Files the folder is permitted to contain. Adding one requires amending README § 3
 *  AND this list in the same commit — that coupling is the point. */
const DECLARED = [
  "README.md",
  "00-BASELINE.md",
  "01-PRIORITY-AND-SEQUENCING.md",
  "02-EXECUTION-GUIDELINES.md",
  "03-GAP-ANALYSIS.md",
  "10-TRACK-A-FOUNDATION.md",
  "11-TRACK-B-DESIGN-SYSTEM.md",
  "12-TRACK-C-PLATFORM-CONSOLE.md",
  "13-TRACK-D-TENANT-ADMIN.md",
  "14-TRACK-E-BUSINESS-APPS.md",
  "15-TRACK-F-STUDIO-AND-SITES.md",
  "16-TRACK-G-DEVELOPER-PLATFORM.md",
  "17-TRACK-H-MARKETING.md",
  "18-TRACK-I-CLIENTS.md",
  "19-TRACK-J-QUALITY.md",
  "20-TRACK-K-OPERATIONS-GTM.md",
  "21-TRACK-L-CODE-QUALITY.md",
  "22-TRACK-M-PROVIDER-ADMIN-OS.md",
  "90-DEFECT-LOG.md",
  "WORKLOG.md",
  "worklog", // directory: one journal file per agent, written by start.mjs
  "plan-manifest.json",
];

/** Track letter → the file that owns its phase IDs. */
const TRACK_FILES = {
  A: "10-TRACK-A-FOUNDATION.md",
  B: "11-TRACK-B-DESIGN-SYSTEM.md",
  C: "12-TRACK-C-PLATFORM-CONSOLE.md",
  D: "13-TRACK-D-TENANT-ADMIN.md",
  E: "14-TRACK-E-BUSINESS-APPS.md",
  F: "15-TRACK-F-STUDIO-AND-SITES.md",
  G: "16-TRACK-G-DEVELOPER-PLATFORM.md",
  H: "17-TRACK-H-MARKETING.md",
  I: "18-TRACK-I-CLIENTS.md",
  J: "19-TRACK-J-QUALITY.md",
  K: "20-TRACK-K-OPERATIONS-GTM.md",
  L: "21-TRACK-L-CODE-QUALITY.md",
  M: "22-TRACK-M-PROVIDER-ADMIN-OS.md",
};

const failures = [];
const fail = (msg) => failures.push(msg);

/**
 * A phase row is a markdown table row whose first cell is a bold phase ID:
 *   | **A07** | Phase name | deps | deliverable | exit | Status |
 * The final two populated cells are the exit criterion and the status; a row that has
 * lost its exit criterion is malformed, which is precisely the edit § 0 rule 4 forbids.
 */
function parsePhases(text, letter) {
  const found = new Map();
  // Column layout differs per track (Track A carries Repos; Track E's domain stages carry
  // Modules and label the exit column "Non-negotiables at exit"), so the Depends index is
  // read from whichever header row most recently preceded the phase row.
  let dependsIdx = -1;
  const rowRe = new RegExp(
    String.raw`^\|\s*(?:\*\*(${letter}\d{2}[a-z]?)\*\*|(ID))\s*\|(.*)$`,
    "gm",
  );
  let m;
  while ((m = rowRe.exec(text)) !== null) {
    if (m[2]) {
      dependsIdx =
        m[3]
          .split("|")
          .map((c) => c.trim())
          .findIndex((h) => /^depends$/i.test(h)) + 1; // +1: header split excludes the ID cell
      continue;
    }
    const id = m[1];
    const cells = m[3]
      .split("|")
      .map((c) => c.trim())
      .filter((c, i, a) => !(i === a.length - 1 && c === ""));
    const depends = dependsIdx > 0 ? (cells[dependsIdx - 1] ?? "") : "";
    if (found.has(id)) fail(`Duplicate phase ID ${id} — IDs are unique and permanent.`);
    // Last cell is Status; second-to-last is the exit criterion.
    const exit = cells.length >= 2 ? cells[cells.length - 2] : "";
    if (!exit || exit === "—") {
      fail(
        `Phase ${id} has no exit criterion. Every phase must retain a command, ` +
          `measurement, or observable outcome whose failure is visible ` +
          `(02-EXECUTION-GUIDELINES § 1).`,
      );
    }
    const status = (cells[cells.length - 1] ?? "").trim();
    const VALID_STATUS = ["OPEN","READY","WIP","DONE","BLOCKED","WITHDRAWN"];
    if (status && !VALID_STATUS.includes(status)) {
      fail(`Phase ${id} has invalid status "${status}". Allowed: ${VALID_STATUS.join(", ")}`);
    }
    found.set(id, { exit, depends, status });
  }
  return found;
}

function collect() {
  const phases = new Map(); // id -> { file, exit, status }
  const lineCounts = {};
  for (const [letter, file] of Object.entries(TRACK_FILES)) {
    const path = join(PROGRAMME, file);
    if (!existsSync(path)) {
      fail(`Track file missing: ${file}. A track file is never deleted.`);
      continue;
    }
    const text = readFileSync(path, "utf8");
    lineCounts[file] = text.split("\n").length;
    for (const [id, meta] of parsePhases(text, letter)) {
      if (phases.has(id)) fail(`Phase ID ${id} appears in more than one track file.`);
      phases.set(id, { file, ...meta });
    }
  }
  return { phases, lineCounts };
}

// ── undeclared / missing files ────────────────────────────────────────────────
if (!existsSync(PROGRAMME)) {
  console.error(`FAIL  docs/programme/ does not exist.`);
  process.exit(1);
}
const onDisk = readdirSync(PROGRAMME).filter((f) => !f.startsWith("."));
for (const f of onDisk) {
  if (!DECLARED.includes(f)) {
    fail(
      `Undeclared file in docs/programme/: ${f}. ` +
        `README § 0 rule 1 — add it to README § 3 and to DECLARED in this script, ` +
        `or delete it.`,
    );
  }
}
for (const f of DECLARED) {
  if (f !== "plan-manifest.json" && !onDisk.includes(f)) {
    fail(`Declared file missing from docs/programme/: ${f}.`);
  }
}

const { phases, lineCounts } = collect();
const ids = [...phases.keys()].sort();

// ── dependency graph: every dep must be a real phase, and there must be no cycle ──
// A dependency naming a track ("E-track") rather than a phase reads as a dependency and
// blocks nothing, so `--ready` reports the phase as startable — which is how J26 came to
// depend on the string "all J". A cycle is worse: two phases each wait for the other and
// neither is ever ready. Both are caught here rather than discovered.
{
  const depsOf = new Map();
  for (const [id, meta] of phases) {
    const raw = (meta.depends ?? "").replace(/\*\*/g, "");
    if (!raw || raw === "—") {
      depsOf.set(id, []);
      continue;
    }
    const out = new Set();
    let residue = raw;
    const rangeRe = /([A-M])(\d{2})\s*[–-]\s*(?:[A-M])?(\d{2})/g;
    let m;
    while ((m = rangeRe.exec(raw)) !== null) {
      for (let n = Number(m[2]); n <= Number(m[3]); n++) {
        out.add(`${m[1]}${String(n).padStart(2, "0")}`);
      }
      residue = residue.replace(m[0], " ");
    }
    for (const d of residue.match(/\b[A-M]\d{2}[a-z]?\b/g) ?? []) out.add(d);
    // Anything left that is not punctuation is prose masquerading as a dependency.
    const leftover = residue
      .replace(/\b[A-M]\d{2}[a-z]?\b/g, "")
      .replace(/[\s,;.()–-]|\(hard\)/gi, "");
    if (leftover) {
      fail(
        `Phase ${id} has a non-phase dependency: "${raw}". A Depends cell holds phase ` +
          `IDs or ranges only — prose blocks nothing, so --ready reports the phase as ` +
          `startable when it is not.`,
      );
    }
    for (const d of out) {
      if (!phases.has(d)) {
        fail(`Phase ${id} depends on ${d}, which is not a phase in any track file.`);
      }
    }
    depsOf.set(id, [...out].filter((d) => phases.has(d)));
  }

  const state = new Map(); // undefined | 1 visiting | 2 done
  const walk = (id, trail) => {
    if (state.get(id) === 2) return;
    if (state.get(id) === 1) {
      const cycle = [...trail.slice(trail.indexOf(id)), id].join(" → ");
      fail(`Dependency cycle: ${cycle}. Neither phase can ever become READY.`);
      return;
    }
    state.set(id, 1);
    for (const d of depsOf.get(id) ?? []) walk(d, [...trail, id]);
    state.set(id, 2);
  };
  for (const id of ids) walk(id, []);
}

// ── init / update ─────────────────────────────────────────────────────────────
if (mode === "init" || mode === "update") {
  let prev = null;
  if (existsSync(MANIFEST)) prev = JSON.parse(readFileSync(MANIFEST, "utf8"));

  if (mode === "update" && prev) {
    for (const id of prev.phaseIds) {
      if (!phases.has(id)) {
        fail(
          `--update cannot drop phase ${id}. A withdrawn phase keeps its row with ` +
            `status WITHDRAWN (README § 0 rule 3).`,
        );
      }
    }
  }
  if (failures.length) {
    for (const f of failures) console.error(`FAIL  ${f}`);
    process.exit(1);
  }

  const floors = {};
  for (const [file, count] of Object.entries(lineCounts)) {
    const previous = prev?.lineFloors?.[file] ?? 0;
    floors[file] = Math.max(previous, count);
  }

  const manifest = {
    $comment:
      "Machine-readable index of the UniERP development programme. Written by " +
      "scripts/check-plan-integrity.mjs. Phase IDs are permanent: never renumber, " +
      "reuse, or delete one. See docs/programme/README.md § 0 and § 5.",
    generated: new Date().toISOString().slice(0, 10),
    phaseFloor: Math.max(prev?.phaseFloor ?? 0, ids.length),
    phaseCount: ids.length,
    trackCounts: Object.fromEntries(
      Object.keys(TRACK_FILES).map((l) => [
        l,
        ids.filter((i) => i.startsWith(l)).length,
      ]),
    ),
    lineFloors: floors,
    phaseIds: ids,
  };
  writeFileSync(MANIFEST, JSON.stringify(manifest, null, 2) + "\n");
  console.log(
    `OK    manifest ${mode === "init" ? "written" : "updated"}: ` +
      `${ids.length} phases across ${Object.keys(TRACK_FILES).length} tracks.`,
  );
  process.exit(0);
}

// ── verify ────────────────────────────────────────────────────────────────────
if (!existsSync(MANIFEST)) {
  console.error(
    `FAIL  ${MANIFEST} is missing. Run with --init to establish the baseline.`,
  );
  process.exit(1);
}
const manifest = JSON.parse(readFileSync(MANIFEST, "utf8"));

for (const id of manifest.phaseIds) {
  if (!phases.has(id)) {
    fail(
      `Phase ${id} is in the manifest but no longer appears in ` +
        `${TRACK_FILES[id[0]] ?? "any track file"}. A phase ID is permanent — a phase ` +
        `that is wrong is marked WITHDRAWN, not deleted (README § 0 rule 3).`,
    );
  }
}
if (ids.length < manifest.phaseFloor) {
  fail(
    `Phase count regressed: ${ids.length} < floor ${manifest.phaseFloor}. ` +
      `The plan may grow; it may not shrink.`,
  );
}
for (const [file, floor] of Object.entries(manifest.lineFloors ?? {})) {
  const actual = lineCounts[file];
  if (actual === undefined) continue;
  // 5% tolerance absorbs legitimate surgical tightening; a regeneration or a
  // truncation-to-summary falls far outside it.
  const allowed = Math.floor(floor * 0.95);
  if (actual < allowed) {
    fail(
      `${file} shrank to ${actual} lines (floor ${floor}, tolerance ${allowed}). ` +
        `README § 0 rule 2 — these documents are amended by surgical edit, never ` +
        `regenerated, truncated, or replaced by a summary. If the reduction is ` +
        `deliberate, record it in that file's amendment log and re-baseline with ` +
        `--update.`,
    );
  }
}

if (failures.length) {
  console.error(`\ncheck-plan-integrity: ${failures.length} violation(s)\n`);
  for (const f of failures) console.error(`FAIL  ${f}`);
  console.error("");
  process.exit(1);
}

console.log(
  `OK    ${ids.length} phases intact across ${Object.keys(TRACK_FILES).length} ` +
    `tracks; every phase retains an exit criterion; no undeclared files.`,
);
