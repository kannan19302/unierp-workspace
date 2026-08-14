# PROGRAMME 14 · THE DEVELOPMENT HARNESS — P14-001–P14-280

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 14` resolves waves from this
> document and can only ever hand out a `P14-` phase.

---

## 0. Why this programme exists

Every other programme builds the product. **This one builds the machine that builds the product**,
and until now nobody owned it.

The harness — `start.mjs`, `phase-brief.mjs`, `check-plan-integrity.mjs`, `worktree.mjs`, the gate
scripts and the worklog protocol — will dispatch the remaining **4,041 phases**. It is the most-used
software in the family. It was measured on 2026-08-14 and the findings are the charter:

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Phases owning the harness's evolution | **0** | `grep` over every programme document; only `A27`/`A28` (both DONE) and `P12-202` touch it |
| Tests covering the harness | **0** | `ls scripts/**/*.test.*` |
| Lines of harness code | **1,820** | `wc -l` over the four core scripts |
| Phases finished over a red gate | **33 of 194 — 17 %** | parsing `FINISH` blocks in `docs/programme/worklog/` |
| Overrides reviewed | **0** | there is no review mechanism |
| Claims showing DONE with zero progress notes, 150 h stale | **7** | `start.mjs --who` |
| Harness defects found deliberately | **0 of 3** | D045, D149, D150 were each found by accident |

**The invariant this programme establishes:**

> **A completion means what it claims.** The harness that records 4,291 DONE ticks is itself tested,
> measured and audited — so a green plan is evidence rather than an assertion.

`P14-278` is the mechanical proof: a sample of phases already marked DONE has its exit criteria
**re-run independently**, and the pass rate is published.

### The reasoning, stated plainly

`start.mjs`'s own header is the honest description of the ceiling this programme exists to raise:

> *"It cannot tell a real transcript from a fabricated one. **It makes the claim auditable, not
> true.**"*

Auditable is only worth something if somebody audits. 194 phases are DONE on self-reported evidence
and 33 of them rest on overrides recorded "for review" that nobody has read. That is not an
accusation against any agent — it is a structural property of a system with no audit step, and it
gets worse linearly with every phase completed.

Meanwhile `verify.mjs`'s own header already names the failure mode the override rate points at:

> *"A gate everyone routinely overrides has stopped being a gate."*

**What is genuinely working, and is not in question:** the claim protocol. Four agents ran
concurrently across `unierp-workspace` and `unierp-loop-a/b/c` while this document was being
written, taking `P12-001` through `P12-008` with **zero collisions**. `A27` and `A28` earned that.
This programme hardens what works and closes what does not.

**Reference set.** Google's release engineering and SRE practice (toil measurement, error budgets,
the discipline that a control nobody trusts is worse than none), Bazel and Nix (reproducible,
verifiable build state), Jepsen (adversarial verification of distributed claims — the model for
`P14-278`), `git bisect` and mutation testing (proving a test can fail), Kubernetes controllers
(reconciliation over state), and the audit-sampling practice of financial assurance, which exists
precisely because self-reported completion at scale is not evidence.

---

## 1. What this programme owns

| Surface | What |
| :------ | :--- |
| **ADP** | `start.mjs`, `phase-brief.mjs`, the claim protocol, the worklog |
| **Plan gates** | `check-plan-integrity.mjs`, `check-exit-criteria.mjs`, `check-programme-claim.mjs` |
| **Parallelism** | `worktree.mjs`, the claim branch, cross-repo work registry |
| **Evidence** | the transcript format, its audit, and the re-verification sampler |
| **Orchestration** | the batch runner, scheduling, retry, and stop conditions |
| **Measurement** | throughput, override rate, rework rate, blocked-phase age, context budget |

It does **not** own product code. `P14-002` enforces that boundary: a P14 commit touching an
application repository fails CI.

---

## 2. Principles

| # | Principle | Enforced by |
| :- | :-------- | :---------- |
| **HP-1** | **The harness is production software.** It gets the standards it imposes: tests, coverage, review, no suppressions. | `P14-025` |
| **HP-2** | **A gate that is routinely overridden is a defect in the gate or in the plan — never a fact of life.** | `P14-134` |
| **HP-3** | **Evidence is sampled and re-verified.** Auditable means audited. | `P14-091`, `P14-278` |
| **HP-4** | **The harness measures itself.** Throughput, rework and override rate are data, not impressions. | `P14-221` |
| **HP-5** | **Automation never widens what a single agent may assert.** A batch runner may not weaken a gate to keep moving. | `P14-168` |
| **HP-6** | **Every harness failure becomes a test.** D045, D149 and D150 were found by accident; none may recur silently. | `P14-030` |
| **HP-7** | **An agent's context is a budget.** A brief that does not fit a session produces work that contradicts itself. | `P14-196` |

---

## 3. Waves

### Wave 0 · "Measure the machine"
**Phases:** P14-001–P14-024 · Ownership, boundary, the harness census, and the metrics baseline.

### Wave 1 · "The harness is tested software"
**Phases:** P14-025–P14-090 · Tests, regression suite for every past harness defect, and the claim protocol under adversarial concurrency.

### Wave 2 · "Evidence means something"
**Phases:** P14-091–P14-160 · Evidence integrity, the re-verification sampler, gate health, and override governance.

### Wave 3 · "Orchestration"
**Phases:** P14-161–P14-220 · The batch runner, scheduling, and agent ergonomics.

### Wave 4 · "The harness observes itself"
**Phases:** P14-221–P14-265 · Metrics, resilience and recovery.

### Wave 5 · "Proof"
**Phases:** P14-266–P14-280 · The audit proof and launch readiness.

---

## 4. Stage A · Ownership and measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-001** | Programme charter | — | A manifest declaring the harness surfaces in § 1 as this programme's, added to `programme-claims.json` | A P14 phase writing outside the declared harness surfaces fails `check-programme-claim.mjs`, proven on a seeded example | OPEN |
| **P14-002** | The harness / product boundary | P14-001 | The enforced rule that this programme changes tooling, never application code | A P14 commit touching an application repository fails CI, proven on a seeded commit | OPEN |
| **P14-003** | The harness census | P14-001 | Every harness script measured: lines, entry points, callers, test coverage, last change, and whether anything exercises it | The census is reproducible by command. A harness script exercised by nothing is reported | OPEN |
| **P14-004** | Harness dependency map | P14-003 | Which gate runs where — `verify.mjs`, CI workflows, pre-push, ADP — and which run in only one | A gate present in CI but absent from `verify.mjs`, or the reverse, is reported. This is the divergence `ROADMAP.md` already names | OPEN |
| **P14-005** | Gate existence verification | P14-004 | Every gate referenced by any workflow or script proven to exist and execute | A referenced script that does not exist fails CI — D013's permanent closure, checked from the caller's side | OPEN |
| **P14-006** | The metrics baseline | P14-003 | The starting numbers recorded: 17 % override rate, 0 % harness coverage, 0 audits, 7 stale claims, blocked-phase ages | Every metric is reproducible by command and stored as the baseline every later phase ratchets against | OPEN |
| **P14-007** | Worklog integrity | P14-006 | The worklog parsed, validated, and checked for contradictions against the plan's own status columns | A phase DONE in the plan with no FINISH block, or a FINISH block with no DONE, is reported. Both currently exist | OPEN |
| **P14-008** | Stale and inconsistent claim detection | P14-007 | The 7 claims showing DONE with zero progress notes at 150 h resolved, and detection made continuous | A claim inconsistent with its plan status is reported within its review window; the seven are individually resolved or explained | OPEN |
| **P14-009** | Harness change control | P14-002 | Review requirements for harness changes proportionate to blast radius — a change here affects every programme | A harness change landing without its declared review is impossible, proven by test | OPEN |
| **P14-010** | Harness versioning | P14-009 | The harness versioned, so a plan state records which harness produced it | Every FINISH block records the harness version that wrote it; a version-less block is reported | OPEN |
| **P14-011** | Harness documentation | P14-003 | `AGENTS.md`, the `run-phase` skill and `02-EXECUTION-GUIDELINES` verified against actual harness behaviour | A documented flag, command or behaviour that does not exist fails a gate. Both drifted to "310 phases across 20 documents" before this was checked | OPEN |
| **P14-012** | Error message quality | P14-003 | Every harness failure message states what failed, why it matters, and the next action | A failure path with no stated remedy is reported. D149's original message printed 4.3 MB of JSON as its explanation | OPEN |
| **P14-013** | Harness output discipline | P14-012 | Bounded output on every path — no unbounded payload printed as a diagnostic | A harness path capable of printing more than the stated limit fails a test, proven by seeding a large input | OPEN |
| **P14-014** | Exit-code discipline | P14-012 | Every harness script's exit codes defined and tested, including the spawn-error paths | A script returning an undefined exit code fails its test. ENOBUFS surfaces via `error`, not status — the D149 lesson | OPEN |
| **P14-015** | Harness configuration | P14-010 | Thresholds, windows and limits expressed as reviewable configuration rather than scattered constants | A hardcoded threshold in harness logic fails a gate, proven on a seeded constant | OPEN |
| **P14-016** | Harness scalability model | P14-006 | Declared limits: plan size, worklog size, agent count, and what happens at each | Each declared limit has a test that reaches it. D149 was the plan outgrowing an undeclared limit | OPEN |
| **P14-017** | Plan read performance | P14-016 | The plan read path measured and bounded as the plan grows | Plan read stays within budget at twice the current phase count, measured | OPEN |
| **P14-018** | Targeted plan queries | P14-017 | Reading one phase without materialising the whole plan | A single-phase query does not read the whole plan, verified by measurement | OPEN |
| **P14-019** | Worklog growth management | P14-007 | Retention, rotation and query performance for a worklog that will hold 4,291 finish records | Worklog query stays within budget at projected full size, measured | OPEN |
| **P14-020** | Harness test infrastructure | P14-003 | The substrate: a temporary plan fixture, a fake git remote, clock control and process-failure injection | A harness test is writable without touching the real plan or the real remote. The infrastructure has its own tests | OPEN |
| **P14-021** | Harness CI | P14-020 | The harness's own tests running on every change to it | A harness change with failing harness tests cannot land, proven on a seeded break | OPEN |
| **P14-022** | Harness coverage that can fail | P14-021 | Coverage over the harness with real thresholds and a ratchet from the 0 % baseline | Deleting a harness test lowers the number and fails the gate; the threshold has been proven to fail | OPEN |
| **P14-023** | Harness remediation backlog | P14-003 | The census turned into a prioritised backlog routed to this programme's phases | Every measured deficiency is routed to a phase; an unrouted one fails the gate | OPEN |
| **P14-024** | D151 resolution | P14-005 | The `if: hashFiles(...)` guard in `reusable-ci.yml` resolved — the guard removed or the step made unconditional with a justified skip | `verify.mjs` is green family-wide on that gate. The `# justified:` escape is not used, because using it would be defanging a gate | OPEN |

---

## 5. Stage B · The harness as tested software (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-025** | Harness quality standard | P14-022 | The HP-1 mechanism: the harness held to the standards it imposes — coverage, complexity, no suppressions, typed errors | The harness passes every `check-*.mjs` gate it enforces on others. An exemption for the harness itself fails review | OPEN |
| **P14-026** | Phase-ID parsing tests | P14-020 | Tests for `programme-ids.mjs` across both ID shapes, ranges, prose rejection and every track key | Every shape and edge case is covered; a deliberately altered pattern is caught. D045 was a drifted regex nobody tested | OPEN |
| **P14-027** | Plan parser tests | P14-026 | Tests for phase-row parsing across every column layout in use — Track A's Repos, Track E's Modules, the programme layout | A layout that parses today and breaks tomorrow is caught by test, not by an agent | OPEN |
| **P14-028** | Dependency-graph tests | P14-027 | Tests for dependency resolution, ranges, cycles and cross-programme rejection | A cycle, a prose dependency and a cross-programme dependency are each detected by test | OPEN |
| **P14-029** | Wave-resolution tests | P14-028 | Tests for wave parsing, current-wave selection, parallel fallback and the unwaved-phase check | A phase in no wave is caught by test — D150's permanent closure | OPEN |
| **P14-030** | The harness regression suite | P14-029 | The HP-6 mechanism: every past harness defect retained as a test that fails without its fix | D045, D149, D150 and D151 each have a test. Reintroducing any one fails CI, proven by reintroducing each | OPEN |
| **P14-031** | Buffer and large-input tests | P14-016 | Tests driving every harness path with inputs beyond current size | An input beyond a declared limit produces the declared error, never a truncated success — D149's closure | OPEN |
| **P14-032** | Status transition tests | P14-027 | Tests for every phase status transition, valid and invalid | An invalid transition is refused by test. A status written outside the allowed set is caught | OPEN |
| **P14-033** | Manifest and ratchet tests | P14-027 | Tests for the manifest, the line floors, the exit-criteria baseline and their update paths | A ratchet that can be lowered without a deliberate act is caught by test | OPEN |
| **P14-034** | Gate self-tests | P14-030 | Every plan gate proven able to fail, mechanically, on every run rather than by hand | A gate that cannot be made to fail is itself a failure, reported by name | OPEN |
| **P14-035** | `prove-gates` extension | P14-034 | The existing break-it suite extended to every harness gate | Every gate appears in the suite; one that does not fails the coverage check | OPEN |
| **P14-036** | Brief generation tests | P14-027 | Tests that a generated brief is complete: phase, deps, exit, invariants, DoD, standards, anti-patterns | A brief missing a required section fails by test. The code-standards block was absent for months | OPEN |
| **P14-037** | Brief accuracy tests | P14-036 | Tests that a brief's quoted content matches its source documents | A brief quoting stale content is caught, not discovered by an agent acting on it | OPEN |
| **P14-038** | Worklog format tests | P14-007 | Tests for writing and parsing worklog blocks, including malformed and partial ones | A malformed block is detected rather than silently skipped by the parser | OPEN |
| **P14-039** | Evidence format validation | P14-038 | The declared evidence transcript structure, validated at `--finish` | Evidence missing the deliberate-break section is refused; length alone is not a proxy for content | OPEN |
| **P14-040** | Git interaction tests | P14-020 | Tests for every git operation against a fake remote: commit, push, rejection, rebase, ref plumbing | A push rejection is handled correctly by test, including the retry path | OPEN |
| **P14-041** | Filesystem interaction tests | P14-020 | Tests for path handling across platforms, including Windows separators and spaces | A path with a separator or a space is handled identically on every supported platform | OPEN |
| **P14-042** | Cross-platform harness verification | P14-041 | The harness verified on the platforms agents actually run on | The harness passes its suite on every supported platform in CI | OPEN |
| **P14-043** | Idempotency of harness operations | P14-040 | Every harness operation safe to repeat: claim, progress, finish, release | Running any operation twice produces one effect, proven per operation | OPEN |
| **P14-044** | Partial-failure handling | P14-043 | Correct state when a harness operation fails midway — after status write, before push | Every interruption point leaves a recoverable state, proven by injection at each | OPEN |
| **P14-045** | Harness recovery from bad state | P14-044 | Detecting and repairing an inconsistent plan or worklog state | Each seeded inconsistency is detected and repairable, proven per class | OPEN |
| **P14-046** | Concurrent plan writes | P14-040 | Two agents writing plan state simultaneously | Concurrent finishes do not corrupt the plan, proven under parallel execution | OPEN |
| **P14-047** | Worklog merge safety | P14-046 | The per-agent worklog files verified never to conflict | 100 concurrent journal writes merge without conflict, proven by test | OPEN |
| **P14-048** | Plan-file conflict behaviour | P14-046 | Behaviour when two agents must touch the same track file | A conflict blocks rather than merges, per README § 0 rule 6, proven by test | OPEN |
| **P14-049** | Harness performance budget | P14-017 | Budgets for claim, brief generation, finish and status | Each operation meets budget at full plan size, measured | OPEN |
| **P14-050** | Harness startup cost | P14-049 | The cost an agent pays before doing any work, measured and bounded | Time from invocation to printed brief stays within budget, measured | OPEN |
| **P14-051** | Harness dependency governance | P14-025 | The harness's own dependencies minimal, pinned and scanned | A new harness dependency requires justification; a vulnerable one fails the build | OPEN |
| **P14-052** | Harness security review | P14-025 | Review of the harness's own attack surface: command construction, path handling, git argument injection | A crafted phase ID or branch name cannot inject a command, proven by an injection suite | OPEN |
| **P14-053** | Harness secret handling | P14-052 | No credential or token reachable from harness code or its logs | A scan of harness output finds zero secrets, run continuously | OPEN |
| **P14-054** | Harness audit trail | P14-010 | Every harness action attributable to an agent, a version and a time | Any plan state change is attributable from the record alone | OPEN |
| **P14-055** | Harness mutation testing | P14-034 | Mutation testing on the claim, gate and status paths | Surviving mutants on critical paths are below threshold; a weakened test is detected | OPEN |
| **P14-056** | Harness complexity limits | P14-025 | Size and complexity ceilings applied to the harness itself | `start.mjs` at 848 lines is measured against the ceiling and decomposed or exempted with a stated reason | OPEN |
| **P14-057** | Harness decomposition | P14-056 | The harness split into testable units where the census shows it is warranted | Each unit is independently testable; a unit reachable only through the whole script is reported | OPEN |
| **P14-058** | Backwards compatibility of plan state | P14-010 | An older harness reading newer plan state, and the reverse, within a declared window | A version-skewed harness reports the skew rather than corrupting state, proven by test | OPEN |
| **P14-059** | Harness upgrade path | P14-058 | Upgrading the harness without stranding in-flight claims | An upgrade mid-claim preserves the claim, proven by rehearsal | OPEN |
| **P14-060** | Stage B proof | P14-030 | The full harness suite, with every past defect reintroduced in turn | Every reintroduced defect is caught; the suite is proven able to fail on each | OPEN |

---

## 6. Stage C · Evidence integrity and audit (Wave 2)

The stage the programme exists for. 194 phases are DONE on transcripts nobody has re-checked, and
that number grows with every phase. Auditing is not distrust of any agent — it is the only way a
self-reported completion becomes evidence at this scale, which is why financial assurance samples
rather than trusts.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-091** | The evidence model | P14-039 | Evidence as structured data — command, output, broken-output, environment, harness version — rather than free prose | Every new FINISH records structured evidence; a prose-only transcript is refused | OPEN |
| **P14-092** | Historical evidence parsing | P14-091 | The 194 existing transcripts parsed into the structured model, with unparseable ones reported | Every historical transcript is parsed or explicitly listed as unparseable with its phase named | OPEN |
| **P14-093** | Evidence completeness scoring | P14-092 | Each transcript scored: does it contain a command, its passing output, and its output when broken | The distribution is published. A transcript missing the deliberate break is identified by phase | OPEN |
| **P14-094** | Exit-criterion extraction | P14-091 | Extracting the runnable command from an exit criterion where one exists, and marking the rest as manual | Every phase is classified as machine-verifiable or manual, with the ratio published | OPEN |
| **P14-095** | The re-verification sampler | P14-094 | The HP-3 mechanism: independently re-running the exit criteria of a sample of DONE phases | A sampled phase whose criterion no longer passes is reported by name, not aggregated away | OPEN |
| **P14-096** | Sampling strategy | P14-095 | Risk-weighted sampling — money, isolation, auth and overridden phases sampled harder | The strategy is stated and its coverage computed; an unsampled high-risk class is reported | OPEN |
| **P14-097** | Re-verification environment | P14-095 | A clean environment where a criterion can be re-run without the original agent's local state | A criterion that only passes on its author's machine is detected | OPEN |
| **P14-098** | Regression detection on DONE phases | P14-095 | Continuous re-verification, so a phase that silently breaks later is caught | A DONE phase broken by a later change is detected within the stated window, proven by seeding one | OPEN |
| **P14-099** | Evidence contradiction detection | P14-093 | Detecting transcripts whose claimed output contradicts the recorded command | A transcript whose output could not have come from its command is flagged, proven on a seeded case | OPEN |
| **P14-100** | Fabrication indicators | P14-099 | Signals that distinguish a pasted real transcript from a plausible invention — timing, paths, exit codes, environment traces | The indicator set is stated with its false-positive rate measured. This flags for review; it never accuses | OPEN |
| **P14-101** | Audit reporting | P14-095 | A published audit result: sample size, pass rate, failures by phase | The report is generated from re-verification runs and cannot be hand-edited | OPEN |
| **P14-102** | Audit failure handling | P14-101 | What happens when a DONE phase fails re-verification: reopened, or explained in writing | A failed re-verification produces a reopened phase or a recorded reason; silence is not an outcome | OPEN |
| **P14-103** | Evidence retention | P14-091 | Evidence retained for the life of the programme, immutable and attributable | An evidence record cannot be altered after the fact, proven by test | OPEN |
| **P14-104** | Evidence for manual criteria | P14-094 | The stronger record required where a criterion cannot be machine-run — screenshots, recordings, named witnesses | A manual criterion with only a prose assertion is refused | OPEN |
| **P14-105** | Accessibility evidence | P14-104 | Screen-reader and keyboard verification recorded reproducibly rather than asserted | An accessibility claim without a recorded run is refused, proven on a seeded claim | OPEN |
| **P14-106** | Performance evidence | P14-104 | Measurements recorded with their environment, so a budget claim is comparable | A performance claim without its environment is refused | OPEN |
| **P14-107** | Security evidence | P14-104 | Adversarial-test evidence recorded with the attempt and the failure | A security claim without a recorded failed attack is refused | OPEN |
| **P14-108** | Two-tenant evidence | P14-104 | Isolation claims recorded with the query and the zero-row result | An isolation claim without a recorded zero-row proof is refused | OPEN |
| **P14-109** | Money-path evidence | P14-104 | Financial claims recorded against hand-computed expected values | A money claim without a comparison to an independently computed value is refused | OPEN |
| **P14-110** | Evidence review queue | P14-101 | A queue of transcripts needing human judgement, prioritised by risk | Every queued item reaches a decision within its window; an unreviewed item ages visibly | OPEN |
| **P14-111** | Reviewer tooling | P14-110 | The surface a reviewer uses: the phase, its diff, its evidence, its re-verification result | A review is completable without reconstructing context by hand, verified by exercise | OPEN |
| **P14-112** | Review outcomes and their effect | P14-111 | Accept, reopen, or amend — each with a recorded consequence | Every review produces one of the three; no review ends without an outcome | OPEN |
| **P14-113** | Rework measurement | P14-112 | Measuring how often a DONE phase is later reopened, and why | Rework rate is measured per programme and per cause, from real data | OPEN |
| **P14-114** | Evidence quality trend | P14-093 | Whether transcripts are getting better or worse over time | The trend is published; a decline triggers a review of the guidance | OPEN |
| **P14-115** | Cross-phase consistency | P14-092 | Detecting phases whose evidence contradicts another phase's claims | A contradiction between two phases' evidence is reported, proven on a seeded pair | OPEN |
| **P14-116** | Plan-to-reality reconciliation | P14-098 | Reconciling what the plan says exists against what the repositories contain | A capability the plan marks DONE and the code does not contain is reported, proven by seeding one | OPEN |
| **P14-117** | Claim-to-code traceability | P14-116 | Linking each DONE phase to the commits that delivered it | A DONE phase with no delivering commit is reported. Several currently exist | OPEN |
| **P14-118** | Orphaned-commit detection | P14-117 | Commits that reference no phase, and phases that reference no commit | Both directions are reported; the counts are ratcheted downward | OPEN |
| **P14-119** | Evidence in CI | P14-095 | Re-verification running continuously rather than on demand | The sampler runs on a schedule; a missed run is reported | OPEN |
| **P14-120** | Audit independence | P14-095 | Re-verification not executed by the agent that produced the evidence | An agent cannot audit its own phase, enforced mechanically | OPEN |
| **P14-121** | Evidence privacy | P14-103 | No secret, credential or personal data captured in a transcript | An evidence record containing a secret is refused, proven on a seeded record | OPEN |
| **P14-122** | Evidence size discipline | P14-013 | Bounded transcripts that still contain the proof | An over-long transcript is refused with guidance rather than truncated silently | OPEN |
| **P14-123** | Evidence templates | P14-091 | Per-criterion-class templates so an agent knows exactly what to capture | Every criterion class has a template; a class without one is reported | OPEN |
| **P14-124** | Evidence guidance in the brief | P14-123 | The brief telling the agent what its specific evidence must contain | Every brief names its evidence requirements; a brief without them fails the completeness test | OPEN |
| **P14-125** | Historical audit backlog | P14-092 | The 194 existing phases queued for re-verification, risk-ordered | Every existing DONE phase is either re-verified or explicitly deferred with a reason | OPEN |
| **P14-126** | Override evidence standard | P14-104 | `--despite-red-gate` requiring evidence that the failure is genuinely unrelated | An override without a demonstration of unrelatedness is refused, proven on a seeded override | OPEN |
| **P14-127** | Withdrawn-phase audit | P14-112 | Every WITHDRAWN phase's reason reviewed and still valid | A withdrawal whose reason no longer holds is reopened | OPEN |
| **P14-128** | Exemption audit | P14-112 | Every recorded exemption — RLS, line ceiling, read-only, coverage, exit-criteria baseline — re-justified on a cycle | An exemption past its review date is reported and expires | OPEN |
| **P14-129** | Audit of the audit | P14-119 | Verifying the sampler itself detects a known-broken phase | A deliberately broken DONE phase is caught by the next sampler run, proven by seeding one | OPEN |
| **P14-130** | Stage C audit proof | P14-129 | The first full audit cycle executed and published | The audit runs end to end, its pass rate is published, and a seeded broken phase is caught | OPEN |

---

## 7. Stage D · Gate health and override governance (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-131** | The gate inventory | P14-004 | Every gate across every repository, with what it checks, where it runs and who owns it | A gate not in the inventory fails the coverage check; an inventory entry with no owner is reported | OPEN |
| **P14-132** | Gate effectiveness measurement | P14-131 | How often each gate fires, on what, and whether the finding was real | A gate that has never fired is reported for review — it is either redundant or broken | OPEN |
| **P14-133** | Override tracking | P14-006 | Every `--despite-red-gate` override recorded, attributed, aged and surfaced | The 33 existing overrides are listed with their reasons and ages; new ones join automatically | OPEN |
| **P14-134** | Override review | P14-133 | The HP-2 mechanism: each override reviewed and resolved as a gate defect, a plan defect, or a legitimate exception | Every override reaches a recorded outcome. An unreviewed override past its window escalates and blocks new overrides of the same gate | OPEN |
| **P14-135** | Override rate as a signal | P14-133 | The rate measured per gate, per programme and over time | A gate whose override rate exceeds the threshold is treated as defective, not as background noise | OPEN |
| **P14-136** | Gate-blocked work analysis | P14-135 | Which gates are blocking the most work and whether they should be | The top blocking gates are identified with the work they blocked, and each is judged rather than endured | OPEN |
| **P14-137** | Red-gate root causes | P14-136 | The recurring reasons `verify.mjs` is red across repositories | Each recurring cause has an owning phase. D151 is the first and is currently taxing every programme | OPEN |
| **P14-138** | Gate scope correctness | P14-004 | Every gate running where it is meaningful and skipping where it is not, with skips named | A gate skipping silently is reported. `verify.mjs`'s `HAS_APP_SOURCE` delegation is the pattern to follow | OPEN |
| **P14-139** | Gate performance | P14-049 | Gate execution time measured; slow gates identified | The full gate set completes within budget; a regression is attributed to a gate by name | OPEN |
| **P14-140** | Gate failure message quality | P14-012 | Every gate stating what failed, the rule, and the remedy | A gate whose message names no remedy is reported | OPEN |
| **P14-141** | Gate false-positive tracking | P14-132 | Measuring how often a gate is wrong, since false positives are what train people to override | Each gate's false-positive rate is measured; one above threshold is fixed or narrowed | OPEN |
| **P14-142** | Ratchet integrity | P14-033 | Every ratchet — coverage, suppressions, decimal, exit criteria, line ceiling — verified to be unlowerable without a deliberate act | A ratchet silently lowered is detected, proven by seeding a lowering | OPEN |
| **P14-143** | Suppression tracking | P14-142 | Every suppression across the family attributed and aged | A suppression with no owner or no expiry is reported | OPEN |
| **P14-144** | Exemption-list integrity | P14-128 | Every exemption list generated rather than hand-maintained, with justifications intact | A hand-added exemption is detected, proven on a seeded entry | OPEN |
| **P14-145** | Gate coverage of the standards | P14-131 | Every rule in `CODE_STANDARDS.md` mapped to a gate or explicitly marked unenforced | An unenforced standard is listed openly rather than implied to be enforced | OPEN |
| **P14-146** | Verify / CI divergence | P14-004 | The divergence `ROADMAP.md` names, closed and kept closed | A gate in CI but not `verify.mjs`, or the reverse, fails a check | OPEN |
| **P14-147** | Pre-push gate reliability | P14-146 | The pre-push path verified to run what it claims | A pre-push run that skips a gate it claims to run is detected | OPEN |
| **P14-148** | Gate ownership | P14-131 | Every gate having a named owning phase responsible for its correctness | A gate with no owner fails the inventory check | OPEN |
| **P14-149** | Gate deprecation | P14-132 | Retiring gates that are redundant or superseded, deliberately | A gate is retired with a recorded reason, never by deletion | OPEN |
| **P14-150** | New-gate standard | P14-140 | What a new gate must have before it lands: a failing test, a remedy message, an owner, a home in both CI and verify | A new gate missing any of the four cannot land, proven on a seeded gate | OPEN |
| **P14-151** | Gate documentation | P14-131 | Generated documentation of every gate and its rule | Documentation regenerates from the inventory; drift fails CI | OPEN |
| **P14-152** | Blocked-phase governance | P14-006 | Every BLOCKED phase with a current, re-tested blocker and a named unblocking condition | A blocker untested for its review window escalates. 16 P1 phases are currently blocked on absent infrastructure | OPEN |
| **P14-153** | Blocked-phase aging | P14-152 | Measuring how long phases stay blocked and on what | The oldest blocker is visible; the distribution is published | OPEN |
| **P14-154** | Infrastructure-blocked phases | P14-152 | The specific infrastructure the blocked phases need, documented as an actionable list | The list is precise enough to act on without re-deriving it, verified by exercise | OPEN |
| **P14-155** | Dependency-blocked phases | P14-152 | Phases blocked by unfinished dependencies, with the critical path identified | The critical path to the most-blocked phase is computed, not estimated | OPEN |
| **P14-156** | Plan-reality drift detection | P14-116 | Detecting where the plan's assumptions no longer match the repositories | A phase whose premise is no longer true is reported for amendment | OPEN |
| **P14-157** | Exit-criterion strengthening backlog | P14-093 | The 350 baselined zero-signal criteria worked down deliberately | The baseline shrinks; it may not grow without a recorded amendment | OPEN |
| **P14-158** | Gate health dashboard | P14-135 | Gate firing rates, override rates, false positives and blocked work in one view | Every figure derives from measurement and drills to its source | OPEN |
| **P14-159** | Gate health alerting | P14-158 | Alerts when a gate's override rate or false-positive rate crosses threshold | A seeded threshold breach alerts, proven by rehearsal | OPEN |
| **P14-160** | Stage D proof | P14-134 | The override backlog cleared and the mechanism proven | Every one of the 33 existing overrides has a recorded outcome, and a new unreviewed override blocks further overrides of that gate | OPEN |

---

## 8. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 14 established (P14-001–P14-280), the Development Harness.** Registered per README § 0 rule 1. The fourth structural gap found by review, and the load-bearing one: **no phase owned the harness's evolution** — only `A27`/`A28` (both DONE) and `P12-202` touch it — while the harness will dispatch the remaining 4,041 phases. Measured on establishment: **0 tests over 1,820 lines**, **33 of 194 finished phases (17 %) finished over a red gate**, **0 of those overrides reviewed** because no review mechanism exists, **7 claims showing DONE with zero progress notes at 150 h**, and **all three known harness defects (D045, D149, D150) found by accident** rather than by anything looking. The charter is `start.mjs`'s own sentence — *"it makes the claim auditable, not true"* — which is worth something only if somebody audits; `P14-278` is that audit, re-running the exit criteria of a sample of already-DONE phases and publishing the pass rate. What is explicitly **not** in question is the claim protocol: four agents ran concurrently across four worktrees while this document was written, taking P12-001 through P12-008 with zero collisions, which is `A27`/`A28` working exactly as designed. | Claude Code |
