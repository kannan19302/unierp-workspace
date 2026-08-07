# 00 · BASELINE — what is verifiably true on 2026-08-07

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Every claim in this document carries the command that produces it.** A claim without
> evidence is a belief, and this programme was written specifically because
> `ARCHITECTURE_REVIEW.md` found that most of the platform's guarantees were beliefs.
>
> **Amend this file when the facts change. Do not regenerate it.** Add a row to § 9 when you do.

---

## 1. Why this document exists first

`ARCHITECTURE_REVIEW.md` scored the platform **5.4 / 10** on 2026-07-30 and was assessed
against the **ERPSys monorepo**, which no longer exists locally — `unierp-workspace`'s HEAD is
`docs: record the monorepo's retirement`. Substantial remediation has landed since. Planning the
next 278 phases against a stale audit would put dozens of them on work that is already finished
and skip the ones that quietly regressed.

So § 2 re-verifies the eight Phase-0 remediation items (`IMPLEMENTATION_PLAN.md § 10`) against
the polyrepo as it stands today, and § 3–§ 7 establish the per-surface maturity that the track
files depend on.

**The headline: R1, R3 and R8 are genuinely closed — the `@ts-nocheck` catastrophe is fully
reversed, which is a large achievement. R2 and R6 are reported as addressed and are not. And a
gate nobody was tracking — the layer check that the entire polyrepo topology rests on — turns out
to run in 21 repositories and exist in none (D013). That is exactly the failure mode
`§ F2` described, which is why Track A opens with re-verification of the gates themselves rather
than with new work.**

> **The general lesson, and the reason this baseline is § 1 of the programme:** the pattern that
> keeps recurring here is not sloppiness, it is *a claim outliving its mechanism*. `@ts-nocheck`
> made `typecheck` pass while checking nothing. `all: false` makes coverage report while
> asserting nothing. `if: hashFiles(...)` makes the layer gate green while executing nothing.
> Each was introduced for a good local reason and each became a lie by omission. **Every phase in
> this programme therefore has an exit criterion phrased as a command whose failure is
> observable** — not as a state someone can declare.

---

## 2. Phase-0 remediation — re-verified

| # | Item (`IMPLEMENTATION_PLAN § 10`) | Stated exit criterion | **Verified status** | Evidence |
| :- | :-------------------------------- | :-------------------- | :------------------ | :------- |
| R1 | Eliminate `@ts-nocheck` | Zero suppressions | ✅ **CLOSED** | `rg '@ts-nocheck' -g '*.{ts,tsx}'` → 0 matches across all 30 repos. Was 3,241/3,241. |
| R2 | Split the 40,577-line schema | **No file over 3,000 lines** | ⚠️ **PARTIAL — criterion not met** | Schema is now multi-file (18 domain files), but `unierp-data/prisma/schema/core.prisma` is **31,092 lines** — 10× the stated limit. The other 17 files are all under 1,400. The split extracted the domains and left the core behind. → **A03** |
| R3 | Wire RLS verification into CI | 100% of tenant tables policied | ✅ **CLOSED (gate)** | `ci.yml:220` runs `check-rls-verify.mjs` as a blocking step with no `continue-on-error`. `ci.yml:4` asserts no `continue-on-error` anywhere in the file, and grep confirms it. Coverage of the 364 tables named in `§ F5` still needs a run to confirm → **A05** |
| R4 | Rearchitect CI/CD | Deploy automatic, reversible, gated | ⚠️ **PARTIAL** | `cd.yml` now exists alongside `ci.yml`, `release.yml`, `load-test.yml`, `codeql.yml`. `platform-manifest.json` pins train `2026.08.0` with `staging.auto_deploy: true`. Unproven: image signing, SBOM, post-rollout health gate, rehearsed rollback. → **A08–A12** |
| R5 | Repo hygiene | Clean `git status`, no scratch files tracked | ❌ **OPEN** | `unierp-mobile` root tracks 11 one-off repair scripts (`fix_router.py` … `fix_router_5.py`, `auto_fix_router.py`, `revert_script.py`, `specific_remover.py`, `restore.py`, `gen_batch1.ps1`, `generate.ps1`) plus `full_analyze.txt`, `remaining_errors.txt`, `missing_controllers.txt`. → **A14** |
| R6 | Coverage gate that can fail | ≥ 80% enforced | ❌ **OPEN — reported, cannot fail** | `unierp-api/vitest.config.ts` still carries `all: false` and declares **no `thresholds` block**. CI uploads the coverage artifact and asserts nothing. This is `§ F2` verbatim, unchanged. → **A06** |
| R7 | Dependency + licence scanning | Zero high/critical; zero non-open | ⚠️ **PARTIAL** | `ci.yml` has a `supply-chain` job and `scripts/ci/check-licenses.mjs` exists. Advisory count not re-measured since the 39/21/1 figure in `ROADMAP.md`. → **A07** |
| R8 | Observability: SLOs, dashboards, alerts, runbooks | On-call diagnoses without reading code | ✅ **LARGELY CLOSED** | `docs/runbooks/SLO-DEFINITIONS.yaml`, `grafana/platform-overview.json`, `grafana/per-tenant-slo.json`, `INCIDENT-RESPONSE.md`, `DATABASE-FAILOVER.md`. Alert *routing* unverified. → **A13** |

### What else has closed since the audit

| Was broken | Now | Evidence |
| :--------- | :-- | :------- |
| Extracted repos declared `workspace:*` and could not `npm install` | Only `unierp-storybook` still does | `grep -l 'workspace:\*' */package.json` → 1 file |
| Dockerfiles removed because they `COPY`d monorepo paths | Restored per-repo | HEAD of `unierp-api`, `unierp-web`, `unierp-console`, `unierp-developer`, `unierp-infra` is all `feat(docker): build this image from this repository` |
| Committed npm auth tokens in 14 repos | Removed; `.npmrc` now carries registry config only, with the incident documented in the file itself | `cat unierp-api/.npmrc` |
| All Rights Reserved licence contradicting the self-hosting claim | AGPL-3.0 text shipped in every repo | HEAD of 15 repos is `docs: ship the actual AGPL-3.0 text instead of a link to it` |
| RLS bypassed by the IdP client | Fixed in both directions | `unierp-data` HEAD `fix(rls): the IdP client bypassed tenant context entirely`; `unierp-idp` HEAD `fix(rls): scope the IdP reads that RLS was silently hiding` |

### What remains structurally open

**`@unerp:registry=http://localhost:4873/`.** `unierp-api/.npmrc` still points the scope at a
localhost Verdaccio. `ROADMAP.md` calls this *"the one thing that blocks the rest"* and it is
still true: no CI runner can resolve `@unerp/*` from localhost, so every downstream repo's clean
install and every container build depends on a registry decision that has not been made. This is
**A01**, and it is the first phase of the programme for that reason.

---

## 3. Repository inventory — **26 live** repos, by verified code volume

> **Corrected 2026-08-07 (D023).** This section said 30 and listed the four `unierp-app-*`
> verticals with real file counts as though they were live. They are **archived on GitHub** and
> read-only, superseded by `unierp-extensions/<vertical>` — where 2,249 source lines have been
> replaced by 138. The count was wrong and the four rows below are retained with their archived
> status rather than deleted, because the code in them is the input to E26's port.

`find <repo> -type f \( -name '*.ts' -o -name '*.tsx' -o -name '*.dart' \) -not -path '*/node_modules/*'`

| Repo | L | Source files | Verified state |
| :--- | :- | ---: | :--- |
| `unierp-web` | L4 | 2,098 | **890 route pages**, median 200 lines. The largest real surface in the platform. |
| `unierp-api` | L3 | 1,863 | **45 modules** + `platform/v1` control plane (12 controller/service pairs) + `developer/builder` (17 services, 10 controllers). |
| `unierp-mobile` | L5 | 810 | Flutter; `lib/{app,core,features}`; Android + iOS + **Windows** targets present. Root carries repair-script debris. |
| `unierp-corporate-website` | L4 | 204 | 20 public sections, **19 admin pages**, 38 API routes, own Prisma schema with 25 models. |
| `unierp-design-system` | L1 | 171 | **14 primitives** with stories + `blocks`, `charts`, `data-grid`, `form-engine`, `dashboard`, `workflow`, `layout`, `notifications`, `tokens/themes`. |
| `unierp-developer` | L4 | 120 | **34,636 lines**; `builder/{erp,web,manage,app-hub}`; 40+ builder pages. |
| `unierp-idp` | L3 | 99 | Separate identity service, own realm. |
| `unierp-shared` | L1 | 91 | Permission registry, cross-cutting utilities. |
| `unierp-data` | L2 | 37 | Prisma; **18 schema files**, **179 migrations**, separate IdP client. |
| `unierp-framework` | L2 | 33 | The schema-driven runtime that renders 45 modules of CRUD. |
| `unierp-blockchain` | — | 22 | |
| `unierp-app-healthcare` | — | 21 | **ARCHIVED, read-only.** 881 lines superseded by a 37-line stub — D023. |
| `unierp-app-realestate` / `-fieldservice` / `-education` | — | 12 each | **ARCHIVED, read-only.** 410/426/532 lines superseded by 26/39/36-line stubs — D023. |
| `unierp-console` | L4 | 11 | **See § 4. Effectively unbuilt.** |
| `unierp-extension-api` | L2 | 8 | 4 files, ~380 lines: `bundle`, `capabilities`, `schema`, `index`. |
| `unierp-contracts` | L0 | 8 | `entities`, `events`, `http`. Depends on nothing. |
| `unierp-storybook` | — | 4 | Config only. Still `workspace:*`. Has a `.storybook/.storybook/` nesting defect. |
| `unierp-extensions` | L6 | 4 | Four verticals, **one `src/index.ts` each (26–39 lines)** — the live replacements for the archived `unierp-app-*` repos, and the reason D023 is High. |
| `unierp-auth` | L1 | 4 | |
| `unierp-service-kit` | L1 | 3 | |
| `unierp-sandbox` | L2 | 3 | **393 lines.** The V8-isolate guarantee the whole extension model rests on. |
| `unierp-sdk` | L1 | 2 | 107 lines. |
| `unierp-kernel` | L1 | 2 | **56 lines** — `TenantContext`, `PolicyEngine`, idempotency keys, `OutboxEvent` *interface*. |
| `unierp-workspace` | L7 | 0 TS | 10 CI workflows, 28 gate/ops scripts, 17 docs. The orchestrator. |
| `unierp-infra` | L7 | 0 TS | `control-plane`, `docker`, `registry`, `load-tests`, compose files. |
| `unierp-config` | L1 | 0 TS | Shared `prettier` + `typescript` config. |
| `unierp-platform` | — | 0 | Umbrella: README, ARCHITECTURE, ROADMAP, GOVERNANCE, profile. |
| `unierp-corporate-site-template` | — | 0 | **`package.json` and licence only. Unbuilt.** |

**All 30 directories are independent git repositories — but only 26 are live.** None is a submodule; there is no local monorepo. The four archived ones return 403 on push, so tooling skips them (`check-repo-hygiene.mjs`, `sync-agent-entrypoints.mjs`).

---

## 4. Surface-by-surface maturity — mapped to the ten-point brief

This is the section the track files are built on. "Depth" is deliberately harsh: a page that
renders is not a feature.

### ① SaaS platform admin console (internal) → **Track C**

**Status: effectively unbuilt. This is the single largest gap in the platform.**

`unierp-console` contains 11 source files. Seven are route pages. Here is one of them, complete:

```tsx
export default function TenantsPage() {
  return (
    <div>
      <h1>Tenant Management</h1>
      {/* Backed by /api/platform/v1 endpoints, guarded by ControlPlaneGuard */}
    </div>
  );
}
```

`app/page.tsx` is 6 lines. `app/(control-plane)/tenants/page.tsx` is 8. The comment describes
an integration that does not exist in this file.

**The good news is that the hard half is done.** `unierp-api/src/platform/v1` already implements
`tenant-lifecycle`, `tenant-migration`, `super-admin`, `operations`, `white-label`,
`feature-flags-metering`, `reseller-channel`, `cluster-routing`, `enterprise-scale` and
`marketplace` as controller + service pairs. Track C is therefore mostly *client* work against a
control plane that exists — which is why it can run wide and early, and why its phases are
scoped per-domain rather than per-screen.

### ② Premium marketing site + its admin console → **Track H**

**Status: real, shallow in the admin.** 20 public sections exist (`product`, `modules`,
`industries`, `pricing`, `customers`, `docs`, `help`, `resources`, `security`, `status`,
`careers`, `blog`, …). The admin has 19 pages over 38 API routes and a 25-model Prisma schema —
a genuine CMS foundation, not a stub. But `admin/content/page.tsx` and `admin/tools/page.tsx`
are **5 lines each**, and content is the admin's entire reason to exist. The site also has its
own database and its own `middleware.ts`, independent of the platform — deliberate (plane 0) and
worth keeping, but it means auth, audit and RBAC are solved twice and only one of them has been
reviewed.

### ③ Design system → **Track B**

**Status: excellent foundations, small surface.** The token architecture is the part the
architecture review singled out as genuinely first-rate — 7 themes with orthogonal density,
`styles/layers`, `tokens/themes`. Around it: `data-grid`, `form-engine`, `charts`, `dashboard`,
`workflow`, `blocks`, `notifications`, `layout`, `icons`, `hooks`.

But `src/components/` holds **14 primitives**: `badge`, `button`, `card`, `combobox`,
`date-picker`, `empty-state`, `form`, `modal`, `navigation`, `skeleton`, `spinner`,
`status-badge`, `stepper`, plus `info-hint` and `protected-component`. There is no table, no
tabs, no toast, no tooltip, no menu, no popover, no drawer, no accordion, no breadcrumb, no
pagination, no file upload, no rich text, no tree, no split view, no command palette, no
avatar, no switch, no radio group, no slider, no progress, no calendar, no data-viz legend as
first-class components. Web pages are consequently hand-building these, which is the exact
inconsistency a design system exists to prevent. Storybook exists but is a config-only repo that
still cannot install.

**No Flutter counterpart exists.** The tokens are TypeScript; the mobile client cannot consume
them. "Covering all clients" currently means one client.

### ④ All apps to next level → **Track E**

**Status: broad and uneven — and the shape of the unevenness matters.**

- 890 pages. Median 200 lines, p10 = 41, p90 = 589. **69 pages under 20 lines.**
- Only 15 files across `app/` + `src/` carry `TODO` / `Coming soon` / `not implemented`.
- 45 API modules; 489 spec files platform-wide; 27 e2e files.

So this is **not** a placeholder codebase — the median page is substantial and explicit stub
markers are rare. The risk is the opposite one and it is harder to see: pages that *look*
complete, render real data, and are missing the parts an ERP is judged on — approval chains,
period close, reversal and correction paths, audit trails on the detail view, bulk operations,
print/export fidelity, and the six required UI states (`IMPLEMENTATION_PLAN § 6.6`). Track E is
therefore organised as a **per-module completeness audit against a fixed rubric**, not as a list
of features to add. You cannot deepen 45 modules by inspiration.

### ⑤ Tenant website templates + Studio → **Track F**

**Status: skeleton.** `unierp-web/app/_sites/` and `app/[slug]/` exist, so multi-site routing is
sketched. `unierp-developer/src/app/builder/web/` has `sites`, `canvas`, `blog`, `collections`,
`menus`, `assets` — with `canvas/page.tsx` at 103 lines and `sites/page.tsx` at 132.
`unierp-corporate-site-template` is **a `package.json` and a licence**. There is no template
library, no commerce template, no portfolio template, no theme marketplace, no publishing
pipeline. A visual editor whose canvas is 103 lines is a wireframe.

### ⑥ + ⑦ Developer portal and console → **Track G**

**Status: the most surprising result of this audit — far more real than expected.**

`unierp-developer` is **34,636 lines** across 40+ builder pages: `bpmn`, `rules-engine`,
`api-builder`, `advanced-forms`, `mobile-builder`, `query-builder`, `etl`, `theme-manager`,
`dashboards`, `workflows`, `forms`, `logic`, `modules`, `data`, `git`, `releases`,
`environments`, `connectors`, `access`, `logs`, `widgets`, `marketplace`, `mobile-export`.
Backed by `unierp-api/src/developer/builder/` — 17 services, 10 controllers, and a `tests/`
directory with real specs.

Two caveats that define Track G's shape:

1. **The dynamic routes are 9-line stubs.** `builder/erp/{dashboards,forms,workflows}/[id]/page.tsx`
   are 9 lines each — the *list* pages are built and the *editors* are not. That is the
   opposite of the effort distribution a builder needs.
2. **The sandbox that must contain all of this is 393 lines.** Every generated app, custom logic
   handler and extension is supposed to run inside a V8 isolate with no `process`, no `require`,
   no filesystem, and metered CPU/memory/query/egress budgets. 393 lines is not obviously
   enough to be that, and it is the highest-consequence unverified claim in the platform: it is
   the thing standing between one tenant's custom code and every other tenant's data.
   → **A16**, and it gates all of Track G.

### ⑧ Tenant-level SaaS portal → **Track D**

**Status: exists, unassessed as a whole.** `unierp-api/src/modules/saas-portal` and
`modules/saas` exist. `unierp-web/app/(dashboard)/{settings,subscriptions,apps,app}` exist. What
does not exist is a coherent *plane-2* story: which of those screens a tenant administrator
sees, what a tenant admin may do that a tenant user may not, and how per-tenant billing,
licensing, user lifecycle and branding hang together as one portal rather than as scattered
settings pages.

### ⑨ Per-app settings → **Track D (D13–D22)**

`unierp-web/app/(dashboard)/settings` exists; `modules/config` and `schema/config.prisma` exist.
There is no evidence of a *uniform* per-app settings contract — a schema every app declares,
rendered by one settings runtime, versioned, audited, exportable, and overridable at
tenant → app → user → device scope. Forty-five modules each inventing their own settings page is
how a platform stops feeling like one product.

### ⑩ Testing → **Track J**

**Status: worse than "quantity without a gate", which is what this section said when first
written.** 489 spec files and 27 e2e files looked like real work. Then **D016** measured it:

```
total test code                              278,066 lines across 489 files
in *.coverage.spec.ts                        194,494 lines across  69 files   ← 70 %
of their 1,176 it() blocks, this many are
  try { …; expect(result).toBeDefined() }
  catch (e) { expect(e).toBeDefined() }             1,083                      ← cannot fail
and CI excludes all 69 files outright        vitest.config.ts `exclude:` when process.env.CI
```

So the headline figure overstates what is verified by roughly a factor of three, and
`CODE_STANDARDS § 8` had already forbidden precisely this pattern — in a sentence written about
the 23,285-line file that is still in the tree. **Correction recorded rather than quietly amended:
the original wording here ("real work") was drawn from the file count, which is the same mistake
the coverage percentage makes.**

`vitest.config.ts` also sets `all: false` with no thresholds, so nothing is falsifiable — as
`§ F2` said, and it is still true. **These two facts compound: turning on an 80 % threshold
(A06) while the padding files exist produces a worse outcome than no gate.** Non-functional
testing is partly scaffolded
(`load-tests/`, `RUNBOOK_LOAD_TESTING.md`, `load-test.yml`). Absent entirely: mutation testing,
manual test-case management, exploratory charters, accessibility as a gate, visual regression,
security testing as a discipline rather than a CodeQL job, chaos/resilience, and
disaster-recovery rehearsal.

---

## 5. What is genuinely strong — defend these

Repeated from `ARCHITECTURE_REVIEW § 3` because a plan this long will generate pressure to
"simplify", and these are the decisions that must survive it. All re-verified present today:

- **Modular monolith with earned extraction.** 45 modules in one backend; exactly four verticals
  extracted. `ARCHITECTURE.md`'s "Why one backend and not forty-five services" is correct and
  should be quoted at anyone who proposes otherwise.
- **Layer rule.** L0→L7, no sideways or upward dependency. The *structural* half of this is
  genuinely load-bearing: a repo cannot import what is not in its `package.json`, so a cycle is
  hard to express by accident. The *asserted* half is not enforced at all — see **D013**, which
  is the most consequential finding of this audit.
- **RLS with `NOBYPASSRLS` + `SET LOCAL` inside the transaction.** The correct implementation,
  including the transaction-pooling subtlety most teams get wrong.
- **Transactional outbox with idempotent consumer receipts** — 14 files in `modules/outbox`
  including a dispatcher, processor, handler registry, metrics and dead-letter replay.
- **Contracts-first.** `unierp-contracts` at L0 depending on nothing, with CDC expectation files
  (`cdc/expectations.json`) in consumer repos and a `cdc-harness.mjs` that replays them.
- **A deploy is a manifest; a rollback is the previous manifest.** `platform-manifest.json` pins
  every component of train `2026.08.0`.
- **Token system with 7 themes × orthogonal density.**
- **Schema-driven frontend.** The only reason 890 pages is maintainable at all.
- **`db:push` forbidden at the script level** (`forbid-db-push.mjs`) — mechanical discipline.
- **Gates that now actually block.** `ci.yml:4` states there is no `continue-on-error` anywhere
  in the file, and grep agrees. `check-rls-verify.mjs` and `check-pii-registry.mjs` are wired in
  as blocking steps, with comments recording that the PII gate's first real run found 21
  undeclared PII models including `HealthcarePatient` and `EducationStudent`.
- **AGPL-3.0 end to end**, with no open-core carve-out of the isolation, sandbox or audit trail.

---

## 6. Defects found during this audit

Filed in full, with reproduction, in [`90-DEFECT-LOG.md`](90-DEFECT-LOG.md). Summary:

| ID | Severity | Summary |
| :- | :------- | :------ |
| **D013** | 🔴 **Critical** | **The layer gate is decorative in all 21 repos that declare it.** Each repo's `ci.yml` runs `node scripts/check-layer.mjs` guarded by `if: hashFiles('scripts/check-layer.mjs') != ''`. The script exists in **zero** repositories, so the step is silently skipped everywhere and reports success. `unierp-platform/ARCHITECTURE.md` states *"This is not a convention. Each repo's CI runs `scripts/check-layer.mjs`"* — the platform's central invariant is asserted by a step that has never executed. This is `§ F2` reproduced exactly, in the one gate the whole polyrepo topology rests on. |
| D014 | 🟠 Med | `scripts/ci/audit-architecture.mjs` resolves its target as `<root>/ERPSys` — the retired monorepo. It now audits a path that does not exist, so the architecture-vs-documentation audit cannot report a true finding. |
| D001 | 🔴 High | `core.prisma` is 31,092 lines — R2's exit criterion (≤ 3,000) is not met, but R2 reads as done. |
| D002 | 🔴 High | Coverage gate still cannot fail: `all: false`, no `thresholds`. R6 reads as scheduled; it is unstarted. |
| D003 | 🔴 High | `@unerp:registry` points at `localhost:4873` in 18 `.npmrc` files. No CI runner can resolve it. |
| D004 | 🟠 Med | `unierp-platform/ARCHITECTURE.md` says the outbox is in `unierp-kernel`. It is in `unierp-api/src/modules/outbox`; the kernel holds only the `OutboxEvent` interface. |
| D005 | 🟠 Med | `unierp-platform/ARCHITECTURE.md § Running it` instructs `git clone .../ERPSys` and `pnpm dev` in the monorepo — which is retired. The documented way to run the project does not work. |
| D006 | 🟠 Med | `unierp-mobile` root tracks 11 one-off repair scripts and 3 error dumps (R5). |
| D007 | 🟠 Med | `unierp-storybook/.storybook/.storybook/` — the config directory is nested inside itself, with duplicate `main.ts`/`preview.ts`. |
| D008 | 🟠 Med | `unierp-storybook` still declares `workspace:*` and cannot install standalone. The design system's only visual surface is uninstallable. |
| D009 | 🟠 Med | `unierp-sandbox` is 393 lines and carries the platform's highest-consequence isolation claim, unverified by any adversarial test. |
| D010 | 🟡 Low | `unierp-corporate-site-template` is a `package.json` and a licence, but is listed as a repository in the map — it reads as a shipped template. |
| D011 | 🟡 Low | `ROADMAP.md` still describes the extracted repos as "not yet standalone projects" declaring `workspace:*`. One repo does; the statement is now materially stale. |
| D012 | 🟡 Low | Builder dynamic routes (`.../{dashboards,forms,workflows}/[id]/page.tsx`) are 9-line stubs behind fully built list pages. |

---

## 7. Numbers to re-measure at every wave boundary

Record the reading in § 8. A number that is not tracked is a number that regresses.

| Metric | How | 2026-08-07 reading |
| :----- | :-- | :----------------- |
| `@ts-nocheck` occurrences | `rg -c '@ts-nocheck' -g '*.{ts,tsx}'` | **0** |
| Largest Prisma schema file | `find unierp-data/prisma -name '*.prisma' -exec wc -l {} + \| sort -rn \| head -2` | **31,092** (`core.prisma`) |
| Enforced coverage floor | `grep -A5 'coverage:' unierp-api/vitest.config.ts` | **none** |
| Spec files | `find . -name '*.spec.ts*' -o -name '*.test.ts*' \| grep -v node_modules \| wc -l` | **489** |
| Test lines that cannot fail | `grep -rc 'expect(e)\.toBeDefined' --include='*.coverage.spec.ts' . \| ...` | **1,083 of 1,176 `it()` blocks** ← D016 |
| Test lines CI never runs | `*.coverage.spec.ts`, excluded in `vitest.config.ts` | **194,494 of 278,066 (70 %)** |
| Non-test files over 1,000 lines | `... \| xargs wc -l \| awk '$1>1000'` | **86** (hard ceiling per `CODE_STANDARDS § 4`) ← D017 |
| Largest non-test file | same, `sort -rn \| head -1` | **8,282** (`advanced-finance.controller.ts`; controller limit is 300) |
| E2E files | `find . -path '*e2e*' -name '*.ts' \| grep -v node_modules \| wc -l` | **27** |
| Route pages (`unierp-web`) | `find unierp-web/app -name page.tsx \| wc -l` | **890** |
| Pages under 20 lines | `find unierp-web/app -name page.tsx -exec wc -l {} + \| awk '$1<20' \| wc -l` | **69** |
| Design-system primitives | `ls unierp-design-system/src/components/*.tsx \| grep -v stories \| wc -l` | **14** |
| Repos with `workspace:*` | `grep -l 'workspace:\*' */package.json \| wc -l` | **1** |
| Repos with localhost registry | `grep -l 'localhost:4873' */.npmrc \| wc -l` | **18** |
| Migrations | `ls unierp-data/prisma/migrations \| wc -l` | **179** |
| Repos declaring the layer gate | `grep -l 'check-layer.mjs' */.github/workflows/ci.yml \| wc -l` | **21** |
| Repos where that script exists | `ls */scripts/check-layer.mjs \| wc -l` | **0** ← D013 |
| Skip-guarded (`if: hashFiles`) CI steps | `grep -c 'if: hashFiles' */.github/workflows/ci.yml` | **44** across 23 repos — each one a gate that passes when absent |
| Open dependency advisories | `pnpm audit` | **not re-measured** (39/21/1 per `ROADMAP.md`) |

---

## 8. Measurement log

| Date | Wave | ts-nocheck | max schema | coverage floor | specs | primitives | Notes |
| :--- | :--- | ---: | ---: | ---: | ---: | ---: | :---- |
| 2026-08-07 | pre-W0 | 0 | 31,092 | none | 489 | 14 | Baseline established. |

---

## 9. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Document established. Phase-0 items R1–R8 re-verified against the polyrepo; R2 and R6 found open despite reading as addressed. Twelve defects filed as D001–D012. | Claude Code |
