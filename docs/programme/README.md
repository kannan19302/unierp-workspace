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
| 4b | [`04-V1-RELEASE-DEFINITION.md`](04-V1-RELEASE-DEFINITION.md) | **What v1.0 is, when it ships, the programme working order, and the go-live gate.** Holds no phase IDs. § 3 is the authority for which programme to open next. |
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
| 17b | [`30-PROGRAMME-2-DEVELOPER-PORTAL.md`](30-PROGRAMME-2-DEVELOPER-PORTAL.md) | **P2-001–P2-362** · Developer Portal (plane 4). |
| 17c | [`31-PROGRAMME-3-MARKETPLACE.md`](31-PROGRAMME-3-MARKETPLACE.md) | **P3-001–P3-330** · Marketplace: catalogue, review, commerce, entitlement, payouts. |
| 17d | [`32-PROGRAMME-4-TENANT-APPS.md`](32-PROGRAMME-4-TENANT-APPS.md) | **P4-001–P4-370** · The ERP itself (plane 3) — the depth pass over Track E's breadth pass. |
| 17e | [`33-PROGRAMME-5-WEBSITE-BUILDER.md`](33-PROGRAMME-5-WEBSITE-BUILDER.md) | **P5-001–P5-330** · Tenant Website Builder, split out of the tenant app into its own platform. |
| 17f | [`34-PROGRAMME-6-TENANT-ADMIN-CONSOLE.md`](34-PROGRAMME-6-TENANT-ADMIN-CONSOLE.md) | **P6-001–P6-320** · Tenant Admin Console (plane 2) — the full SaaS management portal. |
| 17g | [`35-PROGRAMME-7-MARKETING-SITE.md`](35-PROGRAMME-7-MARKETING-SITE.md) | **P7-001–P7-316** · unierp.com and its admin console (plane 0). |
| 17h | [`36-PROGRAMME-8-PLATFORM-ADMIN-OS.md`](36-PROGRAMME-8-PLATFORM-ADMIN-OS.md) | **P8-001–P8-314** · Platform Admin OS (plane 1) — estate, reconciliation, release, cost. |
| 17i | [`37-PROGRAMME-9-WEB-CLIENT.md`](37-PROGRAMME-9-WEB-CLIENT.md) | **P9-001–P9-306** · The web client *platform* — the runtime the 903 pages sit on. |
| 17j | [`38-PROGRAMME-10-MOBILE.md`](38-PROGRAMME-10-MOBILE.md) | **P10-001–P10-312** · Android and iOS, offline-first. |
| 17k | [`39-PROGRAMME-11-DESKTOP.md`](39-PROGRAMME-11-DESKTOP.md) | **P11-001–P11-312** · Windows, macOS and Linux. Greenfield — no desktop code exists today. |
| 17l | [`40-PROGRAMME-12-PLATFORM-CORE.md`](40-PROGRAMME-12-PLATFORM-CORE.md) | **P12-001–P12-330** · The server-side platform: identity provider, contracts, data layer, kernel, sandbox. Owns the 21 repositories no programme claimed. |
| 17m | [`41-PROGRAMME-13-INTEGRATION-RELEASE.md`](41-PROGRAMME-13-INTEGRATION-RELEASE.md) | **P13-001–P13-330** · Cross-programme integration, the journey register (every persona × domain), and the v1.0 release. Runs throughout, not at the end. |
| 17n | [`42-PROGRAMME-14-DEVELOPMENT-HARNESS.md`](42-PROGRAMME-14-DEVELOPMENT-HARNESS.md) | **P14-001–P14-280** · The Development Harness: start.mjs, phase-brief.mjs, verification gates, worktree and autonomous protocol evolution. |
| 17o | [`43-PROGRAMME-15-TENANT-SITES.md`](43-PROGRAMME-15-TENANT-SITES.md) | **P15-001–P15-200** · Tenant Sites (Platform 4). |
| 17p | [`44-PROGRAMME-16-WEB-STUDIO.md`](44-PROGRAMME-16-WEB-STUDIO.md) | **P16-001–P16-200** · Web Studio (Platform 5). |
| 17q | [`45-PROGRAMME-17-TENANT-ADMIN.md`](45-PROGRAMME-17-TENANT-ADMIN.md) | **P17-001–P17-200** · Tenant Admin (Platform 6). |
| 17r | [`46-PROGRAMME-18-MARKETPLACE.md`](46-PROGRAMME-18-MARKETPLACE.md) | **P18-001–P18-200** · Marketplace (Platform 7). |
| 17s | [`47-PROGRAMME-19-PROVIDER-OS.md`](47-PROGRAMME-19-PROVIDER-OS.md) | **P19-001–P19-200** · Provider Admin OS (Platform 2). |
| 17t | [`48-PROGRAMME-20-MOBILE-PLATFORM.md`](48-PROGRAMME-20-MOBILE-PLATFORM.md) | **P20-001–P20-200** · Mobile Platform (Platform 9). |
| 17u | [`49-PROGRAMME-21-REVENUE-BILLING.md`](49-PROGRAMME-21-REVENUE-BILLING.md) | **P21-001–P21-200** · Revenue & Billing (Global). |
| 18 | [`90-DEFECT-LOG.md`](90-DEFECT-LOG.md) | Living register of architecture-level defects and improvements found *during* execution. Append-only. |
| 19 | [`WORKLOG.md`](WORKLOG.md) | **Written by `scripts/start.mjs`, never by hand.** What is claimed, by whom, how far it got, and the evidence a phase was finished on. |
| 20 | `plan-manifest.json` | Machine-readable index of every phase ID. The integrity gate reads this. |
| 20c | `programme-claims.json` | **P12-001.** Which programme owns which repository and who may contribute to it. Gated by `scripts/check-programme-claim.mjs`: an unowned repository fails CI. |
| 20d | `P12-002-CENSUS.json` | **Generated by `scripts/check-unowned-code-census.mjs`, never by hand.** Machine-readable census profile for all claimed repositories. |
| 20e | [`P12-002-CENSUS.md`](P12-002-CENSUS.md) | **Generated by `scripts/check-unowned-code-census.mjs`, never by hand.** Measured profile and consumer graph for all claimed repositories. |
| 20f | `breaking-changes-registry.json` | **P12-003.** Declared breaking changes, deprecation windows and enumerated consumers. Gated by `scripts/check-breaking-changes.mjs`. |
| 20g | `orphaned-defect-routing.json` | **P12-004.** Every defect finding in a claimed repository routed to an owning phase. Gated by `scripts/check-orphaned-defects.mjs`. |
| 20h | `p12-preconditions.json` | **P12-005.** External runtime preconditions and graceful degradation strategies for Programme 12. Gated by `scripts/check-runtime-preconditions.mjs`. |
| 20i | `P12-006-DEPENDENCY-GRAPH.json` | **Generated by `scripts/generate-dependency-graph.mjs`, never by hand.** Machine-readable dependency graph dataset and acyclicity verification. |
| 20j | [`P12-006-DEPENDENCY-GRAPH.md`](P12-006-DEPENDENCY-GRAPH.md) | **Generated by `scripts/generate-dependency-graph.mjs`, never by hand.** Derived repository dependency matrix, layer distribution and acyclicity proof. |
| 20k | `P12-007-CONSUMER-REGISTRY.json` | **Generated by `scripts/check-consumer-registry.mjs`, never by hand.** Mechanical consumer index answering 'Who uses this?' for every symbol, contract and event. |
| 20l | [`P12-007-CONSUMER-REGISTRY.md`](P12-007-CONSUMER-REGISTRY.md) | **Generated by `scripts/check-consumer-registry.mjs`, never by hand.** Derived provider libraries, exported symbols and active cross-programme consumers. |
| 20m | `dependency-governance-policy.json` | **P12-012.** Allowlisted dependencies, licence checks, and banned vulnerable packages with advisories named. Gated by `scripts/check-dependency-governance.mjs`. |
| 20n | `P12-013-SBOM.json` | **Generated by `scripts/check-supply-chain.mjs`, never by hand.** CycloneDX 1.5 Software Bill of Materials (SBOM) and provenance attestations for all published packages. |
| 20o | [`PUBLIC-API-CONTRACTS.md`](PUBLIC-API-CONTRACTS.md) | **P12-023. Generated by `scripts/generate-contracts-docs.mjs`, never by hand.** Public API contracts and types documentation generated directly from `@kannan19302/contracts` (L0) source. |
| 20p | `remediation-backlog.json` | **P12-024.** Prioritised and tracked remediation backlog routing all measured defect classes to owning phases in Programme 12. Gated by `scripts/check-remediation-backlog.mjs`. |
| 20q | `P12-026-SCHEMA-MEASUREMENT.json` | **Generated by `scripts/measure-schema.mjs`, never by hand.** Complete schema metrics dataset (models, fields, relations, indexes, enums, file breakdown). |
| 20r | [`P12-026-SCHEMA-MEASUREMENT.md`](P12-026-SCHEMA-MEASUREMENT.md) | **Generated by `scripts/measure-schema.mjs`, never by hand.** Formatted schema measurement table and metrics profile. |
| 20s | `P12-028-RLS-POLICIES.sql` | **P12-028. Generated by `scripts/generate-rls-policies.mjs`, never by hand.** Mechanically derived idempotent PostgreSQL Row Level Security (RLS) policies for all tenant models. |
| 20b | `exit-criteria-baseline.json` | **Generated by `scripts/check-exit-criteria.mjs --update-baseline`, never by hand.** The ratchet of phases whose exit criterion carries no falsifiable signal. May shrink freely; grows only deliberately. |
| 21 | [`E02-MODULE-BASELINE.md`](E02-MODULE-BASELINE.md) | **Generated by `scripts/score-all-modules.mjs`, never by hand.** All 46 modules scored against the E01 rubric with evidence; the priority input for E05-E28. |
| 22 | [`E04-CROSS-MODULE-GAP-BACKLOG.md`](E04-CROSS-MODULE-GAP-BACKLOG.md) | **Generated by `scripts/build-cross-module-gap-backlog.mjs`, never by hand.** Recurring rubric-row gaps routed to their shared-capability phase (E05/E06/E07/E30) instead of 46 duplicated fixes. |
| 23 | [`L11-COVERAGE-PADDING-INVENTORY.md`](L11-COVERAGE-PADDING-INVENTORY.md) | **Generated by `scripts/inventory-coverage-padding.mjs`, never by hand.** Per-file always-passing test counts across the 67 `*.coverage.spec.ts` files (D016). |
| 24 | [`L10-EXEMPTION-LIST.md`](L10-EXEMPTION-LIST.md) | **Generated by `scripts/check-1000-line-ceiling.mjs`, never by hand.** Every non-generated file over 1,000 lines, individually justified (D017). |

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
 P2 plane 4  developer   · P3 marketplace   · P4  plane 3 ERP    · P5  sites
 P6 plane 2  tenant admin · P7 plane 0 public · P8 plane 1 admin OS
 P9 web client · P10 mobile · P11 desktop
 P12 the server-side platform every programme above consumes
 P13 the seams between them, and the release
 P14 development harness
 P15 tenant sites · P16 web studio · P17 tenant admin · P18 marketplace
 P19 provider OS · P20 mobile platform · P21 revenue & billing
```

**Programmes.** Tracks A–M are **Programme 1**. From `30-` onwards each document is a whole
platform planned end to end as its own programme, with its own waves and its own phase-ID range —
thirteen programmes, **4,571 phases**. They never mix: `start.mjs` without `--programme` behaves exactly
as it always has, and `--programme <n>` scopes both wave resolution and phase selection, so two
agents on two programmes can never contend for a phase or a wave.

**Cross-programme dependencies are forbidden in a `Depends` cell.** Not because the relationships do
not exist — they plainly do — but because one would make a programme unable to start until another
moves, which is the coupling the separation exists to prevent. Each programme discharges its real
preconditions with a **runtime precondition gate** (`P2-004`, `P3-004`, `P4-004`, …) that asserts
each external capability at startup and in CI and degrades the dependent surface explicitly. The
consequence is deliberate: **every programme is executable against a partially finished Programme 1
and against partially finished siblings.**

Two programmes share a repository, so their boundary is enforced rather than described: `P9-002`
holds the ownership map between Programme 4 (what the screens mean) and Programme 9 (the platform
they run on), and a commit crossing it in the wrong direction fails CI.

**Which programme to open next is decided by `04-V1-RELEASE-DEFINITION.md § 3`, not by preference.**
Programme 12 owns what everything else consumes, so it is early; Programme 13 runs throughout,
because integration saved for the end is integration discovered expensively.

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
| 2026-08-14 | **Programme 14 added (P14-001–P14-280), the Development Harness — 4,571 phases across 26 tracks.** The fourth structural gap, found by asking what owns the machine rather than what owns the product. Measured on establishment: **no phase owned the harness's evolution** (only `A27`/`A28`, both DONE, and `P12-202` touch it) while it will dispatch the remaining 4,041 phases; **zero tests over 1,820 lines**; **33 of 194 finished phases — 17 % — finished over a red gate**, with **none of those overrides reviewed** because no review mechanism exists; **7 claims showing DONE with zero progress notes at 150 h**; and **all three known harness defects (D045, D149, D150) found by accident**. The charter is `start.mjs`'s own sentence — *"it makes the claim auditable, not true"* — which is worth nothing unless somebody audits, so `P14-278` re-runs the exit criteria of a risk-weighted sample of already-DONE phases and publishes the pass rate, with a rate below threshold blocking rather than being footnoted. `P14-168` holds the line that automation may never widen what a single agent may assert: the batch runner cannot override a gate, soften a criterion or finish without evidence. What is explicitly *not* in question is the claim protocol — four agents ran concurrently across four worktrees while this document was written, taking P12-001 through P12-008 with zero collisions, which is `A27`/`A28` working as designed; Stage B-II hardens it rather than replacing it. Two defects in this document's own drafting were caught by its own gates before commit: 30 phases declared in a wave but never defined (the D150 shape, third occurrence), and 25 exit criteria with no falsifiable signal, which were strengthened rather than baselined. | Claude Code |
| 2026-08-14 | **Journey register, exit-criterion ratchet, and code standards in every brief — 4,291 phases.** Four checks were asked for and each was measured rather than assumed. **(1) Journey coverage was the real gap.** Capability coverage is comprehensive — Programme 4 alone spans finance, controlling, order-to-cash, procure-to-pay, inventory, manufacturing, HCM, projects and service, verticals and the close — but `grep` found only **ten** enumerated end-to-end journeys across the whole plan, against ~14 business domains, four principal types, dozens of roles and eight verticals. **Stage G of Programme 13 (P13-251–P13-330)** adds the journey *register*: personas, roles and journeys declared as data, with `P13-329` failing when a shipped capability has no journey or a registered journey has no test — a register with a gate answers "did we cover every role?" by command, which a longer list never could. `P13-330` is the single continuous arc the brief asked for: stranger → tenant → running finance, sales, inventory and HR → building and publishing a full-stack application on that same tenant. **(2) Exit criteria** are strengthened by mechanism rather than by rewriting 4,291 rows into boilerplate: `02-EXECUTION-GUIDELINES § 3` now states that a row's criterion is a **floor, never a ceiling** — the universal checklist is the rest of it, and a narrow criterion is never grounds for skipping isolation, accessibility, coverage or standards — and `scripts/check-exit-criteria.mjs` lints falsifiability as a **ratchet** against a 350-phase baseline, wired into `verify.mjs`. It caught three of this change's own new criteria, which were strengthened rather than baselined. The lint's first version reported 733 vacuous criteria; inspection showed almost all were false positives from a detector biased toward *proof* language and blind to *outcome* language ("an expired override reverts automatically"), so an `outcome` signal was added before the number was believed — reporting 733 would have been a worse defect than the one being looked for. **(3) Code standards** now appear in every generated brief, naming the fourteen real `check-*.mjs` gates rather than gesturing at a document, with the D013 warning attached: a gate wired into 21 repositories whose script existed in none had never run once. | Claude Code |
| 2026-08-14 | **Programmes 12 and 13 added, plus `04-V1-RELEASE-DEFINITION.md` — 4,201 phases across 25 tracks.** Three gaps were found by reviewing the ten platform programmes against reality rather than against each other, and all three were structural rather than local. **First**, cross-referencing every repository against every programme document found **21 of 29 repositories named by no programme at all** — including `unierp-idp` (407 files), `unierp-contracts` (the source every client is generated from), `unierp-data` and the extension sandbox. Every programme consumed them; none evolved them, and `D001`, `D008` and `D148` were filed against code with no owner to fix it. **Programme 12** owns them, and `P12-329` re-runs the coverage check that found the gap so it cannot reopen. **Second**, `grep` found **zero cross-programme integration phases across twelve documents and 3,961 phases** — not an error in any programme, since each was correct inside its boundary, but the cost of the independence that makes them separately executable: a precondition gate proves a capability is *present*, never that it is *correct for its consumer*. **Programme 13** owns the seams and the release, and runs throughout rather than at the end. **Third**, the plan had no definition of v1.0. `04-V1-RELEASE-DEFINITION.md` records the maintainer's decision that v1.0 ships only when every phase is DONE — with the rejected alternative and the standing risk of the decision stated in the open, per § 0 rule 4's spirit — and its § 3 is now the authority for which programme an agent opens next. Registered per § 0 rule 1 in one change. `AGENTS.md § 0`, `§ 2a` and the `run-phase` skill were updated in the same change, because guidance that still described 310 phases across 20 documents would have sent every future agent to the wrong interface. | Claude Code |
| 2026-08-14 | **Programmes 3–11 added (P3–P11), 3,631 phases across 23 tracks.** The remaining nine of the ten platforms, each planned end to end as its own programme: Marketplace (330), the ERP (370), Website Builder (330), Tenant Admin Console (320), Marketing Site (316), Platform Admin OS (314), Web Client Platform (306), Mobile (312), Desktop (312). Registered per § 0 rule 1 in one change — this § 3 table, § 3's plane map and programme note, `DECLARED` and `TRACK_FILES` in the integrity gate, `TRACKS` in the brief generator, `PROGRAMMES` in `start.mjs`, the manifest via `--update`, and this reason. The ID shape in `scripts/lib/programme-ids.mjs` was widened from `P[2-9]` to `P\d{1,2}` and `trackOf` now splits on the hyphen rather than by fixed width, because slicing two characters buckets `P10-007` as `"P1"` and silently merges two programmes. **Each programme begins by measuring rather than assuming**, because in every case a predecessor track's status was easy to misread: Track E is 44/47 but 903 route pages is a count of pages not of working features (`P4-002` re-scores all 45 modules); Track D is 22/22 but that was one track among thirteen, not a complete SaaS console (`P6-002`); Track M is 46/49 but **D044** — read-only surfaces satisfying an exit criterion — is the defect that plane keeps producing (`P8-002` re-measures all 139 console pages for actionability); Track H shipped the H03 claim gate, whose *actual* coverage `P7-002` measures before `P7-030` extends it. Two starting positions are stated plainly rather than dressed up: Track F is 0/26, so Programme 5's split of Studio into its own platform is made at the cheapest moment it will ever be available; and **there is no desktop code anywhere in the family**, so Programme 11 is written as genuine greenfield with its technology decision (`P11-002`) made first and in the open. | Claude Code |
| 2026-08-14 | **Programme 2 added (P2-001–P2-362), 721 phases.** The Developer Portal, planned end to end as its own programme rather than as more Track G phases: G01–G30 remain the bridgehead and are not reopened. Registered per § 0 rule 1 in one commit — this § 3 table, § 3's plane map, `DECLARED` and `TRACK_FILES` in the integrity gate, `TRACKS` in the brief generator, the manifest via `--update`, and this reason. Two structural changes were required and are the point of the entry. First, the phase-ID shape now lives in `scripts/lib/programme-ids.mjs` and the three scripts import it: widening nine `[A-M]` regexes by hand is what produced **D045**, and a second ID shape would have been a second occurrence. Second, `start.mjs --programme <n>` scopes wave resolution *and* phase selection, so two agents on two programmes cannot contend for a phase or a wave — that mechanism, not the separate file, is what makes a platform separately executable. Programme 2 numbers phases with three digits because a two-digit field cannot hold 300+; Programme 1's IDs are untouched and stay two-digit permanently. | Claude Code |
| 2026-08-11 | **Track M added (M01–M46), 356 phases across 13 tracks.** Track C's exit criterion — *"every endpoint in `platform/v1` has a corresponding console surface"* — was satisfied by read-only surfaces: 132 route pages that render the estate and cannot change it (**D044**). Three mechanisms the brief's control plane requires are absent from the tree entirely, each measured: a provider registry (0 hits), desired-vs-actual state and reconciliation in plane 1 (0 relevant hits), and cost ingestion and allocation (0 hits) — so K19's cost-per-tenant requirement has no supplier. Track M is the successor to C, not a revision of it: no C phase is reopened and no C surface is rewritten. Registered per § 0 rule 1 in one commit — this § 3 table, `DECLARED` and `TRACK_FILES` in the integrity gate, `TRACKS` in the brief generator, the manifest via `--update`, and this reason. The nine `[A-L]` phase-ID regexes across the three scripts were widened to `[A-M]` in the same commit; rule 1 does not list them, and without them every Track M dependency parses as prose and `--ready` reports blocked phases as startable (**D045**). | Claude Code |
