# TRACK C · PLATFORM ADMIN CONSOLE — C01–C28

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 2.** Brief objective ①. Ranked **fourth overall** — the largest single gap in the
> platform, and unusually cheap for its value because its backend already exists.

---

## 1. What this track owns

`unierp-console` — **plane 1, the control plane.** Provider staff only, separate origin, separate
IdP realm, MFA, restricted ingress. It talks to `/api/platform/v1` and **never** to `/api/v1`.

**The invariant this track establishes:**

> **Nothing about a tenant may require a database client.** Every provisioning, billing,
> support, migration and offboarding operation is performed through an audited UI, by a
> permission-holder, reversibly.

**And the one that constrains every phase here:**

> **A bug in plane 3 affects one tenant. A bug in plane 1 affects all of them.** Every mutation
> in this console is scoped, audited, reversible, and — for anything destructive or
> cross-tenant — two-person or time-delayed.

### Starting position

`00-BASELINE § 4①` — `unierp-console` has **11 source files**, seven of them route pages. This is
one of them, complete:

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

**But the hard half is done.** `unierp-api/src/platform/v1` already ships controller + service
pairs for `tenant-lifecycle`, `tenant-migration`, `super-admin`, `operations`, `white-label`,
`feature-flags-metering`, `reseller-channel`, `cluster-routing`, `enterprise-scale` and
`marketplace`. So Track C is predominantly _client_ work against a live control plane — which is
why it can run wide, and why every phase below begins by verifying which of its endpoints already
exist rather than assuming none do.

**Depends:** A01–A02, A10 (secret scanning — this console holds the most dangerous credentials in
the platform), B01–B12. **Blocks:** nothing structurally, but K05–K10 (billing) is unusable
without C13–C17.

---

## 2. Stage C-I · Foundations of the console (Wave 2)

| ID      | Phase                                            | Depends  | Deliverable                                                                                                                                                          | Exit                                                                                                                                                                                                                   | Status |
| :------ | :----------------------------------------------- | :------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **C01** | Control-plane shell, auth and realm separation   | A02, B04 | App shell, navigation, the separate IdP realm, enforced MFA, restricted-ingress configuration, session policy                                                        | A tenant-realm token is rejected by every console route. MFA cannot be skipped. A test proves a plane-3 credential cannot reach `/api/platform/v1`                                                                     | DONE   |
| **C02** | Control-plane RBAC and staff roles               | C01      | Provider staff roles — support L1/L2, billing, SRE, security, admin — each with least privilege, and a permission registry distinct from tenant permissions          | `PolicyEngine.isControlPlane` is exercised: a tenant wildcard grant (`*`) provably does **not** satisfy any `platform.*` or `system.*` permission. Every console endpoint carries an explicit control-plane permission | DONE   |
| **C03** | Control-plane audit log — immutable and complete | C01      | Every read and write in plane 1 recorded with actor, target tenant, before/after, justification and correlation ID                                                   | No console mutation is possible without an audit record; verified by a test that attempts one. Audit records are append-only and tamper-evident                                                                        | DONE   |
| **C04** | Two-person control for destructive operations    | C02, C03 | Approval requirement, time delay, and break-glass with mandatory post-hoc review for: tenant deletion, cross-tenant queries, production data access, key rotation    | A single operator cannot delete a tenant or read another tenant's records. Break-glass use raises an alert and creates a review task                                                                                   | DONE   |
| **C05** | Operations dashboard                             | C01, B10 | Real-time platform health: SLO status per tenant, error budgets, queue depth, outbox lag, dead letters, migration state, node health — from `platform/v1/operations` | An SRE can identify which tenant is degraded and why, without opening a terminal. Wired to the existing Grafana dashboards rather than duplicating them                                                                | DONE   |

---

## 3. Stage C-II · Tenant lifecycle (Wave 2)

| ID      | Phase                                                 | Depends           | Deliverable                                                                                                                                                        | Exit                                                                                                                                                                                         | Status |
| :------ | :---------------------------------------------------- | :---------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **C06** | Tenant directory and detail                           | C01–C03, B01, B11 | Searchable tenant list; a detail view showing plan, usage, health, users, apps, region, contract, support history and lifecycle state                              | Replaces the 8-line placeholder. Every field is live from `platform/v1`. A support agent can answer "who is this tenant and what is wrong" from one screen                                   | DONE   |
| **C07** | Provisioning and lifecycle transitions                | C06, C04          | Create, activate, suspend, resume, downgrade, archive, delete — driven by the existing `tenant-lifecycle` service, each transition guarded, audited and reversible | Every state transition is executable from the UI, produces an audit record, and has a documented reversal. Suspension is reversible without data loss; deletion honours `DELETION_POLICY.md` | DONE   |
| **C08** | Impersonation — consent, scope and time limit         | C02–C04           | Support impersonation requiring tenant opt-in, scoped to a role, time-boxed, with a persistent banner in-session                                                   | Impersonation is impossible without a valid tenant consent record. Session expires automatically. The impersonated user is notified (**G-10**)                                               | DONE   |
| **C09** | Impersonation audit and review                        | C08               | Every impersonated action attributed to _both_ the staff member and the tenant user; a reviewable session transcript                                               | A tenant admin can see every impersonation session against their tenant, including what was done. Nothing is invisible to them                                                               | DONE   |
| **C10** | Cross-tenant search for support — permission-filtered | C02–C04           | Locate a record across tenants for support purposes, with the query itself audited and rate-limited                                                                | A support agent finds an invoice by number across tenants; the query is logged with a justification; result counts do not leak the existence of records outside their grant                  | DONE   |
| **C11** | Tenant audit-trail viewer                             | C06, C03          | Provider-side view of a tenant's own audit trail, with export, so support can answer "what happened"                                                               | An auditor's question is answerable in minutes with an exportable artefact (**G-9**)                                                                                                         | DONE   |
| **C12** | Tenant configuration and feature flags                | C06               | Per-tenant flags, entitlements, limits and overrides via `feature-flags-metering`, with an expiry and a reason on every override                                   | Every override records who, why and until when. An expired override reverts automatically. No permanent undocumented exceptions                                                              | DONE   |

---

## 4. Stage C-III · Commercial operations (Wave 2, pairs with K05–K10)

| ID      | Phase                                      | Depends  | Deliverable                                                                                                                               | Exit                                                                                                                                                 | Status |
| :------ | :----------------------------------------- | :------- | :---------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **C13** | Plans, packaging and price books           | C06      | Plan definitions, feature matrices, entitlement mapping, price books per currency and region, versioning with grandfathering              | A price change applies to new subscriptions without altering existing ones. A plan's entitlements are the single source the runtime enforces         | DONE   |
| **C14** | Metering and usage explorer                | C05, C13 | Per-tenant usage by metered dimension, with drill-down to the events that produced it and a reconciliation view                           | A tenant's invoiced quantity is traceable to individual metering events. Double-counting is detectable and tested for (**G-2**)                      | DONE   |
| **C15** | Subscription management                    | C13, C14 | Create, upgrade, downgrade, proration, mid-cycle change, trial, pause, cancel, win-back — every path having a defined billing consequence | Every subscription transition produces a correct invoice line, verified by test cases including mid-cycle downgrade and trial-to-paid conversion     | DONE   |
| **C16** | Invoicing, credit notes and adjustments    | C15      | Invoice generation, tax lines, credit notes, refunds, write-offs, manual adjustments — each requiring a reason and an approver            | An incorrect invoice is correctable by credit note, never by mutation. Financial arithmetic has **100 %** test coverage per the DoD                  | DONE   |
| **C17** | Dunning, collections and involuntary churn | C16      | Retry schedules, dunning emails via A21, grace periods, staged feature restriction, suspension, and recovery                              | A failed payment follows the ladder without human action and restores full service on recovery. No tenant is suspended without a logged notice trail | DONE   |
| **C18** | Quota and limit administration             | A20, C12 | Provider view and control of per-tenant quotas, with alerts before a limit is hit                                                         | A tenant approaching a limit is warned before enforcement. An enforced limit is visible to both provider and tenant with the reason                  | DONE   |
| **C19** | Reseller, partner and channel management   | C13      | The `reseller-channel` service given a UI: partner accounts, sub-tenants, margin, co-branding, commission statements                      | A reseller provisions a tenant under their own account, and their commission statement reconciles to invoiced revenue                                | DONE   |

---

## 5. Stage C-IV · Support, migration and platform administration (Wave 2)

| ID      | Phase                                      | Depends       | Deliverable                                                                                                                                                                                                                                                                                                                                                                                                                | Exit                                                                                                                                                                                                                                                                     | Status |
| :------ | :----------------------------------------- | :------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----- |
| **C20** | Support workspace                          | C06, C11      | Ticket context, tenant health score, recent errors, session replay pointers, known-issue matching, and escalation                                                                                                                                                                                                                                                                                                          | An L1 agent resolves a common issue without escalating, using only the console (**G-19**)                                                                                                                                                                                | DONE   |
| **C21** | Broadcast, maintenance windows and status  | C06, A21      | Targeted announcements, scheduled maintenance notices, incident communication, and status-page integration                                                                                                                                                                                                                                                                                                                 | A maintenance window notifies affected tenants only, appears in-product, and reaches the public status page from one action                                                                                                                                              | DONE   |
| **C22** | Tenant migration and data movement         | C06, C04      | UI for `tenant-migration` and `cluster-routing`: move a tenant between clusters or regions with a rehearsal, a cutover, and a rollback                                                                                                                                                                                                                                                                                     | A tenant is migrated in a rehearsal with measured downtime and a proven rollback. Region moves respect A26 residency constraints                                                                                                                                         | DONE   |
| **C23** | Provider-assisted customer data import     | C06           | Provider-side view of a tenant's import jobs, with mapping templates, staged validation and error reports the tenant can act on                                                                                                                                                                                                                                                                                            | A failed import produces an actionable error report, not a stack trace. Pairs with D08–D12 (**G-4**)                                                                                                                                                                     | DONE   |
| **C24** | Tenant export and offboarding              | C06, C04      | Complete, re-importable tenant export; contractual offboarding with retention honoured and deletion certified                                                                                                                                                                                                                                                                                                              | An exported tenant is re-imported into a clean instance and reconciles. Offboarding produces a deletion certificate consistent with `DELETION_POLICY.md`                                                                                                                 | DONE   |
| **C25** | Extension and marketplace administration   | C06           | UI for the `marketplace` service: submissions, review queue, approval, versioning, revocation, analytics, reviews — replacing the placeholder pages that already exist                                                                                                                                                                                                                                                     | A malicious extension is revoked across every tenant that installed it, in one action, with those tenants notified (**G-20**)                                                                                                                                            | DONE   |
| **C26** | White-label and brand administration       | C12, B22      | UI for `white-label`: per-tenant domains, branding, email sender identity, certificate lifecycle                                                                                                                                                                                                                                                                                                                           | A tenant's custom domain is provisioned with a valid certificate, renewed automatically, and its expiry alerts before failure                                                                                                                                            | DONE   |
| **C27** | Platform configuration and release control | C05, A11      | Manifest-driven release control: view the pinned train, promote, roll back, gate on health — surfacing `platform-manifest.json`                                                                                                                                                                                                                                                                                            | A rollback is executed from the console by selecting the previous manifest, and the platform's own invariant ("a rollback is the previous manifest") is demonstrated                                                                                                     | DONE   |
| **C29** | Live tenant version upgrade                | C27, A22, D10 | Upgrading a **running tenant** from one release train to the next: pre-flight compatibility check, data migration, per-tenant staged rollout, in-flight rollback, and a tenant-visible maintenance notice. `platform-manifest.json` pins the train and `J17` tests migrations — neither covers _"tenant X is on 2026.08 and the platform is now on 2027.01"_, which is the situation every SaaS platform is permanently in | A tenant two trains behind is upgraded in a rehearsal with measured downtime, a proven rollback, and no data loss. A tenant whose data fails the pre-flight check is **not** upgraded, and the reason is actionable. Verified against a deliberately incompatible tenant | DONE   |
| **C28** | Security operations centre                 | C03, C04, A24 | Failed-login and anomaly monitoring, session revocation, key rotation, security-event triage, breach-response workflow                                                                                                                                                                                                                                                                                                     | A compromised session is revoked platform-wide in one action. A simulated breach follows the documented notification workflow end to end                                                                                                                                 | DONE   |

---

## 6. Track exit criteria

- [x] `unierp-console` source-file count is no longer 11, and **zero** of its route pages are
      under 20 lines
- [x] Every endpoint in `unierp-api/src/platform/v1` has a corresponding console surface, or a
      logged reason it deliberately has none
- [x] A tenant-realm credential is provably unable to reach any plane-1 route
- [x] No console mutation is possible without an audit record — asserted by test
- [x] The full tenant lifecycle — provision → activate → meter → invoice → dun → suspend →
      migrate → export → delete — is executable from the UI and rehearsed as a runbook
- [x] A single operator cannot perform any destructive or cross-tenant operation alone
- [x] Impersonation requires tenant consent, expires, and is visible to the tenant
- [x] An exported tenant re-imports into a clean instance and reconciles
- [x] Financial arithmetic in C14–C17 is at **100 %** unit coverage
- [x] An SRE can diagnose a degraded tenant without a terminal

---

## 7. Amendment log

| Date       | Change                                                                                                                                                                                                | By          |
| :--------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------- |
| 2026-08-07 | Track established. 28 phases in four stages, mapped 1:1 onto the ten existing `platform/v1` controller/service pairs so the track is client work against a live control plane rather than greenfield. | Claude Code |
