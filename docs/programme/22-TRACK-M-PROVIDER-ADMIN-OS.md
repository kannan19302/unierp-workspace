# TRACK M · PROVIDER ADMIN OS — M01–M46

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 2 (M01–M20) and Wave 6 (M21–M46).** Added 2026-08-11. The successor to Track C:
> Track C made the control plane **observable**; this track makes it **operable**.

---

## 1. What this track owns

`unierp-console` — **plane 1**, the same origin, realm, ingress and audit spine Track C
established. This track does not create a new console, a new plane, or a new service. It converts
the console from a set of read-only domain views into the **operating system of the business**:
the place where every provider-backed capability is registered, every resource has a declared
desired state, and every change to either is planned, approved, executed, reconciled, costed and
reversible.

**The invariant this track establishes:**

> **Every provider-backed capability is plural.** No capability may be satisfied by exactly one
> hard-coded provider. A capability names its providers, discovers what each can do, holds their
> credentials, watches their health, knows their price and their limits, and routes to them by
> priority with a declared fallback — including per-tenant. A capability that cannot survive its
> primary provider being removed is not finished.

**And the one that constrains every phase here:**

> **Nothing in this console mutates the estate directly.** Every operation is a *plan* against a
> declared desired state — validated, dry-run, approved where policy demands, scheduled,
> executed as a durable job, reconciled against actual, and reversible to the previous version.
> A button that calls a provider SDK in a request handler is rejected on sight.

### Starting position

`00-BASELINE § 4①` recorded `unierp-console` at 11 source files. Track C closed that gap: as of
2026-08-11 the repository holds **157 source files, ~21,957 lines, 132 route pages** across
fifteen domains, composed from `@kannan19302/ui`, token-only, and wired to **23 real
controller/service pairs** under `unierp-api/src/platform/v1`. **That work is correct and this
track preserves all of it.** No Track C phase is reopened and no Track C surface is rewritten
from scratch; each stage below extends the surfaces that already exist.

What Track C's exit criterion — *"every endpoint in `platform/v1` has a corresponding console
surface"* — permitted, and what this track exists to fix, is recorded as **D044**. The
representative case is `app/(control-plane)/infrastructure/kubernetes/page.tsx`: a stat row and a
thirty-item list over `cluster-routing-deep`, with no filter, no pagination, no detail route, no
mutation, and defensive `??` chains standing in for a typed contract. Sixteen infrastructure, AI
and operations pages share that shape. They render the estate. They cannot change it.

Three things measured to be **entirely absent** from the platform, each of which is a
prerequisite for the rest of this track rather than a feature of it:

| Absent | Measured by | First supplied by |
| :----- | :---------- | :---------------- |
| A provider registry — no `ProviderRegistry`, `ProviderCredential`, `ProviderRouting` or fallback-policy model anywhere in the tree | `grep -rE '(model\|interface\|class) \w*(ProviderRegistry\|ProviderCredential\|ProviderRouting\|FallbackPolicy)' .` → 0 hits | **M03** |
| Desired-vs-actual state, reconciliation, dependency graph, dry-run and policy-as-code in plane 1 | `grep -riE 'reconcil\|desiredState\|dryRun\|policy-as-code' unierp-api/src/platform` → 6 hits, all in `metering.service.ts`, unrelated | **M07** |
| Cost: provider billing ingestion, per-tenant/service/resource allocation, budgets | `grep -riE 'budgetAlert\|costAllocation' unierp-api/src/platform` → 0 hits | **M25** |

**Depends:** C01–C05 (shell, RBAC, audit, two-person control, operations dashboard) — this track
inherits all four and adds none of its own; A10, A24, A26; B01–B12.
**Blocks:** nothing structurally. K09–K18 (launch readiness) cannot be truthfully claimed without
M25–M31, and G-track monetisation cannot be reconciled without M28.

---

## 2. What this track deliberately does NOT own

Re-implementing these would duplicate working code and is an automatic rejection. Where a stage
below needs one of them, it **extends** the named phase's surface; it does not replace it.

| Capability named in the OS brief | Already owned by | This track's only involvement |
| :------------------------------- | :--------------- | :---------------------------- |
| Business & tenants, tenant directory and detail | C06 | M18 binds tenants to resources and regions |
| Tenant provisioning and lifecycle transitions | C07 | M12 puts C07's transitions on the operation pipeline |
| Plans, packaging, price books, entitlements | C13 | M29 binds entitlements to resource quotas |
| Subscriptions, invoicing, credit notes, dunning | C15–C17 | M31 reconciles provider cost against invoiced revenue |
| Metering and usage explorer | C14 | M30 adds provider-side reconciliation |
| Impersonation, cross-tenant search, support workspace | C08–C10, C20 | none |
| Migration, export, offboarding | C22, C24 | M36 adds DR/failover, which is not migration |
| Marketplace and extension administration | C25 | M44 binds extensions to the capability registry |
| White-label, domains, brand, certificate lifecycle | C26 | M23 owns certificates as a platform resource; C26 keeps the tenant-facing view |
| Release control and live tenant upgrade | C27, C29 | M20 puts both on the operation pipeline |
| Security operations centre | C28 | M32–M33 extend staff identity and ABAC |
| Tenant-side roles, delegation, per-app settings | D01–D03 | none — plane 2 |
| Developer portal, sandbox, app authoring | G01–G30 | M40 exposes the adapter SDK; G owns the portal |

---

## 2a. Stage M-0 · Wave 0 remediation — do this before M01

`90-DEFECT-LOG § 1` states that a Critical defect *"stops the current phase and becomes a Wave-0
phase."* **D046** is that defect, and this is that phase. It is the only Track M phase that is not
new capability: it closes a hole that is open right now, using a mechanism the codebase already
has and eight of its twenty-two control-plane controllers already apply correctly.

Track M cannot honestly begin before it. M01–M08 build a provider registry holding cloud
credentials, and M33 layers ABAC over the estate — both on top of a control plane where 54
endpoints currently authorise nobody. Building least-privilege scoping above an unguarded surface
is the exact shape of `00-BASELINE § 6`.

| ID      | Phase                                        | Depends | Deliverable                                                                                                                                                                                                                          | Exit                                                                                                                                                                                                                                                                                                             | Status |
| :------ | :------------------------------------------- | :------ | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M47** | Close D046 — authorise every plane-1 endpoint | — | `@Permissions` from the existing registry on all 54 unguarded endpoints, composed with `JwtAuthGuard`, `RbacGuard` and `ControlPlaneGuard` exactly as `tenant-lifecycle.controller.ts` already does; `@TwoPersonControl` on the destructive ones; and `scripts/check-platform-permissions.mjs` as a blocking CI gate so the class cannot return | `node scripts/check-platform-permissions.mjs` reports **0** mounted endpoints without an explicit control-plane permission, and **has been observed failing at 54**. A tenant-realm token receives **403** — not 404, not 500 — from `POST /platform/v1/offboarding/:tenantId/offboard` and from every other endpoint in D046's list, asserted per endpoint rather than per controller. C02's exit criterion is then re-run and passes for the first time | DONE |
| **M48** | Close D048 — wire the plane-1 audit log that was never called | M47 | `ControlPlaneAuditInterceptor`, a global interceptor gated on `SKIP_TENANT_SCOPE_KEY`, calling `ControlPlaneAuditService.record()` for every mutating plane-1 request; removal of 28 inert `@TrackChanges(...)` call sites across 10 controllers, which named a tenant-plane interceptor (`ChangeHistoryInterceptor`) that would have misfiled every plane-1 change record under the reserved seeding tenant rather than the real target tenant | `control-plane-audit-wiring.spec.ts` reports the interceptor registered and reading the correct marker, and **has been observed failing** with it unregistered. C03's exit criterion — "no console mutation is possible without an audit record" — was false for all 22 mounted controllers before this phase; re-run after, it holds for the write-attempt guarantee D048 states, with same-transaction atomicity to the mutation explicitly out of scope and carried forward to M14 | DONE |
| **M49** | Close D049 — make two-person control actually two-person | M48 | Separation check in `TwoPersonControlGuard` (`approvedBy` set and distinct from `requestedBy`), enforced independently in a new `ControlPlaneApprovalsService`; the missing approval-request/decide producers and the missing review-task reader (`ControlPlaneApprovalsController`); break-glass logged at `error` | `two-person-control-separation.spec.ts` proves self-approval and no-approver are refused, a genuinely distinct approver succeeds, and break-glass still creates a reviewable task — **has been observed failing** on the first two before the fix. Time delay (the third element of C04's deliverable) remains unimplemented, stated as residual rather than claimed | DONE |

---

## 3. Stage M-I · The OS kernel (Wave 2)

The eight phases that make the remaining thirty-eight cheap. Every one of them is a *mechanism*
other phases consume; none of them ships a domain feature. Building any later stage before this
one produces twenty-two divergent implementations of the same four ideas, which is the failure
mode Track C's read-only pages already demonstrate in miniature.

| ID      | Phase                                             | Depends       | Deliverable                                                                                                                                                                                                                                | Exit                                                                                                                                                                                                                                                                       | Status |
| :------ | :------------------------------------------------ | :------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M01** | The app platform — apps as first-class objects | C01, C02, B04 | An app manifest (id, nav descriptor, permissions, settings schema, resource kinds, lifecycle hooks) plus the console runtime that renders navigation, breadcrumbs, search and command palette from the manifests rather than from routing | A new app appears in navigation, search, the command palette and the permission registry by adding one manifest and zero files elsewhere. Removing its manifest removes it from all four. Proven with a throwaway app added and removed in the test | DONE |
| **M02** | Capability registry — the catalogue of what we do | M01 | A registry of platform capabilities (`email.send`, `object.store`, `dns.manage`, `llm.complete`, …), each with a typed operation contract, required credential shape, and the resource kinds it can produce | Every capability declares its contract in one place. A capability with no registered provider is reported as unsatisfied rather than failing at call time. A test enumerates all capabilities and asserts each has a contract, an owner and at least one provider or an explicit `UNSATISFIED` reason | DONE |
| **M03** | Provider registry, credentials and discovery | M02, A10 | `Provider`, `ProviderBinding`, `ProviderCredential` (secret-ref only, never a value) and `ProviderCapability`; registration, capability discovery against the live provider, and a credential lifecycle with rotation and expiry | Two providers are registered for one capability and both report their discovered capability set. **No credential value is persisted in the database** — asserted by a test that scans the table and by `check-secret-scan`. A credential past its expiry disables its provider rather than failing a request | DONE |
| **M04** | Provider health, limits, quotas and pricing | M03 | Per-provider health probes, rate limits, quotas, latency and error budgets, and a price sheet per operation and unit — all observed, not declared | A provider whose probe fails is marked unhealthy within its declared interval and is excluded from routing. Its recorded price and limits are the ones M06 routes on and M25 costs against — not a second copy | DONE |
| **M05** | Provider adapter contract and the reference pair | M03 | The adapter interface every provider implements, its conformance test suite, and two real adapters for one capability so the abstraction is proven by a second instance rather than asserted by a first | The conformance suite runs against both adapters and passes. A deliberately non-conforming adapter fails the suite. Adding a third provider requires no change outside its own adapter | DONE |
| **M06** | Routing, priority, fallback and tenant selection | M04, M05 | The routing engine: priority order, primary/secondary/fallback, health-aware and quota-aware selection, per-tenant provider override, sticky routing where a provider holds state, and circuit breaking | Disabling the primary provider moves traffic to the secondary with no code change and no request loss, proven by an integration test. A tenant pinned to a specific provider is never routed elsewhere, including during fallback — asserted separately | DONE |
| **M07** | Resource model — desired state, actual, drift | M01, C03 | `Resource`, `ResourceKind`, `DesiredState`, `ObservedState`, `Dependency` and `DriftRecord`: every managed thing in the estate declared once, with its dependency graph and a drift detector | A resource whose actual state is changed out of band is reported as drifted, with a diff naming the fields. The dependency graph refuses a cycle. Deleting a resource with dependents is refused with the dependents named, not with a foreign-key error | DONE |
| **M08** | Policy-as-code, inheritance and overrides | M07, C02 | Policies expressed as versioned code evaluated against a proposed change, with platform → region → tenant → resource inheritance, explicit overrides carrying a reason and an expiry, and a policy simulator | A change violating policy is refused with the rule and the failing field named. An override records who, why and until when, and reverts automatically on expiry (the C12 rule, applied to the estate). The simulator answers "what would this policy have blocked last month" against real history | DONE |

---

## 4. Stage M-II · The operation pipeline (Wave 2)

One pipeline, consumed by every stage after it. `plan → validate → policy → approve → schedule →
execute → observe → reconcile → rollback`, with the audit record produced by the pipeline rather
than by each caller.

| ID      | Phase                                          | Depends       | Deliverable                                                                                                                                                                                       | Exit                                                                                                                                                                                                                                                | Status |
| :------ | :--------------------------------------------- | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M09** | Plan and dry-run | M07, M08 | Every mutation compiles to a plan: the diff between desired and actual, the resources touched, the dependency order, the estimated cost delta from M04's price sheet, and the reversal | No operation reaches a provider without a plan. Dry-run of a destructive change produces the full diff and touches nothing — proven by asserting zero provider calls. The displayed cost delta comes from M04, not a constant | DONE |
| **M10** | Validation and typed operational errors | M09 | Pre-flight validation per resource kind, with typed domain errors mapped to RFC 7807 and remediation text an operator can act on | A failing pre-flight names the field, the rule and the fix. No provider SDK error reaches the UI unmapped — asserted by a test that injects a raw provider error and expects a typed problem document | DONE |
| **M11** | Approvals, two-person control and scheduling | M09, C04 | Approval routing driven by M08 policy, reusing C04's two-person and break-glass mechanism rather than a second one; maintenance windows, scheduled and recurring execution, and blackout periods | A destructive plan cannot execute on one operator's approval. A plan scheduled into a blackout window is refused at schedule time, not at run time. **A test proves this uses C04's mechanism** — removing C04's guard breaks this phase's test | DONE |
| **M12** | Durable execution, jobs and provisioning | M11, M06 | The executor: durable, idempotent, resumable jobs with per-step state, partial-failure handling, compensation, and provisioning/deprovisioning for every registered resource kind | An executor killed mid-plan resumes without repeating a completed step, proven by killing it. A failed step compensates or halts — never leaves a half-provisioned resource unrecorded. C07's tenant transitions run on this pipeline | DONE |
| **M13** | Reconciliation and self-healing | M12 | The continuous reconciler: converge actual toward desired, with per-kind healing strategies, a blast-radius limit, and a manual-hold that suppresses healing during an incident | A resource deleted out of band is restored, and the restoration is audited as a reconciliation rather than as an operator action. A reconciler with a mis-set desired state hits the blast-radius limit and stops instead of rebuilding the estate | DONE |
| **M14** | Versioning, rollback and immutable audit | M12, C03 | Every desired state versioned; every plan, approval, execution and reconciliation appended to C03's immutable audit spine with actor, target, before/after, justification and correlation ID | Any resource is rolled back to any prior version by selecting it, and the rollback is itself a versioned plan. **No pipeline stage can execute without an audit record** — asserted by a test that removes the audit writer and expects failure | DONE |
| **M15** | Bulk operations, estate search and saved views | M09, M07, B11 | Server-side search, filter and sort across every resource kind; multi-select bulk plans with per-item outcome; saved views; and export — using the B-track table primitives, not hand-rolled ones | A bulk operation over 500 resources reports per-item success and failure and is resumable, with no `limit > 100` page. A partially failed bulk operation names exactly which items failed and why. Zero hand-rolled `<table>` elements in the diff | DONE |

---

## 5. Stage M-III · The estate — cloud, infrastructure and secrets (Wave 2 for M16–M20, Wave 6 thereafter)

Each phase here is the same shape: take a domain Track C rendered read-only, model its resources
on M07, put its mutations on the M09–M14 pipeline, and register its providers on M03. None of
them invents a mechanism.

| ID      | Phase                                             | Depends  | Deliverable                                                                                                                                                                                     | Exit                                                                                                                                                                                                                                                          | Status |
| :------ | :------------------------------------------------ | :------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M16** | Cloud accounts and multi-cloud onboarding | M03, M06 | Cloud provider accounts as first-class resources: onboarding, credential binding, capability discovery, org/subscription hierarchy, and per-account guardrails | A second cloud account of a different provider is onboarded through the UI and its inventory appears in the estate without a code change. Its credentials are secret-refs (M03) | DONE |
| **M17** | Regions, residency and placement | M16, A26 | Regions as resources, with residency constraints, placement rules and the tenant→region binding that C22 migrations already assume | A resource whose placement violates a tenant's residency constraint is refused at plan time by an M08 policy, not at execution. Verified against a tenant with a hard residency constraint from A26 | DONE |
| **M18** | Estate inventory, topology and tenant attribution | M07, M16 | Continuous inventory across all accounts; the resource topology graph; and attribution of every resource to a tenant, service, environment and owner — including an explicit `unattributed` bucket | Every discovered resource is attributed or is listed in the unattributed bucket with an age. The bucket is never hidden. This attribution is the one M27 allocates cost against — not a second mapping | DONE |
| **M19** | Kubernetes fleet operations | M18, M12 | The cluster-routing surfaces made operable: workloads, nodes, namespaces, autoscaling and routing weights as desired state, with drain, cordon, scale and rollout as pipeline plans | Replaces the read-only page named in D044. A routing weight is changed through a planned, approved, reconciled operation and reverts on rollback. `kubernetes/page.tsx` has a detail route, server-side filtering and at least one mutation | DONE |
| **M20** | Environments, deployments and release binding | M12, C27 | Environments as resources with promotion paths; deployments and releases bound to C27's manifest and C29's tenant upgrade, so a release is a plan with a health gate and an automatic rollback | A promotion blocked by its health gate rolls back automatically and the rollback is the previous manifest — C27's stated invariant, now executed by the pipeline rather than by hand. C27 and C29 keep their surfaces and gain a plan | DONE |
| **M21** | Compute, storage and network resources | M18, M12 | Compute, block/object storage, VPC/subnet/load-balancer and firewall resources with full lifecycle, scaling and migration on the pipeline | Each kind provisions, scales, migrates and deprovisions from the UI, with drift detected and a proven reversal. A deprovision with dependents is refused by M07's graph | DONE |
| **M22** | Databases, CDN and DNS | M21, C26 | Database instances, replicas and parameter groups; CDN distributions; DNS zones and records — each multi-provider via M03, with C26's custom-domain flow consuming DNS rather than duplicating it | A DNS zone is served by either registered provider without a code change. C26's custom-domain provisioning calls this surface — proven by a test that removes the second implementation and C26 still passes | DONE |
| **M23** | Secrets, certificates and keys | M03, A10 | The secret, certificate and key resources behind every credential in this track: issuance, rotation, expiry alerting, revocation, and per-provider KMS/vault backends | A certificate within its alert window raises before expiry, and rotation completes without downtime. **No secret value is readable through any console API** — asserted by a test that requests one and expects a redacted reference. C26's certificate lifecycle consumes this | DONE |
| **M24** | Capacity, scaling and performance | M21, C05 | Capacity models, headroom, autoscaling policy and load-driven scaling plans, extending C05's operations dashboard rather than replacing it | A capacity shortfall predicted by the model raises before it is hit, and the scaling plan it proposes executes on the pipeline. The prediction is checked against a real historical shortfall, not a synthetic one | DONE |

---

## 6. Stage M-IV · Money — provider cost, allocation and optimisation (Wave 6)

`K19` established cost per tenant as a requirement. Nothing supplies it: the platform can invoice
a tenant and cannot state what that tenant costs. This stage closes that, and it is the stage
that makes the business's margin a measured number rather than an assumption.

| ID      | Phase                                        | Depends            | Deliverable                                                                                                                                                                       | Exit                                                                                                                                                                                                                                                     | Status |
| :------ | :------------------------------------------- | :----------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M25** | Provider billing and cost ingestion | M16, M04 | Scheduled ingestion of every provider's billing export, normalised to one cost model, with currency, amortisation, credits, commitments and late-arriving adjustments | An ingested month reconciles to the provider's own invoice total to the cent. Money is `Decimal(19,4)` throughout; a `Float` in this path fails the build. Re-ingesting the same period does not double-count — asserted | DONE |
| **M26** | Real-time usage and consumption telemetry | M18, C05 | Live resource utilisation and consumption per resource, service, environment and tenant, at a resolution that supports both alerting and allocation | Utilisation for any resource is available within its stated freshness bound, and the bound is asserted by test rather than documented. Gaps are reported as gaps, never interpolated to zero | DONE |
| **M27** | Cost allocation — tenant, service, resource | M25, M26, M18 | Allocation of every ingested cost to a tenant, service, resource and environment using M18's attribution, with shared-cost splitting and an explicit unallocated bucket | 100 % of ingested cost is either allocated or in the unallocated bucket — the two sum to the ingested total, asserted to the cent. The unallocated share is displayed, never hidden. Allocation arithmetic is at **100 %** unit coverage per the DoD | DONE |
| **M28** | Cost per tenant, margin and unit economics | M27, C14, C16 | Cost, revenue and margin per tenant, plan and module; cost per active user and per transaction; and the trend that shows whether a plan is priced above its cost | The gross margin of any tenant is stated with both sides traceable — cost to M25's ingested line, revenue to C16's invoice. A tenant whose cost exceeds its revenue is surfaced. **This is the phase K19 depends on** | DONE |
| **M29** | Budgets, forecasts and quota binding | M27, C13, C18 | Budgets per tenant, service and account with threshold alerts and enforcement actions; forecasting; and the binding from C13 entitlements to M07 resource quotas | A budget crossing its threshold alerts and, where configured, executes an enforcement plan through the pipeline — never a direct mutation. An entitlement change in C13 changes the resource quota, proven by asserting the quota after a plan change | DONE |
| **M30** | Metering reconciliation, provider vs invoiced | M26, C14 | Reconciliation of provider-reported consumption against C14's metered quantities, with a variance report and drill-down to the events on both sides | A deliberate divergence between provider consumption and metered quantity is detected and reported with both sources named. Extends C14's reconciliation view; does not fork it | DONE |
| **M31** | FinOps optimisation and waste recovery        | M27, M24           | Idle, orphaned, over-provisioned and unattributed resource detection; rightsizing, commitment and scheduling recommendations — each expressed as an executable plan with its saving | Every recommendation is executable as a plan and states its saving from M25's real prices. A recommendation acted upon is measured afterwards against its predicted saving, and the difference is shown. No recommendation is advice-only                 | OPEN   |

---

## 7. Stage M-V · Governance, continuity and observability (Wave 6)

| ID      | Phase                                            | Depends       | Deliverable                                                                                                                                                                       | Exit                                                                                                                                                                                                                                       | Status |
| :------ | :----------------------------------------------- | :------------ | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **M32** | Staff identity, SSO, MFA and session governance  | C01, C28      | Multi-provider staff IdP via M03 (SAML/OIDC/SCIM), enforced MFA with step-up for destructive plans, device and session policy, and just-in-time privilege elevation with expiry    | A second IdP is added without code change. Step-up MFA is unskippable on a destructive plan — asserted by attempting one without it and expecting 403. An elevated privilege expires automatically and is audited on both grant and expiry | OPEN   |
| **M33** | RBAC/ABAC for the estate — least privilege       | M32, C02, M08 | Attribute-based authorisation over the estate: grants scoped by resource kind, region, environment, tenant and account, composed from C02's control-plane registry                | A grant scoped to one region provably cannot plan against another — a two-scope test asserting **zero** resources visible, not filtered results. No `platform.*` wildcard satisfies an estate grant. Unauthorised returns **403**          | OPEN   |
| **M34** | Observability — logs, metrics, traces, APM       | M18, C05      | Unified log search, metric explorer, distributed tracing and APM across the estate, correlated to resources, tenants and plan executions by correlation ID                        | A failed plan is traced from the console click to the provider call in one correlated view. Wired to the existing Grafana/OTel backends rather than duplicating them, per C05's precedent                                                  | OPEN   |
| **M35** | Incidents, SLO/SLA, error budgets and on-call    | M34, C05, C21 | Incident lifecycle, SLO definitions and error budgets per service and tenant, SLA tracking with credit calculation, on-call and escalation, and postmortems — using C21 to notify | A breached SLO opens an incident, notifies affected tenants through C21, and produces an SLA credit that reaches C16 as an adjustment. The credit arithmetic is at **100 %** coverage. A simulated breach runs the path end to end        | OPEN   |
| **M36** | Backup, restore, DR and failover                 | M21, M22, C04 | Backup policies as desired state, restore as a plan, RPO/RTO objectives measured rather than declared, cross-region replication, and failover/failback rehearsal                  | A restore is rehearsed and reconciles; the measured RPO and RTO are recorded against the objective and a miss is a failure, not a note. A region failover is rehearsed with a proven failback. Distinct from C22 migration — asserted      | OPEN   |
| **M37** | Data governance, privacy, retention, residency   | M17, A26, C24 | Data classification and inventory, PII registry binding, retention and deletion schedules as policy, residency enforcement, subject-access and erasure workflows                  | A retention schedule executes deletion on time and certifies it consistently with `DELETION_POLICY.md` and C24. `check-pii-registry.mjs` passes over every resource kind introduced by this track                                          | OPEN   |
| **M38** | Compliance controls and evidence                 | M37, M14, K04 | Control catalogue mapped to frameworks, continuous control monitoring, and evidence collected automatically from the M14 audit spine rather than assembled by hand               | An auditor's question is answered with an exported evidence artefact generated from real audit records, with no manual assembly step. A failing control is failing in the console before it is failing in an audit                        | OPEN   |
| **M39** | AI, models, agents, MCP, RAG and AI governance   | M03, M06, E45 | AI providers and models on the provider registry; agent, MCP-server and RAG-index registration; prompt and model versioning; token/cost metering into M27; guardrails and evals   | A model is swapped for another provider's without a code change and the evaluation suite runs against both. AI spend appears in M27 allocation like any other cost. A guardrail failure blocks the call and is audited                     | OPEN   |

---

## 8. Stage M-VI · Extensibility, communications and the estate-wide gap close (Wave 6)

| ID      | Phase                                          | Depends            | Deliverable                                                                                                                                                              | Exit                                                                                                                                                                                                                                    | Status |
| :------ | :--------------------------------------------- | :----------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----- |
| **M40** | Custom adapters and the provider SDK           | M05, G19, G26      | A published SDK and a documented path for a first-party or customer-authored adapter, with the M05 conformance suite as its acceptance gate, versioning and revocation   | An adapter authored outside this repository passes conformance, registers, serves traffic and is revoked — end to end, without a platform code change or a release                                                                      | OPEN   |
| **M41** | Integrations, webhooks, events and the API     | M02, M14           | The platform event catalogue, outbound webhooks with signing, retry and replay, inbound integration registry, and the public control-plane API with keys, scopes and rate limits | Every platform event is documented, emitted through the outbox and replayable. A webhook endpoint failing then recovering receives its backlog in order, exactly once — asserted. No direct cross-module service import in the diff | OPEN   |
| **M42** | Communications and notification routing        | M03, M06, A21, C21 | Notification channels (email, SMS, push, chat, webhook) as capabilities with multiple providers, templates, localisation, preferences, deliverability and suppression    | A notification falls back to the secondary provider when the primary fails, without duplicate delivery — asserted. C21 broadcasts and A21 transactional mail both route through this, proven by removing the second path               | OPEN   |
| **M43** | Localisation, tax and regional controls        | M17, K07, K16      | Locale, currency, tax-provider registration via M03, regional feature and legal controls, and the binding to C13 price books per region                                 | A tax calculation is served by either registered provider with matching results on a shared fixture set. A region-restricted feature is unreachable from that region — asserted, not configured                                         | OPEN   |
| **M44** | Products, modules, suites and marketplace bind | M02, C13, C25      | Products, modules and industry suites as catalogue objects bound to capabilities and entitlements; extensions from C25 declaring the capabilities they consume          | An industry suite is composed, priced and provisioned from the catalogue. An extension declaring an unsatisfied capability cannot be approved in C25's review queue                                                                    | OPEN   |
| **M45** | Automation, runbooks and event-driven response | M12, M35, M13      | Runbooks as versioned, testable automations; event triggers; scheduled maintenance automation; and approval gates on anything destructive                               | A runbook is authored, dry-run, approved and executed from an incident, and its execution is audited as a plan. A runbook that would breach M08 policy cannot be published                                                              | OPEN   |
| **M46** | The estate gap verification                    | M01–M45            | The standing verification that the OS is complete: every capability has ≥2 providers or a logged reason, every resource kind is on the pipeline, every cost is allocated, every console page can mutate what it renders — as an executable check | `node scripts/check-admin-os.mjs` passes, and **has been observed failing** when a capability is reduced to one provider, when a resource kind bypasses the pipeline, and when a page renders a resource kind it cannot operate. This check is the track's real exit criterion | OPEN   |

---

## 9. Track exit criteria

- [ ] No provider-backed capability has exactly one implementation, or the exception is logged
      with a reason and an owner
- [ ] Removing the primary provider of any capability moves traffic to a fallback with no code
      change — demonstrated per capability, not asserted once
- [ ] Every managed resource has a declared desired state, a detected drift, a reversal, and a
      version history
- [ ] No mutation in `unierp-console` reaches a provider except through the M09–M14 pipeline —
      asserted by `check-admin-os.mjs`, observed failing
- [ ] Zero route pages in `unierp-console` that render a resource kind they cannot operate
- [ ] 100 % of ingested provider cost is allocated or explicitly unallocated, and the two sum to
      the ingested total to the cent
- [ ] The gross margin of any tenant is stated with both sides traceable to source records
- [ ] A region failover is rehearsed with a measured RPO/RTO and a proven failback
- [ ] A scope-limited estate grant provably returns **zero** out-of-scope resources
- [ ] An adapter authored outside this repository serves production traffic and is revoked,
      without a platform release
- [ ] Financial arithmetic in M25–M31 and M35 is at **100 %** unit coverage

---

## 10. Amendment log

| Date       | Change                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | By          |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------- |
| 2026-08-11 | Track established. 46 phases in six stages. Registered per `README § 0` rule 1 in one commit: § 3 table, `DECLARED` and `TRACK_FILES` in `check-plan-integrity.mjs`, `TRACKS` in `phase-brief.mjs`, the manifest via `--update`, and the reason in § 6. Additionally required and not listed by rule 1: the nine `[A-L]` phase-ID regexes across `check-plan-integrity.mjs`, `phase-brief.mjs` and `start.mjs` widened to `[A-M]`, without which every Track M dependency parses as prose and reads as unblocked. Filed as **D045**. | Claude Code |
| 2026-08-11 | Placed in Wave 2 (M01–M20) and Wave 6 (M21–M46) per `01-PRIORITY-AND-SEQUENCING § 4`. M01–M20 belong to Wave 2 because that wave's claim — *"the platform is operable"* — is not truthful while the console can only observe the estate. The remaining stages carry no Wave-2 claim and fall to Wave 6's "residual from every track".                                                                                                                                                                       | Claude Code |
