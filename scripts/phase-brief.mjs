#!/usr/bin/env node
/**
 * phase-brief.mjs — emit a self-contained work order for one programme phase.
 *
 * The programme is 307 phases across 20 documents. No vendor agent — ours included —
 * reliably reads that correctly, and one that reads it partially produces work that
 * contradicts a phase it did not open. So the plan is not handed to an agent as reading
 * material. One phase is extracted into a single pasteable brief that carries everything
 * needed to execute it and nothing that is not: the row, its dependency states, the
 * invariants of its track, the definition of done, and the exit criterion.
 *
 * This is the same reasoning as the exit criteria themselves (02-EXECUTION-GUIDELINES § 1):
 * do not rely on someone having read the right thing — hand them the thing.
 *
 *   node scripts/phase-brief.mjs C07              the brief, to stdout
 *   node scripts/phase-brief.mjs C07 --md         wrapped for pasting into a chat window
 *   node scripts/phase-brief.mjs --ready          every phase whose deps are all DONE
 *   node scripts/phase-brief.mjs --ready --track B
 *   node scripts/phase-brief.mjs --wave 0         phases in a wave, with readiness
 *   node scripts/phase-brief.mjs --status         one-line progress summary per track
 *   node scripts/phase-brief.mjs C07 --set-status WIP
 *                                                 edits only the Status cell, in place
 *
 * --set-status is the only write path, and it touches exactly one table cell. Agents
 * that hand-edit these tables reflow them, drop columns, and renumber neighbours;
 * README § 0 rule 3 forbids that and check-plan-integrity.mjs catches it, but a
 * mechanical setter means the situation does not arise.
 */

import { readFileSync, writeFileSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = join(HERE, "..");
const PROGRAMME = join(ROOT, "docs", "programme");

const TRACKS = {
  A: { file: "10-TRACK-A-FOUNDATION.md", name: "Foundation" },
  B: { file: "11-TRACK-B-DESIGN-SYSTEM.md", name: "Design system" },
  C: { file: "12-TRACK-C-PLATFORM-CONSOLE.md", name: "Platform console" },
  D: { file: "13-TRACK-D-TENANT-ADMIN.md", name: "Tenant admin" },
  E: { file: "14-TRACK-E-BUSINESS-APPS.md", name: "Business apps" },
  F: { file: "15-TRACK-F-STUDIO-AND-SITES.md", name: "Studio and sites" },
  G: { file: "16-TRACK-G-DEVELOPER-PLATFORM.md", name: "Developer platform" },
  H: { file: "17-TRACK-H-MARKETING.md", name: "Marketing" },
  I: { file: "18-TRACK-I-CLIENTS.md", name: "Clients" },
  J: { file: "19-TRACK-J-QUALITY.md", name: "Quality" },
  K: { file: "20-TRACK-K-OPERATIONS-GTM.md", name: "Operations and GTM" },
  L: { file: "21-TRACK-L-CODE-QUALITY.md", name: "Code quality" },
};

const VALID_STATUS = ["OPEN", "READY", "WIP", "DONE", "BLOCKED", "WITHDRAWN"];

const die = (msg) => {
  console.error(`phase-brief: ${msg}`);
  process.exit(1);
};

const splitRow = (line) => {
  const inner = line.trim().replace(/^\|/, "").replace(/\|$/, "");
  return inner.split("|").map((c) => c.trim());
};

/**
 * Parse a track file into phases. Column layout differs between tracks (Track A carries
 * a Repos column, Track E's domain stages carry Modules and phrase the exit column as
 * "Non-negotiables at exit"), so labels come from each table's own header rather than
 * from a fixed schema. What is invariant: first cell is the ID, last is Status, and the
 * one before Status is the exit criterion.
 */
function parseTrack(letter) {
  const { file } = TRACKS[letter];
  const path = join(PROGRAMME, file);
  if (!existsSync(path)) die(`missing track file ${file}`);
  const lines = readFileSync(path, "utf8").split("\n");

  const phases = new Map();
  let header = null;
  let stage = null;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i];
    if (/^##+\s/.test(line)) {
      stage = line.replace(/^##+\s*/, "").trim();
      header = null;
      continue;
    }
    if (/^\|\s*ID\s*\|/i.test(line)) {
      header = splitRow(line);
      continue;
    }
    const m = line.match(new RegExp(String.raw`^\|\s*\*\*(${letter}\d{2}[a-z]?)\*\*\s*\|`));
    if (!m) continue;
    const cells = splitRow(line);
    const fields = {};
    (header ?? []).forEach((h, idx) => {
      if (idx === 0) return;
      if (cells[idx] !== undefined) fields[h] = cells[idx];
    });
    phases.set(m[1], {
      id: m[1],
      line: i + 1,
      file,
      stage,
      fields,
      exit: cells[cells.length - 2] ?? "",
      status: cells[cells.length - 1] ?? "",
      raw: line,
    });
  }
  return phases;
}

function parseAll() {
  const all = new Map();
  for (const letter of Object.keys(TRACKS)) {
    for (const [id, p] of parseTrack(letter)) all.set(id, { ...p, track: letter });
  }
  return all;
}

/** "A06, A07, A08" / "A01–A02" / "—" → ["A06","A07","A08"] */
function parseDeps(raw) {
  if (!raw) return [];
  const text = raw.replace(/\*\*/g, "");
  const out = new Set();
  const rangeRe = /([A-L])(\d{2})\s*[–-]\s*(?:[A-L])?(\d{2})/g;
  let m;
  let consumed = text;
  while ((m = rangeRe.exec(text)) !== null) {
    const [full, letter, from, to] = m;
    for (let n = Number(from); n <= Number(to); n++) {
      out.add(`${letter}${String(n).padStart(2, "0")}`);
    }
    consumed = consumed.replace(full, " ");
  }
  for (const id of consumed.match(/\b[A-L]\d{2}[a-z]?\b/g) ?? []) out.add(id);
  return [...out].sort();
}

/** Section text between a heading matching `re` and the next heading of equal-or-higher level. */
function section(file, re) {
  const text = readFileSync(join(PROGRAMME, file), "utf8");
  const lines = text.split("\n");
  const start = lines.findIndex((l) => re.test(l));
  if (start === -1) return null;
  const level = (lines[start].match(/^#+/) ?? ["##"])[0].length;
  let end = lines.length;
  for (let i = start + 1; i < lines.length; i++) {
    const h = lines[i].match(/^(#+)\s/);
    if (h && h[1].length <= level) {
      end = i;
      break;
    }
  }
  return lines.slice(start, end).join("\n").trim();
}

// ── argument handling ─────────────────────────────────────────────────────────
const argv = process.argv.slice(2);
const flag = (name) => argv.includes(`--${name}`);
const opt = (name) => {
  const i = argv.indexOf(`--${name}`);
  return i === -1 ? null : argv[i + 1];
};
const target = argv.find((a) => /^[A-L]\d{2}[a-z]?$/.test(a));

const all = parseAll();

// ── --json ────────────────────────────────────────────────────────────────────
// The machine-readable view start.mjs reads, so there is exactly one parser for the plan.
// A second parser would drift from this one, and a drifted parser silently mis-reports
// which phases are ready — which is the class of bug the whole programme is about.
if (flag("json")) {
  const out = {};
  for (const [id, p] of all) {
    out[id] = {
      track: p.track,
      file: p.file,
      line: p.line,
      stage: p.stage,
      title: Object.values(p.fields)[0] ?? "",
      // Repos is only present on Track A; Track E's domain stages carry Modules instead.
      // start.mjs uses whichever exists to warn about code-level overlap between two
      // phases that the dependency graph says are independent.
      repos: p.fields.Repos ?? p.fields.Modules ?? "",
      deps: parseDeps(p.fields.Depends ?? ""),
      exit: p.exit,
      status: p.status,
    };
  }
  console.log(JSON.stringify(out));
  process.exit(0);
}

// ── --status ──────────────────────────────────────────────────────────────────
if (flag("status")) {
  console.log(`\nUniERP programme — ${all.size} phases\n`);
  let done = 0;
  for (const [letter, { name }] of Object.entries(TRACKS)) {
    const ps = [...all.values()].filter((p) => p.track === letter);
    const counts = {};
    for (const p of ps) counts[p.status] = (counts[p.status] ?? 0) + 1;
    done += counts.DONE ?? 0;
    const bar = `${counts.DONE ?? 0}/${ps.length}`;
    const rest = VALID_STATUS.filter((s) => s !== "DONE" && counts[s])
      .map((s) => `${s} ${counts[s]}`)
      .join("  ");
    console.log(`  ${letter}  ${name.padEnd(20)} ${bar.padStart(7)}   ${rest}`);
  }
  console.log(`\n  TOTAL  ${done}/${all.size} DONE\n`);
  process.exit(0);
}

// ── --ready / --wave ──────────────────────────────────────────────────────────
if (flag("ready") || flag("wave")) {
  const trackFilter = opt("track");
  const wave = opt("wave");
  let waveIds = null;
  if (wave !== null) {
    const plan = section(
      "01-PRIORITY-AND-SEQUENCING.md",
      new RegExp(String.raw`^###\s+Wave\s+${wave}\s`),
    );
    if (!plan) die(`no Wave ${wave} in 01-PRIORITY-AND-SEQUENCING.md § 4`);
    const phaseLine = plan.split("\n").find((l) => l.startsWith("**Phases:**")) ?? "";
    waveIds = new Set(parseDeps(phaseLine));
  }

  const rows = [];
  for (const p of all.values()) {
    if (trackFilter && p.track !== trackFilter.toUpperCase()) continue;
    if (waveIds && !waveIds.has(p.id)) continue;
    if (["DONE", "WITHDRAWN"].includes(p.status)) continue;
    const deps = parseDeps(p.fields.Depends ?? p.fields.depends ?? "");
    const blocking = deps.filter((d) => all.get(d) && all.get(d).status !== "DONE");
    const unknown = deps.filter((d) => !all.get(d));
    rows.push({ p, blocking, unknown, ready: blocking.length === 0 });
  }

  const ready = rows.filter((r) => r.ready);
  const blocked = rows.filter((r) => !r.ready);

  console.log(
    `\nREADY — every dependency DONE (${ready.length})` +
      (waveIds ? `  · Wave ${wave}` : "") +
      "\n",
  );
  for (const { p } of ready) {
    const title = Object.values(p.fields)[0] ?? "";
    console.log(`  ${p.id}  ${p.status.padEnd(8)} ${title}`);
  }
  if (!ready.length) {
    console.log(
      "  (none — the correct move is to finish a dependency, not to open a later wave.\n" +
        "   README § 4. H and K phases are the sanctioned parallel work.)",
    );
  }
  if (blocked.length) {
    console.log(`\nBLOCKED (${blocked.length})\n`);
    for (const { p, blocking, unknown } of blocked) {
      const why = [...blocking, ...unknown.map((u) => `${u}?`)].join(" ");
      console.log(`  ${p.id}  waiting on  ${why}`);
    }
  }
  console.log("");
  process.exit(0);
}

if (!target) {
  console.error(
    `usage:
  node scripts/phase-brief.mjs <PHASE_ID>            emit the work order
  node scripts/phase-brief.mjs <PHASE_ID> --md       fenced, for pasting into a chat
  node scripts/phase-brief.mjs <PHASE_ID> --set-status <${VALID_STATUS.join("|")}>
  node scripts/phase-brief.mjs --ready [--track X]   what can be started now
  node scripts/phase-brief.mjs --wave N              a wave, with readiness
  node scripts/phase-brief.mjs --status             progress per track`,
  );
  process.exit(1);
}

const phase = all.get(target);
if (!phase) die(`no phase ${target}. IDs are permanent — check docs/programme/plan-manifest.json.`);

// ── --set-status ──────────────────────────────────────────────────────────────
if (flag("set-status")) {
  const next = (opt("set-status") ?? "").toUpperCase();
  if (!VALID_STATUS.includes(next)) die(`status must be one of ${VALID_STATUS.join(", ")}`);
  const path = join(PROGRAMME, phase.file);
  const lines = readFileSync(path, "utf8").split("\n");
  const idx = phase.line - 1;
  const cells = splitRow(lines[idx]);
  const before = cells[cells.length - 1];
  cells[cells.length - 1] = next;
  lines[idx] = `| ${cells.join(" | ")} |`;
  writeFileSync(path, lines.join("\n"));
  console.log(`${phase.id}  ${before} → ${next}   (${phase.file}:${phase.line})`);
  console.log(
    `\nStill required: one line in docs/ai/CHANGELOG.md, and ` +
      `node scripts/check-plan-integrity.mjs before you commit.`,
  );
  process.exit(0);
}

// ── the brief ─────────────────────────────────────────────────────────────────
const deps = parseDeps(phase.fields.Depends ?? "");
const depRows = deps.map((d) => {
  const dp = all.get(d);
  return dp
    ? `  ${d}  ${dp.status.padEnd(10)} ${Object.values(dp.fields)[0] ?? ""}`
    : `  ${d}  UNKNOWN    (not a phase ID — the plan's dependency graph is wrong here; ` +
        `log it in the track's amendment log)`;
});
const blocking = deps.filter((d) => all.get(d) && all.get(d).status !== "DONE");

const trackOwns = section(TRACKS[phase.track].file, /^##\s+1\.\s+What this track owns/);
const dod = section("02-EXECUTION-GUIDELINES.md", /^##\s+3\.\s+Definition of Done/);
const loop = section("02-EXECUTION-GUIDELINES.md", /^##\s+2\.\s+Executing one phase/);
const antipatterns = section("02-EXECUTION-GUIDELINES.md", /^##\s+7\.\s+Anti-patterns/);
const rubric =
  phase.track === "E" ? section("02-EXECUTION-GUIDELINES.md", /^##\s+5\.\s+The module/) : null;

const out = [];
const p = (s = "") => out.push(s);

p(`# WORK ORDER — ${phase.id}`);
p();
p(`> Generated by \`scripts/phase-brief.mjs ${phase.id}\` from the UniERP development`);
p(`> programme. **This brief is complete.** Everything needed to execute ${phase.id} is`);
p(`> below; you do not need to read the rest of the plan, and you should not`);
p(`> act on any part of it that is not quoted here.`);
p();
p(`**Track ${phase.track} — ${TRACKS[phase.track].name}** · \`docs/programme/${phase.file}:${phase.line}\``);
p(`**Stage:** ${phase.stage ?? "—"}`);
p();
p("---");
p();
p("## 1. The phase");
p();
for (const [k, v] of Object.entries(phase.fields)) {
  if (k === "Status") continue;
  p(`**${k}**`);
  p();
  p(v || "—");
  p();
}
p("---");
p();
p("## 2. Exit criterion — the definition of finished");
p();
p("> " + (phase.exit || "MISSING — do not proceed; a phase without an exit criterion is malformed."));
p();
p("**Before you build anything, run this and watch it FAIL.** If it already passes, the");
p("phase is already done: set its status, record the command, and stop. That happens more");
p("often than you would expect on this plan, and it is the cheapest possible outcome.");
p();
p("**When you finish, run it again and watch it PASS — then break your own change on");
p("purpose and confirm it fails again.** A check that passes unconditionally is the exact");
p("defect this programme exists to eliminate (see § 6).");
p();
p("---");
p();
p("## 3. Dependencies");
p();
if (!deps.length) {
  p("None. This phase is not blocked.");
} else {
  p("```");
  depRows.forEach((r) => p(r));
  p("```");
  p();
  if (blocking.length) {
    p(`### 🛑 STOP — ${blocking.length} dependency(ies) are not DONE: **${blocking.join(", ")}**`);
    p();
    p("Do not start this phase. Do not work around it. Do not build the parts that");
    p("\"don't really depend on it\". The dependency exists because building on top of it");
    p("means rebuilding afterwards.");
    p();
    p("Run `node scripts/phase-brief.mjs --ready` and pick something that is actually ready.");
  } else {
    p("All dependencies are DONE. This phase is ready.");
  }
}
p();
p("---");
p();
p("## 4. What this track owns — the invariants you must not violate");
p();
p(trackOwns ?? "(track section not found)");
p();
p("---");
p();
p("## 5. How to execute");
p();
p(loop ?? "(execution loop not found)");
if (rubric) {
  p();
  p("---");
  p();
  p("## 5b. The rubric this phase is scored against");
  p();
  p("Track E phases are audits against a fixed rubric, not feature hunts. Score with");
  p("evidence and put the score in the phase's Notes.");
  p();
  p(rubric);
}
p();
p("---");
p();
p("## 6. Definition of Done — every box, not most");
p();
p(dod ?? "(DoD not found)");
p();
p("---");
p();
p("## 7. Automatic rejection");
p();
p(antipatterns ?? "(anti-patterns not found)");
p();
p("---");
p();
p("## 8. What to hand back");
p();
p("Report exactly these five things. Not a narrative of what you tried.");
p();
p("```");
p(`PHASE      ${phase.id}`);
p("STATUS     DONE | BLOCKED | WIP  (and if not DONE, on what, precisely)");
p("PROVEN     the exit-criterion command, its output, and the output when broken");
p("BUILT      files changed, grouped by repository");
p("DoD        the § 6 checklist, each line ticked or explicitly N/A with a reason");
p("FOUND      anything architectural you noticed — for 90-DEFECT-LOG.md, NOT fixed inline");
p("```");
p();
p("### Housekeeping that is part of the phase, not optional");
p();
p("```bash");
p(`node scripts/phase-brief.mjs ${phase.id} --set-status DONE   # edits one cell, safely`);
p("node scripts/check-plan-integrity.mjs                  # must pass");
p("```");
p();
p("Then append **one line** to `docs/ai/CHANGELOG.md`. It is the only channel between you");
p("and the next agent, who will have no memory of this session. A phase with no changelog");
p("line is invisible and gets duplicated.");
p();
p("### Three things that are never acceptable");
p();
p("1. **Softening the exit criterion in § 2 to make the phase pass.** If you believe it is");
p("   wrong, say so and log it in the track's amendment log. Changing it quietly converts a");
p("   failing build into a false claim that will outlive everyone's memory of why.");
p("2. **Editing the plan's tables by hand.** Use `--set-status`. Hand edits reflow columns");
p("   and drop cells, and `check-plan-integrity.mjs` will reject the commit.");
p("3. **Creating a new document** to hold notes, progress or findings. Findings go in");
p("   `docs/programme/90-DEFECT-LOG.md`; narrative goes in `docs/ai/CHANGELOG.md`. A new");
p("   `NOTES.md` fails the build and is deleted without review.");

const body = out.join("\n");
console.log(flag("md") ? "````markdown\n" + body + "\n````" : body);
