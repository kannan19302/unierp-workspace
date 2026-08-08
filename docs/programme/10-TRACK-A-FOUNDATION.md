# TRACK A · FOUNDATION — A01–A31

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Waves 0–1.** This track gates every other track. It is 31 phases, not a programme — its
> exit condition is *"every claim the platform makes is checked by something that can fail"*,
> and then it stops.

---

## 1. What this track owns

The **provability** of the platform. Not its features — its guarantees. Packaging, release,
gates, tenancy correctness, isolation, secrets, backup, and the developer's ability to run the
thing at all.

**The invariant this track establishes:**

> **No claim without a mechanism that can fail.**

`00-BASELINE § 1` is why. Three separate guarantees here became false without anyone lying:
`@ts-nocheck` made `typecheck` pass while checking nothing; `all: false` makes coverage report
while asserting nothing; `if: hashFiles(...)` makes the layer gate green while executing nothing
in 21 repositories (**D013**). Track A ends when that class of failure is impossible to introduce
silently.

**Blocks:** A01–A02 block every track. A16–A19 block all of Track G. A03–A04 block Track E.

---

## 2. Stage A-I · Packaging and resolution (Wave 0)

Nothing in this programme is reproducible until `@unerp/*` resolves from a registry a CI runner
can reach. `ROADMAP.md` calls this *"the one thing that blocks the rest"* and it is still true.

> **Amendment 2026-08-07 — the registry decision, and the mistake in it.** A01 chose the
> public npm registry over GitHub Packages, *after* discovering that GitHub Packages cannot
> host `@unerp/*` at all. The original recommendation cited `ROADMAP.md`'s "the obvious
> candidate, since the OIDC-federated publish tokens already exist there" without checking
> the scope constraint — GitHub Packages requires the npm scope to equal the account or
> organisation owning the repository, and these repos are owned by the user `kannan19302`.
> Recorded here rather than quietly corrected, because a plan that hides its own wrong turns
> teaches nothing: **verify a platform constraint before recommending the platform.**

| ID | Phase | Repos | Depends | Deliverable | Exit | Status |
| :- | :---- | :---- | :------ | :---------- | :--- | :----- |
| **A01** | Choose and stand up the `@unerp` registry | workspace, platform, all 18 with `.npmrc` + 13 libraries | — | **Decided 2026-08-07: the public npm registry.** GitHub Packages — named as the standing candidate here and in `ROADMAP.md` on the strength of its existing OIDC tokens — **cannot host this scope at all**: it requires the npm scope to equal the repository owner, and these repos are owned by the user `kannan19302` while the packages are `@unerp/*`. Deliverable: every `.npmrc` repointed, a reusable `publish-library.yml` called by each of the 13 publishable libraries, npm trusted publishing so no long-lived token exists, and publish authority documented | `grep -l 'localhost:4873' */.npmrc` returns **0** files (was 18) ✅, and a clean `pnpm install` on a runner resolves every `@unerp/*` package. The second half requires the `unerp` npm organisation to exist and a first publish to have run — until then this phase is WIP, not DONE, however complete the configuration looks | BLOCKED |
| **A02** | Standalone clean install for all 30 repos | all | A01 | Every repo installs and builds from a bare clone with no path escaping its root | For each repo: fresh clone → `pnpm install --frozen-lockfile` → `pnpm build` exits 0. Zero `workspace:*` outside a declared workspace (currently 1: `unierp-storybook`, D008). Zero `../../scripts/*` references | OPEN |
| **A03** | Split `core.prisma` — close R2 for real | data | A01 | `core.prisma` decomposed by bounded context per `BACKEND_SCHEMA § 3`; the `Tenant` back-relation block (109 lines, permanent merge hotspot) resolved | **No `.prisma` file exceeds 3,000 lines** — R2's own stated criterion. Currently 31,092 (**D001**). `pnpm db:generate` produces an identical client; `prisma migrate diff` against the pre-split schema is empty | OPEN |
| **A04** | Schema-size and duplicate-entity gate | workspace, data | A03 | A CI gate that fails on any schema file over 3,000 lines and on a model name that duplicates an existing entity by similarity | Adding a 3,001-line schema file fails CI. Adding a `Customer` model when `CrmCustomer` exists produces a warning naming both | OPEN |
| **A05** | RLS coverage sweep — all 1,029+ tenant tables | data, workspace | — | Policies for every tenant table created after the last bulk pass; the point-in-time catalogue loop replaced by a mechanism that cannot go stale | `check-rls-verify.mjs` exits 0 with **zero** exemptions, and exits 1 when a policy is dropped from any one table. The 364 tables named in `ARCHITECTURE_REVIEW § F5` — including `saas_invoices`, `payment_transactions`, `user_profiles`, `user_identities`, `email_verification_tokens` — are individually confirmed covered | DONE |
| **A06** | Coverage gate that can fail — close R6 | api, web, all with tests | L11, L12, L13 | `thresholds` in every vitest config; `all: true`; a ratchet that may only rise. **The threshold is set against coverage measured *after* the padding is deleted, not against today's number** | `unierp-api/vitest.config.ts` declares `thresholds: { lines: 80, ... }` and `all: true`. Deleting a test file fails CI. Currently `all: false` with no thresholds (**D002**). **Blocked on L11–L13 (`D016`): turning this on while 69 files of always-failing-proof tests exist would satisfy 80 % with 1,083 assertions of the form `catch (e) { expect(e).toBeDefined() }` — a worse outcome than the absent gate, because it would claim a number and be believed** | OPEN |

---

## 3. Stage A-II · Gates that actually run (Wave 0)

**This stage exists because of D013.** The most important discovery of the baseline audit was not
a missing feature — it was a gate that 21 repositories declare, that reports success, and that has
never once executed.

| ID | Phase | Repos | Depends | Deliverable | Exit | Status |
| :- | :---- | :---- | :------ | :---------- | :--- | :----- |
| **A07** | Write `check-layer.mjs` and remove its skip guard | workspace + 21 repos | A01 | The layer gate that `unierp-platform/ARCHITECTURE.md` already claims exists: asserts each repo depends only on strictly-lower-layer published artifacts, sideways and upward forbidden | The script exists in all 21 repos that invoke it (currently **0**, D013). The `if: hashFiles(...)` guard is **deleted**, not satisfied. Adding an upward dependency to any repo fails CI. Verified by deliberately adding one | OPEN |
| **A08** | Audit every skip-guarded CI step across the family | all | — | Every `if: hashFiles(...)` on a required step either removed or converted to a hard failure when the file is missing | `grep -c 'if: hashFiles' */.github/workflows/*.yml` — every surviving instance is justified in a comment naming why absence is legitimate. Currently **44 instances across 23 repos**, each a gate that passes by being absent | OPEN |
| **A09** | The break-it suite — prove every gate can fail | workspace | A06, A07, A08 | A documented set of deliberately broken commits, one per gate, each with its expected failure message; runnable on demand | `node scripts/ci/prove-gates.mjs` produces a table of gate → observed failure for **every** gate in `ci.yml`. Any gate that cannot be made to fail is reported as decorative and blocks the phase | OPEN |
| **A10** | Secret scanning at pre-commit, pre-push and CI | all | — | `gitleaks` wired at all three layers, as `PLATFORM_ARCHITECTURE § 10` already claims. It is currently in **no** repository — which is how 14 npm tokens were committed with nothing objecting | Committing a synthetic AWS key is rejected locally and in CI. `.npmrc` history reviewed and the incident closed | OPEN |
| **A11** | Repair `audit-architecture.mjs` for the polyrepo | workspace | A02 | The architecture-vs-documentation audit retargeted from the retired `ERPSys` monorepo to the 30-repo family | The script produces a non-empty CLAIM / MEASURED / VERDICT table and reports at least the known divergences (D004, D005, D013). Currently resolves `<root>/ERPSys`, which does not exist (**D014**) | OPEN |
| **A12** | Documentation-truth gate | workspace | A11 | CI fails when a governance document asserts a mechanism that does not exist — every claimed script path, gate name and command is resolved | Removing `check-rls-verify.mjs` while `ARCHITECTURE.md` still cites it fails CI. This is the gate that would have caught D013, D004 and D005 on the day each was introduced | OPEN |

---

## 4. Stage A-III · Release, deployment and hygiene (Waves 0–1)

| ID | Phase | Repos | Depends | Deliverable | Exit | Status |
| :- | :---- | :---- | :------ | :---------- | :--- | :----- |
| **A13** | Alert routing and on-call proof | infra, workspace | — | SLO breaches route to a real destination; `INCIDENT-RESPONSE.md` rehearsed. Closes the open half of R8 | A synthetic SLO breach produces a delivered alert. A rehearsal is logged with time-to-detect | OPEN |
| **A14** | Repo hygiene sweep — close R5, and find the fixes extraction dropped | mobile, all | — | The 11 one-off repair scripts and 3 error dumps removed from `unierp-mobile`'s root; a gate preventing recurrence; **and an audit for other monorepo fixes that did not reach their extracted repo** — three of these files were deleted once already, in `apps/mobile`, per `docs/ai/CHANGELOG.md`, and are present here | `git ls-files` in every repo matches an allowlist of expected root files. `fix_router*.py`, `auto_fix_router.py`, `revert_script.py`, `specific_remover.py`, `restore.py`, `gen_batch1.ps1`, `full_analyze.txt`, `remaining_errors.txt`, `missing_controllers.txt` are gone (**D006**). Also fixes `unierp-storybook/.storybook/.storybook/` (**D007**). A written list of every changelog-recorded fix checked against the extracted repos, with any that did not propagate filed as defects | DONE |
| **A15** | One-command dev environment and agent orientation across 30 repos | workspace, infra, all | A02 | A working golden path: clone → one command → running platform with seeded data. Replaces the `ARCHITECTURE.md § Running it` instructions that still point at the retired monorepo (**D005**), and lands the generated agent entrypoints in all 29 sibling repos so every vendor agent orients correctly (**D015**) | A newcomer following `README.md` reaches a working login in under 15 minutes on a clean machine. `pnpm smoke` walks register → login → read tenant data. `grep -rl ERPSys */AGENTS.md */CLAUDE.md */GEMINI.md` returns **0** files (currently 15), and `ls */AGENTS.md \| wc -l` returns 29 (currently 5) | OPEN |
| **A16** | Sandbox threat model and specification | sandbox, extension-api | — | A written threat model for the V8 isolate, enumerating every escape class: prototype pollution, `Function` constructor, async escape, timer abuse, memory exhaustion, query amplification, egress, side channels, unbounded regex | The document exists and every claim in `ARCHITECTURE.md`'s sandbox paragraph maps to a numbered threat with a stated mitigation. Any claim without a mitigation is filed as a defect | DONE |
| **A17** | Sandbox hardening | sandbox | A16 | Every threat in A16 mitigated. Currently **393 lines** carrying the platform's highest-consequence claim (**D009**) | Each A16 threat has a mitigation and a test. `process`, `require`, `fs`, `net` are provably unreachable from inside the isolate | DONE |
| **A18** | Sandbox escape-attempt suite | sandbox | A17 | An adversarial test suite: one test per A16 threat, each attempting the escape and asserting containment | Suite passes; **each test fails when its mitigation is removed** (proving the test tests something). Wired as a blocking CI gate. This is the phase that makes Track G safe to start | DONE |
| **A19** | Resource metering and governor limits | sandbox, api, kernel | A18 | Enforced CPU, wall-clock, memory, query-count, row-count and egress budgets per invocation and per tenant, with observable rejection — the direct analogue of Salesforce's governor limits | A handler exceeding any budget is terminated, the tenant is not affected, the event is audited, and the platform's p95 is unchanged under a deliberate abuse load | WIP |
| **A20** | Rate limiting, quotas and noisy-neighbour isolation | api, infra | — | Per-tenant, per-endpoint and per-principal limits; connection-pool and query-budget fairness | One tenant issuing a runaway report load leaves a second tenant's p95 within its SLO. Verified under load, not argued (**G-13**) | DONE |
| **A21** | Unified notification and delivery infrastructure | api, contracts, shared | — | One engine for email, SMS, push, in-app and webhook, with templates, localisation, preferences, quiet hours, digesting, retries and delivery tracking. Consolidates `modules/notifications` and `modules/communication` | Every notification in the platform routes through it; a per-user preference suppresses delivery across all 45 modules; delivery status is queryable. No module sends mail directly (**G-5**) | DONE |
| **A22** | Backup and restore, rehearsed | infra, data, workspace | — | A restore performed from a real backup into a clean environment, timed and logged | A full restore rehearsal is logged with measured RTO and RPO. `verify-backup.mjs` runs on a schedule and fails loudly (**G-11**) | DONE |
| **A23** | Per-tenant point-in-time recovery | data, api, infra | A22 | Restore of a single tenant to a timestamp without affecting others — a different and harder problem than cluster PITR, and the one customers actually ask for | A single tenant is restored to T−1h in a rehearsal; other tenants' data is provably untouched; the operation is audited and available from the console (**C**) | OPEN |
| **A24** | Secrets and key management | infra, api, auth | — | Central secret store, rotation, no secrets in env files in production; documented custody | No secret is readable from a repo, an image layer, or a process listing. Rotation is rehearsed. `check-secrets.mjs` blocking (**G-21**) | OPEN |
| **A25** | Field-level encryption for PII | data, api | A24 | Encryption at rest for every model in the PII registry, with searchable-encryption where lookup is required | Every one of the 21 models the PII gate found undeclared — including `HealthcarePatient` and `EducationStudent` — is encrypted or has a logged exemption with a reason | OPEN |
| **A31** | Give the application gates a home | workspace, api, web, idp, data, all with source | A29, A30 | `lint`, `typecheck`, `test`, `coverage`, `build`, `pnpm audit`, licence compliance, SBOM, migration discipline, schema lint, PII registry, RLS verification and E2E expressed as reusable workflows and invoked by every repo that has the code they check. A30 removed them from `unierp-workspace`, where they could never run; **until this lands they run nowhere at all** (**D025**) | Every gate named above executes in at least one repository, proven by a run link per gate. `check-policy-coverage.mjs` extended to assert each one has an owner that invokes it, and **fails when an owner stops** — verified by removing one. `grep -c '^\s*run:.*pnpm' unierp-workspace/.github/workflows/ci.yml` stays **0** — no `pnpm` *step*, comments about the history excepted — so the monorepo's CI cannot creep back | OPEN |
| **A30** | Get `main` green — move each gate to the repo that owns its files | workspace, api, idp, data, web | A29 | Every `check-policy.mjs` rule whose targets live in a sibling repo relocated to that repo's CI via the A29 reusable workflow, and the workspace's own CI reduced to rules about files it actually contains. **Do not fix by skipping missing targets** — the gate deliberately reports them, and that reasoning is correct (**D024**) | `gh run list --branch main --workflow CI --limit 5` shows **success**, for the first time since extraction. `node scripts/ci/check-policy.mjs` in `unierp-workspace` is clean with every off-repo rule named as delegated — never counted as 0. `node scripts/ci/check-policy-coverage.mjs` confirms every owner repo invokes the reusable gate and carries a committed ratchet baseline, and **fails when a caller is removed** — verified. Each owner's baseline reflects real counts, not zeros: `unierp-web` 309 hex / 2,315 px, `unierp-data` 22 `Float` money columns, `unierp-api` 1 raw SQL | DONE |
| **A29** | Make the gates genuinely shared, not copied | workspace, all | A02 | Every gate expressed once in `unierp-workspace` as a reusable workflow (`on: workflow_call`); every repo's `ci.yml` reduced to declaring **which** gates apply, never how one works — the invariant `unierp-workspace/README.md` already claims to own. Found by A14's propagation audit (**D019**) | `grep -l 'workflow_call' */.github/workflows/*.yml` returns the gate definitions (currently **0**), and no repo's `ci.yml` contains a gate's implementation. Changing a gate once changes it for all 30 repos, verified by changing one and observing every repo's next run. **This is what makes A07 and A08 permanent instead of 21 and 23 hand edits that drift again** | OPEN |
| **A27** | Resolve the ADP claim-branch contradiction | workspace | A15 | ADP's lock requires every agent to share one branch, because a claim is only visible where it is pushed. The only shared branch is `main`, and `verify.mjs`'s own Branch policy gate fails on `main` ("Work lands on main through the pipeline, never by a direct push"). **The lock and the branch policy are currently mutually exclusive.** Fix by moving claim state off the work branch — a dedicated `adp-state` ref written with git plumbing (`commit-tree`/`update-ref`) so an agent on `autopilot/<slug>` can claim without switching branches, or an equivalent design | Two agents on two different feature branches, neither on `main`, each see the other's claim and cannot take the same phase. Proven with two clones on two branches. `verify.mjs`'s Branch policy passes for both. Today the second agent silently claims the same work — measured, not supposed | OPEN |
| **A28** | Cross-repo work registry for the polyrepo | workspace, all | A27 | ADP coordinates *plan* state in `unierp-workspace`; the code lives in 30 other independent repositories it never touches. Two agents on genuinely independent phases can still overwrite each other in `unierp-api`. start.mjs's heuristic warning is a stopgap over a prose column. This is a real registry: which repos and paths a phase is touching, published where other agents read it | Two agents claiming phases that touch the same repository are told so before either starts, from declared data rather than a regex over prose. A phase that touches an undeclared repo is detectable after the fact | OPEN |
| **A26** | Data residency in the tenancy model | data, api, infra, contracts | A05, A25 | A tenant's residency region as a first-class attribute of the tenancy model, enforced at write time — designed in, because retrofitting it is a migration of every tenant (**G-3**) | A tenant pinned to a region cannot have rows written outside it; the constraint is enforced at the data layer, not by convention, and violation is a test | OPEN |

---

## 5. Track exit criteria

Track A is complete when **all** of the following are true, each demonstrated by a command:

- [ ] `grep -rl 'localhost:4873' */.npmrc` → 0 files
- [ ] Every repo: bare clone → `pnpm install --frozen-lockfile` → `pnpm build` exits 0
- [ ] `find unierp-data/prisma -name '*.prisma' -exec wc -l {} + | sort -rn | head -1` → under 3,000
- [ ] `check-rls-verify.mjs` exits 0 with zero exemptions, and exits 1 on a dropped policy
- [ ] Every vitest config declares `thresholds` and `all: true`; deleting a test fails CI
- [ ] `ls */scripts/check-layer.mjs | wc -l` equals the number of repos declaring it, and no
      `if: hashFiles` guard remains on a required step
- [ ] `prove-gates.mjs` shows an observed failure for **every** gate in `ci.yml`
- [ ] `gitleaks` blocks a synthetic secret at pre-commit, pre-push and in CI
- [ ] `audit-architecture.mjs` reports against the polyrepo and finds no undocumented divergence
- [ ] The sandbox escape suite passes, and each test fails when its mitigation is removed
- [ ] Governor limits terminate an abusive handler without affecting other tenants, under load
- [ ] A per-tenant PITR restore has been rehearsed and logged
- [ ] A newcomer reaches a working login in 15 minutes following only the repo's own README
- [ ] `00-BASELINE § 7` re-measured, and every row that this track owns has moved

**And the one that matters most:** every defect D001–D014 is either closed or converted into a
numbered phase with an owner. None may be closed by amending the claim instead of fixing the
mechanism.

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 26 phases in three stages. A07–A09 and A12 added specifically in response to D013 — the layer gate that 21 repos declare and none contain. | Claude Code |
| 2026-08-07 | A14 DONE. A01 amended: the public npm registry chosen after GitHub Packages was found unable to host the `@unerp` scope — the original recommendation repeated `ROADMAP.md`'s claim without checking the constraint. A27–A28 added (ADP's claim-branch contradiction and cross-repo registry); A29 added after A14's propagation audit found `workflow_call` used in zero repositories (D019). | Claude Code |
| 2026-08-07 | **A30's exit criterion amended, deliberately and logged.** It originally required `grep '"(apps\|packages)/…"' check-policy.mjs` to return 0 — i.e. rewriting every rule's paths. The design chosen instead keeps the monorepo path as the rule's declaration and resolves it through an `OWNERSHIP` table, so a rule runs in the repo that owns its files and is explicitly *delegated* elsewhere. That is better: it keeps one rule definition for the whole family rather than 26 copies, which is the D019 lesson. The criterion now names what actually proves the fix — a clean workspace run with delegations named, a coverage check that fails when an owner stops running the gate, and baselines holding real counts instead of zeros. | Claude Code |
