# PROGRAMME 13 · INTEGRATION AND THE v1.0 RELEASE — P13-001–P13-330

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 13` resolves waves from this
> document and can only ever hand out a `P13-` phase.

---

## 0. Why this programme exists

Twelve programmes were made independent on purpose: no `Depends` cell crosses a programme boundary,
and every real relationship is discharged by a runtime precondition gate that asserts a capability
and degrades explicitly if it is absent. That was the right decision and it is what makes the
platforms separately executable.

**It has one cost, and this programme is the payment.**

A precondition gate proves a capability is *present*. It does not prove it is *correct for the
consumer*. Programme 3 asserts that `P2-334`'s publication contract exists; nothing yet proves that a
package Programme 2 actually produces installs through the pipeline Programme 3 actually built. Every
programme has a launch-readiness phase, and each proves that *programme*. **None of them proves the
platform.**

So this programme owns two things the other twelve structurally cannot:

1. **Integration** — that the twelve work together in a running system.
2. **The release** — executing the go-live gate in
   [`04-V1-RELEASE-DEFINITION.md § 5`](04-V1-RELEASE-DEFINITION.md).

**This programme runs throughout, not at the end.** Its integration phases attach to whatever exists,
the way Track J does for Programme 1. Saving integration for the end is how integration defects
become expensive; `04-V1-RELEASE-DEFINITION § 3` states this explicitly and it is repeated here
because it is the single most likely thing to be got wrong about this document.

---

## 1. What this programme owns

The seams, the whole-system properties, and the release.

**The invariant this programme establishes:**

> **The platform is one system, and it is provably ready to be operated by people who did not build
> it, for customers who were not consulted while it was built.**

`P13-248` is the mechanical proof of the first half and `P13-249` of the second.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Programmes to integrate | **12** | `docs/programme/plan-manifest.json` |
| Phases across them | 3,961 (of which 243 DONE) | `node scripts/phase-brief.mjs --status` |
| Cross-programme integration phases before this document | **0** | `grep -c 'cross-programme' docs/programme/3*.md` |
| Repositories | 29, plus a desktop repository P11 creates | `ls -d unierp-*/` |

The third row is the finding that produced this programme. Twelve programme documents, 3,961 phases,
and **not one phase anywhere proved two programmes working together.** That is not an oversight in
any single programme — each was correct within its own boundary. It is a gap that only exists
*between* them, which is exactly why it needed its own owner.

**Reference set.** Google's release engineering and SRE practice (release trains, error budgets,
launch readiness reviews), Amazon's operational readiness review, Etsy and GitHub on continuous
delivery across many services, Pact and consumer-driven contract testing at scale, Netflix on
production chaos as verification, and the standard enterprise-software disciplines this platform's
customers will expect: parallel running, cutover rehearsal, and reconciled opening balances.

---

## 2. Principles

| # | Principle | Enforced by |
| :- | :-------- | :---------- |
| **IP-1** | **Integration is continuous, not a phase at the end.** | `P13-011` |
| **IP-2** | **A seam is owned.** Every programme-to-programme interface has a named owner and a test. | `P13-012` |
| **IP-3** | **Whole-system properties are measured on the whole system.** Twelve budgets met individually prove nothing about the composition. | `P13-101` |
| **IP-4** | **Readiness is rehearsed, never documented.** A runbook that has not been executed is a wish. | `P13-161` |
| **IP-5** | **The release gate cannot be softened, only met.** Changing a criterion is an amendment with a reason, in the open. | `P13-241` |
| **IP-6** | **A customer's data is sacred at the seams too.** Isolation is proven across programmes simultaneously, not one at a time. | `P13-071` |
| **IP-7** | **Nothing ships whose claim lacks a mechanism that can fail.** | `P13-247` |

---

## 3. Waves

### Wave 0 · "The seams, named"
**Phases:** P13-001–P13-030 · Programme inventory, the seam register, the integration environment, and the BLOCKED-phase watch.

### Wave 1 · "Contracts across programmes"
**Phases:** P13-031–P13-070 · Cross-programme contract conformance in a running system.

### Wave 2 · "The system as one"
**Phases:** P13-071–P13-130 · P13-251–P13-280 · Cross-programme isolation, end-to-end journeys, whole-system performance, and the journey register's foundations.

### Wave 3 · "Operability"
**Phases:** P13-131–P13-180 · P13-281–P13-310 · Running it, and the domain journey suites.

### Wave 4 · "Customers"
**Phases:** P13-181–P13-220 · P13-311–P13-330 · Migration, cutover, onboarding, and the remaining persona journeys and coverage proofs.

### Wave 5 · "The release"
**Phases:** P13-221–P13-250 · Executing the go-live gate and the two proofs.

**Stage G (P13-251–P13-330), the journey register, is distributed across Waves 2, 3 and 4** rather
than given a wave of its own. Journeys are registered as the capabilities they exercise land, and
the coverage gate tightens as the register fills. Left to the end it would be a backlog nobody
could clear.

---

## 4. Stage A · The seams (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-001** | Programme charter | — | A manifest declaring this programme writes to integration and release surfaces, and never into another programme's implementation | A P13 commit modifying another programme's implementation fails CI. Deleting the declaration fails CI | OPEN |
| **P13-002** | Programme and capability inventory | P13-001 | Every programme's declared capabilities, precondition assertions and published contracts, generated from the programme documents | The inventory is generated, not maintained. A programme's capability absent from it fails the gate | OPEN |
| **P13-003** | The seam register | P13-002 | The IP-2 mechanism: every programme-to-programme interface enumerated, with a named owning phase on each side | A precondition assertion with no corresponding provider in the register fails the gate | OPEN |
| **P13-004** | The BLOCKED-phase watch | P13-002 | Continuous reporting of phases blocked on absent infrastructure, so they cannot accumulate silently — the E38/E44/I11/J25/G05/H05 pattern | Every BLOCKED phase has a current, re-tested blocker and a named unblocking condition. A blocker untested for its review period escalates | OPEN |
| **P13-005** | Integration environment | P13-001 | A running environment with every programme deployed together, provisioned from declared infrastructure | Every programme is deployed and reachable in one environment, verified by request | OPEN |
| **P13-006** | Integration environment lifecycle | P13-005 | Creating, refreshing, seeding and tearing down the integration environment reproducibly | The environment rebuilds from scratch within its budget, verified by rehearsal | OPEN |
| **P13-007** | Shared integration fixtures | P13-006 | One realistic tenant estate every cross-programme test uses | Every integration test uses the shared estate; a test with its own fixture duplicating it fails review | OPEN |
| **P13-008** | Integration test harness | P13-007 | Multi-programme test driver: deploy, seed, act across surfaces, assert across boundaries | A cross-programme test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |
| **P13-009** | Version matrix | P13-002 | Which version of each programme is integrated against which, and how skew is handled | A version combination outside the supported matrix is refused, not silently attempted | OPEN |
| **P13-010** | Deployment topology | P13-005 | The declared arrangement of services, planes and boundaries in a real deployment | A deployed topology diverging from the declaration is detected as drift | OPEN |
| **P13-011** | Continuous integration cadence | P13-008 | The IP-1 mechanism: cross-programme suites running continuously, not before release | Integration suites run on every programme's changes, and a break is attributed to the causing programme within the stated window | OPEN |
| **P13-012** | Seam ownership enforcement | P13-003 | Every seam having a test on both sides, and a named owner for failures | A seam without tests on both sides fails the register gate, proven on a seeded seam | OPEN |
| **P13-013** | Integration failure attribution | P13-011 | Attributing a cross-programme failure to the programme that caused it | A seeded break in one programme is attributed to that programme, not to its consumer | OPEN |
| **P13-014** | Integration observability | P13-005 | Tracing a request across every programme boundary in the integration environment | A journey spanning four programmes is traceable end to end by one correlation ID | OPEN |
| **P13-015** | Shared identity across programmes | P13-005 | One principal authenticating correctly across every programme's surfaces | A single sign-in reaches every surface the principal is entitled to, and none it is not | OPEN |
| **P13-016** | Shared tenancy across programmes | P13-015 | One tenant context resolving identically in every programme | A tenant context resolves to the same tenant in every programme, verified differentially | OPEN |
| **P13-017** | Cross-programme event flow | P13-014 | Events published by one programme consumed correctly by another | An event crossing a programme boundary is delivered and handled, proven per event type | OPEN |
| **P13-018** | Cross-programme error propagation | P13-013 | An error in one programme surfacing usefully in another, not as a generic failure | A downstream failure surfaces with its cause attributed, never as an opaque error | OPEN |
| **P13-019** | Cross-programme permission consistency | P13-015 | One subject's permissions evaluating identically across programmes | Two programmes never disagree on whether a subject may act, verified differentially | OPEN |
| **P13-020** | Cross-programme configuration consistency | P13-010 | Shared configuration resolving identically across programmes | A setting resolves to the same value in every programme, verified differentially | OPEN |
| **P13-021** | Cross-programme localisation consistency | P13-020 | One locale rendering consistently across every programme's surfaces | A locale renders consistently across surfaces, verified per locale | OPEN |
| **P13-022** | Cross-programme design consistency | P13-020 | One theme and density rendering consistently across web, mobile, desktop and sites | A theme renders consistently across every client, verified by visual comparison | OPEN |
| **P13-023** | Integration environment security | P13-005 | The integration environment holding no real customer data and reachable only by authorised principals | The environment contains no production data, verified by inspection | OPEN |
| **P13-024** | Integration data seeding | P13-007 | Seeding a realistic multi-programme estate deterministically | Two seed runs produce identical estates, verified by comparison | OPEN |
| **P13-025** | Integration environment performance | P13-006 | The environment sized to make performance measurement meaningful | Measurements taken here are representative of production, verified by comparison | OPEN |
| **P13-026** | Programme deployment order | P13-010 | The order programmes must deploy in, and how a partial deployment behaves | A partially deployed platform degrades per declaration rather than failing, proven by injection | OPEN |
| **P13-027** | Integration smoke suite | P13-011 | A fast suite proving the platform is composed and reachable after any deployment | The smoke suite runs after every deployment and fails when any programme is unreachable | OPEN |
| **P13-028** | Integration test performance | P13-011 | Cross-programme suites completing within a budget that permits continuous running | Suites complete within budget; a regression fails CI | OPEN |
| **P13-029** | Integration flake management | P13-028 | Detecting and eliminating intermittent cross-programme failures | Flake rate is measured and below threshold; a new flake is quarantined with an owner | OPEN |
| **P13-030** | Stage A seam proof | P13-003 | A suite asserting every seam in the register has provider, consumer, tests and an owner | Every seam is complete, and a seeded seam without a provider is caught immediately | OPEN |

---

## 5. Stage B · Cross-programme contract conformance (Wave 1)

Each programme's precondition gate proves a capability *exists*. This stage proves it is *correct*.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-031** | Precondition gate verification | P13-002 | Every programme's precondition gate executed against the real platform, not a reference | Every gate passes against the running platform; a gate passing against a reference but failing against reality is caught | OPEN |
| **P13-032** | Contract conformance in a running system | P13-031 | Provider behaviour verified against contracts at runtime, across programme boundaries | A provider diverging from its published contract fails, proven on a seeded divergence | OPEN |
| **P13-033** | Consumer expectation verification | P13-032 | Each consumer's actual expectations verified against the provider's actual behaviour | A consumer expectation the provider does not meet is caught before release | OPEN |
| **P13-034** | Platform-core to programme conformance | P13-031 | Every programme verified against the platform core it consumes | Every programme's generated client, auth path and data access works against the real core | OPEN |
| **P13-035** | Developer-portal to marketplace seam | P13-032 | A package the developer portal actually produces, published through the marketplace pipeline | A real portal-built package reaches a marketplace listing and installs, end to end | OPEN |
| **P13-036** | Marketplace to tenant seam | P13-035 | A purchased application installing into a real tenant and running | A purchase results in a running, entitled application in a tenant, verified end to end | OPEN |
| **P13-037** | Entitlement to runtime seam | P13-036 | Installed software's entitlement checks answered correctly by the marketplace | A lapsed entitlement degrades the installed application exactly as declared | OPEN |
| **P13-038** | Marketing to signup to tenant seam | P13-032 | A signup on the public site provisioning a real, working tenant | A stranger signing up on the marketing site reaches a working tenant, verified end to end | OPEN |
| **P13-039** | Pricing to billing seam | P13-038 | The price published on the marketing site equalling the price actually charged | Published, quoted, charged and invoiced amounts are equal to the cent, verified end to end | OPEN |
| **P13-040** | Tenant admin to ERP seam | P13-019 | Permissions granted in the admin console taking effect in the ERP | A permission change in the console changes what the ERP allows, within the stated window | OPEN |
| **P13-041** | Tenant admin to platform seam | P13-031 | Tenant-visible subscription, usage and entitlement matching the provider's records | Tenant-visible figures reconcile to provider records exactly | OPEN |
| **P13-042** | Provider console to tenant seam | P13-016 | Provider operations taking effect on real tenants correctly | A provider fleet operation changes exactly the intended tenants, verified against the affected set | OPEN |
| **P13-043** | Website builder to ERP projection seam | P13-017 | Published site content reflecting the ERP data it is meant to project | A projected product appears on the site and never permits a direct ERP query, proven by test | OPEN |
| **P13-044** | Storefront to ERP order seam | P13-043 | A storefront order becoming a real ERP order through the governed path | A storefront purchase creates a real ERP order, verified end to end | OPEN |
| **P13-045** | Web client to ERP seam | P13-034 | The client platform correctly serving the ERP's screens | Every page kind works against the real ERP, verified per kind | OPEN |
| **P13-046** | Mobile to ERP seam | P13-034 | Mobile workflows against the real ERP, online and offline | Every declared mobile workflow completes against the real ERP, verified per workflow | OPEN |
| **P13-047** | Desktop to ERP seam | P13-034 | Desktop workflows against the real ERP | Every declared desktop workflow completes against the real ERP, verified per workflow | OPEN |
| **P13-048** | Cross-client consistency | P13-047 | Web, mobile and desktop agreeing on identical inputs | The three clients produce identical results for identical inputs, verified differentially | OPEN |
| **P13-049** | Cross-client handoff | P13-048 | Moving a task between clients without losing context | A handoff resumes the exact context on the receiving client, verified per direction | OPEN |
| **P13-050** | Developer application to ERP seam | P13-036 | A developer-built application operating on real ERP data within its permissions | A third-party application reads and writes exactly what it is entitled to, and nothing more | OPEN |
| **P13-051** | Extension to core seam | P13-034 | Extensions operating through declared seams against the real core | An extension cannot modify core behaviour outside a declared seam, proven in a running system | OPEN |
| **P13-052** | Connector to external seam | P13-032 | Connectors reaching real external systems within declared egress | A connector reaches only its declared destinations, verified at the network boundary | OPEN |
| **P13-053** | AI residency across programmes | P13-052 | The local-first AI claim verified across every programme that uses AI | With residency local, no tenant data leaves, verified across every AI surface simultaneously | OPEN |
| **P13-054** | Notification consistency across programmes | P13-017 | One notification reaching the right principals across the right channels, once | A notifiable event produces exactly one coordinated notification, not one per programme | OPEN |
| **P13-055** | Audit completeness across programmes | P13-014 | An action's audit trail complete across every programme it touched | A cross-programme action is fully reconstructible from audit alone | OPEN |
| **P13-056** | Search consistency across programmes | P13-019 | Search returning consistent, permission-correct results across surfaces | Search results are permission-correct and consistent across surfaces, verified differentially | OPEN |
| **P13-057** | Reporting reconciliation across programmes | P13-041 | Figures reported in one programme reconciling to their source in another | Every cross-programme figure reconciles exactly; a divergence alerts | OPEN |
| **P13-058** | Contract version skew handling | P13-009 | Programmes at different contract versions behaving per the compatibility policy | A supported version skew works; an unsupported one fails clearly, not obscurely | OPEN |
| **P13-059** | Seam degradation behaviour | P13-026 | Each consumer's declared behaviour when a provider is unavailable, verified live | Every consumer degrades per its declaration, proven by stopping each provider in turn | OPEN |
| **P13-060** | Stage B conformance proof | P13-032 | A suite verifying every seam in the register in a running system, both directions | Every seam conforms, and a seeded provider divergence is caught before its consumer | OPEN |

### Semantic agreement across programmes

Contract conformance proves the *shape* agrees. These ten prove the *meaning* agrees — the class of
defect where two programmes both satisfy a contract and still disagree about what the data means.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-061** | Shared reference data consistency | P13-034 | Enums, status values, country and currency codes and units resolving identically in every programme | A shared enum has one definition; a programme redeclaring one fails an architecture gate | OPEN |
| **P13-062** | Identifier format consistency | P13-034 | One identifier format and validation across programmes, including in URLs and exports | An identifier valid in one programme is valid in every other, verified differentially | OPEN |
| **P13-063** | Temporal semantics across programmes | P13-034 | Timestamps, timezones and business calendars meaning the same thing everywhere | A timestamp written by one programme is read identically by every other, across DST boundaries | OPEN |
| **P13-064** | Currency and precision across programmes | P13-039 | Money crossing a programme boundary without precision loss or currency ambiguity | An amount crossing every boundary in turn returns bit-identical, proven by round-trip | OPEN |
| **P13-065** | Document numbering across programmes | P13-044 | One numbering authority, so a document created in any programme is correctly numbered | Numbering is gapless across programmes under concurrent creation, proven under parallel load | OPEN |
| **P13-066** | Pagination and ordering consistency | P13-048 | List semantics identical across API, web, mobile and desktop | A paged list returns each row at most once in every client, proven under concurrent writes | OPEN |
| **P13-067** | Attachment and file handling across programmes | P13-032 | A file uploaded in one programme readable, permissioned and scanned identically in another | A file's permissions and scan verdict are identical wherever it is accessed, verified differentially | OPEN |
| **P13-068** | Rate limit and quota coordination | P13-041 | Limits coordinated so one programme's consumption is visible to the others sharing a quota | A tenant's quota is enforced across programmes in aggregate, not per programme, proven by test | OPEN |
| **P13-069** | Seam latency budgets | P13-014 | A stated latency budget for every seam, measured in the running system | Every seam meets its budget; a regression beyond it fails CI with the seam named | OPEN |
| **P13-070** | Semantic agreement proof | P13-061 | A differential suite writing data through every programme and reading it through every other | Every value round-trips with identical meaning through every path, and a seeded semantic divergence is caught | OPEN |

---

## 6. Stage C · The system as one (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-071** | Simultaneous cross-programme isolation | P13-016 | The IP-6 mechanism: two tenants exercised across every programme's surfaces at once, asserting no leak anywhere | Tenant B reads **zero** of tenant A's rows across every surface simultaneously, not one programme at a time | OPEN |
| **P13-072** | Isolation under concurrent cross-programme load | P13-071 | Isolation holding while many tenants act across many programmes concurrently | No cross-tenant read occurs under concurrent multi-programme load, proven under sustained load | OPEN |
| **P13-073** | Isolation at the seams | P13-071 | Verifying isolation specifically where data crosses a programme boundary | No seam leaks a tenant's data to another, proven per seam in the register | OPEN |
| **P13-074** | Isolation in shared services | P13-073 | Verifying isolation in caches, queues, search indexes and telemetry shared across programmes | Every shared service is isolation-tested; a seeded leak in any is caught | OPEN |
| **P13-075** | Cross-programme privilege escalation testing | P13-019 | Attempting to gain privilege in one programme by acting through another | Every escalation path fails, and each succeeds the moment its control is removed | OPEN |
| **P13-076** | Data residency across programmes | P13-071 | Residency honoured simultaneously across storage, backup, telemetry, search and AI | A residency-restricted tenant's data is provably absent from other regions in every store | OPEN |
| **P13-077** | Personal data completeness across programmes | P13-055 | A subject access request returning that subject's data from every programme | An access request returns complete data across all twelve programmes, verified against a seeded subject | OPEN |
| **P13-078** | Erasure completeness across programmes | P13-077 | An erasure removing personal data from every programme, including derived stores | Erasure leaves no personal data in any programme's store, verified by query in each | OPEN |
| **P13-079** | Retention consistency across programmes | P13-078 | Retention executing coherently where one record has copies in several programmes | Retention executes consistently; no programme retains past the governing policy | OPEN |
| **P13-080** | End-to-end journey — quote to cash | P13-060 | The full commercial cycle across marketing, marketplace, ERP and billing | The journey completes against a real deployment and fails when any step regresses | OPEN |
| **P13-081** | End-to-end journey — procure to pay | P13-060 | Requisition through payment across ERP, admin and platform surfaces | The journey completes end to end with correct postings, verified against ground truth | OPEN |
| **P13-082** | End-to-end journey — hire to retire | P13-060 | Employee lifecycle across HCM, identity, admin console and clients | Access is granted and fully revoked across every programme, verified exhaustively | OPEN |
| **P13-083** | End-to-end journey — build to publish to install | P13-035 | Developer portal through marketplace into a running tenant | A developer-built application reaches a tenant and runs, verified end to end | OPEN |
| **P13-084** | End-to-end journey — stranger to productive tenant | P13-038 | Marketing site through signup, provisioning, onboarding to real work | An unassisted stranger performs real work in a new tenant, measured | OPEN |
| **P13-085** | End-to-end journey — record to report | P13-057 | Transaction through posting, close and statutory reporting | Reported figures reconcile to source transactions exactly | OPEN |
| **P13-086** | End-to-end journey — site to order to fulfilment | P13-044 | Storefront purchase through ERP fulfilment and delivery | A storefront order is fulfilled through the ERP, verified end to end | OPEN |
| **P13-087** | End-to-end journey — field work offline to posted | P13-046 | Mobile offline field work reaching correct postings on reconnect | Offline field work posts exactly once with correct accounting, proven under interruption | OPEN |
| **P13-088** | End-to-end journey — incident to customer communication | P13-054 | A platform incident reaching affected tenants across every channel | An incident reaches every affected tenant within the stated window, verified by rehearsal | OPEN |
| **P13-089** | End-to-end journey — tenant offboarding | P13-078 | Termination across entitlement, data, identity, billing and every client | Offboarding leaves no access, no orphaned data and no unbilled usage, verified across programmes | OPEN |
| **P13-090** | Journey regression suite | P13-080 | Every journey run continuously against the integration environment | Journey suites run on every deployment; a break is attributed within the stated window | OPEN |
| **P13-091** | Journey accessibility verification | P13-090 | Each journey completable by keyboard and with a screen reader, across programmes | Every journey is completable without a mouse and without sight, recorded per journey | OPEN |
| **P13-092** | Journey localisation verification | P13-021 | Each journey completable in a second locale and in RTL | Every journey completes in a non-English locale and in RTL, verified per journey | OPEN |
| **P13-093** | Journey performance | P13-090 | Each journey completing within a stated end-to-end time budget | Every journey meets its budget on the reference environment, measured | OPEN |
| **P13-094** | Data consistency across a journey | P13-085 | Verifying every store agrees after a journey completes | Every store agrees after each journey, asserted by reconciliation | OPEN |
| **P13-095** | Journey failure and recovery | P13-090 | Injecting failure mid-journey and verifying recovery to a consistent state | A journey interrupted at any step recovers or compensates, proven by injection at each step | OPEN |
| **P13-096** | Whole-system reconciliation | P13-094 | Continuous three-way reconciliation across billing, entitlement and installed state — platform-wide | A seeded divergence in any direction is detected within the stated window | OPEN |
| **P13-097** | Financial reconciliation across programmes | P13-085 | Marketplace revenue, ERP postings and platform billing reconciling to each other | All three reconcile to the cent; a seeded divergence is caught by reconciliation | OPEN |
| **P13-098** | Usage and metering reconciliation | P13-041 | Metered usage reconciling across the ERP, the tenant console and provider billing | Metered totals reconcile within the stated tolerance across all three | OPEN |
| **P13-099** | Identity state reconciliation | P13-082 | Identity, permissions and access agreeing across every programme | Effective access is identical in every programme for a given subject, verified differentially | OPEN |
| **P13-100** | Configuration reconciliation | P13-020 | Configuration agreeing across programmes where it is shared | A shared setting resolves identically everywhere; a divergence alerts | OPEN |
| **P13-101** | Whole-system performance budget | P13-093 | The IP-3 mechanism: a stated budget for the composed platform, not twelve separate ones | The composed system meets its budget under realistic mixed load, measured | OPEN |
| **P13-102** | Realistic mixed-workload modelling | P13-101 | A load profile representing real simultaneous use across programmes and clients | The profile is derived from stated assumptions and its assumptions are recorded | OPEN |
| **P13-103** | Peak load testing | P13-102 | The platform under month-end, launch and campaign peaks simultaneously | Peak profiles are met with no programme degrading another beyond declared limits | OPEN |
| **P13-104** | Cross-programme resource contention | P13-103 | Detecting one programme starving another of shared resources | No programme starves another under peak load, proven under sustained contention | OPEN |
| **P13-105** | Whole-system scalability | P13-103 | Scaling behaviour of the composed platform as tenants and volume grow | Scaling is measured against growth, and its limits are stated rather than assumed | OPEN |
| **P13-106** | Whole-system soak testing | P13-105 | Multi-day operation of the composed platform under continuous load | A multi-day soak shows no leak, drift, backlog growth or scheduled-job decay | OPEN |
| **P13-107** | Cascading failure prevention | P13-059 | Verifying a failure in one programme does not cascade into others | A failure injected in any programme is contained, proven per programme | OPEN |
| **P13-108** | Whole-system chaos testing | P13-107 | Systematic failure injection across programmes and infrastructure simultaneously | Every documented resilience assumption holds under multi-point failure, or is corrected | OPEN |
| **P13-109** | Recovery under partial failure | P13-107 | The platform recovering coherently when some programmes are degraded | Recovery from partial failure leaves every store consistent, verified by reconciliation | OPEN |
| **P13-110** | Whole-system startup and cold start | P13-026 | The platform starting from cold in the declared order within a stated budget | A cold start of the whole platform completes within budget, measured | OPEN |
| **P13-111** | Deployment without downtime | P13-026 | Deploying any programme without downtime in the composed system | A deployment of any programme completes with zero failed requests, measured under load | OPEN |
| **P13-112** | Cross-programme version compatibility | P13-058 | Verifying the supported version matrix in a running system | Every supported combination works; an unsupported one fails clearly, verified per combination | OPEN |
| **P13-113** | Rolling upgrade of the platform | P13-111 | Upgrading every programme in sequence with the system remaining usable | A full-platform rolling upgrade completes with the system usable throughout, verified by rehearsal | OPEN |
| **P13-114** | Whole-system rollback | P13-113 | Rolling the platform back coherently, including across programme boundaries | A platform rollback restores a consistent prior state, verified by rehearsal | OPEN |
| **P13-115** | Backup and restore across programmes | P13-094 | Backing up and restoring a tenant's data across every programme coherently | A cross-programme restore reproduces a consistent point in time, verified by comparison | OPEN |
| **P13-116** | Whole-system disaster recovery | P13-115 | Recovering the composed platform to its stated objective | A recovery rehearsal meets its objective with every store consistent and the books balancing | OPEN |
| **P13-117** | Regional failover across programmes | P13-076 | Failing over a region with every programme following coherently | A regional failover preserves residency and consistency across programmes, verified by rehearsal | OPEN |
| **P13-118** | Whole-system security testing | P13-075 | Penetration testing the composed platform, not twelve separate ones | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P13-119** | Attack-surface inventory | P13-118 | The complete external attack surface of the composed platform, generated | Every exposed endpoint, port and origin is inventoried; an undeclared one is detected | OPEN |
| **P13-120** | Cross-programme threat model | P13-119 | Threats that exist only at the seams, each mapped to a control and a test | Every seam threat has a test that fails when its control is removed | OPEN |
| **P13-121** | Whole-system accessibility audit | P13-091 | Accessibility across every programme's surfaces as one estate | The composed estate passes automated and manual review, sampled across every surface class | OPEN |
| **P13-122** | Whole-system localisation audit | P13-092 | Every locale rendering completely across the composed estate | Every enabled locale is complete across programmes; a gap blocks that locale | OPEN |
| **P13-123** | Cross-programme telemetry coherence | P13-014 | Telemetry from twelve programmes forming one coherent operational picture | A cross-programme issue is diagnosable from telemetry alone, verified by exercise | OPEN |
| **P13-124** | Cross-programme cost attribution | P13-098 | Platform cost attributed coherently across programmes to tenants | Cost per tenant sums correctly across programmes to total cost | OPEN |
| **P13-125** | Whole-system compliance evidence | P13-077 | Evidence spanning programmes generated by mechanism | Every cross-programme control produces evidence automatically | OPEN |
| **P13-126** | Cross-programme audit reconstruction | P13-055 | Reconstructing a complete action history spanning programmes | Any cross-programme action is fully reconstructible from audit alone | OPEN |
| **P13-127** | Whole-system data integrity | P13-096 | Continuous verification that every store agrees platform-wide | A seeded integrity violation is detected within the stated window | OPEN |
| **P13-128** | Multi-tenant scale testing | P13-105 | The platform at target tenant count with realistic per-tenant activity | Target tenant scale is met with every budget held, measured | OPEN |
| **P13-129** | Capacity model for the composed platform | P13-128 | A capacity model relating tenants and activity to infrastructure | The model's predictions match measured consumption within the stated tolerance | OPEN |
| **P13-130** | Stage C system proof | P13-101 | A suite asserting isolation, journeys, reconciliation and performance on the composed platform together | Every property holds simultaneously, and each fails when its mechanism is removed | OPEN |

---

## 7. Stage D · Operability (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-131** | Operational model | P13-123 | Who operates what, and the boundary between provider operations and engineering | Every operational responsibility has a named owner; an unowned one fails the review | OPEN |
| **P13-132** | Unified operational view | P13-123 | One place an operator sees the whole platform's state | A platform-wide problem is visible from one surface, verified by exercise | OPEN |
| **P13-133** | Cross-programme alerting | P13-132 | Alerts derived from whole-system symptoms, deduplicated across programmes | One incident produces one alert, not twelve, verified by injection | OPEN |
| **P13-134** | Alert routing and ownership | P13-133 | Every alert routing to an owner who can act on it | Every alert has an owner and a runbook; an alert with neither fails the review | OPEN |
| **P13-135** | On-call rotation | P13-134 | A staffed rotation with escalation and handover | The rotation is staffed and an escalation has been exercised, recorded | OPEN |
| **P13-136** | Alert quality measurement | P13-133 | Measuring precision, recall and fatigue across the composed platform | Alert precision is measured; an alert below threshold is fixed or removed | OPEN |
| **P13-137** | Incident management | P13-135 | Declare, triage, mitigate, resolve and review across programme boundaries | Every incident has a complete, reconstructible timeline spanning programmes | OPEN |
| **P13-138** | Cross-programme incident diagnosis | P13-123 | Diagnosing an incident whose cause is in a different programme from its symptom | A seeded cross-programme incident is diagnosed to its cause, verified by exercise | OPEN |
| **P13-139** | Incident impact determination | P13-127 | Computing exactly which tenants an incident affected, across programmes | The affected tenant set is computed from real data, not estimated | OPEN |
| **P13-140** | Incident communication | P13-088 | One coordinated communication reaching every affected party | An incident update reaches every channel from one action, verified by rehearsal | OPEN |
| **P13-141** | Post-incident review | P13-137 | Blameless review with actions tracked to completion across programmes | Every incident above threshold has a review and its actions tracked to closure | OPEN |
| **P13-142** | Whole-system SLOs | P13-101 | Service level objectives for the composed platform, not per programme | Every SLO is computed from real measurement of the composed system | OPEN |
| **P13-143** | Error budget policy | P13-142 | Consequences when the composed platform's budget is exhausted | An exhausted budget halts non-essential deployment across programmes, enforced mechanically | OPEN |
| **P13-144** | Runbook inventory | P13-134 | Every operational procedure across programmes, inventoried with owners | Every alert and failure mode has a runbook; one without fails the review | OPEN |
| **P13-145** | Runbook automation | P13-144 | Runbooks as executable automation rather than documents | Every runbook is executable; a document-only runbook fails the gate | OPEN |
| **P13-146** | Toil measurement | P13-145 | Measuring manual operational effort across the composed platform | Toil is measured per operation class; an operation above threshold gets an elimination plan | OPEN |
| **P13-147** | Operational tooling for support | P13-132 | Support staff diagnosing across programmes without production access | A support agent diagnoses a cross-programme issue without shell or database access | OPEN |
| **P13-148** | Support tier model | P13-147 | The declared support tiers and what each can resolve across programmes | Every support tier's capability is documented and exercised, verified by rehearsal | OPEN |
| **P13-149** | Support escalation across programmes | P13-148 | Escalating an issue to the owning programme with context preserved | An escalated issue reaches the owning team with reproduction and telemetry attached | OPEN |
| **P13-150** | Customer-facing status | P13-140 | One status surface reflecting the composed platform's real state | The public status page reflects real SLO and incident data across programmes | OPEN |
| **P13-151** | Maintenance coordination | P13-111 | Coordinating maintenance across programmes with tenant notice | Maintenance is coordinated and notified within the stated window, enforced mechanically | OPEN |
| **P13-152** | Release train | P13-113 | The declared cadence and gates for releasing the composed platform | Every release passes the same gates; a bypass requires a recorded exception | OPEN |
| **P13-153** | Release coordination across programmes | P13-152 | Coordinating twelve programmes' releases coherently | A coordinated release deploys every programme in the declared order, verified by rehearsal | OPEN |
| **P13-154** | Release readiness checks | P13-152 | Automated checks a release must pass before deployment | A release failing any check cannot deploy; each check has been proven able to fail | OPEN |
| **P13-155** | Progressive platform rollout | P13-153 | Rolling the composed platform out progressively with health gates | A regression halts the rollout automatically, proven by injection | OPEN |
| **P13-156** | Release health monitoring | P13-155 | Comparing a release's health against its predecessor across programmes | A regressing release is detected from real data within the stated window | OPEN |
| **P13-157** | Change management | P13-152 | Approval and record for changes to the production platform | Every production change is attributable to an approver and a reason | OPEN |
| **P13-158** | Configuration management in production | P13-100 | Production configuration versioned, reviewed and reversible | A configuration change is reversible in one action, verified by rehearsal | OPEN |
| **P13-159** | Secret rotation in production | P13-158 | Rotating every credential and certificate without downtime | A full rotation completes with no downtime and no broken integration, verified by rehearsal | OPEN |
| **P13-160** | Capacity management | P13-129 | Operating capacity ahead of demand across the composed platform | A capacity shortfall is predicted with lead time to act, measured | OPEN |
| **P13-161** | The rehearsal discipline | P13-145 | The IP-4 mechanism: every operational capability rehearsed within a review period | An unrehearsed capability is reported as unproven, never as available. An overdue rehearsal escalates | OPEN |
| **P13-162** | Game days | P13-108 | Scheduled exercises against the real platform with the real operators | Game days occur on schedule and their findings are tracked to closure | OPEN |
| **P13-163** | Operational readiness review | P13-161 | The structured review each programme's operations must pass | Every programme passes its readiness review with evidence, verified per programme | OPEN |
| **P13-164** | Operator onboarding | P13-147 | A new operator reaching competence with the documented material | A new operator resolves a seeded incident using only the documentation, verified by exercise | OPEN |
| **P13-165** | Operational documentation | P13-144 | Architecture, runbooks and procedures generated or verified, never stale | Every procedure has been executed within its review period, or is marked unverified | OPEN |
| **P13-166** | Observability cost management | P13-123 | Telemetry cost across twelve programmes controlled and attributed | Telemetry cost stays within budget with rare-error visibility retained | OPEN |
| **P13-167** | Log and telemetry retention | P13-079 | Retention and privacy of operational data across programmes | No personal data reaches telemetry unmasked, verified across programmes | OPEN |
| **P13-168** | Forensic capability | P13-126 | Reconstructing what happened across programmes for investigation | A cross-programme investigation is satisfiable from retained data, verified by exercise | OPEN |
| **P13-169** | Business continuity | P13-116 | Continuity of operations during a major failure | Operations continue with the primary region unavailable, verified by rehearsal | OPEN |
| **P13-170** | Vendor and dependency management | P13-119 | Managing external dependencies and their failure impact across programmes | Every external dependency's failure impact is documented and rehearsed | OPEN |
| **P13-171** | Security operations | P13-120 | Detection, containment and response for the composed platform | A seeded attack is detected and contained within the stated window | OPEN |
| **P13-172** | Access review for operators | P13-131 | Periodic certification of operator access across programmes | Every operator grant is reviewed within its cycle; an unreviewed one expires | OPEN |
| **P13-173** | Segregation of duties in operations | P13-157 | Preventing one operator from both initiating and approving high-risk change | A single operator cannot complete a conflicting pair, enforced mechanically | OPEN |
| **P13-174** | Operational metrics | P13-146 | Measuring the operation: lead time, change failure rate, recovery time, toil | Each metric is measured from real data, and its trend is visible | OPEN |
| **P13-175** | Operational maturity review | P13-174 | Assessing operational maturity against a stated bar before release | The bar is met with evidence; a gap blocks release rather than being footnoted | OPEN |
| **P13-176** | Support tooling verification | P13-147 | Verifying support tooling works against the real composed platform | Every support tool is exercised against the real platform, verified per tool | OPEN |
| **P13-177** | Escalation path verification | P13-149 | Walking every escalation path end to end before release | Every escalation path reaches a responder, verified by rehearsal | OPEN |
| **P13-178** | Alert firing verification | P13-133 | Proving every alert can actually fire, not merely that it is configured | Every alert has been observed firing in rehearsal; an unfired alert is unproven | OPEN |
| **P13-179** | Monitoring coverage verification | P13-178 | Verifying every failure mode has detection | A failure mode without detection is filed as a gap, and the list is closed before release | OPEN |
| **P13-180** | Stage D operability proof | P13-161 | A suite asserting every operational capability has been rehearsed and every alert has fired | Every capability is proven by rehearsal, and an unrehearsed one blocks rather than warns | OPEN |

---

## 8. Stage E · Customer readiness (Wave 4)

`04-V1-RELEASE-DEFINITION § 2` records the standing risk of this release decision: no external
feedback reaches the product before v1.0. This stage is the mitigation — everything a real customer
needs, rehearsed against reality before any customer sees it.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-181** | Customer onboarding model | P13-084 | The declared path from contract to productive use, with owners and durations | Every step has an owner and a stated duration; an unowned step fails the review | OPEN |
| **P13-182** | Tenant provisioning rehearsal | P13-181 | Provisioning a real customer tenant end to end, as it will actually be done | A tenant is provisioned by the documented procedure within its budget, verified by rehearsal | OPEN |
| **P13-183** | Legacy data migration tooling | P13-115 | Extracting, mapping, validating and loading from a real legacy ERP | A migration from a realistic legacy dataset completes with per-record diagnostics | OPEN |
| **P13-184** | Opening balance migration | P13-183 | Migrating opening balances so the ledger starts correct | Opening balances reconcile to the source system exactly, asserted by comparison | OPEN |
| **P13-185** | Master data migration | P13-183 | Migrating partners, items, accounts, employees and structure | Migrated master data reconciles to source with duplicates detected, not multiplied | OPEN |
| **P13-186** | Historical data migration | P13-185 | Migrating transaction history where required, with its statutory implications | Migrated history is queryable and reportable for statutory periods, verified by report | OPEN |
| **P13-187** | Migration dry run and reconciliation | P13-184 | A full rehearsal reporting exactly what a real migration would do | The dry run's reported outcome equals the executed outcome exactly, verified differentially | OPEN |
| **P13-188** | Migration rollback | P13-187 | Reverting a migration that goes wrong, completely | A migration rollback leaves no partial data, proven by injection at each step | OPEN |
| **P13-189** | Cutover procedure | P13-187 | The documented, rehearsed sequence from legacy system to UniERP | A cutover rehearsal completes within its stated window, recorded | OPEN |
| **P13-190** | Parallel running | P13-189 | Operating both systems and reconciling their outputs during transition | A parallel-run period reconciles both systems' outputs, with divergences explained | OPEN |
| **P13-191** | Cutover rollback | P13-189 | Returning to the legacy system if cutover fails | A cutover rollback is rehearsed and its data implications stated, recorded | OPEN |
| **P13-192** | Configuration for a real customer | P13-182 | Configuring the platform for a realistic customer's actual requirements | A realistic configuration is completed by the documented procedure, verified by exercise | OPEN |
| **P13-193** | User provisioning at scale | P13-082 | Onboarding a customer's whole user base with correct access | A realistic user base is provisioned with correct access, verified exhaustively | OPEN |
| **P13-194** | Training material | P13-193 | Role-based training material for a customer's users | Training material covers every role; a role without it fails the review | OPEN |
| **P13-195** | Customer documentation | P13-194 | End-user documentation covering the real workflows, generated where possible | Documentation covers every declared workflow; a gap fails the review | OPEN |
| **P13-196** | Documentation accuracy verification | P13-195 | Every documented procedure executed against the real platform | Every procedure is executed and verified; a broken one fails the build | OPEN |
| **P13-197** | Onboarding time measurement | P13-181 | Measuring the real time from contract to productive use | Time to productive use is measured against its stated budget, recorded | OPEN |
| **P13-198** | Customer support readiness | P13-148 | Support staffed, trained and exercised against real scenarios | Support resolves seeded scenarios within SLA, verified by rehearsal | OPEN |
| **P13-199** | Customer feedback channel | P13-149 | The route from a customer's report to a tracked defect | A customer-reported defect reaches an owning team and is tracked, verified by exercise | OPEN |
| **P13-200** | First-90-days plan | P13-199 | The declared plan for supporting the first customers intensively | The plan names owners, cadence and escalation; it is exercised before release | OPEN |
| **P13-201** | Commercial terms | P13-192 | Terms, DPA, SLA and sub-processor disclosure published and versioned | Every transaction is attributable to accepted terms versions, reproducible from the record | OPEN |
| **P13-202** | Contract-to-entitlement path | P13-041 | A signed contract producing correct entitlement in the platform | A contract produces exactly the entitlement it grants, verified end to end | OPEN |
| **P13-203** | Invoicing and payment readiness | P13-097 | Invoicing a real customer and receiving payment, end to end | An invoice is issued, delivered and settled, verified end to end in a real market | OPEN |
| **P13-204** | Tax registration and compliance | P13-203 | Tax registration complete in every market being opened | A market cannot open without complete tax registration, enforced mechanically | OPEN |
| **P13-205** | Market launch readiness | P13-204 | The evidenced checklist a market must satisfy before opening | A market cannot open with an unticked item, enforced mechanically | OPEN |
| **P13-206** | Pricing publication verification | P13-039 | Published prices equalling charged prices, verified in a real market | A seeded price divergence is caught by CI; the check has been proven able to fail | OPEN |
| **P13-207** | Claim verification across surfaces | P13-038 | Every public capability claim mapping to a shipped capability, platform-wide | A seeded false claim in any surface is caught; the gate has been proven able to fail | OPEN |
| **P13-208** | Accessibility conformance publication | P13-121 | Published conformance generated from real audit results across programmes | The statement is generated from audit data and cannot claim untested conformance | OPEN |
| **P13-209** | Compliance readiness | P13-125 | The compliance posture the platform claims, evidenced by mechanism | Every claimed control produces evidence automatically; a hand-written claim fails | OPEN |
| **P13-210** | Data processing agreements | P13-201 | The processor chain documented and agreed across every programme | Every data flow has a legal basis and a recorded agreement | OPEN |
| **P13-211** | Insurance and liability readiness | P13-201 | Commercial protections appropriate to the obligations being accepted | Obligations accepted in the terms are matched by stated protections, reviewed and recorded | OPEN |
| **P13-212** | Reference customer readiness | P13-200 | The ability to name a customer, with consent, once one exists | No customer is named without a stored consent record, enforced mechanically | OPEN |
| **P13-213** | Customer environment isolation | P13-071 | Verifying a real customer's data is isolated in a production-shaped deployment | Isolation holds in the production-shaped environment, proven across programmes | OPEN |
| **P13-214** | Customer performance verification | P13-101 | Verifying performance with a realistic customer's data volume and usage | Budgets hold at a realistic customer's scale, measured | OPEN |
| **P13-215** | Customer disaster recovery commitment | P13-116 | The recovery objectives offered to customers, verified by rehearsal | Offered objectives are met in rehearsal, or the offer is corrected to what is achievable | OPEN |
| **P13-216** | Customer data export commitment | P13-089 | A customer's right to leave with their data, exercised | A full customer export reimports into a fresh tenant and reproduces the data exactly | OPEN |
| **P13-217** | Customer security questionnaire readiness | P13-209 | Answers to standard security questionnaires generated from real evidence | Answers derive from evidence and are dated, never hand-asserted | OPEN |
| **P13-218** | Pilot readiness | P13-200 | Everything needed to run a first real customer as a pilot | The pilot checklist is complete with evidence; a gap blocks the pilot | OPEN |
| **P13-219** | Feedback incorporation path | P13-199 | How customer feedback reaches the plan as phases | Customer feedback produces tracked phases or defects, verified by exercise | OPEN |
| **P13-220** | Stage E customer proof | P13-187 | A full rehearsal: provision, migrate, cut over, operate, support, invoice, export | The complete customer lifecycle is rehearsed end to end, and a failure at any step is caught | OPEN |

---

## 9. Stage F · The release (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-221** | Release gate mechanisation | P13-002 | `04-V1-RELEASE-DEFINITION § 5` expressed as an executable checklist, not a document | Every gate item is evaluated by command; an item with no command fails the mechanisation | OPEN |
| **P13-222** | Completeness verification | P13-221 | Verifying every phase in every programme is DONE or WITHDRAWN with a reason | The plan reports zero OPEN, zero BLOCKED and zero stranded WIP; any remainder blocks the release | OPEN |
| **P13-223** | Withdrawal audit | P13-222 | Reviewing every WITHDRAWN phase to confirm its reason still holds | Every withdrawal has a current, reviewed reason; an unreviewed one blocks the release | OPEN |
| **P13-224** | Override audit | P13-222 | Reviewing every `--despite-red-gate` override recorded in the worklog | Every override is resolved or accepted in writing; an unreviewed one blocks the release | OPEN |
| **P13-225** | Exemption audit | P13-224 | Reviewing every recorded exemption — RLS, line-ceiling, read-only surface, coverage | Every exemption is re-justified against current reality; a stale one blocks the release | OPEN |
| **P13-226** | Defect log closure | P13-225 | Every defect in `90-DEFECT-LOG.md` closed, routed to a phase, or explicitly carried | No defect is unrouted; every carried defect has a stated reason and an owner | OPEN |
| **P13-227** | Gate integrity verification | P13-221 | Verifying every quality gate across every repository can actually fail | Every gate is proven able to fail by deliberate violation; an unproven gate blocks the release | OPEN |
| **P13-228** | Coverage integrity verification | P13-227 | Verifying coverage thresholds are real and padding is absent across all repositories | Deleting a test lowers the measured number everywhere; a repository where it does not blocks | OPEN |
| **P13-229** | Verify gate across the estate | P13-227 | `verify.mjs` green across every repository simultaneously | Every repository is green at one commit; a red one blocks the release | OPEN |
| **P13-230** | Security sign-off | P13-118 | Final security review of the composed platform with findings resolved | Every finding is remediated or accepted in writing with a stated reason | OPEN |
| **P13-231** | Privacy sign-off | P13-210 | Final privacy review including the processor chain and subject rights | Every data flow has a lawful basis; an unbased flow blocks the release | OPEN |
| **P13-232** | Accessibility sign-off | P13-208 | Final accessibility review across every programme's surfaces | The published conformance matches the audit; an overstatement blocks the release | OPEN |
| **P13-233** | Legal and commercial sign-off | P13-211 | Final review of terms, tax, invoicing and market readiness | Every market being opened is complete; an incomplete one is not opened | OPEN |
| **P13-234** | Operational sign-off | P13-175 | Final operational readiness review against the stated bar | The bar is met with evidence; a gap blocks the release | OPEN |
| **P13-235** | Performance sign-off | P13-214 | Final whole-system performance verification at stated scale | Every budget is met at stated scale; a miss blocks or the budget is corrected in the open | OPEN |
| **P13-236** | Disaster recovery sign-off | P13-215 | Final recovery rehearsal meeting its stated objective | The rehearsal meets its objective with every store consistent, recorded | OPEN |
| **P13-237** | Documentation sign-off | P13-196 | Every claim in every document verified against the platform | A false or unverifiable documented claim blocks the release | OPEN |
| **P13-238** | Release communication | P13-233 | What is announced, to whom, and what it claims | Every announced claim maps to a verified capability, enforced by the claim gate | OPEN |
| **P13-239** | Launch runbook | P13-234 | The rehearsed procedure for the launch itself, including abort | The launch runbook is rehearsed end to end including its abort path, recorded | OPEN |
| **P13-240** | Launch abort criteria | P13-239 | The declared conditions under which launch stops, decided before launch day | Abort criteria are stated and measurable before launch, not judged during it | OPEN |
| **P13-241** | The unsoftenable gate | P13-221 | The IP-5 mechanism: gate criteria changeable only by recorded amendment with a reason | A gate criterion changed without an amendment entry fails the integrity check, proven on a seeded change | OPEN |
| **P13-242** | Post-launch monitoring plan | P13-156 | Heightened monitoring and response for the launch period | The plan is staffed and exercised before launch, recorded | OPEN |
| **P13-243** | Post-launch rollback capability | P13-114 | The ability to withdraw the release if launch goes wrong | A post-launch rollback is rehearsed with its customer implications stated | OPEN |
| **P13-244** | Version tagging and provenance | P13-229 | v1.0 tagged reproducibly across every repository with provenance | The release is reproducible from its tags; two builds produce identical artefacts | OPEN |
| **P13-245** | Release artefact archive | P13-244 | Every artefact, evidence transcript and sign-off archived for the release | The complete release record is retrievable; a missing item blocks the release | OPEN |
| **P13-246** | Support readiness at launch | P13-198 | Support staffed and prepared for launch-period volume | Support capacity meets the projected launch volume, stated and staffed | OPEN |
| **P13-247** | The truthfulness proof | P13-237 | The IP-7 mechanism, applied to the release itself: every claim in every user-facing surface, document and README backed by a mechanism that can fail | Every claim resolves to a mechanism, and a seeded unbacked claim in any surface is caught. This is `AGENTS.md § 1` applied to v1.0, and it is last because this project's history is why it exists | OPEN |
| **P13-248** | The one-system proof | P13-130 | The § 1 invariant, first half: isolation, journeys, reconciliation, performance and recovery holding on the composed platform simultaneously | Every property holds at once on the real deployment, and each fails when its mechanism is removed | OPEN |
| **P13-249** | The operable-by-others proof | P13-180 | The § 1 invariant, second half: the platform operated and a customer onboarded by people who did not build it, using only the documentation | An operator and an onboarding are completed by non-builders from documentation alone, recorded. A step requiring a builder is a defect, not a footnote | OPEN |
| **P13-250** | v1.0 release | P13-249 | The release itself: every gate item in `04-V1-RELEASE-DEFINITION § 5` ticked with evidence, tagged, announced and supported | Every gate item is evidenced by a command and its output, including its output when broken. An unticked item blocks the release — it does not become a known issue | OPEN |

---

## 10. Stage G · The journey register — every role, every domain (Waves 2–4)

Stage C's ten end-to-end journeys prove the *spine* works. They do not prove that **every role in
every domain can do their job**, and ten journeys across fourteen business domains, four principal
types and eight verticals is not that claim.

This stage makes journey coverage **enumerable and provable** rather than asserted. The mechanism is
a register, not a list of prose: every journey is declared as data with its persona, domain,
preconditions, steps, and the phases that deliver it — and `P13-329` fails when a registered journey
has no automated test or a delivered capability has no journey.

> **Why a register rather than 500 more journey phases.** Writing one phase per journey would
> produce a document nobody could maintain and would still not prove completeness — a list can
> always be missing an entry nobody noticed. A register with a coverage gate turns "did we cover
> every role?" into a question a command answers.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P13-251** | The persona register | P13-002 | Every principal who uses the platform, declared as data: tenant user roles, developer, publisher, provider staff, auditor, guest, service account | A persona used in any test but absent from the register fails the gate. Every persona names its plane and its permission profile | OPEN |
| **P13-252** | The role catalogue per domain | P13-251 | Every business role per domain — AP clerk, AR clerk, controller, buyer, planner, warehouse operator, production supervisor, quality inspector, recruiter, payroll officer, salesperson, sales manager, field technician, project manager, service agent — with the capabilities each needs | A role in the catalogue with no mapped capability fails the gate; a capability reachable by no role is reported as orphaned | OPEN |
| **P13-253** | The journey register | P13-252 | Every journey declared as data: persona, role, domain, trigger, preconditions, steps, outcome, and the phases delivering it | A journey without a persona, an outcome and at least one delivering phase cannot be registered | OPEN |
| **P13-254** | Journey derivation from capabilities | P13-253 | Journeys derived from the capability inventory so a shipped capability with no journey is detected | A capability reachable by a role but named in no journey is reported. The report is generated, not maintained | OPEN |
| **P13-255** | Journey coverage gate | P13-254 | The mechanism: every registered journey mapped to an automated test, every capability mapped to a journey | A registered journey with no test fails CI. A capability with no journey fails CI. Both are proven to fail on a seeded example | OPEN |
| **P13-256** | Registration and first-run journeys | P13-253 | Every entry path: self-serve signup, invitation, federated first sign-in, SCIM provisioning, reseller-provisioned, migrated user | Each entry path reaches a working, correctly-permissioned account, verified per path | OPEN |
| **P13-257** | Identity lifecycle journeys | P13-256 | Join, move, change role, take leave, return, suspend, offboard — per persona | Each transition applies exactly the right access change within the stated window, verified per transition | OPEN |
| **P13-258** | Cross-role handoff journeys | P13-257 | Work passing between roles: requisition to approval to buyer, order to warehouse to invoice, ticket to technician to billing | Each handoff carries its context and no step requires re-entry, verified per handoff | OPEN |
| **P13-259** | Approval and exception journeys | P13-258 | The path when something is blocked: over-limit, out-of-policy, credit-held, quality-failed, budget-exceeded | Every exception has a defined resolution path; a dead-end exception fails the gate | OPEN |
| **P13-260** | Delegation and absence journeys | P13-257 | Work continuing when a role-holder is unavailable: delegation, out-of-office, escalation, reassignment | No journey stalls on an absent role-holder, proven by removing each role-holder in turn | OPEN |
| **P13-261** | Journey accessibility coverage | P13-255 | Every registered journey completable by keyboard and with a screen reader | Every journey in the register is completed without a mouse and without sight, recorded per journey | OPEN |
| **P13-262** | Journey localisation coverage | P13-255 | Every registered journey completable in a second locale and in right-to-left | Every journey completes in a non-English locale and in RTL, recorded per journey | OPEN |
| **P13-263** | Finance journeys — accounts payable | P13-255 | Invoice receipt, matching, exception, approval, payment run, reconciliation, month-end — per role | Every AP role completes its work end to end with correct postings, verified per role | OPEN |
| **P13-264** | Finance journeys — accounts receivable | P13-263 | Invoicing, receipt, cash application, dunning, dispute, write-off, reconciliation | Every AR role completes its work with the subledger reconciling to the GL, verified per role | OPEN |
| **P13-265** | Finance journeys — general ledger and close | P13-264 | Journal entry, accrual, allocation, revaluation, reconciliation, close, reopen, statutory report | A controller closes a period end to end with trial balance at zero, verified by rehearsal | OPEN |
| **P13-266** | Finance journeys — treasury and banking | P13-265 | Bank statement import, reconciliation, cash position, payment approval, forecast | Cash position reconciles to bank and to the GL simultaneously, asserted by comparison | OPEN |
| **P13-267** | Finance journeys — fixed assets | P13-265 | Acquisition, capitalisation, depreciation run, transfer, revaluation, disposal, verification | Every asset event posts correctly in every book, verified per event and per book | OPEN |
| **P13-268** | Finance journeys — controlling and budgeting | P13-265 | Budget preparation, submission, approval, availability control, variance review, reforecast | A budget cycle completes with every contributor's submission auditable, verified by rehearsal | OPEN |
| **P13-269** | Finance journeys — tax and statutory | P13-265 | Tax determination review, return preparation, filing, reconciliation, audit response | Tax posted equals tax reported equals tax remitted, asserted by reconciliation | OPEN |
| **P13-270** | Sales journeys — lead to order | P13-255 | Lead, qualification, opportunity, quotation, negotiation, order, credit check, confirmation | Every sales role completes its stage with pricing and credit correctly applied, verified per role | OPEN |
| **P13-271** | Sales journeys — fulfilment to cash | P13-270 | Delivery, shipment, invoicing, receipt, return, credit note, commission | The cycle completes with stock, cost, revenue and receivable all correct, verified end to end | OPEN |
| **P13-272** | Sales journeys — customer service | P13-271 | Enquiry, case, escalation, resolution, complaint, credit, satisfaction | Every case reaches a recorded outcome within its SLA, verified per severity | OPEN |
| **P13-273** | Sales journeys — pricing and contracts | P13-270 | Price list maintenance, discount approval, contract creation, call-off, rebate settlement | Every determined price is explainable to the rule that supplied it, verified per journey | OPEN |
| **P13-274** | Procurement journeys — source to contract | P13-255 | Requisition, sourcing, RFQ, comparison, award, contract, supplier onboarding | Every award traces to its RFQ, its responses and its comparison, verified by reconstructing the trail from audit alone. An award with a missing link fails the journey test | OPEN |
| **P13-275** | Procurement journeys — order to receipt | P13-274 | Purchase order, confirmation, expediting, goods receipt, quality inspection, return | Receipt posts stock and GR/IR atomically, verified per journey | OPEN |
| **P13-276** | Procurement journeys — invoice to payment | P13-275 | Invoice entry, three-way match, exception, approval, payment, remittance | An out-of-tolerance invoice blocks payment and routes to exception, verified per mismatch type | OPEN |
| **P13-277** | Inventory journeys — receiving and putaway | P13-255 | Receipt, inspection, putaway, cross-dock, exception handling — scanner and desktop | A warehouse operator completes receiving on a scanner and on desktop identically, verified on both | OPEN |
| **P13-278** | Inventory journeys — picking and shipping | P13-277 | Wave planning, picking, shortage, packing, staging, loading, dispatch | A pick shortage routes to exception rather than failing silently, verified per exception | OPEN |
| **P13-279** | Inventory journeys — counting and adjustment | P13-278 | Cycle count, physical inventory, variance review, approval, adjustment posting | A count variance posts with approval and an audit trail, never silently, verified per journey | OPEN |
| **P13-280** | Inventory journeys — transfer and traceability | P13-279 | Inter-site transfer, in-transit, batch and serial trace, recall execution | A recall identifies every affected batch, customer and document within its window | OPEN |
| **P13-281** | Manufacturing journeys — plan to produce | P13-255 | Demand, MRP, planned order, production order, release, component issue | An MRP run's proposals are explainable per item to their inputs, verified per journey | OPEN |
| **P13-282** | Manufacturing journeys — shop floor execution | P13-281 | Operation confirmation, time recording, scrap, yield, rework, completion | A confirmation posts consumption, output and cost atomically, verified by injection | OPEN |
| **P13-283** | Manufacturing journeys — quality | P13-282 | Inspection lot, results recording, usage decision, non-conformance, corrective action | Stock cannot leave inspection without a recorded usage decision, verified per journey | OPEN |
| **P13-284** | Manufacturing journeys — costing and settlement | P13-283 | Standard cost release, variance analysis, WIP valuation, order settlement | Variances sum to the difference between standard and actual exactly, asserted per order | OPEN |
| **P13-285** | Maintenance journeys | P13-284 | Notification, planning, work order, execution, parts, confirmation, settlement | A maintenance order settles completely with no residual balance, verified per journey | OPEN |
| **P13-286** | HR journeys — recruit to hire | P13-257 | Requisition, posting, application, screening, interview, offer, acceptance, onboarding | An application becomes an employee with access provisioned, with no re-entry, verified end to end | OPEN |
| **P13-287** | HR journeys — time and attendance | P13-286 | Clocking, timesheet, absence request, approval, overtime, shift planning | Recorded time flows to payroll and costing without re-entry, verified per journey | OPEN |
| **P13-288** | HR journeys — payroll cycle | P13-287 | Preparation, simulation, verification, release, posting, payment, payslip, filing | A payroll cycle completes with net pay matching hand computation, verified per jurisdiction | OPEN |
| **P13-289** | HR journeys — performance and development | P13-286 | Goal setting, review, calibration, training, certification, succession | A review cycle completes with every rating attributable, verified by rehearsal | OPEN |
| **P13-290** | HR journeys — employee self-service | P13-287 | Personal data, leave, expenses, payslips, benefits — on web, mobile and desktop | An employee completes each task on every client and sees **zero** other employees' data | OPEN |
| **P13-291** | HR journeys — offboarding | P13-290 | Resignation, notice, handover, final pay, access revocation, exit | Offboarding revokes every access path and leaves no orphaned owned object, verified exhaustively | OPEN |
| **P13-292** | Project journeys — bid to delivery | P13-255 | Opportunity, estimate, project setup, planning, resourcing, execution, billing | Project cost and revenue reconcile to the GL throughout, asserted by comparison | OPEN |
| **P13-293** | Project journeys — time and expense | P13-292 | Recording, approval, rate determination, billing, reimbursement | Recorded time posts at the correct rate with no re-entry, verified per journey | OPEN |
| **P13-294** | Project journeys — closure | P13-293 | Completion, final billing, WIP settlement, capitalisation, post-review | A closed project has no unsettled cost and no open commitment, asserted before closure | OPEN |
| **P13-295** | Service journeys — request to resolution | P13-255 | Request, triage, entitlement check, assignment, resolution, billing, feedback | A service request outside entitlement is identified and charged per policy, verified per journey | OPEN |
| **P13-296** | Field service journeys | P13-295 | Scheduling, dispatch, travel, on-site execution offline, parts, signature, completion, billing | A field job completes fully offline and posts exactly once on reconnect, proven under interruption | OPEN |
| **P13-297** | Retail and point-of-sale journeys | P13-255 | Open till, sale, return, exchange, discount, payment, cash-up, day-end | A store day closes with cash, stock and revenue reconciled, verified per store day | OPEN |
| **P13-298** | E-commerce journeys | P13-297 | Browse, cart, checkout, payment, fulfilment, return, refund | An online order flows through the standard ERP pipeline, verified end to end | OPEN |
| **P13-299** | Healthcare vertical journeys | P13-255 | Registration, appointment, encounter, clinical record, order, billing, claim | Access without a lawful basis is refused and audited, verified per journey | OPEN |
| **P13-300** | Education vertical journeys | P13-299 | Admission, enrolment, timetable, attendance, assessment, grading, fees, graduation | A published grade cannot be altered without an audited correction, verified per journey | OPEN |
| **P13-301** | Real estate vertical journeys | P13-299 | Listing, lease, tenant onboarding, rent run, escalation, maintenance, renewal, exit | Rent invoicing derives from lease terms exactly, including escalation, verified per journey | OPEN |
| **P13-302** | Professional services vertical journeys | P13-299 | Engagement, staffing, delivery, utilisation, billing, profitability | Engagement profitability reconciles to project cost and revenue, asserted by comparison | OPEN |
| **P13-303** | Non-profit and public sector journeys | P13-299 | Grant, fund, restriction, appropriation, commitment, spend, acquittal | Restricted funds cannot be spent outside their restriction, enforced at posting | OPEN |
| **P13-304** | Tenant administrator journeys | P13-251 | User management, roles, SSO setup, security policy, access review, integration, billing | Every task in the scripted list completes without contacting support, measured; a task that cannot is recorded as a documented exception with a reason, and the exception count is ratcheted downward | OPEN |
| **P13-305** | Tenant security administrator journeys | P13-304 | Policy configuration, incident review, access certification, audit export, key rotation | Every security task completes with an audit record, verified per task | OPEN |
| **P13-306** | Auditor journeys | P13-305 | Scoped read-only access, evidence extraction, sampling, trail reconstruction | An audit request is satisfiable from generated evidence, verified by rehearsal | OPEN |
| **P13-307** | Executive and analyst journeys | P13-255 | Dashboards, drill-through, ad-hoc analysis, export, scheduled reporting | Every figure drills to its source document and authoriser, verified across the report estate | OPEN |
| **P13-308** | Developer journeys — first app | P13-251 | Register, verify, workspace, first object, first form, first flow, first publish | A first-time developer publishes a working application unaided, measured against its budget | OPEN |
| **P13-309** | Developer journeys — full-stack application | P13-308 | Data model, business logic, UI, integration, AI, tests, packaging, versioning — end to end | A complete full-stack application is built portal-only and installs into a tenant, verified end to end | OPEN |
| **P13-310** | Developer journeys — code escape and local development | P13-309 | Declarative to code, SDK, CLI, local run, debug, source control, CI/CD | A developer moves from declarative to code and back without losing work, verified per builder | OPEN |
| **P13-311** | Developer journeys — team and lifecycle | P13-310 | Invite collaborators, review, environments, promote, release, deprecate, transfer ownership | A team ships a versioned release through every environment, verified by rehearsal | OPEN |
| **P13-312** | Publisher journeys — list to earn | P13-311 | Verify identity, submit, review, list, price, sell, support, report, get paid | A publisher completes the commercial cycle to a reconciled payout, verified end to end | OPEN |
| **P13-313** | Publisher journeys — maintain and upgrade | P13-312 | Patch, new version, breaking change, deprecation, migration, end-of-life | A tenant customisation survives an upgrade, or produces a surfaced conflict, verified per case | OPEN |
| **P13-314** | Buyer journeys — discover to install | P13-255 | Search, evaluate, compare, trial, purchase, approve, install, configure, adopt | A buyer reaches an adopted application with governance applied, verified end to end | OPEN |
| **P13-315** | Website builder journeys | P13-255 | Create site, model content, compose pages, theme, preview, publish, roll back, measure | A non-developer publishes a conformant site unaided, measured against its budget | OPEN |
| **P13-316** | Website builder journeys — commerce site | P13-315 | Product projection, storefront, cart, checkout, order into the ERP, fulfilment | A storefront order becomes an ERP order through the governed path only, verified end to end | OPEN |
| **P13-317** | Portal journeys — customer and partner | P13-316 | Registration, authentication, own-data access, self-service, support | A portal user sees **zero** rows belonging to another customer, proven by test | OPEN |
| **P13-318** | Provider operator journeys | P13-251 | Provision, deploy, migrate, scale, investigate, remediate, fail over, offboard | Every operator task completes without shell or database access, verified by exercise | OPEN |
| **P13-319** | Provider support journeys | P13-318 | Case intake, tenant context, consented access, diagnosis, escalation, resolution | Support access without recorded consent is impossible, verified per journey | OPEN |
| **P13-320** | Provider finance journeys | P13-318 | Cost ingestion, allocation, unit economics, invoicing, payout, reconciliation | Cost per tenant sums to total cost and reconciles to provider invoices, asserted by comparison | OPEN |
| **P13-321** | Reseller and channel journeys | P13-314 | Partner onboarding, tenant provisioning on behalf, margin, billing, support handoff | A reseller transaction bills the reseller and entitles the tenant, and the two records reconcile exactly; a seeded divergence between them is caught by reconciliation | OPEN |
| **P13-322** | Guest and anonymous journeys | P13-255 | Public browsing, gated content, public forms, guest checkout, invited guest access | A guest cannot exceed the guest capability set, and expiry removes access automatically | OPEN |
| **P13-323** | Machine and integration journeys | P13-251 | Service account provisioning, credential issue, API use, quota, rotation, revocation | A machine credential cannot be used interactively, and revocation stops access within its window | OPEN |
| **P13-324** | Cross-client journey parity | P13-255 | Every journey attempted on web, mobile and desktop, with declared parity per journey | A journey declared available on a client and absent there fails the parity gate | OPEN |
| **P13-325** | Offline journey coverage | P13-296 | Every journey declared offline-capable, exercised offline end to end | Every offline-declared journey completes disconnected and syncs exactly once, verified per journey | OPEN |
| **P13-326** | Journey performance budgets | P13-093 | A task-completion time budget per journey, measured on the reference profile | Every journey meets its budget; a regression fails CI with the journey named | OPEN |
| **P13-327** | Journey failure-path coverage | P13-259 | Every journey's failure and exception branches exercised, not only its happy path | Every journey has its failure branches tested; a happy-path-only journey fails the gate | OPEN |
| **P13-328** | Journey documentation | P13-253 | User documentation generated from the journey register so it cannot drift from behaviour | Documentation regenerates from the register; a documented step absent from the register fails CI | OPEN |
| **P13-329** | The journey completeness proof | P13-255 | The stage's invariant: every persona × domain combination in the register has covering journeys, every journey has a passing test, and every shipped capability is reachable through at least one journey | No persona, role, domain or capability is uncovered. A seeded new capability with no journey is caught, and a seeded journey with no test fails CI | OPEN |
| **P13-330** | Registration-to-production proof | P13-329 | The single continuous proof the brief asks for: a stranger registers, becomes a tenant, configures the business, runs finance, sales, inventory and HR, and — as a developer — builds and publishes a complete full-stack application onto that same tenant | The whole arc completes unaided against a real deployment, recorded end to end. A break at any step fails the suite and names the step | OPEN |

---

## 11. Programme exit criteria

- [ ] **The composed platform holds isolation, journeys, reconciliation, performance and recovery simultaneously** (P13-248)
- [ ] **The platform is operated and a customer onboarded by people who did not build it, from documentation alone** (P13-249)
- [ ] **Every claim in every user-facing surface, document and README has a mechanism that can fail** (P13-247)
- [ ] Every seam in the register has a provider, a consumer, tests on both sides and an owner (P13-003, P13-030)
- [ ] Every programme's precondition gate passes against the real platform, not a reference (P13-031)
- [ ] Cross-programme contract conformance holds in a running system (P13-032, P13-060)
- [ ] Two tenants exercised across every programme simultaneously produce **zero** cross-reads (P13-071)
- [ ] A subject access request and an erasure both cover every programme completely (P13-077, P13-078)
- [ ] Every end-to-end journey passes, including offline, failure and recovery paths (P13-090, P13-095)
- [ ] Billing, entitlement and installed state reconcile platform-wide (P13-096)
- [ ] Marketplace revenue, ERP postings and platform billing reconcile to the cent (P13-097)
- [ ] Web, mobile and desktop agree on identical inputs (P13-048)
- [ ] A failure injected in any programme is contained and does not cascade (P13-107)
- [ ] A full-platform rolling upgrade completes with the system usable throughout (P13-113)
- [ ] Every alert has been observed firing in rehearsal; an unfired alert is unproven (P13-178)
- [ ] Every operational capability has been rehearsed within its review period (P13-161, P13-180)
- [ ] A legacy migration reconciles opening balances exactly, with rollback rehearsed (P13-184, P13-188)
- [ ] Cutover and parallel running rehearsed, with a rehearsed abort path (P13-189, P13-191)
- [ ] Every phase in every programme is DONE or WITHDRAWN with a current reason (P13-222, P13-223)
- [ ] Every `--despite-red-gate` override and every exemption is reviewed and re-justified (P13-224, P13-225)
- [ ] Every quality gate across every repository is proven able to fail (P13-227)
- [ ] `verify.mjs` is green across every repository at one commit (P13-229)
- [ ] Every gate item in `04-V1-RELEASE-DEFINITION § 5` is ticked with evidence (P13-250)
- [ ] **Every persona, role, domain and shipped capability is covered by a registered journey with a passing test** (P13-329)
- [ ] **A stranger registers, runs the business across finance, sales, inventory and HR, and builds and publishes a full-stack application on that same tenant — unaided, end to end** (P13-330)
- [ ] Every registered journey is completable by keyboard and screen reader, and in a second locale and RTL (P13-261, P13-262)
- [ ] Every journey's failure branches are tested, not only its happy path (P13-327)
- [ ] Every offline-declared journey completes disconnected and syncs exactly once (P13-325)
- [ ] A journey declared available on a client and absent there fails the parity gate (P13-324)

---

## 11. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 13 established (P13-001–P13-250), Integration and the v1.0 Release.** Registered per README § 0 rule 1. It exists because a review found **zero cross-programme integration phases across twelve programme documents and 3,961 phases**. That was not an error in any programme — each was correct inside its own boundary — but the independence that makes the platforms separately executable means a precondition gate proves a capability is *present*, never that it is *correct for the consumer*, and nothing owned the difference. `P13-003` registers every seam with an owner on both sides; `P13-004` watches BLOCKED phases so the E38/E44/I11/J25/G05/H05 pattern of blocking-on-absent-infrastructure cannot accumulate silently. This programme runs **throughout**, not at the end — its integration phases attach to whatever exists, as Track J does for Programme 1. It also owns executing the go-live gate in `04-V1-RELEASE-DEFINITION § 5`. | Claude Code |
