# PROGRAMME 2 · THE DEVELOPER PORTAL — P2-001–P2-362

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Programme 2 is independently executable.** `node scripts/start.mjs --programme 2` resolves
> waves from *this document* and can only ever hand out a `P2-` phase. An agent working
> Programme 1 is never handed one of these, and an agent working here is never handed an A–M
> phase. That is the whole point of the separation, and it is mechanical, not aspirational.

---

## 0. The independence rule — read this before adding a phase

Programme 1's Track G (`16-TRACK-G-DEVELOPER-PLATFORM.md`, G01–G30, **8/30 DONE**) is the
*bridgehead*: sandbox, extension host, the first builders, and the 54 pages currently in
`unierp-developer`. Programme 2 is the platform those 30 phases were only ever an entry to.

**No phase in this document may name a Programme 1 phase in its `Depends` cell.** Not because the
relationship does not exist — it plainly does — but because a cross-programme dependency makes one
programme unable to start until the other moves, which is exactly the coupling the separation
exists to prevent. Where a real relationship exists it is recorded here in prose and discharged by
a **P2 phase that verifies the precondition at runtime and fails loudly if it is absent**. See
`P2-004`, which is that mechanism.

The consequence is deliberate and worth stating plainly: **Programme 2 can be executed against a
Programme 1 that is only partially finished.** Every P2 phase that needs something from A–M asserts
it and stops, rather than assuming it.

---

## 1. What this track owns

`unierp-developer` — **plane 4, the developer plane.** The portal in which someone who is not on
the UniERP team builds a real application on UniERP, tests it, packages it, and publishes it to the
Marketplace, without writing a line of platform code and without the platform team's involvement.

**The invariant this programme establishes:**

> **Anything the UniERP product team can build on this platform, a third-party developer can build
> too — through the portal, with the same guarantees, and without privileged access.**

That is the single sentence that separates a "low-code feature" from a *developer platform*, and it
is the sentence the whole 362-phase sequence is written to make true. It has a mechanical test,
`P2-360`: a UniERP business module is rebuilt using **only** portal capabilities, and any platform
API it needed that the portal does not expose is a defect, not a difference.

### Verified starting position

Measured on `unierp-developer` today, not asserted:

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Files (excl. `node_modules`) | 659 | `find unierp-developer -type f -not -path "*/node_modules/*" \| wc -l` |
| Route pages | 54 | `find unierp-developer -name page.tsx -not -path "*/node_modules/*" \| wc -l` |
| Most recent work | `G12: BPMN page — Import/Export/Execute UI` | `git log -1` |

Fifty-four pages is a real surface and is not discarded. But a page is not a builder: G12 delivered
a BPMN *page* with import, export and execute; Stage I of this programme is the twenty phases that
turn that into an execution engine with compensation, timers, human tasks and a migration story for
in-flight instances. The distance between those two things is the honest measure of this programme.

**Reference set.** The brief names Salesforce, SAP and Zoho. The capability model here is drawn
from ten: **Salesforce** (metadata API, Flow, governor limits, managed packages, sharing model),
**ServiceNow** (App Engine, Flow Designer, update sets), **Microsoft Power Platform** (Dataverse,
Power Fx, connectors, solution layering), **SAP BTP** (CAP/CDS, extensibility contracts),
**Zoho Creator/Catalyst** (Deluge, the low-code-to-code ramp), **Retool** (query-first UI binding),
**Airtable/Notion** (relation ergonomics), **Mendix/OutSystems** (model consistency checking and
impact analysis), **Supabase/Hasura** (declarative row-level security), and **Temporal** (durable
execution). Where a phase adopts a specific idea from one of them, it says so.

---

## 2. UX principles — the ones this programme is held to

A developer portal is a tool used for eight hours at a stretch by someone who is not a beginner and
will not be one again. `docs/ai/UI_UX_BRIEF.md` governs; these seven are the plane-4 additions, and
each has a phase that enforces it rather than a paragraph that requests it.

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **The model is the artefact; the canvas is a view of it.** Every builder edits the same metadata a file or an API could, and round-trips losslessly. | Salesforce Metadata API; ServiceNow update sets | `P2-052`, `P2-329` |
| **UX-2** | **No dead end.** Every declarative surface has a documented, in-place escape into code that does not require abandoning what was built. | Zoho Deluge; Power Fx → plug-ins | `P2-296` |
| **UX-3** | **The system says what will break before you break it.** Impact analysis precedes destructive change; consistency errors are shown at edit time, not at deploy time. | Mendix/OutSystems consistency checking | `P2-064`, `P2-332` |
| **UX-4** | **Limits are visible while you build, not discovered in production.** Every governed resource shows its consumption in the builder. | Salesforce governor limits | `P2-118`, `P2-341` |
| **UX-5** | **Undo is total and history is navigable.** Every builder is an editor; editors have undo, versions and diffs. Nothing is saved by surprise. | Figma; Notion | `P2-055`, `P2-234` |
| **UX-6** | **Keyboard-first and screen-reader-complete on a canvas.** A node graph is not exempt from accessibility; it is the hardest case and gets a dedicated phase. | Retool; WCAG 2.2 AA | `P2-166`, `P2-357` |
| **UX-7** | **The first application ships in under an hour.** Time-to-first-published-app is a measured, regressed metric, not a slogan. | Supabase; Airtable onboarding | `P2-019`, `P2-361` |

---

## 3. Design-system rule

`unierp-design-system` (112 components) is the only source of UI primitives. This programme
**extends** it and never forks it. A builder canvas, a node, a property inspector, a code editor
chrome, a diff viewer and a schema grid are all *new primitives* — they belong in the design system
with a story, not in `unierp-developer/app/**`. `P2-013` establishes the plane-4 component set and
the gate that keeps it there; the existing token gate (B15) applies unchanged, so a hardcoded hex
or `px` in this repo fails CI exactly as it does everywhere else.

---

## 4. Waves

`start.mjs --programme 2` resolves the current wave from this section. The lowest wave with
unfinished work is where we are; a later wave is never opened because it looks more interesting.

### Wave 0 · "The portal is a platform, not a page set"

**Phases:** P2-001–P2-040

Independence, the runtime precondition gate, the plane-4 design system, developer identity, and org
model. Nothing declarative is built until a third-party developer can hold an account with scoped,
audited, least-privilege access to exactly one workspace.

### Wave 1 · "Metadata is the product"

**Phases:** P2-041–P2-108

The object/field/relationship engine, its materialisation into real tables with real migrations,
and the permission and sharing model that governs it. Every builder in Wave 2 is a view over this.
If this wave is wrong, everything after it is wrong in the same way, which is why it is 68 phases.

### Wave 2 · "The builders"

**Phases:** P2-109–P2-244

Query, Form, Flow, Workflow, Rules, Page/App, Report/Dashboard. Each is built on Wave 1's metadata
and none of them owns its own storage model.

### Wave 3 · "Code, integration and intelligence"

**Phases:** P2-245–P2-326

Connectors, the AI builder, and the code plane — the escape hatch UX-2 promises, made real: a
sandboxed runtime, an SDK, a CLI, and local development against a real tenant.

### Wave 4 · "Publish"

**Phases:** P2-327–P2-348

Packaging, semantic versioning, dependency resolution, security review, and the pipeline that puts
a third-party application in the Marketplace under its author's name.

### Wave 5 · "Production"

**Phases:** P2-349–P2-362

Governance, limits, cost attribution, the full test estate, and the two exit proofs — a module
rebuilt portal-only, and a stranger publishing an application in under an hour.

---

## 5. Stage A · Independence and foundation (Wave 0)

`unierp-developer`. Establishes that this programme can move without Programme 1 moving, and that
its output is deployable from its first phase rather than its last.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-001** | Programme charter and boundary declaration | — | A machine-readable `programme-2.manifest.json` in `unierp-developer` declaring the repositories this programme may write to, the platform APIs it consumes, and the ones it is forbidden to reach around | A CI step fails when a P2 commit modifies a repository outside the declared set. Deleting the declaration fails CI rather than disabling the check | DONE |
| **P2-002** | Portal builds and deploys standalone | P2-001 | `unierp-developer` builds, typechecks, lints, tests and produces a runnable container from a clean clone with no sibling repository present | `docker build` from a clean clone of only this repo produces an image that serves a health endpoint. No `file:../` dependency remains in `package.json` | OPEN |
| **P2-003** | Contract-pinned platform client | P2-002 | The portal's access to platform APIs consolidated behind one generated client, pinned to a published contract version, with no ad-hoc `fetch` to platform hosts | A raw `fetch` to a platform origin outside the generated client fails a lint gate. The pinned contract version is asserted at startup | OPEN |
| **P2-004** | Runtime precondition gate — the independence mechanism | P2-003 | The named mechanism from § 0: a startup and CI check that asserts each platform capability this programme requires, reports which are absent, and degrades the dependent portal surface to an explicit "unavailable, requires \<capability\>" state | With a required capability absent, the portal starts, the dependent surface says exactly what is missing, and no other surface is affected. A capability silently vanishing turns a page red in CI, not in production | OPEN |
| **P2-005** | Tenancy and workspace isolation baseline | P2-002 | Every table this programme introduces carries `tenantId` and a developer `workspaceId`, with RLS policies written in the same migration as the table | A migration adding a table without both columns and an RLS policy fails `check-rls-verify.mjs`. Two-workspace test proves workspace B reads zero rows | OPEN |
| **P2-006** | Migration discipline for a metadata-heavy schema | P2-005 | Forward-only migrations with a tested down path, a seeded fixture set, and a rule that no migration edits a previously shipped migration | Re-running every migration from empty reproduces the current schema byte-identically. Editing a shipped migration fails CI | OPEN |
| **P2-007** | Structured logging, tracing and correlation | P2-002 | Request-scoped correlation IDs propagated through builder saves, metadata compiles and runtime executions, emitted as structured events | A single builder save is traceable end to end from UI action to database write by one correlation ID | OPEN |
| **P2-008** | Error taxonomy and developer-facing diagnostics | P2-007 | A typed error hierarchy separating *developer mistake*, *platform fault*, and *limit exceeded* — each with a stable code, a remediation link, and a rule that no error reaches a developer as a stack trace | Every thrown error carries a code from the registry. An uncoded error fails `check-error-handling.mjs`. Triggering each class shows the right message and never a stack trace | OPEN |
| **P2-009** | Configuration and secret handling | P2-002 | All configuration through a validated schema; no secret in source, in the client bundle, or in a log line | A missing required variable fails startup with the variable named. A secret-shaped string in a log fails a gate. Bundle scan finds zero secrets | OPEN |
| **P2-010** | Authentication baseline for the portal itself | P2-002 | The portal's own session handling: rotation, absolute and idle expiry, secure cookie attributes, CSRF defence, and device binding | Session fixation, replay after logout, and cross-site submission are each proven to fail by a test that fails when its defence is removed | OPEN |
| **P2-011** | Authorization primitives and the default-deny rule | P2-010 | A permission decorator applied to every portal endpoint, defaulting to deny, with unauthorized returning **403** | An endpoint without an explicit permission declaration fails a gate. An unauthorized request returns 403, never 404 or 500 | OPEN |
| **P2-012** | Audit log for every developer action | P2-011 | Append-only audit of every metadata mutation, publish, permission change and impersonation, with actor, workspace, before/after and correlation ID | Every mutating endpoint produces an audit record. An endpoint that mutates without auditing fails a gate. Audit records cannot be updated or deleted by any application path | OPEN |
| **P2-013** | Plane-4 design system extension | P2-002 | Canvas, node, edge, port, property inspector, schema grid, diff viewer, code-editor chrome and command palette added to `unierp-design-system` with stories, tokens and dark/light parity | Each primitive has a Storybook story and zero hardcoded colour or spacing. A builder component defined inside `unierp-developer/app/**` fails the component-location gate | OPEN |
| **P2-014** | Builder shell and navigation model | P2-013 | The frame every builder lives in: workspace switcher, resource tree, canvas region, inspector, bottom console, command palette — one shell, seven builders | All builders render in the shell. A builder introducing its own navigation chrome fails review against the shell contract test | OPEN |
| **P2-015** | Keyboard model and command palette | P2-014 | A single command registry driving the palette, shortcuts and the accessibility tree, with no builder registering a shortcut outside it | Every builder action is reachable by keyboard alone. A shortcut registered outside the registry is not bound, proven by test | OPEN |
| **P2-016** | Autosave, draft state and conflict handling | P2-014 | Optimistic local edit with server reconciliation, explicit draft/published states, and last-writer detection that surfaces a conflict rather than silently overwriting | Two sessions editing one artefact produce a surfaced conflict, not a lost edit. Killing the browser mid-edit loses no committed change | OPEN |
| **P2-017** | Portal performance budget | P2-014 | Measured budgets for shell load, canvas interaction latency and inspector response, wired into CI on a fixed hardware profile | A change regressing canvas interaction beyond budget fails CI. The budget file cannot be raised without an amendment-log entry | OPEN |
| **P2-018** | Accessibility baseline for the portal shell | P2-014 | WCAG 2.2 AA across the shell: focus order, landmarks, contrast, motion preferences and screen-reader labelling | `axe` clean on the shell. Full navigation by keyboard and by screen reader, recorded as a test, not a claim | OPEN |
| **P2-019** | Time-to-first-app instrumentation | P2-016 | The UX-7 metric made measurable: an instrumented funnel from account creation to first published application, with per-step drop-off | The metric is emitted and dashboarded. A release regressing it beyond threshold fails the gate in `P2-361` | OPEN |
| **P2-020** | Test harness for builders | P2-014 | The shared testing substrate: canvas interaction driver, metadata fixture factory, golden-file comparison for compiled artefacts, and a two-workspace isolation helper | A builder test can be written without new infrastructure. The harness itself has tests that fail when it is broken | OPEN |

---

## 6. Stage B · Developer identity, organisations and access (Wave 0)

The people and companies that build on UniERP. Distinct from tenant users (Programme 1, plane 2)
and provider staff (plane 1) — a developer is a fourth principal with its own lifecycle.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-021** | Developer principal and account lifecycle | P2-012 | The `DeveloperAccount` entity: registration, email verification, activation, suspension, deletion — modelled as a distinct principal, never a tenant user with a flag | A developer account cannot authenticate to a tenant surface and a tenant user cannot authenticate here, each proven by test | OPEN |
| **P2-022** | Developer organisation and membership | P2-021 | `DeveloperOrg` with membership, invitation, ownership transfer, and a rule that every artefact is owned by an org rather than a person | Deleting the last owner is refused. An artefact survives the departure of its author with ownership intact | OPEN |
| **P2-023** | Workspaces and environment topology | P2-022 | `Workspace` as the isolation unit, with dev/test/staging promotion lanes and no shared mutable state between them | Data written in dev is unreachable from staging. A promotion moves metadata without moving data, proven by test | OPEN |
| **P2-024** | Role model and least privilege | P2-023 | Roles for owner, builder, reviewer, operator and read-only, expressed as capability sets rather than page lists | Each role is proven unable to perform every capability outside its set. Adding a capability without assigning it to a role leaves it unreachable, not universally allowed | OPEN |
| **P2-025** | Multi-factor authentication, enforced | P2-021 | TOTP and WebAuthn, with MFA mandatory for publish, secret access and permission change regardless of org policy | Publishing without a second factor is impossible even for an org owner who disabled MFA policy. The test fails when the enforcement is removed | OPEN |
| **P2-026** | WebAuthn and passkey support | P2-025 | Passkey registration, multi-device, and account recovery that does not degrade to a weaker factor | Recovery never issues a session with fewer factors than the account requires, proven by test | OPEN |
| **P2-027** | Enterprise SSO for developer orgs | P2-024 | SAML and OIDC federation per org, with just-in-time provisioning and group-to-role mapping | A federated user receives exactly the roles their IdP groups map to and loses them on deprovision, within one session lifetime | OPEN |
| **P2-028** | SCIM provisioning and deprovisioning | P2-027 | SCIM 2.0 endpoints for org membership, with deprovision revoking sessions and tokens immediately | A SCIM delete invalidates live sessions and outstanding tokens in under a minute, proven by test | OPEN |
| **P2-029** | API keys, tokens and machine identity | P2-024 | Scoped, expiring credentials for CI and CLI use, stored hashed, with last-used tracking and one-time display | A leaked-key simulation shows the key is unusable after revocation within the documented window. The plaintext key exists in no store | OPEN |
| **P2-030** | OAuth authorisation server for developer apps | P2-029 | Authorisation-code-with-PKCE issuance so a published application can act on a tenant's behalf, with consent, scopes and refresh rotation | Implicit flow is unsupported. A stolen refresh token is detected by rotation-reuse detection and the family revoked, proven by test | OPEN |
| **P2-031** | Consent, scope and grant management | P2-030 | Human-readable scopes, a consent screen stating exactly what is granted, and a tenant-side revocation surface | Revoking a grant stops the application's access at the next request, not at token expiry | OPEN |
| **P2-032** | Impersonation and support access | P2-024 | Time-boxed, consented, fully audited support access to a developer workspace, with no standing privilege | Support access without an active consent record is impossible. Every impersonated action is attributed to both principals in the audit log | OPEN |
| **P2-033** | Rate limiting and abuse control | P2-029 | Per-principal, per-workspace and per-IP limits on authentication, metadata mutation and execution, with backoff and lockout | A credential-stuffing simulation is throttled and locked out. Limits are proven to apply by test, and removing one fails that test | OPEN |
| **P2-034** | Developer profile, verification and trust tier | P2-022 | Publisher identity: legal entity, domain verification, and a trust tier that gates what may be published | An unverified org cannot publish a paid or data-accessing application. Verification state is displayed wherever the publisher's name is | OPEN |
| **P2-035** | Legal agreements and acceptance record | P2-034 | Developer terms, data-processing agreement and marketplace distribution agreement, versioned, with per-version acceptance records | Publishing under a superseded agreement version is refused. Every acceptance is reproducible from the record | OPEN |
| **P2-036** | Developer onboarding journey | P2-023 | The UX-7 path: signup to workspace to first object to first form, guided, resumable and skippable | A stranger reaches a working workspace with a queryable object unaided. The journey is resumable after abandonment | OPEN |
| **P2-037** | Notification and activity feed | P2-012 | Per-developer and per-org notification of build results, review outcomes, limit breaches and security advisories, with delivery preferences honoured | A security advisory reaches every affected org's owners. An unsubscribed channel receives nothing, proven by test | OPEN |
| **P2-038** | Session and credential self-service | P2-025 | Developer-visible list of sessions, devices, keys and grants, each individually revocable | Revoking a session from another device ends it within one request cycle | OPEN |
| **P2-039** | Account deletion and data export | P2-035 | Full export of a developer org's artefacts and audit trail, and a deletion path that honours retention obligations without orphaning published applications | Deleting an org with a published application is refused with the reason. Export reimports into a fresh workspace and produces identical metadata | OPEN |
| **P2-040** | Stage B security review and threat model | P2-030 | A written threat model for the developer plane — privilege escalation into a tenant, token theft, malicious publisher — with each threat mapped to a control and a test | Every identified threat has a test that fails when its control is removed. Findings filed in `90-DEFECT-LOG.md` | OPEN |

---

## 7. Stage C · The metadata engine (Wave 1)

**The centre of this programme.** Every builder in Wave 2 is a view over what is defined here, and
nothing downstream can be more correct than this stage is. Modelled on Salesforce's metadata API and
Dataverse's table model: metadata is *data*, versioned, diffable, and addressable by API — never a
JSON blob a UI happens to write.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-041** | Metadata storage model | P2-006 | The `MetadataObject`, `MetadataField`, `MetadataRelationship` and `MetadataVersion` entities as first-class relational tables with tenant and workspace scoping — not a document column | A field is queryable by SQL predicate without JSON extraction. Two-workspace test proves zero cross-reads | OPEN |
| **P2-042** | Namespacing and reserved identifiers | P2-041 | Per-org namespace prefix on every developer-defined API name, with a reserved list protecting platform identifiers | Two orgs may each define `Invoice` without collision. Defining a reserved name is refused with the reason | OPEN |
| **P2-043** | Custom object definition | P2-042 | Object creation with label, plural, API name, description, record-name strategy and lifecycle flags, through both UI and API | An object created via API is identical to one created via UI, compared by golden file | OPEN |
| **P2-044** | The primitive field type set | P2-043 | Text, long text, number, **decimal with explicit precision and scale**, boolean, date, datetime, time, email, phone, URL — each with storage, validation, display and serialisation defined once | Money is representable only as `Decimal(19,4)`. A `Float` field type does not exist and cannot be created, proven by test | OPEN |
| **P2-045** | Picklist and enumerated types | P2-044 | Single and multi-select picklists with value sets, ordering, defaults, deactivation and a controlled-vocabulary API | Deactivating a value in use does not corrupt existing records and is reported by impact analysis | OPEN |
| **P2-046** | Formula and derived fields | P2-044 | Read-only computed fields with a typed expression language, dependency tracking and a cycle check | A formula referencing itself transitively is refused at save. Formula results match a reference implementation across a property-based test suite | OPEN |
| **P2-047** | Rollup and aggregate fields | P2-046 | Parent-side aggregates over child records with incremental maintenance and defined behaviour under delete and reparent | A rollup stays correct through 10,000 concurrent child mutations, verified against a recomputed ground truth | OPEN |
| **P2-048** | Relationship types | P2-043 | Lookup, master-detail, many-to-many and self-referencing relationships with cascade, restrict and orphan semantics stated per type | Deleting a master with children behaves exactly as the declared semantics say, for every type, proven by test | OPEN |
| **P2-049** | Referential integrity and cascade correctness | P2-048 | Database-level constraints backing every declared relationship — not application-level checks alone | A direct SQL insert violating a relationship is rejected by the database, not merely by the API | OPEN |
| **P2-050** | Unique, required and composite constraints | P2-044 | Field-level and composite uniqueness, conditional requirement, and case/accent sensitivity declared rather than assumed | A concurrent double-insert of a unique value fails one of the two at the database level, proven under parallel load | OPEN |
| **P2-051** | Metadata validation and consistency checking | P2-048 | A validator run on every metadata write: dangling references, type incompatibility, orphaned components, name collisions | Saving inconsistent metadata is impossible through any path — UI, API or import. Each rule has a test that fails when the rule is removed | OPEN |
| **P2-052** | Metadata serialisation and lossless round-trip | P2-051 | The UX-1 mechanism: a canonical file representation of all metadata, exported and reimported with byte-identical results | Export → import → export produces an identical artefact for every object type. A type that does not round-trip fails the gate | OPEN |
| **P2-053** | Metadata API | P2-052 | Full CRUD over metadata by API, with the same validation and audit as the UI, and no capability available only through the canvas | Every builder action is reproducible by API call. An API-only capability gap fails the parity test | OPEN |
| **P2-054** | Metadata change events | P2-053 | Every metadata mutation emitted through the outbox in the same transaction, for downstream consumers | A metadata change and its event are committed atomically; killing the process between them is proven impossible | OPEN |
| **P2-055** | Version history, diff and revert | P2-052 | The UX-5 mechanism for metadata: immutable versions, a semantic diff between any two, and revert to any prior version | Reverting to a prior version reproduces it exactly and is itself a new version. Diff shows semantic change, not text change | OPEN |
| **P2-056** | Draft, activation and deactivation lifecycle | P2-055 | Metadata states — draft, active, deprecated, retired — with defined runtime behaviour for each and no direct-to-active path for breaking changes | A deprecated field still reads and no longer writes. Skipping deprecation on a breaking change is refused | OPEN |
| **P2-057** | Dependency graph and reference tracking | P2-051 | A queryable graph of what references what across every artefact type in the programme | "What uses this field?" answers completely, including from flows, forms, queries, reports and code. A missing edge type fails the completeness test | OPEN |
| **P2-058** | Object and field-level metadata search | P2-057 | Search across the whole metadata estate by name, type, description, usage and last change | A field is findable by any of its properties in under the performance budget on a 50,000-component workspace | OPEN |
| **P2-059** | Schema Builder canvas | P2-048 | Visual entity-relationship editing on the shell canvas: create, relate, edit and inspect, with layout persistence | A schema built on the canvas produces metadata identical to the same schema built by API | OPEN |
| **P2-060** | Metadata import and migration tooling | P2-052 | Import from CSV, JSON Schema, an existing database, and a competitor export, with a mapping review step and a dry run | A dry run reports exactly what a real import would do. An import cannot partially apply — it commits or it does not | OPEN |
| **P2-061** | Record types and per-type layout variation | P2-045 | Record types varying picklist values, layouts and processes within one object | Two record types on one object present different picklist sets and layouts, with data remaining in one table | OPEN |
| **P2-062** | Field history and audit trail on records | P2-044 | Per-field change tracking with a declared retention window and a queryable history API | Enabling history on a field captures old and new value with actor and time. Retention expiry deletes on schedule, proven by test | OPEN |
| **P2-063** | Soft delete, archive and recycle bin | P2-048 | Recoverable deletion with a defined window, plus hard-delete honouring the deletion policy | A restored record returns with its relationships intact. A hard-deleted record leaves no row in any table, verified by query | OPEN |
| **P2-064** | Impact analysis before destructive change | P2-057 | The UX-3 mechanism: before deleting or retyping any component, a complete report of what breaks, with a refusal path | Deleting a field used by a live flow is refused and names the flow. Bypassing the analysis is not possible through any path | OPEN |
| **P2-065** | Metadata limits and quotas | P2-041 | Declared ceilings on objects, fields, relationships and total components per workspace, enforced at write time with clear messaging | Exceeding a limit fails at the point of creation with the limit named and the current count shown | OPEN |
| **P2-066** | Localisation of metadata | P2-043 | Translatable labels, help text, picklist values and error messages, with fallback rules and a translation workflow | An object renders fully in a second locale with no untranslated string. A missing translation falls back visibly, not silently | OPEN |
| **P2-067** | Metadata performance at scale | P2-058 | Metadata read path optimised and cached with correct invalidation, measured against a 50,000-component workspace | Metadata resolution stays within budget at 50,000 components. A stale cache after a write is proven impossible | OPEN |
| **P2-068** | Stage C correctness proof | P2-064 | A property-based suite generating random valid metadata graphs, materialising them, and asserting every declared invariant | The suite finds no invariant violation across 10,000 generated graphs, and finds one immediately when an invariant is deliberately weakened | OPEN |

---

## 8. Stage D · Data layer and schema materialisation (Wave 1)

Turning metadata into real tables with real indexes and real migrations. The alternative — a generic
entity-attribute-value table — is rejected here explicitly: it defeats the database's query planner,
its constraints and its type system, and no amount of application code recovers them.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-069** | Physical schema strategy | P2-068 | The decision, written and justified: one physical table per custom object, native column types, native constraints — with the EAV alternative documented and rejected | A custom object's data is queryable by native SQL with a working query plan. The strategy document names what would falsify it | OPEN |
| **P2-070** | Schema materialisation engine | P2-069 | Metadata activation generating and applying DDL transactionally, with rollback on failure | A failed materialisation leaves neither partial DDL nor drifted metadata, proven by fault injection | OPEN |
| **P2-071** | Online schema change | P2-070 | Adding and altering columns without blocking reads or writes on tables holding millions of rows | A field is added to a 10-million-row object with no write blocked longer than the stated threshold, measured | OPEN |
| **P2-072** | Index management and advisory | P2-070 | Automatic indexes for keys and relationships, developer-declared indexes, and an advisor proposing them from observed query shapes | A slow query in the builder surfaces a concrete index proposal that measurably fixes it when applied | OPEN |
| **P2-073** | Row-level security generation | P2-070 | RLS policies generated from the permission model with every materialised table, in the same transaction | A materialised table without an RLS policy cannot exist. Two-tenant test proves tenant B reads **zero** rows, not filtered rows | OPEN |
| **P2-074** | Record CRUD runtime | P2-073 | The generic, metadata-driven record API: create, read, update, delete, upsert — with validation, defaults and audit | Every field type round-trips through the API without precision or timezone loss, proven per type | OPEN |
| **P2-075** | Bulk data operations | P2-074 | Batched insert, update, upsert and delete with partial-failure reporting and per-row error attribution | A 1-million-row load reports exactly which rows failed and why, and the successful rows are committed | OPEN |
| **P2-076** | Transaction and consistency model | P2-074 | The declared transaction boundary for a builder-defined operation, with documented isolation and no cross-request implicit transaction | A concurrent update conflict produces a documented, retryable error rather than a lost update, proven under parallel load | OPEN |
| **P2-077** | Optimistic concurrency and record locking | P2-076 | Version-stamped records with conflict detection, plus explicit pessimistic locking where a flow requires it | Two simultaneous edits produce one success and one surfaced conflict, never two silent successes | OPEN |
| **P2-078** | Idempotency for all mutating operations | P2-074 | Idempotency keys on every mutating endpoint with a deduplication window and stored responses | A retried create with the same key produces one record and returns the original response, proven under induced network failure | OPEN |
| **P2-079** | Query execution and safety | P2-074 | The query runtime with parameterisation throughout, a statement timeout, a row ceiling and a cost estimate | Injection is impossible by construction — string-concatenated SQL is absent and a lint gate keeps it absent. An unbounded query is refused | OPEN |
| **P2-080** | Pagination, sorting and cursors | P2-079 | Stable keyset pagination that does not skip or duplicate rows under concurrent writes | Paging a table being concurrently mutated returns each row at most once, proven by test | OPEN |
| **P2-081** | Full-text and fuzzy search on records | P2-079 | Per-object search configuration, indexing, ranking and highlighting, with index maintenance on write | A record is findable within the stated indexing latency after creation. Search respects row-level security, proven by two-tenant test | OPEN |
| **P2-082** | File and attachment storage | P2-074 | Object-attached files with virus scanning, content-type verification, size limits, signed URLs and quota accounting | An executable renamed to `.pdf` is rejected by content inspection. A signed URL expires and cannot be replayed | OPEN |
| **P2-083** | Large object and blob handling | P2-082 | Streaming upload and download with resumability, and no whole-file buffering in application memory | A 5 GB upload completes and resumes after interruption without exceeding the memory budget, measured | OPEN |
| **P2-084** | Data import pipeline | P2-075 | Developer-facing import: file upload, field mapping, transformation, validation preview, execution and rollback | A failed import rolls back completely. The preview's reported outcome matches the executed outcome exactly | OPEN |
| **P2-085** | Data export and portability | P2-074 | Full and filtered export in CSV, JSON and Parquet, honouring permissions and producing a reimportable artefact | An export reimports into a fresh workspace and reproduces identical data. A user exports only what they may read | OPEN |
| **P2-086** | Backup and point-in-time restore | P2-070 | Per-workspace backup covering data and metadata together, with tested restore to a point in time | A restore rehearsal recovers a workspace to a chosen minute with metadata and data consistent with each other | OPEN |
| **P2-087** | Data retention and purge | P2-063 | Per-object retention policy execution, with legal hold and a purge that is genuinely irreversible | A retention rule deletes on schedule and a legal hold blocks it. Purged data is absent from backups after the stated window | OPEN |
| **P2-088** | PII classification and field-level encryption | P2-044 | Per-field PII classification driving encryption at rest, masking in logs, and export redaction | A field marked PII is unreadable in a database dump and masked in every log line, proven by inspecting both | OPEN |
| **P2-089** | Data residency and regional placement | P2-070 | Workspace-level residency selection with enforcement at the storage layer, not merely at the routing layer | Data for an EU-resident workspace is provably absent from non-EU storage, verified by query against every region | OPEN |
| **P2-090** | Stage D load and correctness proof | P2-080 | A load suite exercising the record runtime at documented volume with concurrent readers and writers, asserting no lost update, no phantom and no cross-tenant read | The suite passes at target volume and fails immediately when isolation is deliberately weakened | OPEN |

---

## 9. Stage E · Permissions, sharing and the security model (Wave 1)

Salesforce's sharing model and Hasura's declarative row-level security are the references. The rule
that makes this stage non-negotiable: **a permission decision is made in one place, and that place is
enforced by the database.** An application-layer check that the database does not also enforce is a
defect in this programme, not a design choice.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-091** | Permission model foundations | P2-073 | Object, field and record-level permission entities with a single evaluation function used by every enforcement point | Two enforcement paths returning different answers for one subject and resource is impossible — a differential test proves they agree on every generated case | OPEN |
| **P2-092** | Object-level permissions | P2-091 | Create, read, edit, delete, view-all and modify-all per object per profile | Each permission is proven independently enforced, and removing it from the database policy fails the test | OPEN |
| **P2-093** | Field-level security | P2-092 | Per-field read and edit control applied at the query layer, so a hidden field never leaves the database | A field hidden from a user is absent from the API response payload entirely, not merely masked in the UI | OPEN |
| **P2-094** | Record ownership and hierarchy | P2-092 | Owner assignment, role hierarchy, and inherited access, with transfer semantics | Reassigning ownership moves access exactly as declared, including for records shared by rule | OPEN |
| **P2-095** | Sharing rules and criteria-based access | P2-094 | Declarative sharing by criteria, ownership and group, materialised into policies rather than evaluated per request | A criteria change re-materialises access within the stated latency, verified by a subject who gains and loses access | OPEN |
| **P2-096** | Manual sharing and delegated access | P2-095 | Per-record grants with expiry, revocation and audit | An expired manual share stops granting access at expiry, proven by test | OPEN |
| **P2-097** | Profiles, permission sets and composition | P2-092 | Composable permission sets layered over a base profile, with a resolver whose output is inspectable | For any user, the portal shows which grant supplies each permission. The explanation matches actual enforcement, verified differentially | OPEN |
| **P2-098** | Territory and team access | P2-095 | Team membership and territory-based access as a separate axis from hierarchy | A user gains access by team membership and loses it on removal within one session, proven by test | OPEN |
| **P2-099** | Permission enforcement at the database | P2-091 | Every rule above expressed as a generated RLS policy, with the application layer as defence in depth rather than the sole control | Direct SQL as the application role returns exactly what the API returns for the same subject — no more. A divergence fails the gate | OPEN |
| **P2-100** | Cross-object and relationship-traversal access | P2-099 | Declared access behaviour when traversing a relationship to a record the subject cannot read | A traversal never leaks an unreadable record's existence, field values or count, proven by test per relationship type | OPEN |
| **P2-101** | Aggregate and count leakage prevention | P2-100 | Aggregates, counts and search facets computed only over readable rows | A count over a filtered set cannot be used to infer the existence of unreadable records, proven by an inference test | OPEN |
| **P2-102** | Permission testing framework | P2-097 | A harness expressing "this subject may/may not do this" as a first-class test, usable by developers on their own objects | A developer writes a permission test without new infrastructure. Every object in the estate has one, enforced by a coverage gate | OPEN |
| **P2-103** | Permission change safety | P2-097 | Impact analysis for permission changes: who gains and who loses access, previewed before commit | A permission change shows the exact set of affected subjects and records before it is applied, and the preview matches the outcome | OPEN |
| **P2-104** | Secret and credential storage for developer apps | P2-029 | An encrypted store for connector credentials, scoped to a workspace, with rotation, versioning and no read-back of plaintext | A stored secret is not retrievable in plaintext by any application path, including by an org owner. Rotation preserves running integrations | OPEN |
| **P2-105** | Sandbox boundary and privilege containment | P2-099 | The hard boundary: developer-defined logic cannot reach platform internals, another workspace, or the host — enforced by the runtime, not by convention | A deliberate escape attempt for each documented vector fails, and each has a test that passes when the containment is removed | OPEN |
| **P2-106** | Input validation and output encoding | P2-074 | Schema-driven validation on every input boundary and contextual encoding on every output, applied centrally | XSS, injection and deserialisation payload suites all fail to execute. Adding an unvalidated boundary fails a gate | OPEN |
| **P2-107** | Dependency and supply-chain security | P2-002 | SBOM generation, vulnerability scanning, license compliance and pinned, verified dependencies for the portal and for developer packages | A known-vulnerable dependency fails the build. An unpinned or unverifiable dependency is refused | OPEN |
| **P2-108** | Stage E adversarial review | P2-105 | An adversarial test suite attempting cross-workspace read, privilege escalation, permission bypass and sandbox escape, run in CI | Every attempt fails. Deliberately removing any one control makes its corresponding attempt succeed, demonstrating the suite can fail | OPEN |

---

## 10. Stage F · Query Builder (Wave 2)

Retool's premise — the query is the unit a UI binds to — with Hasura's permission-aware compilation.
The Query Builder produces a **saved, versioned, permission-checked query artefact** that forms,
pages, reports, flows and code all consume. It does not produce SQL strings that callers paste around.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-109** | Query artefact model | P2-053 | The saved query as versioned metadata: source objects, projection, predicates, joins, ordering, parameters and result contract | A query is addressable by name and version, and its result contract is knowable without executing it | OPEN |
| **P2-110** | Visual query composition canvas | P2-109 | Object selection, field projection, relationship joins and filter composition on the shell canvas | A query built visually and the same query written in the text mode compile to an identical plan, compared by golden file | OPEN |
| **P2-111** | Predicate and expression editor | P2-110 | Typed filter construction with operators appropriate per field type, null semantics made explicit, and grouped boolean logic | Comparing a text field to a number is refused at edit time, not at run time. Three-valued logic behaves per the documented table, proven by test | OPEN |
| **P2-112** | Relationship traversal and joins | P2-111 | Multi-hop traversal across declared relationships with inner, left and semi-join semantics, and a hop ceiling | A traversal to an unreadable record returns nothing and leaks no existence signal, per P2-100 | OPEN |
| **P2-113** | Aggregation, grouping and windowing | P2-112 | Group-by, aggregate functions, having-clauses and window functions with typed results | Aggregates compute over readable rows only, verified by a two-subject differential test | OPEN |
| **P2-114** | Parameterisation and binding | P2-109 | Named, typed query parameters with defaults, requiredness and binding from page, flow, form or API context | A parameter is bound only by value, never by interpolation. A parameterised query with hostile input executes safely, proven by an injection suite | OPEN |
| **P2-115** | Query compilation and plan generation | P2-109 | The compiler from artefact to parameterised SQL, with permission predicates injected rather than appended | A compiled query with permission predicates stripped fails the compiler's own assertion, so an unsecured query cannot be produced | OPEN |
| **P2-116** | Result contract and typed output | P2-115 | A declared, versioned result shape consumers bind against, with breaking-change detection between versions | Changing a projection in a way that breaks a bound consumer is reported by impact analysis before save | OPEN |
| **P2-117** | Live preview and sample data | P2-115 | In-builder execution against real data with the developer's own permissions, row limits and a visible truncation indicator | Preview results are identical to runtime results for the same subject and parameters, proven by differential test | OPEN |
| **P2-118** | Query cost estimation and the plan viewer | P2-115 | The UX-4 mechanism for queries: estimated cost, row count and index usage shown in the builder before saving | A query missing an index shows the warning and the concrete index proposal from P2-072 while it is being built | OPEN |
| **P2-119** | Query performance guardrails | P2-118 | Enforced timeouts, row ceilings, complexity limits and refusal of unbounded cross-joins | A pathological query is refused at save time with the reason, and cannot be smuggled in through the API | OPEN |
| **P2-120** | Caching and invalidation | P2-116 | Declarative result caching with dependency-based invalidation on the underlying objects | A cached result is invalidated by a write to any contributing object within the stated latency. A stale read is proven impossible | OPEN |
| **P2-121** | Raw expression escape hatch | P2-115 | The UX-2 path for queries: a reviewed, parameterised raw-expression mode that keeps permission predicates mandatory | Raw mode cannot omit permission predicates. Attempting to do so fails the compiler, proven by test | OPEN |
| **P2-122** | Cross-object and union queries | P2-112 | Union, intersection and difference across compatible objects with a unified result contract | A union across two objects with differing permissions returns only rows readable in each source | OPEN |
| **P2-123** | Query versioning, diff and rollback | P2-055 | Saved query versions with semantic diff and rollback, and consumers pinned to a version | Rolling back a query does not break a consumer pinned to the prior version | OPEN |
| **P2-124** | Query library, reuse and composition | P2-116 | Named queries usable as sources within other queries, with cycle detection | A query referencing itself transitively is refused. Composition depth is bounded and the bound is enforced | OPEN |
| **P2-125** | Query execution API and SDK surface | P2-116 | Executing a saved query by name and version from code, flow, page or external client, with the same permission evaluation | Every execution path returns identical results for identical subject and parameters, proven by differential test across all four | OPEN |
| **P2-126** | Query observability | P2-119 | Per-query execution metrics, slow-query capture, error rates and per-workspace attribution | A slow query is attributable to its artefact, version and calling context from telemetry alone | OPEN |
| **P2-127** | Query Builder accessibility | P2-110 | Keyboard-complete query construction and screen-reader-navigable join and predicate structure | A query with three joins and nested predicates is built and understood without a mouse and without sight, recorded as a test | OPEN |
| **P2-128** | Stage F proof | P2-125 | A differential suite comparing visual, text, API and SDK construction of the same query set against expected results and permission behaviour | All four paths agree across the suite, and disagree immediately when one compiler branch is deliberately altered | OPEN |

---

## 11. Stage G · Form Builder (Wave 2)

Forms are where most developer applications actually meet a user, and where accessibility and
validation most often fail. The rule for this stage: **a form never carries validation the metadata
does not already know about.** A rule enforced only in the browser is a defect.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-129** | Form artefact model | P2-053 | The form as versioned metadata: bound object or query, sections, fields, layout, rules and submission behaviour | A form is fully reconstructible from metadata with no browser-only state | OPEN |
| **P2-130** | Form canvas and layout composition | P2-129 | Drag, drop, reorder, group, resize and responsive breakpoint editing on the shell canvas | A form laid out in the builder renders identically at runtime across the declared breakpoints, verified by visual regression | OPEN |
| **P2-131** | Field widget library | P2-044 | A widget per primitive type, each with input, display, empty, disabled, loading and error states, built in the design system | Every field type has a widget with all six states in Storybook. A type without a widget fails the completeness gate | OPEN |
| **P2-132** | Advanced widgets | P2-131 | Lookup with search, multi-select, file upload, rich text, signature, geolocation, barcode and date-range widgets | Each advanced widget is keyboard-operable and screen-reader-labelled, proven per widget | OPEN |
| **P2-133** | Validation model and server authority | P2-129 | Validation declared once in metadata, executed on the server as the authority and mirrored in the browser for responsiveness | Submitting a crafted request that bypasses the browser is rejected server-side with the identical error, proven per rule | OPEN |
| **P2-134** | Conditional visibility and dynamic behaviour | P2-133 | Show, hide, enable, disable, require and default by expression over form and record state | A hidden required field does not block submission. A conditionally required field is enforced on the server, not only in the browser | OPEN |
| **P2-135** | Multi-step forms and wizards | P2-134 | Step definition, per-step validation, progress, back navigation and resumable partial state | Abandoning at step three and returning restores exactly the entered state, including files | OPEN |
| **P2-136** | Repeating sections and nested records | P2-048 | Child-record editing inline, with add, remove, reorder and per-row validation, saved in one transaction | A parent and twenty children save atomically. A failure on child nineteen leaves nothing committed | OPEN |
| **P2-137** | Form submission and idempotency | P2-078 | Submission with idempotency keys, double-submit prevention, optimistic feedback and precise error placement | A double-clicked submit creates exactly one record. A network failure mid-submit does not duplicate on retry | OPEN |
| **P2-138** | Draft saving and recovery | P2-016 | Automatic draft persistence with recovery after crash, tab close or session expiry | A browser killed mid-form recovers every entered value on return, proven by test | OPEN |
| **P2-139** | Error presentation and recovery UX | P2-008 | Field-level, section-level and form-level errors with focus management, summary and remediation text | A submission with five errors moves focus to the first, announces the count, and lists all five. Verified with a screen reader | OPEN |
| **P2-140** | Form accessibility | P2-131 | WCAG 2.2 AA across every generated form: labels, descriptions, error association, focus order, target size | Every generated form is `axe` clean and completable by keyboard and by screen reader. A widget regression fails the suite | OPEN |
| **P2-141** | Localisation and input formatting | P2-066 | Locale-correct number, date, currency and address input, with right-to-left layout support | A form completes correctly in a right-to-left locale with locale-formatted numbers, verified visually and functionally | OPEN |
| **P2-142** | Public and unauthenticated forms | P2-106 | Externally exposed forms with origin restriction, bot mitigation, spam control and strictly scoped write permission | A public form can write only to its declared target and cannot be used to enumerate or read data, proven by an abuse suite | OPEN |
| **P2-143** | Form templates and reuse | P2-129 | A template library plus generation of a default form from any object's metadata | Generating a form from an object produces a complete, accessible, valid form with no manual step | OPEN |
| **P2-144** | Form embedding and white-labelling | P2-142 | Embeddable forms with themable tokens, a documented host API and framing protections | An embedded form is themable through tokens alone and cannot be clickjacked, proven by test | OPEN |
| **P2-145** | Form analytics | P2-019 | Per-field completion, abandonment, error frequency and time-to-complete | A field causing high abandonment is identifiable from the analytics alone | OPEN |
| **P2-146** | Print, PDF and document output | P2-130 | Deterministic paginated output from a form or record, with layout control and embedded assets | Generated output is byte-identical across runs for identical input, verified by golden file | OPEN |
| **P2-147** | Offline form capture | P2-138 | Local capture with queued submission and conflict resolution on reconnect | A form completed offline submits on reconnect, and a conflicting server change surfaces rather than overwrites | OPEN |
| **P2-148** | Stage G proof | P2-140 | A suite generating a form for every field type and permutation of validation and visibility, asserting server-side enforcement and accessibility | The generated estate passes accessibility and server-authority checks, and fails when browser-only validation is reintroduced | OPEN |

---

## 12. Stage H · Flow Builder (Wave 2)

Record-triggered and screen flows. The reference is Salesforce Flow for the model and **Temporal for
the execution guarantees** — because the defect that makes low-code automation untrustworthy is
always the same one: a flow that half-ran and left the data inconsistent, with no way to see it or
resume it. Durability is designed in at `P2-151`, not added later.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-149** | Flow artefact model | P2-053 | The flow as versioned metadata: trigger, variables, elements, connectors and error paths | A flow is fully described by metadata and round-trips per UX-1 | OPEN |
| **P2-150** | Flow canvas | P2-149 | Node and edge editing with auto-layout, grouping, zoom, minimap and a validation overlay | A flow with 100 nodes remains navigable and within the interaction budget, measured | OPEN |
| **P2-151** | Durable execution engine | P2-149 | The execution core: persisted state per step, exactly-once step semantics, resumption after crash, and replay | Killing the process mid-flow resumes at the next uncompleted step with no step re-executed and none skipped, proven by fault injection | OPEN |
| **P2-152** | Trigger model | P2-151 | Record create, update, delete, scheduled, platform-event and invoked triggers with declared ordering and recursion control | A flow updating its own trigger object does not recurse infinitely — the depth limit is enforced and observable | OPEN |
| **P2-153** | Variables, scope and typing | P2-149 | Typed variables with declared scope, collection support and no implicit coercion | An assignment of the wrong type is refused at design time, not discovered at run time | OPEN |
| **P2-154** | Decision, branch and merge elements | P2-153 | Conditional branching with typed conditions, default paths and explicit merge semantics | Every branch has a defined path for every input, including null. An unreachable branch is reported at design time | OPEN |
| **P2-155** | Loop and collection processing | P2-153 | Iteration over collections with bounds, early exit, and per-item error handling that does not abandon the batch | A 10,000-item loop with a failure at item 5,000 handles it per the declared policy and reports precisely | OPEN |
| **P2-156** | Data elements | P2-074 | Create, update, delete, get and upsert records within a flow, honouring the running subject's permissions | A flow cannot read or write beyond its running subject's permissions, proven by two-subject test | OPEN |
| **P2-157** | Transaction boundaries and rollback | P2-076 | Declared transaction scope per flow segment, with rollback and documented boundaries at asynchronous steps | A failure inside a transactional segment rolls back every write in it, proven by fault injection at each step | OPEN |
| **P2-158** | Compensation and saga support | P2-157 | Compensating actions for steps whose effects cross a transaction boundary, executed in reverse on failure | A flow failing after an external call runs its compensations in order and reaches a consistent state, proven by test | OPEN |
| **P2-159** | Error handling and fault paths | P2-008 | Per-element fault connectors, typed errors, retry with backoff, and a dead-letter path | An unhandled fault is impossible: a flow without a fault path for a fallible element fails validation at save | OPEN |
| **P2-160** | Screen flows and interactive steps | P2-135 | User-facing multi-screen flows reusing the form runtime rather than a second one | A screen flow's inputs use Stage G widgets and inherit their accessibility, verified by audit | OPEN |
| **P2-161** | Subflows and composition | P2-149 | Callable subflows with typed inputs and outputs, versioning and cycle detection | A recursive subflow is refused. A subflow version change does not break pinned callers | OPEN |
| **P2-162** | Scheduled and time-based execution | P2-152 | Scheduled paths, waits, and time-based resumption surviving restart and timezone change | A flow waiting seven days resumes correctly across a deployment and a daylight-saving transition, proven by test | OPEN |
| **P2-163** | External invocation and callouts | P2-159 | Calling connectors and external services from a flow with timeout, retry, circuit breaking and idempotency | An unresponsive external service does not exhaust the worker pool, proven under induced latency | OPEN |
| **P2-164** | Flow debugging and step-through | P2-151 | Debug execution with breakpoints, variable inspection, step-through and a replayable trace of any past run | A production run is replayable step by step with its actual variable values, subject to permission | OPEN |
| **P2-165** | Flow testing framework | P2-020 | Declarative flow tests: given a trigger and fixtures, assert records, calls and outcomes, with mocked externals | A flow can be tested without touching an external system. A coverage gate requires a test per active flow | OPEN |
| **P2-166** | Canvas accessibility | P2-150 | The UX-6 mechanism: full keyboard construction and screen-reader comprehension of a node graph, with a linear structural view | A 40-node flow is built, understood and edited without a mouse and without sight, recorded as a test | OPEN |
| **P2-167** | Flow versioning and safe activation | P2-056 | Versioned flows with draft and active states, and a declared policy for in-flight instances on activation | Activating a new version leaves in-flight instances on their original version until completion, proven by test | OPEN |
| **P2-168** | Flow limits and governor model | P2-065 | Per-flow ceilings on elements, queries, callouts, records and CPU, surfaced in the builder as they are consumed | A flow approaching a limit shows it while being built. Exceeding it fails with the limit named, not with a generic error | OPEN |
| **P2-169** | Bulk and asynchronous flow execution | P2-155 | Bulk-safe execution over batches and asynchronous continuation for long-running work | A trigger firing on a 10,000-record load executes in bulk within limits rather than per record, measured | OPEN |
| **P2-170** | Flow observability | P2-007 | Per-flow execution metrics, error rates, duration distribution, in-flight counts and per-instance trace | A failing flow is diagnosable from telemetry to the failing element without reproducing it | OPEN |
| **P2-171** | Flow impact analysis | P2-064 | Flows included in the dependency graph, so changing a field reports the flows that break | Deleting a field a flow reads is refused and names the flow and element | OPEN |
| **P2-172** | Stage H durability proof | P2-151 | A chaos suite killing the engine at every step boundary across a representative flow set, asserting no double execution and no lost step | The suite passes at every injection point, and detects a violation immediately when exactly-once handling is deliberately weakened | OPEN |

---

## 13. Stage I · Workflow, BPMN and human tasks (Wave 2)

Flows automate; workflows coordinate people over days and weeks. This stage builds on the G12 BPMN
page already in `unierp-developer` and turns it into an engine. It reuses Stage H's durable executor
rather than introducing a second one — **two execution engines is the failure mode this stage exists
to avoid**, and `P2-173` is where that is decided and enforced.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-173** | One execution engine, two languages | P2-151 | BPMN semantics implemented as a front end over the Stage H durable executor, with the decision and its constraints written down | A second persistence or scheduling implementation for workflows fails an architecture gate. BPMN and flow instances share one instance store, verified by query | OPEN |
| **P2-174** | BPMN model and conformance scope | P2-173 | The declared, tested BPMN 2.0 subset — events, tasks, gateways, subprocesses — with unsupported constructs rejected at import rather than silently ignored | Importing an unsupported construct fails with the construct named. The supported subset passes a conformance suite | OPEN |
| **P2-175** | Workflow canvas and modelling | P2-150 | BPMN-notation editing on the shell canvas with pools, lanes, validation and auto-layout | A workflow modelled in the portal exports to standard BPMN XML and reimports without loss | OPEN |
| **P2-176** | Process instance lifecycle | P2-173 | Instance start, suspend, resume, terminate and archive, with state visible and auditable | Every state transition is audited and observable. A terminated instance releases its held resources, proven by test | OPEN |
| **P2-177** | Human task model | P2-176 | Task creation, assignment, claim, delegation, escalation, reassignment and completion, with a task inbox | A task escalates on its deadline to the declared assignee and is never silently lost, proven by test | OPEN |
| **P2-178** | Assignment and routing rules | P2-177 | Assignment by role, hierarchy, queue, skill, load and round-robin, with an unassignable fallback | A task whose assignee is unavailable routes per policy rather than stalling. No task reaches an empty assignee set | OPEN |
| **P2-179** | Approval processes | P2-177 | Multi-step, parallel, unanimous and quorum approvals with recall, rejection paths and delegation of authority | An approver cannot approve their own submission. A quorum is enforced server-side, proven by test | OPEN |
| **P2-180** | Timers, deadlines and SLA | P2-162 | Boundary timers, durations, business calendars and SLA tracking with breach events | A deadline expressed in business hours honours the workspace calendar including holidays, proven across a year of fixtures | OPEN |
| **P2-181** | Event-based coordination | P2-054 | Message, signal and conditional events for inter-process coordination with correlation | A message correlates to exactly one waiting instance. An uncorrelated message is dead-lettered, not dropped | OPEN |
| **P2-182** | Parallel execution and synchronisation | P2-174 | Parallel gateways, joins, multi-instance activities and the completion conditions for each | A parallel join completes exactly once when all branches arrive, and never deadlocks, proven under concurrent completion | OPEN |
| **P2-183** | Compensation and transaction subprocesses | P2-158 | BPMN compensation and transaction subprocesses over the Stage H saga mechanism | A cancelled transaction subprocess compensates its completed activities in reverse order, proven by test | OPEN |
| **P2-184** | Error, escalation and boundary events | P2-159 | Error, escalation, timer and message boundary events with interrupting and non-interrupting variants | Each boundary event type behaves per specification in a conformance test, including non-interrupting concurrency | OPEN |
| **P2-185** | In-flight instance migration | P2-167 | Migrating running instances to a new process version with a mapping step and a dry run | Ten thousand in-flight instances migrate with none lost, stuck or duplicated, verified by count and state comparison | OPEN |
| **P2-186** | Workflow monitoring and operations console | P2-176 | Operational view of instances: in-flight, stalled, failed, breaching — with bulk retry, reassign and terminate | A stalled instance is identifiable and recoverable without database access. Bulk retry is idempotent | OPEN |
| **P2-187** | Process analytics and bottleneck detection | P2-186 | Cycle time, wait time, path frequency and bottleneck analysis per process version | The slowest step of a process is identifiable from analytics alone, and a version comparison shows whether a change helped | OPEN |
| **P2-188** | Delegation, out-of-office and authority | P2-178 | Delegation with validity periods, authority limits and full attribution of the delegated act | A delegated approval records both the delegate and the delegator. Delegation beyond an authority limit is refused | OPEN |
| **P2-189** | Task UX and inbox | P2-177 | The assignee-facing inbox: prioritisation, filtering, bulk action, deadline visibility and mobile-viable layout | A user with 500 tasks finds and completes the urgent one within the interaction budget. `axe` clean | OPEN |
| **P2-190** | Workflow simulation and dry run | P2-175 | Executing a process against fixtures with no side effects, reporting the path taken and time consumed | A simulation produces the same path a real execution takes for identical inputs, proven differentially | OPEN |
| **P2-191** | Workflow testing framework | P2-165 | Process-level tests asserting path, task assignment, timer behaviour and outcome, with a controllable clock | A seven-day timer is tested in milliseconds through the injected clock, with no real waiting | OPEN |
| **P2-192** | Stage I proof | P2-185 | A conformance and chaos suite over the declared BPMN subset, with process termination injected at every activity boundary | The suite passes with no orphaned, duplicated or deadlocked instance, and fails when synchronisation is deliberately weakened | OPEN |

---

## 14. Stage J · Rules, validation and calculation (Wave 2)

The shared expression substrate. Written once here because Query, Form, Flow, Workflow, Page and
Report each otherwise grows its own dialect — and four dialects with four null semantics is a defect
that cannot be repaired later without breaking every artefact built on them.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-193** | One expression language | P2-046 | A single typed expression language, with grammar, type rules and evaluation semantics specified — used by every builder without dialect variation | A builder defining its own expression syntax fails an architecture gate. One parser serves all consumers, verified by import graph | OPEN |
| **P2-194** | Type system and null semantics | P2-193 | Static typing with explicit null handling, documented three-valued logic and no implicit coercion | Every operator's behaviour on null is specified and tested. An implicit coercion is a compile error, proven per case | OPEN |
| **P2-195** | Decimal and money arithmetic | P2-044 | Arbitrary-precision decimal arithmetic with declared rounding modes, and no binary floating point anywhere near money | A currency calculation produces the exact expected value across a rounding-edge-case suite. A `Float` in a money path fails a gate | OPEN |
| **P2-196** | Date, time and timezone semantics | P2-044 | Timezone-correct arithmetic, business-day calculation, duration handling and daylight-saving correctness | Date arithmetic across a DST boundary and across timezones matches expected values in a fixture suite covering both directions | OPEN |
| **P2-197** | String, collection and lookup functions | P2-193 | The standard function library with locale-aware string handling and bounded collection operations | Every function has a specification, a test and documented behaviour on empty and null input | OPEN |
| **P2-198** | Cross-record and relationship expressions | P2-112 | Expressions traversing relationships, with permission evaluation applied at traversal | An expression cannot read a field the running subject may not read, proven by two-subject test | OPEN |
| **P2-199** | Validation rules | P2-133 | Object-level validation rules evaluated server-side on every write path, regardless of origin | A rule blocks a write from UI, API, flow, import and code alike, proven per path | OPEN |
| **P2-200** | Duplicate detection and matching | P2-050 | Fuzzy matching rules, duplicate detection on write, and a merge path preserving relationships and audit | A merge preserves every relationship from both records and leaves an auditable trail of what was merged | OPEN |
| **P2-201** | Assignment, escalation and business rules | P2-178 | Declarative rule sets with ordered evaluation, first-match and all-match modes, and a decision table editor | A rule set's outcome is explainable: the portal names which rule fired and why, and the explanation matches execution | OPEN |
| **P2-202** | Expression safety and resource limits | P2-168 | Evaluation bounds on time, memory, recursion and collection size, enforced by the evaluator | A deliberately pathological expression is terminated within its bound and reported, rather than degrading the workspace | OPEN |
| **P2-203** | Expression editor and authoring UX | P2-193 | Autocomplete, inline type errors, function help, live evaluation against sample data, and keyboard-complete operation | A type error is shown while typing, at the offending token. The editor is fully operable by keyboard, verified by test | OPEN |
| **P2-204** | Stage J conformance proof | P2-194 | A specification-derived conformance suite plus differential testing of every evaluator embedding against a reference implementation | All embeddings agree with the reference on the full suite, and a deliberately altered embedding is caught immediately | OPEN |

---

## 15. Stage K · Page and application builder (Wave 2)

Where the artefacts become an application a user opens. The rule: **a page composes existing
artefacts and owns no data access of its own.** A page that queries directly is bypassing Stage F's
permission compilation, which is the one thing this stage may never allow.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-205** | Application artefact model | P2-053 | The application as versioned metadata: navigation, pages, permissions, branding, entry points and lifecycle | An application is fully described by metadata and round-trips per UX-1 | OPEN |
| **P2-206** | Page artefact and composition model | P2-205 | The page as a component tree with typed props, data bindings and layout, defined in metadata | A page renders identically from metadata alone with no build step, verified by golden render | OPEN |
| **P2-207** | Page canvas and direct manipulation | P2-206 | Visual composition with drag, drop, nest, select, multi-select, align and responsive breakpoint editing | A page composed visually matches its metadata exactly, verified by round-trip and golden render | OPEN |
| **P2-208** | Component library for pages | P2-013 | The runtime component set — layout, display, input, navigation, feedback, data — sourced from the design system with no page-local component | A component defined outside the design system fails the component-location gate. Every component has a story | OPEN |
| **P2-209** | Data binding model | P2-125 | Declarative binding of components to saved queries and record context, with typed contracts and no ad-hoc access | A page performing data access outside a saved query fails an architecture gate, proven by test | OPEN |
| **P2-210** | List, table and grid surfaces | P2-209 | Virtualised data grids with sorting, filtering, grouping, column control, inline edit and selection | A 100,000-row grid scrolls within the interaction budget and edits inline without losing the viewport, measured | OPEN |
| **P2-211** | Detail, record and related-list surfaces | P2-209 | Record pages with related lists, tabs, highlights and actions, generated by default from metadata | A record page generated from metadata alone is complete, accessible and correct for every object | OPEN |
| **P2-212** | Navigation, routing and deep linking | P2-205 | Declarative routes, parameters, guards and shareable deep links with browser history correctness | Every application state reachable by click is reachable by URL, and the back button never lands on an invalid state | OPEN |
| **P2-213** | Actions, buttons and invocations | P2-125 | Declarative actions invoking flows, queries, code or navigation, with confirmation, permission gating and result handling | An action the subject may not perform is not rendered and is refused server-side if invoked directly | OPEN |
| **P2-214** | Client state and inter-component communication | P2-206 | A declared state model with scoped variables and events, and no hidden global mutable state | Two components communicate only through declared channels. A hidden coupling fails an architecture test | OPEN |
| **P2-215** | Conditional rendering and personalisation | P2-193 | Visibility, enablement and variation by expression over subject, record, device and permission | A component hidden by permission is absent from the payload, not merely hidden in the DOM | OPEN |
| **P2-216** | Theming and white-labelling | P2-013 | Per-application theming through design tokens only, with light and dark parity and contrast validation | A theme failing contrast requirements is refused at save. No application can emit a hardcoded colour | OPEN |
| **P2-217** | Responsive and adaptive layout | P2-207 | Breakpoint-aware composition with a device preview and layout variation per breakpoint | Every generated page is usable at 320 px width with no horizontal scroll, verified across the page estate | OPEN |
| **P2-218** | Page accessibility | P2-208 | WCAG 2.2 AA for generated pages: landmarks, headings, focus, live regions, motion preference | Every generated page is `axe` clean and keyboard-complete. A component regression fails the suite | OPEN |
| **P2-219** | Page performance | P2-017 | Code splitting, lazy loading, query batching, streaming and a per-page performance budget | A page with ten bound queries meets its budget on the reference profile. A regression fails CI | OPEN |
| **P2-220** | Empty, loading, error and permission states | P2-008 | Every data-bound surface required to declare all four states, with defaults generated | A surface without all four states fails validation at save. Each state is verified by test | OPEN |
| **P2-221** | Real-time and collaborative surfaces | P2-054 | Subscription-based live updates with presence, driven by metadata change events | A record edited in one session updates another within the stated latency, respecting permissions | OPEN |
| **P2-222** | Custom component extension point | P2-208 | The UX-2 path for pages: developer-authored components with a typed contract, sandboxed and permission-aware | A custom component cannot access data outside its declared bindings, proven by an escape suite | OPEN |
| **P2-223** | Application-level search | P2-081 | Cross-object search within an application, permission-filtered and ranked, with keyboard entry | Search returns only readable records and is reachable by keyboard from any page | OPEN |
| **P2-224** | Notifications and in-app messaging | P2-037 | Per-application notification surfaces bound to platform events with preference control | A notification reaches only subjects permitted to see its subject record, proven by test | OPEN |
| **P2-225** | Application preview and impersonated view | P2-032 | Previewing an application as another role or subject, without acquiring their privileges | Preview shows exactly what that subject would see, verified differentially, and grants the previewer nothing | OPEN |
| **P2-226** | Application templates and scaffolding | P2-205 | Generating a complete working application from an object model, with CRUD, list, detail and navigation | Scaffolding an application from a three-object model produces a usable, accessible application with no manual step | OPEN |
| **P2-227** | Application versioning and undo | P2-055 | The UX-5 mechanism for applications: full undo, redo, version history and diff on the canvas | Any edit is undoable to arbitrary depth within a session, and any version is restorable afterwards | OPEN |
| **P2-228** | Stage K proof | P2-218 | A generated-estate suite rendering every component in every state at every breakpoint, asserting accessibility, performance and permission behaviour | The estate passes all three, and fails immediately when a component's permission check is deliberately removed | OPEN |

---

## 16. Stage L · Reports, dashboards and analytics (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-229** | Report artefact model | P2-116 | The report as versioned metadata over a saved query: grouping, aggregation, formatting and layout | A report is reproducible from metadata with identical output for identical data and subject | OPEN |
| **P2-230** | Report builder | P2-229 | Visual construction with grouping, summarisation, filtering, bucketing and cross-tabulation | A report built visually matches the equivalent query result exactly, verified differentially | OPEN |
| **P2-231** | Report types and joined reporting | P2-122 | Multi-object report types with declared join semantics and outer-join behaviour made explicit | A joined report's row count matches the declared semantics exactly on a fixture set covering every join type | OPEN |
| **P2-232** | Charting and visualisation | P2-208 | The chart set — bar, line, area, pie, scatter, funnel, gauge, heatmap — as design system components with accessible alternatives | Every chart has a screen-reader-navigable data table equivalent and passes contrast requirements in both themes | OPEN |
| **P2-233** | Dashboard composition | P2-232 | Multi-component dashboards with layout, filters, drill-through and per-component refresh | A dashboard filter applies consistently to every component. Drill-through preserves the filter context | OPEN |
| **P2-234** | Dashboard and report undo and history | P2-227 | Version history, diff and undo across report and dashboard editing | Any dashboard edit is undoable and any prior version restorable, proven by test | OPEN |
| **P2-235** | Report permission and row-level correctness | P2-099 | Reports evaluated under the running subject's permissions, never the author's, with no cached cross-subject leakage | Two subjects running one report see only their own readable rows, including from cache, proven by differential test | OPEN |
| **P2-236** | Scheduled reports and delivery | P2-162 | Scheduled execution with delivery by email and file, run as a declared subject with that subject's permissions | A scheduled report delivers only rows its declared subject may read. Subject deprovisioning stops the schedule | OPEN |
| **P2-237** | Export and format fidelity | P2-085 | Export to CSV, Excel and PDF with formatting, grouping and totals preserved | An exported report's totals match the on-screen totals exactly, including rounding, verified by golden file | OPEN |
| **P2-238** | Large-result and asynchronous reporting | P2-119 | Asynchronous execution for large results with progress, cancellation and streamed delivery | A report over 10 million rows completes asynchronously without exhausting memory, measured | OPEN |
| **P2-239** | Historical trending and snapshots | P2-062 | Point-in-time snapshots with retention, enabling trend reporting over time | A trend report over 12 monthly snapshots produces correct historical values that do not shift when current data changes | OPEN |
| **P2-240** | Analytics performance and materialisation | P2-072 | Pre-aggregation and materialised summaries with correct invalidation and a freshness indicator | A materialised aggregate is never stale beyond its declared window, and the window is displayed with the result | OPEN |
| **P2-241** | Embedded analytics | P2-144 | Reports and dashboards embeddable in pages and externally, with permission and origin enforcement | An embedded report cannot be used to read beyond the embedding subject's permissions, proven by an abuse suite | OPEN |
| **P2-242** | Report subscription and alerting | P2-224 | Threshold alerts and subscriptions on report results with deduplication and quiet hours | A threshold alert fires once per breach, not once per evaluation, proven by test | OPEN |
| **P2-243** | Analytics accessibility | P2-232 | Keyboard and screen-reader access to every chart, dashboard and drill-through path | A dashboard is fully comprehensible without sight, via data tables and structured summaries, recorded as a test | OPEN |
| **P2-244** | Stage L proof | P2-235 | A differential suite comparing report output against directly computed ground truth across subjects, joins, aggregates and formats | Every report matches ground truth for every subject, and a deliberately widened permission predicate is caught | OPEN |

---

## 17. Stage M · Integration and connector builder (Wave 3)

Power Platform's connector model is the reference. A connector is a **declared, versioned,
credential-scoped contract** — not a stored URL and a key. The stage's hard rule: no developer-built
integration may hold a credential it can read, and no external call may leave the workspace's
declared egress boundary.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-245** | Connector artefact model | P2-053 | The connector as versioned metadata: operations, schemas, authentication, limits and error mapping | A connector is fully described by metadata and round-trips per UX-1 | OPEN |
| **P2-246** | Connector builder | P2-245 | Visual definition of operations, request and response schemas, and parameter mapping, with a test invocation | A connector built in the portal invokes a real service and returns a typed result, without code | OPEN |
| **P2-247** | OpenAPI and specification import | P2-246 | Generating a connector from OpenAPI, with unsupported constructs reported rather than silently dropped | Importing a specification produces working operations, and every unsupported construct is named | OPEN |
| **P2-248** | Authentication schemes | P2-104 | API key, basic, bearer, OAuth 2.0 (all common grants), mutual TLS and signed-request authentication | A credential is never readable by the developer after storage, including through connector responses, proven by test | OPEN |
| **P2-249** | OAuth connection lifecycle | P2-030 | Per-workspace and per-user connections with consent, refresh, expiry handling and reconnection prompts | An expired refresh token surfaces a reconnection prompt rather than a silent integration failure | OPEN |
| **P2-250** | Egress control and allowlisting | P2-105 | Declared egress destinations per connector, enforced at the network boundary, with DNS-rebinding and SSRF defence | A call to an undeclared host is blocked at the network layer. An SSRF suite targeting internal addresses fails entirely | OPEN |
| **P2-251** | Request and response transformation | P2-193 | Declarative mapping between external payloads and platform records using the Stage J expression language | A transformation is defined without code and is testable against recorded fixtures | OPEN |
| **P2-252** | Pagination, streaming and large payloads | P2-083 | Declared pagination strategies, streamed responses and bounded memory for large payloads | A paginated source of 1 million records is consumed within the memory budget, measured | OPEN |
| **P2-253** | Retry, backoff and circuit breaking | P2-163 | Per-operation retry policy, exponential backoff with jitter, circuit breaker and bulkhead isolation | A failing external service is isolated without degrading unrelated workspaces, proven under induced failure | OPEN |
| **P2-254** | Idempotency for external effects | P2-078 | Idempotency keys on outbound calls where the protocol supports them, and a dedupe ledger where it does not | A retried outbound call does not duplicate the external effect, verified against a recording test double | OPEN |
| **P2-255** | Inbound webhooks | P2-142 | Receiving external events with signature verification, replay protection, ordering and a dead-letter queue | An unsigned or replayed webhook is rejected. A failed handler dead-letters rather than dropping the event | OPEN |
| **P2-256** | Outbound events and subscriptions | P2-054 | Publishing platform events externally with delivery guarantees, retry and subscriber management | A subscriber offline for an hour receives every event on return, in order, proven by test | OPEN |
| **P2-257** | Scheduled synchronisation | P2-162 | Scheduled pull and push synchronisation with watermarks, incremental change detection and resumption | An interrupted sync resumes from its watermark without reprocessing or skipping records | OPEN |
| **P2-258** | Bidirectional sync and conflict resolution | P2-077 | Two-way synchronisation with declared conflict policy and a surfaced resolution queue | A simultaneous edit on both sides resolves per policy and records both versions, never silently discarding one | OPEN |
| **P2-259** | Connector testing and mocking | P2-165 | Recorded fixtures, a mocking layer and contract tests against the connector's declared schema | A connector is testable without the external service. A schema drift in the real service is detected by contract test | OPEN |
| **P2-260** | Connector observability | P2-126 | Per-connector call volume, latency, error rate, retry count and credential health | A failing integration is diagnosable to the operation and error class from telemetry alone | OPEN |
| **P2-261** | Rate limiting and external quota respect | P2-033 | Honouring external rate limits with adaptive throttling, plus internal quotas per workspace | An external `429` results in adaptive backoff, not a retry storm, verified under load | OPEN |
| **P2-262** | File-based and legacy integration | P2-084 | SFTP, file drop, fixed-width, EDI and flat-file integration with schema definition and error routing | A malformed file routes to an error path with per-record diagnostics and does not partially apply | OPEN |
| **P2-263** | Database and warehouse connectors | P2-079 | Direct connectors to external databases and warehouses with read-only defaults and query safety | An external database connector cannot execute unparameterised statements, proven by an injection suite | OPEN |
| **P2-264** | Connector marketplace readiness | P2-245 | Connector packaging, versioning, publication metadata and certification requirements | A connector cannot be published without a passing contract test and a declared egress list | OPEN |
| **P2-265** | Integration data lineage | P2-057 | Tracking which external system supplied which field value, with timestamps and source attribution | Any synchronised field's origin is answerable: source system, operation, and time | OPEN |
| **P2-266** | Stage M resilience proof | P2-253 | A chaos suite injecting latency, failure, malformed payloads, partial responses and certificate errors into every connector operation class | Every failure mode is contained and reported, and none corrupts platform data. Removing a circuit breaker makes its test fail | OPEN |

---

## 18. Stage N · AI Builder (Wave 3)

The PRD's stated differentiator is **local-first AI with no data egress**. That is a strong claim and
therefore a dangerous one — it is exactly the shape of claim this project's own history shows
outliving its mechanism. `P2-267` establishes the boundary before any capability is built on it, and
`P2-288` is the adversarial proof that the boundary holds.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-267** | The data-egress boundary, declared and enforced | P2-250 | The mechanism behind the local-first claim: per-workspace AI residency policy, enforced at the network layer, with a policy that forbids any egress of tenant data | With residency set to local, a deliberate attempt to send tenant data to an external model is blocked at the network boundary and audited. Removing the control makes the test fail | OPEN |
| **P2-268** | Model registry and provider abstraction | P2-267 | A registry of available models — local and, where policy permits, hosted — behind one interface with declared capabilities and costs | Switching provider requires no artefact change. A model whose residency conflicts with workspace policy is not selectable | OPEN |
| **P2-269** | Local inference runtime | P2-268 | The on-premises inference path with resource limits, model loading, and graceful degradation under contention | Inference runs with no outbound network connection at all, verified by running the suite with egress disabled entirely | OPEN |
| **P2-270** | Prompt artefact model and versioning | P2-053 | Prompts as versioned metadata with typed inputs, output schemas, and no prompt embedded in application code | A prompt is versioned, diffable and testable. A prompt string in code fails a gate | OPEN |
| **P2-271** | Prompt builder and playground | P2-270 | Authoring with variable binding, live evaluation, side-by-side model comparison and cost display | A prompt is testable against fixtures before use, with cost and latency shown per model | OPEN |
| **P2-272** | Structured output and schema enforcement | P2-194 | Typed, schema-validated model output with repair, retry and an explicit failure path | A model returning malformed output never propagates it; the failure is typed and handled, proven by test | OPEN |
| **P2-273** | Grounding and retrieval over workspace data | P2-081 | Retrieval-augmented generation over the workspace's own records, with permission filtering applied before retrieval | Retrieval never surfaces content the running subject may not read, proven by two-subject differential test | OPEN |
| **P2-274** | Embedding and vector storage | P2-273 | Embedding generation, vector storage, indexing and re-embedding on source change, tenant-scoped | A record's embedding is deleted with the record. Two-workspace test proves zero cross-workspace retrieval | OPEN |
| **P2-275** | Document ingestion and extraction | P2-082 | Ingesting documents and extracting structured data into records, with confidence scores and a review path | An extraction below confidence threshold routes to human review rather than writing a record | OPEN |
| **P2-276** | Classification and prediction builders | P2-270 | Declarative classification, sentiment, prediction and scoring bound to objects and fields | A prediction writes to a declared field with its confidence and model version recorded alongside | OPEN |
| **P2-277** | AI-assisted artefact generation | P2-053 | Generating objects, flows, forms and queries from natural language, producing reviewable metadata rather than applied change | Generated metadata is presented as a diff for approval and never auto-applies. It passes the same validation as hand-built metadata | OPEN |
| **P2-278** | Conversational agents over applications | P2-273 | Agents that answer questions and take actions against workspace data, with every action permission-checked at execution | An agent cannot perform an action its invoking subject could not perform directly, proven by test | OPEN |
| **P2-279** | Tool and function calling | P2-213 | Exposing declared actions as model-callable tools with typed schemas, confirmation policy and audit | Every tool invocation is audited with its arguments. A tool with side effects requires the declared confirmation | OPEN |
| **P2-280** | Guardrails and content safety | P2-272 | Input and output filtering, prompt-injection defence, PII redaction and jailbreak resistance | A prompt-injection suite drawn from published techniques fails to escalate privilege or exfiltrate data | OPEN |
| **P2-281** | Human-in-the-loop and confirmation | P2-279 | Declared approval requirements for consequential AI actions, with a review queue and full attribution | No irreversible action executes on model output alone where policy requires review, proven per action class | OPEN |
| **P2-282** | Evaluation harness | P2-270 | Datasets, metrics, regression suites and comparison across model and prompt versions | A prompt change is measured against the suite before release. A regression beyond threshold blocks the change | OPEN |
| **P2-283** | Observability, cost and token accounting | P2-260 | Per-invocation logging of model, tokens, latency, cost and outcome, attributed to workspace and artefact | Cost per application is answerable from telemetry. A runaway loop is detectable and capped | OPEN |
| **P2-284** | Rate limits, quotas and cost control | P2-283 | Per-workspace AI quotas with soft warning, hard cap and predictable degradation | Exceeding quota degrades AI features explicitly and never silently returns a lower-quality result | OPEN |
| **P2-285** | Caching and determinism | P2-120 | Response caching with correct invalidation, plus a deterministic mode for testing | The same input under deterministic mode returns the same output, making AI-dependent tests reproducible | OPEN |
| **P2-286** | Model lifecycle and deprecation | P2-268 | Model version pinning, deprecation notice, migration path and behaviour-change detection | A model deprecation notifies affected workspaces with lead time, and pinned artefacts continue to work through the window | OPEN |
| **P2-287** | Transparency and AI disclosure | P2-035 | Marking AI-generated content, recording model provenance on records, and surfacing it to end users | Every AI-written field value carries its model, version and prompt version, visible to the record's reader | OPEN |
| **P2-288** | Stage N adversarial and egress proof | P2-280 | An adversarial suite attempting data exfiltration, prompt injection, cross-workspace retrieval and privilege escalation through every AI surface | Every attempt fails with egress disabled and with it enabled. Removing any single control makes its corresponding attempt succeed | OPEN |

---

## 19. Stage O · The code plane — SDK, CLI and local development (Wave 3)

UX-2 made real. Zoho's Deluge and Salesforce's Apex show the pattern: declarative for most work, a
first-class code path for the rest, and no wall between them. The rule here is that **code is not
privileged** — developer code runs under the same permission model, the same limits and the same
audit as a flow, and `P2-290` is where that containment is established.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-289** | Code artefact model | P2-053 | Developer code as versioned metadata alongside every other artefact, not a separate deployment channel | Code round-trips per UX-1 and is versioned, diffed and reverted by the same mechanism as a flow | OPEN |
| **P2-290** | Sandboxed execution runtime | P2-105 | An isolated runtime with no filesystem, no ambient network, no host access, and a declared API surface | Every documented escape vector fails, and each has a test that succeeds when the containment is removed | OPEN |
| **P2-291** | Resource limits and fair scheduling | P2-168 | CPU, memory, wall-clock, call-depth and I/O limits per execution, with fair scheduling across workspaces | An infinite loop is terminated at its limit and does not affect another workspace, proven under contention | OPEN |
| **P2-292** | Platform SDK | P2-125 | Typed SDK for records, queries, flows, files, connectors and events, generated from contracts so it cannot drift | An SDK method absent from the contract fails generation. Every API capability has an SDK equivalent, verified by parity test | OPEN |
| **P2-293** | Code-level permission enforcement | P2-099 | Developer code running as a declared subject with that subject's permissions, and no privilege-elevation primitive | Code cannot read or write beyond its running subject, proven by two-subject test. An elevation attempt fails | OPEN |
| **P2-294** | Triggers and hooks in code | P2-152 | Before and after hooks on record lifecycle, with declared ordering relative to flows and validation | Hook ordering is deterministic and documented. A hook and a flow on one event execute in the declared order every time | OPEN |
| **P2-295** | Custom API endpoints | P2-011 | Developer-defined HTTP endpoints with routing, typed schemas, authentication, permissions and rate limits | An endpoint without an explicit permission declaration is unreachable. Its contract is published and validated | OPEN |
| **P2-296** | Escape hatch from every builder | P2-292 | The UX-2 mechanism: an in-place transition from any declarative artefact to code that preserves what was built | Converting a flow to code produces equivalent behaviour, verified differentially, and the conversion is documented per builder | OPEN |
| **P2-297** | In-browser code editor | P2-013 | The editor: syntax, types, completion from the SDK, inline errors, search and keyboard-complete operation | Completion reflects the workspace's own metadata. The editor is fully operable by keyboard and screen reader | OPEN |
| **P2-298** | Type generation from workspace metadata | P2-052 | Generated types for the workspace's objects, fields and queries, regenerated on metadata change | Renaming a field produces a type error in dependent code before deployment, not after | OPEN |
| **P2-299** | Command-line interface | P2-292 | A CLI for authentication, metadata pull and push, deployment, log streaming and test execution | Every portal capability has a CLI equivalent, verified by parity test. CI can drive a full deployment without a browser | OPEN |
| **P2-300** | Local development environment | P2-299 | Running and debugging developer code locally against a real workspace, with hot reload and source maps | A local change is exercised against real workspace metadata without deploying, and a breakpoint binds to original source | OPEN |
| **P2-301** | Source control integration | P2-052 | Metadata as files in the developer's own repository, with pull, push, diff and merge-conflict handling | A workspace is fully reconstructible from a git checkout. A merge conflict is presented semantically, not as raw text | OPEN |
| **P2-302** | CI/CD for developer applications | P2-299 | Pipeline templates running tests, security scans and deployment across the environment lanes | A developer application deploys through dev, test and staging with gates, driven entirely from CI | OPEN |
| **P2-303** | Dependency management for code | P2-107 | Declared third-party libraries with an allowlist, vulnerability scanning and reproducible resolution | An unvetted or vulnerable dependency fails the build. Resolution is reproducible from the lockfile alone | OPEN |
| **P2-304** | Debugging and log access | P2-164 | Structured logs, breakpoints, execution traces and log streaming, scoped to the developer's own workspace | A developer sees their own execution logs and never another workspace's, proven by test | OPEN |
| **P2-305** | Test framework for developer code | P2-020 | Unit and integration testing with metadata fixtures, mocked connectors and a coverage requirement | Publishing requires a declared coverage threshold on developer code, enforced at publish rather than requested | OPEN |
| **P2-306** | Asynchronous and background jobs | P2-169 | Queueable, scheduled and batch execution in code, with retry, dead-letter and visibility | A failed background job is visible, diagnosable and retryable without database access | OPEN |
| **P2-307** | Code observability and profiling | P2-126 | Per-execution metrics, flame profiles and limit-consumption reporting available to the developer | A slow execution is attributable to its statement from the profile alone | OPEN |
| **P2-308** | Static analysis and code standards | P2-303 | Lint, type checking, complexity limits and security rules applied to developer code at save and at publish | Code violating a security rule cannot be published. The gate is proven to fail on a deliberately introduced violation | OPEN |
| **P2-309** | Code review and approval workflow | P2-179 | Optional org-level review requirements before code reaches a promoted environment | An org requiring review cannot promote unreviewed code by any path, proven by test | OPEN |
| **P2-310** | Stage O containment proof | P2-290 | An adversarial suite attempting sandbox escape, resource exhaustion, cross-workspace access and permission elevation from developer code | Every attempt fails, and each control has a test that demonstrably fails when the control is removed | OPEN |

---

## 20. Stage P · Packaging, versioning and Marketplace publication (Wave 4)

The stage that makes this a *platform* rather than a *tool*. Salesforce managed packages and
ServiceNow update sets are the reference for the mechanics; the hard problem is not building a
package but **upgrading one that a tenant has customised**, which is `P2-330`–`P2-333`.

> **Marketplace boundary.** This stage delivers the *publisher* side — the package, its contract,
> its review, and the act of publishing. The Marketplace itself — discovery, listing, purchase,
> entitlement and billing — is Programme 3 and is deliberately not in this document. `P2-334` is the
> declared contract between them, and it is written so this programme can be finished and proven
> before Programme 3 begins.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-311** | Package artefact model | P2-052 | The package as a versioned, signed manifest of components with declared dependencies and a content hash | A package's content hash changes if any component changes. An unsigned package is refused at every consumption point | OPEN |
| **P2-312** | Component inclusion and boundary detection | P2-057 | Automatic determination of a package's complete component closure from the dependency graph | A package missing a required component is refused at build with the component named — not discovered at install | OPEN |
| **P2-313** | Semantic versioning and compatibility rules | P2-116 | Enforced semantic versioning derived from the actual metadata diff, not from the author's assertion | A breaking change published as a minor version is refused, with the breaking component named | OPEN |
| **P2-314** | Dependency declaration and resolution | P2-313 | Inter-package dependencies with version ranges, transitive resolution and conflict detection | An unsatisfiable dependency set is refused at build with the conflict explained. A diamond dependency resolves deterministically | OPEN |
| **P2-315** | Namespace enforcement in packages | P2-042 | All packaged components namespaced, with no unnamespaced component escaping into a tenant | Two packages defining the same object name install side by side without collision, proven by test | OPEN |
| **P2-316** | Package build pipeline | P2-311 | Reproducible builds from source metadata, with signing, provenance attestation and an SBOM | Two builds of one commit produce byte-identical packages. A tampered package fails signature verification | OPEN |
| **P2-317** | Installation engine | P2-314 | Transactional installation into a target workspace or tenant, with pre-flight checks and complete rollback | A failed installation leaves no partial component and no schema change, proven by fault injection at each step | OPEN |
| **P2-318** | Uninstallation and data disposition | P2-063 | Clean removal with an explicit, consented decision about the data the package created | Uninstalling leaves no orphaned table, policy or component. The data decision is recorded and honoured | OPEN |
| **P2-319** | Package data and seed content | P2-084 | Shipping reference and configuration data with a package, with upsert semantics and no overwriting of tenant edits | A reinstall does not revert a tenant's edits to seeded data, proven by test | OPEN |
| **P2-320** | Protected and locked components | P2-056 | Component-level protection controlling what an installing tenant may modify, and what the publisher may change later | A protected component cannot be edited by the tenant. An unprotected one cannot be silently overwritten on upgrade | OPEN |
| **P2-321** | Package environments and promotion | P2-023 | Promotion of a package through the developer's lanes with identical artefacts at each stage | The artefact tested in staging is bit-identical to the one published, verified by hash | OPEN |
| **P2-322** | Beta releases and pre-release channels | P2-321 | Pre-release versions installable only by invited tenants, clearly marked, with a graduation path | A beta cannot be installed by an uninvited tenant. Graduating a beta preserves installed instances | OPEN |
| **P2-323** | Trial, licensing and entitlement hooks | P2-034 | Per-package licensing primitives the application can check — seat counts, feature flags, expiry | An expired licence degrades the application as declared and never leaves it in an undefined state | OPEN |
| **P2-324** | Publisher security review pipeline | P2-308 | Automated review at publish: static analysis, permission scope justification, egress declaration, dependency scan, secret scan | A package requesting broad permissions without justification is refused. Every rejection names its rule | OPEN |
| **P2-325** | Manual review and certification | P2-324 | Human review for elevated-privilege and data-accessing packages, with a documented rubric and appeal path | A package cannot reach a certified tier without a recorded review against the published rubric | OPEN |
| **P2-326** | Package testing requirements | P2-305 | Enforced test and coverage requirements at publish, plus installation testing on a clean target | Publishing runs the package's own tests and a clean installation, and refuses on failure of either | OPEN |
| **P2-327** | Publisher listing metadata | P2-034 | Listing content, screenshots, documentation, support contact and pricing model — validated for completeness and truthfulness | A listing claiming a capability the package's manifest does not contain fails validation. This mirrors the H03 gate deliberately | OPEN |
| **P2-328** | Release notes and changelog discipline | P2-313 | Machine-checked release notes derived from the actual diff, with breaking changes called out | A release with an undocumented breaking change is refused at publish | OPEN |
| **P2-329** | Package metadata API and round-trip | P2-053 | The UX-1 mechanism at package scope: a package is buildable, inspectable and installable entirely by API | A package produced by the portal and one produced by the CLI from the same source are byte-identical | OPEN |
| **P2-330** | Upgrade engine | P2-317 | In-place upgrade with component diffing, additive-first strategy and a documented policy per change class | An upgrade across ten versions reaches the same state as a fresh install of the final version, verified by comparison | OPEN |
| **P2-331** | Customisation preservation on upgrade | P2-320 | The hard problem: preserving tenant customisations across an upgrade, with a declared layering model | A tenant customisation survives an upgrade that does not touch it, and produces a surfaced conflict when it does — never a silent revert | OPEN |
| **P2-332** | Upgrade impact analysis | P2-064 | The UX-3 mechanism at package scope: a pre-upgrade report of what changes, what breaks and what conflicts | The report's predictions match the actual upgrade outcome exactly, verified differentially across a fixture estate | OPEN |
| **P2-333** | Upgrade rollback and version pinning | P2-330 | Rollback to the prior version with data disposition declared, and tenant-side version pinning | A rolled-back upgrade restores the previous behaviour with data intact, proven by test | OPEN |
| **P2-334** | Marketplace publication contract | P2-327 | The declared, versioned interface Programme 3 consumes: package artefact, listing, entitlement events and support obligations | The contract is published and validated by a conformance test with a reference consumer, so Programme 3 can be built against it before it exists | OPEN |

---

## 21. Stage Q · Governance, limits, observability and cost (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-335** | The governor model, stated | P2-291 | Every governed resource named in one document with its limit, its scope, its enforcement point and its error code | An enforced limit absent from the registry fails a gate, and a registered limit with no enforcement fails too | OPEN |
| **P2-336** | Limit enforcement across every execution path | P2-335 | Uniform enforcement in flows, workflows, code, queries, connectors and AI, with one error taxonomy | Each limit is proven enforced on every path that can consume it, with no path exempt | OPEN |
| **P2-337** | Multi-tenant fairness and isolation under load | P2-291 | Scheduling and quotas ensuring one workspace cannot degrade another | A workspace deliberately consuming everything it is permitted does not measurably degrade another, under load | OPEN |
| **P2-338** | Usage metering | P2-283 | Metering of storage, execution, API calls, AI tokens and integration volume, attributed per workspace and per application | Metered totals reconcile with independently measured consumption within the stated tolerance | OPEN |
| **P2-339** | Cost attribution per application and workspace | P2-338 | Infrastructure cost allocated to workspace and application, so unit economics are answerable | Cost per published application is answerable from the data, not estimated | OPEN |
| **P2-340** | Quota policy and enforcement | P2-338 | Per-plan quotas with soft warning, hard limit and declared behaviour at each threshold | Crossing a soft limit warns and continues; crossing a hard limit stops with the limit named. Neither is silent | OPEN |
| **P2-341** | In-builder limit visibility | P2-335 | The UX-4 mechanism: every builder showing consumption against limit while the artefact is being built | An artefact approaching a limit shows it during construction, not at first production failure | OPEN |
| **P2-342** | Platform observability | P2-007 | Metrics, traces and logs across the developer plane with per-workspace scoping and retention | Any developer-reported issue is diagnosable from telemetry without reproducing it | OPEN |
| **P2-343** | Service level objectives and error budgets | P2-342 | SLOs for portal availability, build latency, execution latency and publication turnaround, with error budgets | An SLO breach is detected and alerted from real data, and the alert has been proven to fire | OPEN |
| **P2-344** | Incident response for the developer plane | P2-343 | Runbooks, escalation, developer-facing status communication and post-incident review | A rehearsed incident produces developer notification within the stated window, verified by rehearsal, not assertion | OPEN |
| **P2-345** | Deprecation and breaking-change policy | P2-313 | The published policy for deprecating a platform capability developers depend on: notice period, migration path, enforcement | A capability cannot be removed without its deprecation window having elapsed, enforced mechanically | OPEN |
| **P2-346** | Compliance evidence for the developer plane | P2-012 | Audit, retention, access review and data-handling evidence sufficient for the platform's compliance obligations | Every control claimed in the compliance set has evidence generated by a mechanism, not written by hand | OPEN |
| **P2-347** | Developer support and escalation | P2-037 | Support channels, ticketing, severity model and escalation into platform engineering | A developer-reported platform defect reaches the owning team with reproduction and context attached | OPEN |
| **P2-348** | Documentation generated from contracts | P2-292 | API, SDK and CLI reference generated from the same contracts the code uses, so it cannot drift | A contract change without a documentation update is impossible — documentation is regenerated and drift fails CI | OPEN |

---

## 22. Stage R · Testing and production readiness (Wave 5)

The test disciplines that apply to this programme specifically. Programme 1's Track J owns the
platform-wide estate; these are the plane-4 additions and the two exit proofs.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P2-349** | Coverage that can fail | P2-020 | Coverage measurement across the programme's repositories with `all: true`, real thresholds and a ratchet | Deleting a test lowers the measured number and fails the gate. The threshold has been proven to fail | OPEN |
| **P2-350** | Unit and component test estate | P2-349 | Unit coverage of every engine — metadata, expression, compilation, permission, execution — at the declared threshold | The threshold is met without coverage-padding tests, verified against the padding inventory rule | OPEN |
| **P2-351** | Integration testing against real infrastructure | P2-090 | Integration suites against a real database, real queue and real object store — no mocked persistence | The suite runs against real Postgres in CI. A test passing against a mock and failing against the real database is caught | OPEN |
| **P2-352** | Contract testing across every boundary | P2-334 | Consumer-driven contract tests for the platform client, the SDK, the CLI, connectors and the Marketplace contract | A breaking change on either side of any boundary fails the contract test before it reaches a consumer | OPEN |
| **P2-353** | End-to-end journeys | P2-036 | Automated journeys: signup to published application, build to install, upgrade, and rollback | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P2-354** | Two-workspace isolation testing, universally | P2-005 | An isolation test for every table, endpoint, query, report and AI surface in the programme | A surface without an isolation test fails a coverage gate. Every test proves workspace B gets **zero** rows | OPEN |
| **P2-355** | Performance and load testing | P2-017 | Load profiles for the builders, the execution engines and the record runtime, with regression detection | A performance regression beyond threshold fails CI on the reference profile | OPEN |
| **P2-356** | Soak, endurance and resource-leak testing | P2-355 | Long-running tests detecting memory leaks, connection exhaustion and unbounded growth | A 24-hour soak shows no unbounded resource growth, measured and charted | OPEN |
| **P2-357** | Accessibility audit across the estate | P2-018 | A full WCAG 2.2 AA audit of every portal surface and every generated surface, including all canvases | The estate is `axe` clean and passes manual keyboard and screen-reader review. A regression fails CI | OPEN |
| **P2-358** | Security testing and penetration exercise | P2-108 | Automated security scanning plus a structured penetration exercise against the developer plane | Every finding is remediated or explicitly accepted with a stated reason. Each remediation has a test that fails without it | OPEN |
| **P2-359** | Chaos and disaster-recovery rehearsal | P2-086 | Failure injection at every tier plus a rehearsed recovery from backup to a stated recovery point | A rehearsed recovery meets the stated objective, and the rehearsal is repeated on a schedule with recorded results | OPEN |
| **P2-360** | The platform-parity proof | P2-353 | The invariant from § 1 made mechanical: a UniERP business module rebuilt using only portal capabilities, with every gap filed as a defect | The rebuild is functionally equivalent, and every platform capability the portal could not express is filed in `90-DEFECT-LOG.md` with a reproduction | OPEN |
| **P2-361** | The time-to-first-app proof | P2-019 | The UX-7 metric enforced: an unassisted stranger builds and publishes a working application, measured end to end | A first-time developer publishes an application in under an hour, unaided, recorded. A release regressing the metric fails the gate | OPEN |
| **P2-362** | Programme 2 launch readiness | P2-360 | The final review: every track exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 23 is ticked with evidence. An unticked box blocks the programme's completion — it does not become a footnote | OPEN |

---

## 23. Programme exit criteria

- [ ] **A third-party developer can build anything the UniERP team can build, through the portal** (P2-360)
- [ ] A stranger publishes a working application, unaided, in under an hour (P2-361)
- [ ] Metadata round-trips losslessly through export, import, API, CLI and package (P2-052, P2-329)
- [ ] No table exists without `tenantId`, `workspaceId` and an RLS policy (P2-005, P2-073)
- [ ] Every surface has a two-workspace isolation test proving **zero** rows, not filtered rows (P2-354)
- [ ] Permission decisions are enforced by the database, and the application layer never disagrees with it (P2-099)
- [ ] Sandbox escape, privilege escalation and cross-workspace access all fail — and each control has a test that fails when it is removed (P2-108, P2-310)
- [ ] A killed process resumes flows and workflows with no step lost and none executed twice (P2-172, P2-192)
- [ ] Money is `Decimal(19,4)` end to end; a `Float` in a money path fails CI (P2-195)
- [ ] One expression language, one parser, one set of null semantics across all seven builders (P2-193)
- [ ] Every builder canvas is fully operable by keyboard and comprehensible by screen reader (P2-166, P2-357)
- [ ] Every generated form, page, report and dashboard is WCAG 2.2 AA (P2-140, P2-218, P2-243)
- [ ] Impact analysis precedes every destructive change and its predictions match the outcome (P2-064, P2-332)
- [ ] A tenant customisation survives an upgrade, or produces a surfaced conflict — never a silent revert (P2-331)
- [ ] With AI residency set to local, tenant data provably cannot leave (P2-267, P2-288)
- [ ] Every governed limit is registered, enforced on every path, and visible while building (P2-335, P2-341)
- [ ] Cost per published application is answerable from measured data (P2-339)
- [ ] Documentation is generated from contracts and cannot drift (P2-348)
- [ ] Coverage thresholds have been proven able to fail (P2-349)
- [ ] Every UI primitive lives in `unierp-design-system` with a story; zero hardcoded colours or spacing (P2-013)
- [ ] The programme is executable against a partially finished Programme 1, with every precondition asserted rather than assumed (P2-004)

---

## 24. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 2 established (P2-001–P2-362), the Developer Portal.** Registered per README § 0 rule 1 in one commit: README § 3 table, `DECLARED` and `TRACK_FILES` in `check-plan-integrity.mjs`, `TRACKS` in `phase-brief.mjs`, the manifest via `--update`, and this reason. Rather than widen nine `[A-M]` regexes a second time — the D045 failure mode recorded in README § 6 — the phase-ID shape was extracted to `scripts/lib/programme-ids.mjs` and the three scripts now import it. `start.mjs` gains `--programme <n>`, which scopes wave resolution and phase selection so the two programmes cannot contend. Programme 2 uses a three-digit phase number because a two-digit field cannot hold 300+ phases; Programme 1's IDs are untouched and stay two-digit permanently. Cross-programme dependencies are forbidden in the `Depends` column (§ 0) and discharged instead by the P2-004 runtime precondition gate, so this programme is executable against a partially finished Programme 1. | Claude Code |
