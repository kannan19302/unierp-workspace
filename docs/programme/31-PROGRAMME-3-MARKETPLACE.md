# PROGRAMME 3 · THE MARKETPLACE — P3-001–P3-330

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 3` resolves waves from this
> document and can only ever hand out a `P3-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** Programme 2 § 20
publishes `P2-334`, the Marketplace publication contract — a versioned interface describing the
package artefact, the listing, entitlement events and support obligations. Programme 3 consumes that
contract and **is built against the contract, not against Programme 2's progress.** `P3-004` is the
mechanism: a conformance harness plus a reference publisher that produces contract-valid packages
without Programme 2 existing at all.

The consequence is deliberate: the Marketplace can be finished, tested and demonstrated with
reference packages before a single third-party developer application exists.

---

## 1. What this programme owns

The commercial surface of UniERP: **ERP Core, Extensions, Plugins, Connectors, and third-party
applications** — discovered, evaluated, purchased, licensed, installed, updated, supported and paid
for. It spans the public storefront, the buyer's in-tenant experience, and the publisher's business.

**The invariant this programme establishes:**

> **Money, entitlement and installed software agree, always — and when they disagree, the system
> detects it rather than a customer discovering it.**

Every commerce failure that damages a platform is a divergence between those three: a customer
charged for something uninstalled, an app running after its licence lapsed, a publisher unpaid for a
real sale. `P3-329` is the mechanical proof: a continuous three-way reconciliation between billing,
entitlement and installed state that fails loudly on any drift.

### Verified starting position

Measured today, not asserted:

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| API module | `unierp-api/src/modules/marketplace`, **16 files** | `find unierp-api/src/modules/marketplace -type f` |
| Services present | `marketplace`, `marketplace-deep`, `marketplace-enterprise`, `storefront`, `payout`, `bundle-store`, `app-provisioning` | file listing above |
| Controllers | `marketplace`, `marketplace-deep`, `marketplace-enterprise`, `storefront`, `developer` | file listing above |
| Existing tests | 5 spec files, of which **2 are `*.coverage.spec.ts`** | file listing above |
| Web surface | `unierp-web/app/(storefront)` route group | `ls unierp-web/app` |

This is a genuine foundation and is not discarded. Two things about it are load-bearing for this
programme's honesty. First, `payout.service.ts` exists — meaning money-movement code is already in
the tree, and `P3-002` audits it before anything is built on it. Second, two of five test files are
coverage-padding specs of the kind `L11-COVERAGE-PADDING-INVENTORY.md` inventories (**D016**), so the
apparent test coverage of the money path is weaker than the file count suggests. `P3-003` establishes
what is actually tested before any phase claims to extend it.

**Reference set.** Salesforce AppExchange (security review, ISV lifecycle, managed package
distribution), Microsoft AppSource and Azure Marketplace (transactable offers, metered billing,
publisher payouts), Atlassian Marketplace (the clearest public model for app licensing tied to host
tenancy, and for vendor-side revenue reporting), Shopify App Store (install-time OAuth, usage
charges, app review), AWS Marketplace (private offers, contract-based pricing, entitlement API),
Stripe Connect and Apple/Google (payout, tax and platform-liability models), and npm/crates.io for
supply-chain integrity and yank/deprecation semantics.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **A buyer knows the total cost before committing.** No price revealed after the decision — including tax, seats, usage and renewal. | AWS Marketplace contract pricing | `P3-138`, `P3-190` |
| **UX-2** | **Installing is reversible and the reversal is stated up front.** What happens to data on uninstall is shown before install, not after. | Shopify; Atlassian | `P3-219` |
| **UX-3** | **Permissions requested are permissions explained.** Every scope an app requests is shown in the buyer's language with the concrete consequence. | Apple/Google privacy labels | `P3-108` |
| **UX-4** | **The publisher's business is legible.** Revenue, churn, payouts and their causes are visible without a support ticket. | Atlassian vendor reporting | `P3-266` |
| **UX-5** | **Trust signals are earned, not decorative.** Every badge maps to a verified fact with an expiry. | AppExchange security review | `P3-116`, `P3-243` |
| **UX-6** | **Failure states are commercial, not technical.** A lapsed licence, failed payment or revoked app explains what happened and what to do. | Stripe dunning | `P3-172` |
| **UX-7** | **Discovery serves the buyer, and paid placement is labelled as such.** Ranking is explainable and advertising is never disguised. | Regulatory: DMA/P2B transparency | `P3-070` |

---

## 3. Design-system rule

`unierp-design-system` is the only source of UI primitives, unchanged. This programme adds the
commerce primitives — price display, plan comparison, cart, checkout step, entitlement badge,
review, rating, publisher card, install state — to the design system with stories. `P3-013`
establishes them and the gate that keeps them there. The existing token gate (B15) applies: a
hardcoded hex or `px` fails CI here as everywhere.

---

## 4. Waves

### Wave 0 · "The money path is understood before it is extended"

**Phases:** P3-001–P3-020

Independence, the contract harness, and the audit of what already exists — including the existing
payout service. Nothing is built on the money path until its current state is measured.

### Wave 1 · "A catalogue that is true"

**Phases:** P3-021–P3-098

The listing model, discovery, and publisher intake. A listing that claims a capability its package
does not contain cannot exist.

### Wave 2 · "Trust"

**Phases:** P3-099–P3-120

Security review and certification. No paid or data-accessing application reaches a tenant without it.

### Wave 3 · "Commerce"

**Phases:** P3-121–P3-210

Pricing, checkout, subscriptions, entitlement, billing, tax and payouts. The largest wave, because
this is where the invariant in § 1 is either established or lost.

### Wave 4 · "Lifecycle in the tenant"

**Phases:** P3-211–P3-256

Installation, upgrade, uninstall, and the review and safety systems that govern what runs.

### Wave 5 · "The publisher's business and production"

**Phases:** P3-257–P3-330

Partner portal, analytics, support, disputes, compliance, and the reconciliation proof.

---

## 5. Stage A · Foundation, independence and the existing-state audit (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-001** | Programme charter and boundary declaration | — | A machine-readable manifest declaring the repositories this programme writes to and the platform APIs it consumes | A P3 commit touching an undeclared repository fails CI. Deleting the declaration fails CI rather than disabling the check | OPEN |
| **P3-002** | Audit of the existing money path | P3-001 | A measured account of `payout.service.ts`, `marketplace.service.ts` and their siblings: what they do, what is reachable, what is tested, what moves money | A written finding per service with the command that proves it. Every unreachable or untested money-moving path filed in `90-DEFECT-LOG.md` | OPEN |
| **P3-003** | Real test coverage of the existing module | P3-002 | Coverage measured with `all: true` over the marketplace module, with padding specs excluded from the count | The genuine covered-line percentage is recorded and is reproducible by command. Removing a real test lowers it | OPEN |
| **P3-004** | Publication-contract conformance harness | P3-001 | The independence mechanism: a reference publisher producing contract-valid packages and listings, plus a conformance suite, so this programme runs without Programme 2 | The full storefront-to-install journey runs end to end using only reference packages. A contract violation is caught by the harness, not at runtime | OPEN |
| **P3-005** | Tenancy and isolation baseline | P3-001 | Every table this programme adds carries `tenantId` where tenant-scoped, with RLS in the same migration; publisher-scoped tables carry `publisherId` with equivalent policies | A table without its scope column and policy fails `check-rls-verify.mjs`. Two-tenant and two-publisher tests each prove **zero** rows | OPEN |
| **P3-006** | Money representation standard | P3-002 | `Decimal(19,4)` minor-unit-safe money type with explicit currency on every amount, and arithmetic that never leaves Decimal | A `Float` in any money path fails a gate. A bare amount without a currency does not typecheck | OPEN |
| **P3-007** | Migration discipline | P3-005 | Forward-only migrations with tested rollback and immutable shipped migrations | Replaying every migration from empty reproduces the schema exactly. Editing a shipped migration fails CI | OPEN |
| **P3-008** | Idempotency across every commercial operation | P3-006 | Idempotency keys on purchase, subscription change, entitlement grant, install and payout, with stored responses | A retried purchase charges once, proven under induced network failure at every step | OPEN |
| **P3-009** | Event model and the outbox | P3-007 | Every commercial state change emitted through the outbox in the same transaction as the change | A state change and its event commit atomically. Killing the process between them is proven impossible | OPEN |
| **P3-010** | Audit log for commercial actions | P3-009 | Append-only audit of every price change, purchase, entitlement grant, revocation, review decision and payout | Every money- or entitlement-affecting endpoint audits. An unaudited one fails a gate. Records are immutable by any application path | OPEN |
| **P3-011** | Authentication and the four principals | P3-001 | The storefront's principals — anonymous visitor, tenant buyer, publisher, platform reviewer — each with distinct sessions and no privilege bleed | A publisher session cannot act as a buyer, and neither can act as a reviewer, proven per pair | OPEN |
| **P3-012** | Authorization and default deny | P3-011 | Explicit permissions on every endpoint, defaulting to deny, unauthorized returning **403** | An endpoint without a permission declaration fails a gate. Unauthorized returns 403, never 404 or 500 | OPEN |
| **P3-013** | Commerce design-system primitives | P3-001 | Price, plan comparison, cart line, checkout step, entitlement badge, rating, review, publisher card and install-state components added to `unierp-design-system` with stories | Each has a story and zero hardcoded colour or spacing. A commerce component defined in an app repo fails the component-location gate | OPEN |
| **P3-014** | Storefront shell and information architecture | P3-013 | The public storefront frame: navigation, category structure, search entry, account and cart, with server-rendered routes | The shell renders without JavaScript for content routes, verified with scripting disabled | OPEN |
| **P3-015** | Structured logging, tracing and correlation | P3-001 | Correlation IDs propagated across storefront, checkout, billing, entitlement and install | A single purchase is traceable end to end from click to installed app by one correlation ID | OPEN |
| **P3-016** | Error taxonomy for commerce | P3-015 | Typed errors separating buyer error, publisher error, payment decline, platform fault and policy refusal, each with a code and remediation | Every error carries a registry code. An uncoded error fails a gate. A payment decline never surfaces as a generic failure | OPEN |
| **P3-017** | Configuration and secret handling | P3-001 | Validated configuration; payment and tax provider credentials never in source, bundle or logs | A missing required variable fails startup by name. A bundle scan finds zero secrets | OPEN |
| **P3-018** | Rate limiting and abuse control | P3-012 | Limits on search, checkout attempts, review submission and publisher API use, with backoff | A carding attack simulation is throttled and locked out, proven by test | OPEN |
| **P3-019** | Performance budget for the storefront | P3-014 | Budgets for listing pages, search and checkout on a fixed profile, wired into CI | A regression beyond budget fails CI. Core Web Vitals green on listing, detail and checkout | OPEN |
| **P3-020** | Test harness for commerce | P3-004 | The shared substrate: payment provider test doubles, clock control, entitlement fixtures, tenant and publisher factories | A commerce test is writable without new infrastructure. The harness has tests that fail when it is broken | OPEN |

---

## 6. Stage B · Catalogue, listings and the truth gate (Wave 1)

The listing is a **commercial promise**. This project has a documented history of claims outliving
their mechanisms, and Track H built `H03` — a CI gate failing when the marketing site asserts a
capability the platform lacks. `P3-030` is the same mechanism applied to every listing in the
catalogue, and it is the reason this stage exists before discovery or commerce.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-021** | Catalogue entity model | P3-007 | `Product`, `Listing`, `Version`, `Publisher`, `Category` and `Edition` as first-class entities with lifecycle states | A listing's state transitions are constrained by the model; an invalid transition is refused at the database level | OPEN |
| **P3-022** | Product taxonomy | P3-021 | The classification: ERP Core, Extension, Plugin, Connector, Application, Template, Service — each with its own required metadata and install semantics | A product cannot exist without a type, and each type's required fields are enforced at publish | OPEN |
| **P3-023** | Category and tag hierarchy | P3-022 | Curated categories with a governed taxonomy, plus free tags kept separate from it | A publisher cannot invent a category. A tag never affects ranking as though it were a category | OPEN |
| **P3-024** | Listing content model | P3-021 | Title, summary, description, media, documentation links, support terms, changelog and localised variants | A listing missing any required element cannot be submitted. Every element is localisable | OPEN |
| **P3-025** | Media handling and validation | P3-024 | Screenshots, icons, video with dimension, format, size and content validation, served optimised | A malformed or oversized asset is rejected at upload with the reason. Assets serve within the performance budget | OPEN |
| **P3-026** | Version and release model | P3-021 | Multiple versions per product with semantic versioning, release channels, and the currently-listed version distinct from installed versions | A tenant on an older version is unaffected by a new release until it acts, proven by test | OPEN |
| **P3-027** | Compatibility and requirements declaration | P3-026 | Declared platform version ranges, module dependencies, region and edition requirements | An incompatible product is not installable and says why, before purchase rather than after | OPEN |
| **P3-028** | Dependency resolution across products | P3-027 | Inter-product dependencies with version ranges, transitive resolution and conflict detection | An unsatisfiable set is refused at purchase with the conflict explained, not at install | OPEN |
| **P3-029** | Capability manifest per listing | P3-022 | Every listing declaring machine-readable capabilities, permissions, data access and egress, derived from its package | A listing's declared capabilities are generated from the package, not typed by the publisher | OPEN |
| **P3-030** | The listing-truth gate | P3-029 | The `H03` mechanism applied to the catalogue: a CI and publish-time gate failing when listing copy claims a capability the manifest does not contain | Adding a capability claim with no manifest entry fails publication. The gate is proven to fail on a deliberately false claim | OPEN |
| **P3-031** | Pricing model declaration | P3-006 | Free, one-time, subscription, per-seat, usage-metered, tiered and contract pricing as declared structures | Every pricing model is expressible as data. A price expressible only as prose cannot be published | OPEN |
| **P3-032** | Multi-currency and regional pricing | P3-031 | Per-currency, per-region price lists with explicit rounding and no runtime conversion at checkout | A displayed price equals the charged price exactly, in every supported currency, proven by test | OPEN |
| **P3-033** | Editions, plans and feature matrices | P3-031 | Multiple editions per product with a feature comparison generated from entitlement data | The published comparison matrix is generated from what is actually entitled, and cannot drift | OPEN |
| **P3-034** | Trials and freemium | P3-031 | Trial definition — duration, limits, conversion and expiry behaviour — declared per product | A trial expires and degrades exactly as declared, never leaving the tenant in an undefined state | OPEN |
| **P3-035** | Listing lifecycle and states | P3-021 | Draft, submitted, in review, approved, listed, unlisted, deprecated, withdrawn — with permitted transitions | A withdrawn product remains installed and supported for existing tenants per policy, proven by test | OPEN |
| **P3-036** | Deprecation and end-of-life | P3-035 | Publisher-initiated EOL with notice periods, migration guidance and enforced minimum support windows | A product cannot be withdrawn from paying tenants inside its notice period, enforced mechanically | OPEN |
| **P3-037** | Yank and emergency removal | P3-036 | Platform-initiated immediate removal for security or legal cause, with tenant notification and a defined installed-state outcome | A yanked version stops being installable immediately, and existing installs are handled per the declared policy | OPEN |
| **P3-038** | Localisation of catalogue content | P3-024 | Per-locale listing content with fallback, translation workflow and locale-correct pricing display | A listing renders fully in a second locale with no untranslated string and a locale-formatted price | OPEN |
| **P3-039** | Listing preview and staging | P3-035 | Publisher preview of exactly what buyers will see, before submission | Preview is byte-identical to the published rendering, verified by golden comparison | OPEN |
| **P3-040** | Private and unlisted offerings | P3-035 | Products visible only to named tenants, for private offers and pre-release | A private listing is invisible and un-purchasable to every non-invited tenant, proven by test | OPEN |
| **P3-041** | Bundles and suites | P3-028 | Multiple products sold as one unit with combined pricing and coherent entitlement | Purchasing a bundle entitles every component, and a component's removal from the bundle is handled explicitly | OPEN |
| **P3-042** | ERP Core catalogue representation | P3-022 | The platform's own modules represented in the catalogue on the same model as third-party products, with no privileged path | A first-party module's listing passes the same truth gate and review as a third-party one, proven by test | OPEN |
| **P3-043** | Connector catalogue specialisation | P3-022 | Connector-specific listing data: supported operations, authentication, egress destinations, rate limits | A connector listing declares its egress list, and the list matches the package's, verified mechanically | OPEN |
| **P3-044** | Catalogue API | P3-021 | Read API over the catalogue with filtering, pagination and caching, consumed by storefront, tenant and clients | Every storefront capability is available by API. A UI-only capability fails the parity test | OPEN |
| **P3-045** | Catalogue caching and invalidation | P3-044 | Aggressive edge caching with correct invalidation on listing, price and availability change | A price change is reflected within the stated latency. A stale price ever being charged is proven impossible | OPEN |
| **P3-046** | Catalogue data quality monitoring | P3-030 | Continuous checks for broken links, missing media, stale screenshots, orphaned versions and expired claims | A broken listing is detected and reported to its publisher before a buyer encounters it | OPEN |
| **P3-047** | Catalogue accessibility | P3-014 | WCAG 2.2 AA across listing, detail, comparison and media surfaces | Every catalogue page is `axe` clean and keyboard-complete, including media and comparison tables | OPEN |
| **P3-048** | Stage B truth proof | P3-030 | A suite generating listings with deliberately false capability, price and compatibility claims, asserting each is refused | Every false claim class is refused, and each becomes publishable the moment its check is removed | OPEN |

---

## 7. Stage C · Discovery, search and merchandising (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-049** | Search infrastructure | P3-044 | Indexing of catalogue content with incremental update on listing change | A published listing is findable within the stated indexing latency, measured | OPEN |
| **P3-050** | Relevance and ranking | P3-049 | A ranking function over text match, quality signals, compatibility and adoption, with the inputs documented | Ranking inputs are enumerable and each is measurable. An undocumented input fails a gate | OPEN |
| **P3-051** | Faceted filtering | P3-049 | Filters by type, category, price model, compatibility, region, certification and rating, with accurate counts | Facet counts match the result set exactly. A filter never hides a compatible product incorrectly | OPEN |
| **P3-052** | Search quality measurement | P3-050 | A judgement set and offline metrics, with regression detection on ranking change | A ranking change is measured before release. A regression beyond threshold blocks it | OPEN |
| **P3-053** | Typo tolerance, synonyms and multilingual search | P3-049 | Fuzzy matching, curated synonyms and per-locale analysis | A misspelled product name finds it. Searching in a second locale returns that locale's content | OPEN |
| **P3-054** | Compatibility-aware results | P3-027 | Results filtered and annotated by the searching tenant's actual platform version, region and edition | An incompatible product is never presented as installable to that tenant, proven by test | OPEN |
| **P3-055** | Product detail page | P3-024 | The buyer's evaluation surface: description, media, pricing, permissions, requirements, reviews, publisher, changelog | Every element a purchase decision depends on is present before any click-through, verified against a checklist test | OPEN |
| **P3-056** | Comparison surface | P3-033 | Side-by-side comparison across products and editions, generated from entitlement data | A comparison never asserts a feature difference that entitlement data does not support | OPEN |
| **P3-057** | Recommendations | P3-050 | Related, complementary and alternative product recommendations with an explainable basis | Every recommendation is attributable to a stated reason shown to the buyer | OPEN |
| **P3-058** | Collections and curation | P3-023 | Editorially curated collections with governance over what may be featured | A collection's contents and the reason for each inclusion are auditable | OPEN |
| **P3-059** | Homepage and merchandising surfaces | P3-058 | The storefront homepage composed of governed merchandising slots | Every slot's content is traceable to a curation decision or an algorithm, never to an untracked edit | OPEN |
| **P3-060** | Personalisation | P3-057 | Tenant-context-aware surfacing based on installed products, industry and size, with an opt-out | Personalisation never reveals another tenant's data or behaviour, proven by an inference test | OPEN |
| **P3-061** | Search and browse analytics | P3-049 | Query volume, zero-result rate, click-through and conversion by surface | A zero-result query is identifiable and routable to catalogue gaps | OPEN |
| **P3-062** | Zero-result and low-quality-result handling | P3-061 | Fallback suggestions, category redirection and a request-a-product path | A zero-result search always offers a next action, verified across a query corpus | OPEN |
| **P3-063** | SEO and structured data | P3-055 | Server-rendered listing pages with canonical URLs, structured data, sitemaps and `hreflang` | Listing pages are indexable and validate against structured-data requirements. A URL change creates a redirect automatically | OPEN |
| **P3-064** | Storefront performance | P3-019 | Optimised listing, search and detail rendering with streaming and image optimisation | Core Web Vitals green on search, listing and detail at the 75th percentile, measured | OPEN |
| **P3-065** | Anonymous browsing and progressive identification | P3-011 | Full catalogue browsing without an account, with state preserved through sign-in | A cart and evaluation state built anonymously survive authentication intact | OPEN |
| **P3-066** | In-tenant marketplace surface | P3-054 | The marketplace embedded in the tenant product, context-aware and permission-gated | A tenant user without purchase permission can browse and request but not buy, proven by test | OPEN |
| **P3-067** | Wishlists, saved items and evaluation notes | P3-065 | Buyer-side evaluation tooling shared within a tenant | A saved evaluation is visible to permitted colleagues and to nobody else | OPEN |
| **P3-068** | Request-a-product and demand signals | P3-062 | Buyer demand capture routed to publishers and to platform planning | Aggregated demand is visible to publishers without exposing individual tenant identity | OPEN |
| **P3-069** | Search accessibility | P3-047 | Keyboard-complete search, filtering and result navigation with screen-reader-announced result counts | Search, filter and compare are fully operable without a mouse and without sight, recorded as a test | OPEN |
| **P3-070** | Paid placement, labelling and ranking transparency | P3-059 | The UX-7 mechanism: any paid or promoted placement labelled as such, with a published ranking-parameters statement | An unlabelled paid placement is impossible — labelling is applied by the system, not by the merchandiser. The ranking statement is generated from the actual inputs | OPEN |
| **P3-071** | Publisher storefront pages | P3-055 | Per-publisher pages with their portfolio, verification state and support terms | A publisher page shows only verified facts, each with an expiry | OPEN |
| **P3-072** | Cross-client catalogue parity | P3-044 | The catalogue available with equivalent capability on web, mobile and desktop clients | A capability present on one client and absent on another fails the parity test | OPEN |
| **P3-073** | Catalogue availability and degradation | P3-045 | The storefront serving cached catalogue content when downstream services are degraded | With billing unavailable the catalogue still browses and clearly states that purchase is unavailable | OPEN |
| **P3-074** | Stage C proof | P3-052 | A search-and-discovery suite over a seeded catalogue asserting relevance, compatibility filtering, labelling and accessibility | The suite passes and detects a deliberately unlabelled paid placement and a deliberately broken compatibility filter | OPEN |

---

## 8. Stage D · Publisher onboarding and application intake (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-075** | Publisher entity and lifecycle | P3-011 | `Publisher` as a distinct principal with registration, verification, suspension and termination | A publisher is not a tenant with a flag, and cannot act on tenant surfaces, proven by test | OPEN |
| **P3-076** | Legal entity verification | P3-075 | Business identity verification: registration number, address, beneficial ownership where required | An unverified publisher cannot list a paid product, enforced mechanically | OPEN |
| **P3-077** | Domain and brand verification | P3-076 | Verified control of claimed domains and trademarks, with a challenge path | A publisher cannot display an unverified domain or brand claim on a listing | OPEN |
| **P3-078** | Publisher agreements | P3-076 | Distribution, data-processing and payout agreements, versioned, with per-version acceptance records | Publishing under a superseded agreement is refused. Every acceptance is reproducible from the record | OPEN |
| **P3-079** | Tax and payout identity | P3-076 | Tax identifiers, residency, withholding status and banking details captured and validated by jurisdiction | A payout cannot be initiated without complete, validated tax and banking data | OPEN |
| **P3-080** | Publisher team and role model | P3-075 | Members with roles for owner, developer, finance, support and marketing, least-privilege by default | Only a finance role can see payout detail and only an owner can change banking, proven per role | OPEN |
| **P3-081** | Publisher authentication hardening | P3-080 | Mandatory MFA for publish, banking change and payout, regardless of org preference | A banking change without a second factor is impossible, and the test fails when the enforcement is removed | OPEN |
| **P3-082** | Sensitive-change protection | P3-081 | Cooling-off periods, out-of-band confirmation and notification for banking and payout changes | A banking change notifies every owner and does not take effect within the cooling-off window | OPEN |
| **P3-083** | Application submission workflow | P3-035 | Submit, validate, review, request-changes, approve and publish, with state visible to the publisher | A submission's state and its blocking items are always visible without contacting support | OPEN |
| **P3-084** | Automated submission validation | P3-030 | Pre-review automated checks: manifest validity, truth gate, media, metadata completeness, dependency resolution | A submission failing any automated check never reaches human review, and the failure names the rule | OPEN |
| **P3-085** | Package ingestion and verification | P3-004 | Receiving a package against the publication contract: signature, provenance, hash and SBOM verification | A tampered or unsigned package is rejected at ingestion, proven by test | OPEN |
| **P3-086** | Submission feedback and iteration | P3-083 | Structured reviewer feedback with per-item resolution and resubmission without losing history | A resubmission shows what changed since the prior review, generated rather than asserted | OPEN |
| **P3-087** | Publisher onboarding journey | P3-078 | Guided path from registration to first submitted product, resumable and measurable | A new publisher reaches a submitted product unaided. Drop-off per step is measured | OPEN |
| **P3-088** | Publisher documentation and policy surface | P3-078 | Published, versioned policies: review criteria, quality bar, prohibited content, commercial terms | Every rejection reason maps to a published policy clause. A rejection with no clause is impossible | OPEN |
| **P3-089** | Sandbox and test tenant provisioning | P3-085 | Publishers provisioned real test tenants to validate installation and behaviour before submission | A publisher tests a full install and purchase flow without touching a real customer tenant | OPEN |
| **P3-090** | Pre-submission self-check | P3-084 | The full automated suite runnable by the publisher on demand before submitting | The self-check result matches the submission result exactly, verified differentially | OPEN |
| **P3-091** | Publisher API and CLI | P3-083 | Programmatic submission, status, listing management and release, for CI use | A publisher releases a new version entirely from CI with no browser step | OPEN |
| **P3-092** | Bulk and portfolio management | P3-091 | Managing many products and versions: bulk metadata edit, portfolio view, coordinated release | A publisher with 50 products performs a coordinated update without per-product manual work | OPEN |
| **P3-093** | Publisher notification and alerting | P3-016 | Notifications for review outcomes, policy changes, security advisories, payout events and incidents | A security advisory reaches every affected publisher's owners, proven by test | OPEN |
| **P3-094** | Publisher transfer and succession | P3-075 | Transferring product ownership between publishers with entitlement and support continuity | A transferred product's existing entitlements and subscriptions continue uninterrupted, proven by test | OPEN |
| **P3-095** | Publisher offboarding | P3-036 | Voluntary and involuntary exit with obligations to existing customers honoured | A departing publisher cannot abandon paying tenants inside the notice window, enforced mechanically | OPEN |
| **P3-096** | Publisher impersonation for support | P3-080 | Time-boxed, consented, audited platform access to a publisher account | Support access without an active consent record is impossible. Actions attribute to both principals | OPEN |
| **P3-097** | Publisher accessibility | P3-047 | WCAG 2.2 AA across the publisher portal, including submission and analytics surfaces | The publisher portal is `axe` clean and keyboard-complete | OPEN |
| **P3-098** | Stage D proof | P3-090 | An intake suite submitting valid, invalid, tampered and policy-violating packages and asserting each outcome | Every class is handled correctly, and a tampered package becomes acceptable the moment signature verification is removed | OPEN |

---

## 9. Stage E · Security review and certification (Wave 2)

AppExchange's security review is the reference and its lesson is the one that matters: **a review
that cannot fail is theatre.** Every check here is written so that removing it makes a deliberately
malicious package pass, and `P3-120` proves exactly that.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-099** | Review policy and rubric | P3-088 | The published, versioned rubric every application is judged against, with severity definitions | Every review decision cites rubric clauses. A decision with no clause cannot be recorded | OPEN |
| **P3-100** | Risk tiering | P3-099 | Products tiered by data access, permission scope, egress and payment handling, driving review depth | A high-risk product cannot receive a low-risk review path, enforced by the workflow | OPEN |
| **P3-101** | Static analysis pipeline | P3-085 | Automated code and manifest analysis for injection, secrets, unsafe dependencies and dangerous APIs | A package with a known-bad pattern fails automatically. The gate is proven to fail on a seeded sample | OPEN |
| **P3-102** | Dependency and supply-chain review | P3-085 | SBOM analysis, vulnerability matching, licence compatibility and provenance verification | A package with a critical vulnerability cannot be approved. A licence conflict is refused with the conflict named | OPEN |
| **P3-103** | Permission-scope justification | P3-029 | Every requested permission requiring a stated, reviewed justification, with least-privilege challenge | A permission without a justification blocks submission. An over-broad scope is refused with the narrower alternative named | OPEN |
| **P3-104** | Egress and data-flow review | P3-043 | Review of every declared external destination and the data sent to it | An undeclared egress destination discovered in behaviour analysis fails review | OPEN |
| **P3-105** | Dynamic and behavioural analysis | P3-089 | Executing the package in an instrumented sandbox and comparing observed behaviour to declarations | A package behaving beyond its declarations is caught by observation, not by trust | OPEN |
| **P3-106** | Privacy and data-handling review | P3-104 | Review of personal-data collection, retention, sharing and sub-processors against policy | A product processing personal data without a compliant declaration cannot be listed | OPEN |
| **P3-107** | Accessibility review of published products | P3-097 | Accessibility conformance checked for products presenting their own UI | A product failing the accessibility bar cannot claim certification, and the bar is published | OPEN |
| **P3-108** | Buyer-facing permission disclosure | P3-103 | The UX-3 mechanism: every requested scope rendered in the buyer's language with its concrete consequence | Every scope has a plain-language explanation. A scope without one cannot be requested, enforced mechanically | OPEN |
| **P3-109** | Review workflow and case management | P3-100 | Reviewer queue, assignment, SLA, escalation and decision recording | A submission's review SLA is measured and breaches are visible. No submission is silently stalled | OPEN |
| **P3-110** | Reviewer tooling | P3-105 | The reviewer's surface: diff against prior version, analysis results, behaviour traces, decision capture | A reviewer sees exactly what changed since the last approved version, generated not asserted | OPEN |
| **P3-111** | Re-review on change | P3-110 | Determining which changes require full re-review and which qualify for expedited paths | A change to a security-relevant component always triggers full re-review, enforced by classification | OPEN |
| **P3-112** | Appeal and dispute of review decisions | P3-109 | A documented appeal path with independent reconsideration and recorded outcomes | Every appeal receives a decision with reasons within the published window | OPEN |
| **P3-113** | Continuous post-publication monitoring | P3-105 | Ongoing behavioural monitoring of published applications against their declarations | A published application deviating from its declared behaviour raises an incident automatically | OPEN |
| **P3-114** | Vulnerability disclosure and response | P3-093 | A coordinated disclosure process for vulnerabilities in published applications, with publisher SLAs | A reported vulnerability reaches its publisher and, if unfixed within SLA, triggers the escalation path | OPEN |
| **P3-115** | Emergency response and revocation | P3-037 | The ability to revoke a malicious application across every tenant, with a rehearsed procedure | A rehearsal revokes a seeded malicious application from every install within the stated window | OPEN |
| **P3-116** | Certification tiers and badges | P3-099 | The UX-5 mechanism: tiers mapped to verified facts, with expiry and automatic downgrade | A badge whose underlying verification expired is removed automatically, not by a human remembering | OPEN |
| **P3-117** | First-party parity in review | P3-042 | Platform-published products passing the identical review pipeline, with no bypass | A first-party product with a seeded violation is refused exactly as a third-party one would be | OPEN |
| **P3-118** | Review transparency reporting | P3-109 | Published statistics on review volume, outcome, timing and rejection reasons | The report is generated from review data and cannot be edited by hand | OPEN |
| **P3-119** | Reviewer integrity and conflict of interest | P3-109 | Separation of duties, conflict declaration and prohibition on reviewing one's own or a related publisher's product | A reviewer cannot be assigned a submission from a related publisher, enforced by the assignment engine | OPEN |
| **P3-120** | Stage E adversarial proof | P3-105 | A corpus of deliberately malicious packages — exfiltration, escalation, undeclared egress, dependency attack, obfuscation — run through the full pipeline | Every malicious package is refused, and each becomes approvable the moment its corresponding check is removed | OPEN |

---

## 10. Stage F · Pricing, cart and checkout (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-121** | Price resolution engine | P3-032 | Resolving the applicable price for a tenant from product, edition, region, currency, contract and promotion — deterministically | The same inputs always resolve to the same price. A resolution that cannot be explained is impossible; every price carries its derivation | OPEN |
| **P3-122** | Seat-based pricing | P3-121 | Per-seat pricing with counting rules, minimums, and defined behaviour when seats change mid-period | Adding a seat mid-period prorates exactly as declared, verified against hand-computed values | OPEN |
| **P3-123** | Usage-based and metered pricing | P3-121 | Metered dimensions, aggregation windows, tiering and overage | Metered totals reconcile with independently measured usage within the stated tolerance | OPEN |
| **P3-124** | Tiered, volume and graduated pricing | P3-121 | Tier structures with explicit boundary semantics and no ambiguity at a tier edge | A quantity exactly on a tier boundary prices per the declared rule, verified across every tier structure | OPEN |
| **P3-125** | Contract and negotiated pricing | P3-040 | Private offers with negotiated terms, durations and custom price lists | A negotiated price applies only to its named tenant and expires as declared, proven by test | OPEN |
| **P3-126** | Promotions, discounts and coupons | P3-121 | Discount definition, eligibility, stacking rules, limits and expiry | Stacking beyond policy is refused. A coupon cannot be redeemed beyond its limit, proven under concurrent redemption | OPEN |
| **P3-127** | Cart model | P3-121 | A persistent, tenant-scoped cart with line items, quantities, validation and expiry | A cart survives session loss and revalidates prices on return, never charging a stale price | OPEN |
| **P3-128** | Cart validation and eligibility | P3-054 | Continuous validation of compatibility, dependencies, existing entitlements and purchase permission | A cart containing an incompatible or already-owned product blocks checkout with the reason | OPEN |
| **P3-129** | Quote generation | P3-127 | Formal quotes with validity periods, approval routing and conversion to order | A quote converts to an order at exactly its quoted price within its validity window | OPEN |
| **P3-130** | Purchase approval workflow | P3-129 | Tenant-side approval before purchase, with budget and authority limits | A purchase above an authority limit cannot complete without approval, proven by test | OPEN |
| **P3-131** | Payment method management | P3-017 | Card, bank transfer, invoice and wallet methods stored with the provider, never in this system | No payment instrument is stored in this platform's database, verified by schema inspection and by scan | OPEN |
| **P3-132** | Payment provider abstraction | P3-131 | One interface over payment providers with provider-specific behaviour isolated | Adding a provider requires no change to checkout logic, proven by implementing a second provider | OPEN |
| **P3-133** | Checkout flow | P3-128 | The purchase journey: review, address, payment, terms, confirm — resumable and accessible | Checkout completes with keyboard alone and with a screen reader. Abandonment preserves the cart | OPEN |
| **P3-134** | Strong customer authentication and 3-D Secure | P3-132 | Handling authentication challenges, redirects and asynchronous confirmation | A challenged payment completes correctly on return, and an abandoned challenge leaves no partial order | OPEN |
| **P3-135** | Payment failure and decline handling | P3-016 | The UX-6 mechanism at checkout: declines explained in commercial terms with a concrete next action | Every decline code maps to a buyer-comprehensible message and action. A generic failure message fails a gate | OPEN |
| **P3-136** | Order model and state machine | P3-008 | `Order` with a constrained state machine from created through paid, fulfilled, failed and refunded | An invalid state transition is refused at the database level, not merely in code | OPEN |
| **P3-137** | Fulfilment orchestration | P3-136 | Coordinating payment, entitlement grant and installation as a saga with compensation | A failure at any step compensates completely, leaving no charge without entitlement and no entitlement without charge, proven by injection at each step | OPEN |
| **P3-138** | Total-cost transparency | P3-121 | The UX-1 mechanism: full cost including tax, seats, usage estimate and renewal shown before commitment | A cost element revealed after commitment is impossible — the confirmation total is asserted equal to the charged total | OPEN |
| **P3-139** | Currency, rounding and display correctness | P3-032 | Consistent rounding, minor-unit handling and locale-correct display end to end | Displayed, quoted, charged and invoiced amounts are equal to the cent across every currency, proven by test | OPEN |
| **P3-140** | Purchase on behalf of a tenant | P3-130 | Reseller and partner-initiated purchase with clear attribution and consent | A purchase made on a tenant's behalf records both principals and requires the tenant's consent | OPEN |
| **P3-141** | Free and zero-cost acquisition | P3-034 | Free products and trials acquired through the same order pipeline, with no separate path | A free acquisition produces an order and entitlement through the identical code path, proven by test | OPEN |
| **P3-142** | Trial-to-paid conversion | P3-034 | Conversion with prorating, notification before charge and cancellation before conversion | A trial never converts without prior notice within the stated window, enforced mechanically | OPEN |
| **P3-143** | Purchase idempotency and double-charge prevention | P3-008 | End-to-end idempotency across checkout retries, browser refreshes and provider webhooks | A double-submitted checkout charges once, proven under induced failure at every step | OPEN |
| **P3-144** | Fraud detection and prevention | P3-018 | Risk scoring, velocity checks, and review queues for suspicious purchases | A carding pattern is blocked before charge. A false positive has a documented review path | OPEN |
| **P3-145** | Checkout performance and reliability | P3-019 | Checkout resilient to downstream latency, with clear state at every failure point | With the payment provider degraded, checkout fails safely and states the position, never leaving an ambiguous order | OPEN |
| **P3-146** | Order history and receipts | P3-136 | Buyer-visible order history with receipts, downloadable and re-sendable | Every order has a retrievable receipt matching the charged amount exactly | OPEN |
| **P3-147** | Purchase notification | P3-093 | Notifying buyer, tenant admin and publisher of purchase events with preference control | Every party is notified per policy. An unsubscribed channel receives nothing | OPEN |
| **P3-148** | Checkout accessibility | P3-047 | WCAG 2.2 AA across the full purchase journey including payment and challenge surfaces | The complete journey is `axe` clean and completable by keyboard and screen reader | OPEN |
| **P3-149** | Checkout analytics | P3-061 | Funnel measurement from detail view to completed order with drop-off attribution | The step causing the greatest abandonment is identifiable from analytics alone | OPEN |
| **P3-150** | Stage F correctness proof | P3-137 | A suite exercising every pricing model, currency and failure point, asserting charged equals quoted and no orphaned charge or entitlement exists | The suite finds no divergence, and finds one immediately when a compensation step is deliberately removed | OPEN |

---

## 11. Stage G · Subscriptions, entitlement and licensing (Wave 3)

Entitlement is the single source of truth for what a tenant may run. The rule: **installed software
asks entitlement, and entitlement is never inferred from billing state.** The two are reconciled
(`P3-329`), not conflated — because a payment provider outage must never silently disable a
customer's ERP.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-151** | Entitlement model | P3-136 | `Entitlement` as the authoritative record of what a tenant may run, with source, scope, quantity and validity | Entitlement is readable without consulting billing, and its source is always attributable to an order or grant | OPEN |
| **P3-152** | Entitlement grant and revocation | P3-151 | Granting on purchase and revoking on termination, transactionally with the order | A grant and its order commit atomically. Neither can exist without the other, proven by injection | OPEN |
| **P3-153** | Entitlement check API | P3-151 | The runtime interface installed software queries, with caching, offline tolerance and fail-safe defaults | An entitlement service outage does not disable a paid, valid entitlement — the declared grace behaviour applies, proven by test | OPEN |
| **P3-154** | Subscription model | P3-151 | `Subscription` with term, renewal, billing cycle, quantity and state machine | An invalid subscription transition is refused at the database level | OPEN |
| **P3-155** | Renewal processing | P3-154 | Automatic and manual renewal with advance notification and price-change disclosure | A renewal at a changed price notifies within the stated window, and a renewal without notice is impossible | OPEN |
| **P3-156** | Upgrade, downgrade and plan change | P3-154 | Mid-term plan changes with proration, effective dating and entitlement adjustment | A mid-term upgrade prorates exactly as declared and adjusts entitlement immediately, verified against hand computation | OPEN |
| **P3-157** | Seat management | P3-122 | Adding, removing and reassigning seats with entitlement and billing effects | Seat count, entitlement and invoice agree at all times, asserted continuously | OPEN |
| **P3-158** | Cancellation and termination | P3-154 | Cancellation with effective date, end-of-term behaviour, data retention and reactivation | A cancelled subscription remains usable to its paid-through date, and the data outcome is exactly what was disclosed | OPEN |
| **P3-159** | Pause and suspension | P3-154 | Voluntary pause and involuntary suspension with distinct entitlement effects | A suspension for non-payment is distinguishable from a voluntary pause in both entitlement and messaging | OPEN |
| **P3-160** | Dunning and involuntary churn recovery | P3-135 | Retry schedules, escalating notification and a grace period before entitlement effect | A failed payment never immediately disables a customer. The grace period is enforced and observable | OPEN |
| **P3-161** | Entitlement for bundles and suites | P3-041 | Bundle entitlement decomposed into component entitlements with correct removal semantics | Removing one component from a bundle affects only that component's entitlement, proven by test | OPEN |
| **P3-162** | Licence enforcement in installed products | P3-153 | The client-side contract: how installed products check, cache and respond to entitlement | A product with a lapsed entitlement degrades exactly as declared and never corrupts tenant data | OPEN |
| **P3-163** | Offline and disconnected entitlement | P3-153 | Signed, time-limited entitlement tokens for disconnected operation | A disconnected client operates for the declared window and then degrades as stated, proven by test | OPEN |
| **P3-164** | Entitlement transfer and migration | P3-094 | Moving entitlements on tenant merge, split, rename or product transfer | A tenant merge preserves every entitlement with no duplication and no loss, proven by test | OPEN |
| **P3-165** | Trial entitlement and limits | P3-034 | Trial-scoped entitlement with usage caps and conversion tracking | A trial cannot exceed its declared caps, enforced by entitlement rather than by the product's own honesty | OPEN |
| **P3-166** | Enterprise agreements and true-up | P3-125 | Contract-based entitlement with committed volumes and periodic true-up | A true-up computes the exact overage against the committed volume, verified against hand computation | OPEN |
| **P3-167** | Entitlement audit and history | P3-010 | Full history of every entitlement change with cause and actor | Any current entitlement is explainable from its history alone, without inference | OPEN |
| **P3-168** | Over-entitlement and compliance reporting | P3-157 | Detecting usage beyond entitlement and reporting it to tenant and publisher | Usage beyond entitlement is detected within the stated window and surfaced before enforcement | OPEN |
| **P3-169** | Grace, courtesy and goodwill mechanisms | P3-160 | Operator-granted extensions and courtesy credits, bounded, audited and reversible | A goodwill grant is time-boxed, attributed and cannot be issued beyond an authority limit | OPEN |
| **P3-170** | Subscription self-service | P3-156 | Buyer-side management: view, upgrade, downgrade, add seats, cancel, without contacting support | Every subscription change a buyer is permitted is completable self-service, verified per change type | OPEN |
| **P3-171** | Renewal and expiry notification | P3-147 | Advance notification of renewal, price change, expiry and card expiry, with preference control | No subscription lapses or renews without prior notification, enforced mechanically | OPEN |
| **P3-172** | Commercial failure-state UX | P3-160 | The UX-6 mechanism: lapsed, suspended, over-limit and revoked states explained with a concrete resolution path | Every commercial failure state names its cause and its resolution. A dead-end state fails a gate | OPEN |
| **P3-173** | Entitlement performance | P3-153 | Entitlement checks within a latency budget under production-scale concurrency | The check meets its budget at target concurrency and degrades safely beyond it, measured | OPEN |
| **P3-174** | Entitlement isolation | P3-005 | Strict tenant scoping of every entitlement read and write | Two-tenant test proves tenant B sees **zero** of tenant A's entitlements | OPEN |
| **P3-175** | Publisher-side entitlement visibility | P3-167 | Publishers seeing their own products' entitlements without seeing tenant business data | A publisher sees entitlement counts and states, and provably nothing about the tenant's data | OPEN |
| **P3-176** | Entitlement webhooks and events | P3-009 | Entitlement changes published to installed products and publishers with delivery guarantees | A subscriber offline for an hour receives every entitlement event on return, in order | OPEN |
| **P3-177** | Bulk entitlement operations | P3-152 | Bulk grant, revoke and adjust for enterprise and migration scenarios, with dry run | A bulk operation's dry run matches its execution exactly, verified differentially | OPEN |
| **P3-178** | Stage G proof | P3-153 | A suite driving every subscription lifecycle path against a controllable clock, asserting entitlement correctness at every point | Entitlement is correct at every transition across a simulated multi-year lifecycle, and a deliberately altered proration is caught | OPEN |

---

## 12. Stage H · Billing, invoicing, tax and payouts (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-179** | Billing account model | P3-136 | `BillingAccount` distinct from tenant, supporting multiple tenants per account and multiple accounts per group | Billing hierarchy is expressible without duplicating tenant records, proven against enterprise fixtures | OPEN |
| **P3-180** | Charge and line-item model | P3-006 | Immutable charge records with full derivation from price, quantity, period and discount | Every charge's derivation is reproducible from stored data alone, verified by recomputation | OPEN |
| **P3-181** | Billing cycle and period handling | P3-154 | Anniversary and calendar cycles, period boundaries, timezone correctness and leap handling | A subscription starting 31 January bills correctly every month of a leap year, verified against fixtures | OPEN |
| **P3-182** | Proration engine | P3-156 | Proration for mid-period changes with declared method and rounding | Proration matches hand-computed values across an edge-case fixture set including same-day changes | OPEN |
| **P3-183** | Usage rating and aggregation | P3-123 | Ingesting usage events, deduplicating, aggregating and rating them into charges | Rated usage reconciles with raw events exactly. A duplicate event never double-charges, proven by test | OPEN |
| **P3-184** | Invoice generation | P3-180 | Invoices with line items, taxes, credits and totals, generated deterministically | Two generations of one invoice are byte-identical. Invoice totals equal the sum of their lines exactly | OPEN |
| **P3-185** | Invoice numbering and statutory sequence | P3-184 | Gapless, jurisdiction-compliant invoice numbering that survives concurrency and failure | No gap and no duplicate in the sequence under 10,000 concurrent invoice creations with induced failures | OPEN |
| **P3-186** | Credit notes and adjustments | P3-184 | Credit notes, adjustments and write-offs, never by editing an issued invoice | An issued invoice is immutable. A correction is always a new document, enforced at the database level | OPEN |
| **P3-187** | Tax determination | P3-179 | Tax calculation by jurisdiction, product type, customer status and place of supply, via a tax engine | Tax matches the engine's authority for every fixture jurisdiction. An unsupported jurisdiction blocks the sale rather than guessing | OPEN |
| **P3-188** | Tax identifier validation and reverse charge | P3-187 | VAT/GST identifier validation and reverse-charge treatment where applicable | A validated business identifier in an applicable jurisdiction produces the correct reverse-charge treatment, verified per jurisdiction | OPEN |
| **P3-189** | Tax reporting and filing support | P3-187 | Jurisdictional tax reports reconciling to invoices and to remittances | Tax reported equals tax charged equals tax remitted, asserted by reconciliation | OPEN |
| **P3-190** | Tax-inclusive and exclusive display | P3-138 | Correct display convention per market, consistent from listing through invoice | A market requiring tax-inclusive display shows it consistently everywhere, verified across the journey | OPEN |
| **P3-191** | Payment collection and settlement | P3-132 | Collecting payment against invoices with settlement tracking and provider reconciliation | Every collected payment reconciles to a provider settlement record. An unreconciled payment raises an alert | OPEN |
| **P3-192** | Refund processing | P3-186 | Full and partial refunds with entitlement effect, credit note and provider execution | A refund produces a credit note, adjusts entitlement and reaches the provider — all three, or none, proven by injection | OPEN |
| **P3-193** | Chargeback and dispute handling | P3-191 | Receiving, evidencing and resolving chargebacks with entitlement policy per outcome | A chargeback triggers the declared entitlement policy and an evidence package is assembled automatically | OPEN |
| **P3-194** | Revenue share and commission model | P3-180 | The platform's commission structure, per-publisher rates and computation on every transaction | Commission is computed and stored per transaction and reconciles to the platform's own revenue records | OPEN |
| **P3-195** | Publisher earnings ledger | P3-194 | A double-entry ledger of publisher earnings, adjustments, holds and payouts | The ledger balances at all times. An unbalanced entry cannot be written, enforced at the database level | OPEN |
| **P3-196** | Payout scheduling and execution | P3-195 | Scheduled payouts with thresholds, holds, currency handling and provider execution — replacing or absorbing the existing `payout.service.ts` per the P3-002 audit | A payout equals the ledger's payable balance exactly, and is idempotent under retry, proven under induced failure | OPEN |
| **P3-197** | Payout holds, reserves and clawback | P3-195 | Rolling reserves, dispute holds and clawback for refunded or fraudulent sales | A refunded sale claws back its commission and publisher earnings correctly, proven by test | OPEN |
| **P3-198** | Withholding and tax on payouts | P3-079 | Jurisdictional withholding, tax documentation and year-end reporting to publishers | Withholding matches the publisher's declared status and jurisdiction, verified per fixture | OPEN |
| **P3-199** | Payout notification and statements | P3-195 | Publisher statements reconciling sales, refunds, commission, adjustments and payout | A statement's figures reconcile to the ledger exactly, asserted by comparison | OPEN |
| **P3-200** | Multi-currency settlement | P3-032 | Collecting and paying in multiple currencies with explicit conversion points and recorded rates | Every conversion records its rate and time. Reconciliation holds across currencies to the cent | OPEN |
| **P3-201** | Financial reconciliation | P3-191 | Continuous reconciliation between orders, invoices, provider settlements and the ledger | Any divergence is detected within the stated window and alerts. A seeded divergence is always caught | OPEN |
| **P3-202** | Revenue recognition support | P3-180 | Deferred revenue schedules and recognition events for subscription and usage revenue | Recognised revenue reconciles to invoiced revenue and to the recognition schedule, asserted by report | OPEN |
| **P3-203** | Billing for first-party products | P3-042 | Platform modules billed through the same pipeline as third-party products | A first-party purchase produces an order, invoice and entitlement identically, proven by test | OPEN |
| **P3-204** | Reseller and channel billing | P3-140 | Reseller purchase, margin, invoicing to reseller and entitlement to end tenant | A reseller transaction bills the reseller and entitles the tenant, with both records consistent | OPEN |
| **P3-205** | Purchase order and offline payment | P3-131 | Invoice-based purchase with PO reference, terms and manual settlement | An invoice-paying enterprise obtains entitlement per terms without a card, with settlement tracked | OPEN |
| **P3-206** | Billing self-service portal | P3-184 | Buyer-side invoices, payment methods, billing contacts, tax details and history | Every routine billing task is self-service. A task requiring support is a documented exception | OPEN |
| **P3-207** | Billing accessibility | P3-047 | WCAG 2.2 AA across billing surfaces, invoices and statements | Billing surfaces are `axe` clean; generated documents are readable by assistive technology | OPEN |
| **P3-208** | Billing observability and alerting | P3-201 | Metrics on charge success, invoice generation, payout execution and reconciliation health | A billing failure is detected and alerted from real data, and the alert has been proven to fire | OPEN |
| **P3-209** | Financial audit trail and controls | P3-010 | Immutable audit over every financial record with segregation of duties on money movement | No single principal can both initiate and approve a payout, enforced mechanically | OPEN |
| **P3-210** | Stage H financial correctness proof | P3-201 | A suite driving a year of transactions — purchases, changes, refunds, chargebacks, payouts — asserting the ledger balances and every reconciliation holds | The books balance to the cent across the simulated year, and a deliberately altered commission rate is caught by reconciliation | OPEN |

---

## 13. Stage I · Installation and lifecycle in the tenant (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-211** | Install orchestration | P3-152 | Installing a purchased product into a tenant transactionally, with pre-flight checks and complete rollback | A failed install leaves no partial component, no schema change and no orphaned entitlement, proven by injection at each step | OPEN |
| **P3-212** | Pre-flight compatibility and capacity checks | P3-027 | Verifying platform version, dependencies, conflicts, storage and limits before install begins | An install that would fail is refused before it starts, with the blocking condition named | OPEN |
| **P3-213** | Install-time consent and permission grant | P3-108 | The buyer granting the application's requested scopes at install, with a record | An application receives exactly the scopes consented to and nothing more, proven by test | OPEN |
| **P3-214** | Installation state and inventory | P3-211 | Authoritative per-tenant record of what is installed, at which version, by whom and when | The inventory always matches actual installed state, asserted by continuous reconciliation | OPEN |
| **P3-215** | Update notification and changelog delivery | P3-026 | Notifying tenants of available updates with generated changelogs and breaking-change flags | An update with a breaking change cannot be presented as routine, enforced by classification | OPEN |
| **P3-216** | Update application | P3-214 | Applying updates with pre-flight, backup point, execution and verification | An update either completes and verifies, or rolls back completely — never a third state, proven by injection | OPEN |
| **P3-217** | Automatic and managed updates | P3-216 | Tenant-configurable auto-update policy by risk class, with maintenance windows | A tenant electing manual updates never receives an automatic one, except for the declared security exception | OPEN |
| **P3-218** | Rollback and version pinning | P3-216 | Rolling back a failed or unwanted update, and pinning a version | A rollback restores prior behaviour with tenant data intact, proven by test | OPEN |
| **P3-219** | Uninstall and data disposition | P3-214 | The UX-2 mechanism: uninstall with the data outcome disclosed before install and honoured after | The data disposition shown at install is exactly what occurs at uninstall, verified differentially | OPEN |
| **P3-220** | Orphan and residue detection | P3-219 | Detecting components, tables, policies and jobs left behind by an uninstall | An uninstall leaving residue is detected and reported as a defect against the product | OPEN |
| **P3-221** | Install-time and runtime isolation | P3-005 | Installed third-party products isolated from each other and from platform internals | A product cannot read another product's data or the platform's internals, proven by an escape suite | OPEN |
| **P3-222** | Sandbox and non-production installation | P3-211 | Installing into tenant sandboxes for evaluation and testing, with entitlement rules for non-production | A sandbox install does not consume a production entitlement, and cannot serve production traffic | OPEN |
| **P3-223** | Staged rollout across a tenant estate | P3-217 | Progressive rollout across a tenant's environments with promotion gates | A product is promoted from sandbox to production only after the declared gate passes | OPEN |
| **P3-224** | Configuration and post-install setup | P3-211 | Guided post-install configuration with validation and a resumable path | An installed product reaches a working configured state unaided, measured | OPEN |
| **P3-225** | Data migration on install and upgrade | P3-216 | Product-supplied data migrations executed safely with rollback and progress | A migration failure rolls back completely and reports the failing step | OPEN |
| **P3-226** | Health monitoring of installed products | P3-214 | Per-installation health, error rate, performance and limit consumption | A misbehaving installed product is identifiable to its tenant and its publisher from telemetry alone | OPEN |
| **P3-227** | Runtime revocation and kill switch | P3-115 | Immediately disabling a specific installation or every installation of a product | A revocation takes effect within the stated window across every install, verified by rehearsal | OPEN |
| **P3-228** | Tenant-side application governance | P3-213 | Tenant admin control over what may be installed, by whom, and which scopes are permitted | A tenant policy forbidding a scope prevents installation of any product requesting it, proven by test | OPEN |
| **P3-229** | Application inventory and audit for tenants | P3-214 | Tenant-visible inventory with scopes, data access, publisher, cost and last update | A tenant can answer "what third-party code runs here and what can it see" completely, from one surface | OPEN |
| **P3-230** | Cross-product conflict detection | P3-028 | Detecting conflicting products, duplicate capabilities and incompatible extensions | An install that would conflict is refused before it starts, with the conflict named | OPEN |
| **P3-231** | Install performance and scale | P3-211 | Installation within a stated time budget, including for large products and large tenants | A representative product installs within budget on a production-scale tenant, measured | OPEN |
| **P3-232** | Bulk and fleet installation | P3-223 | Installing across many tenants for enterprise and partner scenarios, with per-tenant outcome reporting | A fleet install reports exactly which tenants succeeded and why each failure failed | OPEN |
| **P3-233** | Install and lifecycle events | P3-009 | Install, update, uninstall and revoke events published to publisher and tenant subscribers | Every lifecycle event is delivered with guarantees, and replayable after subscriber downtime | OPEN |
| **P3-234** | Installed-product support handoff | P3-229 | Routing support requests for an installed product to its publisher with context and consent | A support request reaches the publisher with the context they need and no data the tenant did not consent to share | OPEN |
| **P3-235** | Installation accessibility | P3-047 | WCAG 2.2 AA across install, consent, configuration and inventory surfaces | The complete install journey is `axe` clean and keyboard-complete | OPEN |
| **P3-236** | Stage I lifecycle proof | P3-219 | A suite driving install, configure, update, rollback, revoke and uninstall for every product type, with failure injected at each step | Every path leaves a consistent state, and a deliberately removed rollback step is caught immediately | OPEN |

---

## 14. Stage J · Ratings, reviews, trust and safety (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-237** | Review and rating model | P3-214 | Reviews tied to verified installation, with rating dimensions and version context | A review cannot exist without a verified install of that product, enforced mechanically | OPEN |
| **P3-238** | Review submission and moderation | P3-237 | Submission, automated screening, human moderation and publication with a stated SLA | A review is published or refused within the SLA, and a refusal cites a policy clause | OPEN |
| **P3-239** | Publisher response | P3-238 | Publishers responding publicly to reviews, with the same moderation standard | A response is clearly attributed to the publisher and moderated identically | OPEN |
| **P3-240** | Rating aggregation and display | P3-237 | Aggregate ratings weighted by recency, version and verification, with the method published | The displayed aggregate is reproducible from the underlying reviews by the published method | OPEN |
| **P3-241** | Review integrity and manipulation detection | P3-238 | Detecting incentivised, coordinated and fake reviews, with removal and publisher consequences | A seeded coordinated-review campaign is detected. Removing the detection makes it succeed | OPEN |
| **P3-242** | Review helpfulness and sorting | P3-240 | Helpfulness voting and sorting that resists gaming | Sort order cannot be manipulated by a single actor at scale, proven by an abuse test | OPEN |
| **P3-243** | Quality signals and badges | P3-116 | The UX-5 mechanism for quality: badges from measured facts — support responsiveness, update cadence, incident record — each with an expiry | Every badge is derived from measured data and expires. A hand-awarded badge cannot exist | OPEN |
| **P3-244** | Abuse reporting | P3-238 | Buyer and publisher reporting of abusive content, policy violations and security concerns | Every report is triaged within the stated window and its outcome is communicated | OPEN |
| **P3-245** | Content policy enforcement | P3-088 | Automated and human enforcement of content policy across listings, reviews and responses | Every enforcement action cites a policy clause and is appealable | OPEN |
| **P3-246** | Publisher conduct and sanctions | P3-245 | Graduated sanctions from warning through delisting and termination, with due process | A sanction follows the published process, and a terminated publisher's customers are handled per policy | OPEN |
| **P3-247** | Trust and safety case management | P3-244 | Case queue, investigation tooling, decision recording and audit | Every trust decision is reconstructible from its case record | OPEN |
| **P3-248** | Impersonation and brand protection | P3-077 | Detecting and acting on impersonation of publishers, brands and platform identity | An impersonating listing is detected before publication, proven with seeded cases | OPEN |
| **P3-249** | Security incident communication | P3-114 | Coordinated communication to affected tenants when a published product is compromised | An incident rehearsal reaches every affected tenant within the stated window | OPEN |
| **P3-250** | Buyer protection policy | P3-192 | Published guarantees on refunds, misrepresentation and product failure, enforced mechanically | A qualifying refund claim is honoured within the published window without discretion | OPEN |
| **P3-251** | Review accessibility and localisation | P3-047 | Reviews readable, submittable and navigable accessibly and per locale | Review surfaces are `axe` clean and localised, including rating controls | OPEN |
| **P3-252** | Reputation portability and history | P3-240 | A publisher's record following them across products and over time, including sanctions | A publisher's history is visible to buyers and cannot be reset by relisting | OPEN |
| **P3-253** | Transparency reporting | P3-118 | Published reporting on enforcement, removals, appeals and outcomes | The report is generated from case data and cannot be hand-edited | OPEN |
| **P3-254** | Regulatory complaint handling | P3-244 | Statutory notice-and-action and complaint mechanisms where required | A statutory complaint receives the required response within the statutory window, enforced by SLA | OPEN |
| **P3-255** | Review and trust analytics | P3-241 | Signals on review health, manipulation attempts and enforcement effectiveness | Manipulation attempt volume and detection rate are both measured, not estimated | OPEN |
| **P3-256** | Stage J integrity proof | P3-241 | An adversarial suite attempting fake reviews, rating manipulation, impersonation and policy evasion | Every attempt is detected or blocked, and each succeeds the moment its control is removed | OPEN |

---

## 15. Stage K · Publisher business, analytics and partner programme (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-257** | Publisher dashboard | P3-097 | The publisher's home: revenue, installs, active tenants, review health, open issues | Every number is defined, sourced and reconcilable to its underlying records | OPEN |
| **P3-258** | Sales and revenue reporting | P3-195 | Revenue by product, period, region, plan and channel, reconciling to the earnings ledger | Reported revenue equals ledger revenue exactly, asserted by comparison | OPEN |
| **P3-259** | Install and usage analytics | P3-226 | Installs, uninstalls, active usage and version distribution, without exposing tenant business data | A publisher sees adoption and provably nothing about a tenant's records, verified by an inference test | OPEN |
| **P3-260** | Churn and retention analytics | P3-158 | Churn rate, cohort retention, expansion and contraction, with cause attribution where known | Churn figures reconcile to subscription state changes exactly | OPEN |
| **P3-261** | Funnel analytics for publishers | P3-149 | Impressions, detail views, trials, conversions and their rates per product | A publisher can identify which funnel step limits their growth from the data alone | OPEN |
| **P3-262** | Payout reporting and forecasting | P3-199 | Payout history, pending balance, holds and next scheduled payout with a forecast | Forecast payout matches actual payout within the stated tolerance, measured over time | OPEN |
| **P3-263** | Publisher data export and API | P3-258 | Programmatic access to a publisher's own analytics and financial data | Every dashboard figure is retrievable by API. A UI-only figure fails the parity test | OPEN |
| **P3-264** | Privacy boundary for publisher analytics | P3-259 | The formal boundary on what a publisher may learn about tenants, with aggregation thresholds | An aggregate over too few tenants is suppressed. Re-identification through repeated queries is prevented, proven by test | OPEN |
| **P3-265** | Partner tiers and programme | P3-116 | Partner levels with defined criteria, benefits and review cadence | Tier assignment is computed from measured criteria, and a tier cannot be granted manually | OPEN |
| **P3-266** | Business legibility surface | P3-262 | The UX-4 mechanism: every revenue, churn and payout figure explained to its cause without a support ticket | Each headline figure links to its derivation and to the records behind it | OPEN |
| **P3-267** | Co-marketing and promotion tooling | P3-070 | Publisher access to promotional placements, with labelling applied automatically | A promoted placement is always labelled, and labelling cannot be disabled by the purchaser of the placement | OPEN |
| **P3-268** | Lead sharing and referral | P3-068 | Sharing qualified buyer interest with publishers under consent | A lead is shared only with recorded consent, and the consent is revocable | OPEN |
| **P3-269** | Publisher billing and fees | P3-194 | Listing fees, programme fees and their invoicing to publishers | Fees charged reconcile to the published fee schedule exactly | OPEN |
| **P3-270** | Certification and training | P3-265 | Publisher certification paths tied to real assessment | A certification badge maps to a passed assessment with an expiry | OPEN |
| **P3-271** | Publisher community and feedback | P3-093 | Structured channels for publisher feedback into platform planning | Publisher-reported platform defects reach the owning team with reproduction attached | OPEN |
| **P3-272** | Enterprise and private-offer tooling | P3-125 | Publisher-side creation and management of private offers and negotiated terms | A private offer is created, sent, accepted and billed correctly end to end | OPEN |
| **P3-273** | Multi-product portfolio analytics | P3-258 | Cross-product analysis: attach rate, bundling effect, cannibalisation | A publisher with a portfolio sees cross-product effects, computed not estimated | OPEN |
| **P3-274** | Publisher benchmarking | P3-264 | Anonymised category benchmarks respecting the privacy boundary | A benchmark cannot be used to identify another publisher's figures, proven by an inference test | OPEN |
| **P3-275** | Publisher support and escalation | P3-093 | Support channels, severity model and escalation into platform engineering | A publisher-reported platform defect is tracked to resolution with SLA measurement | OPEN |
| **P3-276** | Publisher analytics performance | P3-263 | Analytics queries within budget at portfolio scale | A publisher with 50 products and a million installs loads their dashboard within budget, measured | OPEN |
| **P3-277** | Publisher analytics accessibility | P3-097 | WCAG 2.2 AA across analytics, including every chart | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P3-278** | Stage K proof | P3-264 | A suite asserting every publisher-facing figure reconciles to source and that the privacy boundary holds | Figures reconcile exactly, and a deliberately lowered aggregation threshold is caught | OPEN |

---

## 16. Stage L · Support, disputes and refunds (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-279** | Support responsibility model | P3-234 | The published division of support responsibility between platform and publisher, per product type | Every support request routes to the correct party by rule, not by judgement | OPEN |
| **P3-280** | Buyer support request intake | P3-279 | Buyer-initiated support with product context, entitlement state and consented diagnostics | A support request carries the context needed to act, without data the buyer did not consent to share | OPEN |
| **P3-281** | Publisher support SLA and measurement | P3-243 | Declared and measured publisher response times feeding the quality badge | A publisher's measured responsiveness drives their badge automatically | OPEN |
| **P3-282** | Escalation from publisher to platform | P3-275 | Escalating unresolved issues, with platform intervention criteria | An unresolved qualifying issue escalates automatically at the declared threshold | OPEN |
| **P3-283** | Refund request and adjudication | P3-250 | Buyer refund requests adjudicated against published policy with an appeal path | A qualifying request is honoured without discretion. A refusal cites a policy clause | OPEN |
| **P3-284** | Refund execution and effects | P3-192 | Executing an adjudicated refund across payment, entitlement, ledger and installation | All four effects occur, or none, proven by injection at each step | OPEN |
| **P3-285** | Dispute between buyer and publisher | P3-283 | A structured dispute process with evidence, mediation and binding outcome | Every dispute reaches a recorded outcome within the published window | OPEN |
| **P3-286** | Chargeback defence | P3-193 | Assembling evidence and representing disputed transactions to the provider | An evidence package is assembled automatically from stored records | OPEN |
| **P3-287** | Service credits and SLA remedies | P3-169 | Credits issued when platform SLAs are breached, computed rather than negotiated | An SLA breach produces the entitled credit automatically, verified against the SLA definition | OPEN |
| **P3-288** | Incident impact and remediation | P3-249 | Determining commercial impact of an incident and applying remedies across affected tenants | An incident's affected tenant set is computed from real data, not estimated | OPEN |
| **P3-289** | Knowledge base and self-service support | P3-088 | Searchable help for buyers and publishers, versioned with the platform | Support content search returns useful results, measured against a query corpus | OPEN |
| **P3-290** | Support case analytics | P3-280 | Volume, resolution time, root cause and product attribution | The products generating disproportionate support load are identifiable from the data | OPEN |
| **P3-291** | Support access to buyer context | P3-096 | Time-boxed, consented, audited support access to a tenant's marketplace state | Support access without consent is impossible. Every action attributes to both principals | OPEN |
| **P3-292** | Refund and dispute analytics | P3-283 | Rates by product, publisher, reason and outcome, feeding quality signals | An elevated refund rate is detected and surfaced to the publisher and to trust and safety | OPEN |
| **P3-293** | Communication templates and localisation | P3-038 | Every commercial and support communication templated, versioned and localised | No commercial communication is sent untemplated. Every template exists in every supported locale | OPEN |
| **P3-294** | Support accessibility | P3-047 | WCAG 2.2 AA across support intake, case view and knowledge base | Support surfaces are `axe` clean and keyboard-complete | OPEN |
| **P3-295** | Support tooling for platform staff | P3-291 | The internal console for commercial support: order, entitlement, billing and install state in one view | A support agent can diagnose a commercial issue without database access, verified by exercise | OPEN |
| **P3-296** | Stage L proof | P3-284 | A suite driving refund, dispute, chargeback and credit paths, asserting money, entitlement and installation stay consistent | Consistency holds across every path, and a deliberately skipped entitlement adjustment is caught | OPEN |

---

## 17. Stage M · Compliance, legal and regional operation (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-297** | Marketplace terms and legal framework | P3-078 | Buyer, publisher and platform terms — versioned, jurisdiction-aware, with acceptance records | Every transaction is attributable to accepted terms versions, reproducible from the record | OPEN |
| **P3-298** | Platform liability and intermediary position | P3-297 | The declared legal position on platform liability per jurisdiction, reflected in flows and copy | Product behaviour matches the declared legal position, reviewed and recorded | OPEN |
| **P3-299** | Consumer protection compliance | P3-250 | Statutory withdrawal rights, pre-contract disclosure and cancellation, where applicable | A jurisdiction's statutory rights are honoured mechanically, per jurisdiction fixture | OPEN |
| **P3-300** | Data protection and processor chain | P3-106 | The processor and sub-processor chain across platform, publisher and tenant, with agreements and disclosure | Every data flow has a legal basis and a recorded agreement. An undisclosed sub-processor is refused | OPEN |
| **P3-301** | Cross-border data and residency in commerce | P3-089 | Residency requirements applied to commercial and entitlement data | Commercial data for a resident tenant is provably absent from non-permitted regions, verified by query | OPEN |
| **P3-302** | Sanctions, export control and screening | P3-076 | Screening publishers, tenants and transactions against sanctions and export restrictions | A sanctioned party cannot transact, and screening failures block rather than warn | OPEN |
| **P3-303** | Anti-money-laundering and know-your-customer | P3-079 | KYC on publishers receiving payouts, with risk-based diligence | A payout to an unverified publisher is impossible, enforced mechanically | OPEN |
| **P3-304** | Accessibility statement and conformance | P3-047 | Published accessibility conformance for the marketplace, generated from real audit results | The statement is generated from audit data and cannot claim untested conformance | OPEN |
| **P3-305** | Marketplace regulation compliance | P3-070 | Ranking transparency, contract terms, complaint handling and reporting where required by platform regulation | Each statutory requirement maps to a mechanism and a test, not to a policy document alone | OPEN |
| **P3-306** | Record retention for commercial data | P3-010 | Statutory retention of invoices, contracts and transaction records, with legal hold | Retention meets the longest applicable statutory period, and purge honours holds, proven by test | OPEN |
| **P3-307** | Regional market configuration | P3-032 | Per-market configuration: currencies, taxes, payment methods, legal terms, available products | Launching a new market is a configuration change with a completeness checklist, not a code change | OPEN |
| **P3-308** | Regional launch readiness gate | P3-307 | A gate preventing a market opening before its legal, tax and payment requirements are complete | An incomplete market cannot accept a transaction, enforced mechanically | OPEN |
| **P3-309** | Compliance evidence generation | P3-306 | Evidence for audit generated by mechanism rather than assembled by hand | Every claimed control produces evidence automatically. A hand-written control claim fails the check | OPEN |
| **P3-310** | Third-party audit support | P3-309 | The artefacts and access an external auditor requires, with scoped, audited access | An audit request is satisfiable from generated evidence, verified by rehearsal | OPEN |
| **P3-311** | Policy change management | P3-297 | Changing terms and policies with notice, acceptance and grandfathering | A term change cannot take effect for existing parties inside the notice period, enforced mechanically | OPEN |
| **P3-312** | Stage M compliance proof | P3-308 | A suite asserting each statutory and policy control is enforced by a mechanism that can fail | Every control has a test, and each control's removal makes its test fail | OPEN |

---

## 18. Stage N · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P3-313** | Coverage that can fail | P3-003 | Coverage across this programme's code with `all: true`, real thresholds and a ratchet from the P3-003 baseline | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P3-314** | Replacement of coverage-padding tests | P3-003 | The padding specs identified in P3-003 replaced with tests that assert behaviour | Every replaced test fails when its subject is deliberately broken, individually verified | OPEN |
| **P3-315** | Unit and component test estate | P3-313 | Unit coverage of pricing, proration, tax, entitlement, ledger and reconciliation engines | Each engine meets threshold with property-based tests over generated inputs | OPEN |
| **P3-316** | Integration testing against real infrastructure | P3-020 | Integration suites against real Postgres, real queue and real payment-provider sandboxes | The suite runs against real infrastructure in CI. A mock-only pass is caught | OPEN |
| **P3-317** | Contract testing across boundaries | P3-004 | Consumer-driven contract tests for the publication contract, entitlement API, payment and tax providers | A breaking change on either side of any boundary fails before reaching a consumer | OPEN |
| **P3-318** | End-to-end commercial journeys | P3-236 | Automated journeys: discover, purchase, install, use, upgrade, renew, refund, uninstall | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P3-319** | Two-tenant and two-publisher isolation testing | P3-005 | An isolation test for every table, endpoint and report in this programme | A surface without an isolation test fails a coverage gate. Every test proves **zero** rows | OPEN |
| **P3-320** | Financial property-based testing | P3-210 | Property tests asserting invariants — the ledger balances, charged equals quoted, entitlement matches order — over generated transaction sequences | No invariant violation across 10,000 generated sequences, and immediate detection when one is weakened | OPEN |
| **P3-321** | Payment provider failure testing | P3-145 | Injecting timeouts, duplicates, out-of-order webhooks, and provider outages | No injected failure produces a double charge, a lost entitlement or an inconsistent order | OPEN |
| **P3-322** | Load and peak testing | P3-019 | Load profiles for catalogue browse, search, checkout and entitlement check, including launch-day peaks | Targets met at peak profile. A regression beyond threshold fails CI | OPEN |
| **P3-323** | Soak and endurance testing | P3-322 | Long-running tests detecting leaks, unbounded growth and scheduled-job drift | A 24-hour soak shows no unbounded growth and no missed billing run | OPEN |
| **P3-324** | Accessibility audit across the estate | P3-047 | Full WCAG 2.2 AA audit of storefront, checkout, publisher portal and tenant surfaces | The estate is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P3-325** | Security testing and penetration exercise | P3-120 | Automated scanning plus a structured penetration exercise against the commercial surface | Every finding is remediated or explicitly accepted with a reason, and each remediation has a failing-without-it test | OPEN |
| **P3-326** | Chaos and disaster recovery | P3-201 | Failure injection across tiers and a rehearsed recovery, including mid-billing-run failure | A recovery rehearsal meets the stated objective with the books still balancing | OPEN |
| **P3-327** | Billing-run rehearsal at scale | P3-210 | A full production-scale billing run rehearsal with verification against expected output | A rehearsed run at production volume completes within its window and reconciles exactly | OPEN |
| **P3-328** | Launch readiness for a market | P3-308 | The evidenced checklist a market must satisfy before opening | A market cannot open with an unticked item, enforced mechanically | OPEN |
| **P3-329** | The three-way reconciliation proof | P3-320 | The § 1 invariant made mechanical: continuous reconciliation between billing, entitlement and installed state, alerting on any divergence | A seeded divergence in each of the three directions is detected within the stated window. Disabling the reconciler fails its own test | OPEN |
| **P3-330** | Programme 3 launch readiness | P3-329 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 19 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 19. Programme exit criteria

- [ ] **Billing, entitlement and installed state reconcile continuously; any divergence alerts** (P3-329)
- [ ] A listing cannot claim a capability its package does not contain (P3-030)
- [ ] A deliberately malicious package is refused, and becomes approvable only when a named check is removed (P3-120)
- [ ] The buyer sees the total cost — tax, seats, usage, renewal — before committing (P3-138)
- [ ] Displayed, quoted, charged and invoiced amounts are equal to the cent in every currency (P3-139)
- [ ] Money is `Decimal(19,4)` with explicit currency; a `Float` in a money path fails CI (P3-006)
- [ ] A retried purchase charges once, under induced failure at every step (P3-143)
- [ ] No charge exists without entitlement and no entitlement without charge (P3-137, P3-150)
- [ ] Invoice numbering is gapless under concurrency and failure (P3-185)
- [ ] An issued invoice is immutable; corrections are new documents (P3-186)
- [ ] The publisher earnings ledger balances at all times, enforced at the database level (P3-195)
- [ ] No single principal can both initiate and approve a payout (P3-209)
- [ ] A payment provider outage does not disable a paid, valid entitlement (P3-153)
- [ ] Uninstall data disposition is disclosed before install and matches what occurs (P3-219)
- [ ] Every requested scope has a plain-language explanation, enforced mechanically (P3-108)
- [ ] A publisher sees adoption and provably nothing about a tenant's records (P3-264)
- [ ] Every badge maps to a verified fact with an expiry and downgrades automatically (P3-116, P3-243)
- [ ] Paid placement is labelled by the system, not by the merchandiser (P3-070)
- [ ] First-party products pass the identical review and billing pipeline, with no bypass (P3-117, P3-203)
- [ ] Every surface has a two-tenant isolation test proving **zero** rows (P3-319)
- [ ] Coverage thresholds have been proven able to fail, and the padding specs from P3-003 are replaced (P3-313, P3-314)
- [ ] Every UI primitive lives in `unierp-design-system` with a story; zero hardcoded colours or spacing (P3-013)
- [ ] The programme is provable end to end against reference packages, without Programme 2 (P3-004)

---

## 20. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 3 established (P3-001–P3-330), the Marketplace.** Registered per README § 0 rule 1. Started from the measured state of `unierp-api/src/modules/marketplace` (16 files, including an existing `payout.service.ts` — money-movement code already in the tree), not from zero: `P3-002` and `P3-003` audit what exists before anything extends it, because 2 of its 5 test files are coverage-padding specs of the kind D016 inventories. Independence from Programme 2 is discharged by `P3-004`, a conformance harness with a reference publisher, so the Marketplace is provable before any third-party application exists. `P3-030` applies Track H's `H03` claim-verification mechanism to every listing in the catalogue. | Claude Code |
