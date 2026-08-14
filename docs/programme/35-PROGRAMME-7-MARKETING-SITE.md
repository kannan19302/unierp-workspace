# PROGRAMME 7 · PREMIUM MARKETING SITE AND ITS ADMIN CONSOLE — P7-001–P7-316

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 7` resolves waves from this
> document and can only ever hand out a `P7-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** `P7-004` is the
runtime precondition gate. This site has its own database, its own middleware and its own auth —
plane 0, a deliberately separate blast radius — which makes it the easiest programme in the family
to keep genuinely independent, and this document keeps it that way.

---

## 1. What this programme owns

`unierp-corporate-website` — **plane 0, public.** unierp.com: what the world sees, the path from
stranger to paying tenant, and the admin console that controls all of it without a deploy.

**The invariant this programme establishes:**

> **Every word on the public site is true, and is changeable without a deploy.**

Both halves are mechanical. The second is what the admin console is for. **The first is a standing
hazard for this project specifically**, and it is why this programme is written the way it is:
UniERP's own documents have repeatedly claimed capabilities that did not exist — `typecheck` passing
with `@ts-nocheck` on every file, a layer gate running in 21 repositories and existing in none
(**D013**), a documented `pnpm dev` pointing at a retired monorepo (**D005**), and a pricing page
hardcoding a static plan array while a real billing model sat behind a real endpoint (**D133**).

**A marketing site is the costliest possible place for that pattern to recur, because a false claim
there is a false claim to a customer.** `P7-030` is the gate that makes it impossible, and `P7-314`
is its adversarial proof.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Files | 267 | `find unierp-corporate-website -type f -not -path "*/node_modules/*"` |
| Route pages | **45** | `find unierp-corporate-website -name page.tsx -not -path "*/node_modules/*"` |
| Last commit | `ci: wire the token gate (B15) into this repo's own CI` (2026-08-12) | `git log -1` |
| Programme 1 Track H | **3/18 DONE** — H02, H03, H04 | `node scripts/phase-brief.mjs --status` |

Track H is 3/18 and what it completed matters here: **H03 shipped the claim-verification gate and
H04 reviewed this site's independent auth.** Those are the two hardest and most load-bearing pieces,
and this programme extends them rather than rebuilding them. `P7-002` measures the existing gate's
actual coverage before `P7-030` deepens it — because a gate that covers three claims and is believed
to cover all of them is worse than no gate.

Per `00-BASELINE § 4②` the repository carries 20 public sections and 19 admin pages over 38 API
routes on a 25-model schema — a genuine CMS foundation. But Track H recorded that
`admin/content/page.tsx` and `admin/tools/page.tsx` are **5 lines each**, and content is the admin's
entire reason to exist. `P7-003` re-measures both claims before any phase depends on them.

**Reference set.** Stripe (the standard for developer-facing marketing clarity and documentation),
Linear and Vercel (premium visual craft and performance discipline), Salesforce and HubSpot
(conversion architecture and lifecycle marketing), Notion (content-led growth), Cloudflare and
Datadog (trust and status surfaces), Sanity and Contentful (the editorial model), and Basecamp for
the discipline of saying less, truthfully.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Nothing aspirational is stated in the present tense.** | This project's own D013/D133 history | `P7-030` |
| **UX-2** | **Every word is editable without a deploy.** | Contentful; Sanity | `P7-054`, `P7-316` |
| **UX-3** | **The published price is the charged price.** Never a second source of truth. | D133, directly | `P7-149` |
| **UX-4** | **Performance is a design constraint, not a launch task.** | Vercel; Linear | `P7-208` |
| **UX-5** | **The path from stranger to working tenant is short, measured, and unaided.** | Stripe; Vercel | `P7-160` |
| **UX-6** | **Trust surfaces link to evidence or are absent.** No badge without a fact. | Cloudflare trust centre | `P7-231` |
| **UX-7** | **Consent is real.** Nothing tracks before it is given. | GDPR/ePrivacy, enforced | `P7-216` |

---

## 3. Design-system rule

`unierp-design-system` is the only source of UI primitives, and this repository's CI already runs the
B15 token gate as of 2026-08-12. This programme adds the marketing primitives — hero, feature block,
pricing table, comparison, testimonial, logo wall, CTA, stat, changelog entry, doc page — to the
design system with stories (`P7-013`). A component built locally in a page fails the location gate.

---

## 4. Waves

### Wave 0 · "Measure what exists"
**Phases:** P7-001–P7-020 · Independence, measuring the H03 gate's real coverage and the admin's real depth.

### Wave 1 · "A content system that is true"
**Phases:** P7-021–P7-108 · Design refresh, the content model, the truth gate deepened, composition and publishing.

### Wave 2 · "The public site"
**Phases:** P7-109–P7-142 · The 20 sections rebuilt with real depth.

### Wave 3 · "Conversion"
**Phases:** P7-143–P7-198 · Pricing, signup, trial, lead routing, and lifecycle marketing.

### Wave 4 · "Reach, trust and documentation"
**Phases:** P7-199–P7-274 · SEO, performance, analytics, experimentation, trust surfaces, docs and help.

### Wave 5 · "Operations and production"
**Phases:** P7-275–P7-316 · Admin operations, the test estate, and the two exit proofs.

---

## 5. Stage A · Foundation and measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-001** | Programme charter and boundary declaration | — | A manifest declaring this programme writes only to `unierp-corporate-website` and which contracts it consumes | A P7 commit touching another repository fails CI. Deleting the declaration fails CI | OPEN |
| **P7-002** | Measuring the existing claim-verification gate | P7-001 | The H03 gate's actual coverage measured: which claims it checks, which site copy it does not reach, and what a false claim would survive | Coverage is reported as a number with the command that produces it. Every uncovered claim surface is filed | OPEN |
| **P7-003** | Measuring the existing admin surface | P7-001 | The 19 admin pages measured by real depth, confirming or refuting the 5-line finding for `content` and `tools` | Every admin page has a measured depth and capability score, reproducible by command | OPEN |
| **P7-004** | Runtime precondition gate | P7-001 | Startup and CI assertion of each external capability, with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P7-005** | Plane-0 isolation guarantee | P7-001 | The declared, enforced rule that this site holds no tenant data and reaches no tenant database | A data path from this repository to a tenant database fails an architecture gate, proven by test | OPEN |
| **P7-006** | Site data model and scoping | P7-005 | The site's own 25-model schema reviewed, with scoping and access policies on every table | Every table has an explicit access policy. A table without one fails the gate | OPEN |
| **P7-007** | Migration discipline | P7-006 | Forward-only migrations with tested rollback and immutable shipped migrations | Replaying every migration from empty reproduces the schema exactly | OPEN |
| **P7-008** | Admin authentication hardening | P7-006 | Extending the H04 review into enforcement: session policy, MFA, rotation, device binding | Session fixation, replay after logout and MFA bypass each fail, proven by tests that fail when their defence is removed | OPEN |
| **P7-009** | Admin authorization and default deny | P7-008 | Explicit permissions on all 38 API routes, defaulting to deny, unauthorized returning **403** | A route without a permission declaration fails a gate. Unauthorized returns 403, never 404 or 500 | OPEN |
| **P7-010** | Admin audit log | P7-009 | Append-only audit of every content, pricing, campaign and configuration change | Every mutating route audits. An unaudited one fails a gate. Records are immutable | OPEN |
| **P7-011** | Structured logging and correlation | P7-001 | Correlation from admin action through publish to public request | One content change is traceable end to end by a single correlation ID | OPEN |
| **P7-012** | Error taxonomy | P7-011 | Typed errors for editor mistake, publish failure, integration fault and policy refusal | Every error carries a registry code. A stack trace reaching a user or editor fails a gate | OPEN |
| **P7-013** | Marketing design-system primitives | P7-001 | Hero, feature block, pricing table, comparison, testimonial, logo wall, CTA, stat, changelog entry and doc page in `unierp-design-system` with stories | Each has a story and zero hardcoded colour or spacing. A component built in a page fails the location gate | OPEN |
| **P7-014** | Secret and configuration handling | P7-001 | Validated configuration; no secret in source, bundle or logs | A missing required variable fails startup by name. A bundle scan finds zero secrets | OPEN |
| **P7-015** | Rate limiting and abuse control | P7-009 | Limits on form submission, signup, admin authentication and API use | A spam and credential-stuffing simulation is throttled, proven by test | OPEN |
| **P7-016** | Performance budget | P7-001 | Core Web Vitals budgets per page class, wired into CI on a fixed profile | A regression beyond budget fails CI. The budget file cannot be raised without an amendment-log entry | OPEN |
| **P7-017** | Accessibility baseline | P7-013 | WCAG 2.2 AA across the public shell and the admin shell | Both shells are `axe` clean and keyboard-complete | OPEN |
| **P7-018** | Content and traffic fixtures | P7-003 | Realistic content and traffic fixtures for testing, benchmarking and preview | Every test and benchmark runs against the shared fixtures | OPEN |
| **P7-019** | Idempotency for publishing and lead capture | P7-009 | Idempotency on publish, form submission, signup and lead creation | A double-submitted form creates one lead, proven under induced failure | OPEN |
| **P7-020** | Test harness | P7-018 | Publish harness, golden-render comparison, claim-gate assertions, consent assertions and lead-flow doubles | A site test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |

---

## 6. Stage B · Site architecture and visual system (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-021** | Information architecture | P7-003 | A coherent structure across the 20 existing sections with a defined purpose per page class | Every page belongs to a declared class with a stated purpose. An unclassified page fails the gate | OPEN |
| **P7-022** | Navigation and wayfinding | P7-021 | Primary, secondary, footer and contextual navigation that scales across the estate | Any page is reachable in three clicks from the homepage, verified by crawl | OPEN |
| **P7-023** | URL structure and routing | P7-021 | Canonical URL scheme with stable, meaningful paths | Every page has exactly one canonical URL; a collision is refused at save | OPEN |
| **P7-024** | Redirect and URL-history management | P7-023 | Automatic redirects on path change, with chain resolution and loop prevention | A path change creates a redirect automatically. No chain exceeds one hop, verified by crawl | OPEN |
| **P7-025** | Design refresh on the design system | P7-013 | The site rebuilt on design-system tokens and components across every section | Zero hardcoded colours or spacing; the B15 token gate passes on this repository | OPEN |
| **P7-026** | Typography and editorial style | P7-025 | Type scale, rhythm and editorial treatment for long-form and marketing copy | Typography is token-driven and renders correctly across the locale and script set | OPEN |
| **P7-027** | Colour, theming and dark mode | P7-025 | Light and dark palettes with contrast validated at token level | Every surface passes contrast in both schemes, verified automatically | OPEN |
| **P7-028** | Motion and interaction design | P7-025 | Purposeful motion respecting reduced-motion preference | Every animation is disabled under `prefers-reduced-motion`, verified by test | OPEN |
| **P7-029** | Imagery, illustration and media system | P7-025 | Consistent art direction with optimisation and responsive delivery | Every image serves optimised and responsive; an unoptimised original never reaches production | OPEN |
| **P7-030** | The claim-verification gate, deepened | P7-002 | The UX-1 mechanism extended from H03's coverage to **every capability claim in every content surface**, checked against the platform's capability manifest | A capability claim with no manifest entry fails CI, from any content surface including CMS-authored copy. The gate is proven to fail on a deliberately false claim in each surface class | OPEN |
| **P7-031** | Capability manifest currency | P7-030 | The manifest kept current by generation from the platform rather than by hand | A capability removed from the platform invalidates its site claims within one build, proven by test | OPEN |
| **P7-032** | Claim review workflow | P7-030 | Human review for claims the gate cannot mechanically verify, with expiry | An unverifiable claim requires a recorded review with an expiry date, and expires automatically | OPEN |
| **P7-033** | Responsive and adaptive layout | P7-025 | Layouts working from 320 px upward across every page class | No page scrolls horizontally at 320 px, verified across the estate | OPEN |
| **P7-034** | Component states completeness | P7-013 | Every marketing component defining default, hover, focus, loading, empty and error states | A component missing a required state fails the completeness gate | OPEN |
| **P7-035** | Page templates and layouts | P7-021 | Templates per page class with slots and constraints | A page built on a template is accessible, responsive and performant by construction | OPEN |
| **P7-036** | Brand system and consistency | P7-025 | The brand expression codified as tokens and rules | An off-brand page cannot be produced within the template system, proven adversarially | OPEN |
| **P7-037** | Print and share representations | P7-029 | Social share cards and print styling generated from page content | Share cards are generated from real page content and cannot drift from it | OPEN |
| **P7-038** | Internationalisation architecture | P7-023 | Locale routing, content structure and formatting for a multi-locale site | A locale serves complete content with correct formatting, or falls back visibly per policy | OPEN |
| **P7-039** | Right-to-left support | P7-038 | Complete RTL layout and typography across every template | Every template renders correctly in RTL, verified per template | OPEN |
| **P7-040** | Server rendering and progressive enhancement | P7-035 | Content routes rendering fully server-side and usable without JavaScript | Every content route renders and navigates with scripting disabled, verified by request | OPEN |
| **P7-041** | Asset pipeline and delivery | P7-029 | Hashing, compression, format negotiation and long-cache delivery | An asset change produces a new URL; a stale cached asset is proven impossible | OPEN |
| **P7-042** | Font loading strategy | P7-026 | Subsetting, preloading and swap strategy eliminating layout shift | Cumulative layout shift from fonts is within budget, measured | OPEN |
| **P7-043** | Content security policy | P7-040 | A strict CSP with nonce-based script allowance across the site | No `unsafe-inline` script anywhere. An injected script fails to execute, proven by test | OPEN |
| **P7-044** | Security headers | P7-043 | HSTS, frame options, referrer policy and permissions policy on every response | Every response carries the full header set, verified by request across the estate | OPEN |
| **P7-045** | Edge delivery and caching | P7-041 | Edge-served pages with correct cache headers and invalidation on publish | A published change is visible globally within the stated window; a stale page beyond it is impossible | OPEN |
| **P7-046** | Stage B design proof | P7-025 | A visual regression and token-conformance suite across every template, breakpoint, locale and scheme | The estate passes, and a seeded hardcoded colour or pixel regression is caught immediately | OPEN |

---

## 7. Stage C · The content management system (Wave 1)

`admin/content/page.tsx` is 5 lines and content is the admin's entire reason to exist. This stage is
the largest in the programme because it is where UX-2 is either delivered or permanently missed.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-047** | Content type modelling | P7-006 | Typed content types with fields, validation and relationships, replacing ad-hoc structures | Content is queryable by field, not only renderable. A blob-only type cannot be created | OPEN |
| **P7-048** | Field type library | P7-047 | Text, rich text, number, date, boolean, media, reference, list and structured object fields | Every field type has storage, validation, editing, rendering and serialisation defined once | OPEN |
| **P7-049** | Rich text model | P7-048 | Structured rich text as a document tree with a constrained node and mark set, never raw HTML | Rich text round-trips losslessly and cannot carry arbitrary HTML, proven by an injection suite | OPEN |
| **P7-050** | Content entries and collections | P7-047 | Entries organised into collections with ordering, filtering and querying | A collection query is deterministic and permission-aware | OPEN |
| **P7-051** | Content relationships | P7-047 | References between content with integrity, cardinality and cascade rules | Deleting referenced content is refused or cascades per rule, never leaving a dangling reference | OPEN |
| **P7-052** | Content validation | P7-047 | Declarative validation enforced server-side on every write path | A rule blocks a write from admin, API and import alike, proven per path | OPEN |
| **P7-053** | The content admin — the real one | P7-050 | The 5-line `admin/content` replaced: types, entries, editing, media, relations, search and bulk action | Every content type is fully manageable in the admin. The measured page depth exceeds the declared minimum | OPEN |
| **P7-054** | Every word editable | P7-053 | The UX-2 mechanism: all public copy sourced from content, with no hardcoded user-facing string | A hardcoded user-facing string in a component fails `check-hardcoded-strings.mjs`. Every word on the site is editable in the admin | OPEN |
| **P7-055** | Content versioning and history | P7-050 | Immutable versions with semantic diff and revert | Reverting reproduces a prior version exactly and is itself a new version | OPEN |
| **P7-056** | Draft and published separation | P7-055 | Independent draft and published states per content item | A draft edit is never visible publicly, proven by request | OPEN |
| **P7-057** | Editorial workflow | P7-056 | Draft, review, approve, schedule and publish with roles and audit | Content cannot reach published state without traversing its configured workflow | OPEN |
| **P7-058** | Scheduled publication and expiry | P7-057 | Time-based publish and expiry with timezone correctness | Content publishes and expires at the scheduled instant across timezone and DST boundaries | OPEN |
| **P7-059** | Content localisation | P7-038 | Per-locale content with fallback chains and translation state | A missing translation falls back visibly per policy, never silently rendering empty | OPEN |
| **P7-060** | Translation workflow | P7-059 | Assignment, progress and export/import for external translators | A translation round-trip preserves structure and markup exactly | OPEN |
| **P7-061** | Media library | P7-048 | Upload, organisation, metadata, search and usage tracking | An asset's usage across every page is answerable before deletion | OPEN |
| **P7-062** | Image processing and delivery | P7-061 | Resizing, format negotiation, focal-point cropping and responsive sources | A published image serves in an appropriate format and size per device, verified by request | OPEN |
| **P7-063** | Video and rich media | P7-061 | Video with transcoding, captions and poster frames | A video serves with captions available; an uncaptioned video is flagged before publish | OPEN |
| **P7-064** | Document assets | P7-061 | Downloadable files with content-type verification and scanning | An executable renamed to `.pdf` is rejected by content inspection | OPEN |
| **P7-065** | Gated content and lead capture assets | P7-064 | Assets behind a lead-capture form with signed, expiring delivery | A gated asset is unreachable without submission, including by direct URL | OPEN |
| **P7-066** | Content search in the admin | P7-053 | Search across content, media and pages by any property | Any content item is findable by any of its properties within the interaction budget | OPEN |
| **P7-067** | Content reuse and global blocks | P7-050 | Shared blocks, global settings and singletons used across pages | Editing a shared block updates every usage, and usages are listable before editing | OPEN |
| **P7-068** | Content permissions | P7-009 | Per-type and per-item permissions for editors, reviewers and publishers | An editor without publish permission cannot publish by any path, proven by test | OPEN |
| **P7-069** | Content import and bulk operations | P7-052 | Bulk import, edit and delete with dry run and rollback | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P7-070** | Content model migration | P7-047 | Changing content types safely with data migration | A field retype migrates existing data or refuses with the reason; it never silently drops values | OPEN |
| **P7-071** | Content impact analysis | P7-051 | Before deleting or changing a type, a report of affected content and pages | Deleting a type used by a live page is refused and names the page | OPEN |
| **P7-072** | Content API | P7-050 | Read and write API with the same validation, permissions and audit | Every admin content capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P7-073** | Editorial writing experience | P7-049 | Focused authoring with inline media, references, autosave and validation feedback | A long-form article is written without leaving the editing surface, verified by exercise | OPEN |
| **P7-074** | Editorial accessibility | P7-017 | WCAG 2.2 AA for the admin editing surfaces including the rich text editor | The rich text editor is fully operable by keyboard and screen reader, recorded as a test | OPEN |
| **P7-075** | Content collaboration | P7-057 | Comments, mentions, assignment and review discussion on content | A comment is visible to exactly those permitted to see its content | OPEN |
| **P7-076** | Content quality checks | P7-030 | Editorial checks at save: claims, links, readability, metadata completeness, alt text | Each check fires on a seeded violation and is silent on clean content | OPEN |
| **P7-077** | Content performance in the admin | P7-016 | Admin content operations within budget at realistic content volume | Content list, search and editing meet budget at 10,000 entries, measured | OPEN |
| **P7-078** | Content backup and restore | P7-007 | Backup of content, media and configuration with tested restore | A restore reproduces the content estate exactly, verified by golden render | OPEN |
| **P7-079** | Content export and portability | P7-078 | Export in an open, documented format, reimportable | Export → import → export produces an identical artefact | OPEN |
| **P7-080** | Stage C content proof | P7-054 | A suite asserting no hardcoded user-facing strings, complete editability, versioning and workflow enforcement | Every word is editable and every guarantee holds; a seeded hardcoded string is caught immediately | OPEN |

---

## 8. Stage D · Composition, publishing and preview (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-081** | Page composition model | P7-035 | Pages as typed section trees with content bindings, in data rather than code | A page renders identically from its metadata alone, verified by golden render | OPEN |
| **P7-082** | Visual page composition | P7-081 | Marketing pages composed from sections without code, with reordering and configuration | A marketing page is restructured by a non-developer, previewed and published, verified by exercise | OPEN |
| **P7-083** | Section library | P7-013 | The composable section set: hero, features, pricing, testimonials, logos, FAQ, CTA, comparison, stats | Every section is accessible, responsive and themed, verified per section | OPEN |
| **P7-084** | Section configuration and constraints | P7-083 | Per-section options bounded so no configuration produces a broken page | An off-brand or inaccessible configuration is refused, proven adversarially | OPEN |
| **P7-085** | Landing page composition | P7-082 | Fast, focused landing pages for campaigns with conversion elements | A landing page meets Core Web Vitals and supports an experiment out of the box | OPEN |
| **P7-086** | Preview | P7-081 | Authenticated preview of unpublished content at any state and locale | Preview is byte-identical to the eventual published rendering, verified by golden comparison | OPEN |
| **P7-087** | Preview sharing | P7-086 | Shareable, expiring preview links for stakeholder review | A preview link expires as declared and is unreachable without authorisation | OPEN |
| **P7-088** | Publishing workflow | P7-057 | Draft → review → schedule → publish → rollback with preview links and audit | A campaign page publishes on schedule and is rollable back in one action | OPEN |
| **P7-089** | Atomic publishing | P7-088 | Publishing that is all-or-nothing across every changed page and asset | A visitor never sees a half-published site, proven under publish with induced failure | OPEN |
| **P7-090** | Rollback | P7-089 | Rolling back to any prior published state in one action | A rollback restores the exact prior output including assets, verified by comparison | OPEN |
| **P7-091** | Build pipeline | P7-081 | Deterministic build from content into deployable artefacts | Two builds of identical input produce byte-identical artefacts, verified by hash | OPEN |
| **P7-092** | Incremental publishing | P7-091 | Rebuilding only what changed with correct dependency tracking | A single content change rebuilds only affected pages and never misses one, proven by test | OPEN |
| **P7-093** | Cache invalidation on publish | P7-045 | Purging exactly what changed, favouring correctness over aggressiveness | A published change is visible globally within the stated window; staleness beyond it is impossible | OPEN |
| **P7-094** | Publish failure handling | P7-091 | Build failures that never take down the live site, with actionable errors | A failed publish leaves the live site untouched and names the failing page and reason | OPEN |
| **P7-095** | Publishing permissions and approval | P7-068 | Publish as a distinct permission with optional approval requirement | Publishing without approval is impossible where policy requires it, proven by test | OPEN |
| **P7-096** | Publish audit and history | P7-010 | Full record of what was published, by whom, when and what changed | Any published state is explainable from the publish history alone | OPEN |
| **P7-097** | Content freshness monitoring | P7-076 | Detecting stale content, expired claims and outdated screenshots | Stale content is reported to its owner before a visitor encounters it | OPEN |
| **P7-098** | Broken link detection | P7-076 | Continuous internal and external link checking before and after publish | A broken internal link is reported before publish, not after | OPEN |
| **P7-099** | Publish observability | P7-011 | Metrics on build duration, publish success, cache hit rate and edge latency | A slow or failing publish is diagnosable from telemetry alone | OPEN |
| **P7-100** | Environment separation | P7-091 | Production and staging with staging never public and never indexable | A staging page returns nothing to an unauthenticated request and is absent from indexes | OPEN |
| **P7-101** | Content promotion between environments | P7-100 | Promoting content and structure with diff and dry run | A promotion's preview equals its outcome exactly, verified differentially | OPEN |
| **P7-102** | Emergency content update | P7-088 | An expedited path for urgent corrections with the same audit and gates | An urgent correction publishes within the stated window without bypassing the claim gate | OPEN |
| **P7-103** | Scheduled campaign coordination | P7-058 | Coordinating multi-page campaign launches at a single instant | A multi-page campaign goes live atomically at its scheduled instant, proven by test | OPEN |
| **P7-104** | Site availability and fallback | P7-093 | Serving the last good build when the origin is unavailable | With the origin stopped, the site continues serving, verified by request | OPEN |
| **P7-105** | Build reproducibility and provenance | P7-091 | Signed builds linking artefact to content version | A published artefact's exact source content version is provable from its attestation | OPEN |
| **P7-106** | Publish performance | P7-092 | Build and publish within budget at full site scale | The full site builds and publishes within the stated budget, measured | OPEN |
| **P7-107** | Admin composition accessibility | P7-074 | WCAG 2.2 AA for the composition and publishing surfaces | Composition and publishing are fully operable by keyboard and screen reader | OPEN |
| **P7-108** | Stage D publishing proof | P7-089 | A suite publishing under induced failure at every step, asserting atomicity, rollback and cache correctness | No injected failure produces a half-published site or a stale page; removing atomicity is caught | OPEN |

---

## 9. Stage E · The public site (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-109** | Homepage | P7-082 | The primary entry: positioning, proof, paths for each audience | Every homepage claim maps to a manifest capability. Core Web Vitals green | OPEN |
| **P7-110** | Product narrative and positioning | P7-030 | What UniERP is, for whom, against which alternatives — stated only in verifiable terms | Every claim maps to a shipped, verifiable capability. Nothing aspirational is in the present tense | OPEN |
| **P7-111** | Honest differentiation | P7-110 | The differentiators that are actually true: open-source and self-hostable, local-first AI with no data egress, one design system across clients | Each differentiator links to evidence a reader can check. An unevidenced differentiator is removed | OPEN |
| **P7-112** | Product section | P7-110 | The product overview with capability depth and honest maturity signalling | A capability described as available is available; one in development is labelled as such, enforced | OPEN |
| **P7-113** | Modules section | P7-112 | The 45 modules presented with real, per-module capability detail | Each module's described capability maps to the manifest, verified per module | OPEN |
| **P7-114** | Features section | P7-112 | Feature-level depth with screenshots that are current, not aspirational | Every screenshot has a freshness date and is flagged when stale, enforced by P7-097 | OPEN |
| **P7-115** | Industries and use cases | P7-113 | Vertical positioning tied to real vertical capability | An industry claim without a shipped vertical capability fails the gate | OPEN |
| **P7-116** | Solutions and outcomes | P7-115 | Outcome-led narratives grounded in evidenced capability | Every outcome claim is evidenced or is absent | OPEN |
| **P7-117** | Comparison and alternatives | P7-110 | Honest comparison against alternatives, including where UniERP is behind | A comparison claim about a competitor is sourced and dated. An unsourced claim fails review | OPEN |
| **P7-118** | Open-source positioning | P7-111 | The project's open-source position stated accurately, including its real maturity | Adoption and contribution figures come from the repository, never from an assertion, verified by generation | OPEN |
| **P7-119** | Self-hosting narrative | P7-118 | What self-hosting genuinely requires and what it genuinely provides | Self-hosting claims match the documented installation reality, verified against it | OPEN |
| **P7-120** | Customers section | P7-116 | Case studies, testimonials and logos with consent records | No customer is named without a stored consent record; an expired consent removes the asset automatically | OPEN |
| **P7-121** | Customer evidence governance | P7-120 | Consent capture, review dates and automatic expiry for customer assets | An expired consent removes its asset within the stated window, proven by test | OPEN |
| **P7-122** | About and company | P7-110 | Company, mission, governance and team, stated accurately | Team and governance claims match the repository's own governance documents | OPEN |
| **P7-123** | Contact and enquiry | P7-019 | Contact surfaces routed correctly with acknowledgement | Every enquiry reaches a routed owner and the sender receives acknowledgement | OPEN |
| **P7-124** | Careers section | P7-122 | Job listings with application capture and status | An application creates a real record and the candidate receives acknowledgement | OPEN |
| **P7-125** | Blog and editorial | P7-050 | Editorial publishing with authors, categories, series and feeds | Feeds validate and the archive structure is complete, verified by crawl | OPEN |
| **P7-126** | Resources and content library | P7-065 | Guides, whitepapers, webinars and templates, gated where appropriate | A gated resource is unreachable without submission, including by direct URL | OPEN |
| **P7-127** | Events and webinars | P7-126 | Event listings, registration and follow-up | A registration creates a real lead with attribution, proven by test | OPEN |
| **P7-128** | Partners and ecosystem | P7-120 | Partner directory with verified relationships | A partner claim is backed by a recorded relationship, and lapsed ones are removed automatically | OPEN |
| **P7-129** | Marketplace showcase | P7-113 | Surfacing marketplace products on the public site accurately | A showcased product's described capability matches its actual listing, verified by comparison | OPEN |
| **P7-130** | Developer landing surfaces | P7-112 | Developer-facing entry points to the developer platform | Developer claims map to shipped developer capability, verified against the manifest | OPEN |
| **P7-131** | Search across the site | P7-066 | Public site search across pages, documentation, help and blog | Search returns useful results across content types, measured against a query corpus | OPEN |
| **P7-132** | Legal pages | P7-054 | Privacy, terms, acceptable use and sub-processors — versioned with change history | Every legal page is versioned and its change history is public, verified by request | OPEN |
| **P7-133** | Accessibility statement | P7-017 | Published accessibility conformance generated from real audit results | The statement is generated from audit data and cannot claim untested conformance | OPEN |
| **P7-134** | Site-wide calls to action | P7-083 | Consistent, contextual conversion paths across every section | Every page class has a declared primary action; a page without one fails the gate | OPEN |
| **P7-135** | Social proof surfaces | P7-120 | Ratings, reviews, adoption and recognition, each sourced | Every social-proof figure is generated from a real source, never hand-entered | OPEN |
| **P7-136** | Interactive product demonstration | P7-114 | A real, interactive demonstration rather than a video of one | The demonstration exercises real product behaviour, not a mockup, verified by test | OPEN |
| **P7-137** | Public roadmap | P7-110 | A roadmap that distinguishes shipped, in progress and planned, without dates it cannot keep | Nothing on the roadmap is stated as available. Shipped items link to their capability entry | OPEN |
| **P7-138** | Changelog | P7-137 | A public changelog generated from real release data | Changelog entries derive from releases, not from hand-written notes, verified by generation | OPEN |
| **P7-139** | Public page performance | P7-016 | Core Web Vitals green on every top-level public page | Vitals green at the 75th percentile from field data, not only lab runs | OPEN |
| **P7-140** | Public page accessibility | P7-017 | WCAG 2.2 AA across every public page and section | Every public page is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P7-141** | Content localisation of public sections | P7-059 | The public estate localised with complete fallback behaviour | A locale serves complete content or falls back visibly; no untranslated string is exposed | OPEN |
| **P7-142** | Stage E truth proof | P7-030 | A crawl asserting every capability claim across every public page resolves to a manifest entry | Every claim resolves, and a seeded false claim in any section is caught immediately | OPEN |

---

## 10. Stage F · Conversion (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-143** | Conversion architecture | P7-134 | The declared funnel from first visit to activated tenant, with each stage instrumented | Every funnel stage is measurable and its drop-off attributable | OPEN |
| **P7-144** | Pricing page | P7-054 | Pricing presented with plans, editions, limits and total-cost clarity | Every price and limit shown comes from plan data, never from page copy | OPEN |
| **P7-145** | Plan data source | P7-144 | Pricing driven by the same plan definitions the platform bills from | A plan change updates the pricing page without an edit, proven by test | OPEN |
| **P7-146** | Price drift detection | P7-145 | A CI gate failing when displayed prices diverge from billing plan data | A seeded divergence fails CI. The gate is proven able to fail | OPEN |
| **P7-147** | Multi-currency and regional pricing display | P7-145 | Locale-correct pricing with the correct tax convention per market | Displayed price matches what the tenant is actually charged, verified per market | OPEN |
| **P7-148** | Plan comparison and feature matrix | P7-145 | Comparison generated from real entitlement data | The matrix is generated from entitlement definitions and cannot drift | OPEN |
| **P7-149** | The pricing-truth gate | P7-146 | The UX-3 mechanism, closing **D133**: no second source of pricing truth anywhere in the repository | A hardcoded plan or price array in this repository fails CI. The gate is proven to fail on a seeded array | OPEN |
| **P7-150** | Pricing calculator | P7-147 | Interactive cost estimation from real pricing rules | The calculator's output equals what checkout would charge for the same inputs, verified differentially | OPEN |
| **P7-151** | Enterprise and custom pricing path | P7-144 | The path for negotiated pricing with qualification and routing | An enterprise enquiry reaches the right owner with qualification data attached | OPEN |
| **P7-152** | Signup flow | P7-019 | Self-serve signup: account, verification, organisation and plan selection | A stranger completes signup unaided; the flow is completable by keyboard and screen reader | OPEN |
| **P7-153** | Email verification and anti-abuse | P7-015 | Verification with disposable-domain handling and abuse prevention | An abusive signup pattern is blocked without blocking legitimate users, verified by test | OPEN |
| **P7-154** | Tenant provisioning from signup | P7-152 | Signup provisioning a real, working tenant with sample data | Signup produces a working tenant, verified by signing in and performing a real action | OPEN |
| **P7-155** | Trial activation | P7-154 | Trial with declared duration, limits and conversion terms shown up front | Trial terms are visible before signup and expiry behaves exactly as disclosed | OPEN |
| **P7-156** | First-run handoff | P7-154 | Handing the new tenant into guided first-run without losing context | Signup context carries into first-run with no re-entry, verified by exercise | OPEN |
| **P7-157** | Signup failure and recovery | P7-012 | Clear handling of every signup failure with a recovery path | Every failure mode names its cause and its next action; a dead end fails a gate | OPEN |
| **P7-158** | Signup idempotency | P7-019 | Idempotent provisioning under retry and network failure | A retried signup provisions one tenant, proven under induced failure at each step | OPEN |
| **P7-159** | Signup performance | P7-016 | Signup and provisioning within a stated time budget | Signup to working tenant completes within budget, measured | OPEN |
| **P7-160** | The five-minute proof | P7-156 | The UX-5 mechanism: a stranger signs up and reaches a working tenant with sample data, unaided | An unassisted stranger reaches a working tenant in under five minutes, recorded. A regression fails the gate | OPEN |
| **P7-161** | Demo request and scheduling | P7-123 | Demo requests with qualification, routing and scheduling | A demo request reaches the right owner with its source attributed | OPEN |
| **P7-162** | Lead capture forms | P7-019 | Forms with validation, progressive profiling and consent | A crafted request bypassing the browser is rejected server-side with the identical error | OPEN |
| **P7-163** | Lead routing and attribution | P7-162 | Routing leads into CRM with source attribution and SLA | A lead reaches the right CRM owner with its source attributed, proven by test | OPEN |
| **P7-164** | Lead deduplication and merge | P7-163 | Detecting and merging duplicate leads rather than multiplying them | A duplicate submission merges rather than creating a second lead, proven by test | OPEN |
| **P7-165** | Lead scoring and qualification | P7-163 | Scoring from real behaviour and firmographic data | A score is explainable: the system names which signals produced it | OPEN |
| **P7-166** | Quote request path | P7-151 | Structured quote requests with requirements capture | A quote request carries enough information to be actioned without a follow-up call, measured | OPEN |
| **P7-167** | Chat and conversational conversion | P7-163 | Consent-gated chat routing to real people or qualified automation | Chat loads only after consent and never blocks initial render | OPEN |
| **P7-168** | Conversion form accessibility | P7-140 | WCAG 2.2 AA across every conversion form and the signup flow | The complete conversion journey is `axe` clean and completable by keyboard and screen reader | OPEN |
| **P7-169** | Conversion analytics | P7-143 | Funnel measurement from landing to activated tenant with drop-off attribution | The full funnel is measurable end to end without third-party tracking cookies | OPEN |
| **P7-170** | Conversion experimentation | P7-085 | A/B testing on conversion surfaces with statistical rigour | An experiment's assignment is stable per visitor and its results are statistically stated | OPEN |
| **P7-171** | Abandonment recovery | P7-169 | Detecting and recovering abandoned signups and forms, with consent | Recovery messaging is sent only with consent and honours unsubscribe | OPEN |
| **P7-172** | Stage F conversion proof | P7-160 | An end-to-end suite from landing through signup to a working tenant, with pricing verified against billing data | The journey completes, prices match billing exactly, and a seeded price divergence is caught | OPEN |

---

## 11. Stage G · Marketing automation and campaigns (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-173** | Subscriber and contact model | P7-163 | The marketing contact record with source, consent, preferences and lifecycle state | Every contact has a recorded consent basis; a contact without one cannot be messaged | OPEN |
| **P7-174** | Consent and permission model | P7-173 | Per-purpose, per-channel consent with evidence and withdrawal | Withdrawal stops messaging for that purpose within the stated window, proven by test | OPEN |
| **P7-175** | Preference centre | P7-174 | Subscriber-facing control over channels, frequency and topics | A preference change is honoured across every channel, proven by test | OPEN |
| **P7-176** | Unsubscribe handling | P7-175 | One-click unsubscribe honoured universally and immediately | An unsubscribe is honoured across every channel and campaign, proven by test | OPEN |
| **P7-177** | Segmentation | P7-173 | Attribute and behaviour-based segments with recomputation | A segment's membership is deterministic and recomputes within the stated window | OPEN |
| **P7-178** | Email template system | P7-026 | Templated, localised, client-compatible email sharing the site's tokens | Every template renders correctly across the declared client matrix, verified per client | OPEN |
| **P7-179** | Campaign model | P7-177 | Campaigns with audience, content, schedule, goals and measurement | A campaign cannot send without a defined audience, consent basis and goal | OPEN |
| **P7-180** | Nurture sequences | P7-179 | Multi-step sequences with branching, delays and exit conditions | A nurture sequence runs with per-recipient personalisation, verified end to end | OPEN |
| **P7-181** | Trigger-based automation | P7-180 | Behaviour-triggered messaging from real site and product events | A trigger fires exactly once per qualifying event, proven by test | OPEN |
| **P7-182** | Personalisation | P7-180 | Content personalisation from known contact data with safe fallbacks | A missing personalisation value falls back gracefully; a broken merge field never ships | OPEN |
| **P7-183** | Send infrastructure and deliverability | P7-178 | Sending with authentication, reputation management and bounce handling | SPF, DKIM and DMARC pass on every send, verified by inspection of delivered mail | OPEN |
| **P7-184** | Bounce, complaint and suppression | P7-183 | Automatic suppression on bounce and complaint | A hard bounce suppresses the address immediately, proven by test | OPEN |
| **P7-185** | Send-time and frequency governance | P7-175 | Frequency capping and quiet hours honoured across campaigns | A contact never exceeds their frequency cap across all campaigns, proven by test | OPEN |
| **P7-186** | Campaign approval workflow | P7-179 | Review and approval before a campaign sends, with the claim gate applied | A campaign containing an unverified capability claim cannot send, enforced by P7-030 | OPEN |
| **P7-187** | Campaign testing and preview | P7-178 | Seed sends, rendering preview and link verification before launch | Every link in a campaign is verified before send; a broken link blocks it | OPEN |
| **P7-188** | Campaign analytics | P7-179 | Delivery, open, click, conversion and revenue attribution per campaign | Attribution reconciles to real conversion events, not to estimates | OPEN |
| **P7-189** | Attribution modelling | P7-188 | Multi-touch attribution across channels with a stated model | The attribution model is documented and its output reproducible from event data | OPEN |
| **P7-190** | Lifecycle marketing | P7-181 | Onboarding, activation, expansion and win-back programmes | Each lifecycle programme's effect is measured against a control, not asserted | OPEN |
| **P7-191** | Transactional messaging separation | P7-183 | Transactional messages separated from marketing, with distinct consent rules | A marketing message sent on the transactional path fails a gate, proven by test | OPEN |
| **P7-192** | Broadcast and announcement | P7-179 | One-off announcements with audience control and consent respect | A broadcast honours suppression, consent and frequency rules identically | OPEN |
| **P7-193** | Multi-channel coordination | P7-185 | Coordinating email, in-app and other channels without duplicate messaging | A contact receives one coordinated message, not one per channel, proven by test | OPEN |
| **P7-194** | Campaign content reuse | P7-067 | Campaign content sourced from the CMS rather than duplicated | Campaign copy comes from content; a duplicated claim outside the CMS fails the gate | OPEN |
| **P7-195** | Marketing data governance | P7-174 | Retention, minimisation and subject rights for marketing data | A subject access or erasure request covers marketing data completely, verified against a seeded subject | OPEN |
| **P7-196** | Campaign accessibility | P7-178 | Accessible email and campaign content including alternative text and structure | Every template passes accessibility review, verified per template | OPEN |
| **P7-197** | Marketing admin surfaces | P7-053 | The `admin/automation`, `admin/emails` and `admin/broadcast` pages deepened to real capability | Each page's measured depth exceeds the declared minimum and supports the full campaign lifecycle | OPEN |
| **P7-198** | Stage G proof | P7-176 | A suite asserting consent enforcement, unsubscribe universality, frequency capping and claim-gate application to campaigns | Every guarantee holds, and a seeded unconsented send is blocked | OPEN |

---

## 12. Stage H · SEO, performance, analytics and experimentation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-199** | Metadata and structured data | P7-081 | Per-page metadata, Open Graph and schema.org structured data | Structured data validates for every page type, verified against the validator | OPEN |
| **P7-200** | Sitemaps and robots | P7-023 | Generated sitemaps and per-environment robots directives | The sitemap contains exactly the indexable published pages, verified by comparison | OPEN |
| **P7-201** | Canonical URLs and duplicate prevention | P7-023 | Canonical declaration across locales, parameters and variants | Every page declares exactly one canonical URL, verified by crawl | OPEN |
| **P7-202** | `hreflang` and international SEO | P7-141 | Reciprocal, complete `hreflang` across every locale | `hreflang` is reciprocal and complete across every locale pair, verified by crawl | OPEN |
| **P7-203** | Redirect and URL governance | P7-024 | Redirect authoring, import, chain resolution and monitoring | No redirect chain exceeds one hop in published output, verified by crawl | OPEN |
| **P7-204** | SEO auditing in the admin | P7-076 | Edit-time SEO feedback: metadata, headings, alt text, internal linking, readability | Each check fires on a seeded violation and is silent on clean content | OPEN |
| **P7-205** | Content SEO operations | P7-204 | The `admin/seo` page deepened: metadata management, redirects, sitemaps, monitoring | The page supports the full SEO operations workflow; its measured depth exceeds the minimum | OPEN |
| **P7-206** | Search performance monitoring | P7-205 | Ranking, impression, click and index-coverage monitoring | Index coverage problems are detected and reported before traffic loss | OPEN |
| **P7-207** | Core Web Vitals measurement | P7-139 | Field and lab measurement per page, per template | Vitals are measured from real traffic, not only lab runs, and regressions alert | OPEN |
| **P7-208** | Performance regression gates | P7-207 | The UX-4 mechanism: CI gates preventing a publish that regresses Vitals beyond threshold | A deliberately regressed page fails the gate; the gate has been proven able to fail | OPEN |
| **P7-209** | Image and asset performance enforcement | P7-062 | Enforced limits on image weight and format at publish | An unoptimised image cannot reach production, enforced at publish | OPEN |
| **P7-210** | Script performance budget | P7-043 | Budgets on script weight, blocking time and third-party impact | Exceeding the budget fails publish with the offending script named | OPEN |
| **P7-211** | Rendering and delivery optimisation | P7-045 | Streaming, splitting, critical CSS and prefetching | A published page ships only the code it uses, measured against the budget | OPEN |
| **P7-212** | Analytics architecture | P7-169 | Privacy-respecting, first-party analytics without third-party tracking cookies | The full funnel is measurable without a third-party tracking cookie, verified by request inspection | OPEN |
| **P7-213** | Event model and tracking plan | P7-212 | A declared event taxonomy with schemas, implemented consistently | An event fired outside the taxonomy fails a gate. The tracking plan is generated, not documented twice | OPEN |
| **P7-214** | Conversion and goal tracking | P7-213 | Goal definition and conversion measurement across the funnel | Conversion figures reconcile to real signup and lead records exactly | OPEN |
| **P7-215** | Attribution and channel reporting | P7-189 | Traffic source, campaign and channel attribution | Attribution reconciles to real events, and its model is stated | OPEN |
| **P7-216** | Consent management | P7-174 | The UX-7 mechanism: a consent mechanism honoured by every script, cookie and tracker | Declining consent results in zero non-essential cookies and zero third-party requests, verified by inspection | OPEN |
| **P7-217** | Cookie and storage inventory | P7-216 | A generated inventory of every cookie and storage key with purpose and lifetime | An undeclared cookie set by any component fails a gate | OPEN |
| **P7-218** | Third-party script governance | P7-210 | Governed, consent-gated inclusion of any third-party script | No third-party script loads before consent, proven by request inspection | OPEN |
| **P7-219** | Experimentation platform | P7-170 | A/B and multivariate testing with assignment, exposure and analysis | Assignment is stable per visitor and exposure is logged, verified by test | OPEN |
| **P7-220** | Experiment governance | P7-219 | Hypotheses, sample size, duration and stopping rules declared before launch | An experiment cannot start without a declared hypothesis and stopping rule | OPEN |
| **P7-221** | Statistical analysis and reporting | P7-220 | Correct statistical treatment with confidence stated, not implied | Results state their confidence and are not reported before the stopping rule is met | OPEN |
| **P7-222** | Personalisation and audience targeting | P7-177 | Content variation by audience, source and behaviour with consent respect | Personalisation never leaks another visitor's data, proven by an inference test | OPEN |
| **P7-223** | Analytics dashboards | P7-214 | Traffic, funnel, content and campaign dashboards for the team | Every figure is defined, sourced and drillable to its underlying events | OPEN |
| **P7-224** | Content performance analysis | P7-223 | Which content drives conversion, engagement and retention | Content effect is measured against a baseline, not asserted | OPEN |
| **P7-225** | Analytics data governance | P7-195 | Retention, minimisation and subject rights for analytics data | An erasure request covers analytics data completely, verified against a seeded subject | OPEN |
| **P7-226** | Analytics export and API | P7-223 | Programmatic access to analytics data | Every dashboard figure is retrievable by API; a UI-only figure fails the parity test | OPEN |
| **P7-227** | Analytics accessibility | P7-140 | WCAG 2.2 AA across analytics surfaces including every chart | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P7-228** | Stage H proof | P7-216 | A suite asserting SEO completeness, consent honouring, zero pre-consent third-party requests and Vitals compliance | All four hold, and a seeded pre-consent tracker is caught immediately | OPEN |

---

## 13. Stage I · Trust, security and compliance surfaces (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-229** | Trust centre architecture | P7-054 | A single trust surface covering security, privacy, compliance, availability and sub-processors | Every trust claim links to evidence or is absent, enforced by gate | OPEN |
| **P7-230** | Security page | P7-229 | The platform's real security posture, practices and controls | Every stated control maps to a mechanism in the platform, verified against it | OPEN |
| **P7-231** | Compliance claims and evidence | P7-230 | The UX-6 mechanism: every certification and compliance claim linked to real evidence with an expiry | A compliance claim without linked, unexpired evidence fails CI. The gate is proven to fail | OPEN |
| **P7-232** | Certification lifecycle | P7-231 | Tracking certification validity with automatic removal on expiry | An expired certification claim is removed automatically within the stated window | OPEN |
| **P7-233** | Privacy centre | P7-132 | Privacy policy, data handling, rights and contact — versioned and current | Policy version history is public and every change is dated, verified by request | OPEN |
| **P7-234** | Sub-processor disclosure | P7-233 | Published sub-processor list with change notification and subscription | A sub-processor change notifies subscribers before it takes effect, proven by test | OPEN |
| **P7-235** | Data residency and sovereignty claims | P7-230 | Accurate statements of where data can and cannot be stored | Every residency claim matches actual platform capability, verified against configuration | OPEN |
| **P7-236** | Status page | P7-229 | Real-time service status driven by genuine SLO and incident data | The status page reflects real SLO data, never a static image, verified against telemetry | OPEN |
| **P7-237** | Incident communication | P7-236 | Publishing incidents from one action, reaching status page, subscribers and in-product | A public incident is published from one action and appears everywhere within the stated window | OPEN |
| **P7-238** | Incident history and post-mortems | P7-237 | Published incident history with honest post-incident reviews | Every resolved incident has a published review within the stated window | OPEN |
| **P7-239** | Uptime and SLO reporting | P7-236 | Published availability figures computed from real measurement | Published uptime is computed from telemetry and cannot be hand-edited | OPEN |
| **P7-240** | Maintenance communication | P7-237 | Scheduled maintenance announced with advance notice | Maintenance is announced within the stated notice period, enforced mechanically | OPEN |
| **P7-241** | Security disclosure programme | P7-230 | A vulnerability disclosure policy with intake, triage and acknowledgement | Every report receives acknowledgement within the published window | OPEN |
| **P7-242** | Security advisories | P7-241 | Published advisories for issues affecting customers | An advisory reaches every subscriber and appears on the trust centre simultaneously | OPEN |
| **P7-243** | Open-source transparency | P7-118 | Licence, dependencies, SBOM and contribution reality published accurately | Published open-source facts are generated from the repositories, never asserted | OPEN |
| **P7-244** | Legal and regulatory pages | P7-132 | Terms, acceptable use, DPA and regional legal requirements | Every legal page is versioned, dated and its change history public | OPEN |
| **P7-245** | Accessibility conformance publication | P7-133 | Published accessibility conformance from real audit results | The published statement is generated from audit data and cannot overstate conformance | OPEN |
| **P7-246** | Trust surface performance | P7-139 | The trust centre and status page available even during platform degradation | The status page serves when the platform is degraded, verified by rehearsal | OPEN |
| **P7-247** | Trust surface accessibility | P7-140 | WCAG 2.2 AA across trust, status and legal surfaces | Every trust surface is `axe` clean and keyboard-complete | OPEN |
| **P7-248** | Customer security questionnaire support | P7-230 | Published answers to common security questionnaires, generated from real evidence | Questionnaire answers derive from evidence and are dated, never hand-asserted | OPEN |
| **P7-249** | Trust content governance | P7-231 | Review cycles and ownership for every trust claim | Every trust claim has an owner and a review date; an overdue claim is flagged | OPEN |
| **P7-250** | Regulatory disclosure requirements | P7-244 | Statutory disclosures required in operating jurisdictions | Each statutory disclosure requirement maps to a published surface and a test | OPEN |
| **P7-251** | Trust surface localisation | P7-141 | Trust and legal content localised where legally required | Every legally required locale has complete content; a gap blocks operation in that market | OPEN |
| **P7-252** | Stage I trust proof | P7-231 | A suite asserting every trust, compliance and uptime claim links to unexpired evidence | Every claim resolves to evidence, and a seeded unevidenced badge is caught immediately | OPEN |

---

## 14. Stage J · Documentation, help and developer content (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-253** | Documentation architecture | P7-021 | Structured documentation with a coherent hierarchy, versioning and navigation | Every documentation page has a declared type and place; an orphaned page fails the gate | OPEN |
| **P7-254** | Documentation content model | P7-047 | Documentation as structured content with reusable fragments and code blocks | Documentation content is reusable and queryable, not duplicated per page | OPEN |
| **P7-255** | API reference generation | P7-254 | API documentation generated from contracts rather than written twice | A contract change without a documentation update is impossible — documentation regenerates and drift fails CI | OPEN |
| **P7-256** | SDK and CLI reference generation | P7-255 | SDK and CLI reference generated from the same source as the code | Generated reference matches the shipped SDK exactly, verified by comparison | OPEN |
| **P7-257** | Code samples and their verification | P7-255 | Runnable, tested code samples that cannot rot | Every code sample is executed in CI; a broken sample fails the build | OPEN |
| **P7-258** | Documentation versioning | P7-253 | Multiple published versions with canonical and archive handling | An older version remains reachable and is correctly marked non-canonical | OPEN |
| **P7-259** | Documentation search | P7-131 | Search across guides, reference, help and changelog with ranking | Documentation search returns useful results across guides and reference, measured against a query corpus | OPEN |
| **P7-260** | Getting-started and tutorials | P7-257 | Tutorials that a reader can complete successfully, verified end to end | Every tutorial is executed in CI against a real environment; a failing step fails the build | OPEN |
| **P7-261** | Conceptual and architecture documentation | P7-253 | Explanatory documentation of how the platform actually works | Architectural claims match the platform's own architecture documents, verified against them | OPEN |
| **P7-262** | Help centre | P7-253 | Task-oriented help with search, categorisation and feedback | Help search returns useful results, measured against a real query corpus | OPEN |
| **P7-263** | Help content effectiveness | P7-262 | Measuring whether help articles actually resolve the reader's problem | Article effectiveness is measured, and ineffective content is identifiable from data | OPEN |
| **P7-264** | Documentation feedback | P7-262 | Per-page feedback routed to content owners with resolution tracking | Every feedback item reaches an owner and its resolution is tracked | OPEN |
| **P7-265** | Documentation accuracy gate | P7-030 | The claim gate applied to documentation: no documented capability that does not exist | A documented capability with no manifest entry fails CI, proven on a seeded example | OPEN |
| **P7-266** | Documentation freshness | P7-097 | Detecting stale documentation, outdated screenshots and superseded guidance | Stale documentation is flagged to its owner before a reader encounters it | OPEN |
| **P7-267** | Developer content and guides | P7-255 | Content for the developer audience tied to real developer platform capability | Every developer claim maps to shipped developer capability, verified against the manifest | OPEN |
| **P7-268** | Community and contribution documentation | P7-243 | Contribution guides, governance and community process, stated accurately | Contribution documentation matches the repositories' actual process, verified against them | OPEN |
| **P7-269** | Documentation localisation | P7-141 | Localised documentation with fallback and translation state | A locale serves complete documentation or falls back visibly, never partially | OPEN |
| **P7-270** | Documentation performance | P7-139 | Documentation pages within Core Web Vitals thresholds including long pages | Vitals green on the longest documentation pages, measured | OPEN |
| **P7-271** | Documentation accessibility | P7-140 | WCAG 2.2 AA across documentation including code blocks and navigation | Code blocks and navigation are screen-reader-navigable, verified per surface | OPEN |
| **P7-272** | Documentation contribution workflow | P7-057 | Internal and external contribution to documentation with review | A documentation contribution reaches publication through a reviewed workflow | OPEN |
| **P7-273** | Changelog and release communication | P7-138 | Release notes generated from real release data, distributed to subscribers | Changelog entries derive from releases and cannot be hand-invented, verified by generation | OPEN |
| **P7-274** | Stage J proof | P7-265 | A suite asserting documentation accuracy, sample execution, tutorial completion and generation from contracts | All four hold, and a seeded false documented capability is caught immediately | OPEN |

---

## 15. Stage K · Admin console operations (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-275** | Admin console shell and navigation | P7-013 | The admin frame scaling across all 19 pages with search and context | Every admin surface renders in the shell; a surface with its own chrome fails the contract test | OPEN |
| **P7-276** | Admin search | P7-275 | One search across content, media, leads, subscribers, settings and audit | Any admin object is reachable in one search within the interaction budget | OPEN |
| **P7-277** | Admin user management | P7-009 | Console users, roles and permissions distinct from platform identities | An admin user cannot authenticate to a tenant surface, proven by test | OPEN |
| **P7-278** | Admin role model | P7-277 | Roles for editor, reviewer, publisher, marketer, analyst and administrator | Each role is proven unable to perform capabilities outside its set | OPEN |
| **P7-279** | Admin MFA and session security | P7-008 | Mandatory MFA for publish, pricing and configuration changes | A pricing change without a second factor is impossible, and the test fails when enforcement is removed | OPEN |
| **P7-280** | Admin audit surface | P7-010 | Searchable, filterable audit of every administrative action | Any administrative action is findable and reconstructible from the audit alone | OPEN |
| **P7-281** | Lead management | P7-163 | The `admin/leads` page deepened: pipeline, assignment, routing and status | The page supports the full lead lifecycle; its measured depth exceeds the minimum | OPEN |
| **P7-282** | Subscriber management | P7-173 | The `admin/subscribers` page deepened: segments, consent, preferences and history | Every subscriber's consent state and history is visible and auditable | OPEN |
| **P7-283** | Support ticketing | P7-262 | The `admin/tickets` page reconciled with the platform's support tooling | A ticket raised here reaches the same system as one raised in-product, proven by test | OPEN |
| **P7-284** | Admin tools surface | P7-003 | The 5-line `admin/tools` replaced with real operational tooling | The page's measured depth exceeds the declared minimum and each tool has a stated purpose | OPEN |
| **P7-285** | Data centre and operations surface | P7-284 | The `admin/data-center` page deepened: data operations, exports, imports and jobs | Every data operation is auditable, reversible where possible, and confirms before acting | OPEN |
| **P7-286** | System health surface | P7-099 | The `admin/system-health` page fed by real telemetry | Every figure derives from measured telemetry, not from self-report | OPEN |
| **P7-287** | Component and design surface | P7-013 | The `admin/components` page reflecting the real design-system inventory | The inventory is generated from the design system and cannot drift | OPEN |
| **P7-288** | Settings and console settings | P7-054 | The `admin/settings` and `admin/console-settings` pages with validated, audited configuration | Every setting is typed, validated, permissioned and audited; an unregistered setting fails the gate | OPEN |
| **P7-289** | Admin notification and alerting | P7-286 | Alerts for publish failure, broken links, expiring claims, form failures and traffic anomalies | Each alert class fires on a seeded condition and reaches the right owner | OPEN |
| **P7-290** | Admin bulk operations | P7-069 | Bulk operations across content, leads and subscribers with dry run | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P7-291** | Admin performance | P7-016 | Admin surfaces within interaction budget at realistic data volume | Every admin list and editor meets budget at fixture volume, measured | OPEN |
| **P7-292** | Admin accessibility | P7-017 | WCAG 2.2 AA across every one of the 19 admin pages | Every admin page is `axe` clean and keyboard-complete | OPEN |
| **P7-293** | Admin mobile access | P7-033 | Critical admin actions available on a small screen | Approval, publish and incident actions are completable at 320 px width, verified | OPEN |
| **P7-294** | Admin onboarding and guidance | P7-275 | In-context guidance for editors and marketers new to the console | A new editor publishes a content change unaided, measured | OPEN |
| **P7-295** | Admin API | P7-072 | Programmatic access to admin capability with the same validation and audit | Every admin capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P7-296** | Admin depth verification | P7-003 | Every admin page re-measured against the declared minimum depth | No admin page is under the declared minimum. A page that is blocks the programme rather than being footnoted | OPEN |
| **P7-297** | Admin backup and recovery | P7-078 | Backup and rehearsed recovery of the site's own data and configuration | A recovery rehearsal restores content, leads and configuration exactly | OPEN |
| **P7-298** | Stage K admin proof | P7-296 | A suite asserting every admin page's capability, permission, audit and accessibility | Every page meets its declared capability, and a page falling below the minimum fails the gate | OPEN |

---

## 16. Stage L · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P7-299** | Coverage that can fail | P7-020 | Coverage across this repository with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P7-300** | Unit and component testing | P7-299 | Unit coverage of the content engine, publish pipeline, claim gate and lead routing | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P7-301** | Integration testing against real infrastructure | P7-018 | Integration suites against a real database and real email infrastructure | The suite runs against real infrastructure in CI; a mock-only pass is caught | OPEN |
| **P7-302** | Visual regression testing | P7-046 | Golden-image comparison across templates, sections, breakpoints, locales and schemes | A visual regression fails CI; the suite is proven able to fail on a seeded pixel change | OPEN |
| **P7-303** | End-to-end journeys | P7-172 | Automated journeys: browse, evaluate, price, sign up, activate; and author, review, publish, roll back | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P7-304** | Content and claim crawl testing | P7-142 | A full-site crawl asserting claims, links, metadata, canonicals and structured data | The crawl passes across the estate, and a seeded false claim or broken link is caught | OPEN |
| **P7-305** | Performance testing | P7-208 | Load and Vitals testing across page classes under realistic traffic | Vitals green at the 75th percentile under load; a regression fails CI | OPEN |
| **P7-306** | Traffic-spike and launch testing | P7-305 | Absorbing launch-day and campaign traffic spikes | A traffic spike is absorbed without degradation, verified under load | OPEN |
| **P7-307** | Accessibility audit across the estate | P7-140 | Full WCAG 2.2 AA audit of every public page and every admin page | The estate is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P7-308** | Security testing and penetration exercise | P7-008 | Scanning plus penetration testing of the admin, forms and signup surfaces | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P7-309** | Consent and privacy conformance testing | P7-216 | Automated verification that nothing tracks before consent, across every page | Zero non-essential cookies and zero third-party requests before consent, verified across the estate | OPEN |
| **P7-310** | Email deliverability testing | P7-183 | Testing authentication, rendering and deliverability across the client matrix | Mail authenticates and renders correctly across every declared client, verified per client | OPEN |
| **P7-311** | Localisation testing | P7-141 | Testing every locale including RTL for completeness and formatting | Every locale renders completely and correctly, including RTL, verified per locale | OPEN |
| **P7-312** | Disaster recovery rehearsal | P7-297 | Rehearsed recovery of the site, content, media and leads | A recovery rehearsal restores the site exactly, verified by golden render | OPEN |
| **P7-313** | Pricing-truth verification | P7-149 | Continuous verification that published prices equal billing plan data | A seeded divergence is caught by CI. The check has been proven able to fail | OPEN |
| **P7-314** | The truth proof | P7-304 | The § 1 invariant made adversarial: seeded false claims in copy, CMS content, campaigns, documentation and pricing | Every seeded false claim is refused, and each becomes publishable the moment its check is removed | OPEN |
| **P7-315** | Programme 7 launch readiness | P7-314 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 17 is ticked with evidence. An unticked box blocks completion | OPEN |
| **P7-316** | The no-deploy proof | P7-054 | The second half of § 1: every word on the public site changed from the admin, with no deploy, verified by crawl | A scripted edit of every content surface changes the live site with no deployment, recorded. A hardcoded string is caught | OPEN |

---

## 17. Programme exit criteria

- [ ] **Every capability claim on the site maps to a shipped capability, enforced across every content surface** (P7-030, P7-314)
- [ ] **Every word on the public site is editable in the admin with no deploy** (P7-054, P7-316)
- [ ] Published prices come from the same plan definitions the platform bills from; drift fails CI — closing D133 (P7-145, P7-149, P7-313)
- [ ] A hardcoded plan, price array or user-facing string in this repository fails CI (P7-054, P7-149)
- [ ] Nothing aspirational is stated in the present tense anywhere, including in campaigns and documentation (P7-030, P7-186, P7-265)
- [ ] A stranger signs up and reaches a working tenant with sample data, unaided, in under five minutes (P7-160)
- [ ] A demo request reaches the right CRM owner with attribution, deduplicated (P7-163, P7-164)
- [ ] No admin page is under the declared minimum depth — including `content` and `tools` (P7-053, P7-284, P7-296)
- [ ] The site's independent admin auth passes the same security standard as plane 1, with MFA enforced on publish and pricing (P7-008, P7-279)
- [ ] Zero non-essential cookies and zero third-party requests before consent, verified across the estate (P7-216, P7-309)
- [ ] Core Web Vitals green and `axe`-clean on every public page and every admin page (P7-139, P7-307)
- [ ] The status page reflects real SLO and incident data, and serves during platform degradation (P7-236, P7-246)
- [ ] Every compliance and trust claim links to unexpired evidence, or is absent (P7-231, P7-252)
- [ ] No customer is named without a stored consent record; expired consent removes the asset automatically (P7-120, P7-121)
- [ ] API, SDK and CLI documentation is generated from contracts and cannot drift (P7-255, P7-256)
- [ ] Every code sample and tutorial is executed in CI; a broken one fails the build (P7-257, P7-260)
- [ ] An unsubscribe is honoured across every channel and campaign (P7-176)
- [ ] Publishing is atomic and rollable back in one action (P7-089, P7-090)
- [ ] Two builds of identical input are byte-identical (P7-091)
- [ ] This repository holds no tenant data and reaches no tenant database (P7-005)
- [ ] Coverage thresholds have been proven able to fail (P7-299)
- [ ] Zero hardcoded colours or spacing; the B15 token gate passes on this repository (P7-025)

---

## 18. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 7 established (P7-001–P7-316), the marketing site and its admin console.** Registered per README § 0 rule 1. Track H is 3/18, and what it completed is load-bearing here: H03 shipped the claim-verification gate and H04 reviewed this site's independent auth, so this programme extends both rather than rebuilding them. `P7-002` measures the existing gate's *actual* coverage first, because a gate believed to cover every claim while covering three is worse than no gate — and this project has four documented instances of exactly that shape (D005, D013, D133, and the `@ts-nocheck` typecheck). `P7-054` is the mechanism behind "every word editable without a deploy": all public copy sourced from content, with `check-hardcoded-strings.mjs` failing a hardcoded user-facing string. `P7-149` closes D133 directly — published prices come from the same plan definitions the platform bills from, and drift fails CI. | Claude Code |
