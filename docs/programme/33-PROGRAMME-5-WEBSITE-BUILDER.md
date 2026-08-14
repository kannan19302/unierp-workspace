# PROGRAMME 5 · TENANT WEBSITE BUILDER PORTAL — P5-001–P5-330

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 5` resolves waves from this
> document and can only ever hand out a `P5-` phase.

---

## 0. The independence rule and the split

**No phase here may name a phase from another programme in its `Depends` cell.** `P5-004` is the
runtime precondition gate.

**This programme is the split the brief asked for.** Studio currently lives inside the tenant
application (`unierp-web/app/_sites/[host]`), and Programme 1's Track F — *Studio and sites*, F01–F26
— is **0/26 DONE**, the largest wholly untouched surface in the family. Splitting it into its own
platform is therefore a decision made *before* significant Studio code exists rather than after,
which is the cheapest moment it will ever be available.

The split is real, not nominal. `P5-002` establishes the boundary and `P5-003` the extraction, and
both are constrained by one rule stated here so it cannot be quietly dropped later:

> **A published site never queries the ERP directly.** It reads from a published content projection.
> The builder writes the projection; the site reads it. A public website with a live connection to
> the tenant's general ledger is a breach waiting to happen, and this rule is what prevents it.

That rule is what makes the split worth making, and `P5-328` is its adversarial proof.

---

## 1. What this programme owns

The platform on which a tenant builds and operates **websites** — plural and of several kinds:
marketing sites, storefronts, customer and partner portals, documentation sites, intranets, landing
pages and community sites. It owns the builder, the runtime that serves published sites, and the
operational surface around them.

**The invariant this programme establishes:**

> **What the builder shows is exactly what visitors get — and a published site cannot reach anything
> it was not explicitly given.**

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Studio route surface | `unierp-web/app/_sites/[host]` | `ls unierp-web/app` |
| Site template repo | `unierp-corporate-site-template`, **13 files** | `find unierp-corporate-site-template -type f` |
| Programme 1 Track F | **0/26 DONE**, 25 OPEN, 1 BLOCKED | `node scripts/phase-brief.mjs --status` |
| Design system | 112 components available | `find unierp-design-system/src -name '*.tsx'` |

The honest reading: there is a route seam and a 13-file template, and essentially nothing else. This
programme is not a rewrite of existing work — it is the first substantial build of this platform, and
its phases are written on that basis rather than pretending to extend something.

**Reference set.** Webflow (visual editing fidelity and the CSS model), Framer (interaction and
motion), WordPress (the content model and the plugin seam, including its failure modes), Contentful
and Sanity (headless content modelling and localisation), Shopify (storefront themes and commerce
templating), Vercel and Netlify (build, preview, edge delivery), Squarespace (the constrained-template
approach that keeps output good), and Craft/Statamic for the structured-content-first model.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **What you see is what is published.** The editing canvas and the published output are the same renderer, never two implementations. | Webflow | `P5-079`, `P5-326` |
| **UX-2** | **The template constrains, and that is a feature.** A builder cannot produce an inaccessible, unresponsive or off-brand page by accident. | Squarespace | `P5-116`, `P5-284` |
| **UX-3** | **Content is structured, not a blob.** Text is modelled so it can be reused, localised and queried — never only laid out. | Contentful; Sanity | `P5-047` |
| **UX-4** | **Publishing is deliberate, reversible and visible.** Draft, preview, schedule, publish, roll back — with an audit trail. | Vercel previews | `P5-163` |
| **UX-5** | **Total undo and navigable history on the canvas.** | Figma | `P5-090` |
| **UX-6** | **Performance and accessibility are edit-time feedback, not launch-day surprises.** | Lighthouse in-editor | `P5-268`, `P5-284` |
| **UX-7** | **A non-developer ships a real site unaided.** Measured, not asserted. | — | `P5-330` |

---

## 3. Design-system rule

`unierp-design-system` is the source of the **builder's own UI**. The site-facing component library
(§ Stage F) is a separate, versioned library with its own contract, because published sites must be
able to pin a version and not shift when the design system moves. `P5-013` establishes both and the
gate that keeps them apart.

---

## 4. Waves

### Wave 0 · "The boundary is real"
**Phases:** P5-001–P5-020 · Independence, the split, the projection boundary, and the builder shell.

### Wave 1 · "Sites and content"
**Phases:** P5-021–P5-076 · Multi-site architecture and the structured content model.

### Wave 2 · "The editor"
**Phases:** P5-077–P5-160 · Canvas, templates, themes and the site component library.

### Wave 3 · "Publish and serve"
**Phases:** P5-161–P5-208 · Build, preview, publish, rollback, domains, TLS and edge delivery.

### Wave 4 · "Commerce, interaction and reach"
**Phases:** P5-209–P5-298 · Storefronts, forms, integrations, SEO, analytics, accessibility, i18n.

### Wave 5 · "Site types and production"
**Phases:** P5-299–P5-330 · The site kinds, the full test estate, and the two exit proofs.

---

## 5. Stage A · Foundation, the split and the projection boundary (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P5 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P5-002** | The Studio/ERP boundary, declared | P5-001 | The written, enforced boundary: what the builder may read from the ERP, what a published site may read, and the projection that separates them | A published site holding a direct ERP data-access path fails an architecture gate, proven by test | OPEN |
| **P5-003** | Extraction of Studio into its own platform | P5-002 | Studio moved out of `unierp-web/app/_sites` into its own deployable, building and serving standalone | The builder and the site runtime build and run from a clean clone with the tenant app absent | OPEN |
| **P5-004** | Runtime precondition gate | P5-003 | Startup and CI assertion of each external capability, with explicit degradation of the dependent surface | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P5-005** | The content projection | P5-002 | The published, versioned read model a site serves from — written by publish, never by a live ERP query | A site renders fully with the ERP entirely unreachable, proven by running with it stopped | OPEN |
| **P5-006** | Tenancy, site scoping and isolation | P5-001 | `tenantId` and `siteId` on every table with RLS in the same migration | A table without both fails `check-rls-verify.mjs`. Two-tenant and two-site tests prove **zero** rows | OPEN |
| **P5-007** | Migration discipline | P5-006 | Forward-only migrations with tested rollback and immutable shipped migrations | Replaying every migration from empty reproduces the schema exactly | OPEN |
| **P5-008** | Authentication for builders and visitors | P5-006 | Distinct principals: site builder, site administrator, and site visitor — with no privilege bleed | A visitor session cannot reach any builder capability, proven by test | OPEN |
| **P5-009** | Authorization and default deny | P5-008 | Explicit permissions on every endpoint, defaulting to deny, unauthorized returning **403** | An endpoint without a permission declaration fails a gate. Unauthorized returns 403 | OPEN |
| **P5-010** | Audit log for site changes | P5-009 | Append-only audit of every content, structure, theme, domain and publish action | Every mutating action audits. An unaudited one fails a gate. Records are immutable | OPEN |
| **P5-011** | Structured logging and correlation | P5-001 | Correlation from builder action through publish, build and edge delivery | One publish is traceable end to end by a single correlation ID | OPEN |
| **P5-012** | Error taxonomy for builders | P5-011 | Typed errors separating builder mistake, content error, build failure and platform fault, each with remediation | Every error carries a registry code. A stack trace reaching a builder fails a gate | OPEN |
| **P5-013** | Two component libraries, separated | P5-003 | The builder's UI from `unierp-design-system`; the site-facing library as a separately versioned package sites pin | A site-facing component imported into the builder chrome, or vice versa, fails the boundary gate | OPEN |
| **P5-014** | Builder shell and navigation | P5-013 | The frame: site switcher, page tree, canvas, inspector, content panel, publish control | All builder surfaces render in the shell. A surface introducing its own chrome fails the contract test | OPEN |
| **P5-015** | Command model and keyboard | P5-014 | A single command registry driving palette, shortcuts and the accessibility tree | Every builder action is reachable by keyboard alone, proven by test | OPEN |
| **P5-016** | Autosave, drafts and conflict handling | P5-014 | Optimistic local edit with reconciliation, explicit draft state and surfaced conflicts | Two builders editing one page produce a surfaced conflict, never a lost edit | OPEN |
| **P5-017** | Builder performance budget | P5-014 | Budgets for canvas load, interaction latency and preview generation, wired into CI | A regression beyond budget fails CI on the reference profile | OPEN |
| **P5-018** | Builder accessibility baseline | P5-014 | WCAG 2.2 AA across the builder shell itself | The builder shell is `axe` clean and keyboard-complete — the tool, not only its output | OPEN |
| **P5-019** | Rate limiting and abuse control | P5-009 | Limits on publish, build, form submission and asset upload | A publish-spam simulation is throttled. Limits are proven to apply by test | OPEN |
| **P5-020** | Test harness for the builder | P5-014 | Canvas driver, content fixtures, build harness, golden-render comparison and two-site isolation helper | A builder test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |

---

## 6. Stage B · Multi-site architecture (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-021** | Site entity and lifecycle | P5-006 | `Site` with kind, state, ownership and settings — created, suspended, archived, deleted | A site's lifecycle transitions are constrained; an invalid transition is refused at the database level | OPEN |
| **P5-022** | Multiple sites per tenant | P5-021 | Many independent sites under one tenant with separate content, themes and domains | Two sites in one tenant share no content or configuration unless explicitly shared, proven by test | OPEN |
| **P5-023** | Site kinds and capability profiles | P5-021 | Marketing, storefront, portal, documentation, intranet, landing and community kinds, each with its own capability set | A capability outside a site's kind is unavailable, not merely hidden, proven by test | OPEN |
| **P5-024** | Page tree and site structure | P5-021 | Hierarchical pages with ordering, nesting, and structural constraints per kind | A page tree operation producing a cycle or an orphan is refused | OPEN |
| **P5-025** | Routing and URL model | P5-024 | Path generation, slugs, nesting, aliases and reserved paths | Every page has exactly one canonical URL, and a collision is refused at save | OPEN |
| **P5-026** | Redirects and URL history | P5-025 | Automatic redirect creation on slug change, with chains resolved and loops refused | A URL change creates a redirect automatically. A redirect loop is impossible, proven by test | OPEN |
| **P5-027** | Navigation and menu model | P5-024 | Menus derived from or independent of the page tree, with visibility rules | A menu item pointing at a deleted or unpublished page is detected before publish | OPEN |
| **P5-028** | Site settings and configuration | P5-021 | Per-site configuration with validation, defaults and inheritance from tenant policy | An invalid configuration cannot be saved. Tenant policy cannot be overridden where it is mandatory | OPEN |
| **P5-029** | Site cloning and templating | P5-022 | Duplicating a site as a starting point, and saving a site as a reusable template | A cloned site is functionally identical and shares no mutable state with its source, proven by test | OPEN |
| **P5-030** | Multi-region and residency | P5-005 | Per-site content residency and edge region selection | Content for a resident site is provably absent from non-permitted regions, verified by query | OPEN |
| **P5-031** | Site-level permissions and roles | P5-009 | Builder, editor, reviewer, publisher and viewer roles scoped per site | A user with access to one site sees **zero** rows from another, proven by test | OPEN |
| **P5-032** | Content sharing between sites | P5-022 | Explicit, governed sharing of content, assets and components across sites | Sharing is explicit; no content leaks between sites by default, proven by test | OPEN |
| **P5-033** | Site quotas and limits | P5-019 | Per-site limits on pages, assets, bandwidth, builds and form submissions, visible while building | Exceeding a limit fails with the limit named and the current count shown | OPEN |
| **P5-034** | Site archival and deletion | P5-021 | Archival preserving content, and deletion with data disposition and domain release | A deleted site releases its domains and leaves no serving artefact, verified by request | OPEN |
| **P5-035** | Site backup and restore | P5-007 | Per-site backup of content, structure, assets and configuration with tested restore | A restore reproduces a site exactly to a chosen point, verified by golden render | OPEN |
| **P5-036** | Site export and portability | P5-035 | Export of a complete site in an open, documented format, reimportable | Export → import → export produces an identical artefact, verified by comparison | OPEN |
| **P5-037** | Site import and migration | P5-036 | Importing from common platforms with mapping, preview and per-item outcome | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P5-038** | Site health monitoring | P5-011 | Per-site uptime, error rate, build health, broken links and expiring certificates | A broken site is detected and reported to its owner before a visitor reports it | OPEN |
| **P5-039** | Site activity and change feed | P5-010 | Per-site chronological record of every change with actor and diff | Any current site state is explainable from its change feed alone | OPEN |
| **P5-040** | Site-level search across content | P5-024 | Builder-side search across pages, content, assets and components | A content item is findable by any of its properties within the interaction budget | OPEN |
| **P5-041** | Environments per site | P5-021 | Development, staging and production environments per site with promotion | Content published to staging is unreachable from the production domain, proven by request | OPEN |
| **P5-042** | Cross-environment content promotion | P5-041 | Promoting structure and content between environments with a diff and dry run | A promotion's preview equals its outcome exactly, verified differentially | OPEN |
| **P5-043** | Site templates catalogue | P5-029 | A curated catalogue of starting templates per site kind, versioned | Every template produces an accessible, responsive, performant site out of the box, verified per template | OPEN |
| **P5-044** | Site provisioning speed | P5-043 | Creating a working site from a template within a stated time budget | A new site from template is live and viewable within the budget, measured | OPEN |
| **P5-045** | Site ownership and transfer | P5-031 | Transferring site ownership within and between tenants with continuity | A transferred site keeps its domains, content and history intact, proven by test | OPEN |
| **P5-046** | Stage B isolation proof | P5-022 | A suite asserting complete isolation between sites and tenants across content, assets, domains and serving | Two-site and two-tenant tests prove **zero** cross-reads, and a deliberately widened scope is caught | OPEN |

---

## 7. Stage C · The structured content model (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-047** | Content type modelling | P5-021 | The UX-3 mechanism: user-defined content types with typed fields, validation and relationships | Content is queryable by field, not only renderable. A blob-only content type cannot be created | OPEN |
| **P5-048** | Field type library | P5-047 | Text, rich text, number, date, boolean, media, reference, list, geo, colour and structured object fields | Every field type has storage, validation, editing, rendering and serialisation defined once | OPEN |
| **P5-049** | Rich text model | P5-048 | Structured rich text as a document tree, not HTML, with a constrained mark and node set | Rich text round-trips losslessly and cannot carry arbitrary HTML, proven by an injection suite | OPEN |
| **P5-050** | Content relationships and references | P5-047 | References between content items with integrity, cardinality and cascade rules | Deleting referenced content is refused or cascades per declared rule, never leaving a dangling reference | OPEN |
| **P5-051** | Content entries and collections | P5-047 | Entries of a type, organised into collections with ordering and filtering | A collection query is deterministic and permission-aware | OPEN |
| **P5-052** | Content validation | P5-047 | Declarative validation enforced server-side on every write path | A validation rule blocks a write from builder, API and import alike, proven per path | OPEN |
| **P5-053** | Content versioning and history | P5-051 | Immutable versions with semantic diff and revert for every content item | Reverting reproduces a prior version exactly and is itself a new version | OPEN |
| **P5-054** | Draft and published states | P5-053 | Separate draft and published content with independent lifecycles | A draft edit is never visible on the published site, proven by request | OPEN |
| **P5-055** | Content workflow and approval | P5-054 | Configurable review workflows with roles, states and audit | Content cannot reach published state without traversing its configured workflow | OPEN |
| **P5-056** | Content scheduling | P5-054 | Scheduled publication and expiry with timezone correctness | Content publishes and expires at the scheduled instant across timezone and DST boundaries | OPEN |
| **P5-057** | Content localisation | P5-047 | Per-locale content with fallback chains, translation state and locale-specific structure | A missing translation falls back visibly per policy, never silently rendering an empty region | OPEN |
| **P5-058** | Translation workflow and integration | P5-057 | Translation assignment, progress, and export/import for external translators | A translation round-trip preserves structure and markup exactly | OPEN |
| **P5-059** | Asset management | P5-048 | Media library with upload, organisation, metadata, search and usage tracking | An asset's usage across every site and page is answerable before deletion | OPEN |
| **P5-060** | Image processing and delivery | P5-059 | Automatic resizing, format negotiation, cropping with focal points and responsive sources | A published image serves in an appropriate format and size per device, verified by request | OPEN |
| **P5-061** | Video and rich media | P5-059 | Video upload, transcoding, streaming, captions and poster frames | A video serves with captions available. An uncaptioned video is flagged by the accessibility check | OPEN |
| **P5-062** | Document and file assets | P5-059 | Downloadable files with content-type verification, scanning and access control | An executable renamed to `.pdf` is rejected by content inspection | OPEN |
| **P5-063** | Asset access control | P5-062 | Public, authenticated and entitlement-gated assets with signed delivery | A gated asset is unreachable without authorisation, including by direct URL, proven by request | OPEN |
| **P5-064** | Content API | P5-051 | Read and write API over content with filtering, pagination and permission evaluation | Every builder content capability is available by API. A UI-only capability fails the parity test | OPEN |
| **P5-065** | Content delivery projection | P5-005 | Publishing content into the read-optimised projection sites serve from | A projection write and its publish event commit atomically, proven by injection | OPEN |
| **P5-066** | Content search and indexing | P5-040 | Full-text search over content for both the builder and published sites | Published-site search returns only published, permitted content, proven by test | OPEN |
| **P5-067** | Content reuse and singletons | P5-051 | Shared content blocks, global settings and singletons used across pages | Editing a shared block updates every usage, and its usages are listable before editing | OPEN |
| **P5-068** | Content import and bulk operations | P5-052 | Bulk import, edit and delete with dry run, validation preview and rollback | A dry run's reported outcome equals the executed outcome exactly | OPEN |
| **P5-069** | Content permissions and field security | P5-031 | Per-type, per-field and per-item permissions for editors | A field an editor may not read is absent from the payload, not masked | OPEN |
| **P5-070** | Content model migration | P5-047 | Changing content types safely: adding, renaming, retyping and removing fields with data migration | A field retype migrates existing data or refuses with the reason; it never silently drops values | OPEN |
| **P5-071** | Content impact analysis | P5-050 | Before deleting or changing a type, a complete report of affected content, pages and sites | Deleting a type used by a live page is refused and names the page | OPEN |
| **P5-072** | Structured data from ERP | P5-005 | Publishing selected ERP data — products, locations, people — into the projection under explicit governance | Only fields explicitly published are present in the projection, verified by inspection of the projection itself | OPEN |
| **P5-073** | Content editing UX | P5-049 | The editorial surface: focused writing, inline media, references and validation feedback | An editor completes a rich article without leaving the editing surface, verified by exercise | OPEN |
| **P5-074** | Editorial accessibility | P5-018 | WCAG 2.2 AA for the content editing surfaces, including the rich text editor | The rich text editor is fully operable by keyboard and screen reader, recorded as a test | OPEN |
| **P5-075** | Content performance at volume | P5-064 | Content queries and the media library within budget at 100,000 entries and 50,000 assets | Content list, search and reference lookup meet budget at that volume, measured | OPEN |
| **P5-076** | Stage C proof | P5-070 | A suite asserting content integrity, versioning, localisation fallback, reference integrity and permission behaviour | Every invariant holds, and a deliberately removed reference guard is caught immediately | OPEN |

---

## 8. Stage D · The visual editor (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-077** | Page document model | P5-024 | The page as a typed component tree with props, bindings, style and layout in metadata | A page renders identically from metadata alone with no build step, verified by golden render | OPEN |
| **P5-078** | Rendering engine | P5-077 | The single renderer producing HTML from the page document, server-side and streaming | The renderer is used by both canvas and published output — a second renderer fails an architecture gate | OPEN |
| **P5-079** | Canvas fidelity | P5-078 | The UX-1 mechanism: the canvas rendering through the same engine as production, in the same conditions | Canvas and published output are pixel-identical for the reference page set, verified by visual comparison | OPEN |
| **P5-080** | Direct manipulation | P5-079 | Select, drag, drop, nest, resize, align, distribute and duplicate on the canvas | A page composed visually matches its metadata exactly, verified by round-trip | OPEN |
| **P5-081** | Selection, hierarchy and layer tree | P5-080 | Layer tree navigation, multi-select, grouping and locking synchronised with the canvas | Selection state is consistent between tree and canvas at all times, proven by test | OPEN |
| **P5-082** | Layout model | P5-080 | Flow, flex and grid layout expressed in the page document with visual controls | Every layout expressible in the editor produces valid, responsive output, verified across the reference set | OPEN |
| **P5-083** | Responsive editing | P5-082 | Breakpoint-aware editing with inheritance and per-breakpoint override | A change at one breakpoint affects others only per declared inheritance, proven by test | OPEN |
| **P5-084** | Style system and the CSS model | P5-082 | Styles as reusable, named, tokenised classes rather than per-element inline overrides | An inline style overriding a token fails the token gate. Styles are reusable and their usages listable | OPEN |
| **P5-085** | Typography system | P5-084 | Type scales, fonts, loading strategy and vertical rhythm as tokens | A font loads without layout shift beyond budget, measured. A hardcoded font size fails the gate | OPEN |
| **P5-086** | Colour system and contrast enforcement | P5-084 | Palette tokens with automatic contrast validation at edit time | A colour combination failing contrast is refused or warned at edit time, per UX-2 | OPEN |
| **P5-087** | Spacing and sizing system | P5-084 | Spacing scale, container widths and consistent sizing tokens | A hardcoded `px` value fails the token gate, as everywhere else in the family | OPEN |
| **P5-088** | Effects, motion and interaction | P5-084 | Transitions, animations and scroll effects respecting reduced-motion preference | Every animation is disabled under `prefers-reduced-motion`, verified by test | OPEN |
| **P5-089** | Component instances and overrides | P5-077 | Reusable component instances with prop overrides and detachment | Editing a component updates every instance except overridden props, proven by test | OPEN |
| **P5-090** | Undo, redo and history | P5-077 | The UX-5 mechanism: total undo to arbitrary depth, plus navigable version history | Any edit is undoable within a session and any version restorable afterwards | OPEN |
| **P5-091** | Copy, paste and cross-page reuse | P5-089 | Copying structure between pages and sites with dependency resolution | A pasted section brings its styles and content dependencies, or reports what is missing | OPEN |
| **P5-092** | Content binding on the canvas | P5-051 | Binding components to content entries, collections and fields visually | A bound component renders real content in the canvas, identical to published output | OPEN |
| **P5-093** | Collection rendering and repeaters | P5-092 | Repeating structures over collections with filtering, sorting, limits and empty states | A repeater declares its empty, loading and error states; a missing state fails validation at save | OPEN |
| **P5-094** | Conditional visibility | P5-092 | Showing and hiding by content state, locale, device, audience or entitlement | A hidden element is absent from the published payload where the condition is server-evaluable | OPEN |
| **P5-095** | Dynamic pages from content | P5-093 | Template pages generating routes per content entry, with per-entry metadata | A collection of 10,000 entries generates 10,000 correct, indexable routes, verified by crawl | OPEN |
| **P5-096** | Canvas performance | P5-017 | Canvas interaction within budget on large, complex pages | A 500-element page remains within interaction budget, measured | OPEN |
| **P5-097** | Canvas accessibility | P5-018 | Keyboard-complete composition and screen-reader-navigable structure on the canvas | A page is composed and restructured without a mouse and without sight, recorded as a test | OPEN |
| **P5-098** | Real-time collaboration | P5-016 | Multi-user editing with presence, awareness and conflict-free merging | Two builders editing one page concurrently converge to one correct state, proven by test | OPEN |
| **P5-099** | Comments and review on the canvas | P5-098 | Pinned comments, threads, mentions and resolution tied to page elements | A comment survives the movement of its anchor element or is explicitly orphaned, never silently lost | OPEN |
| **P5-100** | Preview across devices and states | P5-083 | Previewing at breakpoints, in locales, as audiences and in dark mode | Preview equals published output for every combination, verified differentially | OPEN |
| **P5-101** | Code view and export | P5-078 | Inspecting the generated markup and styles, and exporting a page's code | Exported code renders identically standalone, verified by golden render | OPEN |
| **P5-102** | Custom code injection | P5-101 | Governed insertion of custom HTML, CSS and script with sanitisation and CSP compliance | Injected code cannot break the CSP or execute cross-site script, proven by an injection suite | OPEN |
| **P5-103** | Design token import and brand kit | P5-084 | Importing brand tokens and enforcing them across a site | A page violating brand tokens is refused or flagged per policy, proven by test | OPEN |
| **P5-104** | Page-level settings and metadata | P5-077 | Per-page title, description, social metadata, robots directives and canonical URL | Every page has complete metadata before publish; an incomplete page is refused per policy | OPEN |
| **P5-105** | Asset placement and optimisation in the editor | P5-060 | Placing media with automatic optimisation, focal points and responsive sources | A placed image is automatically optimised; an unoptimised original never reaches production | OPEN |
| **P5-106** | Editor state persistence and recovery | P5-016 | Recovering the editing session after crash, tab close or connection loss | A killed browser recovers every uncommitted edit on return, proven by test | OPEN |
| **P5-107** | Page duplication and variants | P5-089 | Duplicating pages and maintaining variants for testing and audiences | A variant shares its source's updates except where overridden, proven by test | OPEN |
| **P5-108** | Bulk page operations | P5-024 | Bulk move, delete, publish and metadata edit across the page tree | A bulk operation reports per-page outcome and never partially applies without reporting | OPEN |
| **P5-109** | Editor onboarding and guidance | P5-014 | In-context guidance, templates and progressive disclosure for first-time builders | A first-time builder composes a page unaided, measured against the UX-7 target | OPEN |
| **P5-110** | Stage D fidelity proof | P5-079 | A suite comparing canvas render, preview and published output across the reference page set at every breakpoint and locale | All three are identical, and a deliberately divergent render path is caught immediately | OPEN |

---

## 9. Stage E · Templates, themes and constraints (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-111** | Theme model | P5-084 | A theme as a versioned bundle of tokens, styles, layouts and component defaults | A theme is applied and reverted cleanly, leaving no residual styling, proven by test | OPEN |
| **P5-112** | Theme switching and inheritance | P5-111 | Applying a theme to a site with per-page and per-section override | A theme change updates every unoverridden surface, and overrides are listable | OPEN |
| **P5-113** | Template model | P5-077 | Page and section templates with slots, constraints and required content | A template's required slots must be filled before publish, enforced at validation | OPEN |
| **P5-114** | Layout templates and page types | P5-113 | Header, footer, sidebar and page-type templates applied across a site | A global header change propagates to every page using it, proven by test | OPEN |
| **P5-115** | Template versioning and updates | P5-113 | Versioned templates with an update path that preserves site customisation | A template update preserves customisation or surfaces a conflict, never silently reverting | OPEN |
| **P5-116** | The constraint system | P5-113 | The UX-2 mechanism: templates declaring what may be changed, with the rest locked | A builder cannot produce an off-brand, unresponsive or inaccessible page within a constrained template, proven by an adversarial test | OPEN |
| **P5-117** | Design guardrails and linting | P5-116 | Edit-time warnings for contrast, hierarchy, density, orphaned elements and inconsistency | Each guardrail fires on a seeded violation and is silent on a clean page | OPEN |
| **P5-118** | Theme and template marketplace readiness | P5-115 | Packaging themes and templates for distribution with metadata and versioning | A packaged theme installs into another site and renders identically, verified by golden render | OPEN |
| **P5-119** | Custom theme development | P5-111 | Developer-authored themes with a documented contract and a build pipeline | A custom theme is developed locally and installed without platform involvement | OPEN |
| **P5-120** | Theme preview and trial | P5-112 | Previewing a theme against real site content before applying | Preview equals the applied result exactly, verified differentially | OPEN |
| **P5-121** | Dark mode and colour scheme support | P5-086 | Per-theme light and dark palettes with automatic and manual switching | Every theme renders correctly in both schemes with contrast maintained, verified per theme | OPEN |
| **P5-122** | Print and document styling | P5-111 | Print stylesheets and document output from site content | A published page prints legibly with navigation chrome suppressed, verified visually | OPEN |
| **P5-123** | Email templates from site themes | P5-111 | Themed, client-compatible email templates sharing the site's tokens | An email renders correctly across the declared client matrix, verified per client | OPEN |
| **P5-124** | Template accessibility conformance | P5-116 | Every shipped template proven WCAG 2.2 AA before it may be offered | A template failing accessibility cannot be published to the catalogue, enforced by gate | OPEN |
| **P5-125** | Template performance conformance | P5-017 | Every shipped template proven within performance budget on reference content | A template failing the performance budget cannot be published, enforced by gate | OPEN |
| **P5-126** | Template responsiveness conformance | P5-083 | Every shipped template proven usable from 320 px upward with no horizontal scroll | A template producing horizontal scroll at 320 px fails the gate | OPEN |
| **P5-127** | Starter template set | P5-124 | The initial catalogue of templates per site kind, each conformance-proven | Every starter template passes accessibility, performance and responsiveness gates | OPEN |
| **P5-128** | Section and block library | P5-113 | Reusable page sections — heroes, features, pricing, testimonials, CTA, FAQ | Every section is accessible, responsive and themed, verified per section | OPEN |
| **P5-129** | Template customisation depth | P5-116 | The declared spectrum from locked template to fully open canvas, per site kind | A site kind's customisation level is enforced, not merely suggested, proven by test | OPEN |
| **P5-130** | Theme migration and upgrade | P5-115 | Migrating a site between theme versions and between themes | A theme migration preserves content completely; only presentation changes, verified by content comparison | OPEN |
| **P5-131** | Brand consistency across sites | P5-103 | Tenant-level brand enforcement across every site | A site violating tenant brand policy is refused at publish where policy is mandatory | OPEN |
| **P5-132** | Theme and template testing | P5-020 | Automated conformance testing for every theme and template | A theme regression is caught by CI before it reaches the catalogue | OPEN |
| **P5-133** | Template documentation | P5-113 | Generated documentation of each template's slots, constraints and options | Documentation is generated from the template definition and cannot drift | OPEN |
| **P5-134** | Theme performance budget enforcement | P5-125 | Per-theme asset, font and script budgets enforced at build | A theme exceeding its budget fails the build with the offending asset named | OPEN |
| **P5-135** | Legacy template compatibility | P5-115 | Continued rendering of sites on retired template versions | A site on a retired template continues to render and publish correctly, proven by test | OPEN |
| **P5-136** | Stage E constraint proof | P5-116 | An adversarial suite attempting to produce inaccessible, unresponsive and off-brand pages within constrained templates | Every attempt is refused, and each succeeds the moment its constraint is removed | OPEN |

---

## 10. Stage F · The site component library (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-137** | Component contract and versioning | P5-013 | The contract every site component satisfies: props, slots, states, accessibility and version | A component without a complete contract cannot enter the library, enforced by gate | OPEN |
| **P5-138** | Layout components | P5-082 | Container, grid, stack, columns, spacer and divider | Each is responsive from 320 px and produces valid layout, verified per component | OPEN |
| **P5-139** | Typography components | P5-085 | Heading, paragraph, list, quote, code and inline marks with semantic output | Heading levels produce a valid document outline; a skipped level is flagged | OPEN |
| **P5-140** | Media components | P5-060 | Image, gallery, video, audio, embed and figure with captions | Every media component supports alternative text; missing alternative text is flagged before publish | OPEN |
| **P5-141** | Navigation components | P5-027 | Header, menu, breadcrumb, pagination, tabs and footer navigation | Every navigation component is keyboard-operable and announces state, verified per component | OPEN |
| **P5-142** | Content display components | P5-092 | Card, list, table, accordion, timeline and comparison | Every component declares empty, loading and error states; a missing state fails validation | OPEN |
| **P5-143** | Interactive components | P5-088 | Modal, drawer, tooltip, popover, carousel and disclosure | Focus management is correct for every overlay, verified with a screen reader | OPEN |
| **P5-144** | Form components | P5-137 | Input, select, checkbox, radio, textarea, file, date and submit | Every field has a label, description and error association, verified per component | OPEN |
| **P5-145** | Commerce components | P5-137 | Product card, price, variant selector, cart, quantity and checkout button | Each renders correct pricing and currency and is keyboard-operable | OPEN |
| **P5-146** | Data-bound components | P5-093 | Collection list, filter, sort, search and detail views bound to content | A bound component reads only from the projection, never from the ERP, enforced by gate | OPEN |
| **P5-147** | Marketing components | P5-128 | Hero, feature grid, testimonial, logo wall, statistic and call to action | Each is accessible, responsive and themed, verified per component | OPEN |
| **P5-148** | Social and sharing components | P5-137 | Share, follow and embed components with privacy-respecting defaults | No social component loads a third-party script before consent, proven by request inspection | OPEN |
| **P5-149** | Map and location components | P5-137 | Maps with markers, directions and an accessible textual alternative | A map has a text alternative conveying the same information, verified with a screen reader | OPEN |
| **P5-150** | Chart and data visualisation components | P5-146 | Charts bound to content with accessible table equivalents | Every chart has a screen-reader-navigable table equivalent, verified per chart type | OPEN |
| **P5-151** | Authentication-aware components | P5-008 | Login, account and gated-content components for portal sites | A gated component reveals nothing to an unauthenticated visitor, including in the payload | OPEN |
| **P5-152** | Search components | P5-066 | Site search input, results, facets and empty states | Site search returns only published, permitted content, proven by test | OPEN |
| **P5-153** | Component states completeness | P5-137 | Every component required to define default, hover, focus, active, disabled, loading, empty and error | A component missing a required state fails the completeness gate | OPEN |
| **P5-154** | Component accessibility conformance | P5-153 | Every component individually proven WCAG 2.2 AA | A component failing accessibility cannot enter the library, enforced by gate | OPEN |
| **P5-155** | Component performance budget | P5-134 | Per-component size and runtime budgets enforced at build | A component exceeding its budget fails the build | OPEN |
| **P5-156** | Component documentation and stories | P5-137 | A story and generated documentation per component with every state | A component without a story fails the gate. Documentation is generated, not written twice | OPEN |
| **P5-157** | Custom component extension | P5-119 | Developer-authored site components meeting the same contract | A custom component is held to the identical accessibility and performance gates, proven by test | OPEN |
| **P5-158** | Component library versioning | P5-013 | Semantic versioning with sites pinning a version and an explicit upgrade path | A library update does not change a pinned site's output, proven by golden render | OPEN |
| **P5-159** | Component usage analytics | P5-137 | Which components are used where, informing deprecation and improvement | A component's usage across every site is answerable before it is changed or removed | OPEN |
| **P5-160** | Stage F library proof | P5-154 | A suite rendering every component in every state at every breakpoint in both colour schemes | The library passes accessibility, performance and visual regression, and fails when a component regresses | OPEN |

---

## 11. Stage G · Build, publish and delivery (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-161** | Build pipeline | P5-078 | Deterministic site build from content and structure into deployable artefacts | Two builds of identical input produce byte-identical artefacts, verified by hash | OPEN |
| **P5-162** | Incremental and partial builds | P5-161 | Rebuilding only what changed, with correct dependency tracking | A single content change rebuilds only affected pages, and never misses one, proven by test | OPEN |
| **P5-163** | Publish workflow | P5-055 | The UX-4 mechanism: draft, preview, schedule, publish, roll back — audited at every step | A publish is reversible in one action to the exact prior state, verified by golden render | OPEN |
| **P5-164** | Preview deployments | P5-161 | Per-change preview URLs, access-controlled and automatically expiring | A preview URL is unreachable without authorisation and expires as declared, proven by request | OPEN |
| **P5-165** | Atomic publishing | P5-161 | A publish that is all-or-nothing across every changed page and asset | A visitor never sees a half-published site, proven under publish with induced failure | OPEN |
| **P5-166** | Rollback and version pinning | P5-163 | Rolling back to any prior published version, and pinning a version | A rollback restores the exact prior output including assets, verified by comparison | OPEN |
| **P5-167** | Scheduled publishing | P5-056 | Publishing at a scheduled instant, surviving restart and timezone change | A scheduled publish fires at the exact instant across a deployment and a DST transition | OPEN |
| **P5-168** | Build failure handling | P5-161 | Clear, actionable build errors that never take down a currently published site | A failed build leaves the live site untouched and reports the failing page and reason | OPEN |
| **P5-169** | Edge delivery and caching | P5-165 | Serving published sites from edge locations with correct cache headers | A published page serves from edge within the latency budget, measured from multiple regions | OPEN |
| **P5-170** | Cache invalidation | P5-169 | Purging exactly what changed on publish, with correctness over aggressiveness | A published change is visible globally within the stated window. A stale page beyond it is proven impossible | OPEN |
| **P5-171** | Static, dynamic and hybrid rendering | P5-078 | Per-page rendering strategy: static, server-rendered, incrementally regenerated | Each strategy produces identical output for identical input, verified differentially | OPEN |
| **P5-172** | Personalisation and edge logic | P5-094 | Audience, geography and device variation evaluated at the edge without leaking data | Personalisation never exposes another visitor's or tenant's data, proven by an inference test | OPEN |
| **P5-173** | Asset pipeline and delivery | P5-060 | Hashing, compression, format negotiation and long-cache delivery for assets | An asset change produces a new URL; a cached asset is never stale, proven by test | OPEN |
| **P5-174** | Script and style optimisation | P5-155 | Bundling, splitting, tree-shaking and critical CSS extraction | A published page ships only the code it uses, measured against the budget | OPEN |
| **P5-175** | Font optimisation and loading | P5-085 | Subsetting, preloading and swap strategy to eliminate layout shift | Cumulative layout shift from fonts is within budget, measured | OPEN |
| **P5-176** | Content security policy | P5-102 | A strict CSP on every published site with nonce-based script allowance | A published site has no `unsafe-inline` script. An injected script fails to execute, proven by test | OPEN |
| **P5-177** | Security headers and hardening | P5-176 | HSTS, frame options, referrer policy, permissions policy on every response | Every published response carries the full header set, verified by request across the site estate | OPEN |
| **P5-178** | Bot, scraper and abuse protection | P5-019 | Rate limiting, bot detection and protection for published sites | An abusive traffic pattern is mitigated without blocking legitimate visitors, verified by test | OPEN |
| **P5-179** | Denial-of-service resilience | P5-169 | Absorbing traffic spikes at the edge with origin protection | A traffic spike is absorbed without origin degradation, verified under load | OPEN |
| **P5-180** | Build performance | P5-162 | Build time within budget for large sites | A 10,000-page site builds within the stated budget, measured | OPEN |
| **P5-181** | Publish observability | P5-011 | Metrics on build duration, publish success, cache hit rate and edge latency | A slow or failing publish is diagnosable from telemetry alone | OPEN |
| **P5-182** | Site uptime and availability | P5-169 | Availability targets for published sites with monitoring and alerting | A published site outage is detected and alerted from real data, and the alert has fired in rehearsal | OPEN |
| **P5-183** | Origin failover and static fallback | P5-179 | Serving the last good build when the origin is unavailable | With the origin stopped, published sites continue serving, verified by request | OPEN |
| **P5-184** | Deployment environments and promotion | P5-041 | Promoting a build through environments with identical artefacts | The artefact tested in staging is bit-identical to the one published, verified by hash | OPEN |
| **P5-185** | Build reproducibility and provenance | P5-161 | Signed builds with provenance attestation linking artefact to content version | A published artefact's exact source content version is provable from its attestation | OPEN |
| **P5-186** | Publishing permissions and approval | P5-031 | Publish as a distinct permission with optional approval requirement | A site requiring approval cannot be published unapproved by any path, proven by test | OPEN |
| **P5-187** | Bulk and multi-site publishing | P5-165 | Publishing across many sites with per-site outcome reporting | A multi-site publish reports exactly which sites succeeded and why each failure failed | OPEN |
| **P5-188** | Stage G publishing proof | P5-165 | A suite publishing under induced failure at every step, asserting atomicity, rollback and cache correctness | No injected failure produces a half-published site or a stale page, and removing atomicity is caught | OPEN |

---

## 12. Stage H · Domains, DNS, TLS and routing (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-189** | Domain model | P5-021 | Domains, subdomains and their assignment to sites and environments | A domain maps to exactly one site and environment; a conflict is refused at assignment | OPEN |
| **P5-190** | Domain verification | P5-189 | Proving control of a custom domain before it may serve | An unverified domain cannot serve a site, enforced mechanically | OPEN |
| **P5-191** | DNS configuration and guidance | P5-190 | Generated DNS instructions per provider with automatic verification of correctness | A misconfigured DNS record is detected and the exact correction stated | OPEN |
| **P5-192** | TLS certificate provisioning | P5-190 | Automatic certificate issuance, installation and renewal | A certificate renews before expiry without intervention. An imminent expiry alerts | OPEN |
| **P5-193** | Certificate monitoring and recovery | P5-192 | Detecting failed renewal and recovering before a visitor sees an error | A failed renewal is detected and recovered or escalated before expiry, verified by rehearsal | OPEN |
| **P5-194** | Apex, subdomain and wildcard handling | P5-189 | Correct handling of apex domains, subdomains and wildcard certificates | Each domain shape serves correctly with valid TLS, verified per shape | OPEN |
| **P5-195** | Canonical domain and redirect policy | P5-026 | One canonical host with all others redirecting permanently | Every non-canonical host redirects to canonical in one hop, verified by request | OPEN |
| **P5-196** | Multi-domain and multi-region sites | P5-030 | One site served on several domains, with per-domain locale or region | A per-locale domain serves the correct locale without a redirect chain, verified by request | OPEN |
| **P5-197** | Internationalised domain names | P5-194 | IDN support with correct encoding and display | An IDN serves correctly and displays without homograph confusion, verified per fixture | OPEN |
| **P5-198** | Domain transfer and release | P5-034 | Moving a domain between sites and releasing it on deletion | A released domain stops serving immediately and cannot be hijacked by another tenant, proven by test | OPEN |
| **P5-199** | Routing and rewrite rules | P5-025 | Declarative redirects, rewrites and proxying with loop detection | A rule producing a loop is refused at save. Rules evaluate in a declared, testable order | OPEN |
| **P5-200** | Path-based multi-site routing | P5-189 | Serving several sites under one domain at different paths | Path-routed sites remain fully isolated, proven by two-site test | OPEN |
| **P5-201** | Reserved paths and platform routes | P5-025 | Platform-reserved paths that a site cannot claim | A site attempting to claim a reserved path is refused with the path named | OPEN |
| **P5-202** | Domain-level access control | P5-151 | Password protection, IP allowlisting and authentication at the domain level | A protected site is unreachable without authorisation, including by direct asset URL | OPEN |
| **P5-203** | Staging domain protection | P5-041 | Non-production environments never indexable and never publicly reachable by default | A staging site returns no content to an unauthenticated request and is absent from indexes, verified | OPEN |
| **P5-204** | Domain health monitoring | P5-038 | Continuous checking of DNS, TLS, reachability and redirect correctness | A domain misconfiguration is detected and reported before a visitor encounters it | OPEN |
| **P5-205** | Domain quotas and limits | P5-033 | Per-tenant and per-site domain limits with clear messaging | Exceeding the limit fails with the limit named and the current count shown | OPEN |
| **P5-206** | Domain audit and change history | P5-010 | Full audit of domain assignment, verification and certificate events | Every domain change is attributable to an actor and a time | OPEN |
| **P5-207** | Subdomain provisioning for tenants | P5-189 | Automatic platform subdomains for every site, immediately serving | A new site is reachable on its platform subdomain within the provisioning budget, measured | OPEN |
| **P5-208** | Stage H proof | P5-192 | A suite asserting domain verification, TLS validity, redirect correctness and isolation across every domain shape | Every shape serves correctly with valid TLS, and an unverified domain never serves | OPEN |

---

## 13. Stage I · Commerce sites (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-209** | Storefront site kind | P5-023 | The storefront capability profile with its own templates and components | A storefront capability is unavailable on a non-storefront site, proven by test | OPEN |
| **P5-210** | Product projection from ERP | P5-072 | Publishing selected product, price and stock data into the projection under governance | Only explicitly published product fields reach the projection, verified by inspecting it | OPEN |
| **P5-211** | Product catalogue rendering | P5-146 | Category, listing, detail and variant surfaces bound to the projection | A product page renders entirely from the projection with the ERP unreachable | OPEN |
| **P5-212** | Product search and filtering | P5-152 | Faceted product search with accurate counts and performance | Facet counts match the result set exactly, and search meets the interaction budget | OPEN |
| **P5-213** | Variants, options and configuration | P5-211 | Variant selection with availability, pricing and image switching | Selecting a variant updates price, availability and imagery consistently, proven by test | OPEN |
| **P5-214** | Pricing display and currency | P5-210 | Locale-correct price display including tax convention per market | Displayed price equals the price charged at checkout exactly, in every currency | OPEN |
| **P5-215** | Stock and availability display | P5-210 | Availability shown from the projection with a declared freshness window | Displayed availability is never staler than its declared window, enforced and displayed | OPEN |
| **P5-216** | Cart | P5-211 | Persistent cart with line items, quantities, validation and expiry | A cart survives session loss and revalidates prices, never charging a stale price | OPEN |
| **P5-217** | Checkout | P5-216 | The purchase journey: details, shipping, payment, review, confirm — accessible and resumable | Checkout completes by keyboard alone and with a screen reader, recorded as a test | OPEN |
| **P5-218** | Payment integration | P5-217 | Payment acceptance with no card data touching this platform | No payment instrument is stored or transits this platform, verified by inspection and scan | OPEN |
| **P5-219** | Order submission into the ERP | P5-005 | Orders written into the ERP through a governed inbound path, never a direct database write | An order reaches the ERP through the declared path only; a direct write fails an architecture gate | OPEN |
| **P5-220** | Shipping methods and rate calculation | P5-217 | Shipping options, rates and delivery estimates from real configuration | A quoted shipping rate equals the charged rate exactly | OPEN |
| **P5-221** | Tax calculation at checkout | P5-214 | Tax determined at checkout consistently with the ERP's determination | Tax at storefront checkout equals ERP-determined tax for identical inputs, verified differentially | OPEN |
| **P5-222** | Discounts, promotions and coupons | P5-216 | Promotion application with eligibility, stacking rules and limits | A coupon cannot be redeemed beyond its limit, proven under concurrent redemption | OPEN |
| **P5-223** | Customer accounts and order history | P5-151 | Storefront accounts with order history, addresses and preferences | A customer sees **zero** rows belonging to another customer, proven by test | OPEN |
| **P5-224** | Guest checkout | P5-217 | Purchase without an account, with optional post-purchase account creation | A guest order is complete and traceable, and converts to an account without data loss | OPEN |
| **P5-225** | Order confirmation and communication | P5-123 | Confirmation, shipping and delivery notifications from templates | Every transactional message exists in every supported locale and is delivered reliably | OPEN |
| **P5-226** | Returns and self-service | P5-223 | Customer-initiated returns flowing into the ERP's returns process | A storefront return creates a real ERP return record, proven by test | OPEN |
| **P5-227** | Abandoned cart recovery | P5-216 | Cart abandonment detection and recovery messaging with consent | Recovery messaging is sent only with consent and honours unsubscribe, proven by test | OPEN |
| **P5-228** | Product reviews on storefronts | P5-211 | Reviews tied to verified purchase, moderated | A review cannot exist without a verified purchase, enforced mechanically | OPEN |
| **P5-229** | Wishlists and saved items | P5-223 | Customer-side saving and sharing with correct permissions | A shared wishlist reveals nothing beyond what was shared, proven by test | OPEN |
| **P5-230** | Subscription and recurring commerce | P5-217 | Subscription products with recurring billing through the ERP | A storefront subscription creates a real ERP subscription, and changes propagate both ways correctly | OPEN |
| **P5-231** | Digital and downloadable products | P5-063 | Entitlement-gated digital delivery with signed, expiring access | A digital product is unreachable without entitlement, including by direct URL | OPEN |
| **P5-232** | Multi-currency and multi-market storefronts | P5-196 | Per-market catalogue, pricing, tax and shipping | A market's storefront shows only products available in that market, proven by test | OPEN |
| **P5-233** | Storefront performance | P5-169 | Listing, detail and checkout within Core Web Vitals thresholds | Core Web Vitals green on listing, detail and checkout at the 75th percentile, measured | OPEN |
| **P5-234** | Storefront accessibility | P5-154 | WCAG 2.2 AA across the full commerce journey | The complete journey from listing to confirmation is `axe` clean and keyboard-complete | OPEN |
| **P5-235** | Commerce analytics | P5-259 | Funnel, conversion, revenue and product performance for storefronts | Storefront revenue figures reconcile to ERP order records exactly | OPEN |
| **P5-236** | Stage I commerce proof | P5-219 | An end-to-end suite from product browse through order in the ERP, with the ERP unreachable during browse | Browse works with the ERP stopped; ordering flows through the governed path only, and a direct write attempt fails | OPEN |

---

## 14. Stage J · Forms, interaction and integration (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-237** | Form builder | P5-144 | Visual form construction with typed fields, validation and layout | A form built visually produces metadata that renders identically, verified by round-trip | OPEN |
| **P5-238** | Form validation and server authority | P5-237 | Validation declared once, enforced on the server, mirrored in the browser | A crafted request bypassing the browser is rejected server-side with the identical error | OPEN |
| **P5-239** | Form submission handling | P5-238 | Submission storage, notification, acknowledgement and idempotency | A double-submitted form creates one submission, proven under induced failure | OPEN |
| **P5-240** | Spam and abuse protection | P5-178 | Bot mitigation, rate limiting and content filtering without CAPTCHAs where avoidable | A spam campaign is mitigated, and a legitimate submission is never blocked, verified by test | OPEN |
| **P5-241** | Form submission routing | P5-239 | Routing submissions to email, ERP records, connectors and webhooks | A submission reaching the ERP goes through the governed inbound path only | OPEN |
| **P5-242** | Conditional logic in forms | P5-237 | Show, hide, require and default by expression, enforced server-side | A conditionally required field is enforced on the server, not only in the browser | OPEN |
| **P5-243** | Multi-step forms and progress | P5-242 | Step definition, per-step validation and resumable partial state | Abandoning mid-form and returning restores exactly the entered state, including files | OPEN |
| **P5-244** | File upload in forms | P5-062 | Uploads with scanning, type verification, size limits and quota | An executable renamed to `.pdf` is rejected by content inspection | OPEN |
| **P5-245** | Form accessibility | P5-154 | WCAG 2.2 AA for every generated form, including errors and multi-step | Every generated form is `axe` clean and completable by keyboard and screen reader | OPEN |
| **P5-246** | Form analytics | P5-259 | Completion, abandonment, per-field errors and time to complete | The field causing highest abandonment is identifiable from analytics alone | OPEN |
| **P5-247** | Consent, privacy and data capture | P5-266 | Explicit consent capture with purpose, and honouring withdrawal | A submission without required consent is refused. Withdrawal stops all downstream use | OPEN |
| **P5-248** | Webhooks and outbound integration | P5-241 | Outbound webhooks with signing, retry, dead-letter and delivery guarantees | A subscriber offline for an hour receives every event on return, in order | OPEN |
| **P5-249** | Inbound integration and API | P5-064 | Programmatic content and form access for external systems | Every builder capability is available by API; a UI-only capability fails the parity test | OPEN |
| **P5-250** | Third-party script governance | P5-176 | Governed inclusion of analytics, chat and marketing scripts, consent-gated | No third-party script loads before consent, proven by request inspection | OPEN |
| **P5-251** | Marketing and CRM integration | P5-241 | Lead capture flowing into the ERP's CRM with attribution and deduplication | A lead reaches CRM with source attributed, and duplicates merge rather than multiply | OPEN |
| **P5-252** | Email and notification integration | P5-123 | Transactional and marketing email from site events with unsubscribe honoured | An unsubscribe is honoured across every channel, proven by test | OPEN |
| **P5-253** | Live chat and support integration | P5-250 | Governed chat integration with consent and performance budget | Chat loads after consent and within budget, never blocking initial render | OPEN |
| **P5-254** | Comment and community interaction | P5-151 | Comments and discussion on content with moderation | A comment is moderated before publication where policy requires it | OPEN |
| **P5-255** | Social and content syndication | P5-148 | RSS, sitemaps, social metadata and content feeds | Every feed validates and reflects published content exactly | OPEN |
| **P5-256** | Stage J proof | P5-238 | A suite asserting server-side validation, idempotency, consent and spam resistance across generated forms | Every guarantee holds, and browser-only validation reintroduced is caught immediately | OPEN |

---

## 15. Stage K · SEO, performance and analytics (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-257** | Metadata and structured data | P5-104 | Per-page metadata, Open Graph, Twitter cards and schema.org structured data | Structured data validates for every page type, verified against the validator | OPEN |
| **P5-258** | Sitemaps and robots | P5-095 | Generated sitemaps including dynamic routes, and robots directives per environment | The sitemap contains exactly the indexable published pages, verified by comparison | OPEN |
| **P5-259** | Analytics and measurement | P5-247 | Privacy-respecting analytics with consent gating and no third-party cookie dependency | The visitor funnel is measurable end to end without third-party tracking cookies | OPEN |
| **P5-260** | Canonical URLs and duplicate prevention | P5-195 | Canonical declaration and duplicate-content prevention across domains and locales | Every page declares exactly one canonical URL, verified by crawl | OPEN |
| **P5-261** | `hreflang` and international SEO | P5-196 | Correct `hreflang` across locales and regional domains | `hreflang` is reciprocal and complete across every locale pair, verified by crawl | OPEN |
| **P5-262** | Broken-link detection | P5-038 | Continuous internal and external link checking before and after publish | A broken internal link is reported before publish, not after | OPEN |
| **P5-263** | Redirect management | P5-199 | Redirect authoring, import, chain resolution and loop prevention | No redirect chain exceeds one hop in published output, verified by crawl | OPEN |
| **P5-264** | SEO auditing in the builder | P5-257 | Edit-time SEO feedback: metadata completeness, headings, alt text, link quality | Each check fires on a seeded violation and is silent on a clean page | OPEN |
| **P5-265** | Core Web Vitals measurement | P5-233 | Field and lab measurement of Core Web Vitals per page, per site | Vitals are measured from real traffic, not only from lab runs, and regressions alert | OPEN |
| **P5-266** | Consent management | P5-250 | A consent mechanism honoured by every script, cookie and tracker | Declining consent results in zero non-essential cookies and zero third-party requests, verified | OPEN |
| **P5-267** | Cookie and storage governance | P5-266 | An inventory of every cookie and storage key with purpose and lifetime | An undeclared cookie set by any component fails a gate | OPEN |
| **P5-268** | In-builder performance feedback | P5-265 | The UX-6 mechanism: performance impact shown while building, per component and asset | An oversized asset or heavy component is flagged at insertion, not at launch | OPEN |
| **P5-269** | Image and asset performance enforcement | P5-105 | Enforced limits on image weight and format at publish | An unoptimised image cannot reach production, enforced at publish | OPEN |
| **P5-270** | Third-party performance budget | P5-250 | Budgets on third-party script weight and blocking time | Exceeding the third-party budget fails publish with the offending script named | OPEN |
| **P5-271** | Search engine indexing control | P5-258 | Per-page and per-environment indexing directives with staging always excluded | A staging page is never indexable, verified by header and robots inspection | OPEN |
| **P5-272** | Site search analytics | P5-152 | Query volume, zero-result rate and click-through on site search | A zero-result query is identifiable and routable to a content gap | OPEN |
| **P5-273** | A/B testing and experimentation | P5-107 | Page and component variants with assignment, measurement and significance | An experiment's assignment is stable per visitor and its results are statistically stated | OPEN |
| **P5-274** | Conversion tracking and goals | P5-259 | Goal definition and conversion measurement across the visitor journey | A conversion funnel from landing to goal is measurable end to end | OPEN |
| **P5-275** | Audience and segment analysis | P5-172 | Segment definition and behaviour analysis respecting privacy thresholds | A segment below the aggregation threshold is suppressed, preventing re-identification | OPEN |
| **P5-276** | Reporting and dashboards for site owners | P5-259 | Site performance, traffic, conversion and content dashboards | Every figure is defined, sourced and drillable to its underlying measurement | OPEN |
| **P5-277** | Data export and portability of analytics | P5-276 | Exporting analytics data in open formats | Exported analytics reconcile to the dashboard exactly | OPEN |
| **P5-278** | Analytics accessibility | P5-150 | WCAG 2.2 AA across analytics surfaces including every chart | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P5-279** | Performance regression gates | P5-265 | CI gates preventing a publish that regresses Core Web Vitals beyond threshold | A deliberately regressed page fails the gate; the gate has been proven able to fail | OPEN |
| **P5-280** | Stage K proof | P5-266 | A suite asserting SEO completeness, consent honouring, zero pre-consent third-party requests and Vitals compliance across the site estate | All four hold, and a deliberately added pre-consent tracker is caught immediately | OPEN |

---

## 16. Stage L · Accessibility and internationalisation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-281** | Accessibility model for generated output | P5-154 | The accessibility contract every published page satisfies, derived from components and templates | A published page failing the contract cannot be published, enforced at publish | OPEN |
| **P5-282** | Semantic document structure | P5-139 | Landmarks, heading hierarchy and document outline generated correctly | Every published page has a valid landmark and heading structure, verified by crawl | OPEN |
| **P5-283** | Keyboard navigation on published sites | P5-141 | Complete keyboard operability including skip links and focus management | Every published page is fully navigable by keyboard, verified across the site estate | OPEN |
| **P5-284** | Automated accessibility gates | P5-281 | The UX-6 mechanism for accessibility: edit-time checks plus a publish gate | An inaccessible page is caught while being built and refused at publish, and the gate has been proven to fail | OPEN |
| **P5-285** | Alternative text governance | P5-140 | Required alternative text for meaningful images, with decorative marking | An image without alternative text or a decorative marking blocks publish | OPEN |
| **P5-286** | Colour contrast enforcement | P5-086 | Contrast validated at token, component and page level | A published page containing failing contrast is impossible, enforced at publish | OPEN |
| **P5-287** | Motion, animation and vestibular safety | P5-088 | Reduced-motion compliance and limits on auto-playing motion | Every animation respects reduced-motion, and auto-play beyond limits is refused | OPEN |
| **P5-288** | Screen reader verification | P5-283 | Manual screen-reader verification of every template and site kind | Every template is verified with a screen reader and the result recorded per template | OPEN |
| **P5-289** | Cognitive accessibility | P5-282 | Readability measurement, consistent navigation and plain-language guidance | Readability is measured and reported to the builder at edit time | OPEN |
| **P5-290** | Accessibility statement generation | P5-288 | Per-site accessibility statements generated from real audit results | A statement is generated from audit data and cannot claim untested conformance | OPEN |
| **P5-291** | Internationalisation model | P5-057 | Locale model covering language, region, script, formatting and direction | A site serves any configured locale with correct formatting throughout | OPEN |
| **P5-292** | Right-to-left support | P5-291 | Complete RTL layout, mirroring and typography across templates and components | Every template and component renders correctly in RTL, verified per template | OPEN |
| **P5-293** | Locale-specific formatting | P5-291 | Dates, numbers, currencies, names and addresses formatted per locale | Every formatted value matches locale expectations across the fixture set | OPEN |
| **P5-294** | Locale routing and detection | P5-196 | Locale selection by domain, path, preference and detection, with an explicit switcher | A visitor reaches their locale without a redirect chain, and can always override | OPEN |
| **P5-295** | Translation completeness gates | P5-058 | Publish gates on translation completeness per locale and per policy | Publishing a locale below its completeness threshold is refused where policy requires | OPEN |
| **P5-296** | Multilingual SEO | P5-261 | Correct language declaration, `hreflang` and per-locale metadata | Language declaration and `hreflang` are correct and reciprocal across every locale | OPEN |
| **P5-297** | Font and script coverage | P5-085 | Font subsetting and fallback covering every supported script | Every supported script renders without fallback boxes, verified per script | OPEN |
| **P5-298** | Stage L conformance proof | P5-284 | A full audit across every template, component and site kind in every locale and both directions | The estate passes automated and manual review, and a deliberately inaccessible template is refused | OPEN |

---

## 17. Stage M · Site kinds (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-299** | Marketing site kind | P5-023 | Templates, components and capabilities for marketing sites, with conversion tooling | A marketing site is built and published from template within the UX-7 budget | OPEN |
| **P5-300** | Landing page kind | P5-273 | Fast, focused landing pages with experimentation and conversion tracking | A landing page meets Core Web Vitals and supports an experiment out of the box | OPEN |
| **P5-301** | Documentation site kind | P5-047 | Structured documentation with versioning, navigation, search and code presentation | Documentation search returns useful results across versions, measured against a query corpus | OPEN |
| **P5-302** | Documentation versioning | P5-301 | Multiple published documentation versions with canonical and archive handling | An older documentation version remains reachable and is correctly marked non-canonical | OPEN |
| **P5-303** | Customer portal kind | P5-151 | Authenticated portals surfacing a customer's own ERP data through the projection | A portal user sees **zero** rows belonging to another customer, proven by test | OPEN |
| **P5-304** | Partner portal kind | P5-303 | Partner-facing portals with role-scoped data and collaboration | A partner sees exactly their scoped data and no wider, proven by test | OPEN |
| **P5-305** | Portal data projection governance | P5-072 | The governed mechanism by which authenticated portals read tenant data | A portal reads only through the governed path; a direct ERP query fails an architecture gate | OPEN |
| **P5-306** | Intranet kind | P5-303 | Internal sites with employee authentication, directory and internal content | An intranet is unreachable externally, verified by unauthenticated request | OPEN |
| **P5-307** | Community site kind | P5-254 | Community sites with profiles, discussion, moderation and reputation | Community content is moderated per policy before publication where required | OPEN |
| **P5-308** | Event and campaign sites | P5-300 | Time-bound sites with registration, scheduling and automatic archival | An expired campaign site archives automatically per its declared policy | OPEN |
| **P5-309** | Blog and editorial kind | P5-051 | Editorial publishing with authors, categories, series and feeds | An editorial site's feeds validate and its archive structure is complete | OPEN |
| **P5-310** | Knowledge base kind | P5-301 | Help content with search, feedback, categorisation and effectiveness measurement | Article helpfulness is measured, and unhelpful content is identifiable from data | OPEN |
| **P5-311** | Multi-kind composition | P5-023 | Combining kinds within one site where capability profiles permit | A composed site's capabilities are exactly the union of its kinds, proven by test | OPEN |
| **P5-312** | Site kind extension | P5-023 | Defining new site kinds with capability profiles and templates | A new kind is definable without platform code changes, proven by adding one | OPEN |
| **P5-313** | Kind-specific accessibility and performance | P5-284 | Each kind's templates proven against accessibility and performance gates | Every kind's starter templates pass both gates, verified per kind | OPEN |
| **P5-314** | Stage M proof | P5-311 | A suite building, publishing and verifying one site of every kind | Every kind produces a conformant, isolated, performant site, and a capability leak between kinds is caught | OPEN |

---

## 18. Stage N · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P5-315** | Coverage that can fail | P5-020 | Coverage across this programme with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P5-316** | Unit and component testing | P5-315 | Unit coverage of the renderer, content engine, build pipeline and publish orchestration | Each engine meets threshold with tests that fail when the engine is deliberately broken | OPEN |
| **P5-317** | Integration testing against real infrastructure | P5-020 | Integration suites against real Postgres, real object storage and a real edge | The suite runs against real infrastructure in CI; a mock-only pass is caught | OPEN |
| **P5-318** | Visual regression testing | P5-110 | Golden-image comparison across templates, components, breakpoints, locales and colour schemes | A visual regression fails CI. The suite is proven able to fail on a seeded pixel change | OPEN |
| **P5-319** | End-to-end journeys | P5-163 | Automated journeys: create site, compose page, publish, verify live, roll back | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P5-320** | Two-site and two-tenant isolation testing | P5-006 | An isolation test for every table, endpoint, asset path and published surface | A surface without an isolation test fails a coverage gate. Every test proves **zero** rows | OPEN |
| **P5-321** | Build determinism testing | P5-161 | Repeated builds of identical input compared byte for byte | Determinism holds across repeated builds, and a non-deterministic input is caught | OPEN |
| **P5-322** | Load and traffic-spike testing | P5-179 | Load profiles for published sites including launch spikes and cache-miss storms | Targets met at peak profile with origin protected, measured | OPEN |
| **P5-323** | Build and publish performance testing | P5-180 | Build and publish times measured at large site scale with regression detection | A regression beyond threshold fails CI on the reference site | OPEN |
| **P5-324** | Accessibility audit across the estate | P5-298 | Full WCAG 2.2 AA audit of the builder and of every generated surface | Both the tool and its output pass automated and manual review | OPEN |
| **P5-325** | Security testing and penetration exercise | P5-176 | Scanning plus penetration testing focused on injection, CSP bypass, cross-site access and asset leakage | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P5-326** | The fidelity proof | P5-110 | The UX-1 invariant made mechanical: canvas, preview and published output compared across the full reference estate | All three are identical for every page, breakpoint, locale and scheme — and a divergent render path is caught | OPEN |
| **P5-327** | Disaster recovery and site restoration | P5-035 | Rehearsed recovery of sites, content, assets and domains to a point in time | A recovery rehearsal restores a site estate exactly, verified by golden render | OPEN |
| **P5-328** | The projection-boundary proof | P5-005 | The § 0 rule made adversarial: attempts to reach the ERP from published site code, from custom code, and from a compromised component | Every attempt fails. Published sites render fully with the ERP stopped. Removing the boundary makes each attempt succeed | OPEN |
| **P5-329** | Programme 5 launch readiness | P5-328 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 19 is ticked with evidence. An unticked box blocks completion | OPEN |
| **P5-330** | The unaided-builder proof | P5-329 | The UX-7 metric enforced: a non-developer builds and publishes a real, accessible, performant site unaided, measured | A first-time builder publishes a conformant site within the stated budget, recorded. A release regressing the metric fails the gate | OPEN |

---

## 19. Programme exit criteria

- [ ] **A published site never reaches the ERP; it renders fully with the ERP stopped** (P5-005, P5-328)
- [ ] Canvas, preview and published output are identical across every page, breakpoint, locale and colour scheme (P5-326)
- [ ] One renderer serves both canvas and production; a second fails an architecture gate (P5-078)
- [ ] A non-developer publishes a real, conformant site unaided within budget (P5-330)
- [ ] An inaccessible page is caught at edit time and refused at publish (P5-284)
- [ ] Every template and component is individually proven WCAG 2.2 AA before it may be offered (P5-124, P5-154)
- [ ] A publish is atomic and reversible in one action to the exact prior state (P5-165, P5-166)
- [ ] Two builds of identical input are byte-identical (P5-161, P5-321)
- [ ] No third-party script or non-essential cookie loads before consent (P5-266, P5-280)
- [ ] Every published site carries a strict CSP with no `unsafe-inline` script (P5-176)
- [ ] A staging site is never publicly reachable and never indexable (P5-203, P5-271)
- [ ] An unverified domain never serves, and certificates renew before expiry unaided (P5-190, P5-192)
- [ ] Storefront orders reach the ERP only through the governed inbound path (P5-219, P5-236)
- [ ] Displayed price equals the price charged at checkout, in every currency (P5-214)
- [ ] Content is structured and queryable; a blob-only content type cannot be created (P5-047)
- [ ] Every surface has two-site and two-tenant isolation tests proving **zero** rows (P5-320)
- [ ] Constrained templates make an off-brand or unresponsive page impossible, proven adversarially (P5-116, P5-136)
- [ ] Every RTL locale renders correctly across every template and component (P5-292)
- [ ] The builder itself — not only its output — is `axe` clean and keyboard-complete (P5-018, P5-097)
- [ ] Coverage thresholds have been proven able to fail (P5-315)
- [ ] The site component library is versioned separately; a pinned site's output does not shift (P5-013, P5-158)
- [ ] Zero hardcoded colours or spacing anywhere in the builder or the shipped templates (P5-084, P5-087)

---

## 20. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 5 established (P5-001–P5-330), the Tenant Website Builder Portal.** Registered per README § 0 rule 1. This is the split the brief called for, and it is made now because Track F is 0/26 — the largest wholly untouched surface in the family — so the architectural decision costs least at this moment. `P5-002` and `P5-003` perform the extraction from `unierp-web/app/_sites`. The rule that makes the split worth making is stated in § 0 and proven in `P5-328`: a published site never queries the ERP directly, only a published content projection, so a public website can never hold a live path into a tenant's ledger. The site-facing component library is deliberately separate from and independently versioned against `unierp-design-system` (`P5-013`), because published sites must pin a version and not shift when the design system moves. | Claude Code |
