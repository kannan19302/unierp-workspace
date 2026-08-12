# TRACK E · BUSINESS APPLICATIONS — E01–E42

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 3.** Brief objective ④. The largest track in the programme, and the one most likely to be
> executed wrongly if the premise is not corrected first.

---

## 1. What this track owns

**Plane 3** — the 45 business modules in `unierp-api/src/modules` and their 890 pages in
`unierp-web/app/(dashboard)`.

**The invariant this track establishes:**

> **A module is done when it scores against the rubric, not when it looks finished.**

### The premise correction — read this before picking up any E phase

The brief says "not stubbed or UI placeholders". **The audit does not support that premise**
(`00-BASELINE § 4④`, `03-GAP-ANALYSIS § 3`):

```
route pages in unierp-web           890
median page length                  200 lines
p10 / p90                            41 / 589 lines
pages under 20 lines                  69
files with TODO / Coming soon / not implemented    15
```

Fifteen stub markers across 2,098 source files is not a placeholder codebase. **The real problem
is the opposite one and it is much harder to see: pages that look finished.** They render, they
fetch real data, they save. What they lack is what an ERP is actually judged on —

- approval chains with delegation, escalation and SLA
- period close, and what becomes immutable when it happens
- reversal and correction paths (an ERP never edits history, it reverses it)
- audit and change history on the detail view
- bulk operations, duplicate, merge, import, export
- print and document fidelity in the customer's locale and currency
- the six required UI states

An agent scanning for placeholders will find almost none and conclude the modules are done. **So
Track E is not a hunt for stubs. It is a per-module audit against the fixed 16-row rubric in
`02-EXECUTION-GUIDELINES § 5`, scored with evidence.** You cannot deepen 45 modules by
inspiration, and 890 pages is far too many to eyeball.

**Depends:** A03–A04 (a 31,092-line `core.prisma` cannot be safely extended — D001), B01–B12
(otherwise every module hand-rolls its tables), D13–D22 (otherwise 45 settings dialects), and
L01 + L07–L10 (auditing an 8,282-line controller against a rubric means auditing code nothing can
read in one context — `CODE_STANDARDS § 4`, D017).
**Blocks:** Track I.

---

## 2. Stage E-I · Make depth measurable (Wave 3, first)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **E01** | Rubric scoring harness | A06 | Tooling that scores a module mechanically where possible — page-length distribution, six-state coverage, `@Permissions` density, outbox usage, test ratio, hand-rolled tables, missing `ChangeHistory` — and prompts for the rest | `node scripts/score-module.mjs <module>` emits a 16-row score with evidence per row. Re-running it produces the same score | DONE |
| **E02** | Baseline audit of all 45 modules | E01 | Every module scored, published as one comparable table. The first honest statement of where the product actually is | 45/45 modules scored with evidence. The table is committed and becomes the source for E05–E28's priorities | DONE |
| **E03** | Tier assignment and depth targets | E02 | `docs/module-tier-manifest.json` reconciled with the audit: which modules must reach 3s, which are Tier-3, which carry logged Tier-4 exemptions | Every module has a target score and a stated reason. No module is silently exempt | DONE |
| **E04** | Cross-module gap backlog | E02 | The rubric failures that recur across many modules extracted into shared work rather than fixed 45 times — approvals, reversal, period close, bulk ops, print | Each recurring gap becomes a shared capability phase (E05–E08) rather than 45 duplicated fixes. This phase is what prevents Track E from being 45× the work | DONE |

---

## 3. Stage E-II · Shared capabilities every module needs (Wave 3)

Built once, in the framework and API layers, then adopted by modules in E09–E28. This stage is
`E04`'s answer: the same five gaps appear in nearly every module, so they are solved five times,
not two hundred.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **E05** | Approval-chain engine | E04, D04, A21 | Configurable multi-step approvals: conditions, parallel and sequential steps, delegation, escalation, SLA, recall, and full audit — usable by any entity | Any entity gains approvals by declaration. A vacant approver escalates rather than stalling. Verified against a three-level hierarchy with a vacancy | DONE |
| **E06** | Reversal, correction and period close | E04 | The ERP-correctness primitives: immutable posted records, reversal documents, correction chains, period open/close, and a re-open path that is audited | A posted document is never mutated — it is reversed. Closing a period makes its documents immutable, provably, and reopening requires an approver | DONE |
| **E07** | Bulk operations framework | E04, B01, B11 | Bulk edit, delete, approve, assign, export, duplicate and merge — with preview, partial-failure reporting, progress and undo where feasible | A 10,000-row bulk edit reports per-row outcomes, does not time out, and does not lock the table for other tenants | DONE |
| **E08** | Saved views, filters and personalisation | E04, B01, B11 | `modules/saved-views` and `app/(dashboard)/saved-views` promoted to a platform capability: per-user and shared views, column sets, filters, sorts, defaults | Every list in every module supports saved views with no per-module code. A shared view respects the viewer's permissions, not the author's | DONE |

---

## 4. Stage E-III · Module depth by domain (Wave 3)

Each phase takes its modules to their E03 target score. **Every phase begins by re-reading its
E02 scores** — the work is defined by the audit, not by this table, which names the domain and the
non-negotiables.

### Finance and accounting — where being wrong is unrecoverable

| ID | Phase | Modules | Depends | Non-negotiables at exit | Status |
| :- | :---- | :------ | :------ | :---------------------- | :----- |
| **E09** | General ledger and core accounting | `finance` | E05–E08, L08 | Double-entry provably balanced; multi-currency with revaluation; period close (E06); trial balance, P&L and balance sheet reconciling to the ledger; **100 %** coverage on all arithmetic | OPEN |
| **E10** | Receivables, payables and cash | `finance` | E09 | Ageing, dunning, allocation, part-payment, write-off, bank reconciliation; every posting traceable to a source document | OPEN |
| **E11** | Advanced finance | `advanced-finance` | E09 | Budgets, cost centres, allocations, consolidation, intercompany, deferred revenue, accruals — each reconciling to the GL | OPEN |
| **E12** | Tax and statutory determination | `finance`, `localization` | E09 | Jurisdiction-correct determination; per-country statutory reports; rate changes versioned by effective date, never retroactive (**G-15**) | OPEN |
| **E13** | Fixed assets | `fixed-assets` | E09 | Acquisition, depreciation schedules, revaluation, impairment, insurance, transfer, disposal — every event posting to the GL | OPEN |

### Supply chain and operations

| ID | Phase | Modules | Depends | Non-negotiables at exit | Status |
| :- | :---- | :------ | :------ | :---------------------- | :----- |
| **E14** | Inventory and warehousing | `inventory` | E05–E09 | Valuation (FIFO/weighted/standard) reconciling to the GL; lot and serial traceability; multi-location; cycle count and adjustment with approval; negative-stock policy enforced | OPEN |
| **E15** | Procurement | `procurement` | E14 | Requisition → RFQ → PO → receipt → three-way match → invoice, with approvals (E05) and partial receipts | OPEN |
| **E16** | Sales and order management | `sales` | E14, E10 | Quote → order → fulfilment → invoice, with credit limits, backorders, allocation, returns and RMA | OPEN |
| **E17** | Supply-chain planning | `supply-chain` | E14–E16 | Demand and supply planning, reorder policy, lead times, MRP suggestions traceable to their inputs | OPEN |
| **E18** | Manufacturing | `manufacturing` | E14 | BOM versioning, routing, work orders, capacity, WIP valuation to the GL, scrap and yield, quality gates | OPEN |
| **E19** | Point of sale and retail | `pos`, `ecommerce` | E14, E16 | Offline-capable POS with reconciled sync; shifts, cash drawer, refunds; store and online inventory as one truth | OPEN |

### People

| ID | Phase | Modules | Depends | Non-negotiables at exit | Status |
| :- | :---- | :------ | :------ | :---------------------- | :----- |
| **E20** | Core HR | `hr`, `people` | E05, D04 | Employee lifecycle, org structure, positions, documents with expiry, and PII encrypted per A25 | DONE |
| **E21** | Payroll and compensation | `advanced-hr`, `hr-advanced` | E20, E09, E12 | Statutory-correct payroll per jurisdiction, retro-pay, arrears, payslips, GL posting, and a **100 %**-covered calculation engine. Consolidates the two overlapping advanced-HR modules into one | OPEN |
| **E22** | Talent, time and attendance | `hr`, `people` | E20 | Recruitment, onboarding, appraisal, learning, leave, shifts, timesheets, overtime rules, recognition | DONE |

### Customer-facing and services

| ID | Phase | Modules | Depends | Non-negotiables at exit | Status |
| :- | :---- | :------ | :------ | :---------------------- | :----- |
| **E23** | CRM | `crm` | E05, E08 | Lead → opportunity → account lifecycle, pipeline, activity, duplicate detection and merge (E07), consented communication via A21 | DONE |
| **E24** | Projects and professional services | `projects` | E09, E22 | WBS, budget vs actual, resourcing, billable time, milestone and progress billing, revenue recognition to the GL | OPEN |
| **E25** | Service management and field service | `service-management`, `field-service` | E05, E14 | SLA-driven tickets, scheduling and dispatch, mobile-first execution (Track I), parts consumption, warranties, expenses | OPEN |
| **E26** | Vertical suites — **and port the archived verticals forward** | `healthcare`, `education`, `real-estate` + `unierp-extensions/*` | E20, E23, A25, G01 | Domain-correct clinical, academic and property workflows; regulated data encrypted and residency-honoured. **Scope corrected 2026-08-07 (D023): the four `unierp-app-*` services are ARCHIVED and read-only on GitHub, and their replacements in `unierp-extensions` are one 26–39-line `index.ts` each. 2,249 source lines were superseded by 138.** So this is a *port* from the archive onto the extension API, not a deepening of code already in place | Each vertical's functionality runs from `unierp-extensions/<vertical>` against the public extension API, with the archived repo's clinical/academic/property logic accounted for line by line — ported, rewritten, or explicitly dropped with a reason. `wc -l unierp-extensions/*/src/index.ts` is no longer 26–39. No vertical feature is reachable only from an archived repository | OPEN |

### Platform-adjacent modules

| ID | Phase | Modules | Depends | Non-negotiables at exit | Status |
| :- | :---- | :------ | :------ | :---------------------- | :----- |
| **E27** | Content, documents and storage | `documents`, `drive`, `storage` | E04 | Versioning, permissions, retention (D12), preview, full-text search, quota, virus scanning, and attachment lifecycle tied to records | DONE |
| **E28** | Workflow, AI and platform services | `workflow`, `ai`, `analytics`, `notifications`, `outbox`, `saved-views`, `admin`, `pwa`, `devops`, `blockchain`, `api-platform`, `ext-gateway`, `extension-registry`, `marketplace`, `saas`, `saas-portal`, `subscriptions`, `communication`, `localization`, `reporting`, `search` | E05–E08 | Each scored against the rubric and taken to its E03 target, or given a logged exemption. **This phase is a container: split it into `E28a…` per module as work is picked up** — it is deliberately the one place the plan expects subdivision | OPEN |

---

## 5. Stage E-IV · Cross-cutting capabilities the brief did not name (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **E29** | Document template engine | B07 | Templated, branded, versioned documents with a visual template editor, driven by entity data | An invoice template edited by a tenant produces a correct PDF for any invoice with no code (**G-8**) | DONE |
| **E30** | Print and export fidelity | E29 | Locale- and currency-correct output; page breaks, multi-page tables, headers and totals; PDF/A where archival matters | An invoice in `hi-IN` with `₹` lakh grouping and a 200-line table renders correctly across page breaks | WIP |
| **E31** | E-signature and document workflow | E29, E05 | Signature request, routing, reminders, tamper-evident completion certificate | A signed document's integrity is verifiable after the fact, and the trail is admissible | OPEN |
| **E32** | Attachment and media lifecycle | E27 | Attachments as first-class citizens of records: retention, redaction, access audit, and deletion consistent with D11–D12 | A GDPR erasure removes attachments too. Proven, not assumed | OPEN |
| **E33** | Semantic layer | A03 | A governed metric and dimension layer over the 1,836 models, so reports and dashboards do not hand-write SQL and break on the next migration (**G-7**) | A dashboard survives a schema migration that renames a column. Every metric has one definition | OPEN |
| **E34** | Standard report library | E33 | The reports each module is expected to have — statutory, operational, management — as governed definitions | Every module's expected report set exists and reconciles to its source data | OPEN |
| **E35** | Ad-hoc report builder | E33, B01 | End-user report building on the semantic layer: fields, filters, grouping, totals, drill-through, save, share | A tenant user builds a cross-module report without SQL, and it respects their permissions, not the author's | OPEN |
| **E36** | Scheduled delivery and subscriptions | E34, A21 | Reports scheduled, filtered per recipient, delivered by any channel, with failures visible | A scheduled report delivers to 100 recipients with per-recipient permission filtering applied | OPEN |
| **E37** | Dashboards for end users | E33, B10 | Tenant-authored dashboards from governed metrics, with drill-through to records | A dashboard tile drills through to the filtered record list that produced it | OPEN |
| **E38** | Analytics warehouse and history | E33 | Historical and aggregate store so analytical load does not sit on the transactional database | A year-over-year query does not degrade transactional p95. Verified under load | OPEN |
| **E39** | Federated search | E27, B04 | Permission-filtered search across every entity: typo-tolerant, entity-aware, ranked, with actions from results | Searching a term returns only records the user may see — and result *counts* do not leak the existence of others (**G-6**) | OPEN |
| **E40** | Command palette and quick actions | E39, B04 | One keyboard entry point to any record, route or action in the platform | Any record is reachable in under three keystrokes plus a query, from any screen | OPEN |
| **E41** | Localisation completeness | E12, B06 | Every user-facing string externalised; RTL; locale-correct dates, numbers, currency, address formats and name ordering; timezone correctness throughout | A hardcoded user-facing string fails CI. The platform is fully usable in an RTL locale (**G-15**) | OPEN |
| **E42** | Statutory and regulatory reporting per market | E12, E34, E41 | The legally required reports per supported jurisdiction, versioned by effective date, with a documented update process for annual changes | Each supported market's mandatory filings are produced and validated against that jurisdiction's specification. Unsupported markets are stated explicitly rather than implied | OPEN |

---

## 5b. Stage E-V · Correctness primitives added 2026-08-07

Found in the programme's second review. Each is a **cross-cutting correctness concern in an ERP**
that the original 42 phases assumed rather than named — and each is far cheaper to design in than
to retrofit, which is the test for whether it belongs in a plan at all.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **E43** | Concurrency, optimistic locking and write idempotency | E05, E06 | A uniform concurrency contract: version columns on every mutable entity, optimistic-lock conflict detection with a real resolution UI, and idempotency keys required on every non-idempotent write. `unierp-api/src/common/idempotency/` exists as an interceptor and `makeIdempotencyKey` exists in the kernel — this makes them **mandatory and universal**, not available | Two concurrent edits to one record produce a surfaced conflict, never a silent last-write-wins. A double-submitted POST creates **one** record — asserted by a test that fires the same request twice. Every mutable entity carries a version column (36 do today, across 3 of 18 schema files) | OPEN |
| **E44** | Gapless statutory document numbering | E06, E09, E12 | Per-tenant, per-document-type, per-fiscal-year number series that are **gapless and monotonic under concurrency and rollback** — a legal requirement in most jurisdictions UniERP targets, and unsatisfiable by a database sequence, because a rolled-back transaction consumes a sequence value and leaves a gap | 10,000 concurrent invoice creations across 20 workers produce numbers 1…10,000 with **no gaps and no duplicates**. A failed transaction consumes no number. Verified under deliberate rollback injection. A gap is a finding an auditor can act on, so this is a hard exit | OPEN |
| **E45** | AI model operations | E28, A19 | The local-first AI layer (`modules/ai` — 15 services, Ollama, pgvector) given a lifecycle: model registry and pinned versions, per-tenant model selection, prompt and template versioning, cost and latency budgets, and graceful degradation when the model is unavailable | A model version is pinned per tenant and an upgrade is a deliberate, reversible act. An unavailable model degrades the feature, never the request. Prompts are versioned artefacts, not string literals in services | OPEN |
| **E46** | AI guardrails and provenance in a system of record | E45, D05 | Every AI-produced value is attributed, reviewable and reversible: no AI write reaches a financial or clinical record without an explicit human accept; retrieval is permission-scoped so RAG cannot surface what the user may not read; every AI action is audited with its inputs | An AI suggestion cannot post a journal entry or alter a clinical note unaided. A RAG query provably cannot retrieve another tenant's — or an unauthorised user's — documents. Every AI-derived field is traceable to its prompt, model version and approver | OPEN |
| **E47** | AI evaluation and regression suite | E45, E46, J09 | A held-out evaluation set per AI feature, with accuracy thresholds enforced in CI, plus drift detection — because a prompt edit is a behaviour change with no compiler and no stack trace | An AI feature whose accuracy falls below its threshold fails CI. A prompt change that degrades the eval set is caught before merge, not by a customer. **Without this, every AI feature is unfalsifiable in exactly the way D002 and D016 describe** | OPEN |

---

## 6. Track exit criteria

- [ ] All 45 modules scored by `score-module.mjs`, each meeting its E03 target: **≥ 2 on every
      rubric row and ≥ 3 on rows 1, 2, 3, 7 and 14** (data model, lifecycle, authorisation,
      events, tests — the five where being wrong is unrecoverable)
- [ ] Zero pages under 20 lines that are not intentional redirects (69 today)
- [ ] Zero `TODO` / `Coming soon` / `not implemented` markers in shipped user-facing paths
- [ ] Approval chains, reversal/correction, period close, bulk operations and saved views exist
      **once** and are adopted by every module that needs them
- [ ] Financial arithmetic across E09–E13 and E21 at **100 %** unit coverage
- [ ] Every module's expected report set exists and reconciles to source data
- [ ] A cross-module ad-hoc report survives a schema migration
- [ ] Federated search leaks nothing, including through result counts
- [ ] A hardcoded user-facing string fails CI; the platform works in an RTL locale
- [ ] Each supported jurisdiction's statutory filings are produced and validated; unsupported
      markets are named

---

## 7. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 42 phases. Reframed from "finish the stubs" to "audit against a rubric" because the audit found only 15 stub markers across 2,098 files — the risk is pages that look finished. E05–E08 added so recurring rubric failures are fixed once rather than 45 times. E28 is explicitly a container expected to subdivide. | Claude Code |
| 2026-08-07 | E26 scope corrected (D023): the four `unierp-app-*` vertical repos are archived and read-only, and their live replacements are 26–39-line stubs — 2,249 source lines superseded by 138. E26 is a port from the archive, not a deepening. E43–E47 added (concurrency/idempotency, gapless statutory numbering, AI model ops/guardrails/evaluation). | Claude Code |
