# The UniERP Development Programme

> **Status:** ACTIVE · **Established:** 2026-08-07 · **Applies to:** every repository in the UniERP family
> **Audience:** every AI coding agent and every human contributor.
> **Relationship to `docs/ai/`:** this folder is the *execution* plan. `docs/ai/` remains the
> *governance* set. Neither replaces the other. See § 2.

---

## 0. THE LAW OF THIS FOLDER — read before you write anything

`docs/ai/README.md § 0` forbids new files in `docs/ai/`. That rule stands and this folder does
not violate it: nothing here lives in `docs/ai/`. But the same failure mode that produced 30,000
lines of unread process there will produce it here unless this folder has a law of its own.

### The seven hard rules

1. **THIS FOLDER HOLDS EXACTLY THE FILES LISTED IN § 3.** Not a `PLAN_v2.md`, not a
   `NOTES.md`, not a `TRACK-Z-*.md` invented mid-session, not a `SUMMARY.md`, not a
   `PROGRESS.md`. Adding a track is permitted but never casual — it requires, **in one commit**:
   this README's § 3 table, `DECLARED` and `TRACK_FILES` in `scripts/check-plan-integrity.mjs`,
   `TRACKS` in `scripts/phase-brief.mjs`, the manifest via `--update`, and a stated reason in
   § 6. Track L was added this way on 2026-08-07; that is the standard to meet. Anything else
   appearing here is deleted without review.

2. **NO FILE IN THIS FOLDER MAY BE REWRITTEN, REGENERATED, TRUNCATED, REORDERED WHOLESALE, OR
   REPLACED BY A SUMMARY.** These are append-and-amend documents for the entire life of the
   programme. `Write` on an existing file here is a violation; use surgical `Edit`.

3. **A PHASE ID IS PERMANENT.** `A07` means one thing forever. You may not renumber, reuse,
   merge, or recycle an ID. A phase that turns out to be wrong is marked
   `status: WITHDRAWN` with a reason, and stays in the document. A phase that grows too big is
   split by adding `A07a`, `A07b` — never by renumbering its neighbours. The integrity gate
   (§ 5) fails the build if an ID disappears.

4. **STATUS IS THE ONLY FIELD AGENTS ROUTINELY EDIT.** Deliverables and exit criteria are
   changed deliberately, with the change recorded in the amendment log at the foot of the
   affected track file. Quietly softening an exit criterion to let a phase pass is the single
   most damaging thing an agent can do to this programme, and it is indistinguishable from
   progress unless it is logged.

5. **EVERY CHANGE HERE APPENDS ONE LINE TO `docs/ai/CHANGELOG.md`.** No exceptions for "small",
   for status flips, or for typos.

6. **CONFLICTS BLOCK, THEY DO NOT MERGE.** Two agents needing the same track file: the second
   one stops and picks another track. Tracks are deliberately separable for exactly this reason.

7. **THIS PROGRAMME DOES NOT OUTRANK `docs/ai/`.** If a phase here contradicts `PRD.md`,
   `TRD.md`, `BACKEND_SCHEMA.md`, or `CODE_STANDARDS.md`, the governance document wins and the
   phase is amended. If the governance document is the thing that is wrong, amend *it*
   deliberately, per its own procedure, and then amend the phase.

### Amending a file here — the only permitted procedure

```
1  git pull --rebase                      # never edit a stale tree
2  Read the ENTIRE target file            # partial reads produce contradictory edits
3  Make the smallest edit that is true    # surgical; preserve surrounding structure
4  If an exit criterion changed, add a row to that file's amendment log
5  Append ONE line to docs/ai/CHANGELOG.md
6  node scripts/check-plan-integrity.mjs  # must pass
7  Commit, naming the phase IDs touched and the reason
```

---

## 1. What this programme is

A **356-phase** execution plan to take UniERP from *"broad, architecturally sound, and now
mostly verifiable"* to *"a complete commercial multi-tenant application platform"* — public
marketing site, provider control plane, tenant SaaS portal, 45 deep business modules, a
Salesforce-class developer platform, tenant website templates, and the test discipline that
lets anyone believe the preceding list.

It is written to be executed by AI agents working in short sessions with no memory of each
other, which is why every phase carries an explicit dependency, an explicit deliverable, and an
exit criterion a machine can check.

**What this programme is not:** a schedule. There are no dates and no effort estimates. UniERP
has one maintainer (`GOVERNANCE.md`); a dated plan from a single maintainer is a wish list, and
`ROADMAP.md` already says so. Phases are *ordered*, and the ordering is the commitment.

---

## 2. How this relates to the governance set

| Question | Answered by |
| :------- | :---------- |
| *What* are we building, and why? | `docs/ai/PRD.md` |
| With *which technologies*? | `docs/ai/TRD.md` |
| What is every *screen and journey*? | `docs/ai/APP_FLOW.md` |
| What does it *look like*? | `docs/ai/UI_UX_BRIEF.md` |
| What is the *data model*? | `docs/ai/BACKEND_SCHEMA.md` |
| In what *layer order* is any one feature built? | `docs/ai/IMPLEMENTATION_PLAN.md` |
| What is *honestly wrong* with the foundation? | `docs/ai/ARCHITECTURE_REVIEW.md` |
| What is the *standing review checklist*? | `docs/ai/CODE_STANDARDS.md` |
| **In what order do the 356 remaining pieces of work happen, and how do I know one is done?** | **this folder** |

`IMPLEMENTATION_PLAN.md § 10` defines five coarse phases (0–4). This programme is the
decomposition of those five into work a session can actually pick up. The mapping is in
[`01-PRIORITY-AND-SEQUENCING.md § 6`](01-PRIORITY-AND-SEQUENCING.md).

---

## 3. The document set

| # | File | What it is |
| :- | :--- | :--------- |
| 0 | `README.md` | This file. The law and the index. |
| 1 | [`00-BASELINE.md`](00-BASELINE.md) | Verified current state of all 26 live repositories (plus 4 archived), with the command that proves each claim. Read this first. |
| 2 | [`01-PRIORITY-AND-SEQUENCING.md`](01-PRIORITY-AND-SEQUENCING.md) | Why the tracks are ordered as they are; the wave plan; what blocks what. |
| 3 | [`02-EXECUTION-GUIDELINES.md`](02-EXECUTION-GUIDELINES.md) | Anatomy of a phase, definition of done, agent operating rules, conflict protocol. |
| 4 | [`03-GAP-ANALYSIS.md`](03-GAP-ANALYSIS.md) | The 24 things the ten-point brief did not name, and which of them are load-bearing. |
| 5 | [`10-TRACK-A-FOUNDATION.md`](10-TRACK-A-FOUNDATION.md) | **A01–A31** · Proof, packaging, release, CI/CD, tenancy correctness. The gate on everything. |
| 6 | [`11-TRACK-B-DESIGN-SYSTEM.md`](11-TRACK-B-DESIGN-SYSTEM.md) | **B01–B24** · Enterprise design system across web, mobile, desktop. |
| 7 | [`12-TRACK-C-PLATFORM-CONSOLE.md`](12-TRACK-C-PLATFORM-CONSOLE.md) | **C01–C29** · Provider/internal control plane (plane 1). |
| 8 | [`13-TRACK-D-TENANT-ADMIN.md`](13-TRACK-D-TENANT-ADMIN.md) | **D01–D22** · Tenant SaaS portal and per-app settings (plane 2). |
| 9 | [`14-TRACK-E-BUSINESS-APPS.md`](14-TRACK-E-BUSINESS-APPS.md) | **E01–E47** · The 45 modules, from CRUD to genuinely functional (plane 3). |
| 10 | [`15-TRACK-F-STUDIO-AND-SITES.md`](15-TRACK-F-STUDIO-AND-SITES.md) | **F01–F26** · Studio, tenant website templates, commerce, publishing. |
| 11 | [`16-TRACK-G-DEVELOPER-PLATFORM.md`](16-TRACK-G-DEVELOPER-PLATFORM.md) | **G01–G30** · Sandbox, builders, marketplace, app lifecycle (plane 4). |
| 12 | [`17-TRACK-H-MARKETING.md`](17-TRACK-H-MARKETING.md) | **H01–H18** · unierp.com and its admin console (plane 0). |
| 13 | [`18-TRACK-I-CLIENTS.md`](18-TRACK-I-CLIENTS.md) | **I01–I18** · Mobile, desktop, offline, parity. |
| 14 | [`19-TRACK-J-QUALITY.md`](19-TRACK-J-QUALITY.md) | **J01–J26** · Every test discipline: functional, non-functional, black/white box, manual. |
| 15 | [`20-TRACK-K-OPERATIONS-GTM.md`](20-TRACK-K-OPERATIONS-GTM.md) | **K01–K19** · Billing, compliance, support, localisation, launch readiness. |
| 16 | [`21-TRACK-L-CODE-QUALITY.md`](21-TRACK-L-CODE-QUALITY.md) | **L01–L20** · Enforcing `CODE_STANDARDS.md`: size, complexity, test quality, agent legibility. |
| 17 | [`22-TRACK-M-PROVIDER-ADMIN-OS.md`](22-TRACK-M-PROVIDER-ADMIN-OS.md) | **M01–M46** · The Provider Admin OS — the control plane made operable, provider-plural and costed (plane 1, successor to C). |
| 18 | [`90-DEFECT-LOG.md`](90-DEFECT-LOG.md) | Living register of architecture-level defects and improvements found *during* execution. Append-only. |
| 19 | [`WORKLOG.md`](WORKLOG.md) | **Written by `scripts/start.mjs`, never by hand.** What is claimed, by whom, how far it got, and the evidence a phase was finished on. |
| 20 | `plan-manifest.json` | Machine-readable index of every phase ID. The integrity gate reads this. |
| 21 | [`E02-MODULE-BASELINE.md`](E02-MODULE-BASELINE.md) | **Generated by `scripts/score-all-modules.mjs`, never by hand.** All 46 modules scored against the E01 rubric with evidence; the priority input for E05-E28. |

**Track letter → plane**, so you can always tell whose blast radius you are in:

```
 A  cross-cutting foundation          (all planes)
 H  plane 0  public
 C  plane 1  control        ← provider staff; a bug here affects every tenant
 M  plane 1  control OS     ← the same blast radius, plus the estate itself
 D  plane 2  tenant admin
 E  plane 3  application
 F  plane 3/4 studio + published sites
 G  plane 4  developer
 B  clients (all planes) · I  clients · J  quality · K  operations · L  code quality
```

---

## 4. Where to start, on any given day

```bash
node scripts/start.mjs
```

That is the whole answer. It resolves the current wave, picks the lowest READY phase in it,
**claims it with a pushed commit so no other agent takes it**, and prints the work order. If you
already hold an unfinished phase it resumes that one instead and replays your progress notes,
because an agent that starts a second phase while holding a first is how work gets duplicated.

```bash
node scripts/start.mjs --who                 # what is in flight, and how stale
node scripts/start.mjs --dry-run             # decide and explain, claim nothing
node scripts/start.mjs --progress "…"        # before you stop. Always.
node scripts/start.mjs --finish --evidence-file ev.txt
node scripts/start.mjs --release "why blocked"
```

The manual path — read § 2 of the baseline, find the wave, pick a phase — still works and is
documented in `02-EXECUTION-GUIDELINES § 2`. But it has no lock, so two agents doing it at the same
moment collide. Prefer `start.mjs`.

Anything architectural you find on the way goes in `90-DEFECT-LOG.md` — filed, not fixed inline.

If nothing in the current wave is `READY`, the correct action is to make something `READY` by
completing its dependency — **not** to start a later wave because it is more interesting.
Track A is the one that is boring and the one that unblocks everything.

---

## 5. Mechanical protection of this plan

Documented rules are ignored. `ARCHITECTURE_REVIEW.md § F2` is the entire lesson: ten gates
existed, almost none could fail. So the rules in § 0 are enforced by
[`scripts/check-plan-integrity.mjs`](../../scripts/check-plan-integrity.mjs), which fails the
build when:

| Violation | How it is detected |
| :-------- | :----------------- |
| A phase ID vanished | Every ID in `plan-manifest.json` must still appear in its track file |
| A track file was truncated or regenerated | Line count may not drop below the manifest's recorded floor without a manifest amendment in the same commit |
| An undeclared file appeared in this folder | Directory listing is compared against § 3 / the manifest |
| A phase ID was duplicated or reused | IDs must be unique across all track files |
| A phase lost its exit criterion | Every phase row must retain a non-empty exit column |
| Phase count regressed | Total must be ≥ the manifest's `phaseFloor` |

Run it locally before committing anything in this folder:

```bash
node scripts/check-plan-integrity.mjs
```

`.github/CODEOWNERS` additionally requires review on this path. The gate is the real
protection; CODEOWNERS is the reminder.

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Folder established. 278 phases across 11 tracks. Baseline audited against the retired monorepo's successor polyrepo. | Claude Code |
| 2026-08-07 | **Track L added (L01–L20), 298 phases across 12 tracks.** `CODE_STANDARDS.md` was the one governance document the original plan under-used: its § 10 R13 lint rules had no phase (D018), its § 4 1,000-line ceiling is violated by 86 files (D017), and its § 8 prohibition on coverage-padding tests was written about a 23,285-line file still in the tree (D016). Registered per § 0 rule 1: § 3 table, `DECLARED` in the integrity gate, `TRACKS` in the brief generator, and the manifest, in one change. | Claude Code |
| 2026-08-07 | **Autonomous development protocol.** `scripts/start.mjs` + `WORKLOG.md` (declared file 18) make the claim a pushed git commit, so two agents cannot take the same phase — § 0 rule 6 and `02-EXECUTION-GUIDELINES § 4` asserted this and nothing enforced it. Adds resume-before-claim, stale-claim reset at 72h, and a `--finish` that refuses DONE over a red `verify.mjs` and requires an evidence transcript including the output when the change is deliberately broken. |
| 2026-08-07 | **Content gaps from the second review: E43–E47, C29, K19 → 305 phases.** Concurrency/idempotency and gapless statutory numbering (correctness concerns the 42 E phases assumed); AI model ops, guardrails and evaluation (the PRD's strategic differentiator had one line in a container phase); live tenant version upgrade; and cost per tenant, without which no plan can be shown to be profitable. |
| 2026-08-11 | **Track M added (M01–M46), 356 phases across 13 tracks.** Track C's exit criterion — *"every endpoint in `platform/v1` has a corresponding console surface"* — was satisfied by read-only surfaces: 132 route pages that render the estate and cannot change it (**D044**). Three mechanisms the brief's control plane requires are absent from the tree entirely, each measured: a provider registry (0 hits), desired-vs-actual state and reconciliation in plane 1 (0 relevant hits), and cost ingestion and allocation (0 hits) — so K19's cost-per-tenant requirement has no supplier. Track M is the successor to C, not a revision of it: no C phase is reopened and no C surface is rewritten. Registered per § 0 rule 1 in one commit — this § 3 table, `DECLARED` and `TRACK_FILES` in the integrity gate, `TRACKS` in the brief generator, the manifest via `--update`, and this reason. The nine `[A-L]` phase-ID regexes across the three scripts were widened to `[A-M]` in the same commit; rule 1 does not list them, and without them every Track M dependency parses as prose and `--ready` reports blocked phases as startable (**D045**). | Claude Code |
