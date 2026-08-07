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
was reverted because every `pnpm install --frozen-lockfile` on a runner resolved `@unerp` against
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

`ROADMAP.md § Where the project actually is` states the extracted repos *"still declare `@unerp/*`
as `workspace:*`, so `npm install` in a clean clone fails"* and that the Dockerfiles *"were removed
rather than repaired."*

**Reproduction:** one repo still declares `workspace:*` (D008), not all of them; and the Dockerfiles
are back — `unierp-api`, `unierp-web`, `unierp-console`, `unierp-developer` and `unierp-infra` all
have HEAD `feat(docker): build this image from this repository`.

The staleness understates real progress, which is the benign direction — but `ROADMAP.md` is what a
newcomer reads to decide whether the project is alive.

---

## 3. Closed defects

_None yet. When closing one, move its entry here, add `**Closed:** <date> by <phase>`, and state
what the fixing commit changed. Do not delete the reproduction — the next person needs to know how
it was detected._

---

## 4. Defect index

| ID | Sev | Summary | Fixed by | Status |
| :- | :-- | :------ | :------- | :----- |
| D001 | 🔴 High | `core.prisma` is 31,092 lines; R2 criterion (≤ 3,000) unmet | A03 | OPEN |
| D002 | 🔴 High | Coverage gate cannot fail: `all: false`, no thresholds | A06, J02 | OPEN |
| D003 | 🔴 High | `@unerp` scope resolves to `localhost:4873` in 18 repos | A01 | OPEN |
| D004 | 🟠 Med | `ARCHITECTURE.md` places the outbox in `unierp-kernel` | A12 | OPEN |
| D005 | 🟠 Med | Documented run instructions point at the retired monorepo | A15, A12 | OPEN |
| D006 | 🟠 Med | 11 repair scripts + 3 error dumps tracked in `unierp-mobile` | A14, I01, I02 | OPEN |
| D007 | 🟠 Med | `unierp-storybook/.storybook/.storybook/` self-nesting | A14 | OPEN |
| D008 | 🟠 Med | `unierp-storybook` still `workspace:*`; cannot install | A02, B13 | OPEN |
| D009 | 🟠 Med | 393-line sandbox carries the isolation claim, untested | A16–A19 | OPEN |
| D010 | 🟡 Low | `unierp-corporate-site-template` has no source files | F16 | OPEN |
| D011 | 🟡 Low | `ROADMAP.md` extraction status materially stale | A12 | OPEN |
| D012 | 🟡 Low | Builder `[id]` editors are 9-line stubs | G10, G11, G16 | OPEN |
| **D013** | 🔴 **Crit** | **Layer gate declared in 21 repos, script exists in 0** | A07, A08, A12 | OPEN |
| D014 | 🟠 Med | `audit-architecture.mjs` targets the retired `ERPSys` path | A11 | OPEN |
| D015 | 🟠 Med | All 15 agent entrypoints point at the retired monorepo; 25 repos have none | `sync-agent-entrypoints.mjs`, A15 | OPEN |
| **D016** | 🔴 **Crit** | **70 % of test-suite volume cannot fail (`catch(e){expect(e).toBeDefined()}`), and CI excludes it. Blocks A06.** | L11–L14 | OPEN |
| D017 | 🟠 Med | 86 non-test files exceed the 1,000-line hard ceiling `CODE_STANDARDS § 4` calls unjustifiable; nothing enforces it | L01, L07–L09 | OPEN |
| D018 | 🟠 Med | `CODE_STANDARDS § 10`'s R13 lint rules (size, complexity, naming, silent catch, TODO discipline) were never implemented and had no phase | L01–L06 | OPEN |
| **D019** | 🔴 High | **`workflow_call` used in 0 repos — every CI file is a hand copy, contradicting workspace's stated invariant. Makes A07/A08 30× and temporary.** | A29 | OPEN |
| **D020** | 🔴 **Crit** | **Extension kill switch is per-process and unpersisted — an operator using it in an incident would see it succeed while the extension kept running** | A17 | OPEN |
| **D021** | 🔴 **Crit** | **Egress "allowlist" is a hostname string match — DNS rebinding reaches cloud metadata and localhost; redirects unchecked; no scheme restriction** | A17 | OPEN |
| **D022** | 🔴 High | **No cap on bridge payload size or concurrent isolates — one tenant can OOM the process serving all tenants** | A17 | OPEN |
| **D023** | 🔴 High | **The 4 verticals are archived on GitHub; 2,249 source lines replaced by 138. The supersession moved the name, not the code. Family is 26 live repos, not 30.** | E26 | OPEN |

---

## 5. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Log established with D001–D014 from the programme baseline audit. D013 (layer gate declared in 21 repos, present in none) is the most consequential: the platform's central invariant is asserted by a CI step that has never executed. | Claude Code |
