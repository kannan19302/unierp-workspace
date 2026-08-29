# UniERP Prerequisite and Foundation Remediation Plan

Status: Proposed execution plan  
Created: 2026-08-27  
Plan owner: UniERP architecture and engineering governance  
Authority boundary: operational sequencing; product intent remains in `unierp-platform/docs/product/` and the
owning platform suites

## Cycle and change contract

- Status: `PARTIAL`
- Cycle objective: establish one evolving project-level enterprise brain and a sequenced plan for remediating the
  audited UniERP prerequisites and foundations.
- Risk class: `R2 — coordinated` because governance spans the polyrepo and affects future agent decisions.
- Accountable platforms: all platforms; architecture and engineering governance coordinates.
- Repositories directly changed by this governance setup: workspace root, `unierp-platform`, `unierp-workspace`.
- Consumers: every repository, human contributor, coding agent, review bot and release/operations owner.
- Knowledge delta: `UPDATED` by the project-level skill and `AI_KNOWLEDGE_LIFECYCLE.md`.
- Restricted actions: no production/staging mutation, deployment, release, destructive data action, breaking
  contract or security-control weakening is authorized by this plan.
- Current behavior: strong but uneven documentation and implementation breadth; several verification gates use
  stale topology or pass after zero discovery; security, tenancy, domain ownership, contracts, delivery and
  production operations contain unresolved foundation risk.
- Intended outcome: a fail-closed, contract-first, tenant-safe, operable enterprise platform with traceable proof,
  where durable agent knowledge evolves with every material change.
- Rollback: remove the new skill/standard references if governance owners reject this mechanism; do not remove or
  weaken the canonical AI agent protocol or platform specifications.

### Acceptance criteria for this governance setup

1. One project skill is discoverable from the workspace entrypoint and applies across all repositories.
2. The skill defers to existing authority and does not duplicate product/platform truth.
3. Knowledge-growth triggers, ownership, freshness, deprecation and proof rules are normative.
4. A deterministic validator fails on missing authorities, missing repository entrypoints or zero repository
   discovery.
5. A mandatory SaaS readiness audit precedes remediation, and P0–P4 work has dependencies, deliverables, exit
   evidence and a development continuation gate.

## Foundation baseline and decision

The 2026-08-27 prerequisite audit inspected the 31 repositories declared by `UniERP.code-workspace` plus unmanaged
workspace material. The authoritative platform traceability matrices contained zero `IMPLEMENTED` rows, alongside
partial, unverified and gap states. Targeted checks showed both valid controls and false-green mechanisms.

Decision: **pause broad feature/module expansion until the development continuation gate passes.** The expanded
SaaS readiness audit was accepted by the human project owner on 2026-08-28. Ordered P0 foundation remediation is
authorized; production/staging mutation, deployment and release remain unauthorized.

## Execution rules

- Complete the mandatory audit in
  [`SAAS_PREREQUISITE_READINESS_AUDIT_CHECKLIST.md`](SAAS_PREREQUISITE_READINESS_AUDIT_CHECKLIST.md) before
  resuming P0–P3 implementation. Previously completed remediation is retained and assessed as evidence.
- During the audit, inspect and report only: do not refactor, add frameworks, split/merge repositories, change
  architecture, implement missing features, mutate environments, deploy or release.
- Complete work as small, owner-approved vertical slices; do not run phases as one large rewrite.
- Every item receives a change contract, named owner, consumers, acceptance proof, compatibility/rollout and
  rollback or roll-forward.
- Update owning requirements/ADRs and contracts before behavior or boundary implementation.
- A gate that finds zero expected targets, skips required evidence or runs against an obsolete path fails.
- A phase item is complete only after implementation, affected consumer integration, passing evidence, diff review
  and traceability; a document or patch alone is not completion.
- Human authorization remains required for production/staging mutation, release, destructive operations, breaking
  contracts and security-control weakening.

## P-1 — Mandatory SaaS prerequisite and readiness audit

P-1 is a hard predecessor to further remediation. It applies the complete 23-category checklist and evidence method
in [`SAAS_PREREQUISITE_READINESS_AUDIT_CHECKLIST.md`](SAAS_PREREQUISITE_READINESS_AUDIT_CHECKLIST.md) across the
active estate. It covers product/business foundations, requirements, architecture, tenancy, IAM, data, APIs,
security, privacy/compliance, UX, engineering, testing, infrastructure, CI/CD, observability, SRE, commercial SaaS,
administration, notifications, extensibility, customer lifecycle, launch readiness and scale.

| ID | Workstream and accountable owner | Deliverables | Dependencies | Exit evidence |
| --- | --- | --- | --- | --- |
| FND-PA-001 | **Estate-wide SaaS readiness audit** — architecture governance coordinates; all platform, product, data, security and operations owners are accountable for their areas | Complete classified master checklist; exact evidence; category and overall scores; gap/risk/duplication registers; P0–P4 backlog; dependency sequence; explicit deferrals; development and production GO/NO-GO decisions; top-priority list | Current active-estate catalog and authoritative platform sources | Every checklist ID satisfies the audit exit gate; scores reconcile; owner review is recorded; accepted findings update this remediation plan before implementation resumes |

Current P-1 status: `DONE — AUDIT ACCEPTED, P0 AUTHORIZED`. The
[`UNIERP_SAAS_READINESS_AUDIT_2026-08-28.md`](UNIERP_SAAS_READINESS_AUDIT_2026-08-28.md) report classifies all
237 items and calculates 37.4% readiness: 1 complete, 144 partial, 19 planned/documented-only, 32 implemented but
problematic, 12 duplicated/overlapping and 29 missing. It records `NO-GO` for both continued large-scale
development and production. The human project owner accepted the audit and ordered P0 sequence on 2026-08-28. The
digest-bound single decision source is
[`FND-PA-001_OWNER_REVIEW.md`](FND-PA-001_OWNER_REVIEW.md); `node scripts/check-saas-audit-acceptance.mjs` must pass
and P0 may proceed only while it remains green.

## P0 — Critical foundation

P0 removes immediate security/integrity hazards and restores trustworthy engineering controls. New business-domain
breadth remains frozen during P0.

| ID | Workstream and accountable owner | Deliverables | Dependencies | Exit evidence |
| --- | --- | --- | --- | --- |
| FND-P0-001 | **Authority and estate truth** — architecture governance / Runtime Operations | Ratify current repository names and active/archive status; repair ADR/document paths; generate repository/package/dependency inventory; resolve `@kannan19302/*` versus `@unerp/*`; define one package manager and runtime policy. | None | Every declared repo discovered; no active artifact relies on retired topology; generated graph matches manifests; owner approval recorded. |
| FND-P0-002 | **Fail-closed governance and CI discovery** — Runtime Operations | Repair architecture, schema ownership, retention, audit and documentation gates; require nonzero expected counts and prerequisite environments; remove `|| echo` suppression; pin reusable workflows/actions. | P0-001 | Injected missing/stale roots fail; correct estate scans nonzero targets; all required per-repo gates execute on the exact commit. |
| FND-P0-003 | **OIDC/SSO security** — Identity Platform | Replace manual token decoding with standards-compliant discovery/JWKS verification; enforce issuer, audience, signature, expiry, nonce/state/PKCE, redirect policy and SSRF-safe outbound endpoints; define key rotation and federation audit. | P0-002 for trusted CI | Forged token, wrong issuer/audience, nonce replay, malicious URL, key rotation and cross-tenant tests pass; security review signs off. |
| FND-P0-004 | **Whole-schema tenant isolation** — Data and Business Services + Identity | Runtime inventory of every tenant-owned table; ENABLE+FORCE RLS; application role is `NOSUPERUSER NOBYPASSRLS`; service scope checks; provider/tenant data-plane separation. | P0-001, P0-002 | Positive tenant A, negative tenant B and no-context tests pass for every tenant table using the application role; missing role/database/policy fails CI. |
| FND-P0-005 | **Authorization closure** — owning platforms + Identity | Inventory all HTTP, job, consumer, websocket and support entry points; explicit permission and record scope; deny absent/unknown metadata; preserve provider/tenant authority separation. | P0-001, P0-002 | Authenticated/unauthenticated, wrong-role, wrong-tenant, wrong-record and provider/tenant crossover tests pass for the complete inventory. |
| FND-P0-006 | **Durable audit and atomic events** — Data and Business Services + Runtime Operations | Classify mandatory audit events; replace best-effort audit; immutable/tamper-evident storage; atomic business change + outbox; idempotent/versioned/replayable consumers; reconciliation. | P0-004, P0-005 | Failure-injection proves no required audit/event loss; append-only DB enforcement; replay/DLQ/reconciliation and concurrency tests pass. |
| FND-P0-007 | **Executable delivery safety** — Runtime Operations | Disable misleading CD until replaced; define actual polyrepo artifact/release manifest, migrations, staging topology, health gates and rollback; protect environments. | P0-001, P0-002 | Dry-run resolves every path/package/artifact; no production action occurs; staging design and approval controls are reviewed. |
| FND-P0-008 | **Sensitive workspace hygiene** — Security + repository owners | Classify root scratch/token/cookie/artifact files without exposing contents; remove active-code ambiguity; add secret scanning and safe archival/quarantine rules. | P0-001 | Secret scan passes on active estate; archives are excluded and marked; no credential/personal data exists in source, fixtures, logs or evidence. |

## P1 — Required before feature expansion

P1 creates the canonical business and reusable-platform foundations needed to add ERP capabilities coherently.

| ID | Workstream and accountable owner | Deliverables | Dependencies | Exit evidence |
| --- | --- | --- | --- | --- |
| FND-P1-001 | **Canonical enterprise domain catalog** — Data and Business Services | Bounded contexts, vocabulary, aggregates/entities/values, IDs, lifecycles, invariants, commands/events, system-of-record, ownership and translation boundaries. | P0-001, P0-004 | Every active model, controller and event maps to one owner or an approved retirement/convergence item; architecture review accepted. |
| FND-P1-002 | **Organization and legal-entity model** — Tenant Admin + Business Services | Tenant/legal entity/business unit/location/cost center/department/team/position model; effective dating, hierarchy versions, consolidation, fiscal/tax/currency and intercompany relationships. | P1-001 | Referential and temporal invariants, tenant isolation, authorization, migrations and representative ERP consumer tests pass. |
| FND-P1-003 | **Master-data governance** — Business Services | Owners and contracts for party/customer/vendor/worker/product/UOM/currency/tax/location/account; keys, deduplication, stewardship, quality, lineage and lifecycle. | P1-001, P1-002 | Imports, merges, duplicate detection, downstream events, retention and reconciliation pass across named consumers. |
| FND-P1-004 | **Published contract catalog** — Business Services + Developer Platform | Versioned OpenAPI, event/AsyncAPI, webhook, SDK and extension schemas; canonical errors, pagination, concurrency, idempotency, signing and deprecation. | P1-001 | Every external boundary maps to a contract; generated validation/client builds and consumer compatibility gates pass. |
| FND-P1-005 | **Shared capability convergence** — assigned platform owners | One owned contract/runtime each for workflow, approvals, notifications, files, search, reporting, configuration, flags/entitlements, custom fields, scheduler/jobs, import/export, localization and billing/metering. | P1-001, P1-004 | Duplicate engines have migration/retirement plans; selected critical journeys use the shared runtime with security, tenant, failure and recovery proof. |
| FND-P1-006 | **Database quality and migration discipline** — Data and Business Services | Resolve duplicate concepts; enforce FKs/indexes/cascades, bounded fields, decimal money and units; expand/backfill/contract framework; production-volume rehearsals; guarded destructive commands. | P1-001, P1-003 | Schema ratchets decrease with no increases; compatibility, restartable backfill, RLS and roll-forward tests pass. |
| FND-P1-007 | **Risk-based test architecture** — Quality governance + owners | Required unit/domain, contract, integration, isolation, migration, security, accessibility, E2E, performance, resilience and recovery suites with environments and evidence expiry. | P0-002 and affected foundations | Required test matrix executes without silent skip; critical ERP journeys pass across real persistence/network/browser boundaries. |
| FND-P1-008 | **Unified design and experience foundation** — Design Platform | `@kannan19302/ui` adoption for web, cross-platform tokens for mobile/desktop, required states, navigation vocabulary, localization/RTL and WCAG 2.2 AA evidence. | P0-001, P1-005 | Token/debt ratchets pass; critical journeys pass keyboard, screen-reader, zoom/reflow, contrast, forced-color and localized tests. |

## P2 — Production readiness

P2 makes the foundation deployable, supportable, recoverable and auditable in production-shaped environments.

| ID | Workstream and accountable owner | Deliverables | Dependencies | Exit evidence |
| --- | --- | --- | --- | --- |
| FND-P2-001 | **Infrastructure as code** — Runtime Operations | Environment/cell topology for network, compute, database, cache/queues, object storage, IAM, KMS/secrets, DNS/TLS, telemetry, scaling, backup and policy. | P0-007, P1 foundations | Reproducible preview/staging environments, policy/security scan, drift detection and teardown/recreate rehearsal pass. |
| FND-P2-002 | **Release train** — Runtime Operations + platform owners | Immutable shared workflows, build-once signed/SBOM artifacts, version/compatibility manifest, staged promotion, migration choreography, approvals and rollback. | P2-001, P1-004, P1-006, P1-007 | Exact-commit CI, staging rollout, health/SLO gate and rollback/roll-forward rehearsal pass with provenance. |
| FND-P2-003 | **Observability and SRE** — Runtime Operations | Common structured logs/metrics/traces/correlation; critical-journey SLIs/SLOs/error budgets; dashboards, actionable alerts, synthetics, runbooks and on-call. | P2-001, P1-005 | Failure injection produces correlated telemetry and actionable paging; SLO queries and runbooks work for each critical journey. |
| FND-P2-004 | **Backup, PITR and disaster recovery** — Runtime Operations + data owners | Encrypted immutable off-site backup; WAL PITR; object/file, configuration and key recovery; per-data-class RPO/RTO; regional/cell exercises. | P2-001, P1-006 | Independent production-shaped restoration to chosen points proves integrity and declared RPO/RTO; quarterly evidence retained. |
| FND-P2-005 | **Compliance and privacy readiness** — Security/privacy/legal owners | Data/control inventories, classification, lawful basis/consent, residency, retention/erasure/legal hold, DSAR, vendor risk, threat models, license strategy and control mappings. | P1-003, P1-004, P2-001–004 | Owner-approved control evidence, negative tests, evidence calendar and gaps register exist; no unsupported certification claim. |
| FND-P2-006 | **Operational governance** — engineering governance | Named service/domain owners, branch/ruleset policy, vulnerability intake, incident/problem/change management, evidence expiry, release approval and repository archival. | P0-001, P2-002, P2-003 | On-call/ownership coverage, incident and release game days, access review and evidence-expiry checks pass. |

## P3 — Future scale

P3 optimizes a production-proven foundation; it must not be used to defer P0–P2 correctness.

| ID | Workstream | Outcome and evidence |
| --- | --- | --- |
| FND-P3-001 | Multi-cell/region placement | Tenant placement, residency, relocation, failover, capacity and noisy-neighbor controls proven through regional game days. |
| FND-P3-002 | Large-scale data/event operations | Partitioning, archiving, event replay, search reindexing and reconciliation meet measured volume/latency/recovery objectives. |
| FND-P3-003 | Ecosystem and marketplace assurance | Extension certification, permissions, isolation, billing attribution, portability, compatibility windows and kill-switch operations are proven. |
| FND-P3-004 | Advanced analytics and governed AI | Semantic lineage, model/prompt/data governance, privacy, human oversight, evaluation, drift, cost and safe fallback are production-operated. |
| FND-P3-005 | Continuous architecture fitness | Automated fitness functions, dependency/contract drift, knowledge freshness, technical-debt budgets and periodic architecture review remain green per release train. |

## P4 — Deferred enterprise maturity

P4 contains capabilities that are not justified by the current scale or product stage. Each item must have an
owner, trigger, rationale and review date; P4 shall not be used to defer P0–P2 correctness.

| ID | Workstream | Deferral and activation evidence |
| --- | --- | --- |
| FND-P4-001 | Advanced global topology | Additional regions/cells, sovereign deployments or active-active operation begin only when residency, latency, availability or customer commitments justify them. |
| FND-P4-002 | Extreme-scale storage and streaming | Sharding, specialized streaming platforms and tiered storage begin only from measured data/throughput limits and a proven simpler architecture. |
| FND-P4-003 | Advanced commercial optimization | Complex packaging, marketplace settlement and automated revenue optimization begin only after stable plans, metering, billing and reconciliation operate in production. |
| FND-P4-004 | Advanced autonomous operations | Automated remediation and sophisticated capacity/cost optimization require mature telemetry, safe rollback, policy and operator oversight. |
| FND-P4-005 | Additional certification programmes | Certification work begins only from customer/regulatory need, defined scope and legal/control-owner sponsorship; no certification is inferred from code. |

## Large-scale development continuation gate

Broad feature expansion may resume only after architecture, security, data and product owners accept evidence that:

1. FND-PA-001 is complete and the development decision is accepted;
2. every P0 item is complete;
3. P1-001 through P1-007 are complete, and P1-008 is complete for every expanded user-facing surface;
4. all governance/test gates discover correct nonzero targets and have no required skips or suppressed failures;
5. whole-schema NOBYPASSRLS tenant isolation and provider/tenant authority separation pass;
6. standards-compliant OIDC federation, explicit authorization, durable audit and atomic outbox behavior pass;
7. canonical domain, organization and master-data ownership are accepted and machine-enforced;
8. published contracts cover all consumed APIs/events/webhooks/SDK/extension boundaries;
9. affected typed, behavior, migration, security, accessibility and critical-journey gates pass;
10. authoritative traceability uses `IMPLEMENTED` only with current linked implementation and proof;
11. no unresolved P0/P1 high-severity risk, required consumer, migration or owner decision remains.

## Verification plan for each work item

Every work item shall define exact evidence for applicable adversarial cases:

- invalid and boundary input;
- unauthenticated, unauthorized and wrong-record denial;
- tenant A, tenant B and no-context isolation;
- duplicate, retry, concurrency and idempotency;
- dependency failure, timeout, degraded mode and reconciliation;
- migration forward recovery and production-shaped volume;
- keyboard, screen reader, zoom/reflow, localization and offline behavior;
- observability, rollback, restoration and operator runbook use.

## Current completion state

- Plan designed: `YES`.
- Enterprise brain and knowledge policy implemented: tracked by the creating change cycle, not asserted by this plan.
- P-1 analytical audit completed: `YES`; accountable-owner review/acceptance: `YES`.
- P0–P4 remediation implemented: `NO`.
- Product integrated, deployed or released from this plan: `NO`.
- Execution snapshot (2026-08-28):

| Item | Current state | Evidence / remaining condition |
| --- | --- | --- |
| FND-P0-001 | `COMPLETE (LOCAL)` | The canonical estate covers 31 repositories/28 manifests; six non-active roots have explicit disposition; Node 22/pnpm 9.15.4/one-lock policy passes; the generated 61-edge graph has zero upward edges/cycles; no active package uses the retired namespace. Exact-commit release integration remains part of P0-002. |
| FND-P0-002 | `PARTIAL` | Discovery fixtures fail closed; schema ownership scans 2,033 models; workflow/action inventory has zero mutable or unregistered references; the API module boundary baseline is zero. Downstream reusable-workflow callers still pin the last committed workspace SHA because the current edits are uncommitted; exact-commit CI integration therefore remains unverified. |
| FND-P0-003 | `PARTIAL` | Inbound OIDC now uses discovery, opaque one-time state, nonce, S256 PKCE and real JOSE/JWKS verification. Config secrets use an authenticated rotating-key envelope; saves force inactive/unverified; metadata/JWKS preflight and activation evidence are persisted; active legacy and hardcoded SSO surfaces converge on `SsoConfig`. Auth, IDP, data and focused API proof pass. SAML/end-to-end provider verification, production egress, durable federation audit, legacy-table retirement authorization, rotation exercise and security-owner sign-off remain. |
| FND-P0-004 | `PARTIAL` | The simulated workspace isolation check now delegates to the data-owned structural verifier, which requires an explicit NOBYPASSRLS application connection. No application-role database is available in this workspace, so whole-schema behavioral proof is intentionally not green. |
| FND-P0-005 | `PARTIAL` | The controller-local active-estate HTTP inventory scans 13,090 `api`/`idp` routes and now reports **0** declaration/enforcement gaps (down from 107); its adversarial fixture suite passes. It distinguishes tenant-staff RBAC, customer-portal record authority, session authority and protocol-public routes. Unsafe unverified-JWT entitlement, consent and logout revocation fallbacks were removed. Tenant-specific public PWA delivery was made fail-closed until a host-bound resolver exists; provisioning status is tenant-scoped JWT+RBAC; readiness is redacted and metrics requires `system.metrics.read`. Jobs, consumers, websockets, record scope and default-deny/negative proof remain. |
| FND-P0-006 | `PARTIAL` | A fail-closed active-estate audit suppression gate has adversarial proof and reports 11 current blocking paths. Mandatory event catalog, transaction/outbox convergence, immutable DB enforcement, worker coverage and failure/replay proof remain. |
| FND-P0-007 | `PARTIAL` | The stale auto-triggered CD workflow is now fail-closed with zero permissions and no environment action; an adversarial safety gate passes. Current polyrepo release topology, artifact provenance, staging, approval and rollback evidence remain required before CD can be enabled. |
| FND-P0-008 | `PARTIAL` | A content-redacting hygiene gate now identifies ungoverned root scratch and active-estate environment artifacts without reading them into reports. Owner classification/quarantine, approved secret scanning and any necessary rotation remain required. |

- Next required action: complete the exact-commit handoff for FND-P0-002 when a reviewed commit is authorized, while
  continuing safe local P0-003 implementation and proof in dependency order. The accepted sequence is
  product/ownership decisions; estate/toolchain and immutable workflows; sensitive
  artifact decisions; IAM authority; NOBYPASSRLS tenant isolation; data/transaction foundations; durable
  audit/outbox; module/contract boundaries; risk-based test/CI proof; traceability reconciliation.

> **This is not done.** The plan defines the required work; it is not evidence that the foundations are remediated.
