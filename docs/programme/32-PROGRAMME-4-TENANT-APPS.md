# PROGRAMME 4 · TENANT APPS — THE ERP — P4-001–P4-370

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 4` resolves waves from this
> document and can only ever hand out a `P4-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** This programme
consumes the design system, the platform kernel and the marketplace's entitlement API, but it is
built against their published contracts. `P4-004` is the precondition gate: each external capability
is asserted at startup and in CI, and the dependent surface degrades to an explicit "requires
\<capability\>" state rather than assuming.

---

## 1. What this programme owns

`unierp-web` and `unierp-api` — **plane 3, the application plane.** The ERP itself: the modules a
tenant's staff use to run a business, as **Core + Extensions + Plugins + Connectors**.

**The invariant this programme establishes:**

> **Every business transaction is complete, balanced, attributable and reversible — and the system
> refuses to record one that is not.**

That sentence is what separates an ERP from a set of CRUD screens. `P4-368` is its mechanical proof:
a period is closed, the trial balance is asserted to zero, every subledger reconciles to the general
ledger, and every posted document traces to its source and its authoriser.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| API modules | **45** | `ls unierp-api/src/modules` |
| Web route pages | **903** | `find unierp-web -name page.tsx -not -path "*/node_modules/*"` |
| API files | 6,884 | `find unierp-api -type f -not -path "*/node_modules/*"` |
| Route groups | `(auth)`, `(dashboard)`, `(storefront)`, `_sites`, `[slug]` | `ls unierp-web/app` |

This is the largest surface in the family and the most misleading, and the misreading is the reason
this programme exists. **903 pages is not 903 working features.** Programme 1's Track E scored all 46
modules against a rubric (`E02-MODULE-BASELINE.md`) precisely because breadth had outrun depth, and
`E04-CROSS-MODULE-GAP-BACKLOG.md` routed the recurring gaps to shared-capability phases rather than
46 duplicated fixes. Track E is **44/47 DONE** — but its own framing was *"from CRUD to genuinely
functional"*, and what it completed was the first pass of that.

**Programme 4 is the depth pass, and it starts by measuring rather than assuming.** `P4-002` re-scores
every module against a strengthened rubric and publishes the result; no module phase in this document
may be claimed before its module has a current score. A module that scores well is finished quickly
and honestly; a module that scores badly gets the work. Neither outcome is decided in advance here.

**Reference set.** SAP S/4HANA (the document principle, the universal journal, controlling), Oracle
NetSuite (multi-subsidiary consolidation and the close), Microsoft Dynamics 365 (dimension model,
posting profiles), Odoo (module composition and the extension seam), Workday (effective-dated HCM),
Infor and IFS (manufacturing and field service depth), and Xero/QuickBooks for the standard every
small-business user now measures a ledger UI against.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **The document is the unit.** Every business event is a document with a number, a state, a source and an audit trail — never a mutated row. | SAP document principle | `P4-024`, `P4-030` |
| **UX-2** | **Nothing posted is edited; it is reversed.** Correction is always a new, linked document. | Statutory accounting | `P4-031` |
| **UX-3** | **The user is told what will happen before it happens.** Posting previews show the resulting entries, stock movements and balances. | NetSuite; Dynamics | `P4-034` |
| **UX-4** | **Keyboard-first, high-volume data entry.** An AP clerk entering 200 invoices a day never needs the mouse. | SAP GUI transaction codes; Xero | `P4-016` |
| **UX-5** | **Every number is drillable to its source.** No figure on any screen is a dead end. | S/4HANA universal journal | `P4-341` |
| **UX-6** | **Errors are stated in business language, at the field, with the fix.** Never a constraint violation. | — | `P4-014` |
| **UX-7** | **The close is a guided, measurable process, not a folklore checklist.** | NetSuite close management | `P4-345` |

---

## 3. Design-system and architecture rules

`unierp-design-system` is the only source of UI primitives. This programme adds the ERP primitives —
document header, line grid, posting preview, dimension picker, period selector, drill-through, balance
display, approval strip — with stories (`P4-013`).

Two architecture rules from the platform's standing review apply here without exception, because this
programme is where they are most often violated: **no direct cross-module service import** — cross-module
effects go through the outbox in the same transaction — and **money is `Decimal(19,4)`, with the
arithmetic staying in Decimal.** `P4-021` and `P4-006` are the gates.

---

## 4. Waves

### Wave 0 · "Measure before building"

**Phases:** P4-001–P4-020

Independence, the precondition gate, and the re-scoring of all 45 modules. No module work starts
before its module has a current, published score.

### Wave 1 · "The kernel every module shares"

**Phases:** P4-021–P4-078

Documents, numbering, periods, dimensions, approvals, attachments, audit, master data. Built once.
`E04`'s lesson is the reason: a recurring gap is a shared-capability defect, not 45 separate bugs.

### Wave 2 · "The financial core"

**Phases:** P4-079–P4-148

General ledger, subledgers, banking, controlling and costing. Everything downstream posts here.

### Wave 3 · "The operational cycles"

**Phases:** P4-149–P4-268

Order-to-cash, procure-to-pay, inventory and warehouse, manufacturing and supply chain.

### Wave 4 · "People, projects and verticals"

**Phases:** P4-269–P4-336

Human capital and payroll, projects and service, and the vertical extensions.

### Wave 5 · "Close, report and prove"

**Phases:** P4-337–P4-370

Statutory reporting, the period close, the full test estate, and the balance proof.

---

## 5. Stage A · Foundation, independence and module re-scoring (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P4 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P4-002** | Module re-scoring against a strengthened rubric | P4-001 | All 45 modules re-scored on transaction completeness, posting correctness, reversal, permissions, isolation, test depth and UX — published as data | Every module has a current score reproducible by command. A module phase claimed without a current score is refused by the gate | OPEN |
| **P4-003** | Cross-module gap consolidation | P4-002 | Recurring gaps routed to shared-capability phases in Stage B rather than duplicated per module | A gap appearing in three or more modules is refused as a per-module fix and routed to its kernel phase | OPEN |
| **P4-004** | Runtime precondition gate | P4-001 | Startup and CI assertion of each external capability — design system version, kernel contract, entitlement API — with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P4-005** | Tenancy and isolation baseline | P4-001 | `tenantId` and an RLS policy on every table in the same migration, with no exemption | A table without both fails `check-rls-verify.mjs`. Two-tenant tests prove **zero** rows | OPEN |
| **P4-006** | Money type and arithmetic gate | P4-001 | `Decimal(19,4)` with explicit currency everywhere, and a gate rejecting `Float` in any money path | A `Float` near money fails CI. A bare amount without currency does not typecheck | OPEN |
| **P4-007** | Migration discipline at ERP scale | P4-005 | Forward-only migrations with tested rollback, over a schema with 1,800+ models | Replaying every migration from empty reproduces the schema exactly. Editing a shipped migration fails CI | OPEN |
| **P4-008** | Idempotency for every posting operation | P4-006 | Idempotency keys on every document creation, posting and reversal | A retried posting posts once, proven under induced failure at each step | OPEN |
| **P4-009** | Concurrency and locking model | P4-008 | Declared isolation and locking for balance updates, stock movements and number assignment | Concurrent postings to one account produce a correct balance under parallel load, with no lost update | OPEN |
| **P4-010** | Structured logging and correlation | P4-001 | Correlation across UI action, API call, posting, event and downstream effect | One document posting is traceable end to end by a single correlation ID | OPEN |
| **P4-011** | Authorization model for business operations | P4-005 | `@Permissions` on every endpoint, defaulting to deny, with unauthorized returning **403** | An endpoint without a permission declaration fails a gate. Unauthorized returns 403, never 404 or 500 | OPEN |
| **P4-012** | Segregation of duties | P4-011 | Conflicting-duty detection across create, approve, post and pay, configurable per tenant | A single user performing a conflicting pair is refused, and the conflict set is auditable | OPEN |
| **P4-013** | ERP design-system primitives | P4-001 | Document header, line grid, posting preview, dimension picker, period selector, drill-through, balance and approval strip in `unierp-design-system` with stories | Each has a story and zero hardcoded colour or spacing. An ERP component defined in a page fails the location gate | OPEN |
| **P4-014** | Business error taxonomy | P4-010 | The UX-6 mechanism: typed business errors with codes, field attribution and remediation — never a raw constraint violation | Every error carries a registry code and a business-language message. A database constraint message reaching a user fails a gate | OPEN |
| **P4-015** | Application shell and navigation for 45 modules | P4-013 | Module navigation, search, favourites, recents and cross-module context that scales to the real surface | A user reaches any of the 903 routes within the stated interaction budget, measured | OPEN |
| **P4-016** | Keyboard model for high-volume entry | P4-015 | The UX-4 mechanism: complete keyboard operation of document entry, line grids and posting | A 20-line invoice is entered and posted without the mouse, timed against the budget | OPEN |
| **P4-017** | Performance budget for transactional screens | P4-015 | Budgets for list, document, posting and drill-through on a fixed profile | A regression beyond budget fails CI on the reference dataset | OPEN |
| **P4-018** | Accessibility baseline | P4-015 | WCAG 2.2 AA across the shell, document surfaces and line grids | The shell and a representative document are `axe` clean and keyboard-complete | OPEN |
| **P4-019** | Reference dataset and fixtures | P4-002 | A realistic multi-entity, multi-currency, multi-year fixture set used by every test and benchmark | Every module's tests run against the shared fixtures. A module-local fixture duplicating them fails review | OPEN |
| **P4-020** | Test harness for business logic | P4-019 | The shared substrate: posting assertions, balance assertions, period control, clock control, two-tenant helper | A posting test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |

---

## 6. Stage B · The kernel every module shares (Wave 1)

`E04-CROSS-MODULE-GAP-BACKLOG.md` established the principle this stage rests on: a gap appearing in
many modules is one shared-capability defect, not many. Everything here is built **once** and every
module in Waves 2–4 consumes it. A module re-implementing any of it fails the architecture gate.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-021** | Module boundary enforcement | P4-003 | The outbox as the only cross-module path, with a gate rejecting direct cross-module service imports | A direct cross-module import fails `check-module-boundaries.mjs`. Cross-module effects commit in the same transaction as their cause | OPEN |
| **P4-022** | Domain event model | P4-021 | The catalogue of business events every module publishes, with versioned schemas | An event without a registered schema cannot be published. A schema change is versioned, not mutated | OPEN |
| **P4-023** | Event consumption and idempotent handlers | P4-022 | Consumers with idempotent handling, ordering guarantees, retry and dead-letter | A redelivered event produces no duplicate effect, proven per handler | OPEN |
| **P4-024** | The document model | P4-021 | The UX-1 mechanism: `Document` as the shared base — number, type, state, dates, party, lines, dimensions, source and audit | A business event recorded outside the document model fails an architecture gate | OPEN |
| **P4-025** | Document state machine | P4-024 | Draft, submitted, approved, posted, reversed, cancelled — with permitted transitions enforced | An invalid transition is refused at the database level, not merely in code | OPEN |
| **P4-026** | Number series and gapless statutory numbering | P4-024 | Per-type, per-entity, per-period number series, gapless where law requires it, surviving concurrency and failure | No gap and no duplicate across 10,000 concurrent document creations with induced failures | OPEN |
| **P4-027** | Fiscal calendar and period control | P4-024 | Fiscal years, periods, per-module open and close states, and posting-date validation | Posting into a closed period is impossible from every path — UI, API, import, integration and job | OPEN |
| **P4-028** | Dimension and analytics model | P4-024 | Cost centre, profit centre, project, segment and custom dimensions with validation rules and defaulting | A posting missing a required dimension is refused at posting, with the dimension named | OPEN |
| **P4-029** | Posting engine | P4-027 | The single mechanism that turns a document into ledger entries and subledger effects, transactionally | A document posts atomically or not at all. Two postings of one document are impossible, proven by injection | OPEN |
| **P4-030** | Source-document traceability | P4-024 | Every posted entry linked to its source document, line and originating user | Every ledger line traces to a source document and an authoriser, asserted across the fixture estate | OPEN |
| **P4-031** | Reversal and correction | P4-029 | The UX-2 mechanism: reversal as a new linked document, with no path that edits a posted record | A posted document cannot be edited by any path. A correction always produces a linked reversal, proven by test | OPEN |
| **P4-032** | Approval and workflow integration | P4-025 | Document approval with limits, delegation, escalation and segregation-of-duties enforcement | A document above an approval limit cannot post without approval, from any path | OPEN |
| **P4-033** | Validation framework | P4-014 | Declarative business-rule validation evaluated server-side on every write path | A rule blocks a write from UI, API, import, integration and job alike, proven per path | OPEN |
| **P4-034** | Posting preview | P4-029 | The UX-3 mechanism: showing resulting entries, stock movements and balance effects before commitment | The preview equals the actual posting exactly, verified differentially across document types | OPEN |
| **P4-035** | Currency and exchange-rate framework | P4-006 | Transaction, functional and reporting currencies, rate types, rate sources and revaluation | Every amount carries its currency and rate. Triangulation and rounding match hand computation | OPEN |
| **P4-036** | Tax framework | P4-035 | Tax codes, jurisdictions, determination, calculation and posting, shared across all modules | Tax determined on a sale and on a purchase uses one engine, verified differentially | OPEN |
| **P4-037** | Attachment and document management | P4-024 | Attachments on any document with scanning, retention, permissions and full-text indexing | An attachment inherits its document's permissions exactly, proven by test | OPEN |
| **P4-038** | Audit trail for business data | P4-030 | Field-level change history on business records with actor, time, reason and retention | Every change to a business record is attributable. History is immutable by any application path | OPEN |
| **P4-039** | Comments, mentions and collaboration | P4-024 | Threaded discussion on documents with mentions, notifications and permission inheritance | A comment is visible to exactly those who may see its document | OPEN |
| **P4-040** | Notifications and alerts | P4-022 | Business-event-driven notification with preferences, digests and escalation | A notification reaches only principals permitted to see its subject document | OPEN |
| **P4-041** | Master-data change governance | P4-032 | Approval workflows on sensitive master-data changes such as bank details and prices | A bank-detail change requires approval and notifies, proven by test | OPEN |
| **P4-042** | Import framework | P4-033 | Shared import with mapping, validation preview, dry run, execution and rollback | A dry run's reported outcome equals the executed outcome exactly. Imports never partially apply | OPEN |
| **P4-043** | Export and reporting substrate | P4-030 | Shared export honouring permissions, with formats and scheduled delivery | A user exports only what they may read, proven by two-subject test | OPEN |
| **P4-044** | Print and document output | P4-024 | Templated, localised, deterministic document output — invoices, orders, statements | Two generations of one document are byte-identical. Every template exists per supported locale | OPEN |
| **P4-045** | Saved views, filters and personalisation | P4-015 | Shared list infrastructure with saved views, sharing and per-user defaults | A shared view respects the viewer's permissions, never the sharer's, proven by test | OPEN |
| **P4-046** | Bulk operations framework | P4-033 | Shared bulk edit, post, approve and delete with per-row outcome and partial-failure reporting | A bulk operation reports exactly which rows failed and why, and commits the rest | OPEN |
| **P4-047** | Background job framework | P4-023 | Shared scheduling, queuing, retry, dead-letter and visibility for long-running business jobs | A failed job is visible, diagnosable and retryable without database access | OPEN |
| **P4-048** | Data archival and retention | P4-038 | Per-entity retention with legal hold and archival that preserves reportability | Archived data remains reportable for statutory periods. Purge honours holds, proven by test | OPEN |
| **P4-049** | Multi-entity and organisational model | P4-027 | Legal entities, business units, branches and their posting and reporting relationships | A user scoped to one entity sees **zero** rows from another, proven by test | OPEN |
| **P4-050** | Intercompany framework | P4-049 | Intercompany transactions with automatic mirroring, reconciliation and elimination markers | An intercompany transaction produces balanced entries in both entities atomically | OPEN |
| **P4-051** | Extension and plugin seam | P4-021 | The declared points at which extensions modify behaviour, with contracts and no core forking | An extension cannot modify core behaviour outside a declared seam, proven by an escape test | OPEN |
| **P4-052** | Kernel conformance suite | P4-034 | A suite every module must pass: document model, numbering, period control, posting, reversal, dimensions, permissions, isolation | A module failing kernel conformance cannot be marked done. The suite fails when a kernel guarantee is weakened | OPEN |

---

## 7. Stage C · Master data (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-053** | Chart of accounts | P4-028 | Account master with types, hierarchies, control accounts, blocking and per-entity variation | A posting to a blocked or control account is refused per its rules, proven per rule | OPEN |
| **P4-054** | Account determination and posting profiles | P4-053 | Rule-driven account determination for every automatic posting across modules | Every automatic posting's account is derivable from configuration, never hardcoded — a hardcoded account fails a gate | OPEN |
| **P4-055** | Business partner model | P4-024 | Unified partner master with customer, supplier, employee and other roles on one entity | One legal entity acting as both customer and supplier is a single partner, proven by fixture | OPEN |
| **P4-056** | Partner addresses, contacts and communication | P4-055 | Multiple addresses and contacts per partner with purposes and validity periods | A shipping address change does not retroactively alter posted documents, proven by test | OPEN |
| **P4-057** | Partner banking and payment data | P4-041 | Bank accounts, payment methods and terms per partner, with change governance | A bank-detail change is approved, audited and notified before taking effect | OPEN |
| **P4-058** | Credit management | P4-055 | Credit limits, exposure calculation, blocking and release workflow | An order exceeding available credit is blocked, and exposure is computed from real open items | OPEN |
| **P4-059** | Item and product master | P4-024 | Item master with types, units, categories, valuation method, tax and per-entity settings | An item without a valuation method cannot be transacted, enforced at posting | OPEN |
| **P4-060** | Units of measure and conversion | P4-059 | UoM classes, conversions, precision and rounding, applied consistently | A conversion round-trip preserves quantity within declared precision, proven across UoM classes | OPEN |
| **P4-061** | Item variants and configuration | P4-059 | Variant matrices and configurable items with attribute-driven generation | A variant is transactable, costable and stockable identically to a base item | OPEN |
| **P4-062** | Item categorisation and hierarchies | P4-059 | Product groups, categories and classification driving defaults and reporting | A category change updates defaults prospectively and never retroactively alters postings | OPEN |
| **P4-063** | Pricing master and price determination | P4-059 | Price lists, scales, customer-specific pricing, promotions and a determination sequence | A determined price is explainable: the system names which rule supplied it, and the explanation matches | OPEN |
| **P4-064** | Discount and rebate agreements | P4-063 | Discount structures, rebate agreements, accruals and settlement | A rebate accrues on each qualifying transaction and settles to the exact accrued amount | OPEN |
| **P4-065** | Tax master data | P4-036 | Tax codes, rates with validity periods, jurisdiction assignment and partner tax status | A rate change applies from its validity date and never retroactively, proven by test | OPEN |
| **P4-066** | Payment terms | P4-057 | Terms with due-date calculation, discounts, instalments and calendars | A due date computed on a term matches hand calculation across an edge-case fixture set | OPEN |
| **P4-067** | Employee master | P4-055 | Employee records with organisational assignment, effective dating and personal-data classification | Every personal-data field is classified and encrypted per classification, verified by inspection | OPEN |
| **P4-068** | Organisational structure | P4-049 | Departments, positions, cost-centre assignment and reporting lines, effective-dated | A reorganisation is effective-dated and historical reporting stays correct, proven by test | OPEN |
| **P4-069** | Warehouse, location and site master | P4-049 | Sites, warehouses, zones and bins with capacity and behaviour | Stock cannot exist at an undefined location, enforced at posting | OPEN |
| **P4-070** | Asset master | P4-059 | Fixed-asset master with classes, depreciation methods and cost-centre assignment | An asset without a depreciation method cannot be capitalised | OPEN |
| **P4-071** | Master-data quality and duplicate prevention | P4-055 | Matching rules, duplicate detection, merge with relationship preservation and full audit | A merge preserves every relationship from both records with an auditable trail | OPEN |
| **P4-072** | Master-data lifecycle and blocking | P4-055 | Creation, approval, blocking, archival and deletion with referential safety | Deleting master data referenced by a posted document is impossible, enforced at the database level | OPEN |
| **P4-073** | Effective dating framework | P4-068 | Shared effective-dated master data with as-of querying | An as-of query returns the state at that date exactly, proven across a multi-year fixture | OPEN |
| **P4-074** | Master-data import and migration | P4-042 | Bulk onboarding with mapping, validation, dry run and rollback for every master entity | A full master-data load is rehearsable and rolls back completely on failure | OPEN |
| **P4-075** | Master-data permissions and field security | P4-011 | Per-entity and per-field permissions, including on sensitive banking and personal data | A user without permission cannot read a bank detail — it is absent from the payload, not masked | OPEN |
| **P4-076** | Master-data search and lookup performance | P4-017 | Fast lookup across large master datasets, powering every document's pickers | Partner and item lookup meet the interaction budget at 1 million records, measured | OPEN |
| **P4-077** | Master-data APIs and integration | P4-051 | Full CRUD APIs with the same validation and audit as the UI | Every master-data capability is available by API. A UI-only capability fails the parity test | OPEN |
| **P4-078** | Stage C proof | P4-073 | A suite asserting master-data integrity, effective dating, duplicate prevention and referential safety across the fixture estate | Every invariant holds, and a deliberately removed referential guard is caught immediately | OPEN |

---

## 8. Stage D · The financial core (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-079** | General ledger and the journal | P4-054 | The universal journal: every posting a balanced set of entries with dimensions, currencies and source link | An unbalanced journal cannot be written, enforced at the database level, proven by direct SQL attempt | OPEN |
| **P4-080** | Balance computation and storage | P4-079 | Account balances by period, dimension and currency, maintained incrementally and reproducible from entries | Stored balances equal recomputation from entries exactly, asserted continuously | OPEN |
| **P4-081** | Manual journal entry | P4-079 | Journal entry with templates, recurring entries, reversal scheduling and approval | A manual journal is subject to the same balance, period and dimension rules as an automatic one | OPEN |
| **P4-082** | Journal import and integration posting | P4-042 | Bulk journal import with validation, dry run and per-line error attribution | An import posts completely or not at all, with per-line diagnostics on failure | OPEN |
| **P4-083** | Accruals, deferrals and provisions | P4-081 | Accrual schedules with automatic reversal and provision management | An accrual reverses on schedule exactly once, proven across period boundaries | OPEN |
| **P4-084** | Foreign-currency revaluation | P4-035 | Period-end revaluation of monetary balances with correct gain and loss posting | Revaluation matches hand computation across a multi-currency fixture set | OPEN |
| **P4-085** | Allocations and distributions | P4-028 | Rule-based allocation of costs across dimensions with cycles and reversal | An allocation cycle resolves deterministically and is fully reversible | OPEN |
| **P4-086** | Consolidation | P4-050 | Multi-entity consolidation with translation, elimination and minority interest | Consolidated statements reconcile to entity statements after eliminations, asserted by report | OPEN |
| **P4-087** | Accounts payable — invoice processing | P4-055 | Supplier invoice entry, matching, validation, approval and posting | An invoice posts to the correct accounts with tax, dimensions and terms derived, never entered twice | OPEN |
| **P4-088** | Three-way matching | P4-087 | Matching invoice to purchase order and goods receipt with tolerance rules and exception handling | A mismatch beyond tolerance blocks payment and routes to exception handling, proven per mismatch type | OPEN |
| **P4-089** | AP open-item management | P4-087 | Open items, ageing, partial payment, credit notes and clearing | The AP subledger total equals its GL control account exactly, asserted continuously | OPEN |
| **P4-090** | Payment proposal and execution | P4-089 | Payment run with selection, discount optimisation, approval, and file or API execution | A payment run pays exactly the selected items once, proven under induced failure mid-run | OPEN |
| **P4-091** | Payment file formats and banking integration | P4-090 | ISO 20022, local formats and bank APIs with acknowledgement and rejection handling | A rejected payment reopens its item and is never double-paid, proven by test | OPEN |
| **P4-092** | Supplier prepayments and advances | P4-089 | Down payments, advance clearing and their tax treatment | An advance clears against its invoice with correct tax handling, verified per jurisdiction fixture | OPEN |
| **P4-093** | Expense management | P4-087 | Employee expense capture, policy validation, approval, reimbursement and posting | An out-of-policy expense is blocked or flagged per policy, and reimbursement posts through AP | OPEN |
| **P4-094** | Accounts receivable — invoicing | P4-055 | Customer invoice creation from source documents with tax, terms and dimensions | An invoice's amounts derive from its source document exactly, with no re-entry | OPEN |
| **P4-095** | AR open-item management | P4-094 | Open items, ageing, partial receipt, credit notes and clearing | The AR subledger total equals its GL control account exactly, asserted continuously | OPEN |
| **P4-096** | Cash application and receipt matching | P4-095 | Receipt entry, automatic matching, remittance parsing and exception handling | An automatically matched receipt is correct, and an ambiguous one routes to exception rather than guessing | OPEN |
| **P4-097** | Collections and dunning | P4-095 | Dunning levels, correspondence, promise-to-pay and escalation | A dunning run corresponds exactly once per level per item, proven by test | OPEN |
| **P4-098** | Customer prepayments and deposits | P4-095 | Advance receipts, deposit handling and their tax treatment | A deposit clears against its invoice with correct tax handling, verified per jurisdiction | OPEN |
| **P4-099** | Bad debt and write-off | P4-095 | Provisioning, write-off, recovery and their statutory treatment | A write-off posts per policy and a recovery reverses it correctly, proven by test | OPEN |
| **P4-100** | Bank account and cash management | P4-057 | Bank master, cash positions, transfers and cash forecasting | The cash position reconciles to bank balances and to the GL, asserted continuously | OPEN |
| **P4-101** | Bank statement import and reconciliation | P4-100 | Statement import, automatic matching, rules and manual reconciliation | A reconciled period's bank balance equals the GL bank balance exactly, enforced before close | OPEN |
| **P4-102** | Petty cash and cash desk | P4-100 | Cash journals with counting, reconciliation and denomination handling | A cash journal balances and its differences are posted, never absorbed silently | OPEN |
| **P4-103** | Payment gateways and card acceptance | P4-100 | Card, wallet and online payment acceptance with settlement reconciliation | Every accepted payment reconciles to a settlement record. An unreconciled payment alerts | OPEN |
| **P4-104** | Treasury and liquidity | P4-100 | Cash pooling, in-house cash, borrowing and investment tracking | Liquidity forecasts reconcile to open items and to committed cash flows | OPEN |
| **P4-105** | Fixed asset acquisition and capitalisation | P4-070 | Acquisition from purchase, construction or transfer with capitalisation rules | An asset's acquisition value traces to its source document exactly | OPEN |
| **P4-106** | Depreciation | P4-105 | Depreciation methods, multiple books, mid-period conventions and catch-up | Depreciation matches hand computation for every method across a multi-year fixture set | OPEN |
| **P4-107** | Asset transfer, revaluation and impairment | P4-106 | Transfers between entities and cost centres, revaluation and impairment | Every asset event posts correctly in every book, verified per book | OPEN |
| **P4-108** | Asset disposal and retirement | P4-106 | Sale, scrapping and partial retirement with gain and loss calculation | Disposal gain or loss matches hand computation including partial retirement | OPEN |
| **P4-109** | Lease accounting | P4-105 | Lease classification, right-of-use assets, liability and interest unwinding | Lease schedules match hand computation and post correctly across the term | OPEN |
| **P4-110** | Asset counting and verification | P4-105 | Physical asset verification with discrepancy handling | A verification discrepancy posts an adjustment with an audit trail, never a silent correction | OPEN |
| **P4-111** | Withholding tax | P4-036 | Withholding determination, certificates and reporting across AP and AR | Withholding matches jurisdiction rules and reconciles to remittance, verified per fixture | OPEN |
| **P4-112** | Indirect tax posting and reporting | P4-036 | VAT/GST posting, input and output accounts, and return preparation | Tax posted equals tax reported equals tax remitted, asserted by reconciliation | OPEN |
| **P4-113** | Tax reporting and statutory returns | P4-112 | Jurisdictional returns generated from posted data with reconciliation | A return reconciles to the ledger exactly and is reproducible from posted entries | OPEN |
| **P4-114** | Electronic invoicing and fiscal compliance | P4-094 | E-invoicing formats, clearance models and fiscal device integration where required | A cleared invoice's fiscal reference is stored and reproducible. A clearance failure blocks issuance | OPEN |
| **P4-115** | Financial statement generation | P4-080 | Balance sheet, income statement and cash flow generated from the ledger with a defined structure | Statements balance and reconcile to trial balance exactly, asserted by test | OPEN |
| **P4-116** | Trial balance and reconciliation reports | P4-080 | Trial balance by period, entity, dimension and currency, with drill-through | The trial balance sums to zero for every period and entity, asserted continuously | OPEN |
| **P4-117** | Subledger-to-ledger reconciliation | P4-089 | Continuous reconciliation of AP, AR, inventory, assets and payroll to their control accounts | Any subledger divergence is detected within the stated window and alerts. A seeded divergence is always caught | OPEN |
| **P4-118** | Financial drill-through | P4-030 | The UX-5 mechanism: any figure drillable to entries, to documents, to source and to authoriser | No figure on any financial screen is a dead end, verified across the report estate | OPEN |
| **P4-119** | Ledger performance at volume | P4-080 | Posting and balance queries within budget at production ledger volume | Posting throughput and balance query latency meet targets at 100 million entries, measured | OPEN |
| **P4-120** | Financial permissions and data scope | P4-075 | Entity, account, dimension and document-level permissions on financial data | A user scoped to one entity or cost centre sees **zero** rows outside it, proven by test | OPEN |
| **P4-121** | Financial audit trail | P4-038 | Complete, immutable audit over financial postings, master data and configuration | Every posted entry's full history is reconstructible. No application path can alter it | OPEN |
| **P4-122** | Auditor access and extraction | P4-121 | Read-only auditor access with standard audit-file extraction formats | An audit-file extraction reconciles to the ledger exactly and is generated, not assembled | OPEN |
| **P4-123** | Financial data isolation | P4-005 | Strict tenant and entity isolation across every financial table and report | Two-tenant tests prove **zero** rows across every financial surface | OPEN |
| **P4-124** | Stage D financial correctness proof | P4-117 | A property-based suite generating transaction sequences and asserting the ledger balances, subledgers reconcile and every entry traces to source | No invariant violation across 10,000 generated sequences, and immediate detection when one is weakened | OPEN |

---

## 9. Stage E · Controlling, costing and budgeting (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-125** | Cost centre accounting | P4-028 | Cost centre master, planning, actual posting and variance | Every cost posting carries a cost centre where required, enforced at posting | OPEN |
| **P4-126** | Cost element and cost type structure | P4-054 | Primary and secondary cost elements with their relationship to the chart of accounts | Every cost flow is traceable to a cost element, asserted across the fixture estate | OPEN |
| **P4-127** | Internal orders and cost collectors | P4-125 | Internal orders for capturing and settling costs | An internal order settles completely to its receiver, leaving no residual balance | OPEN |
| **P4-128** | Profit centre accounting | P4-125 | Profit centre structure, transfer pricing and internal profit measurement | Profit centre results consolidate to entity results exactly | OPEN |
| **P4-129** | Profitability analysis | P4-128 | Contribution margin by product, customer, region and channel | Profitability figures reconcile to the income statement, asserted by reconciliation | OPEN |
| **P4-130** | Standard costing | P4-059 | Standard cost estimation, release, and variance categories | A standard cost release is versioned and effective-dated, never retroactive | OPEN |
| **P4-131** | Actual costing and material ledger | P4-130 | Actual cost determination with periodic revaluation of inventory and consumption | Actual costing reconciles inventory value to the ledger exactly, per period | OPEN |
| **P4-132** | Variance analysis | P4-130 | Price, quantity, mix, rate and efficiency variances with settlement | Variances sum to the difference between standard and actual exactly, asserted by test | OPEN |
| **P4-133** | Activity-based costing | P4-126 | Activity types, rates and driver-based allocation | An ABC allocation is deterministic, reversible and reconciles to total cost | OPEN |
| **P4-134** | Overhead allocation and absorption | P4-085 | Overhead rates, absorption and under/over-absorption treatment | Absorbed overhead plus variance equals actual overhead exactly, asserted per period | OPEN |
| **P4-135** | Budget model and structure | P4-125 | Budget versions, hierarchies, periods and dimensions | A budget version is immutable once approved. A change is a new version, enforced | OPEN |
| **P4-136** | Budget planning and workflow | P4-135 | Distributed planning with submission, review, consolidation and approval | A budget cycle completes with every contributor's submission attributable and auditable | OPEN |
| **P4-137** | Budget control and commitment | P4-135 | Availability checking on purchase and posting with configurable tolerance and blocking | A posting exceeding available budget is blocked or warned per configuration, from every path | OPEN |
| **P4-138** | Encumbrance and commitment accounting | P4-137 | Commitments from requisitions and orders, released on receipt and invoice | Commitment plus actual never exceeds the budget where control is active, asserted continuously | OPEN |
| **P4-139** | Forecasting and rolling plans | P4-135 | Rolling forecasts with actuals integration and variance-to-plan | A forecast's actual component always equals posted actuals for elapsed periods | OPEN |
| **P4-140** | Statistical key figures and drivers | P4-133 | Non-financial measures driving allocation and analysis | A driver value is auditable and its effect on allocation is reproducible | OPEN |
| **P4-141** | Transfer pricing | P4-128 | Intercompany and inter-profit-centre transfer pricing with elimination | Transfer pricing eliminates completely on consolidation, asserted by test | OPEN |
| **P4-142** | Project and job costing | P4-127 | Cost capture, work-in-progress and settlement for projects and jobs | Project WIP reconciles to the ledger and settles completely at closure | OPEN |
| **P4-143** | Cost planning and simulation | P4-130 | What-if simulation of cost structures without affecting actuals | A simulation is provably side-effect-free, verified by comparison before and after | OPEN |
| **P4-144** | Management reporting | P4-129 | Management views by dimension with drill-through to source | Every management figure drills to its entries and documents | OPEN |
| **P4-145** | Controlling period close | P4-027 | Period-end allocations, settlements and revaluations executed in a controlled sequence | A controlling close leaves no unsettled order and no unallocated cost, asserted before close | OPEN |
| **P4-146** | Controlling reconciliation to financials | P4-117 | Reconciliation between controlling and financial accounting | Controlling totals reconcile to the ledger exactly, and divergence alerts | OPEN |
| **P4-147** | Controlling permissions | P4-120 | Cost centre, profit centre and budget-level permissions | A cost centre manager sees **zero** rows from another cost centre, proven by test | OPEN |
| **P4-148** | Stage E proof | P4-146 | A suite asserting cost flows are complete, allocations reversible, variances sum correctly and controlling reconciles to financials | Every invariant holds, and a deliberately altered allocation rule is caught by reconciliation | OPEN |

---

## 10. Stage F · Order-to-cash (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-149** | Lead and opportunity management | P4-055 | Pipeline with stages, forecasting, activities and conversion to quotation | An opportunity converts to a quotation carrying its terms, with no re-entry | OPEN |
| **P4-150** | Quotation management | P4-063 | Quotations with pricing, validity, versioning and conversion to order | A quotation converts at its quoted price within validity, and expires exactly as declared | OPEN |
| **P4-151** | Sales contracts and agreements | P4-150 | Framework agreements, call-offs, committed volumes and release orders | A call-off cannot exceed its contract's committed quantity, enforced at order entry | OPEN |
| **P4-152** | Sales order management | P4-150 | Order entry with pricing, availability, credit check, dimensions and scheduling | An order failing credit or availability is blocked per configuration, with the reason named | OPEN |
| **P4-153** | Available-to-promise and allocation | P4-069 | ATP checking against stock, receipts and production with allocation and reservation | A confirmed date is achievable against real supply, verified against the supply fixture | OPEN |
| **P4-154** | Order change management | P4-152 | Amendments with version history, downstream effect and re-pricing rules | An amendment after partial delivery handles the delivered portion correctly, proven by test | OPEN |
| **P4-155** | Order approval and blocking | P4-032 | Credit, price, margin and delivery blocks with release workflow | A blocked order cannot progress until released by an authorised principal | OPEN |
| **P4-156** | Delivery and shipment | P4-153 | Delivery documents, picking, packing and goods issue with stock and cost effects | A goods issue posts stock and cost of goods sold atomically, proven by injection | OPEN |
| **P4-157** | Shipping, carriers and freight | P4-156 | Carrier selection, rating, labelling, tracking and freight cost | Freight cost posts to the correct accounts and is attributable to its shipment | OPEN |
| **P4-158** | Billing and invoice generation | P4-094 | Invoicing from deliveries or orders with consolidation, splitting and schedules | An invoice's quantities and values derive exactly from its source documents | OPEN |
| **P4-159** | Billing plans and milestone billing | P4-158 | Periodic, milestone and progress billing with schedules | A milestone bills exactly once on achievement, proven by test | OPEN |
| **P4-160** | Subscription and recurring revenue | P4-158 | Recurring billing with proration, changes and revenue schedules | A mid-period change prorates exactly as declared, verified against hand computation | OPEN |
| **P4-161** | Revenue recognition | P4-160 | Performance obligations, allocation and recognition schedules | Recognised revenue reconciles to invoiced revenue and to obligations, asserted by report | OPEN |
| **P4-162** | Returns and reverse logistics | P4-156 | Return authorisation, receipt, inspection, disposition and credit | A return credits the correct amount and restores stock at the correct value, proven by test | OPEN |
| **P4-163** | Complaints, claims and credits | P4-162 | Customer complaints with investigation, resolution and credit issuance | Every credit traces to an authorised claim with a reason code | OPEN |
| **P4-164** | Consignment and vendor-managed inventory | P4-153 | Consignment stock at customer sites with settlement on consumption | Consignment stock is owned and valued correctly until consumption, asserted by report | OPEN |
| **P4-165** | Commission and incentive calculation | P4-129 | Sales commission on defined events with accrual and settlement | Commission accrues on the qualifying event and settles to the exact accrued amount | OPEN |
| **P4-166** | Sales pricing execution | P4-063 | Price determination at order entry with the full condition sequence and manual override control | Every determined price is explainable, and a manual override requires authority and is audited | OPEN |
| **P4-167** | Customer portal and self-service ordering | P4-152 | Customer-facing ordering, order status, documents and payment | A customer sees **zero** rows belonging to another customer, proven by test | OPEN |
| **P4-168** | E-commerce order integration | P4-152 | Storefront orders flowing into the order pipeline with payment and fulfilment | An e-commerce order becomes a standard sales order with no parallel pipeline, proven by architecture test | OPEN |
| **P4-169** | Point-of-sale integration | P4-152 | POS transactions posting to inventory, revenue and cash correctly, including offline capture | An offline POS sale posts correctly on reconnect with no duplication, proven by test | OPEN |
| **P4-170** | Sales analytics | P4-129 | Bookings, billings, backlog, margin and pipeline analysis with drill-through | Sales figures reconcile to documents and to the ledger exactly | OPEN |
| **P4-171** | Customer service and case management | P4-055 | Cases linked to orders, deliveries, invoices and products with SLA | A case's SLA is measured and breaches escalate, proven by test | OPEN |
| **P4-172** | Sales document output and correspondence | P4-044 | Order confirmations, delivery notes, invoices and statements — templated and localised | Every document type exists in every supported locale and generates deterministically | OPEN |
| **P4-173** | Sales tax determination in the cycle | P4-036 | Tax determined at quotation, order and invoice consistently | Tax at quotation equals tax at invoice for unchanged terms, verified differentially | OPEN |
| **P4-174** | Export, customs and trade documentation | P4-157 | Export declarations, certificates of origin and restricted-party screening | A restricted-party order is blocked before shipment, enforced mechanically | OPEN |
| **P4-175** | Order-to-cash performance | P4-017 | Order entry, ATP and invoicing within budget at volume | Order entry and ATP meet the interaction budget on a production-scale dataset, measured | OPEN |
| **P4-176** | Order-to-cash permissions | P4-120 | Sales organisation, customer and document-level permissions | A sales user sees **zero** rows outside their assigned scope, proven by test | OPEN |
| **P4-177** | High-volume order entry UX | P4-016 | Keyboard-complete order entry with line grids, fast lookup and defaulting | A 20-line order is entered without the mouse within the time budget, measured | OPEN |
| **P4-178** | Order-to-cash accessibility | P4-018 | WCAG 2.2 AA across quotation, order, delivery and invoice surfaces | Every order-to-cash surface is `axe` clean and keyboard-complete | OPEN |
| **P4-179** | Order-to-cash integration events | P4-022 | Events for order, delivery, invoice and payment consumed by other modules through the outbox | No order-to-cash module directly imports another module's service, enforced by gate | OPEN |
| **P4-180** | Stage F proof | P4-158 | An end-to-end suite from quotation through cash receipt asserting stock, cost, revenue and receivable effects at each step | The cycle is complete and balanced at every step, and a deliberately skipped cost posting is caught | OPEN |

---

## 11. Stage G · Procure-to-pay (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-181** | Purchase requisition | P4-137 | Requisition with budget check, approval and conversion to order | A requisition exceeding available budget is blocked or warned per configuration | OPEN |
| **P4-182** | Sourcing and request for quotation | P4-181 | RFQ issue, supplier response capture, comparison and award | An award traces to its RFQ, responses and comparison, auditable end to end | OPEN |
| **P4-183** | Supplier evaluation and qualification | P4-055 | Supplier onboarding, qualification, scoring and approved-supplier lists | An order to an unapproved supplier is blocked where policy requires it | OPEN |
| **P4-184** | Purchase contracts and agreements | P4-182 | Framework agreements, committed volumes, pricing and release orders | A release cannot exceed its contract's committed quantity, enforced at order entry | OPEN |
| **P4-185** | Purchase order management | P4-181 | Order creation, pricing, delivery scheduling, dimensions and approval | An order's account assignment and dimensions are derived, never hand-entered where derivable | OPEN |
| **P4-186** | Purchase order change and cancellation | P4-185 | Amendments with version history, supplier communication and downstream effect | An amendment after partial receipt handles the received portion correctly, proven by test | OPEN |
| **P4-187** | Goods receipt | P4-185 | Receipt against order with quantity, quality, tolerance and stock posting | A receipt posts stock and the GR/IR account atomically, proven by injection | OPEN |
| **P4-188** | Service entry and confirmation | P4-185 | Service receipt and confirmation for non-stock procurement with approval | A service entry posts cost with correct dimensions and is approvable independently | OPEN |
| **P4-189** | GR/IR clearing | P4-187 | Goods-received/invoice-received reconciliation and clearing with ageing | The GR/IR account clears completely for matched transactions, asserted continuously | OPEN |
| **P4-190** | Invoice verification | P4-088 | Supplier invoice verification with three-way matching, tolerance and exception handling | An invoice outside tolerance blocks payment and routes to exception, proven per mismatch type | OPEN |
| **P4-191** | Landed cost | P4-187 | Freight, duty, insurance and handling apportioned into inventory value | Landed cost apportions completely to receipts and reconciles to inventory value | OPEN |
| **P4-192** | Subcontracting | P4-187 | Provision of components to subcontractors and receipt of finished goods | Subcontracted stock ownership and valuation are correct at every stage, asserted by report | OPEN |
| **P4-193** | Consignment procurement | P4-187 | Supplier consignment stock with settlement on consumption | Consignment stock is not owned until consumption, asserted in inventory valuation | OPEN |
| **P4-194** | Procurement of services and expenses | P4-188 | Non-stock and service procurement with cost-centre and project assignment | Service procurement posts to controlling correctly with full dimension assignment | OPEN |
| **P4-195** | Supplier collaboration portal | P4-183 | Supplier-facing order confirmation, delivery notification, invoice submission and status | A supplier sees **zero** rows belonging to another supplier, proven by test | OPEN |
| **P4-196** | Supplier invoice automation | P4-190 | Electronic invoice receipt, OCR extraction and automated matching with confidence routing | A low-confidence extraction routes to review rather than posting, proven by test | OPEN |
| **P4-197** | Procurement approval hierarchy | P4-032 | Value-based, category-based and delegated approval with segregation of duties | An approver cannot approve their own requisition, enforced mechanically | OPEN |
| **P4-198** | Procurement analytics | P4-129 | Spend analysis, supplier performance, savings and contract compliance | Spend figures reconcile to posted documents exactly | OPEN |
| **P4-199** | Supplier performance and scorecards | P4-183 | On-time delivery, quality and price performance measured from real transactions | Every score derives from posted transactions, not from manual entry | OPEN |
| **P4-200** | Contract compliance and maverick spend | P4-184 | Detecting off-contract purchasing and enforcing contract usage | Off-contract spend is detected and reported, and blockable where policy requires | OPEN |
| **P4-201** | Purchase pricing and conditions | P4-063 | Purchase price determination with conditions, scales and supplier agreements | Every determined purchase price is explainable and matches the agreement | OPEN |
| **P4-202** | Procurement tax handling | P4-036 | Input tax determination, deductibility and reverse charge on purchases | Input tax posts to the correct accounts per jurisdiction, verified per fixture | OPEN |
| **P4-203** | Import, customs and duty | P4-191 | Import declarations, duty calculation and their inclusion in landed cost | Duty flows into inventory value correctly and reconciles to customs documentation | OPEN |
| **P4-204** | Procurement document output | P4-044 | Purchase orders, RFQs and remittance advices — templated and localised | Every document type exists in every supported locale and generates deterministically | OPEN |
| **P4-205** | Procurement permissions | P4-120 | Purchasing organisation, category and value-level permissions | A buyer sees **zero** rows outside their assigned scope, proven by test | OPEN |
| **P4-206** | High-volume invoice entry UX | P4-016 | Keyboard-complete supplier invoice entry with matching assistance | An AP clerk enters and matches an invoice without the mouse within the time budget | OPEN |
| **P4-207** | Procure-to-pay accessibility | P4-018 | WCAG 2.2 AA across requisition, order, receipt and invoice surfaces | Every procure-to-pay surface is `axe` clean and keyboard-complete | OPEN |
| **P4-208** | Procure-to-pay integration events | P4-022 | Events for requisition, order, receipt, invoice and payment through the outbox | No procure-to-pay module directly imports another module's service, enforced by gate | OPEN |
| **P4-209** | Procurement fraud controls | P4-012 | Duplicate invoice detection, bank-detail change controls and supplier verification | A duplicate invoice is detected before payment. A seeded fraud pattern is caught | OPEN |
| **P4-210** | Stage G proof | P4-189 | An end-to-end suite from requisition through payment asserting budget, stock, GR/IR, tax and payable effects at each step | The cycle is complete and balanced, and a deliberately skipped GR/IR clearing is caught | OPEN |

---

## 12. Stage H · Inventory and warehouse (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-211** | Stock model and movement types | P4-069 | Stock by item, location, batch, serial and status, with a typed movement catalogue | Stock cannot change except through a typed movement, enforced at the database level | OPEN |
| **P4-212** | Inventory valuation methods | P4-131 | FIFO, weighted average, standard and specific identification with correct layer handling | Each method's valuation matches hand computation across a multi-period fixture set | OPEN |
| **P4-213** | Stock-to-ledger reconciliation | P4-117 | Continuous reconciliation of inventory value to the GL inventory accounts | Inventory value equals the ledger control account exactly, asserted continuously | OPEN |
| **P4-214** | Batch and lot management | P4-211 | Batch creation, characteristics, expiry, status and traceability | A batch is traceable from receipt to consumption in both directions, proven by test | OPEN |
| **P4-215** | Serial number management | P4-211 | Serial tracking through receipt, movement, sale, service and return | A serial number's complete history is reconstructible, asserted across the fixture estate | OPEN |
| **P4-216** | Stock status and quality holds | P4-211 | Unrestricted, quality-inspection, blocked and returns statuses with transition rules | Blocked stock cannot be issued to a customer, enforced at posting from every path | OPEN |
| **P4-217** | Goods movements and transfers | P4-211 | Transfers between locations, entities and statuses with in-transit handling | In-transit stock is owned and valued correctly and never double-counted, asserted by report | OPEN |
| **P4-218** | Physical inventory and cycle counting | P4-211 | Count documents, counting methods, variance approval and adjustment posting | A count variance posts an adjustment with approval and an audit trail, never silently | OPEN |
| **P4-219** | Inventory adjustments and write-offs | P4-218 | Scrapping, write-down and adjustment with reason codes and approval | Every adjustment carries a reason code and an authoriser, enforced at posting | OPEN |
| **P4-220** | Warehouse structure and bin management | P4-069 | Zones, aisles, bins, capacity and putaway/removal strategies | Stock cannot exceed a bin's declared capacity where capacity control is active | OPEN |
| **P4-221** | Putaway and receiving processes | P4-187 | Directed putaway with strategies, confirmation and exception handling | A receipt reaches its bin with a confirmed movement, and exceptions route rather than fail silently | OPEN |
| **P4-222** | Picking, packing and shipping processes | P4-156 | Wave, batch and zone picking with confirmation, packing and staging | A pick confirms against real stock and a shortage routes to exception, proven by test | OPEN |
| **P4-223** | Warehouse task management | P4-221 | Task generation, assignment, prioritisation and confirmation | A task is assigned, confirmed and auditable; an abandoned task is detected and reassigned | OPEN |
| **P4-224** | Barcode, scanning and mobile warehouse | P4-223 | Scanner-driven execution with validation, offline capture and reconciliation | A scan-driven movement posts identically to a keyed one, verified differentially | OPEN |
| **P4-225** | Cross-docking and flow-through | P4-221 | Direct receipt-to-shipment handling without putaway | A cross-docked receipt reaches shipment with correct stock and cost effects | OPEN |
| **P4-226** | Kitting and light assembly | P4-211 | Assembly and disassembly of kits with component consumption and cost roll-up | A kit's cost equals its components' cost plus declared additions, asserted by test | OPEN |
| **P4-227** | Replenishment and reordering | P4-153 | Reorder points, min-max, forecast-based and Kanban replenishment | A replenishment proposal is derivable from real demand and stock, never from a static list | OPEN |
| **P4-228** | Demand planning and forecasting | P4-227 | Statistical forecasting with history, seasonality and manual override | A forecast's inputs and method are auditable, and an override is attributed | OPEN |
| **P4-229** | Safety stock and service-level planning | P4-227 | Safety stock calculation from variability and target service level | Safety stock recomputes from real demand variability, verified against hand computation | OPEN |
| **P4-230** | Multi-location and network inventory | P4-217 | Network-wide visibility, rebalancing and location-specific planning | Network stock totals equal the sum of locations exactly, asserted continuously | OPEN |
| **P4-231** | Inventory ageing and obsolescence | P4-212 | Ageing analysis, slow-moving detection and obsolescence provisioning | An obsolescence provision posts per policy from real ageing data | OPEN |
| **P4-232** | Traceability and recall | P4-214 | Forward and backward traceability for recall, with affected-party identification | A recall identifies every affected batch, customer and document within the stated window | OPEN |
| **P4-233** | Inventory analytics | P4-212 | Turnover, coverage, accuracy, fill rate and carrying cost | Inventory metrics reconcile to stock and to the ledger exactly | OPEN |
| **P4-234** | Inventory permissions | P4-120 | Site, warehouse and movement-type permissions | A warehouse user sees **zero** rows from another site, proven by test | OPEN |
| **P4-235** | Inventory performance at volume | P4-017 | Stock queries, availability checks and movement posting within budget at scale | Availability check and movement posting meet targets at 10 million stock records, measured | OPEN |
| **P4-236** | Concurrent stock movement correctness | P4-009 | Correct stock quantities under concurrent issue, receipt and transfer | Concurrent movements on one item produce correct stock with no lost update, proven under parallel load | OPEN |
| **P4-237** | Warehouse UX for operators | P4-016 | Scanner-first, glove-friendly, high-contrast operator surfaces | A warehouse operator completes pick and putaway without a keyboard, verified by exercise | OPEN |
| **P4-238** | Inventory accessibility | P4-018 | WCAG 2.2 AA across inventory and warehouse surfaces including scanner flows | Every surface is `axe` clean and operable by keyboard and screen reader | OPEN |
| **P4-239** | Inventory integration events | P4-022 | Stock movement events consumed by finance, sales, production and planning through the outbox | No inventory module directly imports another module's service, enforced by gate | OPEN |
| **P4-240** | Stage H proof | P4-213 | A suite driving every movement type under concurrency, asserting stock, valuation and ledger agree at every point | Stock, value and ledger agree throughout, and a deliberately altered valuation layer is caught by reconciliation | OPEN |

---

## 13. Stage I · Manufacturing and supply chain (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-241** | Bill of materials | P4-059 | Multi-level BOMs with alternates, validity, scrap and phantom assemblies | A BOM explosion is deterministic and cycle-free; a recursive BOM is refused at save | OPEN |
| **P4-242** | Routings and work centres | P4-241 | Operations, work centres, capacities, setup and run times | A routing's total time is computable and drives both scheduling and costing | OPEN |
| **P4-243** | Product costing from BOM and routing | P4-130 | Cost roll-up through BOM levels with material, labour and overhead | A rolled-up cost equals the sum of its components and operations exactly, asserted per level | OPEN |
| **P4-244** | Production order management | P4-242 | Order creation, release, component reservation, scheduling and confirmation | A production order reserves components and cannot release without availability per configuration | OPEN |
| **P4-245** | Material requirements planning | P4-227 | MRP run over demand, stock, receipts and lead times producing planned orders | An MRP run is reproducible from its inputs and its proposals are explainable per item | OPEN |
| **P4-246** | Capacity planning and scheduling | P4-242 | Finite and infinite capacity scheduling with load levelling | A schedule respects declared capacity constraints where finite scheduling is active | OPEN |
| **P4-247** | Shop-floor execution and confirmation | P4-244 | Operation confirmation, time recording, yield and scrap capture | A confirmation posts consumption, output and cost atomically, proven by injection | OPEN |
| **P4-248** | Work-in-progress valuation | P4-243 | WIP calculation, valuation and settlement at period end | WIP reconciles to the ledger exactly and settles completely at order closure | OPEN |
| **P4-249** | Production variance and settlement | P4-132 | Order variance categories and settlement to stock and controlling | Variances sum to the difference between planned and actual exactly, asserted per order | OPEN |
| **P4-250** | Co-products, by-products and joint costing | P4-243 | Multiple outputs with cost apportionment rules | Apportioned cost sums to total cost exactly across every output | OPEN |
| **P4-251** | Process manufacturing and recipes | P4-241 | Recipe management, batch sizing, scaling and process orders | A scaled recipe's quantities and cost scale correctly, verified against hand computation | OPEN |
| **P4-252** | Repetitive and flow manufacturing | P4-244 | Rate-based production with backflushing and period-based reporting | Backflush consumption reconciles to actual production, and variance is detected | OPEN |
| **P4-253** | Quality management — inspection | P4-216 | Inspection plans, characteristics, sampling, results recording and usage decision | Stock cannot leave inspection status without a recorded usage decision | OPEN |
| **P4-254** | Quality management — non-conformance | P4-253 | Defect recording, non-conformance reports, corrective and preventive action | A non-conformance is traceable to its batch, order and disposition | OPEN |
| **P4-255** | Quality certificates and compliance | P4-253 | Certificates of analysis and conformity generated from real inspection results | A certificate's values derive from recorded results and cannot be hand-entered | OPEN |
| **P4-256** | Maintenance — equipment and asset structure | P4-070 | Functional locations, equipment hierarchy and measurement points | Equipment is linked to its fixed asset and to its cost centre, asserted by report | OPEN |
| **P4-257** | Preventive and predictive maintenance | P4-256 | Maintenance plans by time, counter and condition, generating orders | A maintenance plan generates its orders on schedule and never twice, proven by test | OPEN |
| **P4-258** | Maintenance order execution | P4-257 | Work orders with parts, labour, cost capture and settlement | A maintenance order settles completely to its receiver with no residual balance | OPEN |
| **P4-259** | Supply chain planning | P4-245 | Network planning across sites, suppliers and distribution with constraints | A plan is feasible against declared constraints, and infeasibility is reported not hidden | OPEN |
| **P4-260** | Distribution requirements planning | P4-259 | Multi-echelon replenishment across the distribution network | DRP proposals are explainable per location and reconcile to network demand | OPEN |
| **P4-261** | Supply and demand collaboration | P4-195 | Sharing forecasts and commitments with suppliers and customers under consent | Shared data is scoped to the counterparty exactly, proven by test | OPEN |
| **P4-262** | Transportation management | P4-157 | Shipment planning, consolidation, carrier assignment and freight settlement | Freight cost settles to the correct accounts and reconciles to carrier invoices | OPEN |
| **P4-263** | Manufacturing analytics | P4-249 | OEE, yield, cycle time, scrap and cost per unit from real confirmations | Every manufacturing metric derives from posted confirmations, not from manual entry | OPEN |
| **P4-264** | Manufacturing permissions | P4-120 | Plant, work centre and order-type permissions | A plant user sees **zero** rows from another plant, proven by test | OPEN |
| **P4-265** | Shop-floor UX | P4-016 | Touch-first, glove-friendly confirmation surfaces for operators | An operator confirms an operation without a keyboard, verified by exercise | OPEN |
| **P4-266** | Manufacturing accessibility | P4-018 | WCAG 2.2 AA across manufacturing surfaces including shop-floor terminals | Every surface is `axe` clean and operable by keyboard and screen reader | OPEN |
| **P4-267** | Manufacturing integration events | P4-022 | Production events consumed by inventory, finance, planning and quality through the outbox | No manufacturing module directly imports another module's service, enforced by gate | OPEN |
| **P4-268** | Stage I proof | P4-248 | An end-to-end suite from planning through confirmation and settlement asserting material, cost and ledger effects | The cycle is complete and balanced, and a deliberately skipped WIP settlement is caught | OPEN |

---

## 14. Stage J · Human capital and payroll (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-269** | Employee lifecycle | P4-067 | Hire, transfer, promotion, leave and termination as effective-dated events | An as-of query returns the correct organisational state for any past date, proven by test | OPEN |
| **P4-270** | Position and establishment management | P4-068 | Positions, vacancies, headcount control and budget linkage | A hire into an unbudgeted position is blocked where control is active | OPEN |
| **P4-271** | Recruitment and applicant tracking | P4-270 | Requisitions, applications, stages, interviews and offers | An application converts to an employee record with no re-entry, and personal data is classified throughout | OPEN |
| **P4-272** | Onboarding and offboarding | P4-269 | Task-driven onboarding and offboarding with access provisioning and return of assets | Offboarding revokes every system access within the stated window, proven by test | OPEN |
| **P4-273** | Time and attendance | P4-269 | Clocking, schedules, absence, overtime and their approval | Recorded time reconciles to schedules and feeds payroll and costing without re-entry | OPEN |
| **P4-274** | Leave and absence management | P4-273 | Entitlements, accrual, carry-over, requests and approval | Leave balances accrue per policy and reconcile to entitlement and usage exactly | OPEN |
| **P4-275** | Shift planning and rostering | P4-273 | Shift patterns, rosters, coverage requirements and compliance rules | A roster violating working-time rules is refused, with the rule named | OPEN |
| **P4-276** | Compensation structure | P4-270 | Grades, bands, pay elements and compensation policy | A compensation change is effective-dated, approved and audited, never retroactive without authority | OPEN |
| **P4-277** | Payroll engine | P4-276 | Gross-to-net calculation with earnings, deductions, taxes and contributions | A payroll run's net equals hand computation for every fixture employee and jurisdiction | OPEN |
| **P4-278** | Payroll tax and statutory calculation | P4-277 | Jurisdictional income tax, social contributions and thresholds with validity dating | Statutory calculations match the authority's rules per jurisdiction fixture and per rate-change date | OPEN |
| **P4-279** | Payroll run and control | P4-277 | Simulation, verification, release, posting and reversal of a payroll run | A payroll run is simulatable, reproducible and reversible; a released run cannot be edited | OPEN |
| **P4-280** | Payroll posting to finance | P4-279 | Payroll results posting to the ledger with dimensions and cost distribution | Payroll postings reconcile to payroll results exactly, asserted per run | OPEN |
| **P4-281** | Payroll payments and disbursement | P4-091 | Salary payment files, split payments and third-party remittances | Every payroll payment reconciles to a payroll result and to a bank settlement | OPEN |
| **P4-282** | Retroactive payroll processing | P4-279 | Retroactive changes recalculated across periods with difference posting | A retroactive change produces the exact difference, verified against hand computation | OPEN |
| **P4-283** | Payslips and employee documents | P4-044 | Payslips, tax documents and certificates — templated, localised and securely delivered | A payslip is accessible only to its employee and authorised payroll staff, proven by test | OPEN |
| **P4-284** | Statutory payroll reporting | P4-278 | Jurisdictional payroll returns and filings generated from posted results | A return reconciles to payroll results and to remittance exactly | OPEN |
| **P4-285** | Benefits administration | P4-276 | Benefit plans, enrolment, eligibility, dependants and cost sharing | Benefit deductions reconcile to enrolment and to provider invoices | OPEN |
| **P4-286** | Pension and retirement | P4-285 | Pension schemes, contributions, employer matching and reporting | Contributions match scheme rules and reconcile to remittance, verified per scheme | OPEN |
| **P4-287** | Performance management | P4-269 | Goals, reviews, ratings and calibration with history | A review cycle completes with every rating attributable and auditable | OPEN |
| **P4-288** | Learning and competency | P4-269 | Training records, certifications, expiry and competency mapping | An expired mandatory certification is detected and blocks assignment where policy requires | OPEN |
| **P4-289** | Succession and talent | P4-287 | Succession planning, talent pools and readiness assessment | Talent data is visible only to authorised principals, proven by test | OPEN |
| **P4-290** | Employee self-service | P4-269 | Personal data, leave, expenses, payslips and requests, self-served | An employee sees **zero** rows belonging to another employee, proven by test | OPEN |
| **P4-291** | Manager self-service | P4-290 | Team views, approvals, and team data scoped to the reporting line | A manager sees exactly their reporting line and no wider, proven by test | OPEN |
| **P4-292** | Personal data protection in HCM | P4-067 | Classification, encryption, masking, retention and subject-access handling for employee data | Every personal-data field is encrypted per classification, verified in a database dump | OPEN |
| **P4-293** | HR analytics | P4-269 | Headcount, turnover, cost, diversity and absence analytics with aggregation thresholds | An aggregate over too few employees is suppressed, preventing re-identification, proven by test | OPEN |
| **P4-294** | HCM permissions and confidentiality | P4-075 | Fine-grained permissions over sensitive HR data including compensation and health | Compensation data is unreadable without explicit permission — absent from the payload, not masked | OPEN |
| **P4-295** | HCM accessibility | P4-018 | WCAG 2.2 AA across employee, manager and payroll surfaces | Every HCM surface is `axe` clean and keyboard-complete | OPEN |
| **P4-296** | Stage J payroll correctness proof | P4-282 | A suite running multi-jurisdiction payroll across a simulated year with changes, retroactivity and terminations, asserting net pay and statutory amounts | Every calculation matches hand computation, and a deliberately altered tax band is caught | OPEN |

---

## 15. Stage K · Projects, service and field service (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-297** | Project structure and work breakdown | P4-142 | Projects, phases, work packages and their budget and dimension linkage | Every project cost carries its work-breakdown assignment, enforced at posting | OPEN |
| **P4-298** | Project planning and scheduling | P4-297 | Activities, dependencies, milestones, critical path and resource assignment | A schedule's critical path is computed and infeasibility is reported, not hidden | OPEN |
| **P4-299** | Project budgeting and cost control | P4-137 | Project budgets with availability control and commitment tracking | A project posting exceeding available budget is blocked or warned per configuration | OPEN |
| **P4-300** | Project time and expense capture | P4-273 | Time and expense recorded against projects with approval and rate determination | Recorded time posts to project cost at the correct rate, with no re-entry | OPEN |
| **P4-301** | Project procurement and materials | P4-185 | Project-assigned purchasing and material consumption | Project-assigned procurement posts to the project, never to a general cost centre | OPEN |
| **P4-302** | Project billing | P4-159 | Time-and-materials, fixed-price and milestone billing from project data | A project invoice's amounts derive from recorded project data exactly | OPEN |
| **P4-303** | Project revenue recognition and WIP | P4-161 | Percentage-of-completion, WIP and revenue recognition for projects | Project WIP and recognised revenue reconcile to the ledger exactly | OPEN |
| **P4-304** | Project closure and settlement | P4-142 | Closure with final settlement, asset capitalisation and residual handling | A closed project has no unsettled cost and no open commitment, asserted before closure | OPEN |
| **P4-305** | Resource management and utilisation | P4-298 | Resource capacity, assignment, utilisation and forecasting | Utilisation derives from recorded time and assignment, not from estimates | OPEN |
| **P4-306** | Service contracts and entitlements | P4-151 | Service agreements, coverage, SLAs and entitlement checking | A service request outside entitlement is identified and charged per policy | OPEN |
| **P4-307** | Service request and case management | P4-171 | Service requests with categorisation, routing, SLA and resolution | An SLA breach escalates automatically, proven by test | OPEN |
| **P4-308** | Field service scheduling and dispatch | P4-305 | Work order scheduling by skill, location, availability and SLA | A dispatch respects skill and availability constraints, and infeasibility is surfaced | OPEN |
| **P4-309** | Field service execution and mobility | P4-308 | Technician execution with offline capture, parts consumption and confirmation | An offline field confirmation posts correctly on reconnect with no duplication, proven by test | OPEN |
| **P4-310** | Service parts and van stock | P4-217 | Parts inventory at technician and vehicle level with replenishment | Van stock is valued and reconciled to the ledger like any other location | OPEN |
| **P4-311** | Warranty and claims | P4-306 | Warranty determination, claims against suppliers and their recovery | A warranty claim's recovery posts against the original cost, traceable end to end | OPEN |
| **P4-312** | Service billing and cost recovery | P4-302 | Billing for service with entitlement, warranty and contract application | A service invoice bills exactly the non-covered portion, verified per coverage fixture | OPEN |
| **P4-313** | Installed base and equipment records | P4-256 | Customer-installed equipment with configuration, history and service record | An installed-base record's full service history is reconstructible | OPEN |
| **P4-314** | Project and service analytics | P4-303 | Margin, utilisation, SLA attainment and cost-to-serve | Every figure reconciles to posted documents and recorded time | OPEN |
| **P4-315** | Project and service permissions | P4-120 | Project, service organisation and technician-level permissions | A technician sees **zero** rows outside their assignments, proven by test | OPEN |
| **P4-316** | Stage K proof | P4-304 | An end-to-end suite from project setup through billing, recognition and closure, and from service request through resolution and billing | Both cycles are complete and balanced, and a deliberately skipped settlement is caught | OPEN |

---

## 16. Stage L · Vertical extensions (Wave 4)

Verticals extend the kernel; they do not fork it. Every phase here is bound by `P4-051`: a vertical
that modifies core behaviour outside a declared seam fails the architecture gate, regardless of how
much simpler the fork would be.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-317** | Vertical extension architecture | P4-051 | The pattern every vertical follows: seams used, data extension mechanism, upgrade safety | A vertical modifying core behaviour outside a declared seam fails the gate, proven by test | OPEN |
| **P4-318** | Vertical isolation and coexistence | P4-317 | Multiple verticals installed in one tenant without interference | Two verticals coexist with no behavioural interference, proven by test | OPEN |
| **P4-319** | Retail and point of sale | P4-169 | Store operations, POS, cash management, promotions and stock at store level | A store's day closes with cash, stock and revenue reconciled, asserted per store day | OPEN |
| **P4-320** | E-commerce operations | P4-168 | Catalogue, pricing, order capture, fulfilment and returns for online channels | An online order flows through the standard pipeline with no parallel path, proven by architecture test | OPEN |
| **P4-321** | Healthcare — patient and clinical records | P4-292 | Patient master, encounters, clinical records with the strictest data classification | Every clinical field is classified and encrypted, and access is audited per access, verified by inspection | OPEN |
| **P4-322** | Healthcare — scheduling and resources | P4-321 | Appointment scheduling across practitioners, rooms and equipment | A double-booked resource is impossible, enforced at booking | OPEN |
| **P4-323** | Healthcare — billing and claims | P4-312 | Payer billing, claims, coding and reconciliation | A claim reconciles to its encounter and to its remittance exactly | OPEN |
| **P4-324** | Healthcare — compliance and consent | P4-321 | Consent management, disclosure tracking and statutory access controls | Access without a lawful basis is refused and audited, proven by test | OPEN |
| **P4-325** | Education — student and enrolment | P4-055 | Student records, programmes, enrolment and progression | A student's academic history is reconstructible and immutable once published | OPEN |
| **P4-326** | Education — academic operations | P4-325 | Timetabling, attendance, assessment and grading | A published grade cannot be altered without an audited correction, enforced | OPEN |
| **P4-327** | Education — fees and financial aid | P4-094 | Fee structures, invoicing, instalments, scholarships and aid | Student financial records reconcile to the ledger exactly | OPEN |
| **P4-328** | Real estate — property and lease | P4-109 | Property master, units, leases, rent schedules and escalation | Rent invoicing derives from lease terms exactly, including escalation | OPEN |
| **P4-329** | Real estate — facilities and maintenance | P4-257 | Facility maintenance, service charges and their apportionment | Service charges apportion to tenants exactly and reconcile to cost | OPEN |
| **P4-330** | Professional services vertical | P4-303 | Engagement management, utilisation and project-based revenue | Engagement profitability reconciles to project cost and revenue | OPEN |
| **P4-331** | Non-profit and fund accounting | P4-028 | Fund, grant and restriction accounting with donor reporting | Restricted funds cannot be spent outside their restriction, enforced at posting | OPEN |
| **P4-332** | Public sector and budgetary accounting | P4-138 | Appropriation, commitment and encumbrance accounting | Spending beyond appropriation is blocked, enforced mechanically | OPEN |
| **P4-333** | Vertical-specific compliance | P4-317 | Per-vertical statutory requirements mapped to mechanisms | Every vertical compliance claim has a test that fails when its control is removed | OPEN |
| **P4-334** | Vertical data models and extension fields | P4-317 | Vertical data extension through the declared mechanism, upgrade-safe | A vertical's data extension survives a core upgrade, proven by test | OPEN |
| **P4-335** | Vertical UX consistency | P4-013 | Verticals using the shared design system and shell without divergence | A vertical introducing its own navigation or components fails the location gate | OPEN |
| **P4-336** | Stage L proof | P4-318 | A suite installing every vertical together, asserting coexistence, upgrade safety and kernel conformance | All verticals coexist and pass kernel conformance, and a deliberate core fork is caught | OPEN |

---

## 17. Stage M · Close, statutory reporting and analytics (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-337** | Reporting data model | P4-118 | The reporting layer over transactional data with dimensions, hierarchies and time | Every report figure traces to transactional records, asserted across the report estate | OPEN |
| **P4-338** | Operational reporting | P4-337 | Standard operational reports across every module with filters and scheduling | Reports honour the running subject's permissions, never the author's, proven by test | OPEN |
| **P4-339** | Analytical models and aggregation | P4-337 | Pre-aggregated models with correct invalidation and freshness indication | An aggregate is never stale beyond its declared window, and the window is displayed | OPEN |
| **P4-340** | Real-time operational dashboards | P4-339 | Live operational views with drill-through and alerting | A dashboard figure equals the transactional truth within its declared latency | OPEN |
| **P4-341** | Universal drill-through | P4-118 | The UX-5 mechanism: every figure in every report drillable to source document and authoriser | No figure in the report estate is a dead end, verified by an automated crawl | OPEN |
| **P4-342** | Period-end procedures per module | P4-027 | Each module's period-end steps declared, sequenced and executable | Every module's period-end procedure is executable and reports its completion state | OPEN |
| **P4-343** | Reconciliation before close | P4-117 | The full reconciliation set that must pass before a period may close | A period cannot close with an unreconciled subledger, enforced mechanically | OPEN |
| **P4-344** | Period and year-end close execution | P4-343 | Closing, balance carry-forward, retained earnings and reopening controls | Year-end carry-forward reproduces opening balances exactly, asserted by comparison | OPEN |
| **P4-345** | Close management and orchestration | P4-342 | The UX-7 mechanism: a guided, measured close with tasks, owners, dependencies and status | The close's critical path and current blocker are visible at any moment. Close duration is measured | OPEN |
| **P4-346** | Statutory financial statements | P4-115 | Jurisdictional statement formats generated from the ledger | Every statutory statement reconciles to the trial balance exactly | OPEN |
| **P4-347** | Consolidated reporting | P4-086 | Group consolidation with eliminations, translation and minority interest | Consolidated statements reconcile to entity statements after eliminations, asserted by report | OPEN |
| **P4-348** | Statutory and regulatory filings | P4-113 | Jurisdictional filings generated from posted data with submission tracking | Every filing reconciles to the ledger and its submission is tracked to acknowledgement | OPEN |
| **P4-349** | Audit support and evidence | P4-122 | Audit trails, sampling support and evidence extraction | An audit request is satisfiable from generated evidence, verified by rehearsal | OPEN |
| **P4-350** | Report distribution and subscriptions | P4-043 | Scheduled distribution running as a declared subject with that subject's permissions | A distributed report contains only rows its declared subject may read, proven by test | OPEN |
| **P4-351** | Reporting performance at volume | P4-119 | Report execution within budget over multi-year, multi-entity data | Standard reports meet their budget at production volume, measured | OPEN |
| **P4-352** | Reporting accessibility | P4-018 | WCAG 2.2 AA across reports, dashboards and every chart | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |

---

## 18. Stage N · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P4-353** | Coverage that can fail | P4-020 | Coverage across this programme with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P4-354** | Replacement of coverage-padding tests | P4-002 | The padding specs inventoried in `L11` for these modules replaced with behavioural tests | Every replaced test fails when its subject is deliberately broken, individually verified | OPEN |
| **P4-355** | Unit testing of calculation engines | P4-353 | Property-based unit tests for pricing, tax, costing, depreciation, payroll and valuation | Each engine passes property tests over generated inputs, and a deliberately altered rule is caught | OPEN |
| **P4-356** | Integration testing against real infrastructure | P4-019 | Integration suites against real Postgres and real queues, using the shared fixtures | The suite runs against real infrastructure in CI. A mock-only pass is caught | OPEN |
| **P4-357** | Module conformance testing | P4-052 | Every module run against the kernel conformance suite | A module failing conformance cannot be marked done, enforced by the gate | OPEN |
| **P4-358** | End-to-end business cycle testing | P4-180 | Automated order-to-cash, procure-to-pay, plan-to-produce, hire-to-retire and record-to-report journeys | Each cycle runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P4-359** | Two-tenant isolation testing, universally | P4-005 | An isolation test for every table, endpoint and report in this programme | A surface without an isolation test fails a coverage gate. Every test proves **zero** rows | OPEN |
| **P4-360** | Multi-entity and multi-currency testing | P4-050 | Test estate covering multiple entities, currencies and fiscal calendars | Consolidation, intercompany and translation are correct across the fixture estate | OPEN |
| **P4-361** | Concurrency and correctness under load | P4-236 | Concurrent posting, stock movement, numbering and balance updates | No lost update, no numbering gap and no balance divergence under parallel load | OPEN |
| **P4-362** | Performance and volume testing | P4-017 | Load profiles for transactional entry, posting, availability and reporting | Targets met at production volume. A regression beyond threshold fails CI | OPEN |
| **P4-363** | Soak and month-end peak testing | P4-362 | Endurance testing including simulated month-end and year-end peaks | A simulated close at peak volume completes within its window with no resource exhaustion | OPEN |
| **P4-364** | Accessibility audit across the estate | P4-018 | Full WCAG 2.2 AA audit across the 903-page estate, sampled by surface class with full coverage of shared components | Every surface class is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P4-365** | Security testing and penetration exercise | P4-012 | Automated scanning plus penetration testing focused on privilege escalation and cross-entity access | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P4-366** | Data migration rehearsal | P4-074 | Rehearsed migration of master data and open balances from a legacy system | A rehearsed migration reconciles opening balances to source exactly, and rolls back completely on failure | OPEN |
| **P4-367** | Disaster recovery and business continuity | P4-007 | Rehearsed recovery to a point in time with transactional consistency | A recovery rehearsal meets its objective with the ledger still balancing | OPEN |
| **P4-368** | The balance and traceability proof | P4-343 | The § 1 invariant made mechanical: a period closed with trial balance at zero, every subledger reconciled, and every posted entry traced to source and authoriser | All three hold across the fixture estate, and each fails immediately when its guarantee is deliberately weakened | OPEN |
| **P4-369** | Module completeness verification | P4-357 | Every module re-scored against the P4-002 rubric and required to meet the declared bar | No module falls below the bar. A module that does blocks the programme rather than being footnoted | OPEN |
| **P4-370** | Programme 4 launch readiness | P4-368 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 19 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 19. Programme exit criteria

- [ ] **A period closes with trial balance at zero, every subledger reconciled, every entry traced to source and authoriser** (P4-368)
- [ ] Every module meets the declared bar on the P4-002 rubric — none footnoted (P4-369)
- [ ] An unbalanced journal cannot be written, enforced at the database level (P4-079)
- [ ] A posted document cannot be edited by any path; correction is always a linked reversal (P4-031)
- [ ] Posting into a closed period is impossible from UI, API, import, integration and job (P4-027)
- [ ] Statutory numbering is gapless under concurrency and induced failure (P4-026)
- [ ] Money is `Decimal(19,4)` with explicit currency; a `Float` near money fails CI (P4-006)
- [ ] Every automatic posting's account is derived from configuration; a hardcoded account fails a gate (P4-054)
- [ ] No direct cross-module service import; cross-module effects go through the outbox in the same transaction (P4-021)
- [ ] Every module passes the kernel conformance suite (P4-052, P4-357)
- [ ] Subledgers reconcile continuously to their control accounts, and divergence alerts (P4-117)
- [ ] No figure on any financial or report surface is a dead end (P4-118, P4-341)
- [ ] A single user cannot perform a conflicting pair of duties (P4-012)
- [ ] Every surface has a two-tenant isolation test proving **zero** rows (P4-359)
- [ ] Concurrent postings produce correct balances and stock with no lost update (P4-361)
- [ ] Payroll net pay and statutory amounts match hand computation per jurisdiction (P4-296)
- [ ] Stock, inventory value and the ledger agree at all times (P4-240)
- [ ] Verticals extend through declared seams; a core fork fails the gate (P4-317, P4-336)
- [ ] Every personal-data field is classified and encrypted, verified in a database dump (P4-292)
- [ ] Coverage thresholds have been proven able to fail, and the padding specs are replaced (P4-353, P4-354)
- [ ] Every UI primitive lives in `unierp-design-system` with a story; zero hardcoded colours or spacing (P4-013)
- [ ] A 20-line document is entered and posted without the mouse, within budget (P4-016, P4-177)

---

## 20. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 4 established (P4-001–P4-370), the ERP tenant apps.** Registered per README § 0 rule 1. Framed as the *depth* pass over Track E's breadth pass: Track E is 44/47 DONE and its own objective was "from CRUD to genuinely functional", which its first pass began. `P4-002` re-scores all 45 modules against a strengthened rubric before any module phase may be claimed, so this programme measures rather than assumes — 903 route pages is a count of pages, not of working features. Stage B is built once and consumed by every module, following `E04-CROSS-MODULE-GAP-BACKLOG.md`'s established principle that a gap recurring across modules is one shared-capability defect rather than many. | Claude Code |
