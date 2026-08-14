# PROGRAMME 12 · PLATFORM CORE AND RUNTIME — P12-001–P12-330

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 12` resolves waves from this
> document and can only ever hand out a `P12-` phase.

---

## 0. Why this programme exists

Programmes 2–11 were reviewed against the repository list on 2026-08-14. **Twenty-one of the
twenty-nine repositories were named by no programme at all** — including the identity provider, the
API contracts, the data layer, the kernel and the extension sandbox.

That was not a small omission. Every other programme *consumes* these: Programme 2 generates typed
clients from `unierp-contracts`, Programme 6 builds its entire identity surface on `unierp-idp`,
Programme 4 posts through `unierp-data`, Programme 9 pins the generated client. **All twelve depend
on code that nobody was assigned to evolve.** Track A (31/31) was Programme 1's foundation pass, not
a standing owner.

This programme is that owner.

**The independence rule holds here as everywhere:** no phase may name another programme's phase in
its `Depends` cell, and `P12-005` is the runtime precondition gate. But this programme sits on the
other side of that relationship from most: it is the one whose outputs other programmes assert. So
one extra rule applies, and `P12-003` enforces it:

> **A breaking change to a contract, a shared type, an event schema or an auth behaviour is not this
> programme's decision alone to make.** It is versioned, deprecated with a window, and its consumers
> are enumerated from the dependency graph before it lands.

---

## 1. What this programme owns

The **server-side platform runtime** — the code beneath every surface:

| Repository | Files | Role |
| :--------- | ----: | :--- |
| `unierp-idp` | 407 | Identity provider — authentication, federation, tokens |
| `unierp-data` | 370 | Prisma schema, migrations, the 1,836-model data layer |
| `unierp-shared` | 266 | Shared libraries used across every service |
| `unierp-framework` | 127 | The application framework services are built on |
| `unierp-extensions` | 119 | First-party extension implementations |
| `unierp-sandbox` | 93 | The extension execution sandbox |
| `unierp-blockchain` | 90 | Ledger and attestation integration |
| `unierp-contracts` | 83 | **API contracts every client is generated from** |
| `unierp-infra` | 47 | Infrastructure definitions |
| `unierp-auth` | 43 | Authorization primitives |
| `unierp-extension-api` | 40 | The contract extensions implement |
| `unierp-kernel` | 38 | Core runtime primitives |
| `unierp-service-kit` | 32 | Service scaffolding |
| `unierp-sdk` | 23 | Published client SDK |
| `unierp-config` | 22 | Shared configuration |
| + `unierp-platform`, `unierp-storybook`, `unierp-corporate-site-template`, `unierp-loop-a/b/c` | ~500 | Aggregation, component docs, templates, agent worktrees |

**The invariant this programme establishes:**

> **A consumer of the platform core cannot be broken by it silently.** Every contract, type, event
> and auth behaviour is versioned, its consumers are enumerable, and a breaking change to any of
> them fails a build before it reaches anyone.

`P12-328` is its mechanical proof: a deliberately breaking change to each artefact class is
introduced, and every affected consumer's build is asserted to fail.

### Verified starting position

Measured 2026-08-14, not asserted:

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Repositories owned | **21** | `ls -d unierp-*/` cross-referenced against every programme document |
| Programmes naming them | **0** | `grep -l <repo> docs/programme/3*.md` per repository |
| Total files | ~1,780 | `find <repo> -type f -not -path '*/node_modules/*'` summed |
| Prisma schema | 31,092 lines at last measurement (**D001**) | `90-DEFECT-LOG.md` |

Two things about this starting position are load-bearing and are faced rather than assumed.

**First, these repositories are not greenfield and not idle** — `unierp-idp` alone is 407 files.
`P12-002` measures what is actually there before any phase claims to extend it.

**Second, the defect log already contains findings against this code that no programme owned, so
none were routed to an owner.** `D001` (a 31,092-line schema against a stated 3,000-line ceiling),
`D008` (a `workspace:*` dependency escaping its workspace), `D148` (a shared-library test asserting
a path that moved). `P12-004` sweeps the defect log for findings landing in these repositories and
routes each to a phase in this programme — because a defect filed against an unowned repository is a
defect nobody will ever fix.

**Reference set.** Auth0 and Keycloak (identity provider architecture and federation), Stripe and
Twilio (API contract versioning and deprecation policy as a product discipline), Prisma and
Hasura (schema-first data layers at scale), gRPC and OpenAPI (contract evolution and compatibility
rules), Deno and Cloudflare Workers (sandboxed untrusted execution), NestJS (the framework model
already in use), and semantic-release / changesets for mechanical version discipline.

---

## 2. Engineering principles

| # | Principle | Enforced by |
| :- | :-------- | :---------- |
| **EP-1** | **The contract is the product.** Consumers depend on the contract, never on an implementation detail, and the contract is generated from one source. | `P12-081` |
| **EP-2** | **Compatibility is checked, not remembered.** Every change is classified as compatible or breaking by a tool, not by the author. | `P12-085` |
| **EP-3** | **Consumers are enumerable.** "Who uses this?" is answerable before a change, across all twelve programmes. | `P12-007` |
| **EP-4** | **Deprecation has a window and a mechanism.** Nothing is removed until its window elapses, enforced by build. | `P12-088` |
| **EP-5** | **The security boundary is the runtime, not convention.** Extension and tenant isolation is enforced where it cannot be argued with. | `P12-176` |
| **EP-6** | **The schema is decomposed and bounded.** No single Prisma file grows past its stated ceiling again. | `P12-042` |
| **EP-7** | **This programme ships libraries, so its own quality gates are stricter, not looser.** | `P12-020` |

---

## 3. Waves

### Wave 0 · "Find out what is actually here"
**Phases:** P12-001–P12-024 · Ownership, measurement, the orphaned-defect sweep, and the consumer graph.

### Wave 1 · "Contracts and data"
**Phases:** P12-025–P12-110 · The data layer, the schema decomposition, and the contract discipline every consumer depends on.

### Wave 2 · "Identity"
**Phases:** P12-111–P12-170 · The identity provider and authorization primitives.

### Wave 3 · "Runtime and isolation"
**Phases:** P12-171–P12-240 · Kernel, framework, service kit, the extension sandbox and its security boundary.

### Wave 4 · "Distribution"
**Phases:** P12-241–P12-296 · SDK, packaging, publishing, infrastructure and configuration.

### Wave 5 · "Proof"
**Phases:** P12-297–P12-330 · The test estate and the no-silent-break proof.

---

## 4. Stage A · Ownership and measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-001** | Programme charter and repository claim | — | A manifest claiming the 21 repositories in § 1, with each one's role and its consumers declared | A P12 commit touching a repository outside the claim fails CI. A claimed repository with no declared role fails CI | DONE |
| **P12-002** | The unowned-code census | P12-001 | Every claimed repository measured: what it does, what is reachable, what is tested, what is dead, what other repositories import from it | The census is reproducible by command and published as data. Every repository has a measured profile | DONE |
| **P12-003** | The breaking-change rule, declared and enforced | P12-002 | The § 0 rule made mechanical: contract, type, event and auth changes classified, versioned, and consumer-checked before landing | An unclassified change to a published artefact fails CI. The gate is proven to fail on a seeded breaking change | DONE |
| **P12-004** | Orphaned-defect sweep | P12-002 | Every `90-DEFECT-LOG.md` finding landing in a claimed repository — including D001, D008 and D148 — routed to a phase in this programme | Every such finding has an owning phase or a recorded reason it needs none. An unrouted finding fails the sweep | DONE |
| **P12-005** | Runtime precondition gate | P12-001 | Startup and CI assertion of each external capability this programme consumes, with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | DONE |
| **P12-006** | Repository dependency graph | P12-002 | The real graph of which repository imports what from which, generated from source | The graph is generated, not maintained. A cycle between repositories fails the gate | DONE |
| **P12-007** | Consumer registry | P12-006 | The EP-3 mechanism: for any published artefact, the complete list of consumers across all twelve programmes | "Who uses this?" is answerable by command for every exported symbol, contract and event | DONE |
| **P12-008** | Standalone build for every claimed repository | P12-002 | Each repository building, typechecking, linting and testing from a clean clone with no sibling present | Every claimed repository builds standalone. A `workspace:*` escaping its workspace fails CI — closing **D008** | DONE |
| **P12-009** | Cross-repository CI | P12-008 | CI that builds a change against every dependent repository, not only its own | A change breaking a dependent is caught in that change's CI, not in the dependent's later | DONE |
| **P12-010** | Versioning policy | P12-003 | Semantic versioning across all published packages, derived from the actual diff | A breaking change published as a minor version is refused, with the breaking symbol named | DONE |
| **P12-011** | Release and changelog automation | P12-010 | Mechanical version bumps and changelogs generated from the change set | A release's notes derive from its diff and cannot be hand-written, verified by generation | DONE |
| **P12-012** | Dependency governance | P12-008 | Allowlisted dependencies with size, licence, maintenance and vulnerability policy across 21 repositories | An unvetted or vulnerable dependency fails the build with its advisory named | DONE |
| **P12-013** | Supply-chain integrity | P12-012 | SBOM, provenance attestation and signature verification for every published package | An unsigned or unattested package cannot be published or consumed, proven by test | DONE |
| **P12-014** | Structured logging standard | P12-002 | One logging contract every service uses, with correlation propagation | A service logging outside the standard fails a gate. A request is traceable across service boundaries | DONE |
| **P12-015** | Error taxonomy for the platform core | P12-014 | The shared error hierarchy every service and consumer maps to | Every thrown error carries a registry code. An uncoded error fails `check-error-handling.mjs` | DONE |
| **P12-016** | Configuration standard | P12-002 | Validated configuration schema shared across services, with no secret in source or bundle | A missing required variable fails startup by name. A scan finds zero secrets across 21 repositories | WIP |
| **P12-017** | Observability standard | P12-014 | Metric, trace and log conventions every service implements identically | A service emitting off-standard telemetry fails a gate | OPEN |
| **P12-018** | Health and readiness contract | P12-017 | A uniform health and readiness interface across every service | Every service exposes the contract; one that does not fails the gate | OPEN |
| **P12-019** | Repository hygiene | P12-008 | Consistent structure, licensing, contribution rules and no stray artefacts across 21 repositories | A committed evidence file or stray document at a repository root fails CI — the **D145** shape | OPEN |
| **P12-020** | Stricter quality gates for shipped libraries | P12-008 | The EP-7 mechanism: higher coverage, stricter lint and public-API documentation requirements than application code | A library below the library threshold fails, even where an application would pass | OPEN |
| **P12-021** | Dead code and unused export removal | P12-002 | Removing what the census finds unreachable across the claimed repositories | Unreachable code is removed or justified. `check-orphaned-exports.mjs` is clean | OPEN |
| **P12-022** | Test harness for platform libraries | P12-020 | The shared substrate: contract fixtures, two-tenant helpers, clock control, fault injection | A platform-core test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |
| **P12-023** | Documentation generated from source | P12-007 | Public API documentation generated from contracts and types, never written twice | Documentation regenerates from source; drift fails CI | OPEN |
| **P12-024** | Remediation backlog | P12-002 | The census and the sweep turned into a prioritised, tracked backlog routed to this programme's phases | Every measured defect class is routed to a phase; an unrouted class fails the gate | OPEN |

---

## 5. Stage B · The data layer (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-025** | Schema ownership and structure | P12-002 | `unierp-data` as the single owner of the schema, with module boundaries inside it | A model defined outside `unierp-data` fails a gate | OPEN |
| **P12-026** | Schema measurement | P12-025 | The real schema measured: models, fields, relations, indexes, file sizes, generated size | Every measurement is reproducible by command and tracked over time | OPEN |
| **P12-027** | Tenant column and RLS universality | P12-026 | Every tenant-scoped table carrying `tenantId` and an RLS policy, with exemptions individually justified | A table without both fails `check-rls-verify.mjs`. Every exemption has a recorded reason | OPEN |
| **P12-028** | RLS policy generation | P12-027 | Policies generated from the model rather than hand-written per table | A hand-written policy diverging from its model is detected. Generation is idempotent | OPEN |
| **P12-029** | RLS verification against runtime DDL | P12-028 | Verifying policies on tables created at runtime, not only those in the schema file | Runtime-created tables are covered — closing **D143** for `co_*` and `ext_*` tables | OPEN |
| **P12-030** | Money type discipline | P12-026 | `Decimal(19,4)` with explicit currency everywhere money appears in the schema | A `Float` in a money path fails CI. A bare amount without a currency does not typecheck | OPEN |
| **P12-031** | Naming and modelling conventions | P12-026 | Enforced conventions for models, fields, relations, enums and indexes | A convention violation fails `check-naming-convention.mjs`, proven on a seeded example | OPEN |
| **P12-032** | Index policy and coverage | P12-026 | Indexes for every foreign key, tenant scope and common query shape, with an advisor for the rest | A foreign key without an index fails the gate. The advisor's proposals are measurably effective | OPEN |
| **P12-033** | Migration discipline | P12-025 | Forward-only migrations, immutable once shipped, with tested rollback | Replaying every migration from empty reproduces the schema exactly. Editing a shipped migration fails CI | OPEN |
| **P12-034** | Migration safety analysis | P12-033 | Classifying every migration by lock risk, data risk and reversibility before it runs | A locking migration on a large table is refused without an online strategy | OPEN |
| **P12-035** | Online schema change | P12-034 | Adding and altering columns without blocking traffic on large tables | A column is added to a 10-million-row table with no write blocked beyond the stated threshold, measured | OPEN |
| **P12-036** | Seed and fixture data | P12-033 | Deterministic seed data and the shared fixture set every programme's tests use | Two seed runs produce identical data. Every programme's tests can use the shared fixtures | OPEN |
| **P12-037** | Prisma client generation and distribution | P12-025 | The generated client packaged and consumed identically by every service | Every consumer uses the same generated client version; a divergence fails a gate | OPEN |
| **P12-038** | Query safety | P12-037 | Parameterisation throughout, with raw SQL confined to reviewed, parameterised helpers | String-concatenated SQL fails a lint gate, proven on a seeded example | OPEN |
| **P12-039** | Connection and pool management | P12-037 | Pooling, limits, timeouts and per-tenant fairness | Pool exhaustion by one tenant is prevented, proven under adversarial load | OPEN |
| **P12-040** | Transaction and isolation standard | P12-037 | Declared transaction boundaries and isolation levels used consistently across services | A concurrent conflict produces a documented, retryable error rather than a lost update | OPEN |
| **P12-041** | Soft delete and archival primitives | P12-025 | Shared soft-delete, archive and restore semantics rather than per-module reinvention | A module implementing its own soft-delete fails an architecture gate | OPEN |
| **P12-042** | Schema decomposition | P12-031 | The EP-6 mechanism: `core.prisma` split so no `.prisma` file exceeds the stated ceiling — closing **D001** | No `.prisma` file exceeds 3,000 lines, enforced by `check-schema-size.mjs`. The generated client is identical before and after, verified by comparison | OPEN |
| **P12-043** | Schema lint rules | P12-031 | Automated schema review: missing indexes, nullable foreign keys, unbounded strings, missing cascades | Each lint rule fires on a seeded violation and is silent on a clean schema | OPEN |
| **P12-044** | PII registry and classification | P12-026 | Every personal-data field registered with purpose, basis and retention | An unregistered personal-data field fails `check-pii-registry.mjs` | OPEN |
| **P12-045** | Field-level encryption primitives | P12-044 | Shared encryption for classified fields, with key management and rotation | A field marked PII is unreadable in a database dump, verified by inspection | OPEN |
| **P12-046** | Retention primitives | P12-044 | Shared retention execution, legal hold and purge used by every module | A module implementing its own retention fails an architecture gate | OPEN |
| **P12-047** | Audit primitives | P12-041 | Shared, append-only, immutable audit used by every module | Audit records cannot be updated or deleted by any application path, proven by test | OPEN |
| **P12-048** | The outbox | P12-040 | The transactional outbox every cross-module effect goes through | An event and its causing write commit atomically. Killing the process between them is proven impossible | OPEN |
| **P12-049** | Event schema registry | P12-048 | Versioned schemas for every domain event, with compatibility rules | An event without a registered schema cannot be published. A schema change is versioned, not mutated | OPEN |
| **P12-050** | Event delivery and ordering | P12-049 | Delivery guarantees, ordering, retry and dead-letter for the outbox | A redelivered event produces no duplicate effect. A subscriber offline for an hour loses nothing | OPEN |
| **P12-051** | Database performance at volume | P12-032 | Query and write performance within budget at production data volume | Targets met at 100 million rows on the reference profile, measured | OPEN |
| **P12-052** | Multi-tenant data isolation proof | P12-028 | An isolation test for every table in the schema, generated rather than written by hand | Every table has an isolation test proving **zero** cross-tenant rows. A new table without one fails CI | OPEN |
| **P12-053** | Schema change impact analysis | P12-007 | Before a schema change, the complete list of affected services, queries and generated clients | A change breaking a consumer is reported before it lands, naming the consumer | OPEN |
| **P12-054** | Database backup and restore primitives | P12-033 | Shared backup, restore and point-in-time recovery interfaces | A restore rehearsal reproduces a chosen point exactly, verified by comparison | OPEN |
| **P12-055** | Stage B data proof | P12-052 | A property-based suite over generated schema states asserting isolation, integrity and migration reversibility | No invariant violation across generated states, and immediate detection when one is weakened | OPEN |

---

## 6. Stage C · Contracts and the SDK surface (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-056** | Contract ownership and source of truth | P12-006 | `unierp-contracts` as the single source every client, SDK and type is generated from | A hand-written client or type duplicating a contract fails an architecture gate | OPEN |
| **P12-057** | Contract format and structure | P12-056 | The declared contract representation, its structure and its validation | A malformed contract fails the build. Every contract validates against the meta-schema | OPEN |
| **P12-058** | Contract coverage of the API surface | P12-057 | Every endpoint across all services represented in the contracts | An endpoint absent from the contracts fails a gate, proven on a seeded endpoint | OPEN |
| **P12-059** | Request and response schema completeness | P12-058 | Full typed schemas including error shapes, not only success paths | A response shape absent from the contract fails a gate, including error responses | OPEN |
| **P12-060** | Contract validation at runtime | P12-059 | Services validating requests and responses against their own contracts | A response diverging from its contract fails in test and is caught before release | OPEN |
| **P12-061** | Client generation | P12-057 | Typed clients generated for every consuming language and runtime | Every consumer's client is generated; a hand-edited generated file fails CI | OPEN |
| **P12-062** | TypeScript client and types | P12-061 | The generated TypeScript client used by web, developer portal, console and sites | A contract change producing an incompatible call fails the consumer's build | OPEN |
| **P12-063** | Dart client generation | P12-061 | The generated Dart client for the mobile application | The Dart client is generated from the same contracts, verified by differential test | OPEN |
| **P12-064** | Client generation determinism | P12-061 | Identical contracts producing byte-identical clients | Two generations of one contract set are byte-identical, verified by hash | OPEN |
| **P12-065** | Pagination, filtering and sorting conventions | P12-059 | One convention across every list endpoint | An endpoint deviating from the convention fails a gate | OPEN |
| **P12-066** | Error response convention | P12-015 | One error shape across every endpoint, carrying the registry code | An off-convention error response fails a gate, proven on a seeded endpoint | OPEN |
| **P12-067** | Idempotency convention | P12-059 | Idempotency keys as a contract-level concern on every mutating endpoint | A mutating endpoint without idempotency support fails a gate | OPEN |
| **P12-068** | Rate limit and quota headers | P12-066 | Uniform rate-limit signalling so every client can back off correctly | Every rate-limited response carries the standard headers, verified across endpoints | OPEN |
| **P12-069** | API versioning strategy | P12-010 | The declared versioning model — how a version is expressed, supported and retired | A version retired inside its support window is refused, enforced mechanically | OPEN |
| **P12-070** | Contract compatibility checking | P12-069 | Automated classification of every contract change as compatible or breaking | A breaking change is detected and classified automatically, proven on a seeded change | OPEN |
| **P12-071** | Deprecation mechanism | P12-070 | Marking, signalling and enforcing deprecation windows on contract elements | A deprecated element still works and warns; removal inside its window is refused | OPEN |
| **P12-072** | Consumer-driven contract tests | P12-007 | Every consumer's expectations expressed as tests the provider runs | A provider change breaking a consumer fails in the provider's CI, not the consumer's | OPEN |
| **P12-073** | Contract documentation generation | P12-023 | API reference generated from contracts for every consuming audience | Documentation regenerates from contracts; drift fails CI | OPEN |
| **P12-074** | SDK architecture | P12-062 | `unierp-sdk` as the supported public interface, layered over the generated client | An SDK capability absent from the contracts fails the parity test | OPEN |
| **P12-075** | SDK ergonomics and surface | P12-074 | Authentication, retry, pagination, error handling and typing handled by the SDK | Common operations require no boilerplate, verified against a task list | OPEN |
| **P12-076** | SDK versioning and compatibility | P12-069 | SDK versions mapped to API versions with a stated support matrix | An SDK used against an unsupported API version fails clearly, not obscurely | OPEN |
| **P12-077** | SDK documentation and examples | P12-073 | Generated reference plus runnable, tested examples | Every example executes in CI; a broken example fails the build | OPEN |
| **P12-078** | Webhook and event contracts | P12-049 | Outbound event payloads contracted and versioned like endpoints | An event payload change is classified and versioned like an API change | OPEN |
| **P12-079** | Extension API contract | P12-056 | `unierp-extension-api` as the versioned contract extensions implement | An extension built against an older contract version continues to work within its window | OPEN |
| **P12-080** | Contract governance | P12-070 | Review requirements for contract changes proportionate to their blast radius | A breaking contract change cannot land without the declared review, proven by test | OPEN |
| **P12-081** | The single-source proof | P12-061 | The EP-1 mechanism: every client, type, SDK method and document derived from the contracts, with nothing hand-maintained | A hand-maintained duplicate of any contract-derived artefact is detected and fails CI | OPEN |
| **P12-082** | Contract performance implications | P12-065 | Contract shapes that do not force N+1 access or over-fetching on consumers | An endpoint forcing a waterfall on a documented consumer journey is reported | OPEN |
| **P12-083** | Contract security review | P12-059 | Every contract reviewed for over-exposure, mass assignment and enumeration risk | A contract exposing a field its permission model does not cover fails review | OPEN |
| **P12-084** | Contract testing infrastructure | P12-072 | The harness consumers and providers both use for contract testing | A contract test is writable without new infrastructure, and the harness has its own tests | OPEN |
| **P12-085** | The compatibility proof | P12-070 | The EP-2 mechanism: a corpus of compatible and breaking changes, each classified correctly | Every change in the corpus is classified correctly, and a misclassification is caught | OPEN |
| **P12-086** | Contract change impact reporting | P12-007 | Before a contract change lands, the enumerated list of affected consumers | The reported consumer set equals the actually affected set, verified differentially | OPEN |
| **P12-087** | Multi-version operation | P12-069 | Serving several API versions simultaneously with a shared implementation | Two API versions serve correctly from one implementation, proven by test | OPEN |
| **P12-088** | The deprecation-window proof | P12-071 | The EP-4 mechanism: removal blocked until the window elapses, enforced by build | Removing an element inside its window fails CI, proven on a seeded removal | OPEN |
| **P12-089** | Contract registry and discovery | P12-057 | A queryable registry of every contract, version, consumer and deprecation state | Any contract's state and consumers are answerable by command | OPEN |
| **P12-090** | Stage C contract proof | P12-085 | A suite asserting generation determinism, compatibility classification, consumer enumeration and deprecation enforcement | All four hold, and each fails when its mechanism is deliberately removed | OPEN |

---

## 7. Stage D · Shared libraries and the framework (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-091** | Shared library boundaries | P12-006 | What belongs in `unierp-shared` versus a service, with the rule enforced | A service-specific utility in the shared library fails a gate, and vice versa | OPEN |
| **P12-092** | Shared library public API | P12-081 | An explicit, documented, versioned public surface rather than incidental exports | An import of a non-public symbol fails a gate, proven on a seeded import | OPEN |
| **P12-093** | Utility and helper consolidation | P12-002 | Duplicated helpers across repositories consolidated into one implementation | `check-duplication.mjs` reports no duplicate helper above threshold across claimed repositories | OPEN |
| **P12-094** | Shared type definitions | P12-062 | Domain types shared rather than redeclared per service | A redeclared shared type fails a gate, proven on a seeded duplicate | OPEN |
| **P12-095** | Validation primitives | P12-059 | One validation approach used by every service, aligned with the contracts | A service using a second validation approach fails an architecture gate | OPEN |
| **P12-096** | Date, time and timezone primitives | P12-094 | Shared, correct temporal handling used everywhere | Temporal arithmetic matches expected values across a DST and timezone fixture set | OPEN |
| **P12-097** | Decimal and money primitives | P12-030 | Shared money type and arithmetic that never leaves Decimal | Money arithmetic matches hand computation across a rounding edge-case suite | OPEN |
| **P12-098** | Identifier primitives | P12-094 | Shared identifier generation, validation and formatting | Identifier generation is collision-free under concurrency, proven by test | OPEN |
| **P12-099** | Localisation primitives | P12-096 | Shared message, formatting and locale resolution used by every service | A service implementing its own locale handling fails an architecture gate | OPEN |
| **P12-100** | Framework architecture | P12-091 | `unierp-framework` as the declared application framework services are built on | A service bypassing the framework's request lifecycle fails an architecture gate | OPEN |
| **P12-101** | Request lifecycle and middleware | P12-100 | The declared request pipeline: context, auth, validation, handler, serialisation, audit | Every request traverses the full pipeline; a bypass is impossible, proven by test | OPEN |
| **P12-102** | Tenant context propagation | P12-101 | Tenant context established once and propagated through every layer including jobs and events | A database query executing without tenant context fails, proven by test | OPEN |
| **P12-103** | Service scaffolding | P12-100 | `unierp-service-kit` generating a service that is compliant by construction | A scaffolded service passes every platform gate with no manual step | OPEN |
| **P12-104** | Controller and service decomposition rules | P12-100 | Enforced separation: controllers route, services hold logic | A controller containing logic fails `check-controller-decomposition.mjs` | OPEN |
| **P12-105** | Dependency injection and composition | P12-100 | Explicit composition with testable substitution across services | Every dependency is substitutable in tests without global mutation | OPEN |
| **P12-106** | Background job framework | P12-050 | Shared scheduling, queueing, retry, dead-letter and visibility | A service implementing its own job runner fails an architecture gate | OPEN |
| **P12-107** | Caching primitives | P12-100 | Shared caching with declared keys, lifetimes, tenant scoping and invalidation | A cache entry without a declared lifetime and tenant scope cannot exist | OPEN |
| **P12-108** | File and object storage primitives | P12-100 | Shared storage with scanning, content verification, signed access and quota | A service accessing object storage outside the primitive fails a gate | OPEN |
| **P12-109** | Search primitives | P12-100 | Shared indexing and query interfaces with permission filtering applied centrally | Search never returns a record the subject may not read, proven by two-tenant test | OPEN |
| **P12-110** | Stage D framework proof | P12-102 | A suite asserting pipeline completeness, tenant propagation and primitive adoption across every service | Every service traverses the pipeline with context intact, and a bypass is caught immediately | OPEN |

---

## 8. Stage E · Identity and authorization (Wave 2)

`unierp-idp` is 407 files and is the single most security-critical repository in the family. Every
programme's authentication asserts against it, and until now nobody owned it.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-111** | Identity provider census | P12-002 | The 407 files measured: what is implemented, what is reachable, what is tested, what is standards-conformant | The census is reproducible by command; every capability has a measured state | OPEN |
| **P12-112** | Identity threat model | P12-111 | The written threat model for the identity plane, each threat mapped to a control and a test | Every identified threat has a test that fails when its control is removed | OPEN |
| **P12-113** | Principal model | P12-111 | The declared principal types — tenant user, provider staff, developer, publisher, service — and their separation | A principal of one type cannot authenticate to another's surface, proven per pair | OPEN |
| **P12-114** | Credential storage | P12-112 | Modern password hashing with per-credential parameters and upgrade on verify | No credential is recoverable from the database, verified by inspection | OPEN |
| **P12-115** | Password policy and breach checking | P12-114 | Configurable strength, breach checking, history and rotation | A breached password is refused at set time, verified against a known-breached corpus | OPEN |
| **P12-116** | Session model | P12-113 | Session issuance, rotation, idle and absolute expiry, and binding | Session fixation and replay after logout each fail, proven by tests that fail when their defence is removed | OPEN |
| **P12-117** | Token architecture | P12-116 | Token format, claims, lifetime, audience and signing across every consumer | A token accepted by the wrong audience is impossible, proven by test | OPEN |
| **P12-118** | Token signing and key rotation | P12-117 | Signing key management with rotation that does not invalidate live sessions | Key rotation completes with no valid session broken, verified by rehearsal | OPEN |
| **P12-119** | Refresh and rotation-reuse detection | P12-117 | Refresh rotation with reuse detection and family revocation | A stolen refresh token is detected on reuse and its family revoked, proven by test | OPEN |
| **P12-120** | Multi-factor authentication | P12-116 | TOTP and WebAuthn with enrolment, enforcement and recovery | MFA cannot be bypassed by any authentication path, proven per path | OPEN |
| **P12-121** | WebAuthn and passkeys | P12-120 | Passkey registration, multi-device and attestation handling | Passkey authentication works across the declared platform matrix, verified per platform | OPEN |
| **P12-122** | Account recovery | P12-121 | Recovery with identity proofing proportionate to the account's privilege | Recovery never issues a session with fewer factors than the account requires, proven by test | OPEN |
| **P12-123** | SAML implementation | P12-117 | SAML 2.0 service-provider implementation with signing, encryption and assertion validation | Assertion replay, signature stripping and audience confusion each fail, proven per attack | OPEN |
| **P12-124** | OIDC implementation | P12-117 | OpenID Connect relying-party and provider implementation with PKCE and nonce | Token substitution and audience confusion each fail, proven per attack | OPEN |
| **P12-125** | OAuth authorization server | P12-124 | Authorization-code-with-PKCE issuance for third-party applications | Implicit flow is unsupported. Every grant type is tested against its specification | OPEN |
| **P12-126** | Scope and consent model | P12-125 | Scopes, consent recording and revocation shared across programmes | Revoking a grant stops access at the next request, not at token expiry | OPEN |
| **P12-127** | Federation configuration | P12-123 | Per-tenant identity provider configuration with validation before activation | An IdP cannot be activated without a successful test sign-in, enforced mechanically | OPEN |
| **P12-128** | Just-in-time provisioning | P12-127 | Creating principals on first federated sign-in with attribute and group mapping | A federated principal receives exactly the roles its assertion maps to, proven by test | OPEN |
| **P12-129** | SCIM implementation | P12-128 | SCIM 2.0 provisioning and deprovisioning endpoints | A SCIM delete invalidates sessions and tokens within the stated window, proven by test | OPEN |
| **P12-130** | Machine identity and client credentials | P12-117 | Service-to-service authentication with scoped, expiring credentials | A machine credential cannot be used interactively, proven by test | OPEN |
| **P12-131** | Mutual TLS and certificate authentication | P12-130 | Certificate-based authentication for high-assurance integrations | Certificate authentication validates the full chain and honours revocation, proven by test | OPEN |
| **P12-132** | Authorization primitives | P12-113 | `unierp-auth` as the shared permission evaluation used by every service | Two enforcement paths returning different answers is impossible — a differential test proves agreement | OPEN |
| **P12-133** | Permission registry | P12-132 | The catalogue of every permission across every programme, with ownership | A permission used but unregistered fails a gate, proven on a seeded permission | OPEN |
| **P12-134** | Permission decorator and guard | P12-132 | The mechanism every endpoint uses, defaulting to deny | An endpoint without an explicit permission declaration is unreachable, not universally allowed | OPEN |
| **P12-135** | Record-level authorization primitives | P12-132 | Shared ownership, hierarchy, team and criteria-based access evaluation | A module implementing its own record-level rules fails an architecture gate | OPEN |
| **P12-136** | Database-level enforcement generation | P12-028 | RLS policies generated from the shared permission model | Direct SQL as the application role returns exactly what the API returns for the same subject | OPEN |
| **P12-137** | Field-level security primitives | P12-135 | Shared field-level read and edit control applied at the query layer | A hidden field is absent from the response payload entirely, proven by inspection | OPEN |
| **P12-138** | Impersonation primitives | P12-116 | Shared, consented, time-boxed, dual-attributed impersonation | Impersonation without an active consent record is impossible where policy requires it | OPEN |
| **P12-139** | Rate limiting and abuse primitives | P12-116 | Shared limits on authentication, mutation and enumeration | A credential-stuffing simulation is throttled and locked out, proven by test | OPEN |
| **P12-140** | Authentication audit | P12-047 | Complete, immutable records of every authentication and authorization decision | Every decision is reconstructible from the audit alone | OPEN |
| **P12-141** | Standards conformance testing | P12-124 | Conformance suites for SAML, OIDC and OAuth against published test suites | Each protocol passes its published conformance suite, recorded per protocol | OPEN |
| **P12-142** | Identity performance | P12-117 | Authentication and permission evaluation within latency budget at scale | Both meet budget at target concurrency and degrade safely beyond it, measured | OPEN |
| **P12-143** | Identity availability | P12-142 | Identity remaining available under partial failure, since everything depends on it | With a downstream dependency failing, authentication degrades per policy rather than failing, proven by injection | OPEN |
| **P12-144** | Cross-tenant identity isolation | P12-113 | Strict separation of identity state between tenants | A session for one tenant is unusable against another, proven by request | OPEN |
| **P12-145** | Identity data protection | P12-045 | Personal data in the identity plane classified, encrypted and retained per policy | Every personal field is encrypted per classification, verified in a database dump | OPEN |
| **P12-146** | Break-glass and emergency access | P12-138 | Emergency access with strict controls, alerting and mandatory review | Every break-glass use alerts immediately and is reviewed, verified by rehearsal | OPEN |
| **P12-147** | Identity migration and upgrade safety | P12-114 | Changing credential formats, token formats and session models without locking users out | A credential format migration completes with no user locked out, proven by rehearsal | OPEN |
| **P12-148** | Identity observability | P12-017 | Telemetry on authentication success, failure, latency and anomaly | An authentication problem is diagnosable from telemetry alone | OPEN |
| **P12-149** | Identity testing infrastructure | P12-022 | Harness for testing authentication, federation and authorization deterministically | Any identity scenario is testable without an external IdP, and the harness has its own tests | OPEN |
| **P12-150** | Stage E adversarial proof | P12-141 | An adversarial suite covering session, token, federation, MFA bypass, escalation and cross-tenant attacks | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 9. Stage F · Kernel, extensions and the isolation boundary (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-151** | Kernel scope and responsibility | P12-100 | What `unierp-kernel` owns versus the framework, declared and enforced | A responsibility in the wrong repository fails an architecture gate | OPEN |
| **P12-152** | Module registration and discovery | P12-151 | How modules declare themselves and are composed into a running service | A module bypassing registration is not loaded, proven by test | OPEN |
| **P12-153** | Module boundary enforcement | P12-152 | The gate that forbids direct cross-module service imports | A direct cross-module import fails `check-module-boundaries.mjs`, proven on a seeded import | OPEN |
| **P12-154** | Cross-module communication | P12-048 | The outbox as the only cross-module path, with the contract for using it | A cross-module effect outside the outbox fails an architecture gate | OPEN |
| **P12-155** | Lifecycle hooks and ordering | P12-152 | Declared startup, shutdown and per-request hooks with deterministic ordering | Hook ordering is deterministic and documented; a nondeterministic ordering fails a test | OPEN |
| **P12-156** | Graceful shutdown | P12-155 | Draining in-flight work, completing transactions and releasing resources on shutdown | A shutdown under load completes in-flight requests and loses no queued work, proven by test | OPEN |
| **P12-157** | Extension model | P12-079 | `unierp-extension-api` as the declared contract, and the seams extensions may use | An extension modifying core behaviour outside a declared seam fails a gate | OPEN |
| **P12-158** | Extension lifecycle | P12-157 | Install, activate, deactivate, upgrade and uninstall for extensions | A failed extension install leaves no partial state, proven by injection at each step | OPEN |
| **P12-159** | Extension data model extension | P12-042 | How extensions add tables and fields safely, upgrade-safe | An extension's data survives a core upgrade, proven by test | OPEN |
| **P12-160** | Extension registry | P12-158 | The record of what is installed where, at which version | The registry matches actual installed state, asserted by reconciliation | OPEN |
| **P12-161** | First-party extension implementations | P12-157 | `unierp-extensions` built on the same public contract as third-party ones | A first-party extension using a private interface fails a gate — no privileged path | OPEN |
| **P12-162** | Sandbox architecture | P12-157 | `unierp-sandbox` as the isolated runtime for untrusted extension code | Sandboxed code cannot reach the file system, the network or the host, proven by an escape suite | OPEN |
| **P12-163** | Sandbox resource limits | P12-162 | CPU, memory, wall-clock, call-depth and I/O limits per execution | An infinite loop terminates at its limit without affecting another tenant, proven under contention | OPEN |
| **P12-164** | Sandbox API surface | P12-162 | The declared, minimal set of capabilities exposed into the sandbox | A capability not on the declared list is unreachable from inside, proven by test | OPEN |
| **P12-165** | Sandbox permission enforcement | P12-132 | Sandboxed code running as a declared subject with that subject's permissions | Sandboxed code cannot read or write beyond its subject, proven by two-tenant test | OPEN |
| **P12-166** | Sandbox fairness and scheduling | P12-163 | Fair scheduling so one tenant's extensions cannot starve another's | One tenant saturating the sandbox does not measurably degrade another, proven under load | OPEN |
| **P12-167** | Sandbox observability | P12-017 | Per-execution metrics, limits consumed and failures, attributable to tenant and extension | A misbehaving extension is attributable from telemetry alone | OPEN |
| **P12-168** | Sandbox failure isolation | P12-162 | An extension crash or hang not affecting the host or other extensions | A crashing extension degrades only itself, proven by injection | OPEN |
| **P12-169** | Extension security review hooks | P12-164 | The static and dynamic checks an extension must pass before activation | An extension requesting an undeclared capability cannot activate, proven by test | OPEN |
| **P12-170** | Extension versioning and compatibility | P12-079 | Extension compatibility with platform versions, enforced at install | An incompatible extension cannot install and says why, before install rather than after | OPEN |
| **P12-171** | Multi-tenancy in the runtime | P12-102 | Tenant isolation enforced by the runtime, not by module discipline | A query without tenant context fails at the runtime boundary, proven by test | OPEN |
| **P12-172** | Tenant context in async work | P12-106 | Context propagating correctly into jobs, events, timers and sandboxed execution | Background work executes with correct tenant context, proven per execution path | OPEN |
| **P12-173** | Resource limits per tenant | P12-163 | Runtime-enforced per-tenant limits on compute, memory, queries and connections | A tenant cannot exceed its declared limits or degrade a neighbour, proven adversarially | OPEN |
| **P12-174** | Noisy-neighbour containment | P12-173 | Detecting and containing a tenant degrading shared runtime resources | A tenant consuming disproportionate resource is contained, proven under load | OPEN |
| **P12-175** | Blockchain and attestation integration | P12-047 | `unierp-blockchain` scoped to what it genuinely provides, with its claims measured | Every capability the ledger integration claims is proven by test, or the claim is removed | OPEN |
| **P12-176** | The isolation boundary proof | P12-162 | The EP-5 mechanism: an adversarial suite attempting escape from every isolation boundary | Every attempt fails, and each succeeds the moment its containment is removed | OPEN |
| **P12-177** | Runtime performance | P12-101 | Framework and kernel overhead within budget under production load | Runtime overhead stays within budget at target throughput, measured | OPEN |
| **P12-178** | Runtime memory management | P12-177 | Bounded memory across long-running services with no leaks | A 24-hour soak shows no unbounded growth, measured | OPEN |
| **P12-179** | Startup and readiness performance | P12-018 | Service startup within budget, including migration and warm-up | Service startup meets budget on the reference profile, measured | OPEN |
| **P12-180** | Stage F runtime proof | P12-176 | A suite asserting module boundaries, tenant isolation, sandbox containment and resource limits together | Every guarantee holds simultaneously, and removing any one is caught immediately | OPEN |

---

## 10. Stage G · Infrastructure, packaging and distribution (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-181** | Infrastructure definition ownership | P12-001 | `unierp-infra` as the declared owner of infrastructure definitions | Infrastructure defined outside the repository fails a gate | OPEN |
| **P12-182** | Infrastructure as versioned code | P12-181 | Environments expressed as reviewable, versioned, diffable definitions | An environment change outside version control is detected as drift | OPEN |
| **P12-183** | Environment parity | P12-182 | Development, test, staging and production differing only in declared ways | An undeclared environment difference is detected and reported | OPEN |
| **P12-184** | Local development environment | P12-183 | A working local environment from a clean machine, documented and tested | A clean machine reaches a running platform by following the documented steps, verified | OPEN |
| **P12-185** | Container images | P12-008 | Reproducible, minimal, scanned images for every service | Two builds of one commit produce identical images, verified by digest | OPEN |
| **P12-186** | Image security and minimisation | P12-185 | Minimal base images, no shell where avoidable, non-root execution | An image running as root or containing a known-vulnerable package fails the build | OPEN |
| **P12-187** | Service deployment definitions | P12-182 | Deployment, scaling, probe and resource definitions per service | Every service has complete definitions; an incomplete one fails the gate | OPEN |
| **P12-188** | Secret management | P12-016 | Secrets sourced from a manager, never from source or images | A secret in source, image or log fails a scan, proven on a seeded secret | OPEN |
| **P12-189** | Certificate and key lifecycle | P12-118 | Automated issuance, rotation and renewal for every certificate and key | A certificate renews before expiry without intervention, verified by rehearsal | OPEN |
| **P12-190** | Network policy | P12-171 | Declared, enforced network segmentation between services and tenants | A lateral-movement attempt fails at the network boundary, proven by test | OPEN |
| **P12-191** | Egress control | P12-190 | Declared external destinations per service, enforced at the boundary | A call to an undeclared destination is blocked at the network layer and audited | OPEN |
| **P12-192** | Package publishing | P12-013 | Publishing `@kannan19302/*` packages with signing, provenance and access control | An unsigned or unattested package cannot be published, proven by test | OPEN |
| **P12-193** | Registry and access policy | P12-192 | Who may publish what, enforced by the registry rather than by convention | An unauthorised publish is refused by the registry, proven by test | OPEN |
| **P12-194** | Package consumption and pinning | P12-192 | Consumers resolving pinned, verified versions reproducibly | Resolution is reproducible from the lockfile alone, verified by comparison | OPEN |
| **P12-195** | Monorepo and polyrepo coordination | P12-009 | Coordinating a change spanning several repositories | A multi-repository change is landed and released coherently, verified by rehearsal | OPEN |
| **P12-196** | Build caching and CI performance | P12-009 | CI completing within budget across 21 repositories | The full cross-repository CI completes within its budget, measured | OPEN |
| **P12-197** | Shared CI workflows | P12-019 | One set of workflows every repository uses rather than 21 divergent copies | A repository with a divergent workflow fails a gate — the **D013** shape, where a step existed in 21 and the script in none | OPEN |
| **P12-198** | Gate existence verification | P12-197 | Verifying that every CI step's referenced script actually exists and executes | A workflow step referencing a missing script fails CI — closing **D013** permanently | OPEN |
| **P12-199** | Storybook and component documentation | P12-023 | `unierp-storybook` as the published component documentation, generated | Every design-system component appears; one that does not fails the gate | OPEN |
| **P12-200** | Site template maintenance | P12-019 | `unierp-corporate-site-template` maintained against the current design system | The template builds and conforms to current tokens, verified by build | OPEN |
| **P12-201** | Platform aggregation repository | P12-001 | `unierp-platform`'s role declared — aggregation, or retired with its content rehomed | Its role is declared and enforced, or it is retired and its references updated | OPEN |
| **P12-202** | Agent worktree repositories | P12-019 | `unierp-loop-a/b/c` declared as agent worktrees with hygiene rules | A committed evidence file or stray artefact fails CI — closing the **D145** shape | OPEN |
| **P12-203** | Shared configuration repository | P12-016 | `unierp-config` as shared configuration, versioned and consumed uniformly | A repository with a divergent local copy of shared configuration fails a gate | OPEN |
| **P12-204** | Database infrastructure | P12-039 | Provisioning, sizing, backup and failover definitions for data stores | Every data store's definition includes backup and failover, verified by inspection | OPEN |
| **P12-205** | Message and queue infrastructure | P12-050 | Queue provisioning, durability, dead-letter and monitoring definitions | Every queue has durability and dead-letter configured, verified by inspection | OPEN |
| **P12-206** | Object storage infrastructure | P12-108 | Bucket policy, lifecycle, encryption and access definitions | No bucket is publicly readable; every one is encrypted, verified by inspection | OPEN |
| **P12-207** | Observability infrastructure | P12-017 | Metric, log and trace collection, retention and cost control | Telemetry retention and cost stay within budget, measured | OPEN |
| **P12-208** | Infrastructure testing | P12-182 | Testing infrastructure definitions before they reach an environment | An invalid definition is caught before it is applied, proven on a seeded error | OPEN |
| **P12-209** | Infrastructure drift detection | P12-183 | Detecting divergence between declared and actual infrastructure | A seeded drift is detected within the stated window and reported | OPEN |
| **P12-210** | Disaster recovery infrastructure | P12-204 | Backup, replication and recovery infrastructure with tested restore | A recovery rehearsal meets its stated objective, verified by rehearsal | OPEN |
| **P12-211** | Cost visibility for platform infrastructure | P12-207 | Infrastructure cost attributed to service and environment | Every infrastructure cost is attributable to a service, or explicitly classified as shared | OPEN |
| **P12-212** | Infrastructure security posture | P12-190 | Measured security posture of the infrastructure definitions | A misconfiguration is detected by scanning before it is applied, proven on a seeded one | OPEN |
| **P12-213** | Compliance evidence from infrastructure | P12-212 | Evidence generated from real infrastructure state rather than asserted | Every infrastructure control produces evidence automatically | OPEN |
| **P12-214** | Infrastructure documentation | P12-023 | Architecture and runbook documentation generated from real definitions | Documentation is generated from definitions and cannot drift | OPEN |
| **P12-215** | Multi-region infrastructure | P12-183 | Definitions supporting the declared regions with residency enforcement | A region's definitions enforce its residency requirements, verified by inspection | OPEN |
| **P12-216** | Stage G infrastructure proof | P12-209 | A suite asserting reproducibility, drift detection, gate existence and secret absence across 21 repositories | All four hold, and each fails when its mechanism is deliberately removed | OPEN |

---

## 11. Stage H · Platform quality and consumer safety (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-217** | Coverage across the platform core | P12-020 | Coverage over all 21 repositories with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P12-218** | Coverage-padding removal | P12-217 | Padding specs across the claimed repositories replaced with behavioural tests | Every replaced test fails when its subject is deliberately broken, individually verified | OPEN |
| **P12-219** | Public API test coverage | P12-092 | Every exported public symbol covered by a test that exercises it | An untested public export fails a gate, proven on a seeded export | OPEN |
| **P12-220** | Property-based testing of primitives | P12-097 | Property tests for money, temporal, identifier and validation primitives | Each primitive passes property tests over generated inputs; a weakened rule is caught | OPEN |
| **P12-221** | Mutation testing on critical paths | P12-220 | Mutation testing on auth, money and isolation code to prove tests actually assert | Surviving mutants on critical paths are below threshold, and a weakened test is detected | OPEN |
| **P12-222** | Integration testing against real infrastructure | P12-208 | Integration suites against real Postgres, queues and object storage | The suite runs against real infrastructure in CI; a mock-only pass is caught | OPEN |
| **P12-223** | Backwards-compatibility test suite | P12-070 | Tests asserting that a previous consumer version still works against the current platform | A break of a supported consumer version fails CI, proven on a seeded break | OPEN |
| **P12-224** | Consumer smoke tests | P12-072 | A minimal build-and-run check of every consuming programme against a platform change | A platform change breaking a consumer's build is caught in the platform's CI | OPEN |
| **P12-225** | Load and scale testing | P12-177 | Load profiles for the runtime, data layer and identity plane | Targets met at production profile; a regression beyond threshold fails CI | OPEN |
| **P12-226** | Soak and endurance testing | P12-178 | Long-running tests detecting leaks, connection exhaustion and drift | A 24-hour soak shows no unbounded resource growth | OPEN |
| **P12-227** | Chaos and fault injection | P12-143 | Injecting failure at every platform tier and verifying documented behaviour | Every documented resilience assumption is verified by injection, not assumed | OPEN |
| **P12-228** | Security testing across the core | P12-150 | Automated scanning and penetration testing of the identity, sandbox and data planes | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P12-229** | Dependency and supply-chain testing | P12-013 | Continuous verification of dependency integrity and licence compliance | A tampered or non-compliant dependency fails the build, proven on a seeded case | OPEN |
| **P12-230** | Upgrade and migration rehearsal | P12-147 | Rehearsing platform upgrades including data and credential migrations | An upgrade rehearsal completes with no data loss and no user locked out | OPEN |
| **P12-231** | Rollback rehearsal | P12-230 | Rehearsing rollback of a platform release including schema considerations | A rollback rehearsal restores the prior version with data consistent | OPEN |
| **P12-232** | Documentation accuracy verification | P12-023 | Verifying generated documentation matches the code it documents | A documented symbol absent from the code fails a gate, proven on a seeded case | OPEN |
| **P12-233** | Example and sample verification | P12-077 | Every documented example executed in CI | A broken example fails the build, proven on a seeded break | OPEN |
| **P12-234** | Platform observability verification | P12-017 | Verifying every service actually emits the standard telemetry | A service emitting off-standard or absent telemetry fails a gate | OPEN |
| **P12-235** | Cross-repository consistency | P12-197 | Verifying conventions, gates and structure are identical across 21 repositories | A divergent repository is detected and reported, proven on a seeded divergence | OPEN |
| **P12-236** | Platform readiness review | P12-235 | Every platform capability evidenced by test or rehearsal rather than by documentation | Every capability has a recorded proof within its review period; an unproven one blocks | OPEN |
| **P12-237** | Consumer migration support | P12-088 | Migration guides and codemods generated for every breaking change | Every breaking change ships with a tested migration path, verified by rehearsal | OPEN |
| **P12-238** | Deprecation inventory | P12-071 | The live list of deprecated elements, their windows and their remaining consumers | An element past its window with remaining consumers escalates rather than being removed | OPEN |
| **P12-239** | Platform support policy | P12-069 | Declared support windows for API, SDK, extension and schema versions | A version retired inside its window is refused, enforced mechanically | OPEN |
| **P12-240** | Stage H quality proof | P12-221 | A suite asserting coverage integrity, mutation resistance, compatibility and consumer safety together | Every guarantee holds, and each fails when its mechanism is deliberately removed | OPEN |

---

## 12. Stage I · Platform services (Wave 4)

The shared services every programme consumes but none owns end to end.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-241** | Notification service | P12-050 | The shared notification pipeline: channels, preferences, templates, delivery, suppression | A module implementing its own notification delivery fails an architecture gate | OPEN |
| **P12-242** | Email delivery infrastructure | P12-241 | Sending with authentication, reputation, bounce and complaint handling | SPF, DKIM and DMARC pass on every send, verified by inspecting delivered mail | OPEN |
| **P12-243** | Template engine | P12-241 | Shared, localised, versioned templating for every outbound communication | Every template exists in every enabled locale; a missing one blocks activation | OPEN |
| **P12-244** | Document generation service | P12-243 | Deterministic PDF and document generation used by every programme | Two generations of one document are byte-identical, verified by golden file | OPEN |
| **P12-245** | File processing service | P12-108 | Virus scanning, content-type verification, thumbnailing and conversion | An executable renamed to a document type is rejected by content inspection | OPEN |
| **P12-246** | Search service | P12-109 | Shared indexing, query, ranking and permission filtering | Search never returns a record the subject may not read, proven by two-tenant test | OPEN |
| **P12-247** | Scheduling service | P12-106 | Shared cron, delayed and recurring execution with timezone correctness | A scheduled job fires at the correct instant across DST and timezone changes | OPEN |
| **P12-248** | Workflow engine primitives | P12-048 | The durable execution substrate shared rather than reimplemented per programme | A second durable-execution implementation fails an architecture gate | OPEN |
| **P12-249** | Rules and expression engine | P12-095 | One expression language and evaluator shared across programmes | A programme defining its own expression syntax fails an architecture gate | OPEN |
| **P12-250** | Numbering service | P12-040 | Gapless statutory numbering as a shared, concurrency-safe primitive | No gap and no duplicate across 10,000 concurrent allocations with induced failures | OPEN |
| **P12-251** | Currency and exchange-rate service | P12-097 | Rate sourcing, storage, validity and conversion shared across programmes | Every conversion records its rate and time; triangulation matches hand computation | OPEN |
| **P12-252** | Tax engine integration | P12-251 | The shared tax determination interface every programme calls | Tax determined for one input is identical across programmes, verified differentially | OPEN |
| **P12-253** | Address and geocoding service | P12-099 | Shared address validation, formatting and geocoding | Address formatting matches locale conventions, verified per locale | OPEN |
| **P12-254** | Reporting and export service | P12-246 | Shared report execution, formatting and delivery with permission evaluation | A report runs as its declared subject and contains only what that subject may read | OPEN |
| **P12-255** | Import service | P12-036 | Shared import: mapping, validation, dry run, execution and rollback | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P12-256** | AI model gateway | P12-016 | The shared model interface, residency policy and egress control every programme uses | With residency set to local, a deliberate egress attempt is blocked at the network boundary | OPEN |
| **P12-257** | Vector storage and retrieval | P12-246 | Shared embedding storage and retrieval with tenant scoping and permission filtering | Retrieval never surfaces content the subject may not read, proven by two-tenant test | OPEN |
| **P12-258** | AI guardrails and safety | P12-256 | Shared input and output filtering, injection defence and PII redaction | A prompt-injection suite fails to escalate privilege or exfiltrate data | OPEN |
| **P12-259** | Feature flag service | P12-016 | Shared flag evaluation with consistent assignment across clients and services | Flag evaluation is consistent across every consumer for one subject, proven by test | OPEN |
| **P12-260** | Configuration service | P12-203 | Runtime configuration resolution with scoping, validation and audit | Resolution is deterministic and explainable, showing which scope supplied the value | OPEN |
| **P12-261** | Webhook delivery service | P12-078 | Shared outbound delivery with signing, retry, dead-letter and replay | A subscriber offline for an hour receives every event on return, in order | OPEN |
| **P12-262** | API gateway | P12-134 | The shared ingress: routing, authentication, rate limiting, and request logging | Every request traverses the gateway; a service reachable around it fails a gate | OPEN |
| **P12-263** | Service mesh and internal routing | P12-190 | Service-to-service routing, retry, timeout and circuit breaking | A failing service is isolated without cascading, proven by injection | OPEN |
| **P12-264** | Health aggregation | P12-018 | Aggregate platform health computed from every service's contract | Platform health reflects real service state, verified by injection | OPEN |
| **P12-265** | Service catalogue | P12-006 | The registry of every service, its owner, dependencies and contracts | Every running service appears with an owner; an ownerless service is detected | OPEN |
| **P12-266** | Shared service performance | P12-225 | Each platform service within its own latency and throughput budget | Every shared service meets its budget at target load, measured | OPEN |
| **P12-267** | Shared service isolation | P12-171 | Tenant isolation verified in every shared service, not only in the data layer | Every shared service has a two-tenant test proving **zero** cross-tenant reads | OPEN |
| **P12-268** | Shared service observability | P12-234 | Every platform service emitting the standard telemetry with tenant attribution | A shared service's failure is attributable to tenant and caller from telemetry alone | OPEN |
| **P12-269** | Shared service degradation | P12-263 | Declared behaviour of every consumer when a shared service is unavailable | Each consumer degrades per its declaration rather than failing, proven by injection | OPEN |
| **P12-270** | Stage I services proof | P12-267 | A suite asserting isolation, permission filtering and degradation across every shared service | Every guarantee holds in every service, and a seeded cross-tenant leak is caught | OPEN |

---

## 13. Stage J · Consumer safety and evolution (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-271** | Platform release process | P12-011 | The declared release train: cadence, gates, communication and rollback | Every release passes the same gates; a bypass requires a recorded exception | OPEN |
| **P12-272** | Release impact reporting | P12-086 | Before a platform release, the enumerated consumer impact | The reported impact equals the actual impact, verified differentially | OPEN |
| **P12-273** | Consumer notification | P12-272 | Notifying every affected programme of a change before it lands | Every affected consumer is notified within the stated window, proven by test | OPEN |
| **P12-274** | Staged platform rollout | P12-271 | Rolling a platform change out progressively with health gates | A regression halts the rollout automatically, proven by injection | OPEN |
| **P12-275** | Platform rollback | P12-231 | Reverting a platform release safely including its data effects | A rollback restores the prior version with consumers working, proven by rehearsal | OPEN |
| **P12-276** | Long-term support versions | P12-239 | Declared LTS versions with their support windows and backport policy | A security fix reaches every supported version within its window, verified by rehearsal | OPEN |
| **P12-277** | Security patch process | P12-228 | The path from vulnerability report to patched consumers | A critical vulnerability reaches consumers within its stated window, verified by rehearsal | OPEN |
| **P12-278** | Vulnerability disclosure | P12-277 | Coordinated disclosure for vulnerabilities in the platform core | Every report receives acknowledgement within the published window | OPEN |
| **P12-279** | Breaking-change budget | P12-070 | A declared limit on breaking changes per period, so consumers are not overwhelmed | Exceeding the budget requires a recorded exception, enforced mechanically | OPEN |
| **P12-280** | Codemod and migration tooling | P12-237 | Automated migration for breaking changes where the change is mechanical | Every mechanical breaking change ships a codemod, verified by applying it | OPEN |
| **P12-281** | Consumer feedback channel | P12-273 | Consuming programmes reporting platform defects with tracking | A consumer-reported defect is tracked to resolution and its reporter informed | OPEN |
| **P12-282** | Platform roadmap visibility | P12-238 | What is changing, deprecating and being removed, visible to every consumer | Every planned removal is visible to consumers before its window opens | OPEN |
| **P12-283** | Architecture decision records | P12-024 | Platform-level decisions recorded with their alternatives and falsification conditions | Every significant decision has a record naming what would falsify it | OPEN |
| **P12-284** | Platform governance | P12-080 | Who may change what, and the review each change class requires | A change landing without its required review is impossible, proven by test | OPEN |
| **P12-285** | Contribution and onboarding | P12-184 | A new contributor reaching a working environment and a merged change | The documented path is walked end to end and verified, not assumed | OPEN |
| **P12-286** | Platform documentation set | P12-232 | Architecture, contracts, runbooks and guides — generated where possible | Documentation regenerates from source; drift fails CI | OPEN |
| **P12-287** | Deprecation execution | P12-238 | Actually removing deprecated elements once their window has elapsed | A deprecated element past its window with zero consumers is removed; the inventory shrinks | OPEN |
| **P12-288** | Technical debt register | P12-024 | Known compromises recorded with their cost and trigger for repayment | Every recorded compromise has a stated trigger; an untriggered one is reviewed on schedule | OPEN |
| **P12-289** | Platform metrics | P12-268 | Measuring the platform as a product: adoption, breakage, support load, upgrade lag | Consumer upgrade lag is measured, not assumed | OPEN |
| **P12-290** | Consumer upgrade lag reduction | P12-289 | Acting on consumers falling behind supported versions | A consumer past its supported version is detected and escalated | OPEN |
| **P12-291** | Platform SLO | P12-264 | Service level objectives for the platform's own availability and latency | Every SLO is computed from real measurement, and a breach alerts | OPEN |
| **P12-292** | Platform incident response | P12-291 | Incident handling for the platform core, including consumer communication | A rehearsed incident reaches every affected consumer within the stated window | OPEN |
| **P12-293** | Platform capacity planning | P12-225 | Planning platform capacity ahead of consumer growth | A capacity shortfall is predicted with enough lead time to act, measured | OPEN |
| **P12-294** | Platform cost attribution | P12-211 | The platform core's own cost, attributed to consumers where meaningful | Platform cost is attributed or explicitly classified as shared | OPEN |
| **P12-295** | Platform accessibility obligations | P12-199 | The accessibility guarantees the platform provides its consumers | Every guarantee the platform claims to provide is tested, verified per guarantee | OPEN |
| **P12-296** | Stage J evolution proof | P12-272 | A suite asserting impact reporting, notification, migration tooling and rollback together | Every mechanism holds, and each fails when deliberately removed | OPEN |

---

## 14. Stage K · Testing and platform readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P12-297** | The consolidated platform test estate | P12-217 | Every claimed repository's tests running together with a single reported result | The full estate runs in CI with one aggregate result; a repository excluded from it fails a gate | OPEN |
| **P12-298** | Test isolation and determinism | P12-297 | Tests that do not depend on order, shared state or wall-clock time | A test suite passes in randomised order; a flaky test is quarantined with an owner | OPEN |
| **P12-299** | Flake detection and elimination | P12-298 | Detecting, tracking and eliminating intermittent failures | Flake rate is measured and below threshold; a new flake is detected within the stated window | OPEN |
| **P12-300** | Test performance | P12-297 | The estate completing within its CI budget across 21 repositories | The full estate completes within budget, measured | OPEN |
| **P12-301** | Two-tenant isolation testing, universally | P12-052 | An isolation test for every table, endpoint, service and shared primitive | A surface without an isolation test fails a coverage gate. Every test proves **zero** rows | OPEN |
| **P12-302** | Contract conformance testing | P12-090 | Every service verified against its own published contract | A service diverging from its contract fails CI, proven on a seeded divergence | OPEN |
| **P12-303** | Authentication and authorization test estate | P12-150 | Comprehensive tests over every principal, protocol and permission path | Every authentication and authorization path is covered; an uncovered path fails a gate | OPEN |
| **P12-304** | Data integrity testing | P12-055 | Property-based testing of schema invariants, migrations and isolation | No invariant violation across generated states, and a weakened one is caught immediately | OPEN |
| **P12-305** | Sandbox containment testing | P12-176 | The escape corpus run continuously against the sandbox | Every escape attempt fails, and each succeeds when its containment is removed | OPEN |
| **P12-306** | Money and precision testing | P12-097 | Property-based testing of every money and precision path | Money arithmetic matches hand computation across a rounding edge-case corpus | OPEN |
| **P12-307** | Temporal correctness testing | P12-096 | Testing date, time, timezone, DST and calendar handling exhaustively | Temporal arithmetic is correct across a year of fixtures in every supported timezone | OPEN |
| **P12-308** | Concurrency and race testing | P12-040 | Testing concurrent access to balances, numbering, stock and sessions | No lost update, no numbering gap and no session race under parallel load | OPEN |
| **P12-309** | Failure injection across the core | P12-227 | Systematic injection at every dependency and boundary | Every documented resilience assumption is verified; an unverified one is filed | OPEN |
| **P12-310** | Performance regression gates | P12-266 | CI gates on latency, throughput, memory and startup for the core | A deliberately regressed build fails the gate; the gate has been proven able to fail | OPEN |
| **P12-311** | Security regression testing | P12-228 | Every past security finding retained as a permanent regression test | A reintroduced past vulnerability fails CI, proven by reintroducing one | OPEN |
| **P12-312** | Compliance evidence generation | P12-213 | Evidence for the platform core produced by mechanism | Every claimed control produces evidence automatically; a hand-written claim fails the check | OPEN |
| **P12-313** | Disaster recovery rehearsal | P12-210 | Full recovery rehearsal of the platform core including data and identity | The rehearsal meets its objective with identity and data consistent, recorded | OPEN |
| **P12-314** | Upgrade path verification | P12-230 | Verifying upgrade from every supported version to current | Every supported version upgrades cleanly, verified per version | OPEN |
| **P12-315** | Consumer compatibility verification | P12-223 | Verifying every consuming programme against the current platform | Every consumer builds and passes its smoke tests against current, verified per consumer | OPEN |
| **P12-316** | Documentation and example verification | P12-233 | Every documented claim, example and tutorial executed | A broken example or false documented claim fails the build | OPEN |
| **P12-317** | Dead code re-census | P12-021 | Re-running the census and confirming the reduction | Unreachable code is reduced against the P12-002 baseline, verified by re-census | OPEN |
| **P12-318** | Defect log closure verification | P12-004 | Verifying every routed defect from the sweep is closed or explicitly carried | Every swept defect has a resolution or a recorded reason it remains open | OPEN |
| **P12-319** | Schema ceiling verification | P12-042 | Verifying the schema decomposition holds and cannot regress | No `.prisma` file exceeds its ceiling; a seeded oversized file fails CI — **D001** closed and kept closed | OPEN |
| **P12-320** | Gate existence re-verification | P12-198 | Verifying every referenced gate script exists and executes in every repository | A workflow step referencing a missing script fails CI — **D013** closed and kept closed | OPEN |
| **P12-321** | Standalone install re-verification | P12-008 | Verifying every claimed repository still installs and builds standalone | Every repository builds from a clean clone; a `workspace:*` escape fails CI — **D008** kept closed | OPEN |
| **P12-322** | Secret absence verification | P12-188 | Scanning every repository, image and published package for secrets | Zero secrets found across every artefact, run continuously | OPEN |
| **P12-323** | Licence compliance verification | P12-229 | Verifying licence compatibility across every dependency and published package | A licence conflict fails the build with the conflict named | OPEN |
| **P12-324** | Platform observability verification | P12-268 | Verifying every service emits standard telemetry with correct attribution | A service with absent or off-standard telemetry fails a gate | OPEN |
| **P12-325** | Runbook rehearsal | P12-214 | Every platform runbook executed in rehearsal and its steps verified | Every runbook has a recorded rehearsal within its review period | OPEN |
| **P12-326** | Platform readiness review | P12-236 | Every platform capability evidenced by test or rehearsal, not by documentation | Every capability has a recorded proof; an unproven one blocks the programme | OPEN |
| **P12-327** | Consumer sign-off | P12-315 | Each consuming programme confirming the platform meets its precondition gate | Every programme's precondition gate passes against the real platform, verified per programme | OPEN |
| **P12-328** | The no-silent-break proof | P12-085 | The § 1 invariant made adversarial: a deliberate breaking change to each artefact class — contract, type, event, auth behaviour, schema — with every affected consumer's build asserted to fail | Every break is caught before reaching a consumer, and each passes silently the moment its check is removed | OPEN |
| **P12-329** | Orphaned-ownership re-verification | P12-001 | Re-running the repository-coverage check that created this programme | Every repository in the family is claimed by exactly one programme. An unclaimed repository fails the gate | OPEN |
| **P12-330** | Programme 12 launch readiness | P12-328 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 15 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 15. Programme exit criteria

- [ ] **A breaking change to any contract, type, event, auth behaviour or schema fails a consumer's build before reaching them** (P12-328)
- [ ] **Every repository in the family is claimed by exactly one programme** (P12-329)
- [ ] Every defect swept from `90-DEFECT-LOG.md` into this programme is closed or explicitly carried (P12-004, P12-318)
- [ ] No `.prisma` file exceeds 3,000 lines — **D001** closed and kept closed (P12-042, P12-319)
- [ ] Every CI step's referenced script exists and executes — **D013** closed and kept closed (P12-198, P12-320)
- [ ] Every claimed repository builds standalone from a clean clone — **D008** kept closed (P12-008, P12-321)
- [ ] "Who uses this?" is answerable by command for every exported symbol, contract and event (P12-007)
- [ ] Every client, type, SDK method and document is generated from the contracts; no hand-maintained duplicate exists (P12-081)
- [ ] Compatible and breaking changes are classified by a tool, not by the author (P12-085)
- [ ] Nothing is removed before its deprecation window elapses, enforced by build (P12-088)
- [ ] SAML, OIDC and OAuth each pass their published conformance suites (P12-141)
- [ ] Session fixation, token replay, MFA bypass, escalation and cross-tenant attacks all fail (P12-150)
- [ ] Sandboxed code cannot reach the file system, network, host or another tenant (P12-176, P12-305)
- [ ] A cross-module effect outside the outbox fails an architecture gate (P12-154)
- [ ] Every table, endpoint, service and shared primitive has an isolation test proving **zero** rows (P12-301)
- [ ] Money arithmetic never leaves Decimal and matches hand computation across the edge-case corpus (P12-097, P12-306)
- [ ] Gapless numbering holds across 10,000 concurrent allocations with induced failures (P12-250)
- [ ] Zero secrets across every repository, image and published package (P12-322)
- [ ] Every past security finding is retained as a permanent regression test (P12-311)
- [ ] Every consuming programme's precondition gate passes against the real platform (P12-327)
- [ ] Coverage thresholds have been proven able to fail, and padding specs are replaced (P12-217, P12-218)
- [ ] Every platform capability is evidenced by test or rehearsal, never by documentation (P12-326)

---

## 16. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 12 established (P12-001–P12-330), Platform Core and Runtime.** Registered per README § 0 rule 1. It exists because a review of Programmes 2–11 against the repository list found **21 of 29 repositories named by no programme at all** — including `unierp-idp` (407 files), `unierp-contracts` (the source every client is generated from), `unierp-data` and the extension sandbox. Every other programme consumes these and none evolved them. `P12-004` sweeps `90-DEFECT-LOG.md` for findings landing in these repositories and routes each to a phase, because **D001**, **D008** and **D148** were all filed against code no programme owned and so had no owner to fix them. The invariant is that a consumer cannot be broken silently: `P12-003` classifies every contract, type, event and auth change, `P12-007` makes consumers enumerable across all twelve programmes, and `P12-328` proves it by introducing a deliberate break of each artefact class and asserting every affected consumer's build fails. | Claude Code |
