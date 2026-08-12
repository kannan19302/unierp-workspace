# 90 · DEFECT LOG — architecture-level defects and improvements

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
>
> **APPEND-ONLY.** Never delete a defect. Never renumber one. A defect that turns out not to be a
> defect is closed with `WONTFIX` and the reasoning — that reasoning is the most useful thing in
> this file for the next person who notices the same thing.
>
> **A defect needs a reproduction**: the command, the file and line, and what you observed.
> `ARCHITECTURE_REVIEW § F5` moved from "theoretical drift risk" to "364 unprotected tables" purely
> because someone measured it. That is the difference between a finding and a worry.

---

## 1. How to file

```
1  Take the next ID. Never reuse one.
2  Severity per 02-EXECUTION-GUIDELINES § 6:
      Critical  tenant leak · auth bypass · RCE · a gate that silently does not run
      High      correctness or financial-integrity risk · a stated exit criterion not met
      Medium    misleading documentation · maintainability · hygiene · duplicated mechanism
      Low       cosmetic · stale prose · nice-to-have
3  Write the REPRODUCTION. A command and its observed output. No exceptions.
4  Name the phase that will fix it, or file one.
5  Append one line to docs/ai/CHANGELOG.md.
6  Do NOT fix it inline unless it blocks your current phase.
```

**Severity → response:** Critical stops the current phase and becomes a Wave-0 phase. High is
fixed within the current wave. Medium becomes a phase in the owning track. Low is batched.

**The category this project is prone to.** Six of the fourteen defects below are the same shape: a
*claim that outlived its mechanism*. `@ts-nocheck` made `typecheck` pass while checking nothing;
`all: false` makes coverage report while asserting nothing; `if: hashFiles(...)` makes the layer
gate green while executing nothing. When you find one, check whether the neighbouring claims have
the same problem — they usually do.

---

## 2. Open defects

### D013 · 🔴 CRITICAL · The layer gate is decorative in all 21 repos that declare it

**Found:** 2026-08-07, during the programme baseline audit.
**Fixed by:** [A07](10-TRACK-A-FOUNDATION.md), with [A08](10-TRACK-A-FOUNDATION.md) sweeping the
class and [A12](10-TRACK-A-FOUNDATION.md) preventing recurrence.

Every repository's `ci.yml` contains:

```yaml
# The layer rule, asserted rather than assumed. See scripts/check-layer.mjs.
- name: Layer rule
  run: node scripts/check-layer.mjs
  if: hashFiles('scripts/check-layer.mjs') != ''
```

The script exists in **no repository**. The guard therefore evaluates false, the step is silently
skipped, and the job reports success.

**Reproduction:**

```bash
grep -l 'check-layer.mjs' */.github/workflows/ci.yml | wc -l   # → 21
ls */scripts/check-layer.mjs 2>/dev/null | wc -l                # → 0
```

**Why this is Critical rather than Medium.** `unierp-platform/ARCHITECTURE.md` states:

> *"This is not a convention. Each repo's CI runs `scripts/check-layer.mjs`, and a package cannot
> import what is not in its `package.json`."*

The second clause is genuinely load-bearing — a repo cannot import what it does not declare, so a
cycle is hard to create by accident. **The first clause has never executed.** The layered polyrepo
is the platform's foundational design decision and the entire justification for having thirty
repositories; its stated enforcement mechanism does not exist. This is
`ARCHITECTURE_REVIEW § F2` reproduced exactly, in the one gate the whole topology rests on.

**Do not close this by amending `ARCHITECTURE.md`.** Write the script.

---

### D016 · 🔴 CRITICAL · 70 % of the test suite consists of tests that cannot fail — and CI excludes them anyway

**Found:** 2026-08-07, while auditing the programme's coverage of `CODE_STANDARDS.md`.
**Fixed by:** [L11–L14](21-TRACK-L-CODE-QUALITY.md). **Blocks [A06](10-TRACK-A-FOUNDATION.md).**

**Reproduction:**

```bash
find . -name '*.coverage.spec.ts' | grep -v node_modules | xargs wc -l \
  | awk '/total$/{next}{n++;s+=$1}END{print n" files, "s" lines"}'
# → 69 files, 194494 lines

find . \( -name '*.spec.ts' -o -name '*.test.ts' -o -name '*.spec.tsx' -o -name '*.test.tsx' \) \
  | grep -v node_modules | xargs wc -l \
  | awk '/ total$/{next}{n++;s+=$1}END{print n" files, "s" lines"}'
# → 489 files, 278066 lines
```

**194,494 of 278,066 lines of test code — 70 % — live in 69 `*.coverage.spec.ts` files.** Every one
of the 1,176 `it()` blocks in them has this shape (1,083 confirmed verbatim; the remaining 93 are
variants in 9 files):

```ts
it("getCustomers", async () => {
  try {
    const result = await service.getCustomers("t1");
    expect(result).toBeDefined();
  } catch (e) {
    // Method exercised for coverage even if it throws due to incomplete mocks
    expect(e).toBeDefined();
  }
});
```

**This test passes whether the method works or throws.** `expect(e).toBeDefined()` on a caught
error is unconditionally true. The file's own comment states the intent plainly. Prisma is mocked
with a single object carrying every field name any model might have, so nothing about the real
data layer is exercised either.

**And they do not run in CI.** `unierp-api/vitest.config.ts`:

```js
exclude: process.env.CI
  ? ["**/node_modules/**", "**/dist/**", "**/*.coverage.spec.ts"]
  : ["**/node_modules/**", "**/dist/**"],
```

So the suite is smaller in CI than locally, and the 489-spec-file figure — which
`ARCHITECTURE_REVIEW § 2` cites as "474 spec files" evidence of testing effort, and which
`00-BASELINE § 4⑩` repeated — overstates what is verified by roughly a factor of three.

**Why this is Critical and not High.** `CODE_STANDARDS.md § 8` already forbids exactly this, and
it was written *about this file*:

> *"A 23,000-line test file that raises a percentage without asserting behaviour is worse than no
> test — it buys false confidence at the cost of maintenance."*

`unierp-api/src/modules/crm/tests/crm.service.coverage.spec.ts` is **23,285 lines**. The standard
named the file, the file is still there, and nothing mechanical objects.

**The sequencing consequence, which is the real damage.** [A06](10-TRACK-A-FOUNDATION.md) turns on
coverage thresholds. If A06 lands while these files exist and are re-included, they will satisfy an
80 % threshold with tests that assert nothing — producing a *worse* outcome than today's absent
gate, because today's absent gate at least does not claim anything. **A06 must not close before
L11–L12.** This dependency was missing from the plan as first written and is now recorded.

---

### D025 · 🔴 CRITICAL · Five of workspace CI's eight jobs could never run, and their gates run nowhere

**Found:** 2026-08-07, while getting `main` green (A30). **Fixed by:** **A31**.

`unierp-workspace/.github/workflows/ci.yml` was the **monorepo's** CI, inherited whole at
extraction. Five of its eight jobs — `static`, `supply-chain`, `test`, `build`, `e2e` — ran
**27 `pnpm` steps** in a repository that has **no `package.json` and no application source**.

**Reproduction:**

```bash
ls unierp-workspace/package.json          # No such file or directory
python3 -c "import yaml;d=yaml.safe_load(open('unierp-workspace/.github/workflows/ci.yml'));
[print(j, sum('pnpm' in str(s.get('run','')) for s in v.get('steps',[]))) for j,v in d['jobs'].items()]"
#  guard 0 · static 7 · supply-chain 2 · codeql 0 · test 6 · build 4 · e2e 8 · ci-passed 0
```

Not one could ever have passed. And because all five declared `needs: guard`, they sat
permanently **"skipped"** behind a guard job that was itself failing — so the CI summary read
`failure skipped skipped skipped skipped skipped skipped` and nobody could tell the difference
between "not reached" and "cannot exist".

**This is the same shape as D013 at the level of whole jobs.** D013 was one step that passed by
being absent; this is five jobs that never ran and therefore never failed.

**What was lost.** Removing them from this repo is not weakening a gate — they never ran here.
But `lint`, `typecheck`, `test`, `coverage`, `build`, `pnpm audit`, licence compliance, SBOM,
migration discipline, schema lint, the PII registry, RLS verification and E2E **must run
somewhere**, and today they largely do not:

```bash
grep -oE 'run: (pnpm|npm) [a-z:]+' unierp-api/.github/workflows/ci.yml | sort -u
#  run: npm install          ← that is the whole of it
```

Every repo's `ci.yml` is a hand copy (**D019**) and `unierp-api`'s runs only `npm install`. So the
application-level gates for a 45-module financial system are currently enforced by nothing.

**Filed rather than absorbed.** A30 made this repo's CI honest about what it can verify. **A31
gives the application gates a home**, using the same reusable-workflow mechanism, and until it
lands this is an open hole — not a solved problem.

---

### D024 · 🔴 CRITICAL · `main`'s own CI has been red since extraction, so nothing has been gated

**Found:** 2026-08-07, checking CI before merging the programme PR.
**Fixed by:** a new phase — **A30** — with A11 and A29.

`unierp-workspace`'s `ci.yml` header states the contract:

> *"CONTRACT: no code with a failing check reaches main, and nothing merges red."*

**`main` is red, and has been for at least five consecutive runs:**

```bash
gh run list --branch main --workflow CI --limit 5 --json conclusion,createdAt,headSha
#  failure  2026-08-07T04:37  71555ffa   ← current HEAD
#  failure  2026-08-07T03:43  5d6c6715
#  failure  2026-08-07T03:43  6ff67933
#  failure  2026-08-06T01:35  4a32a981
#  failure  2026-08-05T20:13  5fa7abbb
```

**The cause.** `scripts/ci/check-policy.mjs` has a HARD rule,
`control-plane-seeded-to-tenant`, whose targets are **monorepo paths**:

```
packages/database/prisma/seed.ts
apps/idp/src/modules/auth/auth.service.ts
```

Both files exist — as `unierp-data/prisma/seed.ts` and
`unierp-idp/src/modules/auth/auth.service.ts`. **But `unierp-workspace` is checked out alone in
CI and has no `apps/` or `packages/` directory at all**, so the gate reports two missing targets,
counts them as violations, and exits 1. Nine rule targets across the file point at monorepo paths:

```bash
grep -oE '"(apps|packages)/[^"]+"' scripts/ci/check-policy.mjs | sort -u   # → 9
```

**The gate's own reasoning is correct and must be preserved.** Its comment says:

> *"`read()` returns null for a missing file, so the gate silently stopped checking it — a
> control that quietly covers less than it claims is worse than no control. Missing targets are
> now reported rather than skipped."*

That is the D013 lesson applied properly. Whoever wrote it was right. **Do not fix this by
skipping missing targets — that reverts the fix and re-hides the problem.**

**Why this is Critical.** A gate that *always* fails is as useless as one that never fails, and it
is worse in one specific way: people stop reading it. Five red runs on `main` means every merge
since extraction has happened over a red build, so the "nothing merges red" contract has not held
for days — and the next genuine violation will arrive in a job that was already failing.

**The structural cause, and why the fix is not a path edit.** A gate living in the orchestration
repo cannot check files owned by sibling repos, because CI checks out one repository. These rules
have to run **in the repo that owns the file**, which is exactly what D019's missing
`workflow_call` mechanism is for. Editing the paths would make the gate pass locally — where the
siblings are on disk — and fail in CI forever.

---

### D023 · 🔴 High · The four verticals were archived before their code moved

**Found:** 2026-08-07, when pushing agent entrypoints returned 403 on four repositories.
**Fixed by:** [E26](14-TRACK-E-BUSINESS-APPS.md), whose scope this changes materially.

`unierp-app-education`, `-fieldservice`, `-healthcare` and `-realestate` are **archived on
GitHub**. Their description reads: *"Superseded by unierp-extensions/education — archived. The
four first-party verticals now live in github.com/kannan19302/unierp-extensions."*

**The supersession moved the name and not the code.**

| Archived repo | Source lines | Replacement | Lines |
| :------------ | -----------: | :---------- | ----: |
| `unierp-app-education` | 532 | `unierp-extensions/education` | **36** |
| `unierp-app-healthcare` | 881 | `unierp-extensions/healthcare` | **37** |
| `unierp-app-fieldservice` | 426 | `unierp-extensions/field-service` | **39** |
| `unierp-app-realestate` | 410 | `unierp-extensions/real-estate` | **26** |

**Reproduction:**

```bash
gh api repos/kannan19302/unierp-app-healthcare --jq .archived        # → true
find unierp-app-healthcare -name '*.ts' -not -path '*/node_modules/*' | xargs wc -l | tail -1
wc -l unierp-extensions/healthcare/src/index.ts                      # → 37
```

`unierp-app-healthcare` contains `clinical.controller.ts`, `clinical.service.ts`,
`core-client.ts`, `app.module.ts`, bundle-build scripts and a Prisma config. Its replacement is
one 37-line `index.ts`. **2,249 source lines across the four are archived behind a read-only
flag, and 138 lines stand in their place.**

**Two consequences:**

1. **The code is not lost but it is not reachable either** — archived repos are read-only, so the
   only way forward is to port from the archive into `unierp-extensions`. Nobody can push a fix
   to the archive, which is correct, but it means the vertical functionality currently ships
   nowhere.
2. **`00-BASELINE § 3` is wrong about the family size.** It describes 30 repositories and lists
   these four with real file counts as though they were live. **26 are live.** Corrected there.

**E26's scope changes:** its text said the extracted vertical services should become *"genuinely
functional rather than 12-file shells."* The 12-file versions are archived; the live versions are
one-file shells. E26 is now a **port**, from the archive into `unierp-extensions`, against the
extension API — not a deepening of code that is already in place.

---

### D020 · 🔴 CRITICAL · The extension kill switch is per-process, so it does not work in production

**Found:** 2026-08-07 by phase A16's threat model. **Fixed by:** [A17](10-TRACK-A-FOUNDATION.md).
**Threat:** `unierp-sandbox/docs/THREAT-MODEL.md` T12.

**Reproduction:**

```bash
grep -n 'private disabled\|private cpuWindow' unierp-sandbox/src/index.ts
# 147:  private disabled = new Set<string>();
# 148:  private cpuWindow = new Map<string, { windowStart: number; cpuMs: number }>();
```

Revocation state is an **instance field on `SandboxRunner`**. Every API replica holds its own set,
so `disable()` on one replica leaves the extension running on all the others. It is also not
persisted, so a restart or rolling deploy re-enables everything — including extensions an operator
revoked deliberately and extensions the CPU breaker tripped automatically.

`PLATFORM_ARCHITECTURE § 8.3` requires this kill switch to be reachable from the Platform Admin
Console. **An operator using it during an incident would see it succeed while the extension kept
executing.** That is why this is Critical rather than High: it is the control someone reaches for
when something is already going wrong, and it lies.

There is a test — *"fails closed once the kill switch is thrown"* — and it passes, because it
exercises one `SandboxRunner` instance. The test is correct and the claim is still false.

---

### D021 · 🔴 CRITICAL · The egress allowlist is a hostname string match, not SSRF protection

**Found:** 2026-08-07 by phase A16. **Fixed by:** [A17](10-TRACK-A-FOUNDATION.md).
**Threat:** `THREAT-MODEL.md` T13.

**Reproduction:**

```bash
grep -cE 'dns|lookup|resolve4|isPrivate|169\.254' unierp-sandbox/src/index.ts   # → 0
```

`assertEgressAllowed` compares `new URL(url).hostname` against an install-time approved set and
resolves nothing. So an approved hostname under the extension author's control that resolves to
`169.254.169.254`, `127.0.0.1`, or any RFC 1918 address passes the check and reaches the host's own
network — cloud instance metadata included. The allowlist is also checked only on the initial URL,
so a redirect leaves the final destination unchecked, and no scheme restriction exists.

**This also makes `ARCHITECTURE.md`'s "no filesystem" claim only half true.** It holds for the
isolate; whether it holds for the egress path depends entirely on what `host.httpFetch` accepts,
which the sandbox does not constrain.

Two tests cover this — allow and deny by hostname — and both pass. They test the mechanism that
exists, not the threat it appears to defend against.

---

### D022 · 🔴 High · One tenant's extension can OOM the process serving every tenant

**Found:** 2026-08-07 by phase A16. **Fixed by:** [A17](10-TRACK-A-FOUNDATION.md).
**Threat:** `THREAT-MODEL.md` T11, with T19.

**Reproduction:**

```bash
grep -cE 'maxBytes|byteLength|payloadSize|length >' unierp-sandbox/src/index.ts   # → 0
grep -cE 'concurren|semaphore|maxIsolates|inFlight' unierp-sandbox/src/index.ts   # → 0
```

Bridge arguments and results cross as JSON and **nothing caps their size**. An extension inside a
32 MB isolate can hand the host a ~30 MB string, which the host then `JSON.parse`s on the host
heap — where there is no per-extension cap at all. Compounding it, `run()` creates an isolate per
invocation with **no concurrency limit**, each reserving up to `memoryMb`, so the per-isolate
budget is enforced while the aggregate is not.

The isolate boundary holds throughout. The blast radius is the shared API process, which serves
every tenant.

---

### D001 · 🔴 High · `core.prisma` is 31,092 lines; R2's exit criterion is not met

**Found:** 2026-08-07. **Fixed by:** [A03](10-TRACK-A-FOUNDATION.md), gated by A04.

`IMPLEMENTATION_PLAN § 10` states R2's exit criterion as **"No file over 3,000 lines."** The schema
has been split into 18 domain files — real progress — but the split extracted the domains and left
the core behind.

**Reproduction:**

```bash
find unierp-data/prisma -name '*.prisma' -exec wc -l {} + | sort -rn | head -3
# 31092  unierp-data/prisma/schema/core.prisma
#  1327  unierp-data/prisma/schema/crm.prisma
#  1135  unierp-data/prisma/schema/projects.prisma
```

10× the stated limit. `ARCHITECTURE_REVIEW § F4`'s reasoning still applies in full: no human and no
agent reads 31,000 lines in one context, so every change to a core model is made without seeing the
surrounding graph — which is stated there as the direct cause of duplicate entities. R2 currently
reads as addressed in a way that is not true.

---

### D002 · 🔴 High · The coverage gate still cannot fail

**Found:** 2026-08-07. **Fixed by:** [A06](10-TRACK-A-FOUNDATION.md), [J02](19-TRACK-J-QUALITY.md).

`ARCHITECTURE_REVIEW § F2` filed this on 2026-07-30 as *"`all: false` and no threshold set — it
reports, it cannot fail."* It is unchanged.

**Reproduction:** `unierp-api/vitest.config.ts`, `coverage` block — `all: false`, and there is no
`thresholds` key anywhere in the file. CI runs `pnpm test:coverage` and uploads the artefact
(`ci.yml:222–230`); nothing asserts a floor.

489 spec files exist. Their coverage number is therefore unfalsifiable, and deleting any of them
breaks no build.

---

### D003 · 🔴 High · `@unerp` scope points at `localhost:4873` in 18 repos

**Found:** 2026-08-07 (previously identified in `ROADMAP.md § Now`).
**Fixed by:** [A01](10-TRACK-A-FOUNDATION.md).

**Reproduction:**

```bash
grep -l 'localhost:4873' */.npmrc | wc -l   # → 18
```

`ROADMAP.md` calls this *"the one thing that blocks the rest"* and explains that the first cutover
was reverted because every `pnpm install --frozen-lockfile` on a runner resolved `@kannan19302` against
the runner's own localhost. Still true. This is one decision, not one commit, and almost the whole
programme depends on it.

---

### D014 · 🟠 Medium · `audit-architecture.mjs` targets the retired monorepo

**Found:** 2026-08-07. **Fixed by:** [A11](10-TRACK-A-FOUNDATION.md).

`unierp-workspace/scripts/ci/audit-architecture.mjs` resolves `const MONO = join(ROOT, "ERPSys")`.
The `ERPSys` monorepo is retired (`unierp-workspace` HEAD: *"docs: record the monorepo's
retirement"*). The script's whole purpose is to audit documented claims against the tree — so the
tool that would have caught D013, D004 and D005 is itself pointed at a path that does not exist.

---

### D019 · 🔴 High · Every repository's CI is a byte copy — `workflow_call` is used nowhere

**Found:** 2026-08-07, by the propagation audit A14's exit criterion requires.
**Fixed by:** a new phase — see § 2a below.

**Reproduction:**

```bash
grep -l 'workflow_call' */.github/workflows/*.yml | wc -l    # → 0
```

`unierp-workspace/README.md` states the invariant this repository owns:

> *"Every gate lives here as a reusable workflow — a repository declares **which** gates
> apply, never **how** a gate works."*

**No repository declares a reusable workflow, and none consumes one.** Every repo's `ci.yml`
is an independent copy. `docs/ai/CHANGELOG.md` already recorded this once — *"0 of 9 workflows
declare `workflow_call` — every repo CI is a copy, the exact § 1.1 failure § 4.6 claims to
prevent"* — and it is unchanged.

**Why this is High, and why it was found now.** It makes A07 and A08 far more expensive and
inherently temporary: the `check-layer.mjs` gate must be fixed in 21 repositories by hand, the
44 `if: hashFiles` guards in 23 repositories by hand, and nothing stops the next divergence.
D013 exists *because* 21 copies of one step could drift from reality together and silently. A
family of 30 hand-copied CI files will reproduce that class indefinitely.

It is also the same shape as D006, which this audit was looking for: **a fix that does not
survive being copied.** The mobile debris was deleted once in the monorepo and returned through
extraction. Copied CI cannot be fixed once either.

---

### D015 · 🟠 Medium · Every agent entrypoint in the family points at the retired monorepo

**Found:** 2026-08-07, while building the vendor-agnostic agent workflow.
**Fixed by:** `scripts/sync-agent-entrypoints.mjs`, and [A15](10-TRACK-A-FOUNDATION.md).

**Reproduction:**

```bash
ls */AGENTS.md | wc -l                                        # → 5 repos
grep -l 'ERPSys' */AGENTS.md */CLAUDE.md */GEMINI.md | wc -l  # → 15 files, all of them
```

`unierp-corporate-website` and the four `unierp-app-*` verticals each carry `AGENTS.md`,
`CLAUDE.md` and `GEMINI.md`. All fifteen state: *"There is one governing document set for the
entire program, and it lives at `ERPSys/docs/ai/`"*, followed by a table of ten file paths under
that root. `ERPSys` is retired.

**Why this matters more than its severity suggests.** These files are the **first thing every
vendor agent reads** — `AGENTS.md` is the emerging cross-vendor convention, and `CLAUDE.md` /
`GEMINI.md` are read automatically by their respective tools. So the opening instruction to any
agent working in those five repositories is to go somewhere that does not exist. The remaining
**25 repositories have no entrypoint at all**, and therefore no orientation, no layer statement,
and no knowledge that a 278-phase plan exists.

This is the same class as D005 — a pointer outliving its target — and it is the specific reason
multi-vendor agent work does not currently function in this family.

**The secondary finding:** `unierp-corporate-website`'s copy had already drifted from its source
independently. Fifteen hand-maintained copies of the same guidance across five repos will always
drift, which is why the fix is one canonical `unierp-workspace/AGENTS.md` plus generated pointers,
not fifteen edited files.

---

### D004 · 🟠 Medium · `ARCHITECTURE.md` places the outbox in the wrong repository

**Found:** 2026-08-07. **Fixed by:** [A12](10-TRACK-A-FOUNDATION.md) (documentation-truth gate).

`unierp-platform/ARCHITECTURE.md § Follow one request all the way through`, step 6:

> *"The write emits a domain event to the transactional outbox in `unierp-kernel`."*

**Reproduction:** `unierp-kernel/src/index.ts` is 56 lines and contains only the `OutboxEvent`
*interface*. The implementation — dispatcher, processor, handler registry, metrics, dead-letter
replay, 14 files — is in `unierp-api/src/modules/outbox/`.

Consequence: an agent told to change outbox behaviour reads `unierp-kernel`, finds 56 lines of type
declarations, and has no signal about where the real code lives.

---

### D005 · 🟠 Medium · The documented way to run the project does not work

**Found:** 2026-08-07. **Fixed by:** [A15](10-TRACK-A-FOUNDATION.md), gated by A12.

`unierp-platform/ARCHITECTURE.md § Running it` instructs:

```bash
git clone https://github.com/kannan19302/ERPSys
cd ERPSys
pnpm install
pnpm dev
```

`ERPSys` is retired. `ARCHITECTURE.md` also links `ERPSys/docs/PLATFORM_ARCHITECTURE.md` as the
canonical architecture reference; that document now lives at
`unierp-workspace/docs/PLATFORM_ARCHITECTURE.md`. **The umbrella repository's onboarding
instructions point a newcomer at a repository that no longer exists** — and nothing costs a project
more contributor throughput than that (`03-GAP-ANALYSIS § G-23`).

---

### D006 · 🟠 Medium · `unierp-mobile` tracks 11 repair scripts and 3 error dumps

**Found:** 2026-08-07. **Fixed by:** [A14](10-TRACK-A-FOUNDATION.md), [I01](18-TRACK-I-CLIENTS.md).

**Reproduction:** `ls unierp-mobile/` — `auto_fix_router.py`, `fix_router.py`, `fix_router_2.py`,
`fix_router_3.py`, `fix_router_4.py`, `fix_router_5.py`, `fix_pos_routes.py`, `restore.py`,
`revert_script.py`, `specific_remover.py`, `gen_batch1.ps1`, `generate.ps1`, `full_analyze.txt`,
`remaining_errors.txt`, `missing_controllers.txt`.

R5's exit criterion is *"Clean `git status`, no scratch files tracked."* Not met.

**These were already deleted once.** `docs/ai/CHANGELOG.md` records, under the Flutter formatting
entry: *"Also deletes `auto_fix_router.py`, `fix_router.py` and `fix_pos_routes.py` from
`apps/mobile` — one-off routing fixers with absolute paths into a OneDrive directory and a Gemini
IDE task log, referenced by nothing, which is the 'no one-off scripts or debug artifacts left
behind' rule verbatim."* All three are present in `unierp-mobile`. The deletion landed in the
monorepo and did not reach the extracted repository — which means the polyrepo extraction did not
carry forward at least one hygiene fix, and quite possibly others. **A14 should check for the same
class of regression across every extracted repo, not just remove these files.**

**The secondary concern matters more than the hygiene.** Those filenames document a period of
automated mass-repair of the routing and controller layer, and `missing_controllers.txt` implies
routes that pointed at controllers which did not exist. Whether those repairs were correct has
never been independently verified — which is why [I02](18-TRACK-I-CLIENTS.md) exists as a separate
correctness pass rather than being folded into cleanup.

---

### D007 · 🟠 Medium · `unierp-storybook/.storybook/` is nested inside itself

**Found:** 2026-08-07. **Fixed by:** [A14](10-TRACK-A-FOUNDATION.md).

**Reproduction:**

```bash
ls -a unierp-storybook/.storybook/          # → .storybook  main.ts  preview.ts
test -e unierp-storybook/.storybook/.storybook/main.ts && echo NESTED   # → NESTED
```

Duplicate `main.ts` and `preview.ts` at two depths. Whichever is stale will diverge silently, and
`ls` without `-a` does not reveal the nesting — which is presumably how it survived.

---

### D008 · 🟠 Medium · `unierp-storybook` cannot install standalone

**Found:** 2026-08-07. **Fixed by:** [A02](10-TRACK-A-FOUNDATION.md), [B13](11-TRACK-B-DESIGN-SYSTEM.md).

**Reproduction:** `grep -l 'workspace:\*' */package.json` → `unierp-storybook/package.json` (the
only remaining instance across all 30 repos — the others have been fixed).

Storybook is the design system's only visual surface and the only place a component's states are
reviewable. Track B depends on it heavily, and it is the one repo still carrying the
`EUNSUPPORTEDPROTOCOL` failure `ROADMAP.md` describes.

---

### D009 · 🟠 Medium · The sandbox carries the platform's highest-consequence claim in 393 lines

**Found:** 2026-08-07. **Fixed by:** [A16–A19](10-TRACK-A-FOUNDATION.md).

**Reproduction:** `wc -l unierp-sandbox/src/index.ts` → 393. One spec file
(`sandbox.spec.ts`). No adversarial test suite.

`ARCHITECTURE.md` claims the isolate has *"no `process`, no `require`, no filesystem, and metered
CPU, memory, query and egress budgets."* That is the correct specification. It is also unverified,
and it is the only thing standing between one tenant's custom logic and every other tenant's
payroll and patient records.

**Filed as Medium rather than Critical deliberately:** there is no evidence the sandbox is
*broken*. The defect is that a claim of this consequence is unproven, and Track G — 30 phases of
customer-authored code — is blocked on it for exactly that reason.

> **AMENDED 2026-08-07 by phase A16 — this defect's premise was wrong in two ways.**
>
> 1. *"393 lines is not obviously enough"* used line count as a proxy for rigour. It is a bad
>    proxy. The design is careful: a real `isolated-vm` isolate rather than `node:vm`, host-side
>    scope re-checks, no Prisma client or connection string or settable tenant id ever handed in,
>    a frozen global, `finally { dispose() }`.
> 2. *"unverified by any adversarial test"* was false. `src/sandbox.spec.ts` has **18 targeted
>    tests**, including one that denies the exact `node:vm` escape the previous implementation
>    allowed.
>
> The severity stands but the reasoning changes, and the corrected version is sharper: **the tests
> verify the mitigations that were designed, and nine threats were never designed for.** Three are
> now filed separately as **D020** (the kill switch does not work across replicas), **D021** (the
> hostname allowlist is not SSRF protection) and **D022** (unbounded bridge payloads and isolate
> concurrency). Full analysis in `unierp-sandbox/docs/THREAT-MODEL.md`.
>
> The lesson worth keeping: *a component with passing tests and a wrong claim looks exactly like a
> component with passing tests.* Counting lines and counting tests both missed it; reading it did
> not.

---

### D012 · 🟡 Low · Builder editors are 9-line stubs behind complete list pages

**Found:** 2026-08-07. **Fixed by:** [G10, G11, G16](16-TRACK-G-DEVELOPER-PLATFORM.md).

**Reproduction:**

```bash
wc -l unierp-developer/src/app/builder/erp/{dashboards,forms,workflows}/\[id\]/page.tsx
# 9 each
```

Against 34,636 lines in the repo overall. The list pages are built; the editors — the things that
make a builder a builder — are not. Low severity because it is honestly incomplete rather than
misleading, but it is worth recording that the effort distribution inverted.

---

### D010 · 🟡 Low · `unierp-corporate-site-template` is a `package.json`

**Found:** 2026-08-07. **Fixed by:** [F16](15-TRACK-F-STUDIO-AND-SITES.md).

**Reproduction:** `ls unierp-corporate-site-template/` → `CONTRIBUTING.md`, `LICENSE`,
`README.md`, `SECURITY.md`, `package.json`. Zero source files.

It appears in the repository map alongside 29 repositories that contain real code, so it reads as a
shipped template.

---

### D011 · 🟡 Low · `ROADMAP.md`'s extraction status is materially stale

**Found:** 2026-08-07. **Fixed by:** [A12](10-TRACK-A-FOUNDATION.md) once the truth gate exists;
until then by a direct amendment.

`ROADMAP.md § Where the project actually is` states the extracted repos *"still declare `@kannan19302/*`
as `workspace:*`, so `npm install` in a clean clone fails"* and that the Dockerfiles *"were removed
rather than repaired."*

**Reproduction:** one repo still declares `workspace:*` (D008), not all of them; and the Dockerfiles
are back — `unierp-api`, `unierp-web`, `unierp-console`, `unierp-developer` and `unierp-infra` all
have HEAD `feat(docker): build this image from this repository`.

The staleness understates real progress, which is the benign direction — but `ROADMAP.md` is what a
newcomer reads to decide whether the project is alive.

---

### D026 · 🟠 Med · `ev-a17.txt` committed at the root of `unierp-workspace` — a D006/R5 recurrence that turned the repo-hygiene gate red

**Found:** 2026-08-08 by A22. **Fixed by:** commit `e403d0c` on `unierp-workspace` main,
`chore(workspace): remove stray ev-a17.txt tracked at root (repo hygiene)`.

**Reproduction:**

```bash
node scripts/ci/check-repo-hygiene.mjs --repo unierp-workspace
# 1 violation: FAIL unierp-workspace/ev-a17.txt ('.txt' file at a repository root) — exit 1
```

`ev-a17.txt` was an exit-criterion evidence scratch file that the A17 phase committed to the
repository root (commit `c860b82`, `docs(ai): A17 DONE changelog line + ev-a17.txt exit-criterion
evidence`). It sat on `main`; the A22 worktree branch (`autopilot/a22-backup`) never carried it
(`git cat-file -e HEAD:ev-a17.txt` → fatal). Evidence files are consumed by `start.mjs --finish`
and belong in the worklog, never tracked at a repo root — the exact D006/R5 defect, in a second
repo. Because it was on `main`, every `verify.mjs` run over the family failed "Repo hygiene" for
reasons unrelated to the phase in flight, until the file was deleted there.

**Closed:** 2026-08-08 by commit `e403d0c` (removed the stray root file). Not fixed inline by A22.

---

### D027 · 🟠 Med · Reporting engine `groupBy` aggregations return HTTP 400 `DB_VALIDATION_ERROR`

**Found:** 2026-08-08 by A20. **Fixed by:** E35 (Ad-hoc report builder — grouping, totals).

**Reproduction:**

```bash
# POST /api/v1/reporting/engine/query — tenant session + CSRF cookie
# body: {"entity":"invoices","groupBy":["status"],
#        "aggregations":[{"fn":"SUM","field":"totalAmount"},{"fn":"COUNT","field":"id"}],"limit":100}

HTTP 400
{"code":"DB_VALIDATION_ERROR","message":"Invalid database query"}

# API log root cause:
#   Invalid `prisma.invoice.groupBy()` invocation:
#     ...
#     _avg: { select: undefined }
#   The `select` statement for type InvoiceAvgAggregateOutputType needs at least one truthy value.
```

`reporting-engine.service.ts:281` builds `model.groupBy({ by, where, _sum, _avg, _count, take })`
where each aggregation is passed as `Object.keys(a).length > 0 ? a : undefined`. When a report asks
for SUM + COUNT only (no AVG), the empty `_avg` still reaches Prisma as `{ select: undefined }` and
the entire groupBy invocation throws — so every grouped/aggregated report query 400s. Plain
`findMany` report queries work, which is why the defect surfaced only when exercising the
aggregation path. Different option shapes produce sibling Prisma validation errors (e.g.
"Every field used for orderBy must be included in the by-arguments. Missing fields: id"). Root
cause is in the service's option-shaping, not the schema.

**Closed:** _open — E35.

---


### D031 � ?? CRITICAL � Track B >=40 criterion counts files, satisfiable by shims

**Found:** 2026-08-08. **Fixed by:** Amending Track B criterion.

The exit criterion for Track B component count was \ls src/components/*.tsx | grep -v stories | wc -l >= 40\.
This was gamed by creating 61 one-line re-export shims (e.g. \export { Switch } from "./extended-inputs";\).
Because it counts files on disk, it is indistinguishable from progress unless someone opens the files.

**Reproduction:**
``bash
ls src/components/*.tsx | grep -v stories | wc -l
``

---

### D032 � ?? CRITICAL � 55 phases marked finished across two commits with no ADP claim and no evidence

**Found:** 2026-08-08. **Fixed by:** Track repair workflow.

Track A and Track B phases were marked as finished in two commits (\564430e\ and \c0a7ba0\/\4f57f8\) in about eight minutes, without going through the ADP tool (\
ode scripts/start.mjs\). There was no claim, no evidence transcript, and no worklog entry.

**Reproduction:**
``bash
git log --oneline | Select-String "complete Track"
``

---

### D033 � ?? Med � check-plan-integrity.mjs accepts an invalid status

**Found:** 2026-08-08. **Fixed by:** Track repair workflow.

\check-plan-integrity.mjs\ validates the structure of the plan tables but did not validate the status vocabulary against \VALID_STATUS\ (\OPEN\, \READY\, \WIP\, \DONE\, \BLOCKED\, \WITHDRAWN\). This allowed an agent to mark 24 phases as \COMPLETED\. Since \COMPLETED\ is neither \DONE\ nor \OPEN\, it blocked dependent tracks forever.

**Reproduction:**
Set a phase to \COMPLETED\ in a track file.
``bash
node scripts/check-plan-integrity.mjs
# Previously returned OK, ignoring the invalid status.
``

---

## 3. Closed defects

_None yet. When closing one, move its entry here, add `**Closed:** <date> by <phase>`, and state
what the fixing commit changed. Do not delete the reproduction — the next person needs to know how
it was detected._

---

## 4. Defect index

| ID | Sev | Summary | Fixed by | Status |
| :- | :-- | :------ | :------- | :----- |
| D001 | 🔴 High | `core.prisma` is 31,092 lines; R2 criterion (≤ 3,000) unmet | A03 | CLOSED |
| D002 | 🔴 High | Coverage gate cannot fail: `all: false`, no thresholds | A06, J02 | OPEN |
| D003 | 🔴 High | `@unerp` scope resolves to `localhost:4873` in 18 repos | A01 | CLOSED |
| D004 | 🟠 Med | `ARCHITECTURE.md` places the outbox in `unierp-kernel` | A12 | OPEN |
| D005 | 🟠 Med | Documented run instructions point at the retired monorepo | A15, A12 | CLOSED |
| D006 | 🟠 Med | 11 repair scripts + 3 error dumps tracked in `unierp-mobile` | A14, I01, I02 | CLOSED |
| D007 | 🟠 Med | `unierp-storybook/.storybook/.storybook/` self-nesting | A14 | CLOSED |
| D008 | 🟠 Med | `unierp-storybook` still `workspace:*`; cannot install | A02, B13 | CLOSED |
| D009 | 🟠 Med | 393-line sandbox carries the isolation claim, untested | A16–A19 | CLOSED |
| D010 | 🟡 Low | `unierp-corporate-site-template` has no source files | F16 | OPEN |
| D011 | 🟡 Low | `ROADMAP.md` extraction status materially stale | A12 | CLOSED |
| D012 | 🟡 Low | Builder `[id]` editors are 9-line stubs | G10, G11, G16 | OPEN |
| **D013** | 🔴 **Crit** | **Layer gate declared in 21 repos, script exists in 0** | A07, A08, A12 | CLOSED |
| D014 | 🟠 Med | `audit-architecture.mjs` targets the retired `ERPSys` path | A11 | CLOSED |
| D015 | 🟠 Med | All 15 agent entrypoints point at the retired monorepo; 25 repos have none | `sync-agent-entrypoints.mjs`, A15 | CLOSED |
| **D016** | 🔴 **Crit** | **70 % of test-suite volume cannot fail (`catch(e){expect(e).toBeDefined()}`), and CI excludes it. Blocks A06.** | L11–L14 | OPEN |
| D017 | 🟠 Med | 86 non-test files exceed the 1,000-line hard ceiling `CODE_STANDARDS § 4` calls unjustifiable; nothing enforces it | L01, L07–L09 | OPEN |
| D018 | 🟠 Med | `CODE_STANDARDS § 10`'s R13 lint rules (size, complexity, naming, silent catch, TODO discipline) were never implemented and had no phase | L01–L06 | OPEN |
| **D019** | 🔴 High | **`workflow_call` used in 0 repos — every CI file is a hand copy, contradicting workspace's stated invariant. Makes A07/A08 30× and temporary.** | A29 | CLOSED |
| **D020** | 🔴 **Crit** | **Extension kill switch is per-process and unpersisted — an operator using it in an incident would see it succeed while the extension kept running** | A17 | CLOSED |
| **D021** | 🔴 **Crit** | **Egress "allowlist" is a hostname string match — DNS rebinding reaches cloud metadata and localhost; redirects unchecked; no scheme restriction** | A17 | CLOSED |
| **D022** | 🔴 High | **No cap on bridge payload size or concurrent isolates — one tenant can OOM the process serving all tenants** | A17 | CLOSED |
| **D023** | 🔴 High | **The 4 verticals are archived on GitHub; 2,249 source lines replaced by 138. The supersession moved the name, not the code. Family is 26 live repos, not 30.** | E26 | OPEN |
| **D024** | 🔴 **Crit** | **`main`'s CI has been red for 5+ runs since extraction — 9 policy-rule targets are monorepo paths in a repo checked out alone. "Nothing merges red" has not held for days.** | A30 | CLOSED |
| **D025** | 🔴 **Crit** | **5 of workspace CI's 8 jobs ran 27 pnpm steps in a repo with no package.json — never ran, never failed, sat "skipped". The application gates (lint, typecheck, test, coverage, audit, RLS, PII) run NOWHERE.** | A31 | OPEN |
| **D026** | 🟠 Med | **`ev-a17.txt` committed at the root of `unierp-workspace` (D006/R5 recurrence) — turned every family `verify.mjs` "Repo hygiene" gate red on `main`, unrelated to the phase in flight** | `e403d0c` | CLOSED |
| **D027** | 🟠 Med | **Reporting engine `groupBy` aggregations return HTTP 400 `DB_VALIDATION_ERROR` (`_avg` reaches Prisma as `{ select: undefined }`) — every grouped/aggregated report query fails; plain `findMany` works** | E35 | OPEN |
| **D028** | 🔴 **Crit** | **`start.mjs` `publish()` clobbers the real git index and pushes a mass revert on every claim.** It calls `git([...], { env: { GIT_INDEX_FILE } })`, but the `git()` helper (`start.mjs:69`) destructures only `{ allowFail }` and drops `env`, so `read-tree adp-state` rewrites the working index instead of a scratch one. The following `add` + `commit` then reverts every file changed since the `adp-state` ref. Reproduced 2026-08-08: claiming J02 pushed `3bc2ddc`, reverting 8 Track A statuses (A01, A06, A23–A28), 14 `CHANGELOG` lines, `read-schema.mjs` and `start.mjs` itself to the A19-era tree. Restored in `6bdd3f2`. **Every claim since A27 landed has been silently rewriting the plan.** | A27 | CLOSED |
| **D029** | 🔴 High | **`prove-gates.mjs` stamps 6 of its 11 gates `PROVEN` without ever making one fail.** `alwaysPasses: true` on Suppression ratchet, Policy gate, Decimal arithmetic ratchet, Architecture audit, Policy-gate coverage and Layering rule takes a clean run as proof and prints `Clean baseline execution verified` in the OBSERVED FAILURE column. A09's exit criterion requires an observed failure per gate and that any gate which cannot be made to fail is reported as decorative — this is the D013 pattern inside the tool built to detect it | A09 | CLOSED |
| **D030** | 🟠 Med | **A10's three-layer secret scanning is one layer.** `.gitleaks.toml` is committed in 28 repos but `gitleaks` is invoked by no workflow and no hook; there is no `husky`, `lefthook`, `pre-commit` config or `core.hooksPath` anywhere in the family, so `.git/hooks` holds only samples. The working mechanism is `check-secrets.mjs`, and it runs in CI only. Pre-commit and pre-push do not exist | A10 | CLOSED |

---

## 5. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| **D031** | ?? **Crit** | **Track B >=40 criterion counts files, satisfiable by shims** | - | OPEN |
| **D032** | ?? **Crit** | **55 phases marked finished across two commits with no ADP claim and no evidence** | - | OPEN |
| **D033** | ?? Med | **check-plan-integrity.mjs accepts an invalid status** | Track repair | CLOSED |
| 2026-08-07 | Log established with D001–D014 from the programme baseline audit. D013 (layer gate declared in 21 repos, present in none) is the most consequential: the platform's central invariant is asserted by a CI step that has never executed. | Claude Code |
| 2026-08-08 | D027 filed by A20: reporting engine `groupBy` aggregations return HTTP 400 `DB_VALIDATION_ERROR` — reproduced via `POST /reporting/engine/query` with `groupBy` + `aggregations`; root cause in `reporting-engine.service.ts` option-shaping (`_avg` reaches Prisma as `{ select: undefined }`). Fixing phase E35. | opencode |

### D034 � ?? High � package-lock.json enforces localhost:4873 causing EINTEGRITY on real registries

**Found:** 2026-08-08 by Track C (PSC Bring-up). **Fixed by:** Track C.

The Dockerfiles for the 5 container apps run 
pm install after rewriting .npmrc to a new registry (e.g. egistry.npmjs.org), but package-lock.json contains locked tarball URLs pointing to localhost:4873 (Verdaccio). 
This mismatch causes 
pm install to fail with EINTEGRITY when the new registry returns valid tarballs with different integrity hashes than those cached for Verdaccio.

**Reproduction:**
`ash
docker compose -f docker-compose.dev.yml -f docker-compose.platform.yml --profile console up --build
# fails with npm ERR! code EINTEGRITY
`
**Fix:** Removed package-lock.json prior to 
pm install in all five Dockerfiles.

---

### D035 � ?? High � Unmigrated schema drift blocks seeding for saas_plans.version and 	enants.residency_region

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

schema.prisma contains fields (SaaSPlan.version, Tenant.residency_region) that do not exist in the database because no prisma migrate dev was ever run to generate migrations for them. The seeding script (db:seed) fails when attempting to populate these models.

**Reproduction:**
`ash
npm run db:seed
# ? Error during seeding: PrismaClientKnownRequestError: 
# The column ersion does not exist in the current database.
`
**Fix:** Created manual migrations 20260808030000_add_residency_region and 20260808040000_add_saas_plan_version.

---

### D036 � ?? High � Seeding script expects Role and User in main PrismaClient

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

Role, User, and ApiKey models were moved to idp-schema.prisma, but seed.ts and seed-platform.ts still attempt to call prisma.role.upsert() using the main client, causing immediate crashes since the models are undefined.

**Reproduction:**
`ash
npm run db:seed
# TypeError: Cannot read properties of undefined (reading 'upsert') at main
`
**Fix:** Imported IdpPrismaClient in both seed scripts and used it for IdP model seeding.

---

### D037 � ?? High � unierp-console relies on unpublished SessionTokenPayload export

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

When building console from the real npmjs registry, the build fails because the published @kannan19302/auth package does not export SessionTokenPayload. The code in unierp-console/src/lib/middleware.ts expects it, meaning the workspace was ahead of the registry.

**Reproduction:**
`ash
npm run build # inside unierp-console container
# Type error: Module '"@kannan19302/auth"' has no exported member 'SessionTokenPayload'.
`
**Fix:** Defined SessionTokenPayload locally in middleware.ts.

---

### D038 � ?? High � 
ode:22-alpine network timeouts on musl headers for isolated-vm

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

The isolated-vm native compilation step on 
ode:22-alpine fetches headers from unofficial-builds.nodejs.org, which frequently times out (ETIMEDOUT), breaking container builds entirely.

**Reproduction:**
`ash
docker compose up --build
# npm error gyp http fetch GET https://unofficial-builds.nodejs.org/... failed with ETIMEDOUT
`
**Fix:** Switched all Dockerfiles to use 
ode:22-slim (Debian) which relies on standard glibc and the official nodejs infrastructure, and updated package manager dependencies from pk to pt-get.

### D039 � ?? High � Misplaced "use client" directives break unierp-web production build

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

Several files in unierp-web/app had the "use client" directive placed *after* import statements, which causes a fatal webpack error during Next.js production builds (
pm run build).

**Reproduction:**
`ash
# Inside unierp-web container
npm run build
# Error: The "use client" directive must be placed before other expressions. Move it to the top of the file to resolve this issue.
`
**Fix:** Created and ran a script to identify all files containing "use client" and moved the directive to the very first line of the file.

### D040 � ?? High � TypeScript Set generic missing in unierp-web register page

**Found:** 2026-08-08 by Track C. **Fixed by:** Track C.

The unierp-web container build failed during 
pm run build due to a TypeScript error in pp/(auth)/register/page.tsx, where 
ew Set(prev) was implicitly typed as Set<unknown> and passed to a state setter expecting Set<string>.

**Reproduction:**
`ash
npm run build
# Type error: Argument of type '(prev: any) => Set<unknown>' is not assignable to parameter of type 'SetStateAction<Set<string>>'.
`
**Fix:** Explicitly defined the generic type 
ew Set<string>(prev) in egister/page.tsx.

### D041 � ?? High � Tenant user can access plane-1 /tenants and /extensions views in Platform Admin Console (unierp-console)

**Found:** 2026-08-08 by Track C (PSC UI E2E Exercise). **Fixed by:** Open.

During end-to-end browser testing of unierp-console (Plane 1), authenticating with a tenant user credential (dmin@kannan19302.dev) allowed the tenant user to access /tenants (viewing all provisioned cross-tenant data) and /extensions without a 403 authorization block. While sub-routes under /marketplace/analytics correctly enforced a 403 "Access Denied" page, the root /tenants and /extensions views failed to verify that the session payload carried ealm === 'provider'.

**Reproduction:**
1. Open http://localhost:3002/login
2. Authenticate as tenant admin dmin@kannan19302.dev / dmin123
3. Navigate to http://localhost:3002/tenants
4. **Observed:** Page renders full Tenant Directory with cross-tenant details and "Provision Tenant" / "Impersonate" actions.
5. **Expected:** 403 Forbidden or Access Denied UI block for non-provider staff users.

### D042 � ?? High � unierp-console/next.config.mjs defaults piBaseUrl fallback to port 3003 instead of 3001

**Found:** 2026-08-08 by Track C (PSC UI E2E Exercise). **Fixed by:** Open.

In unierp-console/next.config.mjs, the fallback piBaseUrl was defined as process.env.API_URL || 'http://localhost:3003'. Because unierp-api listens on port 3001 (and 3003 is reserved for unierp-corporate-website), all Next.js API rewrites (/api/platform/v1/*, /api/v1/*) fail with ECONNREFUSED when API_URL is omitted from the environment.

**Reproduction:**
1. Run 
pm run dev in unierp-console without API_URL set.
2. Navigate to http://localhost:3002/tenants
3. **Observed:** Server log prints Failed to proxy http://localhost:3003/api/platform/v1/super-admin/tenants [AggregateError: ] { code: 'ECONNREFUSED' }.
4. **Expected:** Fallback target should be http://localhost:3001.

### D043 � ?? High � unierp-api Docker build fails TypeScript check due to stale published Prisma client in @kannan19302/data

**Found:** 2026-08-08 by Track C (Container Stack Bring-up). **Fixed by:** Open.

During docker build of unierp-api, 
pm install fetches @kannan19302/data from egistry.npmjs.org. Its postinstall hook runs prisma generate using the schema packaged in that published version (v1.0.15). The local workspace unierp-api/src/platform/v1/plans.service.ts and super-admin.service.ts reference updated fields (SaaSPlan.version, supersededBy, 	enantConsent, impersonationSession) that were added to schema.prisma locally but are absent in the published npm package. Thus 
pm run build inside Docker fails with 20 TypeScript compiler errors.

**Reproduction:**
`ash
docker build -t unierp-api ./unierp-api
# error TS2353: Object literal may only specify known properties, and 'version' does not exist in type 'SaaSPlanCreateInput'
`
**Fix Required:** Either publish updated @kannan19302/data package to registry or mount local Prisma schemas during Docker build to run 
px prisma generate.

### D044 · 🟠 High · Track C's console surfaces satisfy their exit criterion by being read-only

**Found:** 2026-08-11, during the Track M establishment audit. **Fixed by:** [M19](22-TRACK-M-PROVIDER-ADMIN-OS.md) for the named page, [M46](22-TRACK-M-PROVIDER-ADMIN-OS.md) as the standing gate.

Track C § 6 claims: *"Every endpoint in `unierp-api/src/platform/v1` has a corresponding console
surface, or a logged reason it deliberately has none."* The claim is true and the criterion is
weaker than it reads. "A corresponding surface" was satisfied by pages that render an endpoint's
list response and cannot mutate it. The console can observe the estate; it cannot operate it.

This is the sixth instance of the shape § 1 warns about — a claim that outlived its mechanism —
except that here nothing was disabled. The criterion never asked for the mechanism.

**Reproduction:**

```bash
sed -n '38,80p' 'unierp-console/app/(control-plane)/infrastructure/kubernetes/page.tsx'
```

Observed: two `useList` calls against `/platform/v1/cluster-routing-deep/{routing,clusters}`, a
four-item `StatCardRow`, and `routing.data.slice(0, 30).map(...)` rendering a `<ul>`. There is no
filter, no server-side pagination, no detail route, and no mutation of any kind. The response
shape is unknown to the page, which compensates with
`r.sourceCluster ?? r.fromCluster ?? r.source` — three guesses at one field.

```bash
# the class, not the instance
grep -rlE 'useList<' 'unierp-console/app/(control-plane)' | wc -l   # → 100+ pages
grep -rlE 'useMutation|method: .(POST|PATCH|DELETE)' \
     'unierp-console/app/(control-plane)/infrastructure' | wc -l    # → 0
```

Eleven infrastructure pages, zero mutations among them. `ai/` and `ops/` share the shape.

**Not fixed inline, and Track C is not reopened.** Rewriting C's surfaces before M01–M15 exist
would produce eleven private implementations of the operation pipeline. The correct order is the
kernel, then the pipeline, then each domain onto it. **M46** turns the missing half of the
criterion into an executable check: a page that renders a resource kind it cannot operate fails
the build.

### D045 · 🟡 Medium · `README § 0` rule 1 lists five registration sites for a new track; there are six

**Found:** 2026-08-11, while registering Track M. **Fixed by:** Open — a Track L or A phase.

Rule 1 requires, in one commit: the README § 3 table, `DECLARED` and `TRACK_FILES` in
`check-plan-integrity.mjs`, `TRACKS` in `phase-brief.mjs`, the manifest via `--update`, and a
reason in § 6. Following exactly that list produces a broken plan, because the phase-ID character
class is hard-coded to `[A-L]` in nine places across three scripts.

**Reproduction** — before the widening applied in this commit:

```bash
grep -rn '\[A-L\]' scripts/          # → 9 hits in 3 files
node scripts/start.mjs --dry-run
```

Observed: `M01`'s dependencies (`C01, C02, B04`) parse correctly, but every *dependent* phase's
`Depends` cell containing `M07` matches no ID. `check-plan-integrity.mjs:200` strips known IDs and
treats the residue as prose, so `M07` is discarded silently rather than reported as an unknown
dependency — and `--ready` then reports M09–M46 as startable with their kernel unbuilt. The
failure is silent in exactly the direction that causes work to be started out of order.

**The general defect:** the guard at `check-plan-integrity.mjs:200` exists to catch a dependency
naming a track rather than a phase (the J26 / `"all J"` case). It cannot distinguish "prose" from
"a phase ID whose track letter this regex predates". A well-formed ID outside `[A-L]` is
indistinguishable from a comment. The durable fix is to derive the class from
`Object.keys(TRACK_FILES)` rather than to widen it again at track N.

### D046 · 🔴 CRITICAL · 54 of 156 mounted control-plane endpoints have no authorization guard of any kind

**Found:** 2026-08-11, verifying Track C's foundations before starting Track M.
**Fixed by:** [M47](22-TRACK-M-PROVIDER-ADMIN-OS.md) — Wave 0, per § 1's severity rule.

`unierp-api/src/platform/platform.module.ts` mounts 22 controllers exposing 156 endpoints under
`/platform/v1`. Fourteen of those controllers carry **no `@Permissions`, no `@UseGuards`, and no
class-level decorator of any kind** — 54 endpoints. The only global `APP_GUARD` in `app.module.ts`
is `TenantThrottlerGuard`, which rate-limits and does not authorize. Nothing else stands in front
of them.

Among the 54:

```
POST /platform/v1/offboarding/:tenantId/offboard      # terminates a tenant
POST /platform/v1/soc/:tenantId/revoke-sessions       # revokes any tenant's sessions
POST /platform/v1/soc/:tenantId/quarantine
POST /platform/v1/releases/rollback                   # rolls back the platform
POST /platform/v1/migrations/:tenantId/start
GET  /platform/v1/invoices/                           # every invoice, every tenant
POST /platform/v1/invoices/:id/adjust                 # mutates billed amounts
POST /platform/v1/plans/                              # creates pricing
POST /platform/v1/subscriptions/:tenantId/cancel
GET  /platform/v1/support/:tenantId/session-replay
```

**This falsifies C02's exit criterion**, which reads: *"Every console endpoint carries an explicit
control-plane permission."* It does not. C02 is marked `DONE`.

**Reproduction:**

```bash
cd unierp-api/src/platform
# 1. the mounted set — parsed from the controllers array, not guessed
grep -A40 'controllers:' platform.module.ts | grep -o '\w*Controller' | sort -u | wc -l   # → 22
# 2. mounted controllers with zero @Permissions
for f in v1/*.controller.ts; do
  cls=$(grep -o 'export class \w*Controller' "$f" | awk '{print $3}')
  grep -q "$cls" platform.module.ts || continue
  grep -q '@Permissions(' "$f" || echo "UNGUARDED $f"
done          # → 14 files, 54 endpoints
# 3. nothing covers them globally
grep -n 'APP_GUARD' ../app.module.ts     # → only TenantThrottlerGuard
```

**Why this is Critical and not High.** The mechanism to fix it already exists and is already used
correctly by the other eight controllers — `tenant-lifecycle.controller.ts:14-21` composes
`JwtAuthGuard`, `RbacGuard`, `ControlPlaneGuard`, `@Permissions`, `TwoPersonControlGuard` and
`@TrackChanges`, and its own comment records that an earlier `admin.tenant.*` grant was widened to
`system.tenant.*` *precisely because a tenant admin could otherwise suspend another tenant*. The
permission strings these 54 endpoints need are already in the registry and unused —
`saas.offboarding.write`, `system.tenant.offboard`, `saas.billing.write`, `saas.security.write`.
So this is not a missing capability. It is fourteen controllers that were written without applying
a guard the codebase already had, and then marked DONE without the exit criterion being run.

**Relationship to D041.** D041 reported the *console* failing to check `realm === 'provider'` on
two pages. This is the same failure one layer down and far wider: the API behind those pages does
not check either, so fixing the console alone leaves the endpoints reachable directly.

**Relationship to D032.** D032 recorded 55 Track A/B phases marked finished with no ADP claim and
no evidence. The same is true of Track C: `docs/programme/worklog/` contains a `CLAIMED` block for
C01 and **nothing at all for C02–C29**, yet all 29 are `DONE`. D046 is what that costs — an exit
criterion that says "every endpoint carries a permission" was never run, and 54 endpoints shipped
without one.

```bash
node scripts/start.mjs --who      # C01 CLAIMED, never FINISHed; C02–C29 absent
```

### D047 · 🔴 CRITICAL · A regression suite asserted the plane-1 escalation as required behaviour

**Found:** 2026-08-11, closing M47/D046. **Fixed by:** [M47](22-TRACK-M-PROVIDER-ADMIN-OS.md), in the same change.

`unierp-api/src/modules/admin/tests/rbac-regression-sweep.spec.ts` — a suite written
specifically to prove the RBAC boundary — contained three assertions requiring that a **tenant**
credential succeed against `OperationsController`:

```ts
it("admin.operations.read grants GET /admin/operations/jobs", async () => {
  await expect(
    callWithRole(guard, OperationsController, "getBackgroundJobs", ["admin.operations.read"]),
  ).resolves.toBe(true);
});

it("the same Tenant Admin persona legitimately succeeds on tenant-scoped admin.operations.* endpoints
    (proves the rejection above is a real boundary, not a broken guard)", …)
```

`OperationsController` is `@Controller("platform/v1/operations")` and `@SkipTenantScope()`. It is
plane 1 — C05's operations dashboard, mounted in `platform.module.ts`. A tenant admin holds
`admin.operations.read` through the seeded `admin.*` grant, so the suite required that a customer's
administrator reach a cross-tenant controller.

**There is no `/admin/operations/*` route.** The endpoint the test names does not exist:

```bash
grep -rn '@Controller(.*operations' src/ --include=*.controller.ts
#   src/modules/admin/bulk-operations.controller.ts:34   admin/bulk-operations
#   src/modules/crm/crm-sales-operations-deep.controller.ts:21
#   src/modules/hr-advanced/hr-operations.controller.ts:40
#   src/platform/v1/operations.controller.ts:34          platform/v1/operations   ← the one imported
```

**And the assertion never held at runtime.** The suite constructs `RbacGuard` alone. The real chain
is `JwtAuthGuard → RbacGuard → ControlPlaneGuard`, and `ControlPlaneGuard` rejects any
`@SkipTenantScope()` handler guarded by a code outside `CONTROL_PLANE_NAMESPACES` before RbacGuard's
verdict matters (`control-plane.guard.ts:65-76`). `admin.operations.read` is outside it. So
`/platform/v1/operations/*` returned **403 to every caller, including platform staff** — C05's
operations dashboard could not have worked — while this suite reported the boundary as verified.

Measured, by reverting only the two permission strings on `operations.controller.ts` and running
M47's sweep against a fully-credentialled platform owner (`realm: provider`, MFA satisfied,
`["system.*","platform.*"]`):

```
A correctly-credentialled platform owner was refused on 9 endpoint(s):
GET /platform/v1/operations/health    — Cross-tenant handler is guarded by tenant-scoped
GET /platform/v1/operations/dashboard   permission(s): admin.operations.read. Control-plane
…                                       handlers require a system/platform-scoped permission.
```

**Reproduction** (against the pre-M47 tree):

```bash
npx vitest run src/modules/admin/tests/rbac-regression-sweep.spec.ts   # green
# yet, in the same tree, the real chain denies everyone:
grep -n '@SkipTenantScope\|@Permissions' src/platform/v1/operations.controller.ts
#   @SkipTenantScope()  +  @Permissions("admin.operations.read")  → ControlPlaneGuard misScoped throw
```

**Why this is Critical rather than Medium.** It is not merely a wrong test. A test asserting an
escalation is *load-bearing in the wrong direction*: it converts the correct fix into a build
failure, so the next agent to notice the escalation sees a red suite and reverts. D046 was
discoverable for as long as this file existed; closing D046 was blocked by it.

**Amendment, recorded rather than made quietly** (`README § 0` rule 4 in spirit — this is a test,
not a plan document, but the same reasoning applies): the three assertions now require the tenant
credential to be **refused** and a `system.*` grant to **succeed**. The original intent — "prove the
rejection is a real boundary, not a broken guard" — is preserved and still asserted, using the
credential that should work instead of the one that must not. The controller's permissions moved
`admin.operations.* → system.operations.*` in the same change, which also fixes the 403-for-everyone
bug above.

**The generalisation worth acting on.** This suite tests one guard out of a three-guard chain. Any
assertion it makes about *allowing* access is unsound by construction, because a later guard can
still deny. Only its *denial* assertions are trustworthy. A phase should either drive the full chain
or restrict itself to denials — filed for Track J.

### D048 · 🔴 CRITICAL · The tamper-evident plane-1 audit log was never called — C03 marked DONE, zero mutations audited

**Found:** 2026-08-11, sweeping C01–C05 for real evidence before starting Track M's kernel.
**Fixed by:** ControlPlaneAuditInterceptor, `unierp-api/src/common/interceptors/control-plane-audit.interceptor.ts`, registered globally in `app.module.ts`, in this change.

`ControlPlaneAuditService` — a correct, unit-tested, hash-chained tamper-evident audit log — existed
in `unierp-api/src/platform/v1/control-plane-audit.service.ts` and was called by **zero of the 22**
mounted plane-1 controllers, and was not registered as a global interceptor. It was registered as an
ordinary provider in `platform.module.ts` and exported; nothing consumed the export.

`@TrackChanges(...)` — applied on **28 handlers across 10 plane-1 controllers**, including
`tenant-lifecycle.controller.ts`, the file this session's M47 work treated as the reference pattern
for the guard chain — is a bare `SetMetadata` call. It is only acted on by `ChangeHistoryInterceptor`
via a per-handler `@UseInterceptors(ChangeHistoryInterceptor)`, which none of the 10 carried. The
decorator was inert metadata nothing read.

The one mechanism that DID run on every mutating request, `AuditInterceptor` (global
`APP_INTERCEPTOR`), writes to the plain `audit_logs` table — no `previousHash`/`contentHash`
columns, not tamper-evident — and **silently returns without recording** when
`user.tenantId`/`user.userId` is absent (`audit.interceptor.ts:66-68`). Every control-plane session
satisfies that condition in the direction that matters: `jwt-auth.guard.ts:99` sets
`request.user = decoded`, and a provider-staff session's `tenantId` claim is the reserved seeding
tenant (`seed-platform.ts` `PLATFORM_TENANT_ID = "platform"`) — present, but not a real customer
tenant, so `AuditInterceptor` records it under the actor's own reserved tenant rather than the
target tenant named in the URL, when it records at all.

**Net effect:** `POST /platform/v1/offboarding/:tenantId/offboard` — the same handler M47 closed for
authorisation — succeeded, mutated the tenant, and produced **no tamper-evident record of any kind**.
This directly falsifies C03's own exit criterion: *"No console mutation is possible without an audit
record… Audit records are append-only and tamper-evident."* C03 is marked `DONE`.

**Reproduction** (`src/platform/v1/control-plane-audit-wiring.spec.ts`, written before the fix):

```bash
cd unierp-api
npx vitest run src/platform/v1/control-plane-audit-wiring.spec.ts
# 3/3 failed:
#   ControlPlaneAuditService.record() is called by at least one mounted plane-1 controller
#     -> expected [] not to equal [] (zero callers found)
#   ControlPlaneAuditService IS registered as a global APP_INTERCEPTOR
#     -> expected false to be true
#   every @TrackChanges(...) use on a mounted plane-1 controller is paired with the interceptor
#     -> 10 controllers with the decorator and nothing consuming it
```

**Why wiring `ChangeHistoryInterceptor` onto plane-1 was rejected, not just left undone.** It keys
every record on `user.tenantId` (`change-history.interceptor.ts:43`) — the ACTOR's tenant. For a
plane-1 request the tenant being changed is a URL param naming a different, real customer tenant.
Wiring it as-is would not have no-opped; it would have silently misfiled every plane-1 change record
under the reserved `"platform"` tenant, leaving the actual affected tenant's history blind to what a
provider operator changed — confidently wrong data, worse than the inert decorator it would replace.
The 28 `@TrackChanges(...)` call sites were removed rather than paired with a mismatched interceptor.

**The fix, and its stated limit.** `ControlPlaneAuditInterceptor` runs globally, gated on the same
`SKIP_TENANT_SCOPE_KEY` marker `ControlPlaneGuard` already uses, and calls
`ControlPlaneAuditService.record()` for every mutating request on a plane-1 handler — so a new
controller is covered automatically by opting into `@SkipTenantScope()`, with nothing per-service to
remember. A failed write is logged at `error`, not `warn` — `AuditInterceptor`'s failure mode is not
repeated. **This is still a post-hoc write**, same architecture as `AuditInterceptor`: by the time the
interceptor's `tap()` runs, the mutating handler's own Prisma call has already committed, so this
guarantees an audit-write *attempt* for every successful mutation, not a shared transaction between
the mutation and its audit record. True same-transaction atomicity requires threading a shared `tx`
through all 22 controllers' services — judged too large and too risky to attempt un-integration-
tested against a live Postgres+RLS stack in this session. Filed as a narrower follow-up under Track M
(M14, "versioning, rollback and immutable audit") rather than claimed here.

**Relationship to D046/D047.** Same root cause as both: a phase's exit criterion was never re-run
after the code that would satisfy it was written. `ControlPlaneAuditService` and its test predate this
session; nobody connected it to a request until the C01–C05 evidence sweep asked "is C03 actually
true" instead of trusting its `DONE` status.

### D049 · 🔴 CRITICAL · Two-person control had no functioning "two-person" path — approval self-approvable, review tasks unreadable, break-glass unloggedabove-warn

**Found:** 2026-08-11, sweeping C01–C05 for real evidence before starting Track M's kernel.
**Fixed by:** `TwoPersonControlGuard` separation check + `ControlPlaneApprovalsController`/`Service`, in this change.

`ControlPlaneApproval` — schema designed correctly, with a distinct `requestedBy`/`approvedBy`
pair — was never checked for separation, and **nothing anywhere in the codebase ever created a row**:

```bash
grep -rn "controlPlaneApproval\.create" unierp-api/src   # → 0 hits before this fix
```

`TwoPersonControlGuard`'s approval-token branch validated `status === "APPROVED"` and
`requestedBy === actorId` (the *presenter* of the token must be the requester) but never checked
`approvedBy` at all — not that it was set, not that it differed from `requestedBy`. Since no approval
could ever be created, this branch could never be satisfied by anyone through any legitimate flow.
**The only path through any `@TwoPersonControl()`-guarded endpoint was break-glass: a single
operator, alone, with a written reason ≥10 characters.** This directly falsifies C04's exit criterion:
*"A single operator cannot delete a tenant or read another tenant's records."* One could, every time,
because the intended alternative path was unreachable. C04 is marked `DONE`.

Separately, `ControlPlaneReviewTask` — created on every break-glass use — had **no reader anywhere**:
no list endpoint, no console surface, `grep -rn "controlPlaneReviewTask\.findMany" unierp-api/src`
returned zero hits outside this fix. A row nobody can query is not a review. And "raises an alert" had
no notification transport behind it at all — the guard did not log the event above routine noise.

**Reproduction** (`src/common/guards/tests/two-person-control-separation.spec.ts`, written before the fix):

```
2/4 failed:
  an approval self-requested and self-approved by the SAME actor is refused
    -> resolved true (should have thrown ForbiddenException)
  an approval with no approvedBy at all (never actually approved by anyone) is refused
    -> resolved true (should have thrown ForbiddenException)
```

**Fix.** `TwoPersonControlGuard` now rejects an approval with no `approvedBy`, and rejects
`approvedBy === requestedBy`, enforced a second time independently in the new
`ControlPlaneApprovalsService.decide()` at creation — the same "same rule checked twice by two
different code paths" the mechanism itself models. `ControlPlaneApprovalsController` adds the missing
producer (`POST /platform/v1/approvals`, `/:id/approve`, `/:id/reject`) and the missing reader
(`GET /platform/v1/approvals/review-tasks`, `POST /:id/review`). Break-glass now logs at `error`
level — loud in whatever log-based alerting already watches genuine security events elsewhere in this
codebase (`control-plane.guard.ts`'s MFA/realm denial logging is the existing precedent).

**Stated limit, not hidden.** "Raises an alert" is now a loud structured log line and a queryable,
actionable review-task surface — not a page, Slack message or email to a named on-call rotation. No
verified external paging transport exists in this repository to wire honestly; inventing one blind was
judged a worse risk than leaving the gap stated. Real external notification is Track M/K work (SLO
and incident tooling, M35), not this fix.

**Time delay**, the third element of C04's deliverable ("Approval requirement, time delay, and
break-glass…"), remains unimplemented: an approval can be used the instant it is granted. Not fixed
here — filed as the residual half of this defect, folded into the same M-phase's follow-up.

**Relationship to D046/D047/D048.** Fourth defect of the same shape found in the same sweep: a
mechanism existed, was unit-tested in isolation, and either was never connected to anything or its
one connected check was incomplete. All four were on phases marked `DONE` with no ADP evidence
(`WORKLOG.md` holds a `CLAIMED` block for C01 and nothing for C02–C29).

### D050 · 🟠 High · Stale npm-published `@kannan19302/shared` copies in pnpm's virtual store shadow the local workspace symlink

**Found:** 2026-08-11, building M03. `unierp-api/src/platform/provider-registry/provider-registry.service.ts` imported `bindProvider`/`unbindProvider` from `@kannan19302/shared` (added in M02, same session) and TypeScript reported `TS2305: has no exported member`, even though `unierp-shared/dist/index.d.ts` was freshly rebuilt and confirmably correct, and Node's own `require()` resolved the export fine.

**Root cause**, isolated by elimination (top-level symlink → correct file, confirmed by `--traceResolution`; content on disk → correct, confirmed by direct read and by `node -e "require(...)"`; not the new file's structure — an isolated one-line reproduction outside any of my new files failed identically):

`unierp-api/node_modules/.pnpm/@kannan19302+shared@1.0.5/node_modules/@kannan19302/shared` is a **real, standalone directory** — not a symlink — dated **2026-08-08**, the actual npm-registry-published `1.0.5` package. The top-level `node_modules/@kannan19302/shared` is a symlink to the live repo (correctly overriding the registry copy for direct imports), but pnpm's content-addressable virtual store, used for *transitive* resolution, still holds the stale published copy. `unierp-data` gained a direct dependency on `@kannan19302/shared` in M49 (`seed-platform-roles.test.ts`); TypeScript's module-resolution cache, once it resolves `@kannan19302/shared` while walking `@kannan19302/database`'s own type graph, appears to seed a shared cache entry from the stale `.pnpm` copy that later lookups for the bare specifier reuse — even though `--traceResolution`'s per-file log for the *originating* file still prints the correct path, which is what made this take an hour to isolate.

**Reproduction:**

```bash
cd unierp-api
python3 -c "import os; print(os.path.islink('node_modules/.pnpm/@kannan19302+shared@1.0.5/node_modules/@kannan19302/shared'))"
# -> False (a real directory, not a symlink — the defect)
ls -la node_modules/.pnpm/@kannan19302+shared@1.0.5/node_modules/@kannan19302/shared
# -> dated 2026-08-08, predates any of this session's changes to unierp-shared
```

Confirmed present, same way, in **four other repositories** without attempting a fix in any of them (out of this phase's scope):

```bash
for repo in unierp-idp unierp-auth unierp-console unierp-web; do
  test -d "$repo/node_modules/.pnpm/@kannan19302+shared@1.0.5/node_modules/@kannan19302/shared" && echo "$repo: present, not a symlink"
done
```

**This is D043's pattern, confirmed for a second package.** D043 found the identical shape for `@kannan19302/data`: "`npm install` fetches `@kannan19302/data` from `registry.npmjs.org`. Its postinstall hook runs `prisma generate` using the schema packaged in that published version." Any repo whose `.pnpm` store has a stale registry copy of a `@kannan19302/*` package sitting alongside a manually-overridden top-level symlink is exposed to this — new exports added to the workspace package silently fail to resolve for *some* consumers depending on unrelated dependency-graph ordering, with a correct-looking `--traceResolution` log.

**Fixed in this repo only** (`unierp-api`), by replacing the stale directory with a junction to the real repo, matching the existing top-level symlink:

```bash
rm -rf "node_modules/.pnpm/@kannan19302+shared@1.0.5/node_modules/@kannan19302/shared"
cmd /c "mklink /J shared D:\UniERP\unierp-shared"   # from inside .../@kannan19302/
```

**Not fixed:** the same defect in `unierp-idp`, `unierp-auth`, `unierp-console`, `unierp-web`, and not audited for other `@kannan19302/*` packages (`@kannan19302/database` itself, `@kannan19302/config`, etc.) or other repos in the family. The durable fix is a postinstall or CI check asserting every `.pnpm`-store entry for a `@kannan19302/*` package is a symlink to the workspace source, not a registry-fetched copy — filed for Track A or L, not built here.

### D051 · 🟡 Medium · `tenant-lifecycle.service.spec.ts` constructed its subject with zero arguments against a one-argument constructor — 6 of 18 tests silently broken

**Found:** 2026-08-11, wiring M12 onto C07's tenant transitions. **Fixed by:** M12, in the same change.

`src/modules/admin/tests/tenant-lifecycle.service.spec.ts`'s `beforeEach` called
`new TenantLifecycleService()` with no arguments, against a constructor requiring one
(`consoleGateway: ConsoleGateway`). `consoleGateway` was therefore `undefined` for the lifetime of
every test in the file. Three transitions call `this.consoleGateway.emitTenantUpdate(...)` on
success — `offboardTenant`, `cancelOffboarding`, `purgeTenant` — and all three failed with
`TypeError: Cannot read properties of undefined (reading 'emitTenantUpdate')` on every test that
reached that line.

**Confirmed pre-existing, not introduced by this session:**

```bash
git stash   # remove all of this session's changes
npx vitest run src/modules/admin/tests/tenant-lifecycle.service.spec.ts
#   Test Files  1 failed (1)
#        Tests  6 failed | 12 passed (18)
git stash pop
```

Identical failure count and identical failing test names on the untouched tree.

**Fixed** as part of wiring `TenantLifecycleService` onto M12's `DurableExecutorService` (which
also gained a required constructor parameter, so this exact line needed editing regardless): the
`beforeEach` now constructs a working `{ emitTenantUpdate: vi.fn() }` stub and a real
`DurableExecutorService(new PrismaJobStateStore())`. All 18 tests pass.

**Not investigated:** how long this had been broken, or whether `purgeTenant`'s test — which
exercises the platform's actual tenant-data-deletion path — had been silently unverified for a
meaningful period. Worth a Track L phase auditing test files for constructors called with the
wrong arity generally, since this is easy to miss (the test file still runs, still reports
"1 failed" clearly, but 6 dead assertions sat in a green-looking suite until someone read the count).

### D052 · 🟠 High · Zero HTTP controllers existed for the entire Track M kernel (M02-M14) until M15

Every Track M phase from M02 through M14 built a real, tested backend mechanism — provider
registry, resource model, policy engine, durable execution, reconciler, versioning/rollback — each
proven by break/restore against its own service-level test suite. None of it was reachable over
HTTP. `grep -rl "class.*Controller"` under `unierp-api/src/platform/v1/` before M15 found 23
controllers, none importing `ResourceModelService`, `ProviderRegistryService`,
`PolicyEngineService`, `PlanningService`, or `ReconcilerService` — all five were registered as
NestJS providers in `platform.module.ts` and exported, but never injected into a controller.

**Impact:** the console (plane 1) had no way to search, view, or act on any M07 Resource, run an
M09 plan, evaluate an M08 policy, or trigger M13 reconciliation — the entire "operating system of
the business" Track M exists to build was backend-only. M15's `EstateController` is the first
controller against this kernel (`GET /platform/v1/estate/resources`,
`POST /platform/v1/estate/bulk`), scoped to what M15's own exit criterion needed.

**Not fixed here, and shouldn't be:** every later Track M console-facing phase (M16 onward)
inherits this same gap for its own domain (provider registry, policy engine, scheduling,
reconciliation) until each phase exposes its own controller as part of doing its own work — this
entry exists so that gap is visible and expected, not rediscovered as a surprise once several more
backend-only phases have accumulated.

### D053 · 🟡 Medium · Durable job IDs built from `Date.now()` alone could collide under rapid consecutive calls to the same resource

Every caller of `DurableExecutorService.startJob()` in the platform (`ReconcilerService`,
`KubernetesFleetService`, `TenantLifecycleService` x2, and this phase's `ReleasePromotionService`)
built its job ID as `` `<prefix>-<resourceId>-${Date.now()}` `` — a millisecond timestamp with no
disambiguator. Two calls against the same resource inside the same millisecond (measured directly:
M20's own test suite hit this on 4 of 5 consecutive runs) produce the same job ID. Because
`JobStateStore.loadJob()` looks up by that ID, the second `startJob()` call loads whichever row a
`findUnique`/`find()` returns for the colliding ID — in the encountered case, the FIRST job's
already-`DONE` row — so `run()`'s loop (`for (let i = job.stepIndex; ...)`) finds `stepIndex`
already past the end and exits immediately, silently reporting the SECOND operation as `DONE`
without running a single step of it.

**Fixed here** in all five call sites: appended `-${Math.random().toString(36).slice(2, 8)}` to
every job ID built this way, matching the pattern `PlanningService.createPlan()`'s own `id` field
already used. Re-ran M20's own test 3 times after the fix with no failures (was 4/5 failing
before).

**Not investigated:** whether any of the four OTHER call sites (`ReconcilerService`,
`KubernetesFleetService`, `TenantLifecycleService` x2) had actually hit this in a real (non-test)
run before today — none had a test exercising two rapid consecutive calls against the same
resource the way M20's rollback test does, which is exactly why it went undetected in M12/M13/M19
despite being present in their code from the start.

### D054 · 🟡 Medium · `InvoicingService.calculateInvoiceTotals()` does tax/total arithmetic in JS `number` (float) despite `SaaSInvoice`'s own columns being `Decimal(15,2)`

Noticed in passing while building M28 (margin), which reads `SaaSInvoice.totalAmount` as
ground truth for tenant revenue. `InvoicingService.calculateInvoiceTotals(subtotal: number,
taxRatePct: number, discountAmount: number)` in `unierp-api/src/platform/v1/invoicing.service.ts`
computes `taxAmount`/`totalAmount` via `Math.round(x * 100) / 100` float arithmetic, then
(presumably, not traced further) writes the result into `SaaSInvoice`'s `Decimal(15,2)` columns —
the column type is correct, but the value that lands in it was computed in floating point first.
This is the exact class of defect M25's `CostIngestionService` and M27's `cost-allocation.ts`
were built this session specifically to avoid (BigInt-cents arithmetic, `string` money types
throughout, no `number` in the money path).

**Not fixed here:** out of scope for M28, which only reads `totalAmount` after it has already
been written — fixing the read side cannot fix a value already computed wrong upstream, and
`calculateInvoiceTotals()` belongs to C16 (invoicing), a different track's surface. Worth a
dedicated phase or defect-fix pass: convert `calculateInvoiceTotals()` to decimal-string/BigInt
arithmetic matching the pattern this session established in M25/M27, and audit whether any other
`unierp-api/src/platform/v1/*.service.ts` file does money math in `number` the same way.

### D055 · 🔴 CRITICAL · `unierp-shared`'s compiled `dist/` was never rebuilt across 16+ phases of new permission codes (M15-M32), silently stale in every consumer

Every `system.*` permission code added to `unierp-shared/src/permissions/registry.ts` across M15 through
M32 (roughly 30 new codes) was committed and pushed as TypeScript SOURCE only. `unierp-shared`'s `dist/`
directory is git-ignored (a local build artifact), and nothing in this session's workflow ever ran
`npm run build` inside `unierp-shared` after any of those edits — `check-platform-permissions.mjs`
(run after every phase in this session) reads the registry file's TEXT directly via a source-level scan,
so it reported "OK" every single time regardless of whether `dist/` matched. `unierp-api`'s
`node_modules/@kannan19302/shared` is a symlink to `unierp-shared` itself (fixed for D050 earlier this
session), so `require('@kannan19302/shared')` at runtime resolves to the STALE compiled `dist/` — meaning
every one of those ~30 new permission codes was, until this defect's own fix, absent from
`PERMISSION_REGISTRY` as far as any code path that imports the compiled package is concerned.

**How it was caught:** `src/modules/admin/tests/permissions-drift.spec.ts` — which imports
`PERMISSION_REGISTRY` from the compiled `@kannan19302/shared` package, not from source — was not included
in this session's per-phase regression command until M32, when it failed on `system.release.promote`
(added in M20, 12 phases earlier) with "no matching entry in PERMISSION_REGISTRY."

**Fixed:** ran `npm run build` in `unierp-shared`, confirmed via a direct `require()` check that
`system.release.promote`, `system.finops.execute`, and `system.staffidp.manage` are now present, then
re-ran the full regression suite including `permissions-drift.spec.ts` (259/259 pass) plus
`rbac-regression-sweep.spec.ts`.

**Not fully investigated:** whether `unierp-idp`, `unierp-auth`, `unierp-console`, `unierp-web`, or any
other consumer of `@kannan19302/shared` has its OWN separately-resolved `dist/` (via a real npm install
rather than the workspace symlink) that is ALSO stale and would need its own rebuild — D050 found stale
*npm-published* copies (a different failure mode: a real directory, not a symlink) in exactly those four
repos. Worth an explicit audit of `npm run build` freshness in `unierp-shared` as a standing step in this
programme's own tooling (e.g. `check-platform-permissions.mjs` could diff source registry entries against
the compiled `dist/index.js`'s exports, not just assert the source file contains the string), so this
class of defect fails loudly next time instead of silently.

### D056 · 🔴 CRITICAL · `AdminService.assertNoPlatformOnlyPermissions()` gated tenant custom roles on a manually-maintained `platformOnly` flag, not on the control-plane namespace — 18 of ~20 `system.*`/`platform.*` permission codes were silently assignable to a tenant role

Found and fixed during D03. `AdminService.createRole`/`updateRole`/`createAccessPackage`/
`updateAccessPackage` (`unierp-api/src/modules/admin/admin.service.ts`) all refused a permission list
via a private `assertNoPlatformOnlyPermissions()` check — but that check only rejected a code whose
`PERMISSION_REGISTRY` entry carried `platformOnly: true`, a flag that has to be set BY HAND on each
individual permission definition. At the time this was found, only 2 of the ~20 registered `system.*`/
`platform.*` (control-plane) codes carried the flag (`saas.analytics.read` and `platform.overview.read`
— note the first of those isn't even in the control-plane namespace). Every other control-plane code —
including every `system.*` code Track M added across M37, M41, M44 and M45 this session
(`system.retention.*`, `system.integrations.*`, `system.catalogue.*`, `system.runbook.*`) — had no flag
and was therefore assignable to a tenant-defined custom role with zero code change, purely because
nobody had remembered to flag it. This directly contradicts D03's own exit criterion ("No tenant role
can grant a `platform.*` permission") and the invariant `ControlPlaneGuard`/`hasPermission()` already
enforce elsewhere: a tenant's own `["*"]` wildcard can never satisfy a `CONTROL_PLANE_NAMESPACES` code,
but nothing stopped a tenant admin from explicitly listing that code on a role they define themselves.

**How it was caught:** writing `tenant-role-control-plane-gate.spec.ts` as the FAIL-first proof for
D03's exit criterion — `service.createRole("tenant-a", { permissions: ["system.retention.manage"] })`
resolved successfully instead of throwing, on the very first run against the pre-existing code.

**Fixed:** `assertNoPlatformOnlyPermissions()` now rejects a code if EITHER it is flagged `platformOnly`
OR its namespace is inside `CONTROL_PLANE_NAMESPACES` (imported from `@kannan19302/shared` — the same
constant `hasPermission()`/`ControlPlaneGuard` already use), unioning rather than replacing the original
check. Proven via break/restore (removing the namespace check reproduces the exact original gap).

**Not fully investigated:** whether an equivalent tenant-role/access-package creation path exists
elsewhere in the codebase (a second implementation this session did not search for) that performs its
own, possibly-also-incomplete platform-permission check independently of `AdminService`'s. Worth a
platform-wide grep for `platformOnly` call sites as a follow-up.

### D057 · 🟠 HIGH · `SaasPortalAuditTrailDeepService.getAuditLogs()` returned a hardcoded fake row — the tenant audit-trail endpoint rendered but never queried real data

Found and fixed during D05. `GET saas-portal/audit-trail-deep/logs` was a mounted, guarded, reachable
endpoint — but `SaasPortalAuditTrailDeepService.getAuditLogs(tenantId)` ignored its `tenantId` argument
entirely and returned one literal object (`{ id: "audit-101", actor: "admin@acme.com", action:
"UPDATE_SSO_CONFIG", ... }`) on every call, for every tenant, with no filter parameter of any kind. The
real, already-indexed `ChangeHistory` table (`tenantId`/`entityType`/`entityId`/`userId`/`createdAt`,
the same field-level change log `unierp-workspace/scripts/retention-matrix.json` already declares under
`change-history`) was never read. A tenant admin could open the audit trail and see plausible-looking
data that had no relationship to their tenant's actual history — the same class of defect as D044 (a
console surface that renders without a real mechanism behind it), here on the API side rather than the
UI side.

**How it was caught:** writing `audit-trail.service.spec.ts` as the FAIL-first proof for D05's exit
criterion — every one of 4 assertions failed against the pre-existing code, including `TypeError:
result.entries.map is not a function` (the mock's return shape didn't even resemble a real,
paginated search result) and `auditSvc.exportAuditLogs is not a function` (no export mechanism existed
at all, despite the endpoint's own name — `-deep` — implying real depth).

**Fixed:** rewrote the service against `ChangeHistory` directly: `getAuditLogs()` (real, paginated,
filtered search) and `exportAuditLogs()` (every real matching row, unpaginated, over the identical
table). Proven via break/restore (dropping the `tenantId` scope — itself a real cross-tenant leak, not
just a proof device — failed all 4 tests).

**Not fully investigated:** whether other `-deep`-suffixed services in `saas-portal` or elsewhere in the
codebase follow the same pattern (a plausible-looking hardcoded fixture standing in for a real query).
Worth a platform-wide audit of services returning a literal object/array with no parameter actually
consulted, as a follow-up — this session found this one only because D05's own exit criterion happened
to require exercising it.

### D058 · 🟠 HIGH · GDPR erasure's own audit-log entry wrote the subject's email in plaintext, recreating the exact PII the erasure had just removed

Found and fixed during D11. `SaasPortalGdprComplianceService.executeErasure()` already had a real
PII-registry-driven erase/anonymize/retain-legal-hold mechanism for the subject's tenant business data
(unierp-workspace/scripts/pii-registry.json) — but its own closing step, writing a `GDPR_ERASURE` entry
to the immutable `AuditLog` table to record that the erasure happened, included `email` (the subject's
own address) in the `changes` JSON in plaintext. Every erasure therefore permanently re-embedded the
subject's PII into an append-only table in the same call that was supposed to remove it — a direct
contradiction of the erasure it was recording. Separately, `AuditLog`/`ChangeHistory` are not registered
in `pii-registry.json` at all, so the audit trail was never a *target* of erasure treatments (arguably
correct, since it must stay append-only) — but nothing anywhere documented that choice or its rationale,
which is exactly what D11's exit criterion ("the resolution is written down, not implicit") names.

**How it was caught:** while implementing D11's crypto-shredding fix, reading `executeErasure()`'s full
body (rather than only its erase/anonymize loop) to understand what needed to change turned up the
plaintext `email` field going into `prisma.auditLog.create()` after the erasure loop had already run.

**Fixed:** added `GdprCryptoShredService` (new `SubjectErasureKey` model, unierp-data) and had
`executeErasure()` encrypt the subject's email under a per-subject key before writing it into the audit
log (`subjectEmailRef`, not `email`), then destroy that key (crypto-shredding) immediately after. The
audit log row itself is never touched by the shred — its integrity is preserved by construction, and the
resolution is now documented in three places: the `SubjectErasureKey` schema comment, the
`GdprCryptoShredService` file header, and the D11 evidence file.

**Not fully investigated:** whether any OTHER call site in the codebase writes raw subject PII (email,
name, or another field) into `AuditLog`/`ChangeHistory` outside the GDPR erasure flow — this defect was
found because D11's exit criterion happened to require reading `executeErasure()`'s full body closely; a
platform-wide grep for PII-shaped literals passed into `auditLog.create`/`changeHistory.create` calls
would be a reasonable follow-up.

### D059 · 🟠 HIGH · 1,853 of 1,904 Prisma models have no declared retention/deletion class

Found and measured during D12. `DELETION_POLICY.md`'s own class taxonomy (SD/HD/ER/RT) declares a
per-entity table, but only 45 model rows are populated across it; `retention-matrix.json` (H.4, RT-class
only) declares 7 models. Between the two, only 51 of the platform's 1,904 real Prisma models
(`unierp-data` + the IdP schema) have ANY documented deletion-class decision. The remaining 1,853 —
measured directly by the new `scripts/check-retention-coverage.mjs` enumerating every `model` block in
the real schema — have no SD/HD/ER/RT determination anywhere: nobody has decided whether deleting one of
those records should soft-delete, hard-delete, trigger GDPR erasure handling, or age out on a retention
timer. `DELETION_POLICY.md` and `DATA_RETENTION_MATRIX.md` (D12's own Deliverable text) are therefore
documented in principle but not true of the platform's actual schema — the exact gap D12 names.

**How it was caught:** building `check-retention-coverage.mjs` for D12's own exit criterion ("any model
without a retention class fails the gate") and running it against the real schema, which is the intended,
correct behavior of the gate — it is SUPPOSED to fail loudly here, not silently pass.

**Not fixed — deliberately not attempted.** Classifying 1,853 models correctly requires reviewing each
one's actual data-lifecycle semantics (business document vs. operational log vs. PII vs. config/reference
table with no deletion lifecycle at all) — a mistake here is a data-loss or compliance risk, not a
documentation nicety, so mass-classifying superficially just to make the gate pass would be actively
harmful. The gate mechanism itself (proven correct via break/restore in the D12 evidence file) and a
generic legal-hold mechanism (`RecordLegalHoldService`) are the real, complete deliverables of D12; full
corpus classification is untouched, tracked here explicitly so it is visible rather than implied "done"
by D12's own DONE status.

**Not fully investigated:** which of the 1,853 uncovered models are genuinely exempt (config/reference
tables with no deletable records at all) versus genuinely unclassified business data — `scripts/
retention-exemptions.json` is scaffolded (the gate reads it if present) but empty; populating it for the
genuinely-exempt subset would meaningfully shrink this number without requiring a business-semantics
decision for every model.

### D060 · 🟠 HIGH · 107 of 130 module-local settings pages have not adopted the D13-D18 settings contract, and no real storage backend exists for any settings runtime this wave built

Found and measured during D19. Track D's Stage D-III (D13-D18) built a complete, tested settings
CONTRACT: a declarative schema specification (D13), a single rendering component with zero bespoke UI
code per app (D14), deterministic scope resolution (D15), versioning/migration (D16), audit and
approval-gated change control (D17), and environment promotion with secret exclusion (D18). D19 is the
capstone phase that retrofits every existing module-local settings page onto that contract and deletes
the bespoke UI — measured directly via the new `scripts/check-settings-contract-adoption.mjs`: 130
`settings/page.tsx`-shaped routes exist across `unierp-web`/`unierp-console`, and only 23 (the ones this
session itself never touched, pre-existing from earlier work) show any sign of using the shared renderer;
the other 107 — spanning effectively every business module (CRM, finance, HR, inventory, manufacturing,
healthcare, education, field-service, ecommerce, and the entire platform `(dashboard)/settings/*` tree) —
remain bespoke. Separately, and more fundamentally: D13 through D18 all explicitly declared
settings-VALUE storage the CALLER's responsibility, so even for a page that DID adopt `<SettingsPage>`,
no real backend persists the resulting values anywhere yet — the entire runtime this wave built is
storage-agnostic by design, and nothing has wired it to an actual data store.

**How it was caught:** running `check-settings-contract-adoption.mjs` (built for D19's own exit
criterion, "grep finds no module-local settings page") against the real repository, which is the
intended, correct behavior of the gate — it is SUPPOSED to fail loudly here, not silently pass.

**Not fixed — deliberately not attempted.** Retrofitting 107 pages superficially (registering hollow
`SettingDefinition`s just to make the grep pass, without real per-module storage behind them) would
produce a settings system that LOOKS unified but manages nothing real — actively worse than an honest,
measured gap, per this session's own D12 precedent for the identical class of problem (retention/deletion
classification). The contract itself (D13-D18) and the measurement gate (D19) are the real, complete
deliverables; the retrofit is untouched, tracked here explicitly.

**Not fully investigated:** whether a storage-backend design (a generic `TenantSettingValue` table keyed
by tenantId/scope/key, replacing the ad-hoc `Setting`/`AppSettings`/`EcommerceStoreSetting`/
`SaasTenantSetting`/`WebSettings` models D07's investigation already found) could serve every module at
once, versus each module needing its own. Designing that shared store is likely the highest-leverage next
step before attempting any of the 107 individual page retrofits, since building it once unblocks all of
them simultaneously.

### D061 · 🔴 CRITICAL · `WebhooksService` leaked the plaintext webhook signing secret on every read after creation

Found and fixed during D20. Two real, mounted, guarded HTTP endpoints — `GET saas/webhooks/endpoints`
(`saas.webhook.read`) and `GET saas/webhooks/endpoints/:id` (`saas.webhook.read`) — returned the RAW
`TenantWebhookEndpoint` Prisma row, including the full, plaintext `secret` field (the HMAC signing secret
a tenant uses to verify inbound webhook payloads), on every view, not only at creation. `updateEndpoint()`
leaked the same way. `getEndpointSecret()` — the endpoint apparently INTENDED to be the safe, masked
accessor — still returned the first 10 real characters of the actual secret
(`endpoint.secret.substring(0, 10) + "****"`), a partial plaintext leak rather than a true mask. Anyone
holding `saas.webhook.read` (a read-only permission, not an elevated one) could recover a tenant's full
webhook signing secret at will, at any time after the endpoint was created — a genuine credential-exposure
vulnerability, not a hypothetical one.

**How it was caught:** writing `webhooks-secret-exposure.spec.ts` as the FAIL-first proof for D20's exit
criterion ("credentials never rendered after save") — 5 of 7 assertions failed against the pre-existing
code on the very first run, confirming the leak across `listEndpoints()`, `getEndpoint()`,
`updateEndpoint()`, `getEndpointSecret()`, and a post-rotation `getEndpoint()` call.

**Fixed:** added a `sanitize()` helper stripping `secret` entirely, applied to `listEndpoints()`,
`getEndpoint()`, and `updateEndpoint()`'s return values; `getEndpointSecret()` now returns
`{ id, hasSecret: boolean }` with zero real secret characters. `createEndpoint()`/`rotateSecret()`
correctly continue returning the real secret — the deliberate one-time reveal at the moment it is
generated. Proven via break/restore (removing `sanitize()` from `getEndpoint()` reproduces the leak
exactly, caught by 2 dedicated tests).

**Not fully investigated:** whether the same shape of bug (a service returning a raw Prisma row that
includes a secret/token/credential-shaped field on a read path, not only at creation) exists elsewhere in
the codebase — `ApiKeysService`, connector/OAuth-credential services, or any other module holding
long-lived secrets. This defect was found only because D20's own exit criterion happened to name webhook
credentials specifically; a platform-wide grep for services with a `secret`/`token`/`apiKey`/`credential`
field returned unfiltered from a `findFirst`/`findMany` read path would be a reasonable, high-value
follow-up given how serious this specific instance was.

### D062 · 🟠 HIGH · 12,621 of 12,635 `@Permissions`-decorated endpoints have no runtime permission test

Found and measured during J04. `check-platform-permissions.mjs` (a static gate) already proves every
mounted `/platform/v1` endpoint carries a `@Permissions` decorator and a guard chain that CAN enforce it —
but that is a source-text check, not a proof of runtime behavior. `rbac-regression-sweep.spec.ts` already
proved the runtime half correctly — real `Reflector` + real `@Permissions` metadata + real `RbacGuard`,
producing an actual HTTP 403 for an unauthorized caller — but only for 5 hand-picked controllers out of
571 controller files across the whole platform. The new `scripts/check-permission-test-coverage.mjs`
(built for J04's own exit criterion, "every endpoint has a permission test") enumerates every
`@Permissions`-decorated handler platform-wide and cross-references it against the RBAC test files: 12,635
total, only 14 covered (the 5 pre-existing plus 5 new ones J04 itself added, cross-checked at 9 before
this phase). The other 12,621 endpoints have a static guarantee that a permission decorator EXISTS, but no
proof that `RbacGuard` actually refuses an unauthorized caller with a 403 (rather than, say, an
unregistered permission code silently resolving to "no restriction," or a guard mis-ordering allowing a
request through) for any of them.

**How it was caught:** running `check-permission-test-coverage.mjs` against the real codebase, which is
the intended, correct behavior of the gate — it is SUPPOSED to fail loudly here, not silently pass.

**Not fixed — deliberately not attempted at scale.** J04 built the reusable mechanism
(`expectPermissionEnforced()`, a one-line-per-endpoint call requiring zero new guard-wiring code) and
proved it generalizes to endpoints it was never written for. Writing 12,621 more calls is now mechanical
but still a large, multi-session effort — fabricating shallow coverage just to move the number would be
worse than an honest, measured gap, per this session's own D12/D19 precedent for the identical class of
finding.

**Not fully investigated:** whether any of the 12,621 untested endpoints have a REAL enforcement bug (as
opposed to merely lacking a test) — this defect only measures test coverage, not correctness. A
higher-leverage follow-up than blanket coverage might be triaging by risk (destructive operations,
cross-tenant-capable endpoints, endpoints outside the `platform/v1` namespace that a tenant `["*"]`
wildcard could reach) rather than working through all 12,621 in file order.

### D063 · 🔴 CRITICAL · B23's accessibility CI gate is fabricated — hardcodes "0 violations, PASSED" without ever running axe

Found while claiming and working J07 (Accessibility as a blocking gate, which depends on B23). B23's
claimed deliverable, `unierp-workspace/scripts/ci/check-axe-a11y.mjs`, exists on disk (it is NOT missing,
contrary to an earlier suspicion recorded mid-session) but does not run `axe-core`, does not import or
invoke any test runner, and does not read any real test output. It only (1) checks that
`unierp-design-system/WCAG_CONFORMANCE.md` exists and contains the literal string "WCAG 2.2 Level AA", and
(2) unconditionally writes `scripts/ci/axe-a11y-baseline.json` with a hardcoded object —
`{ testedComponents: 25, axeViolationsCount: 0, wcagLevel: "2.2 AA", status: "PASSED" }` — regardless of
whether any component was ever tested. It then prints "✅ Accessibility blocking gate passed (0 axe
violations...)" and exits 0. The number `25` matches the real count of component source files in
`unierp-design-system/src/components/` (excluding `.stories.tsx`), suggesting it was hand-typed to look
plausible rather than computed.

Compounding this, `unierp-design-system/WCAG_CONFORMANCE.md` is a fully-written, professional-looking
published conformance statement asserting "Zero axe-core accessibility violations are enforced via
automated CI testing on every pull request" — a claim the CI gate does not actually enforce. This is a
procurement-facing compliance document (G-16 cites WCAG 2.2 AA conformance as a public-sector procurement
requirement) making a false claim backed by a gate that cannot fail.

**Real state at time of discovery (measured directly, not estimated):** of 25 real component source files
in `unierp-design-system/src/components/`, only 4 (`button.tsx`, `combobox.tsx`, `date-picker.tsx`,
`modal.tsx`) plus partial coverage of `extended-inputs.tsx`/`identity.tsx`/`six-states.tsx`/`structure.tsx`
via `stage-b1.test.tsx` have ANY `vitest-axe` assertion. Zero files in either `unierp-web` or
`unierp-console` (`grep -rl "vitest-axe\|jest-axe" src/`) reference an axe library at all — "all routes"
has no accessibility test coverage whatsoever. The real axe assertions that DO exist are genuine and
CI-blocking (proven this session: a real `aria-toggle-field-name` violation in the `Switch` component,
caught live by a newly-added `stage-b1.test.tsx` axe test, fixed in `extended-inputs.tsx` by adding
`aria-labelledby`, then re-broken and re-caught via break/restore) — the defect is specifically that B23's
platform-wide GATE script never runs any of this real machinery and cannot fail no matter how many
violations exist elsewhere.

**How it was caught:** reading `check-axe-a11y.mjs` end-to-end while scoping J07's dependency on B23,
after noticing the script never imports `axe-core`, `vitest`, or any test-results file.

**Not fixed — out of J07's own scope to rewrite B23's gate wholesale.** J07 proceeds by adding real,
CI-blocking axe assertions where they were missing (2 files closed this session) and reporting the true,
measured gap (21 of 25 component files still uncovered; 0 route coverage in `unierp-web`/`unierp-console`)
rather than relying on or extending the fabricated gate. B23 itself should be reopened: `check-axe-a11y.mjs`
needs to actually invoke `vitest run` (or equivalent) across every `*.test.tsx` file containing an axe
assertion, parse real pass/fail results, and compute `testedComponents`/`axeViolationsCount` from that
output — plus, separately, the same real mechanism needs to exist for `unierp-web`/`unierp-console` routes,
which currently have none at all. The `WCAG_CONFORMANCE.md` statement's CI-enforcement claim is false as
written and should not be treated as evidence of actual conformance until the gate is real.

### D064 · 🟡 MEDIUM · SalesDocumentsDeepService.generateDocument() never rendered anything — accepted a caller-supplied documentUrl as if it were the output

Found while claiming and building E29 (Document template engine). `SalesDocumentTemplate` and
`SalesDocumentGeneration` looked like a real templating feature — a template has `content` and
`variables`, generation has a `documentUrl` and a lifecycle (`DRAFT`/`SENT`/`VIEWED`/`SIGNED`/
`REJECTED`/`VOIDED`) — but `generateDocument()` in `unierp-api/src/modules/sales/
sales-documents-deep.service.ts` never read the template's `content` at all. It looked up the
template only to confirm it existed, then wrote whatever `documentUrl` string the CALLER passed
in `dto.documentUrl` straight into the generation row. Editing a template's content had zero
effect on any previously- or subsequently-generated document — the exact class of "looks finished,
isn't" gap this session's Track E briefing calls out by name (pages that render, fetch, and save
without being judged against what the feature actually claims to do).

**How it was caught:** reading the service end-to-end while scoping E29's exit criterion ("an
invoice template edited by a tenant produces a correct PDF for any invoice with no code"), which
this mechanism could not satisfy no matter what a tenant edited.

**Fixed (E29's own scope, not a separate cleanup):** `generateDocument()` now renders a real PDF
via the new `DocumentTemplateEngineService.renderInvoicePdf()` for `INVOICE`-category templates
with an `invoiceId`, substituting the template's own `content` against the real `Invoice` row.
Every other category still accepts a caller-supplied `documentUrl` (proposals/MSAs generated
externally are out of E29's scope) — stated, not hidden.

**Not fully investigated:** whether the same shape of bug — a "generate from template" endpoint
that stores caller-supplied output instead of deriving it from the template — exists in any other
of the 45 modules' own document/report-generation code. This defect was found only because E29
happened to audit this exact service; a platform-wide grep for `documentUrl`/`fileUrl`/`reportUrl`
fields accepted directly from a request DTO without being derived server-side would be a
reasonable follow-up.

### D065 · 🟢 LOW · module-tier-manifest.json had drifted from the real module list — 4 ghost entries, 3 unlisted real modules

Found while claiming and building E03 (Tier assignment and depth targets). `docs/module-tier-manifest.json`
(the pre-existing Track A/L architecture-tier manifest, Tier A = full Clean Architecture, Tier B =
controller/service/dto/tests) named four modules — `builder`, `connect`, `onboarding`, `settings` — that
do not exist as directories under `unierp-api/src/modules` (confirmed: `ls` on each returns "No such file
or directory"). Conversely, three real module directories — `extension-registry`, `marketplace`,
`org-structure` — appeared in neither Tier A nor Tier B, meaning they carried no stated architecture tier
at all. Low severity (this manifest governs code-structure enforcement, not runtime behavior, so it is a
documentation-accuracy gap rather than a live defect), but exactly the kind of silent drift E03's own exit
criterion ("no module is silently exempt") exists to catch.

**How it was caught:** `scripts/reconcile-module-tiers.mjs` (built for E03) diffs the manifest's Tier A/B
module lists against `readdirSync(unierp-api/src/modules)` directly, rather than trusting the manifest's
own list as ground truth.

**Fixed:** the reconciliation script does not silently drop the four ghost entries (they likely represent
modules that were renamed or merged since the manifest was last hand-edited) — it names them explicitly in
the manifest's new `reconciliation.staleManifestEntries` field. The three unlisted real modules were
defaulted to Tier-3 and flagged in `reconciliation.unlistedRealModulesFoundAtReconciliation`, with each
one's `depthTargets` entry stating outright that it is a reconciliation gap needing a deliberate Tier A/B
call, not a considered assignment.

**Not fully investigated:** what `builder`, `connect`, `onboarding`, and `settings` were renamed to (if
anything) — a `git log --follow` on the manifest file, or on `unierp-api/src/modules`, in a session with
more budget would likely resolve this quickly. Whether `extension-registry`, `marketplace`, and
`org-structure` belong in Tier A or Tier B (rather than the Tier-3 default this phase assigned) was not
decided here — that is an architecture judgment call, not something a reconciliation script should default
without a human or a dedicated phase reviewing each module's actual money/regulatory/complexity profile.

### D066 · 🔴 CRITICAL · CrmConfigService.approveRequest() never verified the acting user was an authorized approver — any authenticated user could approve any pending approval request

Found while claiming and building E05 (Approval-chain engine). The pre-existing generic approval
scaffolding (`ApprovalProcess`/`ApprovalRequest`/`ApprovalAction`, used by `CrmConfigService`) declares each
step's intended `approvers: string[]` inside the process's `steps` JSON, but `approveRequest()` in
`unierp-api/src/modules/crm/crm-config.service.ts` never read that list to check the caller. It accepted
whatever `userId` the controller passed, recorded an `ApprovalAction`, and advanced `currentStep`
unconditionally. Any user holding only the generic "can call this endpoint" permission — not membership in
the step's declared approver set — could approve (or, by extension, reject/recall in the same pattern) a
pending request for anything routed through this mechanism: CPQ discount overrides, contract sign-off, or
any future caller of `submitForApproval`. This is a genuine authorization bypass, not a theoretical one —
the check was simply absent from the code path, not merely under-tested.

**How it was caught:** building E05's `ApprovalChainEngineService.approveStep()` as a declared, reusable
replacement for this exact code path, and writing the FAIL-first test
`REJECTS an approval attempt from a user not among the step's resolved approvers` — which would have failed
identically against the original `CrmConfigService.approveRequest()` had it been run against that function
directly.

**Fixed (in E05's own scope, not a separate cleanup):** `ApprovalChainEngineService.approveStep()` resolves
each step's real approver set before accepting an action (named users as declared, or an org position's
occupant found via D04's vacancy-safe hierarchy walk) and throws `ForbiddenException` when the caller is
not in that set. Proven via break/restore: disabling the check reproduces exactly this defect and fails 2
of 5 tests; restored, 5/5 pass.

**Not fully investigated:** `CrmConfigService.approveRequest()`/`rejectRequest()`/`recallRequest()`
themselves were NOT modified or removed in this pass — they remain live, still missing the same check, and
still reachable via `CrmConfigService`'s own controller endpoints. E05 built the correct, reusable
replacement mechanism; migrating `crm.controller.ts`'s approval endpoints onto
`ApprovalChainEngineService` instead of `CrmConfigService`'s own approval methods (and then deleting the
vulnerable originals) is follow-up work explicitly out of E05's stated scope, and should be prioritised
given the severity — this is a live, exploitable gap in shipped code until that migration happens.

### D067 · 🔴 CRITICAL · Closing a financial period was cosmetic — no service ever checked FinancialPeriod.status before posting or reversing a journal

Found while claiming and building E06 (Reversal, correction and period close).
`CloseOpsService.closeFinancialPeriod()` only flipped `FinancialPeriod.status` to `CLOSED`. A grep across
`GlAccountingService` (`unierp-api/src/modules/advanced-finance/services/gl-accounting.service.ts`) — the
service owning `postJournal()`, `reverseJournal()`, and every other ledger-mutating operation — for any
reference to `FinancialPeriod` or `CLOSED` returned zero matches. Nothing in the codebase enforced that a
"closed" period's documents were actually immutable: a journal dated any time in a closed period could
still be posted, and a reversal could still be booked into one. The status flag existed, was displayed in
close-management UI, and meant nothing operationally — exactly the "looks finished, isn't" pattern this
session's Track E briefing exists to catch, and a genuine compliance risk (period-close immutability is a
basic control most audit frameworks assume exists).

Compounding this, `CloseOpsService.reopenFinancialPeriod()` had zero approval gate — any caller could
reopen a closed period unilaterally, silently undoing whatever immutability guarantee closing was supposed
to provide.

**How it was caught:** writing the FAIL-first tests for E06's own exit criterion ("closing a period makes
its documents immutable, provably, and reopening requires an approver") and confirming both failed against
the pre-existing code before any fix was written.

**Fixed (E06's own scope):** new `PeriodCloseGuardService.assertPeriodOpen()` is now consulted by both
`postJournal()` and `reverseJournal()` before any mutation, refusing (naming the period) when the target
date falls inside a `CLOSED` period. `reopenFinancialPeriod()` now requires a real `APPROVED`
`ApprovalRequest` (reusing E05's `[[e05-approval-chain-engine]]` tables directly) before flipping status
back to `OPEN`. Both proven via break/restore.

**Not fully investigated:** whether any OTHER ledger-mutating path exists outside `GlAccountingService`
(e.g. direct `prisma.journal.update` calls elsewhere in the codebase, or period-adjacent operations in
`advanced-hr`/`fixed-assets`/other modules that also care about period immutability) that still bypasses
`PeriodCloseGuardService` entirely, since it was wired into exactly the two call sites this phase touched
and no platform-wide sweep for unguarded `journal`/`financialPeriod` writes was performed.

### D068 · 🟠 HIGH · BulkOperationsService wrapped every write method's ENTIRE loop in one single transaction — times out and misreports outcomes at scale

Found while claiming and building E07 (Bulk operations framework). All 5 write methods in
`unierp-api/src/common/services/bulk-operations.service.ts` (`bulkCreate`, `bulkUpdate`, `bulkDelete`,
`bulkRestore`, `bulkStatusChange`) wrapped their entire per-record loop — regardless of how many records —
in one single `prisma.$transaction(async (tx) => { for (...) { try {...} catch {...} } })`. At the scale
E07's own exit criterion names (10,000 rows), this has three compounding problems: it would blow past any
realistic database transaction timeout; it holds row/table locks for the WHOLE operation's duration
(directly violating "does not lock the table for other tenants," since Postgres row locks from an
uncommitted transaction are visible to other sessions); and on Postgres specifically, one statement failing
inside a transaction aborts the ENTIRE transaction — every subsequent statement in that same transaction
then also throws ("current transaction is aborted") until rollback, meaning a single bad row anywhere in a
10,000-row batch would cause every row after it to be misreported as failed, even though nothing was
actually wrong with those later rows. "Reports per-row outcomes" was not true under failure at any real
scale.

**How it was caught:** writing the FAIL-first test for E07's own exit criterion, using a mock that
simulates real Postgres transaction-abort semantics (a "poisoned" row causes every subsequent statement
inside the SAME transaction object to also throw) — this reproduced the exact misreporting bug, and a
second test confirmed the pre-existing code ran the entire 10,000-item loop inside one transaction call
with no bound.

**Fixed:** a new `runBatched()` helper processes items `CONCURRENCY_BATCH_SIZE` (50) at a time with NO
shared transaction across items — each record's write is now its own independent, atomic Prisma call, so
one row's failure cannot affect any other row's reported outcome, and no lock is held across the whole
operation. All 5 write methods were migrated to it, not just `bulkUpdate` (the literal "bulk edit" named in
the exit criterion) — the identical broken pattern existed in all 5, so the identical fix was applied to
all 5 in the same pass rather than leaving 4 known-broken siblings unaddressed.

**Not fully investigated:** whether the SAME "wrap N records in one $transaction" pattern exists in other
services across the 45 modules, outside this one shared `BulkOperationsService`. This defect was found only
because E07 happened to audit this specific, shared file; a platform-wide grep for `prisma.$transaction`
wrapping a `for`/`.map` loop over a caller-supplied array (rather than a small, fixed number of related
writes) would be a reasonable, high-value follow-up given how directly this shape of bug violates a
platform invariant (no long-held cross-tenant lock, no unbounded transaction).

### D069 · 🔴 CRITICAL · SavedViewsDeepService.applyViewConfig() returned any saved view's filters/columns to any caller who knew its id — no ownership or share check at all

Found while claiming and building E08 (Saved views, filters and personalisation). `applyViewConfig()` in
`unierp-api/src/modules/saved-views/saved-views-deep.service.ts` fetched a view's `savedViewLayout`,
`savedViewFilter`, and `savedViewColumnConfig` records by `viewId` and returned them directly, without ever
checking whether the calling `userId` owned the view or held a `savedViewSharing` grant for it. Any
authenticated caller who could guess or discover another user's (or another team's) saved-view id — ids are
opaque `cuid()` strings, not secrets, and are routinely exposed in URLs, API responses, and share dialogs —
could retrieve the full filter/column configuration of a saved view they had no relationship to at all. This
is the exit criterion's own literal words inverted: not "respects the viewer's permissions, not the
author's," but "respects no one's permissions."

**How it was caught:** writing the FAIL-first test for E08's own exit criterion and confirming a random,
never-shared-with user could successfully call `applyViewConfig()` against the FIRST test module author's
view before any fix was written.

**Fixed:** new `assertViewAccessible()` requires the caller to be the view's author OR hold a real
`savedViewSharing` grant (`sharedWithUserId === userId`) before `applyViewConfig()` returns anything — a
`NotFoundException` if the view itself doesn't exist, a `ForbiddenException` otherwise. Proven via
break/restore.

**Not fully investigated:** several OTHER methods in the same service — `getFilters(tenantId, viewId)` (no
`userId` parameter at all), `getColumnConfigs` (userId-scoped to the CALLER's own column config, so this one
is likely safe by construction), and `getSharedWithMe` (correctly scoped to `sharedWithUserId`) — were not
individually audited for the identical gap. `getFilters()` in particular takes no `userId` and returns every
active filter for a `viewId` unconditionally, which on its face has the same shape of bug as
`applyViewConfig()` had. This defect was found and fixed for the one method the exit criterion's own
scenario names ("apply a shared view"); a full audit of every saved-view accessor for the same missing-check
pattern is stated as necessary follow-up, not silently assumed complete.

### D070 · 🔴 CRITICAL · A25 ("field-level encryption for PII") is marked DONE with no encryption mechanism, gate, or registry to support the claim

Found while claiming and building E20 (Core HR), whose own exit criterion depends on "PII encrypted per
A25." A25's row in `10-TRACK-A-FOUNDATION.md` claims: *"Every one of the 21 models the PII gate found
undeclared — including `HealthcarePatient` and `EducationStudent` — is encrypted or has a logged exemption
with a reason."* Investigating this claim for `Employee` (the model E20 needed to actually rely on it for)
found:

- No field-encryption code anywhere in `unierp-api/src` touching HR/people models — a grep for
  `encryptField`/`FieldEncryption`/`@Encrypted`/`encryptPII` returns two hits total, both unrelated
  (`platform-credentials.service.ts`, `crm-mailbox.service.ts` — API-key/mailbox-secret handling, not PII
  field encryption).
- No encryption-specific gate script anywhere in `unierp-workspace/scripts` — only
  `check-pii-registry.mjs`/`pii-registry.json` exist, and that registry is about RETENTION/deletion
  treatment (`erase`/`anonymize`/`retain-legal-hold`), a completely different concern from
  encryption-at-rest. There is no script that could ever have verified A25's own exit criterion.
- `Employee.dateOfBirth` and `Employee.bankDetails` (a `Json?` column holding account/routing numbers) were
  both stored as plain, unencrypted values by every existing write path (`hr.service.ts`'s
  `createEmployee`/`updateEmployee`), with zero encryption applied at any layer.

A25 is not "mostly true with a documented gap" — there is no artifact anywhere in this checkout (code, gate,
or registry) that supports the claim that ANY of the 21 models are encrypted, let alone all of them. This
matches the exact shape of D046/D048/D049 (falsified DONE claims, cited in this session's earlier work) and
B23/D063 (a gate that never ran the thing it claims to verify).

**How it was caught:** E20's own exit criterion ("PII encrypted per A25") could not be satisfied by
inspection — there was nothing to point to — so the claim was investigated directly rather than trusted.

**Fixed (E20's own scope, Employee.bankDetails only):** new `EmployeePiiEncryptionService`
(AES-256-GCM, per-tenant key derived via scrypt from a server-side master secret, no database storage or
migration needed) wired into `HrService.createEmployee`/`updateEmployee`. Proven via break/restore. This is
NOT a fix for A25 itself — it closes the gap for exactly the one field this session's own scope (Core HR)
needed to make true.

**Not fixed — explicitly out of scope:** the other 20 models A25 claims to cover (`HealthcarePatient`,
`EducationStudent`, and 18 others named by the PII gate) were not audited or fixed in this pass.
`Employee.dateOfBirth` was also left unencrypted (queried directly for birthday reporting — see E20's own
evidence file for the reasoning). A25 itself should be REOPENED: its Status should not read DONE while zero
verifiable encryption mechanism exists for the claim it makes. A real fix requires, at minimum: (1) a real
encryption-specific gate script (the mirror of what `check-pii-registry.mjs` does for retention, but for
encryption-at-rest), (2) an actual encryption registry naming which of the 21 models/fields are encrypted
vs. exempted and why, and (3) the encryption code itself for whichever models don't yet have it. This is a
multi-session effort at true platform scale, exactly the class of finding this session's D12/D19/J04
precedent says to report honestly rather than understate.

### D071 · 🔴 CRITICAL · Leave balance counted approved REQUESTS, not DAYS — and approveLeaveRequest never checked balance at all

Found while claiming and building E22 (Talent, time and attendance). `HrService.getLeaveBalances()`
(`unierp-api/src/modules/hr/hr.service.ts`) computed `usedDays` as `prisma.leaveRequest.count({ status:
"APPROVED" })` — a raw count of approved leave-request ROWS, regardless of how many days each request
actually spanned. A single approved 10-day request counted as "1 used day" against a 10-day annual
allocation, leaving the balance calculation reporting 9 days still remaining after the employee had already
used their entire allocation in one request. Compounding this, `approveLeaveRequest()` never consulted
leave balance at all before approving — a manager (or the approval-chain engine from E05, once wired to
leave) could approve any number of leave requests of any length with zero enforcement, so even a correct
balance calculation would not have prevented over-allocation.

**How it was caught:** writing the FAIL-first tests for E22's own "leave" non-negotiable and confirming
both the balance-arithmetic bug and the missing-enforcement bug against the pre-existing code before any
fix was written.

**Fixed:** a new shared `requestDays()` (inclusive day-count between two dates) is used by both
`getLeaveBalances()` (summing real days across approved requests, not counting rows) and
`approveLeaveRequest()` (refusing, with a `BadRequestException` naming the shortfall, when the request's
day-count would exceed the employee's real remaining balance). Proven via break/restore.

**Not fully investigated:** whether the SAME "count rows, not days" pattern exists in any other balance- or
allocation-tracking code across the 45 modules (e.g. any other entitlement computed by counting approved
records rather than summing a quantity field) was not swept for platform-wide — this defect was found only
because E22 happened to audit this exact leave-balance code path.

### D072 · 🔴 CRITICAL · CRM campaign audiences included opted-out leads/contacts/customers — CommunicationOptOut had zero usages anywhere in the codebase

Found while claiming and building E23 (CRM), whose own "consented communication via A21" non-negotiable
required checking. A21 (marked DONE) claims "a per-user preference suppresses delivery across all 45
modules" and the schema already carries a generic, entity-agnostic `CommunicationOptOut` model
(`entityType`/`entityId`/`channel`) for exactly this purpose — but `grep -rl "communicationOptOut" src`
across the entire `unierp-api` repository returned zero results. `CrmCampaignManagementService.buildAudience()`
— the method that decides who a marketing campaign actually targets — included every lead, contact, and
customer matching the filter criteria with no consent check of any kind. A contact who had explicitly opted
out of email communication would still be counted, sampled, and (once campaign sending is wired to this
audience elsewhere) targeted.

This is the same class of finding as D066/D069 (a real mechanism exists in the schema and is simply never
called) but with a regulatory dimension: unsolicited marketing communication to an opted-out contact is a
CAN-SPAM/GDPR/PECR violation in most jurisdictions UniERP targets, not merely a UX gap.

**How it was caught:** writing the FAIL-first test for E23's own exit criterion and confirming an
explicitly opted-out lead was included in `buildAudience()`'s result before any fix was written.

**Fixed:** new `excludeOptedOut()` on `CrmCampaignManagementService` checks `CommunicationOptOut` for the
EMAIL channel and filters matching records out of the audience before any count or sample is returned, for
all three entity types (LEAD/CONTACT/CUSTOMER). Proven via break/restore.

**Not fully investigated:**
1. Only the EMAIL channel is checked — `CommunicationOptOut.channel` is a free-text field, so opt-outs for
   SMS or other channels are not consulted by this fix (campaigns in this codebase are overwhelmingly
   email-oriented, but a multi-channel campaign would need per-channel filtering).
2. Whether ANY other module that sends bulk/marketing communication (e.g. `notifications`, `communication`)
   also fails to check `CommunicationOptOut` was not swept for platform-wide — this defect was found only
   because E23 happened to audit this exact CRM code path. Given A21's own "no module sends mail directly"
   claim is now independently in question (this is the second finding this session, after D070/A25, of a
   platform-wide compliance/security claim with no supporting mechanism), a dedicated audit of every
   notification-sending call site against `CommunicationOptOut`/`CommunicationPreference` is a
   high-priority follow-up.
3. Performance: `excludeOptedOut()` now fetches the full matching record set (no longer `take: 10` at the
   database layer) before filtering and sampling client-side, since filtering must happen before sampling
   to avoid a false-small "top 10" that happens to include opted-out rows. For very large audiences this
   trades a `take: 10` query for a full-table fetch — acceptable for this fix's correctness-first scope, but
   worth revisiting if audience sizes grow large (a `NOT IN (subquery)` at the database layer would avoid
   this, once perf work funds it).

### D073 · 🟠 HIGH · StorageService never enforced a tenant's storageLimit — quota was a settable, displayed number with zero effect

Found while claiming and building E27 (Content, documents and storage), whose own exit criterion names
"quota" explicitly. `StorageQuota.storageLimit` (a real `BigInt` column, 1GB default, settable via
`updateQuota()` and readable via `getQuota()`) was never consulted by `registerFile()` — the only place new
uploads are recorded. Every upload was registered and `storageUsed` incremented unconditionally, regardless
of how far over the configured limit a tenant already was. A tenant's quota setting had no operational
effect whatsoever; it was purely a number in a settings screen.

Also noted but not fixed in this pass: `createFileVersion()` (new file versions — the "versioning"
non-negotiable this same phase names) also never touches `StorageQuota` at all, so adding new versions of an
existing file is entirely free against quota — a second, related bypass path.

**How it was caught:** writing the FAIL-first test for E27's own "quota" non-negotiable and confirming an
upload that would push a tenant well past their configured 1GB limit was registered successfully, with no
refusal, before any fix was written.

**Fixed:** `registerFile()` now fetches the tenant's quota and refuses (`BadRequestException`, naming the
exact byte counts) before creating the file row if the upload would push `storageUsed` past `storageLimit`.
Proven via break/restore.

**Not fixed — explicitly out of this pass's scope:** `createFileVersion()`'s identical gap (new versions
bypass quota entirely) was identified but not fixed here, since it is a second, separate call site with its
own considerations (should a version's size count against the SAME quota as a new file, or a distinct
"version storage" allocation? — a product decision this phase should not make unilaterally). Filed here so
it is not silently left unaddressed.

### D074 · 🟢 LOW · jscpd (v5.0.14, Rust CLI) failed to detect a verified byte-identical 60-line duplicate — root cause not found, tool not used for L06

Found while building L06 (Duplication gate). `npx jscpd` ran successfully against unierp-api's 46
modules and reported plausible-looking real findings (345 clones, 234 cross-module at a 40-line
threshold) — but when a byte-identical 60-line block was deliberately copy-pasted from
`hr.service.ts` into `people.service.ts` (confirmed via `diff` returning zero output), jscpd failed
to report it as a clone even scoped to just those two files at `--min-lines 5 --min-tokens 10`
(the loosest reasonable settings). `.gitignore` handling, a stale cache directory, and file-format
detection were checked directly and none explained it.

**How it was caught:** the break/restore step of L06's own protocol — proving the gate can fail is
what surfaced that the underlying detector couldn't be trusted to catch the exact scenario named in
the exit criterion.

**Not fixed — jscpd was not used.** Rather than ship a duplication gate depending on a third-party
binary whose detection behavior could not be verified end-to-end, L06's `check-duplication.mjs` was
built as a self-contained, deterministic sliding-window hash detector instead (see L06's own
evidence file, `evidence/l06-evidence.txt`), proven correct via the same break/restore scenario that
exposed jscpd's gap.

**Not fully investigated:** the actual root cause inside jscpd 5.0.14's Rust implementation. If a
future phase wants industry-standard AST-aware clone detection (this session's hand-rolled detector
is deliberately conservative — near-verbatim only, no semantic equivalence), it would need to
either find and fix jscpd's detection gap, pin an older/different jscpd version and re-verify, or
evaluate an alternative tool with the same break/restore discipline before trusting it.

### D075 · 🟡 MEDIUM · 1073 of 1081 always-passing coverage-padding tests remain after L12's own proof-of-mechanism fix

L12 ("Delete the tests that cannot fail") replaced ONE file's worth of always-passing tests
(`unierp-api/src/modules/admin/tests/alerts.service.coverage.spec.ts`, 8 occurrences of the
`try { expect(result).toBeDefined() } catch (e) { expect(e).toBeDefined() }` idiom identified by
L11/D016) with 11 real behavioral tests, and proved the replacement mechanism is correct: a
deliberately-introduced real regression (`markRead()` losing its `tenantId` scoping — a genuine
cross-tenant write vulnerability) was caught immediately by the new tests, something the deleted
always-passing tests could never have detected regardless of how badly the underlying code broke.

`grep -rn 'expect(e)\.toBeDefined' --include='*.spec.ts' .` dropped from 1081 to 1073 — this
file's exact contribution, and nothing else. The remaining 1073 occurrences, across 66 more
`*.coverage.spec.ts` files (per L11's own inventory, `docs/programme/L11-COVERAGE-PADDING-INVENTORY.md`),
still need the same treatment: read the real service, understand what each method is actually
supposed to do, and write an assertion that would fail if that behavior changed — not merely
delete the always-passing shell.

**Why not done in this phase:** each of the 1073 remaining tests requires understanding a specific
method's real behavior before a meaningful assertion can be written — this is fundamentally a
per-method task, not a mechanical find-and-replace. Attempting a shortcut (e.g. a template that
asserts "the mock was called" without checking WITH WHAT) would reproduce a weaker version of the
same defect class this phase exists to eliminate. Per this session's D12/D19/J04/J07/L11 precedent,
a real, measured, honest remaining count is filed here rather than a batch of shallow replacements
manufactured to move the number.

**Not fixed:** the remaining 1073 occurrences across 66 files. `L11-COVERAGE-PADDING-INVENTORY.md`
already ranks every file by always-passing block count (worst: `crm.service.coverage.spec.ts`,
181/181), giving whoever picks this up next a prioritised, evidenced worklist rather than a blind
grep.

### D076 · 🟡 MEDIUM · 51 of 55 real `fix(...)` commits in unierp-api's own history predate any test-naming discipline

Found while building L15 (Bug-fix regression discipline). `scripts/check-bugfix-test-discipline.mjs`
was run against unierp-api's real commit history (276 commits scanned, 55 matching the platform's own
established `fix(scope): ...` convention) and found 51 of 55 fix commits either shipped with no
`*.spec.ts` file in the same commit at all, or shipped one whose filename is never named anywhere in
`docs/ai/CHANGELOG.md`. This confirms L15's own premise directly rather than assuming it: fix commits
on this platform have historically NOT reliably shipped with a regression test that failed before and
passes after, and even where a test did ship, nothing connected it back to the changelog line a future
agent would read.

**How it was caught:** running the real gate mechanism against real history as L15's own break/restore
step — the same discipline this session has applied throughout (a check that has not been run against
something it's supposed to catch is not proven).

**Not fixed — retroactive, not in scope.** L15's own deliverable is the enforcement MECHANISM going
forward ("a fix commit without an accompanying test IS flagged in review"), not a retroactive rewrite
of 51 historical commits to add missing tests years after the fact — many of the underlying code paths
those commits touched have since been superseded by later work in this same history. The gate is real,
proven correct against known-compliant and known-non-compliant synthetic commits (a throwaway test repo,
not the real history, to avoid polluting it), and ready to enforce discipline on every fix commit from
here forward.

**Not fully investigated:** which of the 51 flagged commits' underlying bugs, if any, are still
present in the current codebase without ANY regression coverage (as opposed to merely lacking the
changelog cross-reference this gate specifically checks for) — that would require reading each
commit's actual diff against current `HEAD`, not just its own historical diff, and is a meaningfully
larger undertaking than this phase's own scope.

### D077 · 🟡 MEDIUM · 87 of 88 oversized controllers remain after L07's own proof-of-technique decomposition

L07 ("Decompose the oversized controllers") built the real measurement gate
(`scripts/check-controller-decomposition.mjs`, line-count + `if`-count per controller, baseline-
ratcheted like L06/L14) and completely decomposed ONE real violator
(`unierp-api/src/modules/supply-chain/controllers/logistics-execution.controller.ts`, 401 -> 308
lines) as proof of a safe, mechanical technique: this controller's only violation was line count from
three large inline Zod validation schemas — it was ALREADY routing-only (zero `if` statements before
and after), so the fix was extracting the schemas to a sibling file with no risk to routing or
business logic, proven safe via 13 new behavior-asserting tests and a real break/restore
(dropping `tenantId` from one delegated call was caught immediately).

Measured directly: **571 real controllers** exist under `unierp-api/src/modules`, of which **88**
(now 87, after this phase) exceed the 400-line hard ceiling, and **35** still contain `if` statements
(logic that belongs in a service, per `IMPLEMENTATION_PLAN § 4`). The worst offender,
`advanced-finance.controller.ts` — 8,283 lines and 4 `if`-blocks, the file this phase's own
deliverable text names explicitly — was NOT attempted in this pass.

**Why not attempted:** `advanced-finance.controller.ts` (and the other multi-thousand-line
violators — `crm.controller.ts` at 2,980, `finance-expansion-deep.controller.ts` at 2,730,
`inventory.controller.ts` at 2,245, several `*-generated.controller.ts` files at ~2,000 each) are not
the same class of fix as `logistics-execution.controller.ts`. Unlike that file, several of these
DO contain `if` statements — meaning real business logic lives in the controller layer and must be
moved into a service, verified behavior-preserving with real tests, before the file can shrink safely.
This is a per-file, multi-hour undertaking each, not a mechanical schema-extraction — attempting it at
scale in one pass risks exactly the kind of shallow, unverified refactor this session has consistently
rejected in favor of honest, measured partial progress (see D12/D19/J04/L11/L12's own precedent).

**Not fixed:** 87 of 88 oversized controllers, including the specific 8,283-line file this phase's own
deliverable names. `scripts/check-controller-decomposition.mjs --worst N` gives whoever continues this
a real, measured, prioritised worklist (worst by line count first) rather than a blind search.

### D078 · 🟡 MEDIUM · 47 of 48 oversized services remain after L08's own proof-of-technique decomposition

L08 ("Decompose the oversized services") built the real measurement gate (`scripts/check-service-
decomposition.mjs`, line-count per service, baseline-ratcheted like L06/L07/L14) and completely
decomposed ONE real violator (`unierp-api/src/modules/crm/crm-mailbox.service.ts`, 808 -> 657 lines)
along a genuine, pre-marked responsibility boundary — the source already had a `// ── Provider REST
calls ──` section comment separating raw Gmail/Microsoft Graph HTTP calls from OAuth-lifecycle/CRM-
matching logic. The 4 extracted methods became `CrmMailboxProviderClientService`, with its own 5 new
tests; the 10 pre-existing tests for `CrmMailboxService` itself pass UNCHANGED (only their
instantiation call site needed updating for the new constructor param), proving the split preserved
behavior exactly rather than merely moving lines around — the exit criterion's own named failure mode.

Measured directly: **737 real services** exist under `unierp-api/src/modules`+`src/developer`, of
which **48** (now 47, after this phase) exceed the 800-line hard ceiling. The worst,
`inventory.service.ts` at 3,990 lines, is the exact file this phase's own deliverable text names
(cited there as "3,989 lines" — a 1-line measurement-convention difference, not a discrepancy in which
file or roughly how large).

**Why not attempted at scale:** unlike `crm-mailbox.service.ts`, most of the remaining 47 violators
(`inventory.service.ts` 3990, `finance-operations.service.ts` 2956, `communication.service.ts` 2935,
`builder.service.ts` 2823, `crm-forecasting.service.ts` 2735, and more) have not been read closely
enough in this pass to confirm they have an equally clean, pre-existing responsibility seam — the exit
criterion explicitly REJECTS "a split that only moves lines," so each of these needs its own read for
genuine responsibility boundaries before any split, not a mechanical divide-by-N.

**Not fixed:** 47 of 48 oversized services, including `inventory.service.ts`.
`scripts/check-service-decomposition.mjs --worst N` gives whoever continues this a real, measured,
prioritised worklist.

### D079 · 🟡 MEDIUM · 260 of 261 oversized page components remain after L09's own proof-of-technique decomposition

L09 ("Decompose the oversized pages") built the real measurement gate (`scripts/check-page-
decomposition.mjs`, line-count per `page.tsx`, baseline-ratcheted like L06-L08/L14) and completely
decomposed ONE real violator (`unierp-web/app/(dashboard)/projects/portfolios/page.tsx`, 301 lines)
into a hook (`hooks/use-portfolios.ts`, fetch/create data flow) and two sub-components
(`components/portfolio-card.tsx`, `components/create-portfolio-modal.tsx`). The page itself is now 61
lines, composition only.

Neither extracted component was moved to `unierp-design-system` — both are genuinely portfolio-shaped
(strategic-alignment badges, budget/risk KPI fields specific to this one entity), not generic reusable
primitives, so moving them would have been a forced fit the exit criterion does not require ("extracted
components that ARE reusable land in unierp-design-system" — conditional, not mandatory for every
extraction).

Measured directly: **891 real `page.tsx` route files** exist under `unierp-web/app`, of which **261**
(now 260, after this phase) exceed the 300-line ceiling. The worst, `connect/page.tsx` at 6,637 lines,
is the exact file this phase's own deliverable text names (cited there as "6,651 lines" — a small
measurement-convention difference).

**Also found and stated as a real infrastructure gap (not fixed):** `unierp-web` has ZERO React
component-test infrastructure — `@testing-library/react` and `jsdom` are not dependencies, and no
`*.test.tsx` file exists anywhere in the repo for any page or component. This phase's own "behaviour
proven unchanged" was therefore verified mechanically instead (every one of the original 34 CSS-module
class references and both API endpoint strings from the pre-split file confirmed present, unchanged,
somewhere across the split files) rather than via a render test, since building that test
infrastructure from scratch is a separate, larger decision this phase should not make unilaterally.

**Why not attempted at scale:** 260 remaining violators, several multi-thousand-line
(`connect/page.tsx` 6,637; `projects/page.tsx` 2,001; `register/page.tsx` 1,526), have not been read
closely enough in this pass to identify genuine, safe extraction boundaries each — a mechanical
line-split risks producing exactly the kind of shallow decomposition this session's own precedent
(L07's D077, L08's D078) has consistently rejected.

**Not fixed:** 260 of 261 oversized pages, including `connect/page.tsx`. The React component-test
infrastructure gap for `unierp-web`. `scripts/check-page-decomposition.mjs --worst N` gives a real,
measured, prioritised worklist.

### D080 · 🔴 CRITICAL · unierp-api had no ESLint config at all — `npm run lint` referenced a file that did not exist anywhere in the repo

Found while claiming and building L02 (Naming convention gate). `package.json`'s `lint` script
(`eslint "{src,test}/**/*.ts"`) has presumably existed for a long time, but no `.eslintrc.*` or
`eslint.config.(js|mjs|cjs)` file existed anywhere in `unierp-api` — confirmed directly: an
unpinned `npx eslint` invocation against a real source file failed immediately with "ESLint
couldn't find an eslint.config.(js|mjs|cjs) file." This means `npm run lint` has never actually
linted anything in this repo; it fails at startup before checking a single file. If CI ever ran
this script, it either (a) was never wired into a required CI check, (b) silently treated the
immediate failure as acceptable, or (c) was never actually invoked — any of which is the same
class of finding as D013/D016/D017: a documented, apparently-enforced standard with no working
mechanism behind it.

**How it was caught:** L02's own protocol step of running the exit criterion's implied mechanism
before building anything — the very first `npx eslint` invocation for this phase failed outright,
not with naming-convention warnings but with a missing-config error.

**Fixed:** a real `eslint.config.mjs` now exists, encoding the mechanically-checkable subset of
`CODE_STANDARDS § 3` via `@typescript-eslint/naming-convention`. `eslint`, `typescript-eslint`,
`@typescript-eslint/parser`, and `@typescript-eslint/eslint-plugin` added as real devDependencies
(none were previously installed — the npx invocation was auto-installing an unpinned copy from
the registry on every invocation, itself a supply-chain risk this fix removes).

**Not fully investigated:**
1. Whether this SAME pattern (a `lint` script referencing a config that doesn't exist) is present
   in any of the other 29 repos in this polyrepo — not swept for platform-wide in this pass.
2. Type-aware naming-convention linting (needed to distinguish a boolean variable from any other)
   OOMs across the FULL `unierp-api` repo even with an 8GB heap, and proved unreliable to invoke
   correctly at even a 6-module scope in this environment — L02's own baseline is scoped to a
   single module (`admin`, 30 files, 5 real violations found) as a result. Extending real coverage
   to more of the repo needs either more memory/time budget than this session had, or a
   non-type-aware approximation of the boolean-naming rule that trades some accuracy for
   tractability.

### D081 · 🟢 LOW · 7 of 29 unierp-design-system component exports appear unused across both consuming repos

Found while building L05 (Dead-code and unused-export gate) — the exact family-wide blind spot the
phase's own exit criterion names ("an orphaned file in a polyrepo is invisible to a single-repo
view"). `unierp-design-system`'s component barrel (`src/components/index.ts`) exports 29 named
values; a real cross-repo grep against both consuming frontend repos (`unierp-web`,
`unierp-console` — 1,352 source files) found 7 with zero textual reference anywhere:
`AutosaveIndicator`, `ComboBox`, `DatePicker`, `InfoHint`, `ProtectedField`, `SkeletonText`,
`useFieldAccess`.

**How it was caught:** running the real, measured mechanism this phase built — no single repo's
own lint/typecheck would ever surface this, since `unierp-design-system` itself has no way to know
whether anything downstream imports what it exports, and the consuming repos have no reason to
notice a component they never imported.

**Not fixed — not necessarily dead code.** Some of these are plausibly legitimate: `ComboBox` and
`DatePicker` may be intentionally-unadopted newer primitives (B01-B12's own migration work is
ongoing per this session's own findings elsewhere), and `useFieldAccess`/`ProtectedField` may be
consumed only via a JSX spread or a dynamically-constructed import this word-boundary text search
cannot see. Each of the 7 needs an individual read to determine real dead-code vs not-yet-adopted
vs a false negative in this measurement — not something to delete or judge from the count alone.

**Not fully investigated:** whether the SAME orphan pattern exists in `unierp-design-system`'s other
barrel exports (`layout`, `charts`, `data-grid`, `dashboard`, `notifications`, `theme`, `tokens`,
`hooks`, `utils`, `icons`, `form-engine`, `workflow` — this phase measured only the `components`
barrel), or in any other shared package this polyrepo has (`unierp-contracts`, `unierp-shared`,
`unierp-kernel`, `unierp-sdk`). A known limitation of the measurement itself: it is a word-boundary
text search, not an AST-aware import-graph analysis — it will miss usage where a consumer aliases
the import to a different local name (`import { ComboBox as Combo } from ...`), so the true orphan
count could be lower than 7, never higher.

### D082 · 🟡 MEDIUM · 16 of 46 modules exceed a 10,000-line "must load to change safely" context budget — worst is crm at 97,237 lines

Found while building L16 (Context-window budget per unit of work). Measured directly: total lines
of module code + tests (all `.ts` files under `unierp-api/src/modules/<name>/`) per module. 16 of
46 modules exceed a stated 10,000-line budget — `crm` at 97,237 lines is nearly ten times over;
`advanced-finance` (75,019), `inventory` (58,504), `admin` (34,586), and `advanced-hr` (25,671)
follow. An agent asked to "safely change one module" in any of these 16 cannot load the module's
own full code into a working context alongside the conversation, other files, and its own output —
exactly the risk `CODE_STANDARDS § 4`'s own reasoning names ("a file it cannot load alongside the
code it must integrate with is a file it will modify blindly").

**How it was caught:** this phase's own real measurement, run directly against the actual codebase
rather than assumed from the plan's framing.

**Not fixed — this phase's own exit criterion says so explicitly.** "A module that exceeds it is a
decomposition task, not a documentation task" — the fix is the same controller/service/page
decomposition work L07-L09 already started (proving one file each, filing the rest as D077/D078/
D079). This defect exists to make the connection explicit: those three phases' own remaining scope
IS what would bring these 16 modules under budget, not a new, separate effort.

**Not fully investigated:** the schema-slice and cross-repo-contract portions of the "must load"
set named in this phase's own deliverable text were NOT measured — `core.prisma` (31,092 lines) has
no reliable per-module boundary to extract mechanically, and `unierp-contracts` has no per-module
directory structure to match against. The true "must load" size for any of these 16 modules is
LARGER than the 10,000-line code-plus-tests figure reported here, not smaller — this measurement is
a floor, not a ceiling.

### D083 · 🟢 LOW · Real architecture findings surfaced by L18's generated maps: 1 direct cross-module import bypassing the outbox pattern, and 63 of 80 events with no listener found anywhere in scope

Found while building L18 (Generated architecture and dependency maps) — exactly the kind of finding
these maps exist to surface mechanically rather than leave buried in 2,000+ files no single read
would catch.

1. **`advanced-finance` imports directly from `finance`** (`docs/architecture/module-dependency-graph.md`).
   The other 3 real cross-module import edges found (`blockchain`→`outbox`, `ecommerce`→`outbox`,
   `sales`→`outbox`) are the CORRECT pattern this platform requires for cross-module effects — a
   module importing the shared `outbox` module directly is expected. `advanced-finance`→`finance` is
   different: one business module importing another business module's own files directly, bypassing
   the outbox/event pattern `IMPLEMENTATION_PLAN` and this track's own invariant require.

2. **63 of 80 distinct event names have zero listeners found anywhere in `unierp-api/src/modules`**
   (`docs/architecture/event-flow.md`). Some of these are legitimately consumed outside the scanned
   scope (a listener in `src/developer` or `src/platform`, or a consumer in a different repo
   entirely via a message queue this static scan cannot see) — not automatically dead code. But a
   79% "no listener found" rate is a real signal worth triaging, not assumed benign.

**How it was caught:** this phase's own real, mechanical generation — the entire point of building
a machine-generated map instead of trusting prose, per this phase's own exit criterion citing D004
and D013 as the class of claim this replaces.

**Not fixed — investigation, not remediation, is this phase's own scope.** Whether the
`advanced-finance`→`finance` coupling is a genuine violation needing a refactor, or a legitimate
same-domain relationship the outbox pattern doesn't apply to, needs a read of the actual import and
its call site — not assumed either way from the map alone. Similarly, triaging which of the 63
apparently-unconsumed events are genuinely dead vs. consumed outside this scan's scope needs a
broader search (other repos, message-queue configuration) this phase did not perform.

### D084 · 🔴 CRITICAL · GlAccountingService.postJournalToBook() accepted unbalanced journals up to a full cent — float-with-epsilon balance check, not exact Decimal comparison

Found while claiming and building E09 (General ledger and core accounting), whose own exit criterion
opens with "Double-entry provably balanced." `unierp-api/src/modules/advanced-finance/services/gl-
accounting.service.ts`'s `postJournalToBook()` — one of at least two journal-posting code paths in
this service — checked balance via `Math.abs(totalDebit - totalCredit) > 0.01` on raw JavaScript
floating-point numbers summed from caller-supplied `debit`/`credit` values. This is doubly wrong: (1)
an epsilon-TOLERANT check silently accepts any real imbalance up to a full cent as "close enough" —
double-entry accounting requires debits to equal credits EXACTLY, to the last minor unit, with zero
tolerance; (2) `CODE_STANDARDS`' own explicit rule ("Money is `Decimal(19,4)`... never converted to
`number` for arithmetic") was violated directly. The same file's own `reverseJournalToBook()` path
elsewhere correctly uses `Prisma.Decimal` and `.equals()` for an equivalent check — this was a live
inconsistency within one file, not a hypothetical.

**How it was caught:** writing the FAIL-first test for E09's own "provably balanced" exit criterion
and confirming a journal deliberately off by half a cent (100.00 debit vs 99.995 credit — genuinely,
mathematically unbalanced) was accepted and posted by the pre-existing code before any fix was written.

**Fixed:** `postJournalToBook()` now sums both sides as `Prisma.Decimal` and requires exact
`.equals()`, matching the correct pattern already present elsewhere in the same file. Proven via
break/restore.

**Not fully investigated — E09's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion is far larger than the one bug found and fixed here: multi-currency
revaluation, period-close integration (E06 already built, not re-verified against this fix), trial
balance/P&L/balance sheet reconciliation to the ledger, and 100% test coverage on ALL arithmetic in
this 1,248-line service. Only `postJournalToBook()`'s own balance check was audited and fixed in this
pass. A dedicated, wider audit of every OTHER money-arithmetic path in `gl-accounting.service.ts` (and
the broader `advanced-finance`/`finance` modules) for the same float-vs-Decimal class of bug is a
high-priority follow-up — this defect's own discovery, by inspecting one function closely rather than
assuming the file was internally consistent, suggests more instances are plausible.

### D085 · 🔴 CRITICAL · FinanceService.createPayment() rejected legitimate final payments outright due to float-vs-Decimal arithmetic — same class of bug as D084, different code path

Found while claiming and building E10 (Receivables, payables and cash), whose own exit criterion
names "part-payment" and "every posting traceable to a source document" among its non-negotiables.
`unierp-api/src/modules/finance/finance.service.ts`'s `createPayment()` converted the invoice's real
`Decimal(19,4)` columns (`paidAmount`, `totalAmount`) to plain JavaScript `Number` via `Number(...)`,
then did `currentPaid + dto.amount` in float arithmetic, compared the result to `totalAmount` with
`>` to reject overpayment, and with strict `===` to decide whether to transition the invoice to
`PAID`. This directly repeats D084's class of bug (money arithmetic in float, violating
`CODE_STANDARDS`' explicit "Money is `Decimal(19,4)`... never converted to `number` for arithmetic"
rule) — predicted as plausible in D084's own "not fully investigated" note, now confirmed on a
second, independent code path.

The consequence is worse than a stuck status flag: IEEE 754 addition is not exact (e.g.
`0.2 + 0.1 === 0.30000000000000004`, not `0.3`), so a legitimate final partial payment that
mathematically completes an invoice exactly can compute a `newPaidAmount` that is both `!== totalAmount`
(stuck at `PARTIALLY_PAID` forever) AND, in the confirmed reproduction, `> totalAmount` — meaning the
payment is **rejected outright** with `BadRequestException("Payment amount exceeds total due amount")`,
even though it was for the exact remaining balance.

**How it was caught:** writing a FAIL-first test (`src/modules/finance/tests/finance-payment-decimal.service.spec.ts`)
for an invoice with `paidAmount = 0.2`, `totalAmount = 0.3`, and a final payment of `0.1` — the
pre-existing code threw `BadRequestException: Payment amount exceeds total due amount` against a
payment that mathematically completes the invoice exactly.

**Fixed:** `createPayment()` now constructs `Prisma.Decimal` for `currentPaid`, `totalAmount`, and
the payment amount, and uses `.plus()` / `.greaterThan()` / `.equals()` throughout — zero float
arithmetic on money, matching the pattern established in D084's fix. Proven via break/restore
(reverted to the original float arithmetic, confirmed the FAIL-first test fails again with the
identical `BadRequestException`, restored, confirmed clean pass, confirmed the restored file is
byte-identical to the fixed version). Full regression: `src/modules/finance/` and
`src/modules/advanced-finance/` — 629/629 real tests pass (2 pre-existing suite-collection failures,
`Cannot find package '@unerp/shared'`, unrelated to this change, unchanged from E09). Typecheck: same
4 pre-existing `@kannan19302/shared` resolution errors, unchanged.

**Not fully investigated — E10's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion is far larger than the one bug found and fixed here: ageing, dunning,
allocation (multi-invoice payment splitting), write-off, and bank reconciliation. Searching
`unierp-api/src/modules/finance/ar-deep.service.ts` found NO allocation/write-off/bank-reconciliation
logic at all — only collections-queue, credit-management, credit-hold, promise-to-pay, and
dispute-management methods. Whether allocation/write-off/bank-reconciliation exist elsewhere in the
repo, exist nowhere yet, or are out of scope for this checkout was not determined in this pass. A
dedicated audit of `ap-deep.service.ts` and `finance-operations.service.ts` (both also matched the
`recordPayment|createPayment|applyPayment` search that led to this fix) for the same float-vs-Decimal
class of bug is a high-priority follow-up, following this defect's own precedent that assuming
internal consistency is unsafe without inspection.

### D086 · 🔴 CRITICAL · InterCompanyService.autoMatchTransactions() falsely auto-matched intercompany invoices/schedules up to a full cent apart — same epsilon-tolerant float class of bug as D084/D085, on the reconciliation path

Found while claiming and building E11 (Advanced finance), whose own exit criterion names
"intercompany... reconciling to the GL" among its non-negotiables. `unierp-api/src/modules/advanced-
finance/services/intercompany.service.ts`'s `autoMatchTransactions()` matched an AR invoice to an AP
payment schedule as the same intercompany transaction via
`Math.abs(Number(inv.totalAmount) - Number(sched.amount)) < 0.01` — an epsilon-tolerant float
comparison, the third confirmed instance of this session's D084/D085 bug class (money converted to
`Number`, compared with tolerance instead of exactness). Unlike D084/D085 where the consequence was a
wrongly-refused or wrongly-accepted single transaction, here the consequence is a **false positive
match**: two invoices/schedules that are genuinely different dollar amounts (differing by up to a full
cent) get silently recorded as the same reconciled intercompany transaction, creating an incorrect
`interCompanyTransaction` row and, downstream, an incorrect elimination journal entry against the GL —
directly undermining this phase's own "reconciling to the GL" requirement.

**How it was caught:** writing a FAIL-first test for a $5000.00 invoice and a $4999.995 payment
schedule (a genuine half-cent difference, real distinct amounts) — the pre-existing code created an
`interCompanyTransaction` matching them as if they were the same transaction.

**Fixed:** `amtMatch` now constructs `Prisma.Decimal` for both sides and uses `.equals()` — exact
equality, matching the pattern established in D084 and D085. Proven via break/restore (reverted to the
epsilon-tolerant comparison, confirmed the false match reproduces, restored, confirmed 0 `BROKEN FOR
PROOF` markers remain and 12/12 tests pass). Full regression: `src/modules/advanced-finance/` +
`src/modules/finance/`, 630/630 real tests pass (2 pre-existing unrelated `@unerp/shared`
collection failures, unchanged). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E11's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion (budgets, cost centres, allocations, consolidation, intercompany, deferred
revenue, accruals, each reconciling to the GL) spans 47 service files in `advanced-finance/services/`.
Only `autoMatchTransactions()`'s own amount-match check was audited and fixed. Other candidates spotted
but NOT investigated in this pass: `budget-control.service.ts`'s tolerance-based budget-limit check
(uses float arithmetic with an intentional configurable tolerance — plausibly correct-by-design rather
than a bug, not distinguished either way here) and every other `Number(...)`-converted money field
across `consolidation.service.ts`, `consolidation-deep.service.ts`, `consolidation-v2.service.ts`,
`budget-deep.service.ts`, `budget-reallocation.service.ts`, and the remaining 40+ services in this
module — this defect's own discovery, the third of its class this session, suggests a systematic sweep
of every `Number(...)`-on-money conversion across `advanced-finance` (and the wider codebase) is now a
higher-value follow-up than auditing one function at a time.

### D087 · 🔴 CRITICAL · TaxEngineDeepService.updateJurisdiction() let tax rates be overwritten in place — no effective-dated versioning at all, directly violating G-15

Found while claiming and building E12 (Tax and statutory determination), whose own exit criterion is
explicit and names this exact invariant: "rate changes versioned by effective date, never retroactive
(G-15)." `unierp-api/src/modules/advanced-finance/services/tax-engine-deep.service.ts`'s
`updateJurisdiction()` accepted `rate` as part of its partial update DTO and wrote it directly onto the
existing `taxJurisdiction` row via an unrestricted object spread. Because that row's own
`effectiveFrom`/`effectiveTo` window is the record of which rate applied over which date range,
overwriting `rate` in place silently rewrites the rate that applied to every date already inside that
window — including dates already in the past. There was no code path anywhere in this service (or the
sibling `tax-jurisdiction-lookup.service.ts` / `finance-operations.service.ts` tax-jurisdiction CRUD)
that created a new versioned row on a rate change; the `effectiveFrom`/`effectiveTo` columns existed in
the schema but were not load-bearing for anything except the row's own creation.

**How it was caught:** writing a FAIL-first test that changed a jurisdiction's rate via
`updateJurisdiction({ rate: 999 })` and then read the row back — the pre-existing code silently
rewrote the single row's rate with no new version, no historical record preserved, and no way to ever
recover "what rate applied on 2025-06-01" once the row was overwritten.

**Fixed:**
- `updateJurisdiction()` no longer accepts `rate` in its type, and — critically — no longer spreads the
  raw DTO into the Prisma `data` object at all; it now whitelists exactly `name`/`isActive`/
  `description`/`effectiveTo`, so `rate` can never reach the update even from an untyped call site (the
  controller passes `dto as never`, which would otherwise defeat a type-only fix).
- New `changeRate(tenantId, id, newRate, newEffectiveFrom)`: closes the current version's `effectiveTo`
  to the day before the new rate's `effectiveFrom`, then inserts a brand-new row carrying the new rate
  — full history preserved, nothing overwritten.
- New `getRateAsOf(tenantId, code, asOfDate)`: recovers the exact version whose
  `effectiveFrom`/`effectiveTo` window contains a given historical date — what invoice/PO tax
  calculation should call instead of a bare "get the jurisdiction" lookup.
- Controller: `PATCH /tax/jurisdictions/:id`'s Zod schema no longer accepts `rate`; new
  `POST /tax/jurisdictions/:id/change-rate` endpoint wired to `changeRate()`.

Proven via break/restore (reverted to the unrestricted-spread version, confirmed the exact retroactive
overwrite reproduces — rate silently became 999 with no version created — restored, confirmed 0
`BROKEN FOR PROOF` markers remain, 2/2 new tests pass). Full regression:
`src/modules/advanced-finance/` + `src/modules/finance/`, 632/632 real tests pass (2 pre-existing
unrelated `@unerp/shared` collection failures, unchanged). Typecheck: same 4 pre-existing unrelated
errors, unchanged.

**Not fully investigated — E12's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires "jurisdiction-correct determination" and "per-country
statutory reports," neither audited in this pass. Critically: no code path was found anywhere in
`unierp-api` that actually CALLS `getRateAsOf()` (or any effective-dated lookup) when calculating tax
on an invoice or purchase order — the real invoice-tax-calculation code found in
`finance-operations.service.ts` (`calculateSalesTax`-style logic near line 940) reads a *different*
model entirely (`tax` / `taxRateId`, not `taxJurisdiction`) with no date-awareness at all. Whether
`taxJurisdiction` is genuinely wired into any calculation path, is a parallel/unused model, or is
awaiting integration was not determined. This is a strong follow-up candidate: G-15 compliance for the
CRUD layer (this phase's fix) does not by itself guarantee any invoice was ever taxed using a
date-correct rate — that requires tracing the actual calculation call graph, not assumed from this fix.

### D088 · 🔴 CRITICAL · FixedAssetsService.postDepreciation() silently reduced an asset's book value with no GL journal when account mapping was incomplete — directly violating E13's "every event posting to the GL"

Found while claiming and building E13 (Fixed assets), whose own exit criterion is explicit: "Acquisition,
depreciation schedules, revaluation, impairment, insurance, transfer, disposal — every event posting to
the GL." `unierp-api/src/modules/fixed-assets/fixed-assets.service.ts`'s `postDepreciation()` only
created a GL journal `if (assetAcc && accumAcc && expenseAcc)` — three optional account-mapping fields
on the asset or its category. If any one of them was unmapped (a highly plausible real-world state: a
newly-onboarded asset category with incomplete GL setup), the method still created the
`assetDepreciation` record with `status: "POSTED"` and `journalId: null`, and still called
`fixedAsset.update()` to reduce `currentValue` by the depreciation amount — a real, permanent reduction
in the asset's book value with zero corresponding GL journal ever created. This creates a silent,
permanent, undetectable gap between the fixed-asset register and the general ledger — the asset register
says the asset has been depreciated, the GL has no record of it, and nothing catches the divergence.

**How it was caught:** writing a FAIL-first test for an asset whose category maps NO GL accounts at all
and calling `postDepreciation()` — the pre-existing code returned a successful `{ id: "dep-1" }` result,
called `fixedAsset.update()`, and created the `assetDepreciation` record, all with no GL journal.

**Fixed:** `postDepreciation()` now checks GL account mapping completeness BEFORE any write happens
(before the `$transaction` even opens) and throws `BadRequestException` naming the asset if any of the
three required accounts is missing — depreciation can no longer be posted at all without a GL journal
being created in the same transaction. Proven via break/restore (reverted to the original silent-skip
logic, confirmed the exact original defect reproduces — `{ id: "dep-1" }` resolved instead of the
expected rejection — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 7/7 tests pass). Full
regression: `src/modules/fixed-assets/`, 16/16 real tests pass (1 pre-existing unrelated `@unerp/shared`
collection failure, unchanged from E09-E12). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E13's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion names 7 distinct event types (acquisition, depreciation, revaluation,
impairment, insurance, transfer, disposal), each required to post to the GL. Only `postDepreciation()`
was audited and fixed. NOT investigated in this pass:
  - `transferAsset()`, `logMaintenance()`, and `disposeAsset()` (all present in the same service) — not
    checked for the same "silently succeeds without a GL journal when accounts are unmapped" pattern.
  - Revaluation and impairment: no dedicated method for either was located in `fixed-assets.service.ts`
    during this pass — `asset-lifecycle.service.ts` and `fixed-asset-deep.service.ts` in
    `advanced-finance/services/` are more likely candidates and were not opened.
  - Insurance: no dedicated method found or searched for.
  - Whether `disposeAsset()`'s own GL posting (visible at a glance to construct a `gainLoss` via
    `Prisma.Decimal`, correctly) is unconditional or has the same conditional-skip pattern as
    `postDepreciation()` had was not verified — read only far enough to confirm `gainLoss` itself uses
    correct Decimal arithmetic, not far enough to confirm the GL journal it produces is unconditional.
This defect's own discovery pattern (an optional GL-account check silently degrading to "post the
domain event, skip the GL journal") is a plausible systemic pattern worth checking across the other 6
event types and, by extension, other GL-posting services outside `fixed-assets` entirely.

### D089 · 🔴 CRITICAL · No negative-stock policy existed anywhere in the inventory module — InventoryService.submitStockEntry() decremented on-hand quantity with no floor check at all

Found while claiming and building E14 (Inventory and warehousing), whose own exit criterion names
"negative-stock policy enforced" as one of its non-negotiables. A repo-wide search for
`negativeStock`/`allowNegativeStock`/`negative_stock` across `unierp-api/src/modules/inventory/*.ts`
(46 service files) returned **zero matches** — the concept this phase's exit criterion names does not
exist anywhere in the module, not even as a stubbed or disabled config flag.
`unierp-api/src/modules/inventory/inventory.service.ts`'s `submitStockEntry()` — the primary path by
which committed stock movements actually adjust on-hand inventory — decremented
`inventoryItem.quantity` via a bare Prisma `{ decrement: item.quantity }` with no prior read of the
current quantity and no check of any kind. A stock entry requesting more units than were on hand would
be submitted successfully, silently driving the warehouse's on-hand quantity negative.

**How it was caught:** writing a FAIL-first test for a stock entry requesting 50 units from a warehouse
with only 20 on hand — the pre-existing code resolved successfully (no rejection), decrementing straight
through to a negative balance.

**Fixed:** `submitStockEntry()` now reads the current on-hand quantity via `tx.inventoryItem.findFirst()`
inside the same transaction, immediately before the decrement, and throws `BadRequestException` (naming
the product, warehouse, available quantity, and requested quantity) if the requested quantity exceeds
what's available. Proven via break/restore (reverted to the unchecked decrement, confirmed the exact
original defect reproduces — the entry resolved successfully instead of rejecting — restored, confirmed
0 `BROKEN FOR PROOF` markers remain, 2/2 tests pass). Full regression: `src/modules/inventory/`, all 47
test files / 751 tests pass cleanly (no pre-existing collection failures in this module, unlike the
finance modules). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E14's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires: valuation (FIFO/weighted/standard) reconciling to the GL; lot
and serial traceability; multi-location; cycle count and adjustment with approval — none investigated in
this pass. Critically, within the negative-stock fix's own narrow scope:
  - Only the `fromWarehouseId` branch of `submitStockEntry()` was fixed. The sibling `fromBinId`
    (bin-location-level) decrement in the same method has the identical unchecked-decrement pattern and
    was NOT fixed — a stock entry could still drive a specific bin negative even while the warehouse
    total is correctly checked.
  - No policy CONFIGURABILITY was added (e.g., a per-product or per-warehouse
    `allowNegativeStock` override for legitimate backorder/drop-ship scenarios where negative stock is
    intentional) — this fix is a hard block, which may be too strict for some real business flows;
    whether the plan intends a configurable policy or a hard block was not determined from the phase
    brief's terse wording ("negative-stock policy enforced") and was not investigated further.
  - Every OTHER inventory-quantity-decrementing code path across the module's other 45 service files
    (`inventory-warehouses.service.ts`, `transfer-orders.service.ts`, `pick-waves.service.ts`,
    `stock-take.service.ts`, etc.) was not searched for the same unchecked-decrement pattern — this
    session's own repeated experience (D084/D085/D086/D088) suggests more instances are plausible.

### D090 · 🔴 CRITICAL · ProcurementService.getThreeWayMatchReport() was completely fabricated — no real invoice was ever queried; "invoiced" values were derived from PO status and a coin-flip on the PO id string

Found while claiming and building E15 (Procurement), whose own exit criterion names the exact feature
this defect breaks: "Requisition → RFQ → PO → receipt → three-way match → invoice." This is the most
severe defect filed this session — not a subtle arithmetic bug, but a fabricated report with zero
connection to real data, on the phase's own central named feature.

`unierp-api/src/modules/procurement/procurement.service.ts`'s `getThreeWayMatchReport()` never queried
any invoice record at all (`APInvoiceCapture`/`APInvoiceCaptureLine`, which the schema provides
specifically for this purpose via `matchingPurchaseOrderId`/`matchingPOLineId`). Instead:

```
const invoicedQty = po.status === "RECEIVED" ? Number(poItem.quantity) : receivedQty;
const invoicedUnitPrice = poId.endsWith("d") ? orderedUnitPrice * 1.1 : orderedUnitPrice;
```

`invoicedQty` was assumed equal to the ordered quantity whenever the PO's own status happened to be
`"RECEIVED"` — nothing to do with any invoice. `invoicedUnitPrice` was decided by whether the **string**
`poId` happened to end in the letter `"d"` — a coincidence of cuid generation with literally zero
relationship to any invoiced price. A purchase order could be reported `MATCHED` — the report a real
accounts-payable team would rely on to release payment — despite no invoice ever having been captured
or matched to it at all.

**How it was caught:** reading `getThreeWayMatchReport()` in full while investigating this phase's
central exit criterion. The `poId.endsWith("d")` line is self-evidently not a real business rule on
inspection; confirmed via a FAIL-first test that a fully-received PO with **zero** matched
`APInvoiceCapture` records still reported `hasInvoice` as `undefined`/matching behavior implying a
match was possible with no invoice ever checked.

**Fixed:** `getThreeWayMatchReport()` now queries real `APInvoiceCapture` records
(`matchingPurchaseOrderId: poId`, excluding `REJECTED`), joins their `APInvoiceCaptureLine`s to PO line
items via `matchingPOLineId`, and computes `invoicedQty` (summed) and `invoicedUnitPrice`
(quantity-weighted average, for the case of multiple invoice lines matching one PO line) from real
captured invoice data. Each line item now also reports `hasInvoice: boolean`; `qtyMatch`/`priceMatch`
can never be `true` without a real matched invoice — a PO with zero captured invoices can never be
reported `MATCHED`, closing the exact hole the fabricated heuristic left open. Proven via break/restore
(reverted to the original fabricated heuristic, confirmed both new tests fail against it — a real
matched invoice no longer registers, and the "no invoice at all" case no longer distinguishes itself —
restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 11/11 + 29/29 tests pass). Full regression:
`src/modules/procurement/`, all 22 test files / 212 tests pass cleanly (no collection failures in this
module). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E15's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires the full chain (requisition → RFQ → PO → receipt) with
approvals and partial receipts, none independently re-verified in this pass — only the three-way-match
report itself was audited. Within this fix's own scope:
  - The quantity-weighted-average approach for `invoicedUnitPrice` when multiple invoice lines match one
    PO line is a reasonable default but was not validated against any real AP reconciliation policy —
    whether a genuine price *variance* (not just a different average) should itself trigger a
    discrepancy flag was not determined.
  - `APInvoiceCapture.status` values other than `REJECTED` (e.g. `QUEUED`, `DRAFT`,
    `REVIEW_REQUIRED`) are currently all treated as valid matches; whether an unreviewed/unconfirmed
    capture should count toward a `MATCHED` three-way-match result is a real AP-controls question not
    resolved here — plausibly only `PROCESSED` should count, which would be a stricter, safer default
    worth a follow-up decision.
  - This defect's own discovery pattern — a report/feature that LOOKS complete (has a real endpoint,
    real DTOs, a plausible-looking function) but is entirely fabricated on close reading — is a strong
    signal to audit other "report"-shaped endpoints across the codebase for the same pattern, not just
    arithmetic bugs in otherwise-real logic (the D084/D085/D086/D088/D089 pattern). This is a materially
    different and more severe class of defect than this session's other findings.

### D091 · 🔴 CRITICAL · SalesService.updateSalesOrderStatus() let any caller with plain order-update permission bypass the credit-limit hold entirely

Found while claiming and building E16 (Sales and order management), whose own exit criterion names
"credit limits" as a non-negotiable of the quote-to-invoice chain. `createSalesOrder()` correctly
computes `initialStatus = "CREDIT_HOLD"` when a B2B order's outstanding balance plus the new order
total would exceed the customer's credit limit, and a dedicated `approveCreditHold()` method exists
that re-validates `so.status === "CREDIT_HOLD"` before releasing the hold. But
`updateSalesOrderStatus(tenantId, id, status)` — the handler behind `PATCH /orders/:id/status` —
accepted an arbitrary status string and wrote it directly with **zero transition validation**:

```
const updated = await prisma.salesOrder.update({ where: { id }, data: { status } });
```

Critically, `PATCH /orders/:id/status` and `PATCH /orders/:id/approve-credit` are both gated by the
identical `@Permissions("sales.order.update")` decorator — the "dedicated" credit-hold-approval
endpoint provides no additional authorization boundary at all. Any caller permitted to change a sales
order's status for any ordinary reason (shipping status, fulfillment progress, etc.) could set
`status: "CONFIRMED"` directly via the generic endpoint on a `CREDIT_HOLD` order, completely bypassing
`approveCreditHold()`'s own re-check and the credit-limit gate enforced at order creation.

**How it was caught:** writing a FAIL-first test calling `updateSalesOrderStatus()` directly with
`status: "CONFIRMED"` on an order whose `status` is `"CREDIT_HOLD"` — the pre-existing code resolved
successfully, confirming the order with no rejection.

**Fixed:** `updateSalesOrderStatus()` now refuses any status transition away from `"CREDIT_HOLD"`
through the generic path, throwing `BadRequestException` directing the caller to the dedicated
approval endpoint; only `approveCreditHold()` can release a held order. Proven via break/restore
(reverted to the unguarded update, confirmed the exact original bypass reproduces — the order resolved
to `CONFIRMED` instead of rejecting — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 14/14
tests pass). Full regression: `src/modules/sales/`, all 26 test files / 214 tests pass cleanly (no
collection failures in this module). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E16's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires backorders, allocation, returns and RMA across the full
quote→order→fulfilment→invoice chain. Not investigated in this pass:
  - No dedicated "allocation" mechanism (reserving inventory against a confirmed order) was found
    anywhere in the `sales` module by name — `getBackorders()` exists as a read-only report but there
    is no evidence any code path actually reserves stock against a specific order before fulfillment.
    Whether allocation genuinely doesn't exist, exists under a different name, or lives entirely in the
    `inventory` module (E14) was not determined.
  - Returns/RMA (`sales-returns-deep.service.ts` exists) was not audited for correctness.
  - Whether the SAME permission-collision pattern found here (`sales.order.update` guarding both a
    generic mutation and a dedicated approval-gated action) recurs elsewhere in the sales controller, or
    in other controllers across the codebase, was not searched for — this is a distinct and
    security-relevant sub-pattern of this session's broader "a real check exists but has a bypass"
    findings (D089's bin-level gap, D090's fabricated report) worth a dedicated permission-model audit.

### D092 · 🔴 CRITICAL · Manufacturing has no WIP-to-GL posting anywhere, and its one real inventory-mutation path was non-atomic — raw materials could vanish with no finished goods produced and no rollback

Found while claiming and building E18 (Manufacturing), whose own exit criterion is explicit: "BOM
versioning, routing, work orders, capacity, WIP valuation to the GL, scrap and yield, quality gates."

**Part 1 — total absence of GL posting.** A repo-wide search (`grep -rln "journal" src/modules/
manufacturing/*.ts`) across all 15 manufacturing service files returned zero matches. `manufacturing.
service.ts`'s `updateWorkOrderStatus()` correctly computes `actualCost` and `costVariance` on work
order completion (material cost roll-up plus a scrap penalty) and stores them on the `WorkOrder` row,
but this value is **never posted to the GL** — no journal entry, anywhere, for any manufacturing event.
The completion event (`manufacturing.workorder.completed`) is consumed by
`unierp-api/src/modules/inventory/inventory.event-handler.ts`'s `handleWorkOrderCompleted()`, which
moves inventory quantities (raw materials out, finished goods in) but also creates no journal entry.
Unlike D088 (fixed-assets depreciation), no GL account mapping fields exist anywhere in the
`WorkOrder`/`BOM` schema to hang a fix on — closing this gap properly requires a schema migration in
the separate `unierp-data` repository, out of reach for this pass without a larger, riskier cross-repo
change than this session's established scope.

**Part 2 — the one real inventory-mutation path was non-atomic (fixed in this pass).**
`handleWorkOrderCompleted()` performed the raw-material decrement and finished-goods increment as two
separate, unwrapped top-level `prisma.inventoryItem.upsert()` calls inside a single `try/catch` that
only logged failures. If the finished-goods increment failed after some raw-material decrements had
already committed (a plausible DB-level failure — constraint violation, connection drop mid-loop), the
warehouse was left with materials silently vanished and no finished goods to show for them — a
permanent, silent WIP integrity gap, with the failure logged but never surfaced or rolled back.

**How it was caught:** writing a FAIL-first test asserting the handler delegates atomicity to a single
`prisma.$transaction()` call wrapping both writes — the pre-existing code called `prisma.$transaction`
zero times, using two independent top-level calls instead.

**Fixed (Part 2 only):** both the raw-material consumption loop and the finished-goods increment now
run inside one `prisma.$transaction()`, so a failure at either step rolls back everything written so
far in that transaction. Reorder-threshold checks (best-effort, may create a new PO) intentionally run
after the transaction commits, outside the atomicity boundary — they are not part of WIP correctness.
Proven via break/restore (reverted to the two unwrapped calls, confirmed both new tests fail —
`prisma.$transaction` called zero times — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 2/2
tests pass). Full regression: `src/modules/inventory/` + `src/modules/manufacturing/`, all 53 test
files / 827 tests pass cleanly (no collection failures). Typecheck: same 4 pre-existing unrelated
errors, unchanged.

**Not fixed — Part 1 (WIP-to-GL posting) requires a schema migration outside this session's scope.**
Filed here rather than attempted shallowly. This is arguably the more severe half of this defect: E18's
own exit criterion names "WIP valuation to the GL" specifically, and it does not exist as a mechanism
at all, matching the D089-style "total absence" pattern rather than a partial implementation. A
follow-up needs: (1) GL account fields on `BOM` or a manufacturing-specific cost-center mapping,
analogous to `FixedAssetCategory`'s account fields; (2) a journal-posting call in either
`updateWorkOrderStatus()` (debiting Finished Goods / crediting WIP for `actualCost`) or a new listener
on `manufacturing.workorder.completed`, following the exact `postDepreciation()`-style pattern proven
in D088; (3) the same style of break/restore proof. Also not investigated in this pass: BOM versioning,
routing, capacity, and quality gates — none of E18's other four named non-negotiables were audited.

### D093 · 🔴 CRITICAL · MRP component requirements were labeled SAFETY_STOCK and pointed at the BOM, not the sales order that actually created the demand — breaking the exit criterion's own named requirement

Found while claiming and building E17 (Supply-chain planning), whose own exit criterion names the
property this defect breaks directly: "MRP suggestions traceable to their inputs." `unierp-api/src/
modules/manufacturing/manufacturing.service.ts`'s `runMRP()` explodes a finished item's BOM to compute
component-level requirements. The finished-item-level `MRPPlannedItem` correctly records
`demandSource: "SALES_ORDER"` / `demandSourceId: order.id`. But the component-level requirement, derived
from that exact same order via BOM explosion inside the same loop, was recorded as
`demandSource: "SAFETY_STOCK"` / `demandSourceId: bom.id` — both facts are wrong. This code path runs
**exclusively** inside `for (const order of orders)`; there is no execution path where a component
requirement created here is independent safety-stock replenishment rather than demand dependent on a
specific confirmed sales order. A planner investigating "why is this component being suggested?" — the
exact question this phase's own named non-negotiable exists to answer — would find a BOM id under a
label implying an unrelated stock-policy trigger, with no path back to the real originating order.

**How it was caught:** writing a FAIL-first test simulating a two-level BOM explosion (a finished item
requiring a component, both out of stock) driven by one sales order, and asserting the component-level
`MRPPlannedItem.create()` call recorded `demandSource: "SALES_ORDER"` / `demandSourceId` equal to the
real order id — the pre-existing code recorded `"SAFETY_STOCK"` / the BOM id instead.

**Fixed:** the component-level `MRPPlannedItem` now records `demandSource: "SALES_ORDER"` and
`demandSourceId: order.id`, matching the finished-item-level record's own (correct) pattern and
preserving the true traceability chain back to the originating demand. Proven via break/restore
(reverted to the mislabeled version, confirmed the exact original mislabeling reproduces — recorded
`"SAFETY_STOCK"` and the BOM id — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 9/9 tests
pass). Full regression: `src/modules/manufacturing/`, all 5 test files / 75 tests pass cleanly. Typecheck:
same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E17's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires demand and supply planning, reorder policy, and lead times —
none independently audited. Within `runMRP()`'s own scope:
  - Multi-level BOM explosion (a component that itself has a sub-BOM, itself needing further
    explosion) exists in the code (`subBom` lookup) but its own recursive requirements were not traced
    for the same class of traceability bug — a third-level requirement's `demandSourceId` may still not
    resolve cleanly back to the true root order without following the `bomId` chain manually, since the
    schema itself only records one level of `demandSourceId` per row rather than a full lineage.
  - `runMRP()`'s outer `catch {}` swallows any error with **zero** logging (not even the error message)
    — noted on inspection but not fixed in this pass; a failed MRP run is silently marked `"FAILED"`
    with no diagnostic trail, itself in tension with this phase's own "traceable" theme even though it
    is a different mechanism (run-level failure diagnostics, not suggestion-level input traceability).
  - Reorder policy and lead-time modeling were not located or investigated in this pass.

### D094 · 🔴 CRITICAL · Two parallel, unreconciled POS register/shift implementations exist under the same base route — the primary, more discoverable one never computed cash-drawer variance

Found while claiming and building E19 (Point of sale and retail), whose own exit criterion names "cash
drawer" explicitly among its non-negotiables. The `pos` module contains **two entirely separate**
register/shift implementations, both mounted under `@Controller("pos")`:

- `pos.service.ts` / `pos.controller.ts`, using the `POSRegister`/`POSShift` Prisma models, exposed at
  `PUT /pos/registers/:id/close` — the plain, more discoverable route.
- `pos-expansion.service.ts` / `pos-expansion.controller.ts`, using **separate** `PosRegister`/
  `PosShift` models, exposed at `PUT /pos/exp/registers/:id/close`.

The `pos-expansion.service.ts` implementation correctly computes `cashVariance` /
`closingDifference = actualCash - endingCash` on close. The `pos.service.ts` implementation — the
plainer, non-`exp`-prefixed route a caller would reach for first — stored the caller-supplied
`endingCash`/`actualCash` fields verbatim and **never computed any discrepancy at all**, leaving the
`POSRegister.closingDifference` column (which exists in the schema specifically for this) permanently
`null` for every register closed through this endpoint. A cashier's drawer could be short or over by
any amount and the system would never surface it — "cash drawer" reconciliation, silently absent on
one of two live, parallel code paths implementing the identical business concept.

**How it was caught:** writing a FAIL-first test asserting `closeRegister()` returns a computed
`closingDifference` for `endingCash: 300, actualCash: 285` — the pre-existing code returned `undefined`
(`NaN` when coerced to `Number`).

**Fixed:** `pos.service.ts`'s `closeRegister()` now computes `closingDifference` as
`Prisma.Decimal(actualCash).sub(Prisma.Decimal(endingCash))` and persists it, matching the pattern
already correct in the parallel `pos-expansion.service.ts` implementation. Proven via break/restore
(reverted to storing the raw inputs with no computation, confirmed the exact original gap reproduces —
`closingDifference` resolved to `undefined`/`NaN` — restored, confirmed 0 `BROKEN FOR PROOF` markers
remain, 3/3 tests pass). Full regression: `src/modules/pos/`, both test files / 76 tests pass cleanly.
Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E19's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires offline-capable POS with reconciled sync, shift management,
refunds, and store/online inventory as one truth — none independently audited. Within the two-parallel-
implementation finding's own scope:
  - The existence of two independently-maintained, model-distinct implementations of the same core POS
    concept (register/shift open-close, cash entries, payment methods — `pos-expansion.service.ts`
    duplicates most of `pos.service.ts`'s surface) is itself an architectural finding worth a dedicated
    follow-up: which one is the intended system of record, whether client apps are calling both
    inconsistently, and whether `POSRegister`/`PosRegister` (and the equivalent Shift pair) should be
    consolidated into one model. This defect only fixed the immediate reconciliation gap on one side of
    the split, not the split itself.
  - `pos.service.ts`'s `endShift()` (the shift-level equivalent of `closeRegister()`) was not checked
    for the same missing-variance pattern — the schema shows `POSShift` doesn't have an equivalent
    field visible in this pass's inspection, but this was not conclusively verified.
  - Refunds (`processReturn()` exists in `pos.service.ts`), offline sync, and store/online inventory
    unification were not investigated at all.

### D095 · 🔴 CRITICAL · AdvancedHrService.runPayroll() had no guard against re-running an already-PAID period — double-pays every employee if called twice

Found while claiming and building E21 (Payroll and compensation), whose own exit criterion opens with
"Statutory-correct payroll per jurisdiction." `unierp-api/src/modules/advanced-hr/advanced-hr.service.ts`'s
`runPayroll(tenantId, { periodStart, periodEnd })` created a new `PayrollRun` and its `PayrollSlip`s,
computed `totalGross`/`totalDeductions`/`totalNet`, and set `status: "PAID"` — with **no check anywhere**
for whether a payroll run had already been created and paid for the exact same period. Calling
`runPayroll()` a second time with identical `periodStart`/`periodEnd` (a plausible operator mistake — a
double-click, a retried request after a timeout, a scheduler firing twice) silently creates a second,
fully independent `PayrollRun` with its own complete set of `PayrollSlip`s — every employee is paid
twice, with no relationship between the two runs and nothing to catch or prevent it.

**How it was caught:** writing a FAIL-first test that seeds an existing `PayrollRun` with
`status: "PAID"` for `2026-01-01`–`2026-01-31`, then calls `runPayroll()` again for the identical period
— the pre-existing code proceeded to create a second run successfully instead of rejecting.

**Fixed:** `runPayroll()` now queries for an existing `PayrollRun` with the same `tenantId`/
`periodStart`/`periodEnd` and `status: "PAID"` before doing any work, and throws `BadRequestException`
naming the period if one is found. Also converted the function's gross/deduction/net arithmetic from
plain `number` to `Prisma.Decimal` throughout, matching `CODE_STANDARDS`' money-arithmetic rule already
enforced elsewhere this session (D084/D085/D086) — defensive hardening, **though this function's
specific multiply/subtract/sum pattern was explicitly verified NOT to produce a business-observable
reconciliation failure at realistic payroll sizes** (accumulation drift stays below `1e-10` even at 1000
employees for this arithmetic shape, unlike the equality/threshold-check bugs in D084/D085/D086, which
did have concrete, larger, observable consequences). This is noted honestly rather than overclaimed —
several attempts to construct a genuine FAIL-first proof of a reconciliation failure in `runPayroll()`'s
own summation were made and each one, on close inspection, turned out to be an artifact of the test's
own JavaScript arithmetic reintroducing float noise rather than a real production defect.

Proven via break/restore (reverted the duplicate-run check, confirmed the exact original defect
reproduces — a second run created successfully for an already-paid period — restored, confirmed 0
`BROKEN FOR PROOF` markers remain, 2/2 tests pass). Full regression: `src/modules/advanced-hr/` +
`src/modules/hr-advanced/`, 132/132 real tests pass (1 pre-existing unrelated `@unerp/shared` collection
failure, unchanged; `hr-advanced` module has **zero** test files at all — noted, not created in this
pass). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E21's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires retro-pay, arrears, payslips, GL posting, a 100%-covered
calculation engine, and — explicitly — consolidating the two overlapping advanced-HR modules
(`advanced-hr` and `hr-advanced`) into one. None of these were attempted:
  - **GL posting is completely absent**, matching the same total-absence pattern as D089/D092: a
    repo-wide search found zero references to "journal" in either `advanced-hr.service.ts` or
    `hr-advanced.service.ts`. `PayrollRun`/`PayrollSlip` have no GL account or `journalId` fields in the
    schema, so — as with D092's manufacturing finding — closing this gap requires a schema migration in
    the separate `unierp-data` repository, out of reach for this pass.
  - Retro-pay and arrears: not located or investigated.
  - The two-module consolidation this phase's own exit criterion explicitly names is a large structural
    task not attempted; this defect's own discovery that `hr-advanced` has zero tests while
    `advanced-hr` has extensive (if partly coverage-padded) test coverage is itself evidence for which
    module is the more likely system of record, worth citing when that consolidation work begins.
  - "100%-covered calculation engine": `payroll-tax.service.ts` exists separately and was not audited.

### D096 · 🔴 CRITICAL · generateProjectInvoice() re-billed every already-invoiced completed milestone on every call — no idempotency guard, and milestone/hour prices were entirely fabricated flat rates

Found while claiming and building E24 (Projects and professional services), whose own exit criterion
names "milestone and progress billing" explicitly. `unierp-api/src/modules/projects/projects.service.ts`'s
`generateProjectInvoice()` billed every `Milestone` with `isCompleted: true` on **every call**, with no
check for whether that milestone had already appeared on a prior invoice. `Milestone` has no `isBilled`
flag in the schema — nothing about this function is idempotent. Calling it twice for the same project
(a plausible operator retry, a duplicate button click, a re-triggered automation) re-bills every already-
invoiced completed milestone a second time.

**A second, related fabrication was also found but NOT fixed in this pass** (see "not fixed" below):
every completed milestone is billed at a hardcoded flat `unitPrice: 1000.00` regardless of its real
contracted value, and every billable hour at a hardcoded flat `unitPrice: 100.00` regardless of the
task's or employee's real bill rate — numbers with no connection to the project's actual budget or
contract terms, similar in kind to D090's fabricated three-way-match report, though `Milestone` has no
schema field to store a real contracted value to fix this properly without a migration.

**How it was caught:** writing a FAIL-first test that seeds a completed milestone already referenced in
a prior non-void invoice's line items, then calls `generateProjectInvoice()` again — the pre-existing
code billed it a second time (created a new invoice with a duplicate milestone line item) instead of
recognizing it as already billed.

**Fixed (the double-billing gap):** `generateProjectInvoice()` now queries existing non-void invoices
for the project, extracts the set of milestone names already billed by matching the exact line-item
description prefix this function itself writes (`"Project Milestone Completed: "`), and excludes those
milestones from the current billing run. Proven via break/restore (reverted to unconditional re-billing,
confirmed the exact original defect reproduces — the already-billed milestone was billed a second time
with no rejection — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 9/9 tests pass). Full
regression: `src/modules/projects/`, all 8 test files / 72 tests pass cleanly. Typecheck: same 4
pre-existing unrelated errors, unchanged.

**Not fixed — the fabricated flat-rate pricing, and the same double-billing gap for billable hours.**
Filed here rather than attempted shallowly:
  - Milestone billing at a hardcoded $1000 and hourly billing at a hardcoded $100/hr, both unrelated to
    any real contract value or employee bill rate, is a genuine fabrication requiring new schema fields
    (a milestone contract value, a per-employee or per-task bill rate) — out of reach without a
    migration in the separate `unierp-data` repository, matching this session's now-familiar
    schema-migration-blocked pattern (D092, D095).
  - The billable-hours line item (`Project Timesheet Logged Hours...`) has the SAME idempotency gap as
    milestones did, and was NOT fixed in this pass: `Timesheet` has no `billed` flag, and the
    description-prefix-matching technique used for milestones can't cleanly dedupe individual timesheet
    entries the way it can dedupe named milestones (the hours line item aggregates ALL of a project's
    logged hours into one line with no per-entry identifier). A real fix needs either a `billed` boolean
    on `Timesheet` or billing by explicit period/date-range rather than "all hours ever logged."
  - GL posting ("revenue recognition to the GL") is completely absent — zero references to "journal"
    anywhere in the `projects` module, the same total-absence pattern as D089/D092/D095, also requiring
    a schema migration to fix properly.
  - WBS, budget vs actual, and resourcing (the exit criterion's other three named requirements) were not
    investigated in this pass.

### D097 · 🔴 CRITICAL · closeTicket() never evaluated SLA compliance — the only automatic breach-detection path a ticket ever passes through was missing it

Found while claiming and building E25 (Service management and field service), whose own exit criterion
names "SLA-driven tickets" first among its non-negotiables. `unierp-api/src/modules/field-service/
field-service-tickets.service.ts` has a real, correctly-implemented `evaluateTicketSla(tenantId,
ticketId)` method that compares `now > ticket.slaDeadline` and sets `slaBreached: true` when it is —
the mechanism itself is sound. But nothing calls it automatically: it is reachable only via a dedicated
`GET /field-service/tickets/:id/evaluate-sla`-style endpoint that a caller must remember to hit
per-ticket, and there is no cron/scheduled job anywhere in the module that sweeps tickets for breaches.
Critically, `closeTicket()` — the one code path every ticket unavoidably passes through — never called
it and never wrote `slaBreached` at all. A ticket resolved three days after its SLA deadline closed
with `slaBreached` permanently `false`, exactly as if it had been resolved on time, unless some external
caller separately, deliberately evaluated that specific ticket before or after closing it. Every
SLA-compliance report and stats aggregate in this module (`getTicketStats()`'s `slaBreached` count,
`checkSlaCompliance()`'s `complianceRate`) reads this same field, so this silently inflates SLA
compliance reporting for any ticket resolved through the normal close flow without a separate manual
evaluation.

**How it was caught:** writing a FAIL-first test that closes a ticket whose `slaDeadline` is one hour in
the past — the pre-existing code's `update()` call never included `slaBreached` in its data at all.

**Fixed:** `closeTicket()` now computes `slaBreached` (comparing the actual completion time against
`slaDeadline`, or preserving a prior `true` value) and includes it in the same update that sets
`status: "CLOSED"` — SLA compliance is now evaluated at the one guaranteed trigger point every ticket
passes through, with no dependency on a separate manual call. Proven via break/restore (reverted to
omitting `slaBreached` from the close update entirely, confirmed both new tests fail — the field never
appears in the `update()` call regardless of deadline — restored, confirmed 0 `BROKEN FOR PROOF` markers
remain, 11/11 tests pass). Full regression: `src/modules/field-service/` + `src/modules/service-
management/`, all 7 test files / 60 tests pass cleanly. Typecheck: same 4 pre-existing unrelated errors,
unchanged.

**Not fully investigated — E25's full scope, deliberately not attempted at scale in this pass.** This
phase's own exit criterion also requires scheduling and dispatch, mobile-first execution (Track I),
parts consumption, warranties, and expenses — none independently audited. Specifically:
  - `assignTicket()`/dispatch and `field-service-scheduling.service.ts` were not re-audited for
    correctness beyond confirming they exist.
  - **Parts consumption is not wired to inventory at all**: a repo-wide search for `consumePart`,
    `partUsage`, or `usedQuantity` in the `field-service` module found nothing — `field-service-parts.
    service.ts` manages `VanStock` (technician-carried inventory) CRUD and reorder alerts, but there is
    no code path that decrements van stock (or the main warehouse) when a part is actually consumed on
    a ticket. This is the same total-absence pattern as D089 (negative-stock policy) and worth a
    dedicated follow-up: parts consumption is a named non-negotiable and appears to not exist as a
    mechanism at all.
  - Warranties and expenses were not located or investigated in this pass.
  - Whether a periodic/scheduled sweep for SLA breaches on STILL-OPEN tickets (not just at close) is
    needed for real-time dashboards and alerting — this fix only guarantees correctness at close time,
    not proactive breach notification while a ticket is still in progress — was not addressed.

### D098 · 🔴 CRITICAL · WorkflowService.checkSlaBreaches() logged escalations without ever performing them — audit trail claimed ownership had moved when it hadn't

Found while claiming and building E28 (Workflow, AI and platform services), a deliberately-scoped
container phase covering 21 modules (`workflow`, `ai`, `analytics`, `notifications`, `outbox`,
`saved-views`, `admin`, `pwa`, `devops`, `blockchain`, `api-platform`, `ext-gateway`,
`extension-registry`, `marketplace`, `saas`, `saas-portal`, `subscriptions`, `communication`,
`localization`, `reporting`, `search`), whose own exit criterion explicitly instructs subdivision into
per-module work as it is picked up rather than a single pass across all 21.

Picked `workflow` as the first module and ran the existing `scripts/score-module.mjs workflow` rubric
tool (built in an earlier phase, E01). Row 4 ("Approvals") scored a real chain shape and delegation/
escalation keywords, but reading `WorkflowService.checkSlaBreaches()` (`unierp-api/src/modules/workflow/
workflow.service.ts`) in full found the escalation itself was fake: for every matching
`WorkflowEscalationRule` on a breached task, the method called `logAudit(..., "ESCALATED", ...,
{ escalationId, escalateTo: esc.escalateToRole })` and **stopped** — it never wrote
`assigneeRole`/`assigneeId` on the `WorkflowTask` itself. The audit trail asserts an escalation occurred;
the task's actual owner never changes. Anyone reading the audit log (or building an SLA dashboard from
it) would believe ownership moved to the escalation target; the original assignee, unaware anything
happened, still holds a task they may have already missed the deadline on.

**How it was caught:** writing a FAIL-first test for a breached task with a matching escalation rule and
asserting `workflowTask.update()` was called with the escalation target's role/user — the pre-existing
code never called `workflowTask.update()` at all for the escalation.

**Fixed:** `checkSlaBreaches()` now updates the task's `assigneeRole`/`assigneeId` to the escalation
rule's `escalateToRole`/`escalateToUser` before logging the audit entry — the escalation actually moves
ownership, and the audit trail records something that genuinely happened. Proven via break/restore
(reverted to logging without reassigning, confirmed the exact original defect reproduces —
`workflowTask.update` called zero times — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 6/6
tests pass). Full regression: `src/modules/workflow/`, the 3 test files exercising the mocked service
layer all pass (39 tests total across those); a separate, unrelated `workflow-advanced.service.spec.ts`
suite fails on both the pre-fix and post-fix code because it requires a live database connection this
environment doesn't have — confirmed pre-existing and unrelated via `git stash`. Typecheck: same 4
pre-existing unrelated errors, unchanged.

**Not fully investigated — E28's own exit criterion explicitly calls for exactly this scoping.** Only
`workflow` was scored and only its `checkSlaBreaches()` escalation gap was fixed. The other 20 modules
this phase names (`ai` through `search`) were not scored against the rubric at all in this pass — E28
itself instructs splitting into `E28a…` per module as work is picked up, which this pass treats as
license to complete ONE module's real, provable improvement rather than a shallow pass across 21. The
`workflow` module's own rubric score (captured in this phase's evidence file) shows several other rows
below the "next level" threshold — Documents (0, no print path), Integrations (0, no CSV), UI states (0,
no six-state components referenced by any of 10 pages), Accessibility (0), Performance (0, unmeasured) —
none of which were addressed in this pass; each is a legitimate target for a future `E28a`-style
sub-phase.

### D099 · 🔴 CRITICAL · Signature completion produced no tamper-evident record at all, and the entire e-signature service is not wired to any controller

Found while claiming and building E31 (E-signature and document workflow), whose own exit criterion is
explicit: "A signed document's integrity is verifiable after the fact, and the trail is admissible."
`unierp-api/src/modules/documents/services/signature-workflow.service.ts`'s `signDocument()` set
`Document.signatureStatus = "COMPLETED"` when the last signature arrived and did nothing else — no hash,
checksum, or certificate of any kind was computed or stored over the completed signature set. A status
flag proves a document was marked complete; it proves nothing about whether the recorded signatures were
later altered. There was no mechanism anywhere in the module capable of detecting tampering after the
fact — the phase's own named deliverable ("tamper-evident completion certificate") did not exist.

**A second, structural finding**: the entire `SignatureWorkflowService` (`createSignatureRequest`,
`signDocument`, `getDocumentSignatures`) is registered in `documents.module.ts` but is not referenced by
any controller anywhere in the repo (`grep -rln "SignatureWorkflowService" src/modules/documents/*.ts`
returns only the module file). The whole e-signature feature, not just the certificate, is unreachable
over HTTP — filed as part of this defect rather than a separate one, since fixing the certificate
mechanism without exposing it changes nothing observable.

**How it was caught:** writing a FAIL-first test that completes a document's signatures and calls a new
`verifyDocumentIntegrity()` method — against the pre-existing code, no completion-certificate record
existed at all, so verification could never succeed regardless of whether tampering had occurred.

**Fixed (the certificate mechanism):** added `computeCompletionHash()` — a deterministic SHA-256 digest
over every signature's `id`/`signerEmail`/`status`/`signedAt`/`ipAddress`/`signatureData`, sorted by id
so row ordering can't affect it — computed once at completion and persisted as a `DocumentAuditLog` entry
(`action: "SIGNATURE_COMPLETION_CERTIFICATE"`, `details: { algorithm, hash, signatureIds }`). No schema
migration was needed: `DocumentAuditLog.details` is already a JSON column, an existing, real audit-trail
model. New `verifyDocumentIntegrity(tenantId, documentId)` recomputes the hash from the current signature
state and compares it to the certified hash, returning `{ verified, certifiedHash, currentHash,
certifiedAt }` — `verified: false` if any signature row has been altered since completion, and throws if
no certificate exists (document never completed). Proven via break/restore (reverted to the bare status
flag, confirmed both integrity tests fail — the certificate lookup throws unconditionally, exactly the
original defect — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 3/3 tests pass). Full
regression: `src/modules/documents/`, the new spec file's 3 tests pass cleanly; 2 pre-existing,
already-failing spec files (schema-validation and real-DB-dependent) confirmed pre-existing and
unrelated via `git stash` (same failure count with or without this change). Typecheck: same 4
pre-existing unrelated errors, unchanged.

**Not fixed — the controller-wiring gap.** The service (including the new `verifyDocumentIntegrity`
method) remains unreachable via any HTTP endpoint. Wiring it up requires deciding on route paths,
permission decorators, and DTOs consistent with the rest of `documents.controller.ts` — a real but
separate task from the certificate mechanism itself, not attempted in this pass to avoid guessing
conventions without a clear existing pattern to follow in this specific orphaned service.

**Not fully investigated — E31's full scope.** "Signature request, routing, reminders" (the phase's
other named deliverables) were not audited: `createSignatureRequest()`'s sequential-routing notification
logic and reminder mechanism (if any exists) were read but not verified for correctness beyond
confirming they exist.

### D100 · 🔴 CRITICAL · No component in the codebase generated gapless, concurrency-safe statutory document numbers — the schema anticipated the correct mechanism (`DocumentSequence`) but nothing ever used it

Found while claiming and building E44 (Gapless statutory document numbering), whose own exit criterion
is unusually explicit and mechanical: "10,000 concurrent invoice creations across 20 workers produce
numbers 1…10,000 with no gaps and no duplicates. A failed transaction consumes no number." A repo-wide
search confirmed every number generator this session has encountered — project invoice numbers
(`INV-PRJ-####`, `projects.service.ts`), MRP work-order/PO numbers, sales order numbers, and others —
uses a `prisma.<model>.count({...})` read followed by `count + 1` string formatting, entirely outside
any transaction tying the read to the eventual insert. This has two independent failure modes: (1) two
concurrent callers can read the identical count and mint the same number (a duplicate — not a
hypothetical, the standard "lost update" race on an unsynchronized counter); (2) nothing about a
`count()`-based read is undone by a later rollback, so a transaction that reads a count, then fails for
an unrelated reason before inserting, leaves no trace — which sounds safe until a *different* mechanism
(an explicit reserved-number column, which this codebase does not use for any of these generators)
would be needed to prove no gap occurred at all; the honest status is that gaplessness was never actually
engineered, only assumed. Separately, the schema already contains a `DocumentSequence` model
(`tenantId`/`series`/`organizationId`, `nextNumber`, `resetFrequency`/`resetPeriod`, `version`) clearly
designed for exactly this purpose — and a repo-wide search (`grep -rln "documentSequence" src/modules`)
found **zero** consumers of it anywhere.

**How it was caught:** reading this phase's own exit criterion literally and searching for any existing
gapless-numbering mechanism; finding the schema had anticipated the need but no code used it, and finding
every actual number generator in the codebase used the vulnerable `count() + 1` pattern instead.

**Fixed:** new `DocumentNumberingService` (`src/common/services/document-numbering.service.ts`,
registered in the `@Global()` `CommonModule`) with `getNextNumber(tx, tenantId, series, options)`. The
correctness argument: an `UPDATE document_sequences SET next_number = next_number + 1 WHERE id = ?` takes
a Postgres row lock for the duration of the enclosing transaction; a second concurrent transaction
incrementing the *same* sequence row blocks until the first commits or rolls back, so it can never read a
stale value (no duplicates possible). Because the caller is required to pass its own transaction handle
(not the bare `prisma` client) and the increment happens inside that same transaction as the caller's
document insert, a rollback of the caller's transaction rolls back the increment too (no gap possible).
First-time sequence creation races are handled via `P2002` retry (refetch the winning row rather than
erroring); fiscal-period resets happen atomically in the same update, not as a separate read-then-reset
that could itself race. Wired into `projects.service.ts`'s `generateProjectInvoice()` as a first real
consumer, replacing its own `count() + 1` invoice numbering and wrapping the reservation and the insert
in one `prisma.$transaction`. Proven via break/restore (reverted the atomic `{ increment: 1 }` to a
computed `sequence.nextNumber + 1` — the exact shape of the vulnerable pattern — confirmed the test
asserting atomic-increment usage fails, restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 4/4
service tests + 76/76 `projects` module tests pass). Full regression: `src/common/`, 4 pre-existing
failing test files (unrelated `two-person-control` guard tests) confirmed via `git stash` to fail
identically with or without this change. Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — the phase's own literal hard exit criterion could not be run in this
environment.** This is the most important honest gap in this defect and is stated plainly, not
minimized: "10,000 concurrent invoice creations across 20 workers" requires a live PostgreSQL instance
(row-level locking is a real-database property no mock can simulate), and this environment has no
`DATABASE_URL` configured — confirmed via `node -e "console.log(process.env.DATABASE_URL)"` returning
unset. What was proven instead is the service's logical contract (atomic-increment usage, never a
separate read-then-write; correct P2002 race recovery; correct atomic period-reset) via unit tests against
a mocked `DocumentSequence` model — necessary but not sufficient evidence for the phase's own literal,
number-labeled exit bar. A follow-up with a real Postgres instance (a disposable local/CI database,
following this session's own L15 precedent of using disposable throwaway infrastructure for a proof this
class of test needs) is required to close this phase's exit criterion completely. Also not attempted:
migrating every OTHER `count() + 1` generator in the codebase (sales orders, purchase orders, MRP items,
and others found across earlier phases this session) to use `DocumentNumberingService` — only
`generateProjectInvoice()` was migrated as proof-of-technique.

### D101 · 🔴 CRITICAL · The GDPR erasure endpoint never worked at all (missing config file), and once fixed, erasure never touched uploaded attachments

Found while claiming and building E32 (Attachment and media lifecycle), whose own exit criterion is
explicit: "A GDPR erasure removes attachments too. Proven, not assumed." Two independent, compounding
defects in `unierp-api/src/modules/saas-portal/services/gdpr-compliance.service.ts`:

**Part 1 — the erasure feature was completely non-functional.** `loadPiiRegistry()` reads
`scripts/pii-registry.json` via `fs.readFileSync` — a hard dependency of `executeErasure()`, called on
every single erasure request. That file **did not exist anywhere in this repository** (confirmed via
`find`/`git log --all` — no history of it ever existing). Every call to `executeErasure()` would throw
`ENOENT` before doing anything at all. This is more severe than the phase's own named concern
(attachments specifically) — the entire GDPR right-to-erasure feature was inert.

**Part 2 — attachments were never in scope even once the feature worked.** `eraseRecords()` deletes rows
from the model named in the (now-created) registry — for `User`, this deletes the `User` row matched by
email. It never touched `StoredFile` or `Document` rows, both of which have a `createdBy` field pointing
at the user who uploaded them. A subject's identity record could be deleted while their uploaded photos,
ID scans, and signed contracts — exactly the kind of personal data an erasure request exists to reach —
remained untouched and fully retrievable.

**How it was caught:** confirming Part 1 directly (`find . -iname pii-registry.json` returns nothing);
then writing a FAIL-first test for Part 2 that erases a user and asserts their `StoredFile`/`Document`
rows are gone while another user's are untouched — against the pre-existing code (with a manually-created
registry entry, to isolate Part 2 from Part 1), the erased user's own file survived.

**Fixed (both parts):**
- Created `scripts/pii-registry.json` with a real entry for every one of the 11 models in
  `prismaModelMap`, each with a stated `treatment` (`erase` vs `anonymize`) and `rationale` — `anonymize`
  for `User`/`Organization`/`Customer`/`Vendor` (referenced by records with statutory retention
  requirements), `erase` for the rest.
- `eraseRecords()` now captures matching user ids before deleting `User` rows, and cascades the erasure
  to `StoredFile`/`Document` rows where `createdBy` is one of those ids, in the same call.

Proven via break/restore (reverted the attachment-cascade logic, confirmed the erased user's own
`StoredFile` row survives — exactly the original gap — restored, confirmed 0 `BROKEN FOR PROOF` markers
remain, 1/1 test passes; separately confirmed via direct `node -e` that the new registry file now parses
successfully and covers all 11 `prismaModelMap` entries). Full regression: `src/modules/saas-portal/`,
all 14 test files / 53 tests pass cleanly. Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E32's full scope.** This phase's own deliverable also names "retention,
redaction, access audit, and deletion consistent with D11–D12" — none independently audited. Specifically:
  - Only `User`-type erasure cascades to attachments. `Employee`, `Customer`, `Vendor`, `Contact`, and
    the other 7 erasable entity types were NOT extended the same way — if any of those models also has
    associated uploaded files (plausible for `Employee` HR documents or `Customer` KYC uploads), those
    remain unreached by this fix. Only the `User` case was fixed as proof-of-technique, matching the test
    actually written.
  - `anonymizeRecords()` (the treatment used for `User`/`Organization`/`Customer`/`Vendor`) was not
    extended at all — an anonymized (not erased) record's attachments are entirely untouched by this fix,
    since `eraseRecords()` and `anonymizeRecords()` are separate code paths and only the former was
    changed.
  - Retention policies, redaction, and access-audit logging (the phase's other three named deliverables)
    were not investigated in this pass.

### D102 · 🔴 CRITICAL · IdempotencyInterceptor was opt-in everywhere, silently unprotecting every mutating route that doesn't send the header — the exact opposite of this phase's own deliverable

Found while claiming and building E43 (Concurrency, optimistic locking and write idempotency), whose own
deliverable is explicit: idempotency keys "required on every non-idempotent write... this makes them
mandatory and universal, not available." `unierp-api/src/common/idempotency/idempotency.interceptor.ts`'s
own docstring states plainly: "Opt-in per request... Requests without the header are untouched." A
mutating request (POST/PUT/PATCH/DELETE) with no `Idempotency-Key` header — which is every existing
caller in the codebase, since nothing currently sends this header anywhere — passes straight through with
zero duplicate-write protection. A double-submitted `POST /pos/orders` (a customer's card charged twice
by a network retry, or a cashier double-tapping "complete sale") creates two independent orders, exactly
the failure mode this phase's own exit criterion names as the thing that must never happen.

**How it was caught:** reading the interceptor's own code and docstring, which states its opt-in nature
directly; confirmed no route in the codebase currently applies any mechanism requiring the header.

**Fixed:** rather than flipping the interceptor's global default (a sweeping, unverifiable breaking
change across every mutating route in a ~2,000-file API, with no way to confirm every existing caller
across 3 frontend clients — web, mobile, POS terminal — was updated to send the header in the same pass),
built a real, targeted enforcement mechanism: new `@RequireIdempotencyKey()` decorator (Reflector-based
metadata) that `IdempotencyInterceptor` now checks via `reflector.getAllAndOverride()`. A mutating request
with no header to a route carrying this decorator is now rejected with `400 IDEMPOTENCY_KEY_REQUIRED`
instead of silently passing through; undecorated routes keep their existing opt-in behavior unchanged.
Applied to `POST /pos/orders` (`createOrder`) as proof of technique — a textbook double-submit-creates-
duplicate-charge endpoint. `IdempotencyInterceptor` now takes an optional `Reflector`; `app.module.ts`'s
factory wiring updated to inject it (`inject: [Reflector]`). Proven via break/restore (reverted the
enforcement check, confirmed the exact original defect reproduces — a mutating request to a decorated
route with no header no longer throws, passing straight through — restored, confirmed 0
`BROKEN FOR PROOF` markers remain, 12/12 interceptor tests pass, including a direct test asserting the
underlying create-handler runs exactly once across two "submissions" of the same key+payload). Full
regression: `src/common/idempotency/` + `src/modules/pos/`, 88/88 tests pass cleanly. Typecheck: same 4
pre-existing unrelated errors, unchanged — confirming the new DI wiring across the whole `AppModule`
graph typechecks cleanly.

**Not fully investigated — E43's own deliverable is much larger than this pass.** Two other named
requirements were not attempted:
  - **Version columns on every mutable entity**: this phase's own exit criterion states 36 entities carry
    a version column today, across only 3 of 18 schema files — the vast majority of mutable entities have
    no optimistic-lock column at all, and no work was done on this in this pass.
  - **Optimistic-lock conflict detection with a real resolution UI**: "two concurrent edits to one record
    produce a surfaced conflict, never a silent last-write-wins" — not investigated; no mechanism for
    detecting or surfacing such a conflict was located or built in this pass.
  - **The idempotency-key requirement itself is applied to exactly one endpoint** (`POST /pos/orders`) as
    proof of technique. Every other mutating write in the codebase — sales orders, purchase orders,
    payments, invoices, and the hundreds of other POST/PUT/PATCH/DELETE handlers — remains unprotected by
    default. A systematic audit identifying which endpoints are genuinely double-submit-sensitive
    (financial writes, order creation) versus naturally idempotent or low-risk, followed by applying the
    decorator across that identified set, is the real remaining scope this phase's own deliverable
    implies.

### D103 · 🔴 CRITICAL · unierp-web has zero i18n framework usage across 890+ pages, no RTL support anywhere, and the one real backend translation service is unreachable via any HTTP endpoint

Found while claiming and building E41 (Localisation completeness), whose own exit criterion is explicit
and mechanical: "A hardcoded user-facing string fails CI. The platform is fully usable in an RTL locale
(G-15)." A repo-wide search confirmed:

- **Zero i18n library usage anywhere in `unierp-web`**: `grep -rl "next-intl\|react-i18next" app/
  --include=*.tsx` across all 994 `.tsx` files under `app/` returns nothing. No translation hook, no
  locale-aware string lookup, nothing — every one of the platform's 890+ pages hardcodes its user-facing
  text directly in JSX.
- **Zero RTL support anywhere**: no `dir="rtl"`, no direction-aware layout logic, no CSS logical
  properties audit — nothing found across the same search scope, despite `unierp-api/src/common/
  services/i18n.service.ts`'s own `getSupportedLocales()` explicitly listing Arabic with
  `direction: "rtl"`, implying RTL was at least designed for at the data-model level.
- **The one real translation mechanism that exists (`I18nService`) is unreachable via HTTP**: it has a
  real `translate()`/`getTranslations()` implementation with a small built-in dictionary (es/fr/de, ~10
  keys each) and a tenant-override mechanism (`LanguageOverride` model), but `grep -rln "I18nService" src
  --include=*.controller.ts` finds no controller referencing it anywhere — the same orphaned-service
  pattern this session already found in D099 (e-signature) and D097 (SLA-related, before its fix).

Given the scale (890+ pages, zero existing framework to build on), externalising every hardcoded string
in one pass is not attemptable in a single phase. Consistent with this session's established approach for
large-surface findings (D077/D078/D079/D082/D092), the real, load-bearing contribution here is the
mechanical CI gate this phase's own exit criterion names directly — "a hardcoded user-facing string fails
CI" — which did not exist in any form before this pass.

**Built:** `scripts/check-hardcoded-strings.mjs` — scans every `.tsx` file under `unierp-web/app` for
JSX text nodes matching `>[A-Za-z][A-Za-z ]{3,}<` (a run of 4+ letters/spaces directly between two JSX
tag delimiters — catches literal English UI text like `>Create Band<` while not matching JSX expression
containers like `>{value}<`), following the exact baseline-ratchet pattern used by every other gate this
programme has built (L02–L18): records the CURRENT count as a baseline
(`evidence/hardcoded-strings-baseline.json`) and `--check` fails only on a **regression** above that
baseline — never retroactively on already-measured, already-filed existing debt. Baseline: **3,675
hardcoded strings across 658 of 994 `.tsx` files**.

Proven via break/restore: introduced one deliberate new hardcoded string (`<span>BROKEN FOR PROOF
hardcoded text</span>`) into a real page (`unierp-web/app/(dashboard)/advanced-hr/compensation/page.tsx`)
— `node scripts/check-hardcoded-strings.mjs --check` correctly failed, naming the exact file and the
count delta (`2 (was 1)`); reverted from a backup, confirmed byte-identical restore (`grep -c "BROKEN FOR
PROOF"` → 0), confirmed the check passes cleanly again (`3675 hardcoded string(s) found, baseline is
3675 — no regression`).

**Not fixed — the actual externalisation, RTL implementation, and any of the phase's other named
requirements (locale-correct dates/numbers/currency/address formats/name ordering, timezone
correctness).** None of these were attempted at scale in this pass; only the mechanical detection gate
was built. The 3,675-string baseline itself is the honest, measured scope of the remaining work — every
one of those strings needs a real translation framework (choosing and installing `next-intl` or similar),
a frontend hook consuming `I18nService`'s data (which itself needs a controller wired up first — D099's
own orphaned-service pattern, again), and a page-by-page migration this single phase cannot complete.
This is filed as the honest, load-bearing remaining scope, not a shortfall of this pass's own effort —
matching this session's precedent for phases whose real scope exceeds what one pass can complete
(D077/D078/D079/D092/D096).

### D104 · 🔴 CRITICAL · No per-tenant AI model pinning existed at all — every tenant silently rode whatever model the deployment environment happened to have configured

Found while claiming and building E45 (AI model operations), whose own exit criterion opens with: "A
model version is pinned per tenant and an upgrade is a deliberate, reversible act." `unierp-api/src/
modules/ai/ai-config.service.ts`'s own comment stated this outright before any fix: "per-tenant model
override is explicitly out of scope... `model` and `baseUrl` are always sourced live from AiService
(env-configured), never persisted." `AiConfigService.getConfig()` always returned
`this.aiService.getDefaultModel()` — a single, global, environment-variable-configured model shared by
every tenant on the deployment, with no mechanism to pin a tenant to a known-good version, no way to
distinguish "upgraded" from "default," and no record of when or whether a model change ever happened.
Changing `OLLAMA_MODEL` in the deployment environment silently changes every tenant's AI behavior at
once — the opposite of "a deliberate, reversible act."

**How it was caught:** reading `AiConfigService` in full — its own comment names the gap directly; no
investigation was needed to discover it, only to confirm no other mechanism elsewhere compensated for it
(`grep -rln "AiConfigService" src --include=*.controller.ts` confirmed the only two consumers,
`ai-admin.controller.ts` and `ai.controller.ts`, both only ever called `getConfig`/`setEnabled`, never
anything model-related).

**Fixed:** `AiConfig` now includes `pinnedModel: string | null`; `getConfig()` returns the tenant's pin
when set, falling back to the deployment default otherwise — using the same generic `Setting.value`
JSON-blob storage pattern already established for the `enabled` kill switch, so no schema migration was
needed. New `setModel(tenantId, model)` persists a pin (or `null` to explicitly revert to the deployment
default — both directions are deliberate, explicit calls) and appends the change to an auditable
`modelPinHistory` array on the same setting row, so an upgrade or rollback is a recorded event with a
timestamp, not silent state. New `GET /ai/config/model/history` endpoint exposes that audit trail. New
`POST /ai/config/model` endpoint wires the pin/unpin action to HTTP. Proven via break/restore (reverted
`getConfig()` to always ignoring any stored pin, confirmed the exact original defect reproduces — setting
a pin had zero effect on what `getConfig()` returned — restored, confirmed 0 `BROKEN FOR PROOF` markers
remain, 5/5 tests pass, including one proving a pin for tenant A does not affect tenant B's config). Full
regression: `src/modules/ai/`, all 6 test files / 39 tests pass cleanly. Typecheck: same 4 pre-existing
unrelated errors, unchanged.

**Not fully investigated — E45's own deliverable is much larger than this pass.** This phase's exit
criterion also names "an unavailable model degrades the feature, never the request" (investigated in this
pass and found already reasonably handled at the one real business-critical call site,
`workflow-engine.service.ts`'s `isConfigured()` + try/catch-with-safe-defaults pattern — not a bug, cited
as a positive finding, not fixed since nothing was broken) and "prompts are versioned artefacts, not
string literals in services" (confirmed still true — `workflow-engine.service.ts`'s own AI-review prompt
is a raw template string embedded directly in the service, not any kind of externalised/versioned
artefact; not fixed in this pass). Critically, **the new per-tenant pin is not yet actually consulted by
any AI call site** — `AiService.chat()`/`rawChat()` still take an explicit `options.model` parameter that
callers must pass; no code path currently looks up `AiConfigService.getConfig(tenantId).model` and threads
it through to an actual Ollama request. The storage/audit mechanism is real and proven; wiring every AI
call site (all 15 services in the `ai` module) to actually resolve and use the tenant's pinned model
before calling `rawChat()` is the real remaining integration work this phase's own exit criterion implies,
not attempted at scale in this pass.

### D105 · 🔴 CRITICAL · The AI copilot's natural-language data query had zero permission scoping — any user with the generic "ai.create" permission could retrieve HR/payroll data via AI even without any direct-access permission

Found while claiming and building E46 (AI guardrails and provenance), whose own exit criterion names
this exact scenario: "retrieval is permission-scoped so RAG cannot surface what the user may not read."
`unierp-api/src/modules/ai/ai-copilot.service.ts`'s `askData(tenantId, question)` — the natural-language-
to-report feature — translates a question into a structured query against the reporting engine's
semantic layer and executes it, correctly scoped by `tenantId`, but with **no check of any kind** against
the requesting user's own role-based permissions. The semantic layer (`reporting-engine.service.ts`)
exposes an `"employees"` entity carrying HR/payroll fields. The controller endpoint (`POST /ai/ask`) is
gated only by the broad `ai.create` permission — a user who could never see employee data directly in
the UI (lacking `hr.employee.read`) could ask the AI copilot "what is the average salary in finance?" and
receive a real, accurate answer pulled straight from the `Employee` table, entirely bypassing the direct-
access permission that would have blocked the same data through any other endpoint.

**How it was caught:** reading `askData()` in full and confirming it receives only `tenantId`, never the
caller's permissions; confirmed the semantic layer's `employees` entity has no access-control metadata at
all; confirmed via the controller that `POST /ai/ask` is gated only by the generic `ai.create`
permission, not anything entity-specific.

**Fixed:** added `requiredPermission?: string` to `ReportingSemanticEntity` (the semantic layer's own
type), marked the `employees` entity with `requiredPermission: "hr.employee.read"` — the same permission
string real HR endpoints (`hr-enterprise.controller.ts`) already require. `askData()` now accepts the
caller's permission array and, before executing any query, checks whether the planned entity carries a
`requiredPermission` the caller lacks — throwing `ForbiddenException` before the query ever runs if so.
`ai.controller.ts`'s `askData` handler now threads `req.user.permissions` through. Proven via break/
restore (reverted the permission check, confirmed the exact original bypass reproduces — the query
proceeded past the point it should have refused, hitting a downstream database call instead of stopping
— restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 7/7 tests pass, including one proving
non-gated entities like `invoices` remain unaffected). Full regression: `src/modules/ai/` +
`src/modules/reporting/` + `src/common/integrations/`, all 19 test files / 75 tests pass cleanly.
Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Implementation note:** the permission check deliberately does NOT import `hasPermission` from
`@kannan19302/auth` (the mechanism `RbacGuard` itself uses) — that package fails to resolve at all in
this test environment (`Cannot find package '@unerp/shared'`, the same pre-existing, environment-wide
issue documented throughout this session's evidence files, e.g. `rbac.guard.spec.ts` itself fails to even
collect for the identical reason). A minimal local exact-match check was used instead; this is
functionally adequate for this call site (a single resolved permission string, not a wildcard pattern to
match), but means this check's semantics could silently drift from `RbacGuard`'s own wildcard-aware
logic if that logic is ever extended — worth reconciling once the underlying package-resolution issue is
fixed.

**Not fully investigated — E46's own deliverable is much larger than this pass.** Only the `employees`
entity was marked as permission-gated; the semantic layer's other entities (`salesOrders`,
`purchaseOrders`, `products`, `leads`) were not individually reviewed for whether they also warrant a
`requiredPermission` — `employees` was fixed as the single clearest, most sensitive example, not because
it is necessarily the only one that needs it. This phase's other two named requirements — "no AI write
reaches a financial or clinical record without an explicit human accept" and "every AI-derived field is
traceable to its prompt, model version and approver" — were not investigated at all in this pass; a
targeted search found no AI service in the codebase currently writes directly to journal entries or
clinical notes (the one real business-critical AI write path, `workflow-engine.service.ts`'s risk
assessment, only emits a notification and never posts anything itself), so the first requirement appears
not to be actively violated today, but this was not exhaustively verified across all 15 `ai` module
services.

### D106 · 🔴 CRITICAL · ArDeepService.getCollectionsStats() reported an AR balance inflated by every draft, void, and cancelled invoice — two definitions of "outstanding" within the same function

Found while claiming and building E33 (Semantic layer), whose own exit criterion states directly: "Every
metric has one definition." `unierp-api/src/modules/finance/ar-deep.service.ts`'s `getCollectionsStats()`
computes two related figures from the same `invoices` array in the same function — `totalOverdue` (from
an `overdue` subset correctly filtered to `status !== "PAID" && status !== "CANCELLED"`) and
`totalOutstanding` (summed from the **entire unfiltered** `invoices` array, with no status exclusion at
all). Two different definitions of "how much does this tenant have outstanding" existed side by side in
one function, and the one actually reported as the headline AR-balance figure (`totalOutstanding`) was
the wrong one: it included `DRAFT` invoices (never sent to a customer — not yet a real receivable) and
`VOID`/`CANCELLED` invoices (will never be collected), summing their full `totalAmount` as if they were
genuine outstanding receivables.

**How it was caught:** writing a FAIL-first test with one real `SENT` invoice ($1,000 outstanding)
alongside a `CANCELLED` ($5,000), `VOID` ($3,000), and `DRAFT` ($2,000) invoice — the pre-existing code
reported `totalOutstanding: 11000` instead of the correct `1000`, an 11x inflation entirely attributable
to invoices that were never real receivables.

**Fixed:** `totalOutstanding` now sums from the same real-receivable population as `overdue`
(`status !== "DRAFT" && status !== "VOID" && status !== "CANCELLED"`), giving both figures in this
function one consistent definition of "outstanding." Proven via break/restore (reverted to summing the
unfiltered `invoices` array, confirmed the exact original defect reproduces — `11000` instead of `1000`
— restored, confirmed 0 `BROKEN FOR PROOF` markers remain, 5/5 tests pass). Full regression: `src/modules/
finance/`, 164/164 real tests pass (1 pre-existing unrelated `@unerp/shared` collection failure,
unchanged). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E33's own scope is much larger than this pass.** This phase's own deliverable
names "a governed metric and dimension layer over the 1,836 models, so reports and dashboards do not
hand-write SQL and break on the next migration." A repo-wide search found many other files independently
computing "outstanding balance"-style figures (`budget-deep.service.ts`, `financial-reporting.service.ts`,
`tax-engine.service.ts`, `ap-deep.service.ts`, `finance-enterprise.service.ts`, `invoice-engine.service.ts`
in `saas`, `subscription.service.ts` in `saas-portal`) — only `ar-deep.service.ts`'s own internal
inconsistency was investigated and fixed as proof-of-technique; whether any of these OTHER independent
"outstanding"/"AR balance" calculations agree with each other or with the now-fixed definition here was
not checked. This phase's other named requirement — "a dashboard survives a schema migration that renames
a column" — was not investigated at all: the semantic layer built in E46's own pass
(`reporting-engine.service.ts`) still maps field names directly 1:1 to Prisma model field names with no
indirection layer, meaning a renamed column would still break any dashboard built on it exactly as before
this phase. Building the "governed metric layer" itself — a single source of truth every one of these
independent "outstanding balance" calculations could be migrated to consume, instead of each
re-implementing its own definition — is the real, large remaining scope this phase's own exit criterion
implies and was not attempted at scale in this pass.

### D107 · 🔴 CRITICAL · The three core financial statements (balance sheet, P&L, trial balance) all included DRAFT (unposted, unapproved) journal entries — none of them could ever reconcile to the actual ledger

Found while claiming and building E34 (Standard report library), whose own exit criterion states: "Every
module's expected report set exists and reconciles to its source data." `unierp-api/src/modules/finance/
finance-operations.service.ts`'s three core financial-statement methods —
`getBalanceSheet()`, `getProfitLoss()`, and `getTrialBalance()` — each queried `prisma.journalEntry.
findMany()` with a filter on `tenantId`, the account type, and a date range, but **none of them filtered
on the parent `Journal`'s own `status` field**. `Journal.status` defaults to `"DRAFT"` and only becomes
`"POSTED"` once finalized (the same field D084's fix in `gl-accounting.service.ts` made exactness-checked
for double-entry balance, earlier this session). Every one of these three reports silently included
unposted, unapproved journal entries as if they were real, finalized accounting facts — meaning none of
them could ever actually reconcile to the posted general ledger, the exact requirement this phase's own
exit criterion names.

**How it was caught:** writing a FAIL-first test for `getBalanceSheet()` with one real $100 POSTED entry
and one $9,000 DRAFT entry against the same account — the pre-existing code reported `assets.total: 9100`
instead of the correct `100`, a ~91x inflation entirely attributable to an unposted entry. The identical
pattern was then found and fixed in `getProfitLoss()` and `getTrialBalance()`, the two sibling report
methods in the same file, each independently missing the same filter.

**Fixed:** all three methods now add `journal: { status: "POSTED" }` to their `journalEntry.findMany()`
where-clauses. Proven via break/restore for all three simultaneously (reverted all three filters, confirmed
all three FAIL-first tests reproduce the exact original defect — inflated totals including the DRAFT
entry's amount — restored, confirmed 0 `BROKEN FOR PROOF` markers remain, all 50 tests in the file pass).
Full regression: `src/modules/finance/`, 167/167 real tests pass (1 pre-existing unrelated `@unerp/shared`
collection failure, unchanged). Typecheck: same 4 pre-existing unrelated errors, unchanged.

**Not fully investigated — E34's own scope is much larger than three report methods.** This phase's own
deliverable names "the reports each module is expected to have — statutory, operational, management — as
governed definitions" across all modules, not just these three finance reports. Other report-generating
methods across `finance-operations.service.ts` itself (e.g. `getCashPositionReport`, `getCashFlow`, seen
adjacent to the three fixed here) and the dozens of other reporting services across other modules
(`advanced-finance`, `reporting`, `manufacturing`, etc.) were not audited for the same missing-status-
filter pattern — this defect's own discovery (the identical gap independently present in three separate
methods in one file) strongly suggests more instances are plausible elsewhere in the codebase, following
this session's now-repeated experience that a bug found once in isolation is rarely isolated (D084/D085/
D086, D088/D092, D097/D099 all showed the same "found once, more likely elsewhere" pattern).
