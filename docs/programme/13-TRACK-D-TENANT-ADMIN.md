# TRACK D · TENANT SAAS PORTAL AND APP SETTINGS — D01–D22

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 2 (D01–D12) and Wave 3 (D13–D22).** Brief objectives ⑧ and ⑨. Ranked **fifth** — and it
> precedes Track E for a structural reason, not a commercial one: **D13–D22 defines the settings
> contract that all 45 modules must conform to.**

---

## 1. What this track owns

**Plane 2 — tenant administration.** Everything a customer's own administrator controls: users,
roles, branding, subscription, data, integrations, and the settings of every app they have
installed.

**The two invariants this track establishes:**

> **A tenant administrator needs us for nothing that concerns only their own tenant.** Any
> operation that requires a support ticket is a missing feature.

> **There is one settings runtime, not forty-five settings pages.** An app *declares* its
> settings as a schema; the platform renders, validates, scopes, versions, audits and exports
> them.

### Starting position

`00-BASELINE § 4⑧` — `unierp-api/src/modules/saas-portal` and `modules/saas` exist;
`unierp-web/app/(dashboard)/{settings,subscriptions,apps,app,profile}` exist. What does not exist
is a coherent plane-2 *story*: which screens a tenant admin sees versus a tenant user, and how
users, billing, licensing, branding and data hang together as one portal rather than as settings
pages that accumulated.

`00-BASELINE § 4⑨` — `app/(dashboard)/settings`, `modules/config` and `schema/config.prisma`
exist, but there is no evidence of a *uniform* per-app settings contract. Forty-five modules each
inventing their own settings page is how a platform stops feeling like one product.

**Depends:** A01–A02, B01–B12, C06 (the provider view of a tenant must exist before the tenant
view can be reconciled against it). **Blocks:** all of Track E via D13–D22.

---

## 2. Stage D-I · The tenant portal (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **D01** | Tenant admin shell and the plane-2 boundary | B04, C02 | A distinct administration area with its own navigation, and a clear, enforced line between tenant-admin and tenant-user capability | A tenant user without an admin grant receives **403** — not a hidden menu item — on every plane-2 route. Asserted by test | DONE |
| **D02** | User lifecycle | D01, A21 | Invite, onboard, activate, suspend, transfer ownership, offboard — with bulk operations, CSV import, and directory-independent operation | An offboarded user's sessions are revoked, their records reassigned, and their access removed everywhere within one operation. Reassignment leaves no orphaned approvals | DONE |
| **D03** | Roles, permissions and delegation | D01, C02 | Tenant-defined roles composed from the shared permission registry; record-level scope (own/team/org/all); field-level masking; time-boxed delegation | A tenant admin builds a custom role and the two-tenant isolation test still passes. A delegation expires automatically. No tenant role can grant a `platform.*` permission | DONE |
| **D04** | Organisation structure | D03 | Legal entities, business units, branches, teams, cost centres, approval hierarchies — the structure the whole ERP hangs off | An approval routes correctly through a three-level hierarchy with a vacant position handled by escalation, not by silence | DONE |
| **D05** | Tenant audit trail as a product surface | D01, C03 | Searchable, filterable, exportable audit trail scoped to the tenant, with retention per `DATA_RETENTION_MATRIX.md` | A tenant admin answers "who changed this and when" for any record without contacting support, and exports evidence for an auditor (**G-9**) | DONE |
| **D06** | Notification preference centre | A21, D02 | Per-user and per-tenant channel preferences, digests, quiet hours, escalation paths, and unsubscribe honoured across all 45 modules | Setting a preference suppresses delivery from every module. Verified by asserting no module sends directly (**G-5**) | DONE |
| **D07** | Guided onboarding and in-product help | D01, B12 | Setup checklist, sample data that is clearly marked and removable, contextual help, tours, and empty states that coach rather than apologise | A new tenant admin reaches a first useful outcome without documentation. Sample data is removable in one action with no residue (**G-18**) | DONE |

---

## 3. Stage D-II · Tenant data sovereignty (Wave 2)

**This stage is what makes the AGPL self-hosting promise real.** "You can self-host" is hollow if
the only export is a `pg_dump` nobody can interpret (**G-4**).

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **D08** | Import framework | D01 | A generic staged import: upload → map → validate → dry-run → commit → reconcile, usable by any module rather than reimplemented per module | An import with 200 bad rows out of 10,000 reports every one actionably, imports nothing, and is re-runnable after correction | DONE |
| **D09** | Migration templates for common sources | D08 | Mapping templates for spreadsheets and the common incumbents (Tally, QuickBooks, Zoho, SAP B1) covering chart of accounts, customers, suppliers, items, opening balances | Opening balances imported from a template produce a trial balance that reconciles to the source, and the reconciliation statement is a downloadable artefact | DONE |
| **D10** | Complete tenant export | D01 | Full export of every entity a tenant owns, in a documented, re-importable format, including attachments and audit history | The export re-imports into a clean instance and reconciles record-for-record. Requested by the tenant, delivered without our involvement | DONE |
| **D11** | GDPR data-subject rights | D10, A25 | Subject access request, rectification, portability, and erasure — with the erasure-versus-immutable-audit conflict explicitly resolved rather than deferred | An erasure request removes personal data while preserving the audit trail's integrity, by a documented mechanism (crypto-shredding or tokenised redaction). The resolution is written down, not implicit (**G-3**) | DONE |
| **D12** | Retention and deletion administration | D11 | Tenant-visible retention policies per data class, legal hold, and deletion scheduling — making `DATA_RETENTION_MATRIX.md` and `DELETION_POLICY.md` true of all 1,836 models rather than documented | `enforce-retention.mjs` runs against every model; any model without a retention class fails the gate. Legal hold provably suspends deletion | DONE |

---

## 4. Stage D-III · The settings contract (Wave 3) — blocks all of Track E

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **D13** | Settings schema specification | D01, B05 | A single declarative contract in `unierp-contracts`: an app declares its settings — type, default, scope, validation, permission, dependency, help text, migration | The contract is published at L0 and the specification names every scope level. Nothing may define a setting outside it | WIP |
| **D14** | Settings runtime | D13, B05 | One renderer that turns any conforming schema into a settings UI, with search, categories, dirty-state, dependency-driven visibility, and reset-to-default | A new app declaring 40 settings gets a complete settings page with **zero** bespoke UI code | OPEN |
| **D15** | Scope resolution | D13 | Deterministic resolution across platform → tenant → app → business unit → role → user → device, with the effective value and its origin always inspectable | Any setting's effective value shows which scope supplied it. Precedence is a tested table, not an implementation detail | OPEN |
| **D16** | Settings versioning and migration | D13 | Versioned schemas, migrations for renamed or retyped settings, and defaults that change without silently altering existing tenants | A setting renamed in v2 preserves every tenant's v1 value. A changed default does not move a tenant that never set it | OPEN |
| **D17** | Settings audit and change control | D13, D05 | Every change recorded with actor, before/after and reason; approval required for designated sensitive settings; rollback available | A sensitive setting cannot change without an approver. Any change is revertable to its previous value from the audit record | OPEN |
| **D18** | Settings import, export and environment promotion | D13 | Export a tenant's configuration and apply it to another tenant or environment, with a diff and a dry-run | Configuration is promoted sandbox → production with a reviewable diff and no secret leaving its scope | OPEN |
| **D19** | Retrofit the settings contract across all 45 modules | D14–D18, A03 | Every module's existing settings migrated onto the contract; bespoke settings pages deleted | `grep` finds no module-local settings page. Every setting in the platform is discoverable in one search. This is the phase that makes 45 modules feel like one product | OPEN |
| **D20** | Integration and connector administration | D01, D13 | Tenant-managed connectors, credentials, webhooks, retry and replay, sync status and failure alerting | A failed webhook is visible, diagnosable and replayable by the tenant admin, with credentials never rendered after save | OPEN |
| **D21** | Tenant subscription and billing self-service | C13–C17, D01 | Tenant-side view of plan, usage against limits, invoices, payment methods, billing contacts, and upgrade — reconciling exactly with the provider's view in Track C | A tenant sees the same usage figure the invoice was computed from. A discrepancy is a failing test, not a support ticket | OPEN |
| **D22** | Tenant security administration | D03, C28 | Tenant-controlled MFA policy, session policy, SSO/SAML/OIDC configuration, SCIM provisioning, IP allowlists, API keys, and a security-event log | A tenant enforces SSO-only access and MFA for admins, provisions users via SCIM, and reviews their own security events without contacting us | OPEN |

---

## 5. Track exit criteria

- [ ] A tenant admin can run their organisation end to end without a support ticket for anything
      that concerns only their tenant — enumerated and verified against a task list
- [ ] Every plane-2 route returns 403 to a non-admin tenant user; hidden menu items are not the
      mechanism
- [ ] A tenant's export re-imports into a clean instance and reconciles record-for-record
- [ ] Erasure and audit immutability are reconciled by a written, tested mechanism
- [ ] Every one of the 1,836 models has a retention class, enforced by gate
- [ ] The settings contract is published at L0, and **all 45 modules** conform — no module-local
      settings page survives
- [ ] Any setting's effective value and originating scope are inspectable
- [ ] The tenant's usage figure and the provider's invoice quantity are the same number, asserted
      by test
- [ ] A tenant enforces SSO + MFA and provisions via SCIM unaided

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 22 phases in three stages. D13–D22 placed ahead of Track E because the settings contract must exist before 45 modules declare settings; D08–D12 added to cover the customer-onboarding and data-sovereignty gap (G-4) that the brief did not name. | Claude Code |
