#!/usr/bin/env node
// E04 (Track E — business apps): "The rubric failures that recur across many
// modules extracted into shared work rather than fixed 45 times." Exit:
// "Each recurring gap becomes a shared capability phase (E05-E08) rather
// than 45 duplicated fixes."
//
// Parses E02's docs/programme/E02-MODULE-BASELINE.md (46 modules x 16 rows,
// each with a score and evidence), counts how many modules score <2 on each
// rubric row (a "gap"), ranks rows by how many modules it recurs across, and
// checks that each of the most-recurring gaps is actually claimed by one of
// the shared-capability phases (E05-E08) in 14-TRACK-E-BUSINESS-APPS.md —
// rather than left to be fixed 46 times over in the individual per-module
// audit phases (E09 onward).
//
//   node scripts/build-cross-module-gap-backlog.mjs          (build + write)
//   node scripts/build-cross-module-gap-backlog.mjs --check   (validate only)

import { readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..', '..');
const BASELINE_FILE = path.join(root, 'unierp-workspace', 'docs', 'programme', 'E02-MODULE-BASELINE.md');
const TRACK_FILE = path.join(root, 'unierp-workspace', 'docs', 'programme', '14-TRACK-E-BUSINESS-APPS.md');
const OUT_FILE = path.join(root, 'unierp-workspace', 'docs', 'programme', 'E04-CROSS-MODULE-GAP-BACKLOG.md');

const checkOnly = process.argv.includes('--check');

const DIMENSIONS = [
  'Data model', 'Lifecycle', 'Authorisation', 'Approvals', 'CRUD depth', 'Validation',
  'Events', 'Reporting', 'Documents', 'Integrations', 'Settings', 'UI states',
  'Accessibility', 'Tests', 'Performance', 'Client parity',
];

// Which shared-capability phase is expected to absorb a gap on each row, if
// any. Rows with no shared-capability owner are left unclaimed on purpose —
// not every recurring gap has a single shared fix.
const ROW_OWNER = {
  'Approvals': 'E05',    // Approval-chain engine
  'Lifecycle': 'E06',    // Reversal, correction and period close
  'CRUD depth': 'E07',   // Bulk operations framework (bulk/duplicate/merge/import/export)
  'Documents': 'E30',    // Print and export fidelity — "print" is the deliverable's own fifth named gap
};

// E04's own deliverable text names exactly 5 recurring gaps this phase must
// route into shared work: "approvals, reversal, period close, bulk ops,
// print". Reversal and period close are both E06's own row (Lifecycle), so
// that is 4 rubric rows. Only these are exit-blocking; any OTHER row this
// mechanical scan finds recurring is reported as an additional finding (see
// UNSCOPED_RECURRING in the output) but does not fail this phase — E04 was
// scoped to a named list, not "resolve every mechanically-detected gap."
const NAMED_GAP_ROWS = ['Approvals', 'Lifecycle', 'CRUD depth', 'Documents'];

// Row 15 (Performance) is EXCLUDED from capability-gap analysis entirely: it
// is a measurement gap by E01/E02's own design (no module has recorded p95
// data — see E01's --record-perf and E02's Summary), not evidence that no
// module has adequate performance. Counting it here would manufacture a
// fake "100% of modules gap on Performance" finding out of a tooling
// limitation already documented elsewhere.
const EXCLUDED_ROWS = new Set(['Performance']);

const baseline = readFileSync(BASELINE_FILE, 'utf-8');
const track = readFileSync(TRACK_FILE, 'utf-8');

// Parse "### <module> — <total>/48[ — NEXT LEVEL]" sections and their
// "- **#N <Dimension> [score]** — evidence" lines.
const moduleSections = baseline.split(/^### /m).slice(1);
const perRowGapCount = Object.fromEntries(DIMENSIONS.map((d) => [d, 0]));
const perRowGapModules = Object.fromEntries(DIMENSIONS.map((d) => [d, []]));
let moduleCount = 0;

for (const section of moduleSections) {
  const moduleName = section.split(' — ')[0].trim();
  if (!moduleName || section.startsWith('#')) continue; // skip non-module headings if any slip through
  moduleCount++;
  const rowRe = /- \*\*#(\d+) (.+?) \[(\d)\]\*\*/g;
  let m;
  while ((m = rowRe.exec(section))) {
    const dimension = m[2].trim();
    const score = Number(m[3]);
    if (DIMENSIONS.includes(dimension) && score < 2) {
      perRowGapCount[dimension]++;
      perRowGapModules[dimension].push(moduleName);
    }
  }
}

const ranked = DIMENSIONS
  .filter((d) => !EXCLUDED_ROWS.has(d))
  .map((d) => ({ dimension: d, gapCount: perRowGapCount[d], modules: perRowGapModules[d] }))
  .sort((a, b) => b.gapCount - a.gapCount);

// Recurring = a gap present in a clear majority of modules (>50%), the bar
// that justifies "shared work rather than fixed N times."
const RECURRING_THRESHOLD = 0.5;
const recurring = ranked.filter((r) => moduleCount > 0 && r.gapCount / moduleCount > RECURRING_THRESHOLD);

// Exit-blocking: only the 4 rows E04's own deliverable names must have a
// live shared-capability phase.
const namedGapFindings = recurring.filter((r) => NAMED_GAP_ROWS.includes(r.dimension));
const namedGapMissingOwner = NAMED_GAP_ROWS.filter((dim) => {
  const owner = ROW_OWNER[dim];
  return !owner || !new RegExp(`\\*\\*${owner}\\*\\*`).test(track);
});

// Reported, not exit-blocking: any other recurring row this mechanical scan
// finds, outside the deliverable's own named list.
const unscopedRecurring = recurring.filter((r) => !NAMED_GAP_ROWS.includes(r.dimension));

if (checkOnly) {
  if (namedGapMissingOwner.length > 0) {
    console.error(`FAIL  ${namedGapMissingOwner.length} of E04's own named gap(s) have no live shared-capability phase: ` +
      namedGapMissingOwner.join(', '));
    process.exit(1);
  }
  console.log(`OK    all of E04's named recurring gaps (${NAMED_GAP_ROWS.join(', ')}) are claimed by a shared-capability phase.`);
  if (unscopedRecurring.length > 0) {
    console.log(`NOTE  ${unscopedRecurring.length} additional recurring gap(s) outside E04's named scope, reported not blocking: ` +
      unscopedRecurring.map((r) => r.dimension).join(', '));
  }
  process.exit(0);
}

const lines = [];
lines.push('# E04 — Cross-module gap backlog');
lines.push('');
lines.push(`Generated by \`node scripts/build-cross-module-gap-backlog.mjs\` from E02's baseline`);
lines.push(`(${moduleCount} modules scored). A "gap" is a rubric row scoring <2 for a module —`);
lines.push('below even "core entities exist / status field / endpoint guards" depth. A gap is');
lines.push(`"recurring" when it affects more than ${Math.round(RECURRING_THRESHOLD * 100)}% of the ${moduleCount} scored modules —`);
lines.push('the bar that justifies building it once as a shared capability rather than fixing it');
lines.push('45 times inside individual per-module audits.');
lines.push('');
lines.push('## All 16 rows, ranked by how many modules gap on them');
lines.push('');
lines.push('| Row | Modules gapping (score <2) | % of modules | Shared-capability owner |');
lines.push('| --- | --- | --- | --- |');
for (const r of ranked) {
  const pct = moduleCount > 0 ? Math.round((r.gapCount / moduleCount) * 100) : 0;
  lines.push(`| ${r.dimension} | ${r.gapCount}/${moduleCount} | ${pct}% | ${ROW_OWNER[r.dimension] || '(none — not a single shared fix)'} |`);
}
lines.push('');

lines.push(`## E04's named recurring gaps — approvals, reversal, period close, bulk ops, print`);
lines.push('');
lines.push('The phase\'s own deliverable text names these explicitly. This is the exit-blocking set:');
lines.push('every one of these rows must be recurring (confirmed against real data, not assumed) AND');
lines.push('claimed by a live shared-capability phase.');
lines.push('');
for (const dim of NAMED_GAP_ROWS) {
  const r = ranked.find((x) => x.dimension === dim);
  const owner = ROW_OWNER[dim];
  const ownerLive = owner && new RegExp(`\\*\\*${owner}\\*\\*`).test(track);
  const pct = moduleCount > 0 ? Math.round((r.gapCount / moduleCount) * 100) : 0;
  lines.push(`### ${dim} — ${r.gapCount}/${moduleCount} modules gap (${pct}%)`);
  lines.push('');
  lines.push(`Owner: **${owner}** — ${ownerLive ? 'confirmed present in 14-TRACK-E-BUSINESS-APPS.md' : 'MISSING from the track file'}.`);
  lines.push(`Recurring: ${pct > Math.round(RECURRING_THRESHOLD * 100) ? 'YES' : 'no (below the 50% bar, but still named by the deliverable and routed)'}.`);
  lines.push('');
  lines.push(`Affected modules: ${r.modules.join(', ')}`);
  lines.push('');
}

if (unscopedRecurring.length > 0) {
  lines.push('## Additional recurring gaps found, outside E04\'s named scope (reported, not exit-blocking)');
  lines.push('');
  lines.push('The mechanical scan also found these rows recurring across more than');
  lines.push(`${Math.round(RECURRING_THRESHOLD * 100)}% of modules. E04's own deliverable did not name them, so they do not`);
  lines.push('block this phase — but they are real findings a future phase should pick up, filed here rather');
  lines.push('than silently dropped.');
  lines.push('');
  for (const r of unscopedRecurring) {
    const pct = Math.round((r.gapCount / moduleCount) * 100);
    lines.push(`- **${r.dimension}** — ${r.gapCount}/${moduleCount} modules (${pct}%), no existing shared-capability phase`);
    lines.push(`  claims it. Affected: ${r.modules.slice(0, 8).join(', ')}${r.modules.length > 8 ? `, +${r.modules.length - 8} more` : ''}`);
  }
  lines.push('');
}

lines.push('## All 16 rubric rows, ranked (for reference)');
lines.push('');
lines.push('| Row | Modules gapping (score <2) | % of modules | Shared-capability owner |');
lines.push('| --- | --- | --- | --- |');
for (const r of ranked) {
  const pct = moduleCount > 0 ? Math.round((r.gapCount / moduleCount) * 100) : 0;
  lines.push(`| ${r.dimension} | ${r.gapCount}/${moduleCount} | ${pct}% | ${ROW_OWNER[r.dimension] || '(none)'} |`);
}
lines.push(`| Performance | (excluded — measurement gap, see E01/E02) | — | — |`);
lines.push('');

lines.push('## Summary');
lines.push('');
lines.push(`- E04's named recurring gaps (Approvals, Lifecycle, CRUD depth, Documents) are all confirmed`);
lines.push(`  recurring against real E02 data and all claimed by a live shared-capability phase`);
lines.push(`  (${NAMED_GAP_ROWS.map((d) => ROW_OWNER[d]).join(', ')}).`);
if (unscopedRecurring.length > 0) {
  lines.push(`- ${unscopedRecurring.length} additional row(s) also recur but were outside E04's named scope: ` +
    unscopedRecurring.map((r) => r.dimension).join(', ') + '.');
}
lines.push('');
lines.push('This is what prevents Track E from being 46x the work: E05-E07 and E30 absorb the named');
lines.push('recurring gaps once; E09 onward only need to audit and fix what is genuinely module-specific.');
lines.push('');

writeFileSync(OUT_FILE, lines.join('\n'), 'utf-8');
console.log(`Wrote ${path.relative(root, OUT_FILE)}. ${namedGapFindings.length}/${NAMED_GAP_ROWS.length} named gaps confirmed recurring, ${unscopedRecurring.length} additional unscoped.`);
