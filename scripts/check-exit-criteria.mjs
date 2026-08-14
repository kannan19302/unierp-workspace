#!/usr/bin/env node
/**
 * check-exit-criteria.mjs — an exit criterion must be able to fail.
 *
 * `check-plan-integrity.mjs` already refuses a phase with an *empty* exit criterion. That is a
 * floor, and it is not the same thing as a criterion that can actually fail. `AGENTS.md § 1` is
 * the rule this enforces: no claim without a mechanism that can fail. A criterion reading
 * "the module works well" satisfies the emptiness check and proves nothing.
 *
 * What this gate can and cannot do, stated honestly:
 *
 *   It CAN detect criteria with no falsifiable signal at all — no command, no quantity, no
 *   comparison, no failure verb, no statement of how it is established. Those are assertions
 *   wearing a criterion's clothes.
 *
 *   It CANNOT judge whether a criterion is the RIGHT one for its phase. No regex can. An agent
 *   reading the brief has to do that, which is why `02-EXECUTION-GUIDELINES § 3` instructs you to
 *   strengthen a criterion you find too weak, in the amendment log.
 *
 * So this is a lint, not an oracle, and it is tuned to near-zero false positives: it fails only
 * when a criterion has NO signal whatsoever. A criterion it passes is not thereby good — it is
 * merely not obviously vacuous. Do not read a green run as "the exit criteria are strong".
 *
 *   node scripts/check-exit-criteria.mjs             lint every phase (exit 1 on vacuous)
 *   node scripts/check-exit-criteria.mjs --report    signal distribution, always exit 0
 *   node scripts/check-exit-criteria.mjs --strict    additionally warn on single-signal criteria
 */

import { readFileSync, readdirSync, existsSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { idPatternFor } from "./lib/programme-ids.mjs";

const HERE = dirname(fileURLToPath(import.meta.url));
const PROGRAMME = join(HERE, "..", "docs", "programme");

/** Signals that a criterion describes something observable that could come out the other way. */
const SIGNALS = [
  // Something you could run or inspect.
  { name: "command", test: (s) => /`[^`]{3,}`/.test(s) },
  // Something measurable.
  { name: "quantity", test: (s) => /\d|\bzero\b|\bnone\b/i.test(s) },
  // The criterion names what failing looks like.
  {
    name: "failure",
    test: (s) =>
      /\b(fails?|failing|refus\w+|reject\w+|block\w+|caught|detect\w+|impossible|cannot|never|denied|throws?)\b/i.test(s),
  },
  // An assertion of equivalence or bound.
  {
    name: "comparison",
    test: (s) =>
      /\b(equals?|equal to|identical|matches|reconcile\w*|within|exceeds?|below|above|budget|threshold|at most|at least|no more than)\b/i.test(s),
  },
  // How the outcome is established.
  {
    name: "verification",
    test: (s) =>
      /\b(verified|proven|measured|asserted|recorded|observed|rehears\w+|reproducib\w+|by test|by command|by inspection|by comparison|by query|by rehearsal)\b/i.test(s),
  },
  /**
   * A declarative statement of observable system behaviour.
   *
   * This signal exists because the first five were all *proof* language, and a large class of
   * perfectly good criteria are written as *outcome* language instead — "an expired override
   * reverts automatically", "no non-essential animation plays", "the query is logged with a
   * justification". Those are falsifiable: you run them and watch them not happen. Without this
   * signal the lint reported 733 vacuous criteria, almost all of them false positives, which
   * would have been a worse defect than the one it was looking for.
   */
  {
    name: "outcome",
    test: (s) =>
      /\b(automatic\w*|appears?|reverts?|restores?|renders?|produces?|returns?|results? in|reaches|arrives?|propagat\w+|logged|audited|notifi\w+|alerts?|warns?|surfaces?|escalates?|expires?|persists?|survives?|resumes?|degrades?|stops?|halts?|prevents?|requires?|honou?rs?|reflects?|remains?|continues?|shows?|displays?|lists?|reports?)\b/i.test(s) ||
      /(^|\s)(no|not|nothing|none|never|without|zero)\s/i.test(s),
  },
];

const argv = process.argv.slice(2);
const REPORT = argv.includes("--report");
const STRICT = argv.includes("--strict");

/**
 * Track key → its document, derived from the folder rather than duplicated from
 * check-plan-integrity.mjs. A second hand-maintained copy of that map is exactly the drift this
 * programme keeps filing defects about.
 */
function trackFiles() {
  const files = readdirSync(PROGRAMME).filter((f) => f.endsWith(".md"));
  const map = {};
  for (const f of files) {
    let m = f.match(/^\d\d-TRACK-([A-M])-/);
    if (m) map[m[1]] = f;
    m = f.match(/^\d\d-PROGRAMME-(\d{1,2})-/);
    if (m) map[`P${m[1]}`] = f;
  }
  return map;
}

function phaseRows() {
  const out = [];
  for (const [trackKey, file] of Object.entries(trackFiles())) {
    const path = join(PROGRAMME, file);
    if (!existsSync(path)) continue;
    const lines = readFileSync(path, "utf8").split("\n");
    const re = new RegExp(String.raw`^\|\s*\*\*(${idPatternFor(trackKey)})\*\*\s*\|`);
    for (let i = 0; i < lines.length; i++) {
      const m = lines[i].match(re);
      if (!m) continue;
      const cells = lines[i]
        .trim()
        .replace(/^\|/, "")
        .replace(/\|$/, "")
        .split("|")
        .map((c) => c.trim());
      // Last cell is Status; the one before it is the exit criterion.
      out.push({ id: m[1], file, line: i + 1, exit: cells[cells.length - 2] ?? "" });
    }
  }
  return out;
}

const graded = phaseRows().map((r) => {
  const hits = SIGNALS.filter((s) => s.test(r.exit)).map((s) => s.name);
  return { ...r, hits, score: hits.length };
});

if (!graded.length) {
  console.error("FAIL  no phase rows found — the parser or the folder layout has changed.");
  process.exit(1);
}

if (REPORT) {
  const dist = {};
  for (const g of graded) dist[g.score] = (dist[g.score] ?? 0) + 1;
  console.log(`\nExit-criterion signal distribution across ${graded.length} phases\n`);
  for (const k of Object.keys(dist).sort()) {
    const bar = "█".repeat(Math.max(1, Math.round((dist[k] / graded.length) * 50)));
    console.log(`  ${k} signal(s)  ${String(dist[k]).padStart(5)}  ${bar}`);
  }
  const byName = {};
  for (const g of graded) for (const h of g.hits) byName[h] = (byName[h] ?? 0) + 1;
  console.log(`\nSignal frequency\n`);
  for (const [n, c] of Object.entries(byName).sort((a, b) => b[1] - a[1])) {
    console.log(`  ${n.padEnd(14)} ${String(c).padStart(5)}`);
  }
  console.log(
    `\nThis is a lint, not a quality score. A high count does not mean a criterion is right\n` +
      `for its phase — only that it is not obviously vacuous.\n`,
  );
  process.exit(0);
}

/**
 * A ratchet, not a cliff.
 *
 * Applying this lint as a hard gate to 4,211 pre-existing criteria would fail hundreds of phases,
 * and a meaningful share of those are false positives — the lint cannot tell a genuinely vacuous
 * criterion from a well-written declarative one it has no keyword for. Failing the build on that
 * would train everyone to ignore it, which is how this project got ten gates that could not fail.
 *
 * So: existing zero-signal criteria are recorded in a baseline and reported, not failed. A **new**
 * zero-signal criterion, or an existing one edited into vacuity, fails. The baseline may shrink
 * freely and may only grow through `--update-baseline`, which is a deliberate, reviewable act.
 */
const BASELINE = join(PROGRAMME, "exit-criteria-baseline.json");
const baseline = existsSync(BASELINE)
  ? new Set(JSON.parse(readFileSync(BASELINE, "utf8")).vacuous)
  : null;

const vacuous = graded.filter((g) => g.score === 0);

if (argv.includes("--update-baseline")) {
  const { writeFileSync } = await import("node:fs");
  writeFileSync(
    BASELINE,
    JSON.stringify(
      {
        $comment:
          "Phases whose exit criterion carries no falsifiable signal, as measured by " +
          "scripts/check-exit-criteria.mjs. This is a RATCHET: the list may shrink freely; " +
          "it grows only through --update-baseline. Strengthening any criterion here and " +
          "removing its ID is always welcome. See 02-EXECUTION-GUIDELINES § 3.",
        generated: new Date().toISOString().slice(0, 10),
        count: vacuous.length,
        vacuous: vacuous.map((v) => v.id).sort(),
      },
      null,
      2,
    ) + "\n",
  );
  console.log(`OK    baseline written: ${vacuous.length} phases recorded as zero-signal.`);
  process.exit(0);
}

const regressions = baseline ? vacuous.filter((v) => !baseline.has(v.id)) : vacuous;
const improved = baseline ? [...baseline].filter((id) => !vacuous.some((v) => v.id === id)) : [];

for (const v of regressions) {
  console.error(
    `FAIL  ${v.id} (${v.file}:${v.line}) has an exit criterion with no falsifiable signal.\n` +
      `      "${v.exit.slice(0, 120)}"\n` +
      `      Add a command, a quantity, a comparison, or state what failing looks like.\n` +
      `      See 02-EXECUTION-GUIDELINES § 3 and AGENTS.md § 1.`,
  );
}

if (STRICT) {
  for (const t of graded.filter((g) => g.score === 1)) {
    console.warn(
      `WARN  ${t.id} single-signal criterion (${t.hits[0]}): "${t.exit.slice(0, 90)}"`,
    );
  }
}

if (regressions.length) {
  console.error(
    `\ncheck-exit-criteria: ${regressions.length} NEW zero-signal criteria ` +
      `(baseline holds ${baseline ? baseline.size : 0}).\n` +
      `Strengthen them, or if the lint is wrong about a criterion, say so in the track's\n` +
      `amendment log and re-baseline deliberately with --update-baseline.\n`,
  );
  process.exit(1);
}

const thin = graded.filter((g) => g.score === 1).length;
console.log(
  `OK    ${graded.length} exit criteria checked; ${vacuous.length} zero-signal ` +
    `(all baselined), ${thin} single-signal.` +
    (improved.length ? `  ${improved.length} improved since the baseline — ratchet with --update-baseline.` : ""),
);
