# TRACK G · DEVELOPER PLATFORM — G01–G30

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 4.** Brief objectives ⑥ and ⑦. Ranked **seventh** — the platform's long-term moat, and
> **hard-blocked on A16–A19** for a safety reason that is not negotiable.

---

## 1. What this track owns

**Plane 4 — the developer plane.** `unierp-developer` (the portal), `unierp-api/src/developer`
(its backend), `unierp-sandbox` (the isolate), `unierp-extension-api` and `unierp-extensions`
(the public surface), and the marketplace.

**The invariant this track establishes:**

> **Customer-authored code is a first-class citizen and an untrusted one.** It runs where we can
> see it, meter it, and stop it — and it can reach nothing we did not hand it.

### Starting position — better than expected

`00-BASELINE § 4⑥` — `unierp-developer` is **34,636 lines** across 40+ builder pages: `bpmn`,
`rules-engine`, `api-builder`, `advanced-forms`, `mobile-builder`, `query-builder`, `etl`,
`theme-manager`, `dashboards`, `workflows`, `forms`, `logic`, `modules`, `data`, `git`, `releases`,
`environments`, `connectors`, `access`, `logs`, `widgets`, `marketplace`, `mobile-export`. Backed
by 17 services and 10 controllers in `unierp-api/src/developer/builder`, with real specs.

Two facts define this track's shape:

1. **The editors are the missing half.** `builder/erp/{dashboards,forms,workflows}/[id]/page.tsx`
   are **9 lines each** (**D012**). The *list* pages are built; the things that make a builder a
   builder are not. That is the opposite of the effort distribution a builder needs.
2. **The sandbox is 393 lines** (**D009**) and it is the only thing standing between one tenant's
   custom logic and every other tenant's payroll and patient records.

### Why the block on A16–A19 is not negotiable

`03-GAP-ANALYSIS § G-1` states it in full. Briefly: objectives ⑥ and ⑦ describe flow builders,
logic builders, custom UI builders, a sandbox for third-party ERP apps and a global marketplace.
**Every one of those executes code a customer wrote, inside our process, against our database.**
Shipping the builders before the isolate is proven ships that risk to every tenant simultaneously.

Salesforce's actual moat is not its builders — it is Apex governor limits, the metadata API and
twenty years of backwards compatibility. **A19 is our governor limits.** It comes first for the
same reason theirs did.

**Depends:** A02, **A16–A19 (hard)**, B01–B12, D13–D22. **Blocks:** F01–F14 via G09–G18.

---

## 2. Stage G-I · The runtime that must be trustworthy first (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **G01** | Extension API surface definition | A18 | `unierp-extension-api` (currently 4 files, ~380 lines) grown into a versioned, documented capability model: what an extension may read, write, call, emit and render — enumerated, never implicit | Every capability is explicitly granted; anything not granted is unreachable, proven by test. A capability cannot be added without a version bump | DONE |
| **G02** | Permission and consent model for extensions | G01, A19 | Extensions declare required permissions; a tenant admin sees them at install and consents; runtime grants can never exceed the manifest | An extension attempting an undeclared operation is denied and the attempt is audited. Escalating its own grants is impossible | DONE |
| **G03** | Extension lifecycle | G01, A19 | Install, upgrade, rollback, disable, uninstall — with data migration, and per-tenant isolation of extension state | An upgrade that fails rolls back cleanly with no orphaned data. Uninstall leaves no residue and no dangling permissions | DONE |
| **G04** | Observability for customer code | A19 | Per-extension logs, traces, metrics, errors and resource consumption — visible to both the author and the tenant | An author debugs a failing handler from the portal without our involvement. A tenant sees what an installed extension is doing | DONE |
| **G05** | Sandbox environments and data seeding | A18, C22 | Real sandbox tenants: create, refresh from production with masked data, reset, and promote to production | A developer refreshes a sandbox from production with all PII masked, provably, and promotes a change without touching production data | BLOCKED |
| **G06** | Environment and release management | G05 | The `manage/environments` and `manage/releases` pages made real: dev → test → staging → production with promotion, diff and rollback | A change is promoted through all four environments with a reviewable diff at each boundary, and rolled back from the portal | OPEN |
| **G07** | Source control integration | G06 | The `manage/git` page made real: builder artefacts as reviewable text, branch, PR, merge, and CI on customer-authored apps | A customer-built app is version-controlled, code-reviewed and deployed through a pipeline — its artefacts diff as text, not as opaque JSON | OPEN |
| **G08** | Metadata API and CLI | G01, G06 | Programmatic access to every builder artefact — the Salesforce metadata-API analogue — plus a CLI for local authoring | Everything creatable in the UI is creatable via API and CLI, and round-trips without loss. Verified by a round-trip test | OPEN |

---

## 3. Stage G-II · The builders (Wave 4) — closes D012

Each builder phase delivers: a working editor (not a list page), a versioned artefact, validation
with actionable errors, a test/preview mode, a deploy path through G06, and generated
documentation.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **G09** | Data/object builder | A03, G01 | Custom objects, fields, relationships, validation, indexes and RLS — generated correctly, migrated safely | A customer-created object gets `tenantId`, both indexes and an RLS policy **automatically**; `check-rls-verify.mjs` passes afterwards. A custom object can never be created without isolation | WIP |
| **G10** | Form builder and editor | G09, B05, D14 | The 9-line `forms/[id]` stub replaced by a real editor: layout, conditional visibility, validation, multi-step, dependent pickers, draft/resume | A 40-field multi-step form with conditional logic is built visually and renders identically on web, mobile and desktop | OPEN |
| **G11** | Flow and workflow builder | G09, E05 | The `workflows/[id]` stub replaced: visual flow authoring with branching, loops, waits, human tasks, error paths and compensation | A flow with a failing external call compensates correctly and is resumable. Every flow run is inspectable step by step | OPEN |
| **G12** | BPMN and process orchestration | G11 | The existing `bpmn` page taken to real BPMN 2.0 import/export and execution with process-level monitoring | A BPMN diagram authored in a third-party tool imports and executes with equivalent semantics | OPEN |
| **G13** | Rules and decision engine | G09 | The `rules-engine` page taken to decision tables, rule sets, priority, conflict resolution and explainability | A pricing decision explains *which* rule produced it. Rule changes are versioned and testable before deploy | OPEN |
| **G14** | Logic and scripting layer | A18, A19, G04 | The `logic` and `manage/query-builder` pages made real: authored logic running in the sandbox with the full editor experience — types, autocomplete, debugging, unit tests | Customer logic runs under enforced governor limits (A19); exceeding one produces a clear, attributable error, not a platform incident | OPEN |
| **G15** | Query builder | G09, E33 | Visual query authoring against the semantic layer, permission-enforced, with cost estimation and a hard result ceiling | A query a user is not entitled to run is refused at build time, not at execution. An expensive query is estimated and capped before it runs | OPEN |
| **G16** | Dashboard builder | G15, B10, E37 | The `dashboards/[id]` stub replaced by a real editor: tiles, layout, filters, drill-through, sharing and scheduling | A dashboard built by a customer is indistinguishable in quality from a first-party one, and respects each viewer's permissions | OPEN |
| **G17** | Custom UI builder | B01–B12, G10 | Component-level UI authoring beyond forms — the "apart from our design system" requirement — with an escape hatch to authored components that still cannot break tokens or a11y | A custom page passes the same `axe` and token gates as a first-party page. Bypassing them is not possible | OPEN |
| **G18** | Page and app composition | G10, G16, G17 | App-level assembly: navigation, routes, permissions, home pages, install experience — the `builder/erp/apps/[id]` and `app-hub` surfaces made real | A complete internal application is assembled with no code and installed into a second tenant | OPEN |

---

## 4. Stage G-III · Distribution (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **G19** | Packaging and signing | G03, G18, A24 | Apps packaged as signed, versioned, dependency-declaring artefacts with a manifest of required permissions | An unsigned or tampered package is refused at install. The manifest is what the runtime enforces | OPEN |
| **G20** | Marketplace — listing and discovery | G19, C25 | Public and tenant-scoped marketplaces: listings, screenshots, pricing, reviews, categories, trials | An app is published, discovered, trialled and installed by an unrelated tenant with no involvement from us (**G-20**) | OPEN |
| **G21** | Review, certification and revocation | G20, C25 | Automated and manual review: static analysis, permission scrutiny, sandbox behaviour testing, certification tiers, and platform-wide revocation | A malicious app is revoked across every tenant that installed it in one action, and those tenants are notified. Rehearsed | OPEN |
| **G22** | Monetisation and payouts | G20, C13–C16 | Paid apps: pricing models, trials, entitlement enforcement, revenue share, and payouts via `marketplace-payouts` | A paid app's revenue reconciles to platform invoices and to the developer's payout statement. Three numbers, one truth | OPEN |
| **G23** | ETL and integration builder | G01, D20 | The `manage/etl` and `manage/connectors` pages made real: visual pipelines, scheduling, incremental sync, error handling and replay | A pipeline syncing 1M rows incrementally recovers from a mid-run failure without duplicating a single row | OPEN |
| **G24** | Mobile app builder and export | G18, B19 | The `mobile-builder` and `manage/mobile-export` pages made real: a customer-built app rendered natively on mobile and exportable | An app built in the portal runs on mobile without a mobile-specific authoring step | OPEN |

---

## 5. Stage G-IV · Public developer platform (Wave 4–5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **G25** | Public API lifecycle | G08, D22 | Self-service API keys and OAuth apps, scoped tokens, per-key quotas, usage dashboards, and a published deprecation calendar honouring `API_VERSIONING_POLICY.md` (**G-14**) | A third party registers an app, obtains scoped credentials and calls the API without contacting us. A deprecation is announced with its window before it lands | OPEN |
| **G26** | Published SDKs | G25, A01 | Generated, versioned, published SDKs from `unierp-contracts` — TypeScript, Python, Dart at minimum — with contract tests | An SDK is installed from a public registry and compiles against the current API. Drift between SDK and OpenAPI fails CI | OPEN |
| **G27** | Developer documentation and reference | G25, G26 | Generated API reference, guides, tutorials, samples, and a changelog — versioned alongside the API | Every endpoint is documented from its contract, so documentation cannot drift. A sample app builds against the published docs | OPEN |
| **G28** | Interactive developer experience | G27 | API explorer, request builder, sandbox credentials, webhook tester, event replay — a working try-it surface, not a static page | A developer makes a successful authenticated call from the browser within five minutes of arriving | OPEN |
| **G29** | AI-assisted development | G09–G18, E28 | Local-first AI assistance in the builders: describe an object/flow/report and get a reviewable draft artefact, never a silent write | Every AI-produced artefact is a reviewable diff the developer accepts or rejects. No AI output reaches a tenant's data without an explicit accept | OPEN |
| **G30** | Governance for customer-built apps | G18, G21, D17 | Tenant-side governance: which builders a role may use, review requirements before production, change control, and rollback | A tenant enforces that no custom logic reaches production without a second reviewer, and can roll back any deployed artefact | OPEN |

---

## 6. Track exit criteria

- [ ] **A16–A19 are `DONE` and the sandbox escape suite passes** — no G phase closes otherwise
- [ ] No builder route is a stub: `builder/erp/{dashboards,forms,workflows}/[id]/page.tsx` are real
      editors (9 lines each today — D012)
- [ ] A customer-created object automatically has `tenantId`, both indexes and an RLS policy;
      `check-rls-verify.mjs` passes after it is created
- [ ] Customer logic runs under enforced governor limits; exceeding one is attributable and
      contained, verified under a deliberate abuse load
- [ ] Everything creatable in the UI is creatable via the metadata API and CLI, and round-trips
- [ ] An app authored **entirely in the portal** reaches the marketplace and installs into a second
      tenant — the Wave 4 claim, end to end
- [ ] A malicious app is revoked platform-wide in one action, rehearsed
- [ ] Marketplace revenue reconciles across platform invoices and developer payouts
- [ ] A third party integrates via published SDK and docs without contacting us
- [ ] A custom page passes the same `axe` and token gates as a first-party page

---

## 7. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 30 phases in four stages. Scoped against the verified 34,636 lines already in `unierp-developer` — this is a completion track, not greenfield. Hard-blocked on A16–A19 because the sandbox containing all customer code is 393 lines and untested (D009). G09's automatic-RLS requirement added so the builder cannot become a route around tenant isolation. | Claude Code |
