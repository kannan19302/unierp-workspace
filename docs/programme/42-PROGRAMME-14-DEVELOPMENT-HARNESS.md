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

## 5b. Stage B-II · The claim protocol under adversarial concurrency (Wave 1)

The one part of the harness that is demonstrably working — four agents took `P12-001` through
`P12-008` concurrently with zero collisions while this document was written. This stage exists to
keep it working as agent count rises, and to close the limits the protocol documents about itself
rather than leaving them as footnotes.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-061** | The claim protocol, specified | P14-040 | The protocol written as a specification — states, transitions, invariants — rather than only as code | Every implemented behaviour maps to a specified one; an unspecified behaviour is reported | OPEN |
| **P14-062** | Claim invariants | P14-061 | The invariants stated: one holder per phase, one open phase per agent, no claim without a push | Each invariant has a test that fails when it is violated, proven per invariant | OPEN |
| **P14-063** | Two-agent contention tests | P14-062 | Two agents claiming simultaneously, deterministically reproduced | Exactly one wins; the loser re-picks. Proven repeatedly, not once | OPEN |
| **P14-064** | N-agent contention tests | P14-063 | Contention at the agent counts actually planned for | No double-claim at target agent count, proven under sustained contention | OPEN |
| **P14-065** | Push-rejection handling | P14-063 | The pull-and-repick path exercised deterministically | A rejected push always results in a different phase, never a silent retry of the same | OPEN |
| **P14-066** | Claim visibility | P14-256 | A claim visible to every other agent before work begins | An agent cannot begin work on a phase whose claim has not been observed remotely | OPEN |
| **P14-067** | Agent identity correctness | P14-061 | Identity unique per working tree, verified — the failure that once handed session 2 session 1's phase | Two sessions on one machine never share an identity, proven by test | OPEN |
| **P14-068** | Resume-before-claim | P14-062 | An agent holding an unfinished phase always receiving that one back | An agent with a WIP phase never receives a second, proven under every entry path | OPEN |
| **P14-069** | Stale-claim reset correctness | P14-008 | The 72-hour reset exercised, including the boundary | A claim reset at the boundary is handled deterministically, proven against a controlled clock | OPEN |
| **P14-070** | Stale-reset safety | P14-069 | A reset never destroying an active agent's work | A reset of a phase whose agent is still active is detectable and reversible | OPEN |
| **P14-071** | Claim-branch model | P14-257 | The claim branch's role specified, with its constraint on mutual visibility stated | Agents on different branches see each other's claims, or are told plainly that they cannot | OPEN |
| **P14-072** | `adp-state` ref integrity | P14-071 | The state ref verified, including its plumbing paths | A corrupted or diverged state ref is detected and reconciled, proven by seeding one | OPEN |
| **P14-073** | Cross-worktree coordination | P14-171 | Worktrees coordinating correctly at the plan level | Four worktrees complete a batch each with no lost claim, proven under execution | OPEN |
| **P14-074** | Cross-repository work registry | P14-073 | The registry preventing two agents overwriting each other in a shared repository | Two phases touching one repository are warned before work begins, proven by test | OPEN |
| **P14-075** | File-level collision detection | P14-074 | Detecting collisions at file granularity, not only repository | Two agents editing one file are detected before the second commits | OPEN |
| **P14-076** | Contributor-scope enforcement | P14-002 | The path scopes in `programme-claims.json` enforced, not merely declared | A programme writing outside its declared path scope fails, proven on a seeded commit | OPEN |
| **P14-077** | Claim timeout and heartbeat | P14-069 | A held phase requiring periodic evidence of life | A silently abandoned claim is detected sooner than 72 hours, proven against a controlled clock | OPEN |
| **P14-078** | Claim handoff | P14-214 | Transferring a live claim between agents without releasing it | A handoff preserves the claim and its progress notes, proven by test | OPEN |
| **P14-079** | Forced release | P14-070 | An operator releasing another agent's claim, audited | A forced release is attributed and reversible, proven by test | OPEN |
| **P14-080** | Claim audit trail | P14-054 | Every claim, reset, release and finish attributable | Any phase's full claim history is reconstructible from the record | OPEN |
| **P14-081** | Dependency-race handling | P14-028 | Two agents where one's phase depends on the other's in-flight phase | The dependant is not handed out while its dependency is WIP, proven by test | OPEN |
| **P14-082** | Wave-boundary races | P14-029 | Agents at a wave boundary as the last phase of a wave completes | Wave advancement is deterministic under concurrent completion, proven by test | OPEN |
| **P14-083** | Plan-write serialisation | P14-046 | Serialising concurrent status writes to the same track file | Concurrent writes to one file never lose a status change, proven under parallel execution | OPEN |
| **P14-084** | Optimistic-concurrency correctness | P14-083 | The push-based lock verified to have no lost-update window | No sequence of interleavings produces two holders, proven by exhaustive interleaving test | OPEN |
| **P14-085** | Clock-skew tolerance | P14-069 | Behaviour when agents' clocks disagree | Skew within the declared bound does not misresolve a claim, proven by injection | OPEN |
| **P14-086** | Network-partition behaviour | P14-256 | Behaviour when an agent is partitioned mid-claim | A partitioned agent cannot silently proceed, proven by injection | OPEN |
| **P14-087** | Protocol version negotiation | P14-058 | Agents on different harness versions coexisting within a declared window | A version-skewed agent is told, rather than corrupting state, proven by test | OPEN |
| **P14-088** | Protocol documentation | P14-061 | Generated protocol documentation from the specification | Documentation regenerates from the spec; drift fails CI | OPEN |
| **P14-089** | Protocol conformance suite | P14-061 | A suite any harness implementation must pass to be considered correct | The current implementation passes; a deliberately weakened one fails, proven per invariant | OPEN |
| **P14-090** | Stage B-II concurrency proof | P14-084 | An adversarial concurrency suite at target agent count with faults injected throughout | No double-claim, no lost completion and no corrupted state across the run; removing any guard is caught | OPEN |

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

## 8. Stage E · Orchestration and the batch runner (Wave 3)

The loop. It does not exist today: `ls scripts/ | grep loop` returns nothing, so every phase is
driven by hand. **HP-5 governs this whole stage** — automation may make an agent faster; it may
never make an agent's assertion count for more.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-161** | Runner architecture | P14-043 | The declared model: what the runner does, what it never does, and where a human decision is required | A runner capability outside the declaration fails an architecture gate | OPEN |
| **P14-162** | Single-phase execution contract | P14-161 | The unit the runner drives: claim, hand to an agent, collect evidence, finish or release | Every unit ends in exactly one of finish, release or progress; a unit ending in none is detected | OPEN |
| **P14-163** | Batch definition | P14-162 | A batch as a declared set — count, programme, stop conditions — rather than an open loop | A batch without a stop condition cannot start | OPEN |
| **P14-164** | Stop conditions | P14-163 | Halting on gate failure, override attempt, blocked phase, budget exhaustion or a review checkpoint | Each stop condition halts the batch, proven per condition by seeding it | OPEN |
| **P14-165** | Review checkpoints | P14-164 | Mandatory pauses where a human inspects evidence before the batch continues | A batch cannot exceed its checkpoint interval without an explicit continuation | OPEN |
| **P14-166** | Batch reporting | P14-163 | What a batch did: phases, outcomes, evidence links, gates hit, time and cost | The report is generated from real execution and cannot be hand-edited | OPEN |
| **P14-167** | Batch failure handling | P14-164 | A failed phase inside a batch handled without stranding it or corrupting the plan | A failure mid-batch leaves the phase released with a reason, not WIP forever | OPEN |
| **P14-168** | The no-weakening guarantee | P14-161 | The HP-5 mechanism: the runner cannot override a gate, soften a criterion or finish without evidence | Every weakening path is unavailable to the runner, proven by attempting each | OPEN |
| **P14-169** | Runner override prohibition | P14-168 | `--despite-red-gate` unavailable to automated execution; only a human may override | A runner attempting an override is refused, proven by test | OPEN |
| **P14-170** | Parallel batch execution | P14-046 | Several batches across programmes and worktrees without contention | Four concurrent batches complete with zero collisions, proven under execution | OPEN |
| **P14-171** | Worktree provisioning | P14-170 | Creating, using and retiring worktrees for parallel agents | A worktree is provisioned and cleaned up automatically; a leaked worktree is detected | OPEN |
| **P14-172** | Agent assignment | P14-170 | Which agent takes which programme, and how contention is avoided by construction | Two agents are never assigned the same programme without explicit intent | OPEN |
| **P14-173** | Budget enforcement | P14-164 | Time, token and cost budgets per batch, enforced | A batch exceeding its budget halts and reports, proven by seeding an overrun | OPEN |
| **P14-174** | Cost measurement | P14-173 | Model spend per phase and per programme, measured | Cost per completed phase is answerable from data, not estimated | OPEN |
| **P14-175** | Throughput measurement | P14-166 | Phases per hour, per agent and per programme | Throughput is measured and its trend visible | OPEN |
| **P14-176** | Phase duration distribution | P14-175 | How long phases actually take, by programme and by kind | The distribution is published, replacing the estimate used for planning | OPEN |
| **P14-177** | Batch scheduling | P14-170 | Running batches on a schedule with declared windows | A scheduled batch runs in its window and is skippable, proven by rehearsal | OPEN |
| **P14-178** | Unattended-run policy | P14-165 | What may run unattended, what may not, and for how long | An unattended run past its limit halts pending review, proven by test | OPEN |
| **P14-179** | Runner observability | P14-166 | Live visibility of what is running, where and how far along | An in-flight batch's state is answerable at any moment | OPEN |
| **P14-180** | Runner interruption and resume | P14-167 | Stopping a batch cleanly and resuming without repeating completed phases | An interrupted batch resumes without redoing work, proven by injection | OPEN |
| **P14-181** | Dependency-aware batching | P14-163 | Batches ordered so dependencies complete before dependants | A batch never hands out a phase whose dependency is inside the same unfinished batch | OPEN |
| **P14-182** | Blocked-phase handling in batches | P14-152 | A batch encountering a blocked phase skipping it and reporting, not silently routing around | Skipped blocked phases are reported per batch with their blockers named | OPEN |
| **P14-183** | Batch prioritisation | P14-181 | Which programme a batch opens, driven by `04-V1-RELEASE-DEFINITION § 3` | A batch opening out of the declared order requires explicit intent | OPEN |
| **P14-184** | Runner safety limits | P14-168 | Hard limits: phases per batch, repositories touched, files changed | A batch exceeding a safety limit halts, proven per limit | OPEN |
| **P14-185** | Blast-radius awareness | P14-184 | The runner refusing phases whose blast radius exceeds the batch's declared scope | A high-blast-radius phase requires explicit inclusion, proven by test | OPEN |
| **P14-186** | Runner rollback | P14-167 | Reverting a batch's plan-state changes when a batch is abandoned | A rolled-back batch leaves the plan exactly as it was, verified by comparison | OPEN |
| **P14-187** | Evidence collection in batches | P14-091 | Evidence captured per phase automatically where the criterion is machine-runnable | A batch-run criterion's output is captured verbatim, not summarised | OPEN |
| **P14-188** | Batch audit integration | P14-095 | Batches feeding the re-verification sampler automatically | Every batch contributes to the audit sample; a batch that does not is reported | OPEN |
| **P14-189** | Human handoff protocol | P14-165 | How a batch hands a decision to a human and resumes on the answer | A handoff preserves full context and resumes correctly, proven by rehearsal | OPEN |
| **P14-190** | Runner failure modes | P14-180 | The declared behaviour when the runner itself crashes mid-phase | A runner crash leaves a recoverable claim, proven by injection at each stage | OPEN |
| **P14-191** | Runner testing | P14-020 | The runner tested against a fixture plan without touching the real one | Every runner path is testable without real claims, and the harness has its own tests | OPEN |
| **P14-192** | Runner documentation | P14-011 | Generated documentation of the runner's behaviour, limits and prohibitions | Documentation regenerates from the runner's declarations; drift fails CI | OPEN |
| **P14-193** | Batch templates | P14-163 | Named batch shapes: a review batch, a programme batch, an audit batch | Each template is executable and its behaviour tested | OPEN |
| **P14-194** | Estimate correction | P14-176 | Replacing planning estimates with measured durations as data accumulates | The published estimate is derived from measurement once enough phases are complete | OPEN |
| **P14-195** | Stage E runner proof | P14-168 | A batch executed end to end with every weakening path attempted and refused | The batch completes, every override and softening attempt fails, and the checkpoint halts it as declared | OPEN |

---

## 9. Stage F · Agent ergonomics and context (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-196** | Context budget model | P14-036 | The HP-7 mechanism: a declared budget for what an agent must hold to execute one phase | A brief exceeding the budget is reported before an agent receives it | OPEN |
| **P14-197** | Brief size measurement | P14-196 | Every brief measured against the budget | The distribution is published; oversized briefs are named | OPEN |
| **P14-198** | Brief decomposition | P14-197 | Phases whose briefs exceed the budget split, using the `A07a`/`A07b` rule rather than renumbering | An oversized phase is split without renumbering its neighbours, proven on a real case | OPEN |
| **P14-199** | Brief relevance | P14-037 | Removing from the brief what an agent does not need, since noise costs the same as signal | Brief size falls without losing a required section, verified by the completeness test | OPEN |
| **P14-200** | Self-containment verification | P14-037 | Verifying a brief truly needs no other document | A brief referencing content it does not quote is reported | OPEN |
| **P14-201** | Repository orientation | P14-003 | What an agent needs to know about a repository before touching it, generated | An agent reaches the right file without searching the whole tree, verified by exercise | OPEN |
| **P14-202** | Search guidance in the brief | P14-201 | The brief telling the agent where to look first for what already exists | Every brief names its likely-existing surfaces; "search before building" becomes actionable | OPEN |
| **P14-203** | Prior-art detection | P14-202 | Detecting that a phase's deliverable may already exist before an agent starts | An already-satisfied criterion is flagged at claim time, saving the whole phase | OPEN |
| **P14-204** | Onboarding a new agent | P14-011 | What a fresh session must read, in order, to be effective — and nothing more | A new agent reaches a correct first action from the documented path alone, verified by exercise | OPEN |
| **P14-205** | Agent instruction consistency | P14-011 | `AGENTS.md`, `CLAUDE.md`, `GEMINI.md` and the skill verified to agree | A divergence between vendor entrypoints fails a gate. They exist to prevent exactly this | OPEN |
| **P14-206** | Instruction accuracy gate | P14-205 | Every command, flag and count in the agent instructions verified against reality | A documented command that does not exist fails CI. "310 phases across 20 documents" survived for months | OPEN |
| **P14-207** | Failure guidance | P14-012 | Every common failure path carrying its next action in the message itself | An agent hitting a common failure has its remedy without searching, verified across failure classes | OPEN |
| **P14-208** | Anti-pattern detection | P14-030 | Detecting the recurring agent mistakes: scope creep, programme creep, gate weakening, hand-edited tables | Each anti-pattern is detected in a seeded commit, proven per pattern | OPEN |
| **P14-209** | Scope-creep detection | P14-208 | Flagging a phase's diff touching files unrelated to its deliverable | A seeded unrelated change is flagged for justification, not silently accepted | OPEN |
| **P14-210** | Programme-creep detection | P14-002 | Flagging a phase building another programme's deliverable | A P12 phase implementing a P9 deliverable is flagged, proven on a seeded case | OPEN |
| **P14-211** | Hand-edit detection | P14-033 | Detecting hand edits to mechanically-written files | A hand-edited plan table or worklog is detected, proven by seeding one | OPEN |
| **P14-212** | Progress-note quality | P14-007 | Progress notes that actually let the next agent resume | A note that does not state what is done and what is next is reported. Seven claims have zero notes | OPEN |
| **P14-213** | Resume quality | P14-212 | An interrupted phase resumable by a different agent from the notes alone | A resumed phase is completed by a second agent without re-deriving state, verified by exercise | OPEN |
| **P14-214** | Handoff between agents | P14-213 | Deliberate handoff of an in-flight phase with full context | A handoff preserves context; the receiving agent needs no further explanation, verified | OPEN |
| **P14-215** | Session boundary handling | P14-196 | Behaviour when a phase genuinely exceeds one session | A phase spanning sessions loses nothing, proven by rehearsal | OPEN |
| **P14-216** | Agent error taxonomy | P14-208 | Classifying what agents actually get wrong, from real data | The taxonomy is derived from observed failures, not imagined ones | OPEN |
| **P14-217** | Guidance effectiveness | P14-216 | Measuring whether guidance changes reduce the errors they target | A guidance change's effect is measured against the error rate it addressed | OPEN |
| **P14-218** | Agent feedback channel | P14-216 | How an agent reports that the plan or harness is wrong | An agent-reported plan defect reaches the defect log with its context | OPEN |
| **P14-219** | Multi-vendor verification | P14-205 | The harness verified with more than one agent vendor, since instructions are vendor-neutral by design | The protocol works with a second vendor, verified by exercise | OPEN |
| **P14-220** | Stage F proof | P14-206 | A suite asserting brief self-containment, size, instruction accuracy and anti-pattern detection | All four hold, and each fails when its mechanism is removed | OPEN |

---

## 10. Stage G · The harness observes itself (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-221** | Harness metrics model | P14-006 | The HP-4 mechanism: the declared metric set with definitions and sources | A metric without a definition and a source cannot be published | OPEN |
| **P14-222** | Throughput metrics | P14-175 | Phases completed per day, per agent, per programme | Throughput derives from worklog data and is reproducible by command | OPEN |
| **P14-223** | Quality metrics | P14-113 | Rework rate, audit pass rate, override rate, evidence completeness | Each is computed from real records; none is self-assessed | OPEN |
| **P14-224** | Flow metrics | P14-153 | Time from claim to finish, time blocked, time in review | The distribution is published per programme | OPEN |
| **P14-225** | Blocked-work metrics | P14-153 | How much work is blocked, on what, and for how long | The oldest and largest blockers are visible without inspection | OPEN |
| **P14-226** | Gate metrics | P14-135 | Firing rate, override rate, false-positive rate per gate | Every gate has all three measured; one without is reported | OPEN |
| **P14-227** | Cost metrics | P14-174 | Model and infrastructure spend attributed to phases and programmes | Cost per phase is answerable; the aggregate reconciles to real spend | OPEN |
| **P14-228** | Progress projection | P14-222 | Projected completion from measured throughput, with its uncertainty stated | The projection states its assumptions and its error bars, never a bare date | OPEN |
| **P14-229** | Estimate accuracy tracking | P14-228 | Comparing projections against outcomes as they arrive | Projection error is measured and published, not quietly revised | OPEN |
| **P14-230** | Programme health scoring | P14-223 | A per-programme health view: throughput, quality, blockage, drift | Every component is measured; the score is reproducible from data | OPEN |
| **P14-231** | Plan-drift metrics | P14-156 | How far the plan has diverged from reality since it was written | Drift is measured per programme and reported for amendment | OPEN |
| **P14-232** | Defect-log metrics | P14-118 | Defects found, routed, closed and carried, with ages | An unrouted or ageing defect is visible without reading the log | OPEN |
| **P14-233** | Harness reliability metrics | P14-045 | Harness failure rate, recovery rate and mean time to detect | Every harness failure is recorded; the rate is published | OPEN |
| **P14-234** | Agent effectiveness metrics | P14-217 | Which guidance, briefs and phase shapes produce good outcomes | Effectiveness is measured against real outcomes, not impressions | OPEN |
| **P14-235** | Metrics dashboard | P14-221 | One view of the whole programme's health, drilling to source | Every figure drills to the records behind it | OPEN |
| **P14-236** | Metrics alerting | P14-235 | Alerts when a metric crosses a declared threshold | Each alert has fired in rehearsal; an unfired alert is unproven | OPEN |
| **P14-237** | Metrics accuracy verification | P14-221 | Verifying computed metrics against independently counted values | Each metric matches an independent count, proven per metric | OPEN |
| **P14-238** | Historical metrics retention | P14-019 | Metrics retained so trends survive plan growth | A year of history remains queryable within budget, measured | OPEN |
| **P14-239** | Metrics honesty gate | P14-237 | Preventing a metric from being redefined to look better | A metric definition change is recorded as an amendment; a silent redefinition is detected | OPEN |
| **P14-240** | Vanity-metric review | P14-239 | Removing metrics that measure activity rather than progress | Every retained metric names the decision it informs; one that informs none is removed | OPEN |
| **P14-241** | Reporting to the maintainer | P14-235 | A periodic report the maintainer can act on without reading the plan | The report is generated and states what needs a human decision | OPEN |
| **P14-242** | Decision surfacing | P14-241 | Surfacing decisions only a human can make, rather than burying them | An outstanding human decision is visible and aged, never lost in a transcript | OPEN |
| **P14-243** | Evidence of harness value | P14-233 | Measuring whether the harness's own controls are catching anything | Each control's catch count is published; a control catching nothing is reviewed | OPEN |
| **P14-244** | Comparative measurement | P14-234 | Comparing phase outcomes with and without a given control | A control's effect is measured against a baseline, not asserted | OPEN |
| **P14-245** | Metric-driven improvement | P14-244 | Harness changes justified by, and verified against, a metric | A harness change states the metric it targets and its measured effect | OPEN |
| **P14-246** | Observability performance | P14-238 | Metric computation within budget at full plan and worklog size | Metrics compute within budget at projected full size, measured | OPEN |
| **P14-247** | Metrics privacy | P14-121 | No secret or personal data in metrics or reports | A metrics export containing sensitive data is refused, proven on a seeded record | OPEN |
| **P14-248** | Metrics API | P14-235 | Programmatic access to every published metric | Every dashboard figure is retrievable by command; a UI-only figure fails the parity test | OPEN |
| **P14-249** | Metrics documentation | P14-221 | Generated definitions for every metric | Documentation regenerates from the metric registry; drift fails CI | OPEN |
| **P14-250** | Stage G proof | P14-237 | A suite verifying every published metric against an independent count | Every metric matches, and a deliberately miscomputed metric is caught | OPEN |

---

## 11. Stage H · Resilience and recovery (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-251** | Plan-state backup | P14-045 | The plan, worklog and baselines backed up with tested restore | A restore reproduces plan state exactly, verified by comparison | OPEN |
| **P14-252** | Plan-state corruption detection | P14-045 | Detecting a corrupted or contradictory plan state before an agent acts on it | Each seeded corruption is detected at startup, proven per class | OPEN |
| **P14-253** | Plan-state repair | P14-252 | Repairing detected corruption without losing completed work | Each corruption class is repairable, proven per class | OPEN |
| **P14-254** | Claim-state recovery | P14-044 | Recovering from a lost, duplicated or orphaned claim | Each claim anomaly is recoverable, proven by injection | OPEN |
| **P14-255** | Worklog recovery | P14-038 | Rebuilding worklog state from git history when a file is lost | The worklog is reconstructible from history, proven by deleting and rebuilding it | OPEN |
| **P14-256** | Remote-loss tolerance | P14-040 | Behaviour when the remote is unreachable mid-claim | A claim that cannot push fails loudly rather than proceeding invisibly | OPEN |
| **P14-257** | The offline-claim limit | P14-256 | The documented limit — an agent claiming offline is invisible — closed or explicitly bounded | The limit is either removed or stated with its bound enforced, not left as a footnote | OPEN |
| **P14-258** | Divergent-branch recovery | P14-048 | Recovering when agents' claim state diverges across branches | Divergence is detected and reconciled, proven by seeding one | OPEN |
| **P14-259** | Concurrent-modification recovery | P14-046 | Recovering when two agents modify plan state simultaneously | Concurrent modification never loses a completion, proven under parallel execution | OPEN |
| **P14-260** | Harness rollback | P14-059 | Reverting a harness change that breaks execution | A bad harness change is revertible without stranding claims, proven by rehearsal | OPEN |
| **P14-261** | Disaster rehearsal | P14-251 | A rehearsed recovery of the whole development system | The rehearsal restores plan, worklog and tooling to a consistent point, recorded | OPEN |
| **P14-262** | Harness chaos testing | P14-044 | Failure injected at every harness boundary — git, filesystem, process, network | Every injection point leaves a recoverable state, proven per point | OPEN |
| **P14-263** | Long-running soak | P14-019 | The harness driven continuously to detect degradation at scale | A long soak shows no state corruption and no unbounded growth | OPEN |
| **P14-264** | Harness capacity limits | P14-016 | The declared ceiling on agents, phases and plan size, with behaviour at each | Each ceiling is reached in test and behaves as declared | OPEN |
| **P14-265** | Stage H proof | P14-262 | A chaos suite across every harness failure mode with verified recovery | Every failure mode recovers, and a removed recovery path is caught | OPEN |

---

## 12. Stage I · Proof (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P14-266** | Harness coverage verification | P14-022 | The harness's own coverage measured against its threshold | The threshold is met and has been proven able to fail | OPEN |
| **P14-267** | Gate-integrity verification | P14-034 | Every gate in the family proven able to fail, mechanically | A gate that cannot be made to fail is reported by name; the count is zero | OPEN |
| **P14-268** | Override backlog closure | P14-134 | Every recorded override reviewed and resolved | Zero unreviewed overrides remain; new ones are reviewed within their window | OPEN |
| **P14-269** | Stale-claim closure | P14-008 | Every inconsistent claim resolved and detection continuous | Zero claims inconsistent with plan status; a seeded inconsistency is detected | OPEN |
| **P14-270** | Blocked-phase closure | P14-152 | Every blocked phase with a current blocker and a named unblocking condition | No blocker is untested past its window; the list is actionable | OPEN |
| **P14-271** | Instruction-accuracy verification | P14-206 | Every documented command, flag and count verified against reality | A false statement in any agent instruction fails CI, proven on a seeded one | OPEN |
| **P14-272** | Anti-pattern suite | P14-208 | Every recurring agent mistake detected by a seeded example | Each anti-pattern is caught; one that is not fails the suite | OPEN |
| **P14-273** | Runner safety proof | P14-168 | Every weakening path attempted against the runner and refused | The runner cannot override, soften or finish without evidence, proven per path | OPEN |
| **P14-274** | Metrics verification | P14-237 | Every published metric verified against an independent count | Every metric matches; a miscomputation is caught | OPEN |
| **P14-275** | Recovery verification | P14-265 | Every harness failure mode rehearsed with verified recovery | Every mode recovers within its stated objective, recorded | OPEN |
| **P14-276** | Harness security verification | P14-052 | The harness's own attack surface tested | Every injection attempt fails; each succeeds when its control is removed | OPEN |
| **P14-277** | Regression-suite completeness | P14-030 | Every known harness defect represented by a failing-without-fix test | Every defect in the log with a harness cause has a test; one without is reported | OPEN |
| **P14-278** | The audit proof | P14-130 | The programme's invariant made mechanical: a risk-weighted sample of DONE phases independently re-verified, with the pass rate published | The audit runs, its pass rate is published by phase, a seeded broken DONE phase is caught, and every failure is reopened or explained. **A pass rate below the declared threshold blocks the programme rather than being footnoted** | OPEN |
| **P14-279** | Harness readiness review | P14-277 | Every harness capability evidenced by test or rehearsal rather than documentation | Every capability has a recorded proof within its review period; an unproven one blocks | OPEN |
| **P14-280** | Programme 14 launch readiness | P14-278 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 13 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 13. Programme exit criteria

- [ ] **A risk-weighted sample of DONE phases is independently re-verified and the pass rate published; a rate below threshold blocks** (P14-278)
- [ ] Every past harness defect — D045, D149, D150, D151 — has a test that fails without its fix (P14-030, P14-277)
- [ ] The harness meets its own coverage threshold, proven able to fail, from a 0 % baseline (P14-022, P14-266)
- [ ] Every gate in the family is proven able to fail, mechanically, on every run (P14-034, P14-267)
- [ ] Zero unreviewed overrides; the 33 existing ones each have a recorded outcome (P14-134, P14-268)
- [ ] A gate whose override rate exceeds threshold is treated as defective, not endured (P14-135)
- [ ] Zero claims inconsistent with plan status; the seven stale DONE claims are resolved (P14-008, P14-269)
- [ ] Every BLOCKED phase has a current, re-tested blocker and a named unblocking condition (P14-152, P14-270)
- [ ] Evidence is structured, complete, and refused when the deliberate break is missing (P14-039, P14-091)
- [ ] An agent cannot audit its own phase (P14-120)
- [ ] The runner cannot override a gate, soften a criterion, or finish without evidence (P14-168, P14-273)
- [ ] A batch cannot run past its review checkpoint without explicit continuation (P14-165)
- [ ] Every documented command, flag and count in the agent instructions is verified against reality (P14-206, P14-271)
- [ ] Scope creep, programme creep, gate weakening and hand-edited tables are each detected by seeded example (P14-208, P14-272)
- [ ] Every brief is self-contained and within the context budget (P14-196, P14-200)
- [ ] A DONE phase broken by a later change is detected within its window (P14-098)
- [ ] Every published metric matches an independent count (P14-237, P14-274)
- [ ] Progress projection states its assumptions and error bars, never a bare date (P14-228)
- [ ] Every harness failure mode is rehearsed with verified recovery (P14-262, P14-275)
- [ ] A crafted phase ID or branch name cannot inject a command (P14-052, P14-276)
- [ ] `verify.mjs` is green family-wide on D151's gate, without using the `# justified:` escape (P14-024)
- [ ] The exit-criteria baseline shrinks and may not grow without a recorded amendment (P14-157)

---

## 14. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 14 established (P14-001–P14-280), the Development Harness.** Registered per README § 0 rule 1. The fourth structural gap found by review, and the load-bearing one: **no phase owned the harness's evolution** — only `A27`/`A28` (both DONE) and `P12-202` touch it — while the harness will dispatch the remaining 4,041 phases. Measured on establishment: **0 tests over 1,820 lines**, **33 of 194 finished phases (17 %) finished over a red gate**, **0 of those overrides reviewed** because no review mechanism exists, **7 claims showing DONE with zero progress notes at 150 h**, and **all three known harness defects (D045, D149, D150) found by accident** rather than by anything looking. The charter is `start.mjs`'s own sentence — *"it makes the claim auditable, not true"* — which is worth something only if somebody audits; `P14-278` is that audit, re-running the exit criteria of a sample of already-DONE phases and publishing the pass rate. What is explicitly **not** in question is the claim protocol: four agents ran concurrently across four worktrees while this document was written, taking P12-001 through P12-008 with zero collisions, which is `A27`/`A28` working exactly as designed. | Claude Code |
