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
