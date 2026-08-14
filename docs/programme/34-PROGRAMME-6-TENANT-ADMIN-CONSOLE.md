# PROGRAMME 6 · TENANT ADMIN CONSOLE — P6-001–P6-320

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 6` resolves waves from this
> document and can only ever hand out a `P6-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** `P6-004` is the
runtime precondition gate: each external capability is asserted at startup and in CI, and the
dependent surface degrades to an explicit "requires \<capability\>" state.

---

## 1. What this programme owns

**Plane 2 — the tenant's own control plane.** The complete SaaS management portal a customer's
administrator uses to run their instance of UniERP: who has access, under what authentication, with
what permissions, on which plan, holding which data, integrated with what, and observably healthy.

**The invariant this programme establishes:**

> **A tenant administrator can answer any question about their own tenant, and change anything they
> are entitled to change, without contacting support — and cannot, by any path, affect another
> tenant or exceed what their plan entitles.**

Two halves, both mechanical. `P6-318` proves the first: a scripted list of the questions and changes
an administrator must be able to handle, each completed self-service or recorded as a documented
exception. `P6-319` proves the second adversarially.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Programme 1 Track D | **22/22 DONE** | `node scripts/phase-brief.mjs --status` |
| Tenant app route pages | 903 (Track D's surfaces are within these) | `find unierp-web -name page.tsx -not -path "*/node_modules/*"` |
| Related API modules | `admin`, `saas`, `saas-portal`, `org-structure`, `people`, `subscriptions` | `ls unierp-api/src/modules` |

Track D is complete, and this programme is explicit that this does **not** mean the tenant admin
console is finished. Track D's own scope was *"tenant SaaS portal and per-app settings"* across 22
phases — a foundation, sized as one track among thirteen. A complete SaaS management portal is
measured against Okta for identity, Atlassian and Slack for workspace administration, and Microsoft
365 and Google Workspace for the breadth an enterprise administrator expects. `P6-002` scores the
existing surface against that bar before any phase claims to extend it, so this programme starts from
a measurement rather than from an assumption in either direction.

**Reference set.** Okta and Microsoft Entra (identity, lifecycle, conditional access), Google
Workspace and Microsoft 365 admin centres (breadth and the delegation model), Atlassian admin
(organisation vs. product boundary, which is exactly this platform's plane-2 vs. plane-3 problem),
Slack Enterprise Grid (multi-workspace), Salesforce setup (the failure mode: a settings surface so
large it becomes unnavigable), Datadog and Stripe dashboards (self-service observability and billing
legibility), and 1Password/Vanta for access review and compliance evidence.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Every setting is findable in one search.** A settings estate this large is unnavigable by hierarchy alone. | Salesforce setup, as a warning | `P6-161` |
| **UX-2** | **Every change previews its blast radius before it applies.** Who gains access, who loses it, what breaks. | Okta; Entra | `P6-105`, `P6-172` |
| **UX-3** | **Nothing is silently irreversible.** Destructive actions state their consequence, require confirmation proportionate to the risk, and are undoable where they can be. | — | `P6-174` |
| **UX-4** | **The administrator sees what the user sees.** Impersonation and preview without acquiring privilege. | Salesforce login-as | `P6-108` |
| **UX-5** | **Access is reviewable, not just grantable.** Who has what, why, since when, and is it still needed. | Vanta; access certification | `P6-207` |
| **UX-6** | **Limits and usage are visible before they bite.** | Stripe; Datadog | `P6-141` |
| **UX-7** | **Every question is self-answerable.** Support contact is a failure of this console, and is measured as one. | — | `P6-318` |

---

## 3. Design-system rule

`unierp-design-system` is the only source of UI primitives. This programme adds the administration
primitives — permission matrix, access review row, policy editor, audit entry, usage meter, settings
search result, impersonation banner — with stories (`P6-013`). The token gate applies unchanged.

---

## 4. Waves

### Wave 0 · "Measure, then build"
**Phases:** P6-001–P6-020 · Independence, the scoring of the existing surface, and the console shell.

### Wave 1 · "Identity and access"
**Phases:** P6-021–P6-110 · Users, directory, authentication, authorization and policy. The largest
wave, because everything else in a tenant is governed by it.

### Wave 2 · "Structure, commerce and configuration"
**Phases:** P6-111–P6-184 · Organisational structure, subscription and licensing, and settings.

### Wave 3 · "Governance and security operations"
**Phases:** P6-185–P6-240 · Data governance, privacy, compliance, and security monitoring.

### Wave 4 · "Integration and lifecycle"
**Phases:** P6-241–P6-282 · API and integration management, environments and tenant lifecycle.

### Wave 5 · "Operability and production"
**Phases:** P6-283–P6-320 · Support, health, the test estate, and the two exit proofs.

---

## 5. Stage A · Foundation and measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P6 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P6-002** | Scoring the existing admin surface | P6-001 | The current tenant admin surface scored against the reference bar, per capability area, published as data | Every capability area has a current score reproducible by command. A phase claimed without a current score is refused | OPEN |
| **P6-003** | The plane-2 / plane-3 boundary | P6-002 | The declared boundary between tenant administration and per-application configuration, with each setting assigned | A setting present in both planes fails a gate. Every setting has exactly one owning plane, verified by inventory | OPEN |
| **P6-004** | Runtime precondition gate | P6-001 | Startup and CI assertion of each external capability with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P6-005** | Tenancy and isolation baseline | P6-001 | `tenantId` and an RLS policy on every table in the same migration | A table without both fails `check-rls-verify.mjs`. Two-tenant tests prove **zero** rows | OPEN |
| **P6-006** | Migration discipline | P6-005 | Forward-only migrations with tested rollback and immutable shipped migrations | Replaying every migration from empty reproduces the schema exactly | OPEN |
| **P6-007** | Authorization and default deny | P6-005 | Explicit permissions on every endpoint, defaulting to deny, unauthorized returning **403** | An endpoint without a permission declaration fails a gate. Unauthorized returns 403, never 404 or 500 | OPEN |
| **P6-008** | Administrative audit log | P6-007 | Append-only audit of every administrative action with actor, target, before/after and correlation | Every mutating endpoint audits. An unaudited one fails a gate. Records are immutable by any application path | OPEN |
| **P6-009** | Structured logging and correlation | P6-001 | Correlation across console action, API call, policy evaluation and downstream effect | One administrative change is traceable end to end by a single correlation ID | OPEN |
| **P6-010** | Error taxonomy for administrators | P6-009 | Typed errors separating administrator mistake, policy refusal, entitlement limit and platform fault | Every error carries a registry code and states the remediation. A stack trace reaching an admin fails a gate | OPEN |
| **P6-011** | Configuration and secret handling | P6-001 | Validated configuration; tenant-held secrets never in source, bundle or logs | A missing required variable fails startup by name. A bundle scan finds zero secrets | OPEN |
| **P6-012** | Idempotency for administrative operations | P6-007 | Idempotency keys on every provisioning, grant, revoke and configuration change | A retried grant applies once, proven under induced failure | OPEN |
| **P6-013** | Administration design-system primitives | P6-001 | Permission matrix, access review row, policy editor, audit entry, usage meter, settings search result and impersonation banner in `unierp-design-system` with stories | Each has a story and zero hardcoded colour or spacing. An admin component defined in a page fails the location gate | OPEN |
| **P6-014** | Console shell and information architecture | P6-013 | The frame: navigation, search, context, notifications and the impersonation indicator | Every console surface renders in the shell. A surface with its own chrome fails the contract test | OPEN |
| **P6-015** | Keyboard model and command palette | P6-014 | A single command registry driving palette, shortcuts and the accessibility tree | Every console action is reachable by keyboard alone, proven by test | OPEN |
| **P6-016** | Console performance budget | P6-014 | Budgets for list, detail and policy-evaluation surfaces on a fixed profile | A regression beyond budget fails CI at reference tenant scale | OPEN |
| **P6-017** | Console accessibility baseline | P6-014 | WCAG 2.2 AA across the shell and core administrative surfaces | The shell and a representative surface are `axe` clean and keyboard-complete | OPEN |
| **P6-018** | Reference tenant fixtures | P6-002 | A realistic fixture tenant: 10,000 users, deep hierarchy, many groups, roles and integrations | Every console test and benchmark runs against the shared fixture tenant | OPEN |
| **P6-019** | Rate limiting and abuse control | P6-007 | Limits on authentication, invitation, bulk operations and API use | A credential-stuffing simulation is throttled and locked out, proven by test | OPEN |
| **P6-020** | Test harness for administration | P6-018 | Policy assertion helpers, impersonation harness, clock control, two-tenant helper and audit assertions | An administration test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |

---

## 6. Stage B · Users, directory and lifecycle (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-021** | User entity and identity model | P6-005 | The tenant user with identity, profile, credentials, state and its relationship to the platform principal | A user exists in exactly one tenant, or is explicitly multi-tenant with distinct sessions, proven by test | OPEN |
| **P6-022** | User lifecycle states | P6-021 | Invited, active, suspended, locked, deactivated and deleted, with permitted transitions | An invalid transition is refused at the database level. A deactivated user cannot authenticate, proven by test | OPEN |
| **P6-023** | User invitation and onboarding | P6-022 | Invitation with expiry, resend, revocation and guided first sign-in | An expired or revoked invitation cannot be redeemed, proven by test | OPEN |
| **P6-024** | Self-registration and domain claiming | P6-023 | Optional self-registration bounded by verified email domains | A user from an unclaimed domain cannot self-register where policy forbids it | OPEN |
| **P6-025** | User profile and attributes | P6-021 | Standard and custom attributes with typing, validation and visibility rules | A custom attribute is queryable and permission-controlled like any other field | OPEN |
| **P6-026** | Deactivation and offboarding | P6-022 | Deactivation revoking sessions, tokens and delegated access immediately | Deactivation invalidates live sessions and outstanding tokens within the stated window, proven by test | OPEN |
| **P6-027** | Ownership transfer on offboarding | P6-026 | Reassigning owned records, approvals, schedules and integrations on departure | Offboarding leaves no orphaned owned object, asserted by report before completion | OPEN |
| **P6-028** | User deletion and data handling | P6-026 | Deletion honouring retention obligations without orphaning business records | Deleting a user referenced by posted documents is refused or anonymised per policy, never silently broken | OPEN |
| **P6-029** | Bulk user operations | P6-012 | Bulk invite, update, deactivate and role-assign with dry run and per-row outcome | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P6-030** | Directory synchronisation model | P6-021 | The authoritative-source model: which attributes the directory owns and which the tenant may edit | An attribute owned by the directory cannot be edited locally, enforced and explained in the UI | OPEN |
| **P6-031** | SCIM provisioning | P6-030 | SCIM 2.0 for users and groups with create, update, deactivate and delete | A SCIM deactivate revokes sessions within the stated window, proven by test | OPEN |
| **P6-032** | Directory connectors | P6-031 | Connectors for common directories with mapping, scheduling and conflict handling | A directory change propagates within the stated window and conflicts surface rather than overwrite | OPEN |
| **P6-033** | Just-in-time provisioning | P6-030 | Creating users on first federated sign-in with attribute and group mapping | A JIT user receives exactly the roles their assertion maps to, proven by test | OPEN |
| **P6-034** | Deprovisioning correctness | P6-031 | Complete deprovisioning across sessions, tokens, delegated grants and integrations | A deprovisioned user has zero remaining access paths, verified by an exhaustive access test | OPEN |
| **P6-035** | Groups and dynamic membership | P6-025 | Static and attribute-based dynamic groups with recomputation | A dynamic group's membership recomputes within the stated window after an attribute change | OPEN |
| **P6-036** | Group nesting and resolution | P6-035 | Nested groups with cycle prevention and deterministic effective membership | A membership cycle is refused. Effective membership is deterministic and explainable | OPEN |
| **P6-037** | External and guest users | P6-021 | Guest access with restricted capability, expiry and sponsor accountability | A guest cannot exceed the guest capability set, and an expired guest loses access automatically | OPEN |
| **P6-038** | Service accounts and machine identity | P6-021 | Non-human identities with ownership, scoped credentials and mandatory expiry | A service account without an owner and an expiry cannot exist, enforced at creation | OPEN |
| **P6-039** | User search and directory browsing | P6-025 | Search across users by any attribute, permission-filtered | User search meets the interaction budget at 10,000 users, measured | OPEN |
| **P6-040** | Organisational directory for end users | P6-039 | The employee-facing directory with privacy controls on visible attributes | A private attribute is absent from the directory payload, not merely hidden | OPEN |
| **P6-041** | User activity and last-seen | P6-008 | Per-user activity, last sign-in, last active and device history | Inactive users are identifiable from data for access review | OPEN |
| **P6-042** | Dormant account detection | P6-041 | Detecting and acting on dormant accounts per policy | A dormant account is flagged and, where policy requires, suspended automatically | OPEN |
| **P6-043** | User import and migration | P6-029 | Bulk onboarding from file and from another system with mapping and validation | An import either applies completely or not at all, with per-row diagnostics | OPEN |
| **P6-044** | User export and reporting | P6-039 | Exporting the user estate with roles, groups and access, permission-filtered | An export contains only what the exporting subject may read, proven by test | OPEN |
| **P6-045** | Personal data in the user record | P6-025 | Classification, encryption and masking of personal attributes | Every personal attribute is encrypted per classification, verified in a database dump | OPEN |
| **P6-046** | User self-service profile management | P6-025 | End users managing their own profile, preferences and security settings | A user can change everything they are permitted and nothing more, proven by test | OPEN |
| **P6-047** | Delegated user administration | P6-036 | Scoped administration: managing users within a group, department or region only | A delegated admin sees and manages **zero** users outside their scope, proven by test | OPEN |
| **P6-048** | User licence assignment | P6-035 | Assigning entitlements to users individually and by group rule | An assignment exceeding available licences is refused with the count shown | OPEN |
| **P6-049** | User lifecycle automation | P6-035 | Rule-driven access on join, move and leave events | A department change applies the new role set and removes the old within the stated window | OPEN |
| **P6-050** | Stage B lifecycle proof | P6-034 | A suite driving join, move and leave across directory, groups, roles and integrations | Every path leaves correct access with no residue, and a deliberately skipped revocation is caught | OPEN |

---

## 7. Stage C · Authentication and access security (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-051** | Session model and lifecycle | P6-021 | Session issuance, rotation, idle and absolute expiry, and binding | Session fixation and replay after logout each fail, proven by tests that fail when their defence is removed | OPEN |
| **P6-052** | Password policy | P6-021 | Configurable strength, breach checking, history and rotation policy | A breached password is refused at set time, verified against a known-breached corpus | OPEN |
| **P6-053** | Credential storage | P6-052 | Modern password hashing with per-credential parameters and upgrade on verify | No credential is recoverable from the database, verified by inspection | OPEN |
| **P6-054** | Multi-factor authentication | P6-051 | TOTP and WebAuthn with enrolment, enforcement and recovery | MFA enforcement cannot be bypassed by any authentication path, proven per path | OPEN |
| **P6-055** | Passkeys and passwordless | P6-054 | WebAuthn passkeys with multi-device and account recovery that does not weaken factors | Recovery never issues a session with fewer factors than required, proven by test | OPEN |
| **P6-056** | MFA policy and enforcement scope | P6-054 | Per-role, per-action and risk-based MFA requirements | A privileged action always requires a second factor, regardless of tenant preference | OPEN |
| **P6-057** | Recovery and account unlock | P6-055 | Recovery flows with identity proofing proportionate to the account's privilege | A recovery path cannot be used to escalate privilege, proven adversarially | OPEN |
| **P6-058** | SAML federation | P6-033 | SAML 2.0 with metadata exchange, signing, encryption and assertion validation | Assertion replay, signature stripping and audience confusion each fail, proven per attack | OPEN |
| **P6-059** | OIDC federation | P6-033 | OpenID Connect with discovery, PKCE, nonce and token validation | Token substitution and audience confusion each fail, proven per attack | OPEN |
| **P6-060** | Multiple identity providers | P6-058 | Several IdPs per tenant with routing by domain, group or user | A user is routed to the correct IdP deterministically, and a misroute is impossible | OPEN |
| **P6-061** | IdP configuration and validation | P6-060 | Guided IdP setup with test sign-in and configuration validation before activation | An IdP cannot be activated without a successful test sign-in, enforced mechanically | OPEN |
| **P6-062** | IdP failure and break-glass access | P6-060 | Emergency access when the IdP is unavailable, tightly scoped and heavily audited | Break-glass access is time-boxed, requires MFA, alerts owners, and every action is audited | OPEN |
| **P6-063** | Conditional access policy | P6-051 | Access decisions by device, network, location, risk and time | A policy denial states which condition failed, and the decision is reproducible from the log | OPEN |
| **P6-064** | Device trust and management | P6-063 | Device registration, compliance signals and trusted-device policy | An untrusted device is denied where policy requires, proven by test | OPEN |
| **P6-065** | IP allowlisting and network policy | P6-063 | Network-based restriction per tenant, role and action | An out-of-policy network is denied at the authentication boundary, proven by request | OPEN |
| **P6-066** | Risk-based authentication | P6-063 | Risk signals — impossible travel, new device, credential stuffing — driving step-up | A seeded high-risk sign-in triggers step-up, and removing the signal makes it pass | OPEN |
| **P6-067** | Session management and revocation | P6-051 | Administrator and user visibility of sessions with individual and bulk revocation | Revoking a session ends it within one request cycle, proven by request | OPEN |
| **P6-068** | Concurrent session policy | P6-067 | Limits on concurrent sessions per user with defined eviction | A policy limit is enforced deterministically, proven under concurrent sign-in | OPEN |
| **P6-069** | Sign-in experience | P6-060 | The authentication journey: routing, federation, MFA, errors and recovery | The full journey is completable by keyboard and screen reader, recorded as a test | OPEN |
| **P6-070** | Authentication branding | P6-069 | Tenant branding on authentication surfaces through tokens only | Branding cannot introduce a hardcoded colour or an accessibility failure, enforced by gate | OPEN |
| **P6-071** | API tokens and personal access tokens | P6-038 | Scoped, expiring tokens stored hashed with last-used tracking and one-time display | A revoked token is unusable within the stated window. Plaintext exists in no store | OPEN |
| **P6-072** | OAuth application authorisation | P6-071 | Tenant-side management of third-party application grants and scopes | Revoking a grant stops access at the next request, not at token expiry | OPEN |
| **P6-073** | Consent and scope governance | P6-072 | Tenant policy over which scopes applications may request | An application requesting a forbidden scope cannot be authorised, proven by test | OPEN |
| **P6-074** | Authentication audit and reporting | P6-008 | Complete sign-in, failure, MFA and policy-decision records with search | Every authentication decision is reconstructible from the audit alone | OPEN |
| **P6-075** | Brute force and credential stuffing defence | P6-019 | Progressive delay, lockout, and detection tuned against a real attack corpus | A credential-stuffing simulation is defeated, and disabling the defence makes it succeed | OPEN |
| **P6-076** | Account takeover detection | P6-066 | Detecting and responding to takeover indicators with automatic containment | A seeded takeover pattern triggers containment within the stated window | OPEN |
| **P6-077** | Privileged access management | P6-056 | Elevated roles requiring just-in-time activation, justification and expiry | Standing privileged access does not exist; every elevation is time-boxed and audited | OPEN |
| **P6-078** | Emergency access accounts | P6-062 | Break-glass accounts with strict controls, monitoring and mandatory review | Every break-glass use is alerted and reviewed, verified by rehearsal | OPEN |
| **P6-079** | Authentication for machine-to-machine | P6-038 | Client credentials, mutual TLS and signed-request authentication for integrations | A machine credential cannot be used interactively, proven by test | OPEN |
| **P6-080** | Cross-tenant authentication isolation | P6-005 | Strict separation of authentication state between tenants | A session for one tenant is unusable against another, proven by request | OPEN |
| **P6-081** | Authentication performance and availability | P6-016 | Authentication within latency budget and available under degradation | Authentication meets budget at peak concurrency and degrades safely, measured | OPEN |
| **P6-082** | Stage C adversarial proof | P6-075 | An adversarial suite covering session, federation, MFA bypass, takeover and cross-tenant attacks | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 8. Stage D · Authorization, roles and policy (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-083** | Permission model | P6-007 | The permission catalogue: every capability in the product, named, described and grouped | A capability without a catalogue entry is unreachable, not universally allowed | OPEN |
| **P6-084** | Role model | P6-083 | Roles as composable capability sets with inheritance and scope | A role's effective capabilities are computable and explainable | OPEN |
| **P6-085** | Standard roles | P6-084 | The shipped role set covering common administrative and user needs | Every standard role is proven unable to perform capabilities outside its set | OPEN |
| **P6-086** | Custom role authoring | P6-084 | Tenant-defined roles with a capability picker and validation | A custom role cannot grant a capability the granting admin does not hold, enforced mechanically | OPEN |
| **P6-087** | Role assignment | P6-084 | Assigning roles to users, groups and dynamically, with scope | Effective permissions equal the union of assignments, verified differentially against enforcement | OPEN |
| **P6-088** | Scoped and delegated administration | P6-047 | Administration scoped by organisational unit, region or group | A scoped admin cannot affect anything outside their scope, proven by an exhaustive test | OPEN |
| **P6-089** | Permission evaluation engine | P6-087 | One evaluation function used by every enforcement point in the tenant plane | Two enforcement paths returning different answers is impossible — a differential test proves agreement | OPEN |
| **P6-090** | Database-level enforcement | P6-089 | RLS policies generated from the permission model for every tenant-scoped table | Direct SQL as the application role returns exactly what the API returns for the same subject | OPEN |
| **P6-091** | Data-scope and record-level access | P6-090 | Ownership, hierarchy, team and criteria-based record access | A record outside a subject's data scope is absent from results, not filtered client-side | OPEN |
| **P6-092** | Field-level security | P6-091 | Per-field read and edit control applied at the query layer | A hidden field is absent from the API payload entirely, proven by inspection | OPEN |
| **P6-093** | Cross-module permission consistency | P6-089 | One permission model across all 45 modules with no module-local scheme | A module-local permission mechanism fails an architecture gate | OPEN |
| **P6-094** | Segregation of duties | P6-084 | Conflicting-capability detection with tenant-configurable conflict sets | A role or assignment creating a conflict is refused or flagged per policy, proven by test | OPEN |
| **P6-095** | Permission explanation | P6-087 | For any subject and capability, which grant supplies it and by what path | The explanation matches actual enforcement, verified differentially on generated cases | OPEN |
| **P6-096** | Effective-access reporting | P6-095 | "Who can do what" and "what can this user do" reports across the tenant | Both reports match actual enforcement exactly, verified differentially | OPEN |
| **P6-097** | Permission simulation | P6-095 | Testing a proposed role or assignment before applying it | Simulation output equals the applied outcome exactly, verified differentially | OPEN |
| **P6-098** | Policy as configuration | P6-084 | Roles and policies expressible as versioned configuration, exportable and importable | A policy exports and reimports producing identical effective access, verified by comparison | OPEN |
| **P6-099** | Policy versioning and rollback | P6-098 | Versioned policy with diff and rollback | Rolling back a policy restores the exact prior effective access, verified by comparison | OPEN |
| **P6-100** | Approval workflows for access | P6-087 | Requesting access, approval routing, time-bounded grants and automatic expiry | A time-bounded grant expires automatically, proven against a controllable clock | OPEN |
| **P6-101** | Access request self-service | P6-100 | Users requesting access with justification and status visibility | Every request reaches a decision within the configured SLA, and breaches escalate | OPEN |
| **P6-102** | Temporary and emergency elevation | P6-077 | Time-boxed elevation with justification, approval and automatic revocation | Elevation expires automatically and cannot be extended without a new approval | OPEN |
| **P6-103** | Permission inheritance and precedence | P6-087 | Deterministic resolution when grants conflict, with deny precedence stated | Conflict resolution is deterministic and explainable, verified across generated cases | OPEN |
| **P6-104** | Guardrail policies | P6-086 | Tenant-level invariants no role may violate, such as mandatory MFA and forbidden scopes | A guardrail cannot be overridden by any role or assignment, proven adversarially | OPEN |
| **P6-105** | Change impact preview | P6-097 | The UX-2 mechanism: before any permission change, exactly who gains and loses what | The preview matches the applied outcome exactly, verified differentially | OPEN |
| **P6-106** | Bulk permission operations | P6-087 | Bulk role assignment and revocation with dry run and per-subject outcome | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P6-107** | Permission performance | P6-089 | Permission evaluation within latency budget at tenant scale | Evaluation meets budget at 10,000 users with deep group nesting, measured | OPEN |
| **P6-108** | Impersonation and view-as | P6-095 | The UX-4 mechanism: viewing the product as another user without acquiring their privilege | View-as shows exactly what that subject sees, verified differentially, and grants the viewer nothing | OPEN |
| **P6-109** | Impersonation governance | P6-108 | Consent, time-boxing, banner visibility and dual-attribution audit for impersonation | Every impersonated action attributes to both principals. Impersonation without consent is impossible where policy requires it | OPEN |
| **P6-110** | Stage D authorization proof | P6-090 | A differential suite comparing declared, explained, simulated and enforced access across generated policies | All four agree on every generated case, and a deliberately widened RLS policy is caught immediately | OPEN |

---

## 9. Stage E · Organisational structure (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-111** | Organisation model | P6-005 | The tenant's own structure: legal entities, business units, departments, sites and teams | Structure is expressible without duplicating records, verified against enterprise fixtures | OPEN |
| **P6-112** | Hierarchy and reporting lines | P6-111 | Manager relationships, matrix reporting and cycle prevention | A reporting cycle is refused. Effective hierarchy is deterministic | OPEN |
| **P6-113** | Effective-dated structure | P6-112 | Structural changes effective-dated with as-of querying | An as-of query returns the structure at that date exactly, proven across a multi-year fixture | OPEN |
| **P6-114** | Reorganisation tooling | P6-113 | Planning, previewing and applying a reorganisation with downstream effects | A reorganisation preview equals its applied outcome exactly, verified differentially | OPEN |
| **P6-115** | Multi-entity administration | P6-111 | Administering several legal entities under one tenant with scoped access | An entity-scoped administrator sees **zero** rows from another entity, proven by test | OPEN |
| **P6-116** | Workspaces and product boundaries | P6-003 | The boundary between tenant-wide and workspace-scoped administration | A workspace admin cannot change tenant-wide policy, proven by test | OPEN |
| **P6-117** | Cost centre and budget linkage | P6-111 | Linking structure to cost centres and budgets for chargeback | Structural cost attribution reconciles to the cost model exactly | OPEN |
| **P6-118** | Location and site management | P6-111 | Sites with addresses, timezones, calendars and regional settings | A site's calendar and timezone drive scheduling correctly, verified across DST boundaries | OPEN |
| **P6-119** | Calendars and working time | P6-118 | Business calendars, holidays and working hours per entity and site | A business-day calculation honours the correct calendar including holidays, across a year of fixtures | OPEN |
| **P6-120** | Structure-driven access | P6-091 | Access derived from organisational position and updated on change | A transfer updates access within the stated window, proven by test | OPEN |
| **P6-121** | Structure import and synchronisation | P6-032 | Importing and synchronising structure from an authoritative HR source | A structure change in the source propagates within the stated window, conflicts surfaced | OPEN |
| **P6-122** | Structure visualisation | P6-112 | Navigable organisational charts with search and drill-down | The chart is navigable by keyboard and comprehensible by screen reader, recorded as a test | OPEN |
| **P6-123** | Delegation of authority | P6-100 | Authority limits by position with delegation and out-of-office | A delegated authority cannot exceed the delegator's limit, enforced mechanically | OPEN |
| **P6-124** | Approval hierarchies | P6-123 | Approval routing derived from structure with escalation | An approval routes to the correct approver from structure, and a vacancy escalates rather than stalling | OPEN |
| **P6-125** | Team and project groupings | P6-035 | Cross-functional teams independent of the formal hierarchy | Team membership grants access independently of hierarchy, proven by test | OPEN |
| **P6-126** | Structure change audit | P6-008 | Complete audit of structural change with actor, effective date and reason | Any current structure is explainable from its change history alone | OPEN |
| **P6-127** | Structure API | P6-111 | Programmatic access to structure with the same validation and audit | Every structural capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P6-128** | Structure performance | P6-016 | Hierarchy queries and access derivation within budget at depth and breadth | Hierarchy resolution meets budget at 10,000 users and 20 levels, measured | OPEN |
| **P6-129** | Structure accessibility | P6-017 | WCAG 2.2 AA across structure surfaces including charts and pickers | Every structure surface is `axe` clean and keyboard-complete | OPEN |
| **P6-130** | Stage E proof | P6-114 | A suite asserting hierarchy correctness, effective dating, access derivation and isolation | Every invariant holds, and a deliberately broken effective-date query is caught | OPEN |

---

## 10. Stage F · Subscription, licensing and cost (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-131** | Tenant subscription view | P6-005 | The tenant's own view of plan, term, renewal, quantities and state | Displayed subscription state matches the authoritative billing record exactly, asserted by reconciliation | OPEN |
| **P6-132** | Entitlement visibility | P6-131 | What the tenant is entitled to run, at what quantity, from what source | Every entitlement's source is attributable to an order or grant, shown to the administrator | OPEN |
| **P6-133** | Licence assignment and reclamation | P6-048 | Assigning licences to users and groups, with reclamation from inactive users | Assigned licences never exceed entitled quantity, enforced at assignment | OPEN |
| **P6-134** | Licence optimisation | P6-042 | Identifying unused, duplicated and over-provisioned licences | Reclaimable licences are identifiable from real usage data, not estimated | OPEN |
| **P6-135** | Plan comparison and change | P6-131 | Comparing plans and initiating upgrade, downgrade and quantity change | A plan change previews its exact cost and entitlement effect before commitment | OPEN |
| **P6-136** | Self-service subscription changes | P6-135 | Changes a tenant may make without contacting support, with proration shown | Every permitted change is completable self-service, verified per change type | OPEN |
| **P6-137** | Approval for commercial changes | P6-124 | Internal approval before a purchase or plan change commits | A change above an authority limit cannot complete without approval, proven by test | OPEN |
| **P6-138** | Invoices and billing history | P6-131 | Tenant-visible invoices, credits and payment history with download | Every invoice is retrievable and its total matches the charged amount exactly | OPEN |
| **P6-139** | Payment methods and billing contacts | P6-011 | Managing payment methods and billing contacts with change protection | A payment-method change requires MFA and notifies billing contacts, proven by test | OPEN |
| **P6-140** | Tax and billing details | P6-138 | Tax identifiers, billing address and their validation | A validated tax identifier produces the correct treatment on subsequent invoices | OPEN |
| **P6-141** | Usage and limit visibility | P6-132 | The UX-6 mechanism: consumption against every metered dimension and limit, with trend | An administrator sees consumption against limit before a limit bites, with time to act | OPEN |
| **P6-142** | Quota alerts and thresholds | P6-141 | Configurable alerts at thresholds with escalation | A threshold alert reaches the right owner before the hard limit, proven by test | OPEN |
| **P6-143** | Overage handling | P6-141 | Declared behaviour at soft and hard limits with clear messaging | Crossing a soft limit warns and continues; a hard limit stops with the limit named. Neither is silent | OPEN |
| **P6-144** | Cost allocation and chargeback | P6-117 | Attributing platform cost to internal cost centres and departments | Allocated cost sums to the invoiced total exactly, asserted by reconciliation | OPEN |
| **P6-145** | Usage analytics for administrators | P6-141 | Usage by user, module, department and time with drill-down | Every usage figure derives from measured events, not from estimates | OPEN |
| **P6-146** | Adoption and value reporting | P6-145 | Feature adoption, active usage and value realisation reporting | Adoption figures reconcile to activity records exactly | OPEN |
| **P6-147** | Renewal management | P6-131 | Renewal visibility, notification and self-service action | A renewal is never a surprise: notification precedes it by the stated window, enforced | OPEN |
| **P6-148** | Cancellation and downgrade | P6-135 | Cancellation with effective date, data outcome disclosure and reactivation | The data outcome disclosed at cancellation is exactly what occurs, verified differentially | OPEN |
| **P6-149** | Trial management | P6-131 | Trial state, remaining time, limits and conversion | A trial's conversion terms are visible throughout, and expiry behaves exactly as disclosed | OPEN |
| **P6-150** | Contract and agreement visibility | P6-131 | The tenant's accepted agreements, versions and effective terms | Every accepted agreement version is retrievable and reproducible from the record | OPEN |
| **P6-151** | Purchase of extensions and applications | P6-132 | Acquiring marketplace products from within the console with governance | An acquisition is subject to the tenant's own approval and scope policy, proven by test | OPEN |
| **P6-152** | Application governance policy | P6-151 | Tenant policy over what may be installed, by whom, and which scopes are permitted | A product requesting a forbidden scope cannot be installed, proven by test | OPEN |
| **P6-153** | Installed application inventory | P6-152 | What third-party software runs in the tenant, with scopes, data access and cost | The question "what runs here and what can it see" is answerable completely from one surface | OPEN |
| **P6-154** | Application cost visibility | P6-153 | Per-application cost and its allocation | Application cost sums to the invoiced total for applications exactly | OPEN |
| **P6-155** | Billing accessibility | P6-017 | WCAG 2.2 AA across billing, usage and licensing surfaces | Every commercial surface is `axe` clean and keyboard-complete; documents are readable by assistive technology | OPEN |
| **P6-156** | Commercial notification | P6-142 | Notification of renewal, price change, limit, payment failure and expiry | No commercial event occurs without prior notification where notice is owed, enforced mechanically | OPEN |
| **P6-157** | Commercial audit | P6-008 | Audit of every commercial action taken in the console | Every commercial change is attributable to an actor, a time and an authorisation | OPEN |
| **P6-158** | Stage F reconciliation proof | P6-141 | A suite asserting displayed subscription, entitlement, licence assignment and usage all reconcile to their authoritative sources | All four reconcile exactly, and a seeded divergence in each is detected | OPEN |

---

## 11. Stage G · Configuration and settings (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-159** | Settings model | P6-003 | Every setting as typed, validated, scoped metadata with an owning plane and a default | A setting without a type, scope, owner and default cannot exist, enforced by gate | OPEN |
| **P6-160** | Settings inventory | P6-159 | A complete, generated inventory of every setting across the product | The inventory is generated from the settings registry and cannot drift, verified by comparison | OPEN |
| **P6-161** | Settings search | P6-160 | The UX-1 mechanism: one search across every setting by name, description, value and effect | Every setting is reachable in one search within the interaction budget, verified across the inventory | OPEN |
| **P6-162** | Settings scoping and inheritance | P6-159 | Tenant, entity, workspace, group and user scopes with deterministic resolution | Effective value resolution is deterministic and explainable, showing which scope supplied it | OPEN |
| **P6-163** | Settings validation | P6-159 | Type, range, dependency and cross-setting validation on every write path | An invalid combination is refused from UI, API and import alike, proven per path | OPEN |
| **P6-164** | Settings permissions | P6-083 | Per-setting permissions, so sensitive settings require elevated capability | A setting is unchangeable without its declared capability, proven per setting class | OPEN |
| **P6-165** | Settings audit and history | P6-008 | Every change recorded with actor, before, after, scope and reason | Any current effective value is explainable from history alone | OPEN |
| **P6-166** | Settings versioning and rollback | P6-165 | Versioned configuration with diff and rollback across scopes | Rolling back reproduces the prior effective configuration exactly, verified by comparison | OPEN |
| **P6-167** | Configuration as code | P6-166 | Exporting and importing tenant configuration as versioned files | Export → import → export produces an identical artefact, verified by comparison | OPEN |
| **P6-168** | Configuration promotion between environments | P6-167 | Promoting configuration from sandbox to production with diff and dry run | A promotion's preview equals its outcome exactly, verified differentially | OPEN |
| **P6-169** | Configuration templates and baselines | P6-167 | Baseline configurations applied at provisioning and enforced as guardrails | A tenant drifting from a mandatory baseline is detected and reported | OPEN |
| **P6-170** | Feature flags and controlled rollout | P6-162 | Tenant-visible feature state with opt-in, opt-out and staged rollout | A tenant can see which features are enabled and why, and control those it may | OPEN |
| **P6-171** | Localisation and regional settings | P6-118 | Language, locale, timezone, currency, formats and calendar per scope | A user's effective locale resolves deterministically across every surface | OPEN |
| **P6-172** | Configuration impact analysis | P6-160 | The UX-2 mechanism for settings: what a change affects before it applies | The preview matches the applied outcome exactly, verified differentially per setting class | OPEN |
| **P6-173** | Configuration dependency graph | P6-163 | Which settings depend on which, and what breaks if one changes | A change breaking a dependent setting is refused or warned with the dependency named | OPEN |
| **P6-174** | Destructive change protection | P6-172 | The UX-3 mechanism: proportionate confirmation, undo where possible, and irreversibility stated plainly | An irreversible action states so before proceeding. A reversible one is reversible in one action | OPEN |
| **P6-175** | Bulk configuration operations | P6-167 | Applying configuration across many scopes with dry run and per-scope outcome | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P6-176** | Branding and white-labelling | P6-070 | Tenant branding through design tokens only, with contrast validation | Branding cannot produce a contrast failure or a hardcoded colour, enforced by gate | OPEN |
| **P6-177** | Email and notification templates | P6-171 | Tenant-customisable templates, versioned and localised | Every template exists in every enabled locale; a missing one blocks activation | OPEN |
| **P6-178** | Notification policy and preferences | P6-177 | Tenant-level notification policy with user-level preference within it | A mandatory notification cannot be disabled by a user, proven by test | OPEN |
| **P6-179** | Document and numbering configuration | P6-159 | Tenant configuration of document series, formats and statutory numbering | A numbering configuration change never breaks gaplessness, enforced mechanically | OPEN |
| **P6-180** | Business calendar configuration | P6-119 | Working time, holidays and fiscal calendars configured per entity | A configured calendar drives every business-day calculation, verified across modules | OPEN |
| **P6-181** | Settings performance | P6-162 | Settings resolution cached with correct invalidation, within budget | Resolution meets budget under production load, and a stale value after a write is proven impossible | OPEN |
| **P6-182** | Settings API | P6-159 | Programmatic read and write with the same validation, permissions and audit | Every settings capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P6-183** | Settings accessibility | P6-017 | WCAG 2.2 AA across settings surfaces including complex editors | Every settings surface is `axe` clean and keyboard-complete | OPEN |
| **P6-184** | Stage G proof | P6-172 | A suite asserting settings resolution, validation, permission, audit and impact-preview correctness across the inventory | Every setting behaves per its declaration, and a setting missing from the registry is caught | OPEN |

---

## 12. Stage H · Data governance, privacy and compliance (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-185** | Data inventory and classification | P6-045 | A generated inventory of every data category the tenant holds, with classification | The inventory is generated from the schema and PII registry, and cannot drift | OPEN |
| **P6-186** | Personal data registry | P6-185 | Every personal-data field registered with purpose, basis and retention | An unregistered personal-data field fails `check-pii-registry.mjs` | OPEN |
| **P6-187** | Data map and flow documentation | P6-186 | Where personal data originates, travels, rests and leaves | Every data flow is generated from real integration and export configuration | OPEN |
| **P6-188** | Retention policy configuration | P6-186 | Tenant-configurable retention per data category within statutory bounds | A retention period below a statutory minimum is refused with the requirement named | OPEN |
| **P6-189** | Retention execution and purge | P6-188 | Scheduled deletion honouring policy, with verification | Data past retention is deleted on schedule, verified by query after execution | OPEN |
| **P6-190** | Legal hold | P6-189 | Placing and releasing holds that suspend deletion, with audit | A held record survives its retention expiry, and release resumes the schedule, proven by test | OPEN |
| **P6-191** | Subject access requests | P6-186 | Locating and exporting all data about an individual across every module | An access request returns complete data across all 45 modules, verified against a seeded subject | OPEN |
| **P6-192** | Erasure and rectification requests | P6-191 | Deleting or correcting personal data while preserving statutory records | An erasure removes personal data and preserves legally required records, verified by inspection | OPEN |
| **P6-193** | Consent management | P6-186 | Recording, evidencing and honouring consent per purpose | Withdrawal stops all processing for that purpose within the stated window, proven by test | OPEN |
| **P6-194** | Data portability | P6-191 | Structured export of a subject's or tenant's data in an open format | An export reimports into a fresh tenant and reproduces the data exactly | OPEN |
| **P6-195** | Processing records | P6-187 | Records of processing activities generated from real configuration | The record is generated, not written by hand, and cannot drift from actual processing | OPEN |
| **P6-196** | Sub-processor disclosure | P6-187 | The chain of sub-processors, disclosed and change-notified | An undisclosed sub-processor cannot receive data, enforced by egress control | OPEN |
| **P6-197** | Cross-border transfer controls | P6-187 | Residency and transfer restrictions enforced at the storage and network layer | Data for a residency-restricted tenant is provably absent from other regions, verified by query | OPEN |
| **P6-198** | Encryption and key management | P6-045 | Encryption at rest and in transit with tenant-visible key policy and rotation | Rotation completes without data loss or downtime, verified by rehearsal | OPEN |
| **P6-199** | Customer-managed keys | P6-198 | Tenant-supplied keys with revocation rendering data inaccessible | Key revocation makes tenant data unreadable within the stated window, proven by rehearsal | OPEN |
| **P6-200** | Data masking and anonymisation | P6-185 | Masking in non-production and anonymisation for analytics | A non-production environment contains no readable personal data, verified by inspection | OPEN |
| **P6-201** | Breach detection and notification | P6-186 | Detecting potential breaches and supporting statutory notification timelines | A rehearsed breach produces the required notification within the statutory window | OPEN |
| **P6-202** | Compliance framework mapping | P6-195 | Mapping controls to the frameworks the tenant must satisfy | Every claimed control maps to a mechanism and a test, not to a document | OPEN |
| **P6-203** | Compliance evidence generation | P6-202 | Evidence produced by mechanism rather than assembled by hand | Every control produces evidence automatically; a hand-written claim fails the check | OPEN |
| **P6-204** | Audit support and external auditor access | P6-203 | Scoped, time-boxed, audited auditor access with evidence extraction | An audit request is satisfiable from generated evidence, verified by rehearsal | OPEN |
| **P6-205** | Policy documents and attestation | P6-202 | Tenant policies published to users with attestation tracking | Attestation coverage is measurable and non-attesting users are identifiable | OPEN |
| **P6-206** | Training and awareness tracking | P6-205 | Required training with completion and expiry tracking | An expired mandatory training is detected and, where policy requires, restricts access | OPEN |
| **P6-207** | Access certification and review | P6-096 | The UX-5 mechanism: periodic review campaigns where reviewers confirm or revoke access | A campaign completes with every access either confirmed or revoked — none silently retained | OPEN |
| **P6-208** | Privileged access review | P6-077 | Focused review of elevated and standing access with shorter cycles | Every privileged grant is reviewed within its cycle, and an unreviewed one expires | OPEN |
| **P6-209** | Segregation-of-duties reporting | P6-094 | Reporting existing duty conflicts across the tenant's actual assignments | Every conflict against the configured set is reported, and a seeded conflict is always found | OPEN |
| **P6-210** | Data quality and integrity monitoring | P6-185 | Monitoring for orphaned, inconsistent and anomalous data | A seeded integrity violation is detected within the stated window | OPEN |
| **P6-211** | Records management | P6-188 | Statutory record classification, retention and disposition | Statutory records are retained for the full required period, verified by test | OPEN |
| **P6-212** | Governance dashboards | P6-203 | The tenant's compliance posture: controls, evidence, gaps and reviews | Every figure derives from generated evidence, not from self-assessment | OPEN |
| **P6-213** | Governance accessibility | P6-017 | WCAG 2.2 AA across governance, review and evidence surfaces | Every governance surface is `axe` clean and keyboard-complete | OPEN |
| **P6-214** | Stage H governance proof | P6-191 | A suite asserting subject access completeness, erasure correctness, retention execution and residency enforcement | All four hold against seeded subjects, and each fails when its mechanism is deliberately removed | OPEN |

---

## 13. Stage I · Security operations and monitoring (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-215** | Security posture dashboard | P6-104 | The tenant's security configuration, gaps and recommendations in one view | Every recommendation derives from measured configuration, not from a static checklist | OPEN |
| **P6-216** | Security baseline and scoring | P6-215 | A measured security score against a published baseline with remediation paths | The score is reproducible from configuration alone, and each deduction names its fix | OPEN |
| **P6-217** | Audit log search and analysis | P6-008 | Fast search across the full audit estate with filtering and saved queries | Any administrative action is findable within the interaction budget at audit-estate scale | OPEN |
| **P6-218** | Audit log export and streaming | P6-217 | Streaming audit events to the tenant's own SIEM with delivery guarantees | A SIEM offline for an hour receives every event on return, in order | OPEN |
| **P6-219** | Audit log integrity | P6-008 | Tamper-evident audit with verification | A modified audit record is detectable by verification, proven by a seeded modification | OPEN |
| **P6-220** | Security alerting | P6-217 | Configurable alerts on security-relevant events with escalation | A seeded security event alerts the right owner within the stated window | OPEN |
| **P6-221** | Anomaly and threat detection | P6-076 | Detecting unusual access, mass export, privilege change and off-hours activity | Each seeded anomaly pattern is detected, and removing its rule makes it pass unnoticed | OPEN |
| **P6-222** | Insider risk indicators | P6-221 | Signals for data exfiltration and unusual administrative behaviour | A seeded exfiltration pattern is detected before completion, verified by rehearsal | OPEN |
| **P6-223** | Data exfiltration controls | P6-222 | Limits and controls on bulk export, download and API extraction | A bulk extraction beyond policy is blocked or requires approval, proven by test | OPEN |
| **P6-224** | Security incident response | P6-220 | Tenant-side incident workflow: detect, contain, investigate, resolve, review | A rehearsed incident is contained within the stated window, verified by rehearsal | OPEN |
| **P6-225** | Containment actions | P6-224 | One-action suspension of a user, session, token, integration or application | A containment action takes effect within one request cycle, proven by request | OPEN |
| **P6-226** | Forensic investigation support | P6-217 | Reconstructing what a principal did, saw and changed over a period | A principal's complete activity is reconstructible from audit alone, verified against a seeded scenario | OPEN |
| **P6-227** | Platform incident visibility | P6-220 | Tenant-facing status, incident and maintenance communication | A platform incident affecting a tenant is communicated within the stated window | OPEN |
| **P6-228** | Vulnerability and advisory notification | P6-227 | Security advisories affecting the tenant's configuration or installed applications | An advisory reaches every affected tenant's security contacts, proven by test | OPEN |
| **P6-229** | Security configuration drift detection | P6-169 | Detecting drift from the tenant's declared security baseline | A seeded drift is detected within the stated window and reported | OPEN |
| **P6-230** | Third-party access monitoring | P6-153 | Monitoring what installed applications and integrations actually access | An application accessing beyond its declared scope raises an incident automatically | OPEN |
| **P6-231** | Support access monitoring | P6-109 | Full visibility of every platform support access to the tenant | Support access without consent is impossible and every access is visible to the tenant | OPEN |
| **P6-232** | Session and access anomaly review | P6-074 | Reviewing unusual sign-ins, locations and devices | Every anomalous sign-in is reviewable with enough context to judge it | OPEN |
| **P6-233** | Security reporting | P6-216 | Periodic security reports generated from real posture and events | Reports are generated from measured data and cannot be hand-edited | OPEN |
| **P6-234** | Backup visibility and verification | P6-006 | Tenant visibility of backup status, coverage and last verified restore | A backup that has never been verified by restore is reported as unverified, not as protected | OPEN |
| **P6-235** | Tenant-initiated restore | P6-234 | Self-service restore of data to a point in time within policy | A restore rehearsal recovers to the chosen point with consistency, verified by comparison | OPEN |
| **P6-236** | Business continuity configuration | P6-235 | Tenant-configurable recovery objectives within platform capability | A configured objective beyond platform capability is refused with the actual capability stated | OPEN |
| **P6-237** | Security policy enforcement reporting | P6-104 | Evidence that each guardrail is enforced, not merely configured | Every guardrail has a test proving enforcement, and the report cites it | OPEN |
| **P6-238** | Security operations performance | P6-217 | Audit search and alert evaluation within budget at estate scale | Audit search meets budget over a year of audit data, measured | OPEN |
| **P6-239** | Security operations accessibility | P6-017 | WCAG 2.2 AA across security surfaces including timelines and charts | Every security surface is `axe` clean and keyboard-complete | OPEN |
| **P6-240** | Stage I detection proof | P6-221 | An adversarial suite seeding anomaly, exfiltration, privilege-escalation and drift scenarios | Every scenario is detected and containable, and each passes unnoticed when its detection is removed | OPEN |

---

## 14. Stage J · Integration and API management (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-241** | Integration inventory | P6-153 | Every integration into and out of the tenant, with owner, scope and data flow | The question "what leaves this tenant and where does it go" is answerable completely from one surface | OPEN |
| **P6-242** | Connection and credential management | P6-071 | Tenant-held integration credentials, encrypted, rotatable and never readable | A stored credential is not retrievable in plaintext by any path, including by a tenant owner | OPEN |
| **P6-243** | Integration authorisation and scope | P6-073 | Scoping each integration to the minimum data and capability it needs | An integration cannot exceed its declared scope, proven by test | OPEN |
| **P6-244** | Egress governance | P6-197 | Declared external destinations per integration, enforced at the network boundary | A call to an undeclared destination is blocked at the network layer and audited | OPEN |
| **P6-245** | API key and token administration | P6-071 | Issuing, scoping, rotating and revoking API credentials with usage visibility | A revoked credential is unusable within the stated window, proven by request | OPEN |
| **P6-246** | API usage monitoring and quotas | P6-141 | Per-credential and per-integration usage against quota, with alerts | Usage is attributable to a credential and an integration from telemetry alone | OPEN |
| **P6-247** | Rate limit configuration | P6-246 | Tenant-configurable limits per integration within platform ceilings | A configured limit above the platform ceiling is refused with the ceiling stated | OPEN |
| **P6-248** | Webhook management | P6-241 | Outbound webhook configuration, signing, retry and delivery visibility | A failed delivery is visible and replayable; a subscriber offline for an hour loses nothing | OPEN |
| **P6-249** | Inbound integration endpoints | P6-243 | Managed inbound endpoints with authentication, validation and rate limiting | An unauthenticated or malformed inbound request is rejected and audited | OPEN |
| **P6-250** | Integration health monitoring | P6-241 | Per-integration health, error rate, latency and credential expiry | A failing integration is detected and reported before a user notices, verified by rehearsal | OPEN |
| **P6-251** | Integration failure handling | P6-250 | Dead-letter visibility, replay and failure notification | A dead-lettered message is visible, diagnosable and replayable without support | OPEN |
| **P6-252** | Data synchronisation monitoring | P6-250 | Sync state, watermarks, lag and divergence detection | A stalled synchronisation is detected within the stated window and reported | OPEN |
| **P6-253** | Integration audit | P6-008 | Complete audit of integration configuration and data movement | Every integration change and bulk data movement is attributable | OPEN |
| **P6-254** | Third-party application permissions | P6-152 | Reviewing and revoking what installed applications may access | Revoking an application's access stops it at the next request, proven by request | OPEN |
| **P6-255** | Integration approval workflow | P6-137 | Internal approval before a new integration or scope is enabled | An integration requiring approval cannot be enabled unapproved, proven by test | OPEN |
| **P6-256** | Developer and API documentation access | P6-245 | Tenant-scoped API documentation generated from contracts | Documentation is generated from contracts and cannot drift | OPEN |
| **P6-257** | Sandbox credentials and testing | P6-245 | Non-production credentials that cannot reach production data | A sandbox credential used against production is refused, proven by request | OPEN |
| **P6-258** | Integration templates and catalogue | P6-241 | Pre-built integration configurations for common systems | A catalogue integration configures and connects without custom development | OPEN |
| **P6-259** | Data export governance | P6-223 | Governing bulk export through APIs and integrations | A bulk export beyond policy requires approval, proven by test | OPEN |
| **P6-260** | Integration performance | P6-246 | Integration throughput and latency within budget at tenant scale | Integration endpoints meet budget at target concurrency, measured | OPEN |
| **P6-261** | Integration accessibility | P6-017 | WCAG 2.2 AA across integration configuration and monitoring surfaces | Every integration surface is `axe` clean and keyboard-complete | OPEN |
| **P6-262** | Stage J proof | P6-244 | A suite asserting scope enforcement, egress control, credential protection and delivery guarantees | Every guarantee holds, and an undeclared egress destination is always blocked | OPEN |

---

## 15. Stage K · Environments and tenant lifecycle (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-263** | Environment model | P6-005 | Production, staging, development and sandbox environments per tenant | Data written in one environment is unreachable from another, proven by query | OPEN |
| **P6-264** | Sandbox provisioning | P6-263 | Creating sandboxes with configurable data seeding and refresh | A sandbox provisions within the stated budget with the requested data profile | OPEN |
| **P6-265** | Sandbox data masking | P6-200 | Production-derived sandboxes with personal data masked or synthesised | A production-derived sandbox contains no readable personal data, verified by inspection | OPEN |
| **P6-266** | Environment refresh | P6-265 | Refreshing a sandbox from production with masking and configuration preservation | A refresh preserves sandbox-specific configuration and masks all personal data | OPEN |
| **P6-267** | Configuration promotion | P6-168 | Moving configuration between environments with diff, dry run and approval | A promotion's preview equals its outcome exactly, verified differentially | OPEN |
| **P6-268** | Environment access control | P6-088 | Per-environment permissions distinct from production | Production access is a separate grant from sandbox access, proven by test | OPEN |
| **P6-269** | Environment lifecycle and expiry | P6-264 | Sandbox expiry, extension and automatic cleanup | An expired sandbox is cleaned up automatically and its resources released, verified | OPEN |
| **P6-270** | Tenant provisioning | P6-263 | Creating a new tenant with baseline configuration and first administrator | A new tenant reaches a usable state within the provisioning budget, measured | OPEN |
| **P6-271** | Tenant onboarding journey | P6-270 | Guided setup from provisioning to first productive use, resumable | A new tenant administrator reaches a configured, usable tenant unaided, measured | OPEN |
| **P6-272** | Data migration into the tenant | P6-043 | Migrating master data and opening balances from a legacy system, rehearsable | A rehearsed migration reconciles to source exactly and rolls back completely on failure | OPEN |
| **P6-273** | Tenant configuration baseline | P6-169 | Applying an industry or size-appropriate baseline at provisioning | A provisioned tenant matches its declared baseline exactly, verified by comparison | OPEN |
| **P6-274** | Tenant suspension and reactivation | P6-022 | Suspension with data preserved and access blocked, and clean reactivation | A suspended tenant is inaccessible but loses nothing; reactivation restores exactly | OPEN |
| **P6-275** | Tenant merge and split | P6-111 | Combining and separating tenants with data, users and entitlement continuity | A merge preserves every record, user and entitlement with no duplication, proven by test | OPEN |
| **P6-276** | Tenant rename and rebranding | P6-176 | Changing tenant identity without breaking references, domains or integrations | A rename leaves no broken reference, verified by an exhaustive reference check | OPEN |
| **P6-277** | Tenant export | P6-194 | Complete export of a tenant's data and configuration in an open format | An export reimports into a fresh tenant and reproduces it exactly, verified by comparison | OPEN |
| **P6-278** | Tenant offboarding and deletion | P6-277 | Termination with export, retention honouring and verifiable deletion | Deleted tenant data is absent from primary storage immediately and from backups within the stated window | OPEN |
| **P6-279** | Tenant version and upgrade visibility | P6-227 | What version the tenant runs, what is changing, and when | A tenant knows what will change before it changes, within the stated notice period | OPEN |
| **P6-280** | Upgrade scheduling and windows | P6-279 | Tenant-selectable maintenance windows within platform constraints | A tenant's chosen window is honoured, or the deviation is notified in advance | OPEN |
| **P6-281** | Environment observability | P6-250 | Per-environment health, usage and configuration state | Every environment's state is visible from one surface | OPEN |
| **P6-282** | Stage K lifecycle proof | P6-277 | A suite driving provision, configure, migrate, promote, suspend, reactivate, export and delete | Every path leaves a consistent state, and a deliberately skipped cleanup step is caught | OPEN |

---

## 16. Stage L · Support, health and operability (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-283** | Tenant health dashboard | P6-281 | Availability, performance, errors, jobs and integrations in one operational view | Every figure derives from measured telemetry, not from self-report | OPEN |
| **P6-284** | Performance visibility for administrators | P6-016 | Response times, slow operations and their attribution, visible to the tenant | A slow operation is attributable to its module and cause from the tenant's own view | OPEN |
| **P6-285** | Background job visibility | P6-283 | Scheduled and background job state, history, failures and retry | A failed job is visible, diagnosable and retryable by the administrator without support | OPEN |
| **P6-286** | Error and exception visibility | P6-010 | Tenant-visible errors with frequency, affected users and context | A recurring error is identifiable and attributable before users report it | OPEN |
| **P6-287** | Capacity and growth visibility | P6-141 | Storage, record counts, growth trend and projected limits | An approaching capacity limit is visible with time to act, measured | OPEN |
| **P6-288** | Support request creation | P6-286 | Raising support requests with automatically attached diagnostic context | A support request carries the context needed to act, with tenant consent for what is shared | OPEN |
| **P6-289** | Support case tracking | P6-288 | Case status, history, SLA and communication in the console | Every case's state and next action is visible without leaving the console | OPEN |
| **P6-290** | Diagnostic data sharing consent | P6-231 | Explicit, scoped, time-boxed consent for diagnostic and support access | Nothing is shared without recorded consent, and consent is revocable at any time | OPEN |
| **P6-291** | Self-service diagnostics | P6-286 | Guided diagnostics for common problems, resolving without support | The most common support reasons have a self-service path, measured against real case data | OPEN |
| **P6-292** | Knowledge base and in-context help | P6-291 | Contextual help and searchable documentation within the console | Help search returns useful results, measured against a real query corpus | OPEN |
| **P6-293** | Administrator onboarding and guidance | P6-271 | Progressive guidance for administrators across the console's breadth | A new administrator completes the core setup tasks unaided, measured | OPEN |
| **P6-294** | Notification and announcement centre | P6-227 | Platform announcements, maintenance, advisories and tenant notifications in one place | No required notification is missable; delivery is confirmed and preferences honoured | OPEN |
| **P6-295** | Administrator activity feed | P6-008 | A chronological, filterable feed of everything happening in the tenant | Any recent change is discoverable from the feed within the interaction budget | OPEN |
| **P6-296** | Scheduled reports for administrators | P6-233 | Recurring administrative reports delivered on schedule | A scheduled report runs as a declared subject and contains only what that subject may read | OPEN |
| **P6-297** | Multi-administrator collaboration | P6-295 | Concurrent administration with change visibility and conflict handling | Two administrators making conflicting changes produce a surfaced conflict, never a silent overwrite | OPEN |
| **P6-298** | Mobile access for administrators | P6-014 | Critical administrative actions available on a small screen | Approval, containment and health actions are completable at 320 px width, verified | OPEN |
| **P6-299** | Console search across everything | P6-161 | One search across settings, users, groups, roles, audit and help | Any administrative object is reachable in one search within the interaction budget | OPEN |
| **P6-300** | Operational runbooks for tenants | P6-291 | Documented, tested procedures for the operations a tenant performs | Every runbook has been executed in rehearsal and its steps verified | OPEN |
| **P6-301** | Console observability | P6-009 | Metrics on console usage, errors, task completion and support deflection | Support deflection is measured, giving UX-7 a real denominator | OPEN |
| **P6-302** | Stage L operability proof | P6-291 | A suite asserting that the most common administrative tasks and support reasons are self-serviceable | Each task completes self-service, and one that cannot is recorded as a documented exception | OPEN |

---

## 17. Stage M · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P6-303** | Coverage that can fail | P6-020 | Coverage across this programme with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P6-304** | Unit and component testing | P6-303 | Unit coverage of the permission engine, policy resolver, settings resolver and lifecycle automation | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P6-305** | Integration testing against real infrastructure | P6-018 | Integration suites against real Postgres and real identity providers | The suite runs against real infrastructure and a real IdP in CI; a mock-only pass is caught | OPEN |
| **P6-306** | Permission differential testing | P6-110 | Continuous differential testing of declared, explained, simulated and enforced access | All four agree across generated policies, and any divergence fails CI | OPEN |
| **P6-307** | End-to-end administrative journeys | P6-050 | Automated journeys: provision, onboard, grant, review, revoke, offboard, export, delete | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P6-308** | Two-tenant isolation testing, universally | P6-005 | An isolation test for every table, endpoint, report and setting in this programme | A surface without an isolation test fails a coverage gate. Every test proves **zero** rows | OPEN |
| **P6-309** | Identity federation conformance | P6-082 | Conformance testing against real SAML and OIDC providers | Federation works against every supported provider, verified per provider | OPEN |
| **P6-310** | Lifecycle and clock-dependent testing | P6-100 | Testing expiry, retention, review cycles and scheduled actions against a controllable clock | A year-long lifecycle is tested in seconds through the injected clock, with no real waiting | OPEN |
| **P6-311** | Load and scale testing | P6-016 | Load profiles for authentication, permission evaluation, audit search and settings resolution | Targets met at 10,000-user tenant scale. A regression beyond threshold fails CI | OPEN |
| **P6-312** | Soak and endurance testing | P6-311 | Long-running tests detecting leaks, session growth and audit-volume degradation | A 24-hour soak shows no unbounded growth and no degradation in audit search | OPEN |
| **P6-313** | Accessibility audit across the estate | P6-017 | Full WCAG 2.2 AA audit of every console surface | The estate is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P6-314** | Security testing and penetration exercise | P6-082 | Scanning plus penetration testing focused on privilege escalation and cross-tenant access | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P6-315** | Disaster recovery rehearsal | P6-235 | Rehearsed recovery of tenant data, configuration and identity state | A recovery rehearsal meets its objective with configuration and access intact | OPEN |
| **P6-316** | Access review campaign rehearsal | P6-207 | A full access certification campaign run end to end on the fixture tenant | A campaign completes with every access confirmed or revoked, and revocations take effect | OPEN |
| **P6-317** | Compliance evidence rehearsal | P6-203 | Generating a complete evidence package as an auditor would request it | The package is generated entirely by mechanism, verified by rehearsal | OPEN |
| **P6-318** | The self-service proof | P6-302 | The UX-7 invariant made mechanical: the scripted list of administrator questions and changes, each completed self-service | Every item completes without support, or is recorded as a documented exception with a reason. The list is regressed each release | OPEN |
| **P6-319** | The containment proof | P6-308 | The second half of § 1, adversarially: attempts to affect another tenant or exceed plan entitlement from every console surface | Every attempt fails, and each succeeds the moment its control is removed | OPEN |
| **P6-320** | Programme 6 launch readiness | P6-319 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 18 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 18. Programme exit criteria

- [ ] **Every scripted administrator question and change completes self-service, or is a documented exception** (P6-318)
- [ ] **No console surface can affect another tenant or exceed plan entitlement, proven adversarially** (P6-319)
- [ ] Every setting has exactly one owning plane; a setting in both fails a gate (P6-003)
- [ ] Every setting is reachable in one search (P6-161)
- [ ] Declared, explained, simulated and enforced access always agree (P6-110, P6-306)
- [ ] Permission decisions are enforced by the database; direct SQL returns exactly what the API does (P6-090)
- [ ] A hidden field is absent from the payload, not masked in the UI (P6-092)
- [ ] Every permission change previews exactly who gains and loses what, and the preview matches (P6-105)
- [ ] Deprovisioning leaves zero remaining access paths, verified exhaustively (P6-034)
- [ ] Standing privileged access does not exist; every elevation is time-boxed and audited (P6-077)
- [ ] MFA enforcement cannot be bypassed by any authentication path (P6-054, P6-056)
- [ ] Every access grant is reviewed in a certification cycle — none silently retained (P6-207, P6-316)
- [ ] Impersonation grants the viewer nothing and attributes every action to both principals (P6-108, P6-109)
- [ ] A subject access request returns complete data across all 45 modules (P6-191)
- [ ] Data past retention is deleted on schedule; legal hold suspends it (P6-189, P6-190)
- [ ] A production-derived sandbox contains no readable personal data (P6-265)
- [ ] An integration cannot reach an undeclared egress destination (P6-244)
- [ ] A stored credential is not retrievable in plaintext by any path, including by a tenant owner (P6-242)
- [ ] Audit is append-only and tamper-evident; a modified record is detectable (P6-008, P6-219)
- [ ] Support access without recorded consent is impossible, and every access is visible to the tenant (P6-231, P6-290)
- [ ] Every surface has a two-tenant isolation test proving **zero** rows (P6-308)
- [ ] Coverage thresholds have been proven able to fail (P6-303)
- [ ] Every UI primitive lives in `unierp-design-system` with a story; zero hardcoded colours or spacing (P6-013)

---

## 19. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 6 established (P6-001–P6-320), the Tenant Admin Console.** Registered per README § 0 rule 1. Track D is 22/22 DONE and this programme states plainly that this does not mean the console is finished: Track D's scope was one track among thirteen, and a complete SaaS management portal is measured against Okta, Entra, Google Workspace and Atlassian admin. `P6-002` scores the existing surface against that bar before any phase claims to extend it, so the programme begins from a measurement rather than an assumption in either direction. `P6-003` fixes the plane-2 / plane-3 boundary — every setting is assigned exactly one owning plane, and a setting appearing in both fails a gate — because an unowned setting is how two consoles come to disagree. | Claude Code |
