# PROGRAMME 8 · PLATFORM ADMIN OS — P8-001–P8-314

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 8` resolves waves from this
> document and can only ever hand out a `P8-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** `P8-004` is the
runtime precondition gate.

---

## 1. What this programme owns

`unierp-console` — **plane 1, the provider control plane.** The operating system for running UniERP
as a service: every provider, region, cluster and tenant in the estate, their desired and actual
state, their releases, their cost, their health, and the people who operate them.

**The invariant this programme establishes:**

> **Desired state, actual state and the console's view of both agree — and where they cannot, the
> divergence is detected, surfaced and attributable, never discovered from a customer.**

`P8-312` is its mechanical proof: seeded divergences in each direction — a drifted cluster, a
mis-recorded tenant version, a stale cost attribution — each detected within a stated window.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Console files | 221 | `find unierp-console -type f -not -path "*/node_modules/*"` |
| Console route pages | **139** | `find unierp-console -name page.tsx -not -path "*/node_modules/*"` |
| Programme 1 Track C | **29/29 DONE** | `node scripts/phase-brief.mjs --status` |
| Programme 1 Track M | **46/49 DONE**, 3 OPEN | `node scripts/phase-brief.mjs --status` |
| Last commit | `J02: coverage that can fail` (2026-08-14) | `git log -1` |

This programme has the most substantial predecessor in the family, and the honest reading of it is
recorded in Track M's own founding entry (README § 6, 2026-08-11): Track C's exit criterion —
*"every endpoint in `platform/v1` has a corresponding console surface"* — **was satisfied by
read-only surfaces.** 132 route pages rendered the estate and could not change it (**D044**). Track
M was established to fix exactly that, and is 46/49.

So this programme begins where Track M's three remaining phases end, and its first act is to check
whether D044's pattern has recurred. `P8-002` measures every one of the 139 console pages for whether
it can actually *change* what it displays. **A page that renders state it cannot act on is the
defect this plane keeps producing**, and measuring it is cheaper than assuming it was fixed.

**Reference set.** Kubernetes and Crossplane (declarative desired state and reconciliation loops),
AWS Organizations and Control Tower (multi-account estate governance), Google SRE practice (SLO,
error budgets, toil elimination), Datadog and Honeycomb (operational observability), Terraform
(infrastructure as versioned intent), Salesforce and Workday operations (running many tenants at
different versions), Stripe (internal operational tooling as a product), and PagerDuty for the
incident lifecycle.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Every surface that shows state can act on it.** Read-only is a deliberate, justified exception, never a default. | D044, directly | `P8-002`, `P8-313` |
| **UX-2** | **Intent is declared, not clicked.** Operations are declarative and reconciled, so the estate converges rather than drifting. | Kubernetes; Terraform | `P8-051` |
| **UX-3** | **Every action states its blast radius before it runs.** How many tenants, which regions, what is irreversible. | — | `P8-085` |
| **UX-4** | **Fleet operations are first-class.** Acting on one tenant and on ten thousand are the same mechanism. | AWS Organizations | `P8-090` |
| **UX-5** | **The operator is never the last to know.** Detection precedes customer reports, and that lead time is measured. | Google SRE | `P8-152` |
| **UX-6** | **Toil is measured and removed.** A repeated manual operation is a defect with an owner. | Google SRE | `P8-268` |
| **UX-7** | **Every number has a derivation.** Cost, health and capacity figures drill to their source. | Datadog | `P8-196` |

---

## 3. Design-system rule

`unierp-design-system` is the only source of UI primitives. This programme adds the operations
primitives — estate tree, state-diff view, reconciliation status, blast-radius confirmation, fleet
selector, SLO burn chart, incident timeline, cost breakdown — with stories (`P8-013`).

---

## 4. Waves

### Wave 0 · "Measure the read-only problem"
**Phases:** P8-001–P8-020 · Independence, the D044 re-measurement, and the console shell.

### Wave 1 · "The estate and its intent"
**Phases:** P8-021–P8-106 · Inventory, desired state, reconciliation, and tenant lifecycle at fleet scale.

### Wave 2 · "Release and observe"
**Phases:** P8-107–P8-168 · Version and release management, observability, SLOs and incidents.

### Wave 3 · "Capacity and cost"
**Phases:** P8-169–P8-216 · Scaling, performance, FinOps and unit economics.

### Wave 4 · "Security and support"
**Phases:** P8-217–P8-270 · Provider security operations, compliance, and customer operations.

### Wave 5 · "Data and production"
**Phases:** P8-271–P8-314 · Backup, disaster recovery, migration, the test estate, and the proofs.

---

## 5. Stage A · Foundation and the D044 re-measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P8 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P8-002** | The read-only census | P8-001 | Every one of the 139 console pages measured for whether it can change what it displays, with each read-only surface either justified or filed | The census is reproducible by command. Every read-only page has a recorded justification or a defect entry | OPEN |
| **P8-003** | Actionability gate | P8-002 | A gate requiring every new console surface that renders mutable state to expose an action or carry a recorded exemption | A new read-only surface without an exemption fails CI. The gate is proven to fail on a seeded example | OPEN |
| **P8-004** | Runtime precondition gate | P8-001 | Startup and CI assertion of each external capability, with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P8-005** | Provider-plane data model and scoping | P8-001 | Provider, region, cluster, tenant and operator entities with access policies on every table | Every table has an explicit access policy. A table without one fails the gate | OPEN |
| **P8-006** | Blast-radius classification | P8-005 | Every operation classified by how many tenants it can affect and whether it is reversible | An unclassified operation cannot be invoked. Classification is asserted at the call boundary | OPEN |
| **P8-007** | Migration discipline | P8-005 | Forward-only migrations with tested rollback and immutable shipped migrations | Replaying every migration from empty reproduces the schema exactly | OPEN |
| **P8-008** | Operator authentication | P8-005 | Provider staff authentication with mandatory hardware-backed MFA | A privileged operation without a hardware factor is impossible, and the test fails when enforcement is removed | OPEN |
| **P8-009** | Operator authorization and default deny | P8-008 | Explicit permissions on every endpoint, defaulting to deny, unauthorized returning **403** | An endpoint without a permission declaration fails a gate. Unauthorized returns 403, never 404 or 500 | OPEN |
| **P8-010** | Provider audit log | P8-009 | Append-only audit of every provider action with actor, blast radius, target set and correlation | Every mutating endpoint audits with its affected tenant set. An unaudited one fails a gate | OPEN |
| **P8-011** | Structured logging and correlation | P8-001 | Correlation from console action through orchestration to every affected tenant | One fleet operation is traceable to every tenant it touched by a single correlation ID | OPEN |
| **P8-012** | Error taxonomy for operators | P8-011 | Typed errors separating operator mistake, policy refusal, capacity limit, partial failure and platform fault | Every error carries a registry code and states its remediation. A partial failure is never reported as success | OPEN |
| **P8-013** | Operations design-system primitives | P8-001 | Estate tree, state-diff view, reconciliation status, blast-radius confirmation, fleet selector, SLO burn chart, incident timeline and cost breakdown in `unierp-design-system` with stories | Each has a story and zero hardcoded colour or spacing. A component built in a page fails the location gate | OPEN |
| **P8-014** | Console shell and information architecture | P8-013 | The frame scaling across 139-plus surfaces: estate navigation, search, context and alerting | Every console surface renders in the shell; a surface with its own chrome fails the contract test | OPEN |
| **P8-015** | Command model and keyboard | P8-014 | A single command registry driving palette, shortcuts and the accessibility tree | Every console action is reachable by keyboard alone, proven by test | OPEN |
| **P8-016** | Console performance budget | P8-014 | Budgets for estate views, fleet queries and dashboards at estate scale | A regression beyond budget fails CI at reference estate scale | OPEN |
| **P8-017** | Console accessibility baseline | P8-014 | WCAG 2.2 AA across the shell and core operational surfaces | The shell and a representative surface are `axe` clean and keyboard-complete | OPEN |
| **P8-018** | Reference estate fixtures | P8-005 | A realistic fixture estate: multiple providers, regions, clusters and 10,000 tenants at varied versions | Every test and benchmark runs against the shared fixture estate | OPEN |
| **P8-019** | Idempotency for provider operations | P8-006 | Idempotency keys on every provisioning, migration, deployment and fleet operation | A retried fleet operation applies once per target, proven under induced failure | OPEN |
| **P8-020** | Test harness for operations | P8-018 | Estate fixtures, reconciliation harness, clock control, fault injection and blast-radius assertions | An operations test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |

---

## 6. Stage B · The estate and its inventory (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-021** | Provider registry | P8-005 | Providers as first-class entities with capability, capacity, region and contract | A provider is addressable and its capability is data, not code | OPEN |
| **P8-022** | Region and availability-zone model | P8-021 | Regions, zones, their capability and their residency implications | A tenant's residency requirement is satisfiable only by regions that actually satisfy it | OPEN |
| **P8-023** | Cluster and compute inventory | P8-022 | Clusters, nodes, capacity, version and health as inventory | Every running compute unit appears in inventory; an unlisted unit is detected as drift | OPEN |
| **P8-024** | Database and storage inventory | P8-023 | Database instances, storage, capacity, version and backup state | Every data store appears in inventory with its backup state, verified against reality | OPEN |
| **P8-025** | Network and connectivity inventory | P8-023 | Networks, ingress, certificates, DNS and their state | Every certificate and DNS record is inventoried with its expiry, verified against reality | OPEN |
| **P8-026** | Tenant registry | P8-021 | Every tenant with its placement, version, plan, state and residency | The registry matches actual tenant placement exactly, asserted by reconciliation | OPEN |
| **P8-027** | Tenant-to-infrastructure mapping | P8-026 | Which tenant runs where, on what, alongside whom | Any tenant's complete infrastructure footprint is answerable from one query | OPEN |
| **P8-028** | Estate topology visualisation | P8-027 | Navigable estate view from provider through region and cluster to tenant | The topology is navigable by keyboard and comprehensible by screen reader | OPEN |
| **P8-029** | Inventory discovery and reconciliation | P8-023 | Continuous discovery comparing recorded inventory to actual infrastructure | An unrecorded resource is detected within the stated window and reported | OPEN |
| **P8-030** | Resource tagging and ownership | P8-029 | Every resource tagged with owner, purpose, environment and cost centre | An untagged resource is detected and reported; ownership is always attributable | OPEN |
| **P8-031** | Orphan and waste detection | P8-030 | Detecting resources belonging to no tenant, service or purpose | An orphaned resource is detected within the stated window with its likely origin | OPEN |
| **P8-032** | Estate search | P8-027 | Search across every entity in the estate by any property | Any estate object is findable within the interaction budget at fixture scale | OPEN |
| **P8-033** | Estate segmentation and grouping | P8-026 | Grouping tenants and resources by any dimension for fleet operations | A group's membership is deterministic and recomputes on change | OPEN |
| **P8-034** | Estate change history | P8-010 | Complete history of estate composition and change | Any past estate state is reconstructible from history alone | OPEN |
| **P8-035** | Multi-provider abstraction | P8-021 | Operating across providers through one interface with provider differences isolated | Adding a provider requires no change to fleet operation logic, proven by implementing a second | OPEN |
| **P8-036** | Provider capability declaration | P8-035 | Each provider declaring what it supports, so operations fail at planning rather than execution | An operation unsupported by a provider is refused at planning with the reason | OPEN |
| **P8-037** | Self-hosted and customer-managed estates | P8-035 | Managing installations the provider does not own, with reduced but declared capability | A self-hosted installation's manageable surface is explicit; unavailable operations say so | OPEN |
| **P8-038** | Estate inventory API | P8-027 | Programmatic access to the full inventory with the same permissions | Every console inventory capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P8-039** | Inventory freshness and staleness | P8-029 | Declared freshness windows per inventory class with staleness indication | Displayed inventory is never staler than its declared window, and the window is shown | OPEN |
| **P8-040** | Inventory performance at scale | P8-016 | Inventory queries within budget across a 10,000-tenant estate | Estate queries meet budget at fixture scale, measured | OPEN |
| **P8-041** | Capacity inventory | P8-023 | Available versus committed capacity per provider, region and cluster | Available capacity is computed from real measurement, not from static configuration | OPEN |
| **P8-042** | Licence and third-party inventory | P8-030 | Third-party software, licences and their compliance state across the estate | An out-of-compliance licence is detected and reported before renewal | OPEN |
| **P8-043** | Dependency and service inventory | P8-023 | Internal services, their versions, dependencies and ownership | Every running service has an owner and a version, verified against reality | OPEN |
| **P8-044** | External dependency inventory | P8-043 | Third-party services the platform depends on, with SLA and failure impact | Each external dependency's failure impact is documented and rehearsed | OPEN |
| **P8-045** | Certificate and secret inventory | P8-025 | Every certificate and managed secret with expiry and rotation state | An expiring certificate or secret alerts before expiry, verified by rehearsal | OPEN |
| **P8-046** | Estate compliance posture | P8-030 | Which parts of the estate satisfy which compliance requirements | A tenant with a compliance requirement cannot be placed on non-compliant infrastructure | OPEN |
| **P8-047** | Estate documentation generation | P8-027 | Estate documentation generated from inventory rather than maintained by hand | Documentation is generated and cannot drift from inventory, verified by comparison | OPEN |
| **P8-048** | Inventory access control | P8-009 | Scoped inventory access by provider, region and tenant group | A scoped operator sees **zero** rows outside their scope, proven by test | OPEN |
| **P8-049** | Inventory accessibility | P8-017 | WCAG 2.2 AA across inventory and topology surfaces | Every inventory surface is `axe` clean and keyboard-complete, including the topology view | OPEN |
| **P8-050** | Stage B inventory proof | P8-029 | A suite seeding infrastructure divergence and asserting detection | Every seeded divergence is detected within its window, and removing discovery makes each pass unnoticed | OPEN |

---

## 7. Stage C · Desired state and reconciliation (Wave 1)

The mechanism that turns a console into an operating system. Track M established that a provider
registry, desired-versus-actual state, and cost ingestion had **zero relevant hits in the tree**; this
stage is where declarative operation becomes the default rather than an aspiration.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-051** | Desired-state model | P8-026 | The UX-2 mechanism: estate intent expressed declaratively and versioned | Every managed property has a declared desired value; an undeclared property cannot be reconciled | OPEN |
| **P8-052** | Reconciliation engine | P8-051 | The loop comparing desired to actual and converging, idempotently and continuously | A manually altered resource converges back within the stated window, proven by test | OPEN |
| **P8-053** | Drift detection | P8-052 | Detecting and classifying divergence between desired and actual state | A seeded drift is detected within its window and classified correctly | OPEN |
| **P8-054** | Drift remediation policy | P8-053 | Per-class policy: auto-remediate, alert, or require approval | A drift class configured for approval never auto-remediates, proven by test | OPEN |
| **P8-055** | Change planning and dry run | P8-051 | Planning a change and reporting exactly what would happen before it happens | A plan's reported outcome equals the applied outcome exactly, verified differentially | OPEN |
| **P8-056** | Change approval and gating | P8-055 | Approval requirements proportionate to blast radius | A change above a blast-radius threshold cannot apply without approval, proven by test | OPEN |
| **P8-057** | Change execution and orchestration | P8-055 | Executing plans with ordering, dependencies, concurrency limits and progress | An execution reports per-target outcome and never claims success on partial failure | OPEN |
| **P8-058** | Partial failure handling | P8-057 | Explicit handling when a fleet change succeeds for some targets and fails for others | A partial failure is reported per target with a resume path, never as a single success or failure | OPEN |
| **P8-059** | Rollback and reversion | P8-057 | Reverting a change to the prior desired state with the same planning and approval | A rollback restores the prior state exactly, verified by comparison | OPEN |
| **P8-060** | Change history and provenance | P8-034 | Every state change attributable to an intent, an approver and an execution | Any current state is explainable from its change history alone | OPEN |
| **P8-061** | Intent as versioned configuration | P8-051 | Desired state stored as versioned, reviewable, diffable configuration | Intent exports and reimports producing identical desired state, verified by comparison | OPEN |
| **P8-062** | Policy and guardrails | P8-051 | Estate-wide invariants no intent may violate | A guardrail cannot be overridden by any intent, proven adversarially | OPEN |
| **P8-063** | Placement policy | P8-046 | Rules determining where a tenant may and may not be placed | A placement violating residency or compliance policy is refused at planning | OPEN |
| **P8-064** | Scheduling and maintenance windows | P8-057 | Executing changes within declared windows per tenant and region | A change outside a tenant's window is deferred, not executed, proven by test | OPEN |
| **P8-065** | Concurrency and rate control | P8-057 | Limiting simultaneous change to bound blast radius | A fleet change never exceeds its declared concurrency, proven under execution | OPEN |
| **P8-066** | Progressive rollout | P8-065 | Staged execution across the estate with health gates between stages | A stage failing its health gate halts the rollout, proven by injection | OPEN |
| **P8-067** | Automatic halt and rollback on regression | P8-066 | Detecting regression during rollout and halting or reverting automatically | A seeded regression halts the rollout within the stated window, and removing the check lets it proceed | OPEN |
| **P8-068** | Reconciliation observability | P8-052 | Metrics on reconciliation lag, drift rate, convergence time and failure | Reconciliation health is answerable from telemetry alone | OPEN |
| **P8-069** | Reconciliation performance | P8-052 | Reconciliation across the estate within its declared interval | The full estate reconciles within the stated interval at fixture scale, measured | OPEN |
| **P8-070** | Manual override and break-glass | P8-062 | Emergency direct action outside the reconciliation loop, tightly bounded and audited | A break-glass action is time-boxed, alerts, and is reconciled or ratified afterwards, never silently persisting | OPEN |
| **P8-071** | Reconciliation conflict resolution | P8-052 | Deterministic handling when two intents conflict | A conflict is refused at planning with both intents named, never resolved arbitrarily | OPEN |
| **P8-072** | Infrastructure provisioning | P8-057 | Creating and destroying infrastructure through declared intent | Provisioned infrastructure matches intent exactly, asserted by reconciliation | OPEN |
| **P8-073** | Configuration management across the estate | P8-061 | Service and platform configuration reconciled like any other state | A configuration drift converges or alerts per policy, proven by test | OPEN |
| **P8-074** | Secret and certificate reconciliation | P8-045 | Rotation and renewal driven by the reconciliation loop | A certificate renews before expiry without intervention, verified by rehearsal | OPEN |
| **P8-075** | Reconciliation for self-hosted estates | P8-037 | Reconciliation where the provider does not control the infrastructure | A self-hosted estate reports drift even where it cannot remediate it | OPEN |
| **P8-076** | Reconciliation API | P8-051 | Programmatic intent declaration, planning and execution | Every reconciliation capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P8-077** | Reconciliation accessibility | P8-017 | WCAG 2.2 AA across plan, diff, approval and execution surfaces | The state-diff and approval surfaces are fully operable by keyboard and screen reader | OPEN |
| **P8-078** | Stage C convergence proof | P8-052 | A suite seeding drift of every class across the fixture estate and asserting detection and convergence | Every class converges or alerts per policy, and disabling the loop makes each drift persist undetected | OPEN |

---

## 8. Stage D · Tenant lifecycle at fleet scale (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-079** | Tenant provisioning | P8-063 | Creating a tenant through declared intent with placement, capacity and baseline | A provisioned tenant matches its intent exactly and is reachable within the stated budget | OPEN |
| **P8-080** | Provisioning failure and cleanup | P8-079 | Failed provisioning leaving no partial tenant or orphaned resource | A failed provision leaves nothing behind, proven by injection at each step | OPEN |
| **P8-081** | Tenant configuration baselines | P8-073 | Baseline configuration applied at provisioning and enforced thereafter | A tenant drifting from a mandatory baseline is detected and remediated per policy | OPEN |
| **P8-082** | Tenant suspension and reactivation | P8-026 | Suspension preserving data and blocking access, with clean reactivation | A suspended tenant is inaccessible but loses nothing; reactivation restores exactly | OPEN |
| **P8-083** | Tenant termination and deletion | P8-082 | Termination with export, retention honouring and verifiable deletion | Deleted tenant data is absent from primary storage immediately and from backups within the stated window, verified by query | OPEN |
| **P8-084** | Tenant migration between infrastructure | P8-063 | Moving a tenant between clusters, regions or providers with bounded downtime | A migration completes within its stated downtime budget with no data loss, verified by comparison | OPEN |
| **P8-085** | Blast-radius preview | P8-006 | The UX-3 mechanism: before any operation, exactly which tenants are affected and what is irreversible | The preview's affected set equals the actual affected set exactly, verified differentially | OPEN |
| **P8-086** | Tenant isolation verification | P8-027 | Continuous verification that tenants sharing infrastructure remain isolated | A seeded isolation weakness is detected within the stated window, and removing the check hides it | OPEN |
| **P8-087** | Noisy-neighbour detection and control | P8-086 | Detecting and limiting a tenant degrading others on shared infrastructure | A tenant consuming disproportionate resource is detected and contained, proven under load | OPEN |
| **P8-088** | Tenant resource limits and quotas | P8-087 | Per-tenant infrastructure limits enforced at the platform level | A tenant cannot exceed its declared infrastructure limits, proven adversarially | OPEN |
| **P8-089** | Dedicated and isolated tenancy | P8-063 | Single-tenant infrastructure for tenants requiring it, on the same operational model | A dedicated tenant is operated by the identical mechanisms, proven by test | OPEN |
| **P8-090** | Fleet operation framework | P8-057 | The UX-4 mechanism: one mechanism for acting on one tenant and on ten thousand | A single-tenant action and a fleet action use the same code path, enforced by architecture test | OPEN |
| **P8-091** | Fleet targeting and selection | P8-033 | Selecting operation targets by any estate dimension, with the resulting set shown | A target set is deterministic and previewed before execution, matching exactly | OPEN |
| **P8-092** | Fleet operation progress and control | P8-057 | Live progress, pause, resume and abort for long-running fleet operations | A fleet operation is pausable mid-execution and resumes without repeating completed targets | OPEN |
| **P8-093** | Fleet operation reporting | P8-058 | Per-target outcome reporting with failure attribution and retry | A fleet operation reports exactly which tenants succeeded and why each failure failed | OPEN |
| **P8-094** | Tenant version placement | P8-026 | Which tenant runs which platform version, recorded and reconciled | Recorded tenant version equals actual running version, asserted by reconciliation | OPEN |
| **P8-095** | Multi-version operation | P8-094 | Operating tenants on several platform versions simultaneously | Tenants on different versions coexist without interference, proven by test | OPEN |
| **P8-096** | Tenant data residency enforcement | P8-022 | Residency enforced at placement, migration and backup | A residency-restricted tenant's data is provably absent from other regions, verified by query | OPEN |
| **P8-097** | Tenant cloning and environment creation | P8-084 | Creating sandboxes and copies with masking, at provider scale | A cloned environment contains no readable personal data, verified by inspection | OPEN |
| **P8-098** | Tenant merge and split operations | P8-084 | Provider-side support for tenant merge and separation | A merge preserves every record and entitlement with no duplication, proven by test | OPEN |
| **P8-099** | Tenant health scoring | P8-087 | Per-tenant health from real signals: errors, latency, jobs, capacity, usage | An unhealthy tenant is identifiable before the customer reports it, measured as lead time | OPEN |
| **P8-100** | Tenant onboarding orchestration | P8-079 | The full provider-side sequence from sale to working tenant | A new tenant reaches working state within the stated budget with no manual step | OPEN |
| **P8-101** | Bulk tenant import and migration | P8-084 | Onboarding many tenants from another system or provider | A bulk onboarding reports per-tenant outcome and rolls back cleanly on failure | OPEN |
| **P8-102** | Tenant lifecycle automation | P8-090 | Automating routine lifecycle operations end to end | Each automated operation has a measured success rate and a manual fallback | OPEN |
| **P8-103** | Tenant operation audit | P8-010 | Complete audit of every provider action taken against a tenant | Every action against a tenant is attributable, and visible to that tenant where policy requires | OPEN |
| **P8-104** | Tenant lifecycle performance | P8-016 | Provisioning, migration and deletion within stated time budgets | Each lifecycle operation meets its budget at fixture scale, measured | OPEN |
| **P8-105** | Tenant lifecycle accessibility | P8-017 | WCAG 2.2 AA across lifecycle and fleet operation surfaces | Every lifecycle surface is `axe` clean and keyboard-complete | OPEN |
| **P8-106** | Stage D fleet proof | P8-090 | A suite driving provision, configure, migrate, suspend, restore and delete across a 10,000-tenant fixture with failure injected | Every path leaves a consistent estate, partial failures report per target, and a skipped cleanup is caught | OPEN |

---

## 9. Stage E · Release, deployment and version management (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-107** | Release model | P8-094 | Releases as versioned, immutable artefacts with provenance and contents | A release artefact is immutable and its provenance verifiable, proven by signature check | OPEN |
| **P8-108** | Release pipeline | P8-107 | Build, test, sign, attest and publish a release deterministically | Two builds of one commit produce byte-identical artefacts, verified by hash | OPEN |
| **P8-109** | Release readiness gates | P8-108 | Quality, security and compatibility gates a release must pass to be deployable | A release failing any gate cannot be deployed, and each gate has been proven able to fail | OPEN |
| **P8-110** | Release notes and change communication | P8-107 | Release contents generated from the actual change set | Release notes derive from the diff and cannot be hand-invented, verified by generation | OPEN |
| **P8-111** | Breaking-change detection | P8-109 | Detecting breaking API, schema and behaviour changes before release | A breaking change is detected and classified automatically, proven on a seeded example | OPEN |
| **P8-112** | Deployment orchestration | P8-066 | Deploying a release across the estate with staging, gates and concurrency control | A deployment respects its stages and gates, halting on failure, proven by injection | OPEN |
| **P8-113** | Canary deployment | P8-066 | Deploying to a small tenant cohort first with automated health comparison | A regression in the canary cohort halts the rollout, and removing the comparison lets it proceed | OPEN |
| **P8-114** | Blue-green and zero-downtime deployment | P8-112 | Deployment without tenant-visible downtime | A deployment completes with zero failed tenant requests, measured under live traffic | OPEN |
| **P8-115** | Database migration at fleet scale | P8-112 | Executing schema migrations across thousands of tenant databases safely | A fleet migration reports per-tenant outcome and never leaves a partially migrated tenant | OPEN |
| **P8-116** | Online and non-blocking migrations | P8-115 | Migrations that do not block tenant traffic on large datasets | A migration on a 10-million-row tenant blocks no write longer than the stated threshold, measured | OPEN |
| **P8-117** | Migration rollback and forward-fix | P8-115 | Recovering from a failed migration by rollback or forward fix, decided by policy | A failed migration recovers to a consistent state, proven by injection at each step | OPEN |
| **P8-118** | Backward and forward compatibility | P8-111 | Compatibility windows allowing code and schema to deploy independently | A release is proven compatible with the prior and next schema, verified by test | OPEN |
| **P8-119** | Feature flags and dark launch | P8-073 | Runtime feature control decoupled from deployment | A feature is enabled and disabled without deployment, proven by test | OPEN |
| **P8-120** | Flag governance and cleanup | P8-119 | Flag ownership, expiry and removal, so flags do not accumulate | A flag past its expiry is reported to its owner; flag count is measured and bounded | OPEN |
| **P8-121** | Tenant-scheduled upgrades | P8-064 | Upgrading tenants within their chosen maintenance windows | A tenant's window is honoured, or the deviation is notified in advance, enforced mechanically | OPEN |
| **P8-122** | Upgrade notification | P8-110 | Notifying tenants of upcoming changes within the stated notice period | No tenant-visible change occurs without prior notice where notice is owed, enforced | OPEN |
| **P8-123** | Version deprecation and end-of-life | P8-095 | Retiring old platform versions with notice and forced-upgrade policy | A version cannot be retired inside its notice window, enforced mechanically | OPEN |
| **P8-124** | Emergency and hotfix deployment | P8-112 | An expedited path for urgent fixes with reduced but non-zero gates | A hotfix deploys within the stated window without bypassing security or migration gates | OPEN |
| **P8-125** | Deployment rollback | P8-059 | Rolling back a release across the estate, including data considerations | A rollback restores the prior version with tenant data consistent, proven by rehearsal | OPEN |
| **P8-126** | Deployment observability | P8-068 | Real-time deployment progress, health and per-tenant state | A stalled or failing deployment is diagnosable from telemetry alone | OPEN |
| **P8-127** | Release quality feedback | P8-113 | Post-release health comparison feeding future gate decisions | A release's real-world quality is measured against its predecessor, not assumed | OPEN |
| **P8-128** | Artefact registry and retention | P8-107 | Storing, retaining and garbage-collecting release artefacts | Any deployed version's artefact is retrievable for the stated retention period | OPEN |
| **P8-129** | Supply-chain integrity | P8-108 | SBOM, signing, attestation and verification at deployment time | An unsigned or unattested artefact cannot be deployed, proven by test | OPEN |
| **P8-130** | Dependency update management | P8-129 | Tracking and applying dependency and base-image updates | A critical vulnerability in a dependency is detected and its remediation tracked to deployment | OPEN |
| **P8-131** | Configuration release | P8-073 | Releasing configuration changes with the same gates as code | A configuration change follows the same planning, approval and rollback path as code | OPEN |
| **P8-132** | Multi-region release coordination | P8-112 | Coordinating releases across regions with residency and timing constraints | A multi-region release respects each region's constraints, proven by test | OPEN |
| **P8-133** | Release calendar and freeze periods | P8-064 | Declared release windows and freeze periods, enforced | A deployment during a freeze is refused without an explicit, audited override | OPEN |
| **P8-134** | Release performance | P8-112 | Deployment across the full estate within a stated time budget | A full-estate deployment completes within budget at fixture scale, measured | OPEN |
| **P8-135** | Release accessibility | P8-017 | WCAG 2.2 AA across release, deployment and progress surfaces | Every release surface is `axe` clean and keyboard-complete | OPEN |
| **P8-136** | Stage E release proof | P8-117 | A suite deploying, migrating and rolling back across the fixture estate with failure injected at every stage | Every path leaves every tenant consistent, and a deliberately removed health gate is caught | OPEN |

---

## 10. Stage F · Observability, SLOs and incidents (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-137** | Telemetry architecture | P8-011 | Metrics, logs and traces across the estate with consistent labelling | Every signal carries tenant, region, cluster and version labels, enforced at emission | OPEN |
| **P8-138** | Metric taxonomy | P8-137 | A declared metric catalogue with definitions, units and ownership | A metric outside the catalogue fails a gate. Every metric has a stated definition | OPEN |
| **P8-139** | Distributed tracing | P8-137 | End-to-end traces across services with sampling and retention policy | A tenant-reported slow request is traceable end to end without reproduction | OPEN |
| **P8-140** | Log aggregation and retention | P8-137 | Centralised logs with retention, cost control and tenant scoping | A log query is scoped correctly; cross-tenant log exposure is impossible, proven by test | OPEN |
| **P8-141** | Per-tenant observability | P8-137 | Every signal attributable to a tenant for support and analysis | Any tenant's operational picture is answerable from telemetry alone | OPEN |
| **P8-142** | Service level indicators | P8-138 | SLIs defined from real user-facing behaviour, not from proxy metrics | Every SLI measures something a tenant experiences, reviewed and recorded | OPEN |
| **P8-143** | Service level objectives | P8-142 | SLOs per service and per tenant tier with stated targets | Every SLO's attainment is computed from real measurement, not estimated | OPEN |
| **P8-144** | Error budgets | P8-143 | Error budget computation, consumption tracking and policy | Budget consumption is measured continuously and drives the declared policy | OPEN |
| **P8-145** | Error budget policy enforcement | P8-144 | Consequences when a budget is exhausted, applied rather than discussed | An exhausted budget halts non-essential deployment, enforced mechanically | OPEN |
| **P8-146** | Alerting architecture | P8-143 | Alerts derived from SLOs and symptoms rather than from causes | Every alert maps to a user-visible symptom; a cause-only alert fails review | OPEN |
| **P8-147** | Alert quality and noise management | P8-146 | Measuring alert precision, recall and fatigue, and acting on it | Alert precision is measured; an alert below threshold is fixed or removed | OPEN |
| **P8-148** | On-call and escalation | P8-146 | Rotation, escalation, acknowledgement and handover | Every alert reaches an acknowledging human within the stated window, measured | OPEN |
| **P8-149** | Incident lifecycle | P8-148 | Declare, triage, mitigate, resolve, review — with roles and timeline | Every incident has a complete, reconstructible timeline | OPEN |
| **P8-150** | Incident communication | P8-149 | Internal and customer-facing communication driven from the incident record | A customer-facing update is published from one action and reaches every channel | OPEN |
| **P8-151** | Incident impact determination | P8-141 | Computing exactly which tenants an incident affected, from telemetry | The affected tenant set is computed from real data, not estimated | OPEN |
| **P8-152** | Detection lead time | P8-146 | The UX-5 mechanism: measuring whether detection preceded customer reports | Detection lead time is measured per incident, and a customer-first detection is a tracked defect | OPEN |
| **P8-153** | Post-incident review | P8-149 | Blameless review with actions tracked to completion | Every incident above threshold has a review, and its actions are tracked to closure | OPEN |
| **P8-154** | Incident action tracking | P8-153 | Remediation actions with owners, dates and verification | An overdue incident action is escalated; completion requires evidence | OPEN |
| **P8-155** | Runbook automation | P8-149 | Runbooks as executable automation rather than documents | Every runbook is executable and has been executed in rehearsal | OPEN |
| **P8-156** | Diagnostic tooling | P8-139 | Operator tooling to investigate without direct production access | An operator diagnoses a production issue without shell or database access, verified by exercise | OPEN |
| **P8-157** | Synthetic monitoring | P8-142 | Continuous synthetic journeys across every critical path and region | A broken critical path is detected by synthetics before a tenant reports it, measured | OPEN |
| **P8-158** | Real user monitoring | P8-142 | Field measurement of tenant-experienced performance | User-experienced latency is measured from real traffic, not only from synthetics | OPEN |
| **P8-159** | Dependency and third-party monitoring | P8-044 | Monitoring external dependencies and their impact | An external dependency degradation is detected and its impact scoped automatically | OPEN |
| **P8-160** | Anomaly detection | P8-138 | Detecting unusual patterns before they breach thresholds | A seeded anomaly is detected before threshold breach, and removing detection hides it | OPEN |
| **P8-161** | Operational dashboards | P8-143 | Estate, service and tenant dashboards with drill-through | Every dashboard figure drills to its underlying telemetry | OPEN |
| **P8-162** | Status page integration | P8-150 | Driving the public status page from real incident and SLO data | The public status page reflects real data and is updated from the incident record | OPEN |
| **P8-163** | SLA tracking and reporting | P8-143 | Contractual SLA attainment computed and reported per tenant | SLA attainment is computed from measurement and drives credits automatically | OPEN |
| **P8-164** | Telemetry cost management | P8-140 | Controlling observability cost through sampling, retention and cardinality limits | Telemetry cost is attributed and bounded; a cardinality explosion is detected and contained | OPEN |
| **P8-165** | Observability data retention and privacy | P8-140 | Retention and personal-data handling in telemetry | No personal data reaches telemetry unmasked, verified by inspection | OPEN |
| **P8-166** | Chaos and failure injection in production | P8-155 | Controlled failure injection to verify resilience assumptions | Each documented resilience assumption is verified by injection, not assumed | OPEN |
| **P8-167** | Observability accessibility | P8-017 | WCAG 2.2 AA across dashboards, timelines and every chart | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P8-168** | Stage F detection proof | P8-152 | A suite seeding faults of every class and asserting detection, alerting and impact scoping | Every fault is detected before the simulated customer report, and removing a detector makes it customer-first | OPEN |

---

## 11. Stage G · Capacity, performance and scaling (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-169** | Capacity model | P8-041 | Capacity expressed per resource class with committed, used and available | Available capacity is computed from measurement, never from static configuration | OPEN |
| **P8-170** | Demand forecasting | P8-169 | Forecasting capacity need from real growth and usage patterns | A forecast's inputs and method are auditable and its accuracy measured against outcome | OPEN |
| **P8-171** | Capacity planning | P8-170 | Planning provisioning ahead of demand with lead times | A capacity shortfall is predicted with enough lead time to act, measured | OPEN |
| **P8-172** | Automatic scaling | P8-169 | Scaling compute and storage on real signals with bounds | Scaling responds within the stated window and never exceeds declared bounds, proven under load | OPEN |
| **P8-173** | Scale-down and reclamation safety | P8-172 | Scaling down without disrupting tenants or losing work | A scale-down drains and completes in-flight work, proven under load | OPEN |
| **P8-174** | Tenant placement optimisation | P8-063 | Placing tenants to balance load, cost and isolation within policy | A placement decision is explainable and respects every policy constraint | OPEN |
| **P8-175** | Rebalancing | P8-174 | Moving tenants to correct imbalance, within migration constraints | A rebalance improves the measured imbalance and respects each tenant's window | OPEN |
| **P8-176** | Resource limits and isolation | P8-088 | Per-tenant compute, memory, storage and I/O limits enforced at the platform | A tenant cannot exceed its limits or degrade a neighbour, proven under adversarial load | OPEN |
| **P8-177** | Performance baselines | P8-158 | Declared performance baselines per operation and tenant tier | Every baseline is measured; a regression against it is detected automatically | OPEN |
| **P8-178** | Performance regression detection | P8-177 | Detecting regressions in production against baselines | A seeded regression is detected within the stated window, and removing detection hides it | OPEN |
| **P8-179** | Database performance management | P8-024 | Query performance, index health, connection and lock management across the fleet | A pathological query is detected and attributable to its tenant and origin | OPEN |
| **P8-180** | Query and workload governance | P8-179 | Limiting expensive workloads so one tenant cannot exhaust shared capacity | An expensive workload is bounded and its owner notified, proven under load | OPEN |
| **P8-181** | Caching architecture and management | P8-169 | Cache tiers, hit rates, invalidation correctness and capacity | Cache invalidation correctness is asserted; a stale read beyond its window is proven impossible | OPEN |
| **P8-182** | Queue and background work management | P8-169 | Queue depth, throughput, backlog and per-tenant fairness | A backlog is detected and its cause attributable; one tenant cannot starve another | OPEN |
| **P8-183** | Peak and seasonal load handling | P8-172 | Handling predictable peaks such as month-end close across the fleet | A simulated fleet-wide month-end completes within its window, measured | OPEN |
| **P8-184** | Traffic management and shedding | P8-176 | Prioritised load shedding that degrades gracefully under extreme load | Under overload the platform sheds by declared priority rather than failing arbitrarily | OPEN |
| **P8-185** | Multi-region traffic routing | P8-022 | Routing tenants to regions with failover and residency respect | Failover routing never violates a tenant's residency constraint, proven by test | OPEN |
| **P8-186** | Performance testing in production | P8-166 | Safe production load testing with bounded blast radius | A production load test is bounded, aborts on impact, and never affects an unconsenting tenant | OPEN |
| **P8-187** | Capacity and performance reporting | P8-171 | Reporting utilisation, headroom, saturation and forecast | Every figure derives from measurement and drills to its source | OPEN |
| **P8-188** | Efficiency measurement | P8-169 | Measuring resource efficiency per tenant and per workload | Efficiency is measured, and inefficient workloads are identifiable from data | OPEN |
| **P8-189** | Capacity accessibility | P8-017 | WCAG 2.2 AA across capacity and performance surfaces | Every capacity surface is `axe` clean, with accessible chart equivalents | OPEN |
| **P8-190** | Stage G scaling proof | P8-172 | A suite driving the fixture estate through growth, peak, failure and scale-down | The estate scales and recovers within stated bounds, and a removed limit lets one tenant degrade others | OPEN |

---

## 12. Stage H · Cost, FinOps and unit economics (Wave 3)

Track M's founding entry records that cost ingestion and allocation had **zero hits in the tree**, and
that Track K's cost-per-tenant requirement therefore had no supplier. This stage is that supplier.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-191** | Cost ingestion | P8-021 | Ingesting billing and usage data from every provider into one model | Ingested cost reconciles to each provider's own invoice within the stated tolerance | OPEN |
| **P8-192** | Cost model and normalisation | P8-191 | Normalising heterogeneous provider costs into comparable units | Costs from different providers are comparable on a stated basis, verified by test | OPEN |
| **P8-193** | Resource-to-tenant attribution | P8-030 | Attributing every cost to a tenant, service or shared pool | Every cost is attributed or explicitly classified as unattributable; unattributed cost is bounded and reported | OPEN |
| **P8-194** | Shared cost allocation | P8-193 | Allocating shared infrastructure cost by a declared, defensible method | Allocated cost sums to total cost exactly, asserted by reconciliation | OPEN |
| **P8-195** | Cost per tenant | P8-194 | The cost of serving each tenant, computed rather than estimated | Cost per tenant is answerable from data for every tenant, and sums to total cost | OPEN |
| **P8-196** | Cost derivation and drill-through | P8-195 | The UX-7 mechanism: every cost figure drillable to the resources behind it | No cost figure is a dead end; each drills to resource-level detail | OPEN |
| **P8-197** | Unit economics | P8-195 | Cost per tenant against revenue per tenant, producing real margin | Margin per tenant is computed from real cost and real revenue, not modelled | OPEN |
| **P8-198** | Margin analysis and outliers | P8-197 | Identifying unprofitable tenants, plans and workloads | An unprofitable tenant is identifiable from data with its cost drivers named | OPEN |
| **P8-199** | Cost forecasting | P8-170 | Forecasting cost from growth, usage and committed capacity | Forecast accuracy is measured against outcome and reported | OPEN |
| **P8-200** | Budget and spend control | P8-199 | Budgets per service, region and provider with alerting | A budget overrun is detected and alerted before period end, verified by rehearsal | OPEN |
| **P8-201** | Cost anomaly detection | P8-191 | Detecting unexpected cost changes quickly | A seeded cost spike is detected within the stated window with its cause attributed | OPEN |
| **P8-202** | Commitment and reservation management | P8-171 | Managing committed spend, reservations and their utilisation | Commitment utilisation is measured; underutilisation is reported before renewal | OPEN |
| **P8-203** | Cost optimisation recommendations | P8-188 | Concrete, actionable savings identified from real measurement | Every recommendation states its expected saving and is verifiable after application | OPEN |
| **P8-204** | Waste elimination | P8-031 | Acting on orphaned, idle and oversized resources | Identified waste is tracked to elimination with the saving measured | OPEN |
| **P8-205** | Cost of telemetry and tooling | P8-164 | Attributing and controlling the cost of the operational stack itself | Operational tooling cost is attributed and bounded like any other cost | OPEN |
| **P8-206** | Cost of support | P8-247 | Attributing support effort to tenants and causes | Cost to serve includes support effort, measured rather than assumed | OPEN |
| **P8-207** | Pricing feedback | P8-197 | Feeding real unit economics into pricing decisions | A plan priced below its cost to serve is identified from data | OPEN |
| **P8-208** | Cost reporting and dashboards | P8-196 | Cost dashboards by every dimension with drill-through | Every cost figure is defined, sourced and drillable | OPEN |
| **P8-209** | Cost data retention and history | P8-191 | Historical cost data enabling trend and comparison | Cost history is retained for the stated period and remains queryable | OPEN |
| **P8-210** | Chargeback and showback | P8-193 | Internal chargeback to teams and services | Chargeback figures reconcile to ingested cost exactly | OPEN |
| **P8-211** | Cost governance and approval | P8-200 | Approval requirements for spend-increasing changes | A change materially increasing cost requires approval, with the increase estimated beforehand | OPEN |
| **P8-212** | Cost-aware placement | P8-174 | Placement decisions accounting for cost within policy constraints | A placement decision states its cost implication, and policy always outranks cost | OPEN |
| **P8-213** | Provider cost comparison | P8-192 | Comparing the real cost of running on different providers | Comparison is based on ingested cost, not on list price | OPEN |
| **P8-214** | Cost API and export | P8-208 | Programmatic access to cost data for finance systems | Exported cost reconciles to the dashboard and to provider invoices exactly | OPEN |
| **P8-215** | Cost accessibility | P8-017 | WCAG 2.2 AA across cost surfaces including every chart | Every cost chart has a screen-reader-navigable equivalent | OPEN |
| **P8-216** | Stage H cost proof | P8-195 | A suite asserting ingested cost reconciles to provider invoices, allocation sums to total, and cost per tenant is complete | All three reconcile, and a seeded attribution error is caught by reconciliation | OPEN |

---

## 13. Stage I · Provider security operations and compliance (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-217** | Operator identity and lifecycle | P8-008 | Provider staff identity, joining, moving and leaving with access effects | Offboarding revokes every operator access path within the stated window, verified exhaustively | OPEN |
| **P8-218** | Operator role model | P8-009 | Least-privilege roles for each operational function | Each role is proven unable to perform capabilities outside its set | OPEN |
| **P8-219** | Just-in-time privileged access | P8-218 | Elevation requiring justification, approval and automatic expiry | Standing privileged access does not exist; every elevation is time-boxed and audited | OPEN |
| **P8-220** | Production access control | P8-219 | Controlling and eliminating direct production access | Direct production access is exceptional, audited, and its frequency measured and falling | OPEN |
| **P8-221** | Tenant data access controls | P8-220 | Strict controls on provider access to tenant data, with consent where required | Access to tenant data without an authorised reason is impossible, proven by test | OPEN |
| **P8-222** | Support access consent and transparency | P8-221 | Time-boxed, consented, tenant-visible support access | Support access without recorded consent is impossible; every access is visible to the tenant | OPEN |
| **P8-223** | Break-glass procedures | P8-070 | Emergency access with strict controls, alerting and mandatory review | Every break-glass use alerts immediately and is reviewed, verified by rehearsal | OPEN |
| **P8-224** | Operator action audit | P8-010 | Complete, tamper-evident audit of every operator action | A modified audit record is detectable by verification, proven by a seeded modification | OPEN |
| **P8-225** | Operator behaviour monitoring | P8-224 | Detecting unusual operator behaviour and potential insider risk | A seeded anomalous operator pattern is detected, and removing detection hides it | OPEN |
| **P8-226** | Segregation of duties for operators | P8-218 | Preventing one operator from both initiating and approving high-risk change | A single operator cannot complete a conflicting pair, enforced mechanically | OPEN |
| **P8-227** | Security posture of the estate | P8-046 | Measured security posture across every estate component | The posture score is reproducible from configuration, and each deduction names its fix | OPEN |
| **P8-228** | Vulnerability management | P8-130 | Detecting, prioritising and remediating vulnerabilities across the estate | A critical vulnerability is tracked to remediation within its stated window | OPEN |
| **P8-229** | Patch management | P8-228 | Applying security patches across the fleet within stated windows | Patch coverage is measured; an unpatched component past its window escalates | OPEN |
| **P8-230** | Threat detection | P8-225 | Detecting attacks against the platform and against tenants | Each seeded attack pattern is detected, and removing its rule makes it pass unnoticed | OPEN |
| **P8-231** | Security incident response | P8-149 | Security incidents handled with containment, forensics and notification | A rehearsed security incident is contained within the stated window | OPEN |
| **P8-232** | Forensics and evidence preservation | P8-224 | Preserving evidence for investigation without altering it | Evidence integrity is verifiable, proven by a seeded tampering attempt | OPEN |
| **P8-233** | Breach detection and notification | P8-231 | Detecting breaches and meeting statutory notification timelines | A rehearsed breach produces the required notifications within the statutory window | OPEN |
| **P8-234** | Network security and segmentation | P8-025 | Network isolation between tenants, services and environments | A seeded lateral-movement attempt fails at the network boundary, proven by test | OPEN |
| **P8-235** | Encryption and key management | P8-045 | Encryption at rest and in transit with key rotation across the estate | Rotation completes without data loss or downtime, verified by rehearsal | OPEN |
| **P8-236** | Customer-managed key operations | P8-235 | Operating tenant-supplied keys including revocation | Key revocation renders that tenant's data unreadable within the stated window, verified | OPEN |
| **P8-237** | Compliance framework operations | P8-227 | Operating against the frameworks the platform is certified for | Every control has an operating mechanism and evidence, not a policy document alone | OPEN |
| **P8-238** | Compliance evidence generation | P8-237 | Evidence produced by mechanism across the estate | Every control produces evidence automatically; a hand-written claim fails the check | OPEN |
| **P8-239** | Audit and assessment support | P8-238 | Supporting external audits with scoped access and generated evidence | An audit request is satisfiable from generated evidence, verified by rehearsal | OPEN |
| **P8-240** | Continuous control monitoring | P8-238 | Monitoring control effectiveness rather than testing annually | A failing control is detected within the stated window, not at audit | OPEN |
| **P8-241** | Data residency and sovereignty operations | P8-096 | Operating residency guarantees including in failover and backup | Failover and backup never violate residency, proven by query across regions | OPEN |
| **P8-242** | Sub-processor management | P8-044 | Managing the sub-processor chain with disclosure and change control | A new sub-processor cannot receive data before disclosure, enforced by egress control | OPEN |
| **P8-243** | Security testing programme | P8-230 | Continuous security testing including penetration testing and red teaming | Findings are tracked to remediation, each with a test that fails without the fix | OPEN |
| **P8-244** | Security training and readiness | P8-217 | Operator security training with verified completion | An operator without current training cannot hold privileged access, enforced | OPEN |
| **P8-245** | Security accessibility | P8-017 | WCAG 2.2 AA across security operations surfaces | Every security surface is `axe` clean and keyboard-complete | OPEN |
| **P8-246** | Stage I adversarial proof | P8-230 | An adversarial suite attempting privilege escalation, lateral movement, data access and audit tampering | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 14. Stage J · Customer operations and support (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-247** | Support case management | P8-141 | Cases with tenant context, severity, ownership and SLA | Every case carries the tenant's real operational context automatically | OPEN |
| **P8-248** | Tenant context surface for support | P8-099 | One view of a tenant's plan, version, health, incidents, usage and history | A support agent answers a tenant question without querying a database, verified by exercise | OPEN |
| **P8-249** | Support diagnostics | P8-156 | Diagnostic tooling scoped to a tenant with consent and audit | A diagnosis is performed without direct data access where possible, and access is consented and audited | OPEN |
| **P8-250** | Support escalation | P8-148 | Escalation from support into engineering with context preserved | An escalated case reaches engineering with reproduction and telemetry attached | OPEN |
| **P8-251** | Severity and SLA management | P8-247 | Severity definitions, response targets and their measurement | SLA attainment is measured per case; breaches escalate automatically | OPEN |
| **P8-252** | Proactive support | P8-099 | Contacting tenants about problems before they report them | Proactive contact rate is measured, and a customer-first report is a tracked defect | OPEN |
| **P8-253** | Tenant communication | P8-150 | Coordinated communication for incidents, maintenance and changes | Every affected tenant is reached within the stated window, verified by rehearsal | OPEN |
| **P8-254** | Customer health and success | P8-099 | Adoption, usage and risk signals per tenant | A tenant at churn risk is identifiable from real usage signals | OPEN |
| **P8-255** | Onboarding operations | P8-100 | Provider-side operational support of tenant onboarding | Onboarding progress and blockers are visible per tenant | OPEN |
| **P8-256** | Migration and data services | P8-101 | Provider-assisted data migration with rehearsal and verification | An assisted migration reconciles to source exactly and is rehearsed before execution | OPEN |
| **P8-257** | Professional services operations | P8-255 | Tracking provider-delivered services against tenants | Service effort is attributable to tenants and feeds cost to serve | OPEN |
| **P8-258** | Tenant reporting for account teams | P8-248 | Per-tenant operational reporting for commercial conversations | Every figure derives from measurement and drills to source | OPEN |
| **P8-259** | Service credit administration | P8-163 | Computing and applying SLA credits from measured attainment | An SLA breach produces the entitled credit automatically, verified against the definition | OPEN |
| **P8-260** | Customer feedback loop | P8-250 | Routing tenant-reported defects into engineering with tracking | A tenant-reported defect is tracked to resolution and its reporter informed | OPEN |
| **P8-261** | Knowledge management for operators | P8-155 | Operational knowledge captured, searchable and current | Operator knowledge search returns useful results, measured against a real query corpus | OPEN |
| **P8-262** | Support quality measurement | P8-251 | Measuring resolution quality, reopens and satisfaction | Support quality is measured, and its trend is visible | OPEN |
| **P8-263** | Tenant offboarding operations | P8-083 | Provider-side offboarding with export, verification and deletion | Offboarding completes with verified export and verified deletion, both evidenced | OPEN |
| **P8-264** | Multi-tenant support isolation | P8-221 | Preventing support tooling from leaking one tenant's data to another | A support surface never shows data from a tenant other than the one in context, proven by test | OPEN |
| **P8-265** | Support tooling performance | P8-016 | Support surfaces within interaction budget at estate scale | Tenant context loads within budget at fixture estate scale, measured | OPEN |
| **P8-266** | Support tooling accessibility | P8-017 | WCAG 2.2 AA across support surfaces | Every support surface is `axe` clean and keyboard-complete | OPEN |
| **P8-267** | Operational maturity measurement | P8-262 | Measuring the operation itself: automation rate, manual intervention, lead times | Operational maturity is measured, not asserted, and its trend is visible | OPEN |
| **P8-268** | Toil measurement and elimination | P8-267 | The UX-6 mechanism: repeated manual operations counted, owned and eliminated | Toil is measured per operation class; an operation above threshold gets an owner and an elimination plan | OPEN |
| **P8-269** | Operational documentation | P8-261 | Runbooks, procedures and architecture documentation generated or verified | Every documented procedure has been executed in rehearsal within its review period | OPEN |
| **P8-270** | Stage J proof | P8-264 | A suite asserting support context correctness, isolation, consent enforcement and SLA measurement | Every guarantee holds, and a seeded cross-tenant leak in support tooling is caught | OPEN |

---

## 15. Stage K · Data operations, backup and disaster recovery (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-271** | Backup architecture | P8-024 | Backup covering every data store with declared scope and frequency | Every data store has a backup with declared coverage; an uncovered store is detected | OPEN |
| **P8-272** | Backup verification | P8-271 | Continuous verification that backups are restorable, not merely present | A backup never verified by restore is reported as unverified, never as protected | OPEN |
| **P8-273** | Point-in-time recovery | P8-271 | Recovery to any point within the declared window | A restore to a chosen minute reproduces consistent state, verified by comparison | OPEN |
| **P8-274** | Per-tenant restore | P8-273 | Restoring one tenant without affecting others | A single-tenant restore leaves every other tenant untouched, proven by test | OPEN |
| **P8-275** | Backup residency and encryption | P8-241 | Backups honouring residency and encrypted with managed keys | A residency-restricted tenant's backups are provably absent from other regions | OPEN |
| **P8-276** | Backup retention and cost | P8-209 | Retention policy balancing obligation and cost, enforced | Backups past retention are deleted on schedule, verified by query | OPEN |
| **P8-277** | Disaster recovery plan | P8-273 | Documented, tested recovery for each failure class with stated objectives | Every failure class has a rehearsed recovery meeting its stated objective | OPEN |
| **P8-278** | Regional failover | P8-185 | Failing over a region with tenant continuity and residency respect | A rehearsed regional failover meets its objective without violating residency | OPEN |
| **P8-279** | Recovery objective verification | P8-277 | Measuring actual recovery point and time against declared objectives | Measured recovery meets declared objectives, or the objective is corrected rather than the measurement | OPEN |
| **P8-280** | Recovery rehearsal cadence | P8-279 | Scheduled, recorded recovery rehearsals with results | Rehearsals occur on schedule and their results are recorded; a missed rehearsal escalates | OPEN |
| **P8-281** | Data consistency verification | P8-273 | Verifying cross-store consistency after recovery | A recovered estate is verified consistent across every store, asserted by comparison | OPEN |
| **P8-282** | Data corruption detection | P8-281 | Detecting corruption before it propagates into backups | Seeded corruption is detected within the stated window, before backup rotation | OPEN |
| **P8-283** | Data migration between stores | P8-115 | Moving data between database versions, engines and providers | A migration reconciles source to target exactly and rolls back cleanly | OPEN |
| **P8-284** | Bulk data operations | P8-090 | Fleet-wide data operations with per-tenant outcome and rollback | A bulk data operation reports per-tenant outcome and never partially applies silently | OPEN |
| **P8-285** | Data retention across the estate | P8-276 | Executing retention policy across every tenant and store | Retention executes on schedule across the estate, verified by query | OPEN |
| **P8-286** | Verifiable deletion | P8-083 | Deletion verifiable across primary storage, replicas and backups | Deleted data is absent from every store within the stated window, verified by query in each | OPEN |
| **P8-287** | Data export at provider scale | P8-263 | Exporting tenant data reliably at any size | A large tenant's export completes and reimports exactly, verified by comparison | OPEN |
| **P8-288** | Archive and cold storage | P8-276 | Archiving cold data with retrieval guarantees | Archived data is retrievable within its stated window, verified by rehearsal | OPEN |
| **P8-289** | Data lineage across the estate | P8-193 | Tracking where data originates, moves and rests | Any data category's location and flow is answerable from generated lineage | OPEN |
| **P8-290** | Replication and consistency management | P8-024 | Managing replication lag, failover consistency and split-brain prevention | Split-brain is prevented, proven by injection; replication lag is measured and bounded | OPEN |
| **P8-291** | Database version management | P8-024 | Upgrading database engines across the fleet safely | A fleet database upgrade completes per tenant with rollback available, proven by rehearsal | OPEN |
| **P8-292** | Data operations audit | P8-224 | Audit of every bulk data operation, export and deletion | Every data operation is attributable with its affected tenant set | OPEN |
| **P8-293** | Data operations performance | P8-016 | Backup, restore and migration within stated time budgets at scale | Each data operation meets its budget at fixture estate scale, measured | OPEN |
| **P8-294** | Data operations accessibility | P8-017 | WCAG 2.2 AA across backup, restore and data operation surfaces | Every data operations surface is `axe` clean and keyboard-complete | OPEN |
| **P8-295** | Business continuity for the provider | P8-277 | Continuity of the provider's own operations during a disaster | The provider can operate the estate with its primary console region unavailable, verified by rehearsal | OPEN |
| **P8-296** | Stage K recovery proof | P8-280 | A suite rehearsing recovery for every failure class with verification | Every class recovers within its objective with verified consistency, and an unverified backup is reported as such | OPEN |

---

## 16. Stage L · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P8-297** | Coverage that can fail | P8-020 | Coverage across this programme with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P8-298** | Unit and component testing | P8-297 | Unit coverage of the reconciliation engine, cost allocator, placement policy and blast-radius classifier | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P8-299** | Integration testing against real infrastructure | P8-018 | Integration suites against real infrastructure and real provider APIs in test mode | The suite runs against real infrastructure in CI; a mock-only pass is caught | OPEN |
| **P8-300** | Reconciliation property testing | P8-078 | Property-based testing of convergence over generated estate states | Convergence holds across 10,000 generated states, and a weakened loop is caught immediately | OPEN |
| **P8-301** | Fleet-scale testing | P8-106 | Testing fleet operations against the 10,000-tenant fixture estate | Fleet operations behave correctly at fixture scale, with per-target outcomes verified | OPEN |
| **P8-302** | End-to-end operational journeys | P8-136 | Automated journeys: provision, deploy, migrate, scale, fail over, recover, offboard | Each journey runs in CI against a real environment and fails when any step regresses | OPEN |
| **P8-303** | Isolation testing across the estate | P8-086 | Isolation tests for every shared component and support surface | A surface without an isolation test fails a coverage gate. Every test proves **zero** cross-tenant reads | OPEN |
| **P8-304** | Chaos engineering programme | P8-166 | Systematic failure injection across every tier, in staging and bounded in production | Every documented resilience assumption is verified by injection, and an unverified one is filed | OPEN |
| **P8-305** | Load and scale testing | P8-190 | Load profiles for the estate including peak and failure conditions | Targets met at peak profile; a regression beyond threshold fails CI | OPEN |
| **P8-306** | Soak and endurance testing | P8-305 | Long-running tests detecting leaks, drift accumulation and scheduler decay | A 24-hour soak shows no unbounded growth and no reconciliation decay | OPEN |
| **P8-307** | Accessibility audit across the estate | P8-017 | Full WCAG 2.2 AA audit of every console surface, including all 139 pages | The estate is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P8-308** | Security testing and red team | P8-246 | Scanning, penetration testing and a red-team exercise against the provider plane | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P8-309** | Disaster recovery rehearsal | P8-296 | Full-scale recovery rehearsal including regional loss | The rehearsal meets its objective with verified consistency, recorded | OPEN |
| **P8-310** | Cost reconciliation verification | P8-216 | Continuous verification that ingested cost reconciles to provider invoices | A seeded reconciliation error is caught; the check has been proven able to fail | OPEN |
| **P8-311** | Operational readiness review | P8-267 | Every operational capability evidenced by rehearsal rather than documentation | Every capability has a recorded rehearsal within its review period; an unrehearsed one blocks | OPEN |
| **P8-312** | The state-agreement proof | P8-078 | The § 1 invariant made mechanical: seeded divergence in desired state, actual state and the console's view, in each direction | Every divergence is detected within its window and attributable, and disabling any detector makes its divergence persist unnoticed | OPEN |
| **P8-313** | The actionability proof | P8-003 | The UX-1 invariant, closing **D044**: every console surface rendering mutable state can act on it or carries a recorded exemption | The census passes with zero unjustified read-only surfaces, and a seeded read-only surface fails the gate | OPEN |
| **P8-314** | Programme 8 launch readiness | P8-313 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 17 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 17. Programme exit criteria

- [ ] **Desired state, actual state and the console's view agree; divergence is detected and attributable** (P8-312)
- [ ] **Every console surface rendering mutable state can act on it, or carries a recorded exemption — closing D044** (P8-002, P8-313)
- [ ] A manually altered resource converges back to declared intent within its window (P8-052)
- [ ] Every operation states its blast radius before it runs, and the preview matches exactly (P8-085)
- [ ] Acting on one tenant and on ten thousand uses the same code path (P8-090)
- [ ] A partial fleet failure reports per target and is never reported as success (P8-058, P8-093)
- [ ] Cost per tenant is computed from ingested provider data and sums to total cost (P8-195, P8-216)
- [ ] Ingested cost reconciles to each provider's own invoice within tolerance (P8-191, P8-310)
- [ ] Margin per tenant is computed from real cost and real revenue, not modelled (P8-197)
- [ ] Detection precedes customer reports, and a customer-first detection is a tracked defect (P8-152, P8-252)
- [ ] Every SLO is computed from real measurement; an exhausted error budget halts non-essential deployment (P8-143, P8-145)
- [ ] Standing privileged access does not exist; every elevation is time-boxed and audited (P8-219)
- [ ] Support access without recorded consent is impossible, and is visible to the tenant (P8-222)
- [ ] Audit is append-only and tamper-evident; a modified record is detectable (P8-224)
- [ ] Failover and backup never violate a tenant's residency (P8-241, P8-275)
- [ ] A backup never verified by restore is reported as unverified, never as protected (P8-272)
- [ ] Deleted tenant data is absent from primary storage, replicas and backups within the stated window (P8-286)
- [ ] Every documented resilience assumption is verified by injection, not assumed (P8-304)
- [ ] Every operational capability is evidenced by rehearsal, not by documentation (P8-311)
- [ ] Toil is measured per operation class and has owners and elimination plans (P8-268)
- [ ] Every surface has isolation tests proving **zero** cross-tenant reads (P8-303)
- [ ] Coverage thresholds have been proven able to fail (P8-297)
- [ ] Every UI primitive lives in `unierp-design-system` with a story; zero hardcoded colours or spacing (P8-013)

---

## 18. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 8 established (P8-001–P8-314), the Platform Admin OS.** Registered per README § 0 rule 1. This programme has the most substantial predecessor in the family — Track C at 29/29 and Track M at 46/49 — and it begins by testing whether their central defect recurred rather than assuming it did not. **D044** recorded that Track C's exit criterion was satisfied by 132 read-only route pages that rendered the estate and could not change it; Track M was established to fix exactly that. `P8-002` re-measures all 139 console pages for actionability and `P8-003` gates new ones, because a page that renders state it cannot act on is the defect this plane keeps producing. Stage C makes declarative desired-state operation the default, which Track M's founding entry recorded as having zero relevant hits in the tree. | Claude Code |
