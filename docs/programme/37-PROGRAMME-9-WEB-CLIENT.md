# PROGRAMME 9 · WEB CLIENT PLATFORM — P9-001–P9-306

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 9` resolves waves from this
> document and can only ever hand out a `P9-` phase.

---

## 0. The independence rule, and the boundary with Programme 4

**No phase here may name a phase from another programme in its `Depends` cell.** `P9-004` is the
runtime precondition gate.

This programme and Programme 4 both touch `unierp-web`, so the boundary between them is stated here
and enforced mechanically by `P9-002`:

> **Programme 4 owns what the screens *mean*. Programme 9 owns the platform they run on.**
>
> A business rule, a posting, a module screen's content — Programme 4. Routing, data fetching,
> caching, state, rendering, offline, accessibility infrastructure, performance, client security,
> diagnostics — Programme 9.

The test that resolves any ambiguity: **if the concern would exist identically in an application with
no ERP in it, it belongs here.** `P9-002` encodes that as a directory-and-import ownership map, and a
commit crossing the boundary in the wrong direction fails CI. Without it these two programmes would
contend for the same files, which is precisely what the programme separation exists to prevent.

---

## 1. What this programme owns

The **web client platform**: the runtime, shell and infrastructure on which 903 route pages and every
future one are built. Not the pages themselves.

**The invariant this programme establishes:**

> **Every screen in the product is fast, accessible, resilient and correct by construction — because
> the platform makes the correct thing the default and the incorrect thing fail a gate.**

The alternative — 903 pages each independently getting performance, accessibility, error handling and
offline behaviour right — has never worked anywhere and will not work here. `P9-304` is the proof:
the guarantees hold across the whole estate, sampled and gated, not page by page by hand.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Files | 3,986 | `find unierp-web -type f -not -path "*/node_modules/*"` |
| Route pages | **903** | `find unierp-web -name page.tsx -not -path "*/node_modules/*"` |
| Route groups | `(auth)`, `(dashboard)`, `(storefront)`, `_sites`, `[slug]` | `ls unierp-web/app` |
| Design system | 112 components | `find unierp-design-system/src -name '*.tsx'` |
| Programme 1 Track I | **0/18 DONE**, 15 OPEN, 3 BLOCKED | `node scripts/phase-brief.mjs --status` |

903 pages on a platform that has never been systematically measured is this programme's whole
problem statement. Track I — *"Mobile, desktop, offline, parity"* — is **0/18**, so the cross-client
concerns it owns are entirely unstarted, and the web client has grown without the constraints that
track would have imposed. `P9-003` measures the estate before any phase claims to improve it.

**Reference set.** Linear and Superhuman (the interaction-latency bar for keyboard-driven business
software), Figma (large-application architecture in the browser), Gmail and Notion (offline and
optimistic sync), Stripe Dashboard (data-dense screens done well), GOV.UK Service Manual and
Salesforce Lightning (accessibility infrastructure at scale), Remix and Next.js (data loading and
progressive enhancement), and Sentry for client diagnostics.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Interaction latency is the product.** Under 100 ms to acknowledge, under 1 s to complete, or show honest progress. | Linear; Superhuman | `P9-140` |
| **UX-2** | **Correct by construction, not by review.** Accessibility, error states and loading states come from the platform, not from each page's diligence. | Salesforce Lightning | `P9-199`, `P9-118` |
| **UX-3** | **Never lose the user's work.** Ever. Across crash, network loss, session expiry and tab close. | Notion; Gmail | `P9-125` |
| **UX-4** | **The keyboard is a first-class input.** | Linear | `P9-060` |
| **UX-5** | **Degrade honestly.** Offline, slow and partial states are designed, not accidental. | — | `P9-178` |
| **UX-6** | **The back button always works, and every state is a URL.** | Web platform | `P9-057` |
| **UX-7** | **A failure tells the user what happened and what to do.** Never a blank screen or a spinner forever. | — | `P9-118` |

---

## 3. Design-system rule

`unierp-design-system` (112 components) is the only source of UI primitives, and this programme is
its largest consumer. Where a pattern recurs across pages, it belongs in the design system with a
story — `P9-011` establishes the gate. The token gate applies unchanged: a hardcoded hex or `px`
fails CI.

---

## 4. Waves

### Wave 0 · "Measure the estate"
**Phases:** P9-001–P9-022 · Independence, the P4 boundary, and measuring 903 pages.

### Wave 1 · "The runtime"
**Phases:** P9-023–P9-110 · Shell, routing, and the data layer.

### Wave 2 · "State, rendering and speed"
**Phases:** P9-111–P9-170 · State, forms runtime, rendering and performance.

### Wave 3 · "Resilience"
**Phases:** P9-171–P9-196 · Offline, sync and progressive web application capability.

### Wave 4 · "Reach"
**Phases:** P9-197–P9-242 · Accessibility infrastructure and internationalisation.

### Wave 5 · "Security, diagnostics and production"
**Phases:** P9-243–P9-306 · Client security, observability, the test estate, and the proof.

---

## 5. Stage A · Foundation, boundary and estate measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P9 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P9-002** | The platform/application ownership map | P9-001 | The § 0 boundary encoded: which directories, modules and import paths belong to the client platform and which to the business application | A commit crossing the boundary in the wrong direction fails CI. The gate is proven to fail on a seeded crossing | OPEN |
| **P9-003** | The 903-page estate census | P9-002 | Every route page measured: bundle contribution, data pattern, state usage, accessibility violations, error and loading states, render strategy | The census is reproducible by command and published as data. Every page has a measured profile | OPEN |
| **P9-004** | Runtime precondition gate | P9-001 | Startup and CI assertion of each external capability with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P9-005** | Page classification | P9-003 | Every route classified by kind — list, detail, form, dashboard, wizard, report — with a declared contract per kind | An unclassified route fails the gate. Each kind's contract is testable | OPEN |
| **P9-006** | Platform contract per page kind | P9-005 | What the platform guarantees and what a page must provide, per kind | A page not satisfying its kind's contract fails a gate, proven on a seeded example | OPEN |
| **P9-007** | Build and bundling architecture | P9-001 | Build configuration, code splitting strategy and dependency policy | A build is reproducible and its output deterministic, verified by hash | OPEN |
| **P9-008** | Dependency governance | P9-007 | Allowlisted dependencies with size, licence and vulnerability policy | An unvetted or oversized dependency fails the build with its cost stated | OPEN |
| **P9-009** | Type safety across the client | P9-007 | Strict typing with no suppression, and generated types from API contracts | A `@ts-nocheck` or unchecked suppression fails CI. Types are generated from contracts, not hand-written | OPEN |
| **P9-010** | Module and import discipline | P9-002 | Import boundaries between platform, design system, features and pages | A forbidden import fails `check-module-boundaries.mjs`, proven on a seeded example | OPEN |
| **P9-011** | Component location gate | P9-003 | The rule that a reusable component lives in the design system, enforced | A component reused across pages but defined locally fails the location gate | OPEN |
| **P9-012** | Design token enforcement | P9-011 | The token gate applied across the whole client | A hardcoded hex or `px` fails CI, proven on a seeded example | OPEN |
| **P9-013** | Application shell foundation | P9-005 | The shell: layout, navigation, header, context, notifications, loading and error boundaries | Every route renders inside the shell; a route bypassing it fails the contract test | OPEN |
| **P9-014** | Environment and configuration | P9-007 | Validated client configuration with no secret in the bundle | A bundle scan finds zero secrets. A missing required variable fails the build | OPEN |
| **P9-015** | Client error taxonomy | P9-006 | Typed client errors distinguishing network, authorization, validation, conflict and platform fault | Every error carries a registry code and maps to a defined presentation | OPEN |
| **P9-016** | Performance measurement infrastructure | P9-003 | Continuous measurement of bundle size, interaction latency and Vitals per route | Every route's performance profile is measured and tracked over time | OPEN |
| **P9-017** | Performance budgets | P9-016 | Per-route-kind budgets wired into CI on a fixed profile | A regression beyond budget fails CI. The budget file cannot be raised without an amendment-log entry | OPEN |
| **P9-018** | Accessibility measurement infrastructure | P9-003 | Automated accessibility scanning across every route with per-route reporting | Every route's accessibility state is measured and tracked | OPEN |
| **P9-019** | Reference datasets and fixtures | P9-003 | Realistic data fixtures at production scale for every page kind | Every test and benchmark runs against the shared fixtures | OPEN |
| **P9-020** | Test harness for the client platform | P9-019 | Rendering harness, interaction driver, network control, clock control and storage control | A platform test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |
| **P9-021** | Browser support matrix | P9-007 | The declared, tested browser and version matrix with a degradation policy | Every supported browser is tested in CI; an unsupported one degrades explicitly rather than breaking | OPEN |
| **P9-022** | Estate remediation backlog | P9-003 | The census turned into a prioritised, tracked backlog routed to platform phases | Every measured defect class is routed to a platform phase, not to 903 individual fixes | OPEN |

---

## 6. Stage B · Shell and application runtime (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-023** | Application bootstrap | P9-013 | Startup sequence: configuration, session, capability, preferences, first render | Time to first meaningful render meets budget on the reference profile, measured | OPEN |
| **P9-024** | Session and authentication runtime | P9-023 | Client-side session handling, refresh, expiry and re-authentication without work loss | A session expiring mid-edit re-authenticates and preserves the user's work, proven by test | OPEN |
| **P9-025** | Authorization in the client | P9-024 | Permission-aware rendering where the server is the authority and the client never the gate | A hidden action is also refused server-side; client-only gating fails an architecture test | OPEN |
| **P9-026** | Tenant and workspace context | P9-024 | Context propagation across every request, view and cache key | A cache entry from one tenant is unreachable from another, proven by test | OPEN |
| **P9-027** | Context switching | P9-026 | Switching tenant, entity or workspace without stale data or leaked state | A switch clears every context-bound cache; a stale cross-context read is proven impossible | OPEN |
| **P9-028** | Navigation shell | P9-013 | Module navigation, search, favourites and recents scaling to 903 routes | Any route is reachable within the stated interaction budget, measured | OPEN |
| **P9-029** | Global search | P9-028 | Cross-module search from the shell with keyboard entry and permission filtering | Search returns only permitted results and is reachable by keyboard from any route | OPEN |
| **P9-030** | Command palette | P9-029 | A single command registry driving palette, shortcuts and the accessibility tree | Every application action is reachable by keyboard alone; a shortcut outside the registry is unbound | OPEN |
| **P9-031** | Notification runtime | P9-013 | In-application notification delivery, presentation and preference respect | A notification reaches only principals permitted to see its subject, proven by test | OPEN |
| **P9-032** | Real-time connection management | P9-031 | Connection lifecycle, reconnection, backoff and subscription management | A dropped connection reconnects and resubscribes without duplicate or lost events, proven by injection | OPEN |
| **P9-033** | Live update propagation | P9-032 | Server-pushed changes reflected in open views correctly | A record edited elsewhere updates open views within the stated latency, respecting permissions | OPEN |
| **P9-034** | Multi-tab coordination | P9-027 | Coordinating session, cache and state across browser tabs | Signing out in one tab signs out every tab within the stated window, proven by test | OPEN |
| **P9-035** | Application-level error boundaries | P9-015 | Boundaries at shell, route and component level with recovery | A component crash degrades that region only, never blanking the application, proven by injection | OPEN |
| **P9-036** | Crash recovery | P9-035 | Recovering application state after a crash or reload | A crash mid-task recovers the user's context and unsaved work, proven by test | OPEN |
| **P9-037** | Version skew handling | P9-023 | Detecting and handling a client running against a newer or older server | A version-skewed client prompts to reload rather than failing obscurely, proven by test | OPEN |
| **P9-038** | Update and reload management | P9-037 | Delivering client updates without interrupting work in progress | An update never discards unsaved work; the user chooses when to reload | OPEN |
| **P9-039** | Feature flag runtime | P9-023 | Client-side feature evaluation with consistent assignment | Flag evaluation is consistent within a session and across tabs, proven by test | OPEN |
| **P9-040** | Preference and personalisation runtime | P9-023 | User preferences — density, theme, locale, defaults — applied consistently | A preference change applies across every open view without reload, proven by test | OPEN |
| **P9-041** | Theming runtime | P9-012 | The seven themes and orthogonal density applied through tokens | Every theme and density combination renders correctly, verified by visual regression | OPEN |
| **P9-042** | Dark mode and colour scheme | P9-041 | Automatic and manual scheme switching with contrast maintained | Every surface passes contrast in every theme and scheme, verified automatically | OPEN |
| **P9-043** | Layout and responsive runtime | P9-013 | Responsive layout infrastructure from 320 px to ultrawide | No route scrolls horizontally at 320 px, verified across the estate | OPEN |
| **P9-044** | Density and information architecture | P9-041 | Comfortable, compact and dense modes for data-heavy screens | Every density renders correctly and remains accessible, verified per density | OPEN |
| **P9-045** | Modal, overlay and focus management | P9-013 | Overlay stack with correct focus trapping, restoration and escape handling | Focus is trapped, restored and escapable for every overlay, verified with a screen reader | OPEN |
| **P9-046** | Scroll and viewport management | P9-043 | Scroll restoration, virtual scrolling and viewport-aware loading | Navigating back restores scroll position exactly, proven by test | OPEN |
| **P9-047** | Print and export from the client | P9-043 | Print styling and client-side export where appropriate | A data-dense screen prints legibly with chrome suppressed, verified visually | OPEN |
| **P9-048** | Shell performance | P9-017 | The shell within its budget, independent of route content | Shell interaction remains within budget regardless of route complexity, measured | OPEN |
| **P9-049** | Shell accessibility | P9-018 | WCAG 2.2 AA for the shell: landmarks, skip links, focus order, announcements | The shell is `axe` clean and fully navigable by keyboard and screen reader | OPEN |
| **P9-050** | Onboarding and guidance runtime | P9-013 | In-product guidance, tours and contextual help infrastructure | Guidance is dismissible, resumable and never blocks the keyboard path | OPEN |
| **P9-051** | Embedded and iframe contexts | P9-013 | Running the client embedded, with framing protections | An embedded client cannot be clickjacked and states its context, proven by test | OPEN |
| **P9-052** | Stage B runtime proof | P9-035 | A suite injecting session expiry, connection loss, version skew, crash and context switch | Every condition is handled without work loss or blank screen, and removing a boundary is caught | OPEN |

---

## 7. Stage C · Routing, navigation and URL state (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-053** | Route architecture | P9-005 | The routing model across 903 routes with groups, layouts and nesting | Every route resolves deterministically; a route conflict fails the build | OPEN |
| **P9-054** | Route parameters and validation | P9-053 | Typed, validated route parameters with defined invalid-parameter behaviour | An invalid parameter produces a defined, tested response, never an unhandled error | OPEN |
| **P9-055** | Route-level authorization | P9-025 | Permission requirements declared per route and enforced before render | An unauthorized route render is impossible, and the server refuses independently | OPEN |
| **P9-056** | Route data requirements | P9-053 | Declared data dependencies per route enabling prefetch and parallel loading | A route's data loads in parallel where independent, verified by request waterfall inspection | OPEN |
| **P9-057** | URL as application state | P9-054 | The UX-6 mechanism: every meaningful view state expressed in the URL | Every state reachable by click is reachable by URL, verified by an automated crawl | OPEN |
| **P9-058** | History and back-button correctness | P9-057 | Correct history behaviour including modals, filters, tabs and wizards | The back button never lands on an invalid or unexpected state, verified across route kinds | OPEN |
| **P9-059** | Deep linking and sharing | P9-057 | Shareable links that reconstruct the exact view for a permitted recipient | A shared link reconstructs the view for a permitted user and refuses for others | OPEN |
| **P9-060** | Keyboard navigation model | P9-030 | The UX-4 mechanism: complete keyboard navigation across routes, lists and forms | A full task is completed without the mouse across every page kind, recorded as a test | OPEN |
| **P9-061** | Navigation performance | P9-056 | Client-side navigation within interaction budget with prefetching | Route transitions meet budget on the reference profile, measured | OPEN |
| **P9-062** | Prefetching and speculative loading | P9-061 | Prefetching likely destinations without wasting bandwidth or data | Prefetch improves measured navigation latency without exceeding the data budget | OPEN |
| **P9-063** | Route transitions and continuity | P9-061 | Transitions preserving context and avoiding layout shift | Navigation produces no cumulative layout shift beyond budget, measured | OPEN |
| **P9-064** | Breadcrumbs and wayfinding | P9-053 | Generated breadcrumbs and location indication across nested routes | Every route reports its location accurately, generated from the route tree | OPEN |
| **P9-065** | Tabs, sub-navigation and nested views | P9-058 | Nested navigation with URL representation and history correctness | A tab selection is a URL and survives reload and back navigation | OPEN |
| **P9-066** | Unsaved-change guards | P9-058 | Preventing navigation away from unsaved work, with an escape path | Navigating from a dirty form warns and never silently discards, proven per form kind | OPEN |
| **P9-067** | Wizard and multi-step flows | P9-066 | Step routing, progress, back navigation and resumable state | Abandoning a wizard and returning restores the entered state exactly | OPEN |
| **P9-068** | Not-found and error routes | P9-015 | Defined behaviour for missing, forbidden and errored routes | A forbidden route returns a permission-appropriate response, never a 404 masking a 403 | OPEN |
| **P9-069** | Redirect handling | P9-053 | Client and server redirects with loop prevention | A redirect loop is impossible, proven by test | OPEN |
| **P9-070** | External navigation and link safety | P9-053 | Safe handling of external links including referrer and target policy | An external link cannot access the opener, verified by test | OPEN |
| **P9-071** | Route-level code splitting | P9-007 | Splitting so a route loads only what it needs | A route's bundle contains no code from unrelated routes, verified by bundle analysis | OPEN |
| **P9-072** | Navigation state persistence | P9-046 | Preserving list state, filters and scroll across navigation | Returning to a list restores filters and scroll exactly, proven by test | OPEN |
| **P9-073** | Navigation accessibility | P9-049 | Route changes announced, focus moved correctly, landmarks maintained | Every navigation announces correctly and moves focus appropriately, verified with a screen reader | OPEN |
| **P9-074** | Server-side rendering strategy | P9-056 | Per-route-kind rendering strategy with a stated rationale | Each strategy produces identical output for identical input, verified differentially | OPEN |
| **P9-075** | Progressive enhancement | P9-074 | Core navigation and content working without client JavaScript where appropriate | Declared progressively-enhanced routes function with scripting disabled, verified by request | OPEN |
| **P9-076** | Stage C routing proof | P9-057 | An automated crawl asserting URL-state completeness, history correctness and authorization per route | Every state is a URL, the back button always works, and a seeded unauthorized route render is caught | OPEN |

---

## 8. Stage D · The data layer (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-077** | Data-fetching architecture | P9-056 | One data-access layer every page uses, with no ad-hoc request from a component | A direct request outside the data layer fails an architecture gate, proven by test | OPEN |
| **P9-078** | Generated API client | P9-009 | A typed client generated from API contracts so it cannot drift | A contract change producing an incompatible call fails the build, proven on a seeded change | OPEN |
| **P9-079** | Request lifecycle and cancellation | P9-077 | Deduplication, cancellation on unmount and abort on navigation | An abandoned navigation cancels its in-flight requests, verified by network inspection | OPEN |
| **P9-080** | Caching model | P9-077 | A declared cache with keys, scopes, lifetimes and staleness semantics | Every cached entry declares its lifetime; an entry without one cannot exist | OPEN |
| **P9-081** | Cache invalidation | P9-080 | Invalidation on mutation, event and time, with correctness over aggressiveness | A mutation invalidates every dependent query; a stale read after write is proven impossible | OPEN |
| **P9-082** | Tenant-scoped cache isolation | P9-026 | Cache keys scoped so cross-tenant reuse is impossible | A cache entry from one tenant is unreachable from another, proven by test | OPEN |
| **P9-083** | Optimistic updates | P9-081 | Applying expected results immediately with reconciliation and rollback | A failed mutation rolls back the optimistic state exactly, proven by injection | OPEN |
| **P9-084** | Mutation lifecycle | P9-083 | Submit, pending, success, failure and retry with consistent presentation | Every mutation presents all five states; a missing state fails the contract test | OPEN |
| **P9-085** | Idempotency from the client | P9-084 | Idempotency keys generated and reused across retries | A retried mutation applies once, proven under induced network failure | OPEN |
| **P9-086** | Conflict detection and resolution | P9-084 | Version-aware mutations that surface conflicts rather than overwriting | A concurrent edit produces a surfaced conflict, never a silent overwrite, proven by test | OPEN |
| **P9-087** | Pagination and infinite loading | P9-080 | Keyset pagination that never skips or duplicates under concurrent writes | Paging a concurrently mutated list returns each row at most once, proven by test | OPEN |
| **P9-088** | List virtualisation | P9-087 | Rendering large lists within budget without losing accessibility | A 100,000-row list scrolls within budget and remains screen-reader navigable, measured | OPEN |
| **P9-089** | Filtering, sorting and search state | P9-072 | List query state expressed in the URL and preserved across navigation | A filtered list is shareable by URL and restores exactly, proven by test | OPEN |
| **P9-090** | Bulk selection and operations | P9-088 | Selection across pages with correct counts and bulk action dispatch | A select-all across a filtered set acts on exactly that set, verified by comparison | OPEN |
| **P9-091** | Data prefetching | P9-062 | Prefetching predictable data without over-fetching | Prefetch improves measured latency without exceeding the data budget | OPEN |
| **P9-092** | Request batching and coalescing | P9-079 | Combining requests to reduce round trips without delaying interaction | Batching reduces measured request count without regressing interaction latency | OPEN |
| **P9-093** | Partial and streaming responses | P9-074 | Rendering progressively as data arrives | A data-dense screen shows useful content before all data arrives, measured | OPEN |
| **P9-094** | Error handling in the data layer | P9-015 | Typed errors, retry policy, backoff and circuit breaking per request class | A failing endpoint does not cascade into an unusable application, proven by injection | OPEN |
| **P9-095** | Retry and backoff policy | P9-094 | Declared retry behaviour distinguishing safe and unsafe operations | A non-idempotent operation is never automatically retried, enforced by type | OPEN |
| **P9-096** | Network condition adaptation | P9-093 | Adapting behaviour to slow, flaky and metered connections | On a slow connection the client degrades per policy rather than appearing broken, verified under throttling | OPEN |
| **P9-097** | Request prioritisation | P9-092 | Prioritising requests by user-visible importance | Above-the-fold data loads before background data, verified by waterfall inspection | OPEN |
| **P9-098** | File upload | P9-084 | Chunked, resumable upload with progress, validation and cancellation | A large upload resumes after interruption without restarting, proven by test | OPEN |
| **P9-099** | File download and streaming | P9-098 | Download with progress, resumption and correct content handling | A large download streams without exhausting memory, measured | OPEN |
| **P9-100** | Real-time data integration | P9-033 | Merging pushed updates into cached data consistently | A pushed update and a refetch converge to the same state, verified differentially | OPEN |
| **P9-101** | Subscription lifecycle | P9-032 | Subscribing and unsubscribing with view lifecycle, without leaks | Closing a view releases its subscriptions; a leak is detected by the harness | OPEN |
| **P9-102** | Data layer observability | P9-016 | Request volume, latency, error rate, cache hit rate and waterfall depth | A slow screen is attributable to its requests from telemetry alone | OPEN |
| **P9-103** | Over-fetching detection | P9-102 | Detecting requests fetching more than the view uses | Over-fetching above threshold is reported per route, with the unused fields named | OPEN |
| **P9-104** | Request waterfall detection | P9-056 | Detecting sequential requests that should be parallel | A waterfall beyond declared depth fails a gate, proven on a seeded example | OPEN |
| **P9-105** | Data layer performance | P9-017 | Data layer overhead within budget at production data volume | Layer overhead stays within budget at fixture scale, measured | OPEN |
| **P9-106** | Data layer testing utilities | P9-020 | Network control, response fixtures, latency and failure injection for tests | Any data scenario is testable without a live server, and the utilities have their own tests | OPEN |
| **P9-107** | Permission-aware data handling | P9-025 | Handling partial results and forbidden fields without leaking or breaking | A forbidden field absent from the response renders a defined state, never an error | OPEN |
| **P9-108** | Data freshness indication | P9-080 | Showing users when data is stale, loading or live | Every data-bound surface indicates its freshness where staleness is possible | OPEN |
| **P9-109** | Cross-view data consistency | P9-081 | Two views of the same record agreeing at all times | Two open views of one record never disagree after a mutation, proven by test | OPEN |
| **P9-110** | Stage D data proof | P9-081 | A suite asserting cache correctness, invalidation, isolation, optimistic rollback and conflict surfacing | Every guarantee holds, and a deliberately removed invalidation produces a stale read that is caught | OPEN |

---

## 9. Stage E · State, forms and interaction (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-111** | State architecture | P9-077 | The declared state model: server state, URL state, session state, ephemeral state — and which is which | State stored in the wrong category fails an architecture gate, proven on a seeded example | OPEN |
| **P9-112** | No hidden global mutable state | P9-111 | Elimination of ad-hoc global state in favour of declared channels | Hidden coupling between components fails an architecture test | OPEN |
| **P9-113** | Component state patterns | P9-111 | Standard patterns for local state, derived state and effects | A component with an unnecessary effect or derived-state duplication fails review, detected by lint | OPEN |
| **P9-114** | Form runtime | P9-084 | The shared form engine: fields, validation, submission, errors and dirty tracking | Every form uses the engine; a bespoke form implementation fails an architecture gate | OPEN |
| **P9-115** | Validation model | P9-114 | Validation declared once, enforced server-side, mirrored client-side | A crafted request bypassing the browser is rejected server-side with the identical error | OPEN |
| **P9-116** | Field-level interaction | P9-114 | Focus, blur, change and validation timing tuned for data entry | Validation timing never interrupts typing, verified by interaction test | OPEN |
| **P9-117** | Form submission and result handling | P9-085 | Submission with idempotency, progress, success and precise error placement | A double-submitted form submits once and errors land on the right fields, proven by test | OPEN |
| **P9-118** | The four states, universally | P9-006 | The UX-2 and UX-7 mechanism: every data-bound surface required to declare loading, empty, error and permission states | A surface without all four fails the contract gate; the gate is proven to fail on a seeded surface | OPEN |
| **P9-119** | Loading state presentation | P9-118 | Skeletons, progress and delay thresholds that avoid flicker | A fast response shows no spinner flash; a slow one shows honest progress, verified by timing test | OPEN |
| **P9-120** | Empty state presentation | P9-118 | Empty states that explain and offer a next action | Every empty state offers a next action or explains why none exists, verified across the estate | OPEN |
| **P9-121** | Error state presentation | P9-015 | Errors in the user's language with a concrete recovery action | Every error class has a defined presentation with a recovery path; a blank screen fails the gate | OPEN |
| **P9-122** | Permission state presentation | P9-107 | Forbidden content presented honestly without leaking its existence where that matters | A forbidden record's existence is not leaked where policy requires, proven by test | OPEN |
| **P9-123** | Optimistic interaction feedback | P9-083 | Immediate acknowledgement of every user action | Every action acknowledges within 100 ms, measured across interaction classes | OPEN |
| **P9-124** | Undo and reversal | P9-083 | Client-side undo for reversible actions with a stated window | Every reversible action offers undo within its window, verified per action class | OPEN |
| **P9-125** | Work preservation | P9-114 | The UX-3 mechanism: draft persistence surviving crash, navigation, session expiry and tab close | A killed browser recovers every entered value on return, proven across form kinds | OPEN |
| **P9-126** | Autosave | P9-125 | Automatic persistence with conflict handling and explicit state | An autosaved change is never lost and never silently overwrites a newer one, proven by test | OPEN |
| **P9-127** | Dirty tracking and change indication | P9-066 | Accurate dirty state driving guards and indicators | Dirty state is accurate: no false positives on untouched forms, verified by test | OPEN |
| **P9-128** | Complex input widgets | P9-011 | Date, time, currency, lookup, rich text and file inputs in the design system | Each widget is keyboard-operable, screen-reader-labelled and locale-correct, verified per widget | OPEN |
| **P9-129** | Data grid runtime | P9-088 | The shared editable grid: virtualisation, inline edit, selection, keyboard traversal | A grid supports full keyboard traversal and inline editing at 100,000 rows, measured | OPEN |
| **P9-130** | Keyboard-driven data entry | P9-060 | Tab order, shortcuts, auto-advance and defaulting tuned for high-volume entry | A 20-line document is entered without the mouse within the time budget, measured | OPEN |
| **P9-131** | Copy, paste and clipboard integration | P9-129 | Structured clipboard support in grids and forms | Pasting tabular data into a grid maps correctly and reports what it could not map | OPEN |
| **P9-132** | Drag and drop | P9-045 | Drag interactions with keyboard-accessible equivalents | Every drag operation has a keyboard equivalent, verified per interaction | OPEN |
| **P9-133** | Selection and multi-select model | P9-090 | Consistent selection semantics across lists, grids and trees | Selection semantics are identical across surfaces, verified by test | OPEN |
| **P9-134** | Confirmation and destructive actions | P9-124 | Confirmation proportionate to consequence, with irreversibility stated | An irreversible action states so before proceeding; a reversible one offers undo instead | OPEN |
| **P9-135** | Interaction performance | P9-017 | Input latency, scroll performance and animation smoothness within budget | Input latency stays within budget on the reference profile under realistic data, measured | OPEN |
| **P9-136** | Stage E interaction proof | P9-118 | A suite asserting the four states, work preservation, keyboard completion and optimistic rollback across every page kind | Every guarantee holds, and a surface missing a required state is caught immediately | OPEN |

---

## 10. Stage F · Rendering and performance (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-137** | Rendering architecture | P9-074 | The declared rendering model: what renders on the server, what streams, what hydrates | Every route's rendering strategy is declared and tested; an undeclared route fails the gate | OPEN |
| **P9-138** | Hydration correctness | P9-137 | Hydration without mismatch, flash or lost interaction | A hydration mismatch fails CI, proven on a seeded example | OPEN |
| **P9-139** | Streaming and progressive rendering | P9-093 | Streaming markup so useful content appears early | Time to first useful content meets budget on data-dense routes, measured | OPEN |
| **P9-140** | Interaction latency budget | P9-135 | The UX-1 mechanism: acknowledgement under 100 ms, completion under 1 s, or honest progress | Every interaction class meets its threshold or shows progress, measured and gated | OPEN |
| **P9-141** | Core Web Vitals | P9-016 | Field and lab measurement of Vitals per route kind | Vitals green at the 75th percentile from field data across route kinds | OPEN |
| **P9-142** | Bundle size management | P9-071 | Per-route bundle budgets with attribution to dependencies | A bundle regression fails CI with the responsible dependency named | OPEN |
| **P9-143** | Code splitting strategy | P9-142 | Splitting by route, feature and interaction with correct boundaries | A route loads no code from unrelated routes, verified by bundle analysis | OPEN |
| **P9-144** | Lazy loading and deferred hydration | P9-143 | Deferring non-critical code and hydration without breaking interaction | A deferred component is interactive by the time a user can reach it, measured | OPEN |
| **P9-145** | Tree shaking and dead code elimination | P9-142 | Eliminating unused code including from the design system | Unused design-system components contribute zero bytes, verified by bundle analysis | OPEN |
| **P9-146** | Dependency size governance | P9-008 | Continuous tracking of dependency contribution to bundles | A dependency's size increase is detected and attributed at update time | OPEN |
| **P9-147** | Image optimisation | P9-141 | Responsive images with format negotiation and correct sizing | Every image serves optimised and correctly sized, verified across the estate | OPEN |
| **P9-148** | Font loading | P9-141 | Subsetting, preloading and swap strategy eliminating layout shift | Cumulative layout shift from fonts is within budget, measured | OPEN |
| **P9-149** | CSS architecture and delivery | P9-012 | Token-driven CSS with critical extraction and no unused rules shipped | Unused CSS beyond threshold fails the gate, verified by coverage analysis | OPEN |
| **P9-150** | Render performance profiling | P9-016 | Identifying unnecessary re-renders and expensive components | An unnecessary re-render pattern is detected per route and reported | OPEN |
| **P9-151** | Memoisation and computation caching | P9-150 | Correct memoisation without stale results | A memoised value is never stale, proven by test; unnecessary memoisation is detected | OPEN |
| **P9-152** | Large dataset rendering | P9-129 | Rendering large lists, grids and trees within budget | 100,000 rows render and scroll within budget, measured | OPEN |
| **P9-153** | Chart and visualisation rendering | P9-011 | Performant charts with accessible equivalents | Charts render within budget and have screen-reader-navigable table equivalents | OPEN |
| **P9-154** | Animation and transition performance | P9-063 | Compositor-friendly animation honouring reduced-motion | Every animation runs at target frame rate and is disabled under reduced-motion | OPEN |
| **P9-155** | Memory management | P9-101 | Preventing leaks from subscriptions, listeners, caches and closures | A long session shows no unbounded memory growth, measured over a soak | OPEN |
| **P9-156** | Long task and main-thread management | P9-140 | Breaking up long tasks so input remains responsive | No task blocks the main thread beyond the stated threshold, measured | OPEN |
| **P9-157** | Web worker offloading | P9-156 | Moving expensive computation off the main thread | Heavy computation does not block input, verified by interaction latency under load | OPEN |
| **P9-158** | Third-party script impact | P9-146 | Governing and measuring the cost of any third-party script | A third-party script exceeding its budget fails the gate with its cost stated | OPEN |
| **P9-159** | Caching and asset delivery | P9-007 | Immutable hashed assets with long cache lifetimes | An asset change produces a new URL; a stale cached asset is proven impossible | OPEN |
| **P9-160** | Service worker caching | P9-159 | Application shell and asset caching with correct update semantics | A deployed update reaches users within the stated window without a stale shell | OPEN |
| **P9-161** | Performance on low-end devices | P9-021 | Meeting budgets on the declared low-end device profile | Budgets are met on the low-end profile, measured, not only on developer hardware | OPEN |
| **P9-162** | Performance regression gates | P9-017 | CI gates on bundle, Vitals and interaction latency | A deliberately regressed route fails the gate; the gate has been proven able to fail | OPEN |
| **P9-163** | Performance observability in production | P9-141 | Real-user monitoring attributing slowness to route, device and network | A slow route is attributable to its cause from field data alone | OPEN |
| **P9-164** | Performance budgets per page kind | P9-006 | Differentiated budgets recognising that a dashboard is not a form | Every page kind has a justified budget, and exceeding it fails CI | OPEN |
| **P9-165** | Estate-wide performance remediation | P9-022 | Applying platform-level fixes across the 903-page estate | A platform fix improves the measured estate profile, verified by re-census | OPEN |
| **P9-166** | Perceived performance | P9-119 | Optimistic rendering, skeletons and instant feedback | Perceived latency is measured, not only actual latency, and both meet budget | OPEN |
| **P9-167** | Startup performance | P9-023 | Cold and warm start within budget | Cold start meets budget on the low-end profile, measured | OPEN |
| **P9-168** | Data-volume performance | P9-152 | Performance under production-scale data, not fixture-scale | Budgets hold at production data volume, measured against the reference dataset | OPEN |
| **P9-169** | Performance culture and tooling | P9-163 | Developer tooling making performance visible during development | A developer sees a regression before committing, verified by the local tooling path | OPEN |
| **P9-170** | Stage F performance proof | P9-162 | A full-estate performance run asserting budgets across routes, devices and networks | The estate meets budget, and a seeded regression on any axis is caught immediately | OPEN |

---

## 11. Stage G · Offline and progressive web application (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-171** | Offline capability model | P9-080 | The declared offline capability per page kind: readable, editable, unavailable | Every route declares its offline capability; an undeclared route fails the gate | OPEN |
| **P9-172** | Local persistence layer | P9-171 | Structured local storage with schema, versioning and migration | A local schema change migrates existing data or clears it deliberately, never corrupting | OPEN |
| **P9-173** | Local data encryption | P9-172 | Encrypting sensitive local data with device-bound keys | Locally stored sensitive data is unreadable without the device key, verified by inspection | OPEN |
| **P9-174** | Offline read | P9-172 | Serving previously fetched data when disconnected, with freshness indication | Declared offline-readable routes render when disconnected, verified with the network disabled | OPEN |
| **P9-175** | Offline write and queueing | P9-174 | Queueing mutations while offline with visible pending state | An offline mutation is queued, visible, and applied on reconnect, proven by test | OPEN |
| **P9-176** | Synchronisation engine | P9-175 | Reconciling queued changes with server state on reconnect | A reconnect applies every queued change exactly once, proven under repeated interruption | OPEN |
| **P9-177** | Conflict resolution | P9-086 | Detecting and resolving conflicts between offline and server changes | A conflict surfaces for resolution and never silently discards either side, proven by test | OPEN |
| **P9-178** | Degraded-state design | P9-171 | The UX-5 mechanism: offline, slow and partial states designed per page kind | Every degraded state is designed and tested; an undesigned one fails the contract gate | OPEN |
| **P9-179** | Connectivity detection | P9-096 | Accurate connectivity and quality detection beyond the browser's online flag | A captive portal or dead connection is detected correctly, verified by injection | OPEN |
| **P9-180** | Reconnection behaviour | P9-032 | Reconnecting, resyncing and refreshing without a jarring transition | Reconnection restores live state without losing the user's position or work | OPEN |
| **P9-181** | Background synchronisation | P9-176 | Syncing when the application is not in the foreground, where supported | A background sync completes and its result is visible on return, proven by test | OPEN |
| **P9-182** | Sync conflict UX | P9-177 | Presenting conflicts comprehensibly with a clear resolution path | A conflict is resolvable by a non-technical user, verified by exercise | OPEN |
| **P9-183** | Offline storage quota management | P9-172 | Managing storage limits, eviction policy and quota exhaustion | Quota exhaustion degrades per policy and never loses queued mutations, proven by test | OPEN |
| **P9-184** | Selective and partial sync | P9-174 | Choosing what is available offline rather than syncing everything | Offline data volume stays within the declared budget, measured | OPEN |
| **P9-185** | Service worker lifecycle | P9-160 | Registration, update, activation and unregistration handled correctly | A service worker update activates within the stated window without breaking an open session | OPEN |
| **P9-186** | Installability and application manifest | P9-185 | Installable application with correct manifest, icons and launch behaviour | The application installs and launches correctly on every supported platform, verified per platform | OPEN |
| **P9-187** | Push notification | P9-185 | Permission, subscription, delivery and click handling | A push notification is delivered and opens the correct view, with permission never assumed | OPEN |
| **P9-188** | Offline authentication | P9-024 | Operating with a valid session while disconnected, within a stated window | An offline session operates for its declared window and then degrades as stated, proven by test | OPEN |
| **P9-189** | Offline permission enforcement | P9-025 | Enforcing cached permissions offline without becoming the security authority | An offline action is re-verified server-side on sync and rejected if no longer permitted | OPEN |
| **P9-190** | Sync observability | P9-102 | Visibility of queue depth, sync state, failures and conflicts | A stuck sync is visible and diagnosable by the user without support | OPEN |
| **P9-191** | Sync failure recovery | P9-176 | Recovering from a permanently failing queued mutation | A permanently failing mutation is surfaced for user decision, never silently dropped | OPEN |
| **P9-192** | Data integrity across sync | P9-176 | Guaranteeing no data loss or duplication across sync cycles | No loss and no duplication across 1,000 interrupted sync cycles, proven by test | OPEN |
| **P9-193** | Offline testing infrastructure | P9-020 | Controllable network, storage and lifecycle for offline testing | Any offline scenario is testable deterministically, and the harness has its own tests | OPEN |
| **P9-194** | Cross-device consistency | P9-176 | The same account on several devices converging correctly | Two devices editing offline converge to one consistent state, proven by test | OPEN |
| **P9-195** | Offline performance | P9-174 | Offline operation within the same interaction budgets as online | Offline interaction meets the online budget, measured | OPEN |
| **P9-196** | Stage G offline proof | P9-192 | A suite driving extended offline use, queued mutation, interruption and conflict across page kinds | No data is lost or duplicated, every conflict surfaces, and removing a guarantee is caught | OPEN |

---

## 12. Stage H · Accessibility infrastructure (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-197** | Accessibility architecture | P9-018 | The platform-level mechanisms that make accessible output the default | An accessible outcome requires no per-page effort for the standard patterns, proven per pattern | OPEN |
| **P9-198** | Semantic structure generation | P9-197 | Landmarks, headings and document outline generated by the shell and layouts | Every route has a valid landmark and heading structure, verified by crawl | OPEN |
| **P9-199** | Accessibility contract per component | P9-011 | Every design-system component carrying its accessibility behaviour | The UX-2 mechanism: a component without a complete accessibility contract cannot enter the library | OPEN |
| **P9-200** | Focus management infrastructure | P9-045 | Platform-level focus movement, trapping and restoration | Focus behaves correctly for every navigation, overlay and dynamic update, verified with a screen reader | OPEN |
| **P9-201** | Live region and announcement infrastructure | P9-197 | A single announcement mechanism for dynamic changes | Every asynchronous outcome is announced once, not zero or three times, verified with a screen reader | OPEN |
| **P9-202** | Keyboard interaction patterns | P9-060 | Standard keyboard behaviour per widget pattern, implemented once | Every widget follows its expected keyboard pattern, verified per pattern | OPEN |
| **P9-203** | Skip links and bypass mechanisms | P9-198 | Bypassing repeated content on every route | Every route offers a working bypass, verified by crawl | OPEN |
| **P9-204** | Form accessibility infrastructure | P9-114 | Labels, descriptions, error association and required indication from the form engine | Every generated form is accessible without per-form effort, verified across form kinds | OPEN |
| **P9-205** | Data grid accessibility | P9-129 | Screen-reader-navigable grids with correct roles and announcements | A 100,000-row grid is navigable and comprehensible with a screen reader, recorded as a test | OPEN |
| **P9-206** | Chart and visualisation accessibility | P9-153 | Accessible equivalents for every visualisation | Every chart has a screen-reader-navigable table equivalent, verified per chart type | OPEN |
| **P9-207** | Colour and contrast enforcement | P9-042 | Contrast validated at token level across every theme and scheme | A failing contrast combination cannot ship, enforced by gate | OPEN |
| **P9-208** | Colour independence | P9-207 | Information never conveyed by colour alone | A colour-only information pattern fails a gate, proven on a seeded example | OPEN |
| **P9-209** | Motion and vestibular safety | P9-154 | Reduced-motion compliance and limits on automatic motion | Every animation respects reduced-motion, verified across the estate | OPEN |
| **P9-210** | Zoom and reflow | P9-043 | Usability at 400 % zoom without loss of content or function | Every route is usable at 400 % zoom with no horizontal scroll, verified across the estate | OPEN |
| **P9-211** | Target size and pointer accessibility | P9-199 | Minimum target sizes and pointer alternatives | Every interactive target meets the minimum size, verified automatically | OPEN |
| **P9-212** | Timing and session accessibility | P9-024 | Adjustable and extendable time limits | A session timeout is extendable before it expires, proven by test | OPEN |
| **P9-213** | Error identification and suggestion | P9-121 | Errors identified in text with a concrete suggestion | Every error is identified in text and offers a suggestion, verified across error classes | OPEN |
| **P9-214** | Screen reader verification programme | P9-201 | Manual verification across the declared screen reader and browser matrix | Every page kind is verified with each supported screen reader, recorded per combination | OPEN |
| **P9-215** | Cognitive accessibility | P9-198 | Consistent navigation, plain language and predictable behaviour | Navigation and interaction patterns are consistent across the estate, verified by audit | OPEN |
| **P9-216** | Assistive technology compatibility | P9-214 | Compatibility with magnification, voice control and switch access | The application is operable by voice control and switch access, verified by exercise | OPEN |
| **P9-217** | Automated accessibility gates | P9-018 | CI gates preventing an accessibility regression from merging | A seeded violation fails CI; the gate has been proven able to fail | OPEN |
| **P9-218** | Estate-wide accessibility remediation | P9-022 | Applying platform-level accessibility fixes across all 903 routes | A platform fix reduces the measured estate violation count, verified by re-census | OPEN |
| **P9-219** | Accessibility of custom and complex widgets | P9-202 | The hardest cases — trees, grids, comboboxes, date pickers — done correctly | Each complex widget is verified with a screen reader and by keyboard, recorded per widget | OPEN |
| **P9-220** | Accessibility documentation and guidance | P9-199 | Generated guidance so developers get it right by default | Guidance is generated from component contracts and cannot drift | OPEN |
| **P9-221** | Accessibility conformance reporting | P9-214 | Conformance reports generated from real audit results | The report is generated from audit data and cannot claim untested conformance | OPEN |
| **P9-222** | Stage H accessibility proof | P9-217 | A full estate audit, automated and manual, across every route kind and assistive technology | The estate passes automated and manual review, and a seeded regression is caught immediately | OPEN |

---

## 13. Stage I · Internationalisation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-223** | Internationalisation architecture | P9-040 | Locale resolution, message loading and formatting infrastructure | A locale change applies across every open view without reload, proven by test | OPEN |
| **P9-224** | Message extraction and management | P9-223 | Extracting translatable strings and detecting hardcoded ones | A hardcoded user-facing string fails `check-hardcoded-strings.mjs`, proven on a seeded example | OPEN |
| **P9-225** | Translation loading and splitting | P9-143 | Loading only the active locale's messages, split by route | A locale's messages load only when needed, verified by bundle analysis | OPEN |
| **P9-226** | Pluralisation and grammatical correctness | P9-223 | Correct plural rules, gender and case handling per locale | Plural and gender rules are correct for every supported locale, verified per locale | OPEN |
| **P9-227** | Number and currency formatting | P9-223 | Locale-correct formatting with explicit currency and precision | A formatted amount matches locale expectations and never loses precision, verified per locale | OPEN |
| **P9-228** | Date, time and timezone handling | P9-223 | Correct display and input across timezones and calendars | A datetime displays correctly in the user's timezone and round-trips without drift, proven by test | OPEN |
| **P9-229** | Calendar system support | P9-228 | Non-Gregorian calendars where required | Each supported calendar renders and accepts input correctly, verified per calendar | OPEN |
| **P9-230** | Name, address and phone formatting | P9-223 | Locale-appropriate personal and address data handling | Address input and display match locale conventions, verified per locale | OPEN |
| **P9-231** | Right-to-left layout | P9-043 | Complete RTL layout, mirroring and logical properties | Every route and component renders correctly in RTL, verified across the estate | OPEN |
| **P9-232** | Bidirectional text handling | P9-231 | Correct handling of mixed-direction text | Mixed-direction content renders without visual corruption, verified per fixture | OPEN |
| **P9-233** | Font and script coverage | P9-148 | Fonts covering every supported script with correct fallback | Every supported script renders without fallback boxes, verified per script | OPEN |
| **P9-234** | Text expansion and layout resilience | P9-043 | Layouts tolerating substantial text expansion | Every layout survives 40 % text expansion without breaking, verified by pseudo-locale | OPEN |
| **P9-235** | Pseudo-localisation testing | P9-234 | A pseudo-locale exposing hardcoded strings and layout fragility | The pseudo-locale run exposes every hardcoded string and layout break, run in CI | OPEN |
| **P9-236** | Locale-aware sorting and search | P9-223 | Collation, comparison and search per locale | Sorting matches locale collation rules, verified per locale | OPEN |
| **P9-237** | Input method support | P9-128 | Correct behaviour with composition-based input methods | Composition input works correctly in every text field, verified by test | OPEN |
| **P9-238** | Locale-specific validation | P9-115 | Validation rules varying correctly by locale | Locale-specific formats validate correctly, verified per locale and format | OPEN |
| **P9-239** | Translation completeness gates | P9-224 | Gates on translation completeness per enabled locale | An enabled locale below its completeness threshold fails the gate | OPEN |
| **P9-240** | Fallback behaviour | P9-239 | Visible, policy-driven fallback for missing translations | A missing translation falls back visibly per policy, never rendering an empty string | OPEN |
| **P9-241** | Internationalisation performance | P9-225 | Locale infrastructure within the performance budget | Locale loading and formatting stay within budget, measured | OPEN |
| **P9-242** | Stage I localisation proof | P9-235 | A suite running the estate through every locale, the pseudo-locale and RTL | Every locale renders completely and correctly, and a seeded hardcoded string is caught | OPEN |

---

## 14. Stage J · Client security (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-243** | Client security model | P9-025 | The declared model: what the client protects, what it cannot, and where the server is authority | A security decision made only in the client fails an architecture gate, proven on a seeded example | OPEN |
| **P9-244** | Content security policy | P9-007 | A strict CSP with nonce-based script allowance across the application | No `unsafe-inline` script anywhere. An injected script fails to execute, proven by test | OPEN |
| **P9-245** | Cross-site scripting prevention | P9-244 | Contextual encoding and a prohibition on unsafe HTML injection | An XSS payload suite fails entirely across every rendering path, proven per path | OPEN |
| **P9-246** | Rich text and user content sanitisation | P9-245 | Sanitising user-supplied markup with an allowlist | A crafted markup payload cannot execute or exfiltrate, proven by an injection suite | OPEN |
| **P9-247** | Cross-site request forgery defence | P9-024 | CSRF protection on every state-changing request | A cross-site submission fails, proven by test that fails when the defence is removed | OPEN |
| **P9-248** | Clickjacking and framing protection | P9-051 | Framing policy with an explicit allowlist for legitimate embedding | The application cannot be framed by an unapproved origin, verified by test | OPEN |
| **P9-249** | Token and session storage | P9-024 | Storing credentials in the safest available mechanism, never in accessible storage | No token is readable from client script, verified by inspection | OPEN |
| **P9-250** | Secret exposure prevention | P9-014 | Preventing secrets, keys and internal detail from reaching the bundle | A bundle and source-map scan finds zero secrets, run in CI | OPEN |
| **P9-251** | Source map and information disclosure | P9-250 | Controlling what production builds reveal | Production output reveals no internal path, comment or unreferenced code, verified by inspection | OPEN |
| **P9-252** | Dependency vulnerability management | P9-008 | Continuous scanning and remediation of client dependencies | A known-vulnerable dependency fails the build with its advisory named | OPEN |
| **P9-253** | Supply-chain integrity | P9-252 | Integrity verification for every shipped asset and dependency | A tampered asset fails integrity verification, proven by test | OPEN |
| **P9-254** | Third-party script isolation | P9-158 | Isolating and constraining any third-party script | A third-party script cannot access application data or tokens, proven by test | OPEN |
| **P9-255** | Postmessage and cross-origin communication | P9-051 | Origin-validated cross-frame messaging | A message from an unexpected origin is rejected, proven by test | OPEN |
| **P9-256** | Clipboard and drag-drop security | P9-131 | Safe handling of pasted and dropped content | Pasted markup cannot execute, proven by an injection suite | OPEN |
| **P9-257** | File handling security | P9-098 | Content-type verification and safe rendering of uploaded files | An executable renamed to an image type is rejected before rendering, proven by test | OPEN |
| **P9-258** | URL and redirect safety | P9-069 | Preventing open redirects and unsafe URL handling | An open-redirect attempt is refused, proven by test | OPEN |
| **P9-259** | Permission and capability requests | P9-187 | Requesting browser permissions only in context and never speculatively | No permission is requested before it is needed, verified by exercise | OPEN |
| **P9-260** | Client-side data minimisation | P9-107 | Not fetching or caching more sensitive data than the view requires | Over-fetching of sensitive fields is detected and reported per route | OPEN |
| **P9-261** | Local data protection | P9-173 | Protecting and clearing local data on sign-out and device change | Sign-out clears every local trace of tenant data, verified by inspection | OPEN |
| **P9-262** | Shared and public device handling | P9-261 | Behaviour appropriate to shared devices, including aggressive session policy | On a device marked shared, no data persists after sign-out, verified by inspection | OPEN |
| **P9-263** | Browser extension and injection resilience | P9-244 | Resilience to hostile injection into the page | A hostile injection cannot read tokens or exfiltrate data, proven within stated limits | OPEN |
| **P9-264** | Security headers | P9-244 | The full security header set on every response | Every response carries the full header set, verified by request across the estate | OPEN |
| **P9-265** | Client security testing | P9-243 | Automated security testing of every client attack surface | Each attack class is tested, and each succeeds the moment its control is removed | OPEN |
| **P9-266** | Stage J adversarial proof | P9-265 | An adversarial suite covering XSS, CSRF, clickjacking, token theft, injection and data leakage | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 15. Stage K · Observability and diagnostics (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-267** | Client telemetry architecture | P9-016 | Metrics, errors and traces from the client with consistent labelling and consent | Every client signal carries route, tenant, version and device labels, enforced at emission | OPEN |
| **P9-268** | Error reporting | P9-035 | Capturing, deduplicating and reporting client errors with context | Every client error reaches reporting with enough context to diagnose without reproduction | OPEN |
| **P9-269** | Error grouping and prioritisation | P9-268 | Grouping errors by cause and prioritising by user impact | The error affecting most users is identifiable from reporting alone | OPEN |
| **P9-270** | Source map and stack resolution | P9-251 | Resolving production stacks without exposing source publicly | A production error resolves to original source internally and to nothing publicly | OPEN |
| **P9-271** | Session replay and reproduction | P9-268 | Reconstructing what a user did, with privacy protections | Replay masks all personal and sensitive data, verified by inspection | OPEN |
| **P9-272** | Real user monitoring | P9-163 | Field measurement of performance, errors and interaction success | Field data covers every route kind, device class and network condition | OPEN |
| **P9-273** | Telemetry consent and privacy | P9-267 | Consent-gated telemetry with no personal data in signals | No personal data reaches telemetry, verified by inspection of emitted signals | OPEN |
| **P9-274** | Client-side tracing | P9-267 | Traces linking client interaction to server work | One user action is traceable from click to database and back by one correlation ID | OPEN |
| **P9-275** | Interaction success measurement | P9-272 | Measuring whether users actually complete what they start | Task completion and abandonment are measured per page kind | OPEN |
| **P9-276** | Rage click and frustration detection | P9-275 | Detecting user frustration signals and their causes | A frustration signal is attributable to its route and element | OPEN |
| **P9-277** | Feature usage analytics | P9-273 | Which capabilities are used, by whom and how often | Usage figures derive from real events and respect the privacy boundary | OPEN |
| **P9-278** | Performance diagnostics for support | P9-272 | Diagnosing a specific user's performance problem from telemetry | A user-reported slowness is diagnosable without reproduction, verified by exercise | OPEN |
| **P9-279** | Client health and version reporting | P9-037 | Which client versions are running, on what, and their health | Version distribution across the user base is answerable from telemetry | OPEN |
| **P9-280** | Diagnostic mode | P9-278 | A user-enabled diagnostic mode producing a support-ready report | A diagnostic report contains what support needs and no data the user did not consent to share | OPEN |
| **P9-281** | Console and development diagnostics | P9-169 | Development-time diagnostics that never ship to production | A development diagnostic in a production bundle fails the build | OPEN |
| **P9-282** | Telemetry volume and cost control | P9-267 | Sampling and cardinality control on client telemetry | Telemetry volume stays within budget without losing rare-error visibility | OPEN |
| **P9-283** | Alerting on client health | P9-269 | Alerts on client error rate, performance regression and failed interactions | A client-side regression alerts from field data before support volume rises | OPEN |
| **P9-284** | Release health monitoring | P9-279 | Comparing a new client version's health against its predecessor | A regressing release is detected from field data within the stated window | OPEN |
| **P9-285** | Client rollback capability | P9-284 | Reverting users to a prior client version when a release regresses | A rollback reaches users within the stated window, verified by rehearsal | OPEN |
| **P9-286** | Observability dashboards | P9-272 | Client health, performance and usage dashboards with drill-through | Every figure drills to its underlying events | OPEN |
| **P9-287** | Observability accessibility | P9-206 | WCAG 2.2 AA across diagnostic surfaces including charts | Every diagnostic chart has a screen-reader-navigable equivalent | OPEN |
| **P9-288** | Stage K diagnostics proof | P9-283 | A suite seeding client failures and asserting detection, attribution and alerting | Every seeded failure is detected and attributed, and removing a detector makes it invisible | OPEN |

---

## 16. Stage L · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P9-289** | Coverage that can fail | P9-020 | Coverage across the client platform with `all: true`, real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P9-290** | Unit and component testing | P9-289 | Unit coverage of the data layer, form engine, router, state model and offline sync | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P9-291** | Design-system component testing | P9-199 | Every component tested in every state, theme, density and scheme | A component regression fails CI, and the suite is proven able to fail | OPEN |
| **P9-292** | Integration testing with a real API | P9-078 | Integration suites against a real API rather than mocked responses | The suite runs against a real API in CI; a mock-only pass is caught | OPEN |
| **P9-293** | Contract testing | P9-078 | Consumer-driven contract tests against the API | A breaking API change fails before it reaches the client, proven on a seeded change | OPEN |
| **P9-294** | End-to-end journeys | P9-136 | Automated journeys across every page kind including offline and error paths | Each journey runs in CI against a real deployment and fails when any step regresses | OPEN |
| **P9-295** | Visual regression testing | P9-291 | Golden-image comparison across components, themes, densities, breakpoints and locales | A visual regression fails CI; the suite is proven able to fail on a seeded pixel change | OPEN |
| **P9-296** | Cross-browser testing | P9-021 | Testing across the declared browser and version matrix | Every supported browser passes the suite; an unsupported one degrades explicitly | OPEN |
| **P9-297** | Device and network condition testing | P9-161 | Testing across device classes and network conditions | Budgets hold on the low-end device and slow-network profiles, measured | OPEN |
| **P9-298** | Accessibility testing, automated and manual | P9-222 | Automated scanning across every route plus manual verification per page kind | The estate is `axe` clean and passes manual keyboard and screen-reader review | OPEN |
| **P9-299** | Performance testing | P9-170 | Automated performance testing across routes, devices and networks | Budgets met on every axis; a regression fails CI | OPEN |
| **P9-300** | Offline and sync testing | P9-196 | Deterministic testing of offline, queueing, sync and conflict | No data loss or duplication across interrupted sync cycles, proven repeatedly | OPEN |
| **P9-301** | Security testing | P9-266 | Automated client security testing plus a penetration exercise | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P9-302** | Memory and soak testing | P9-155 | Long-session testing detecting leaks and degradation | An 8-hour session shows no unbounded memory growth or interaction degradation | OPEN |
| **P9-303** | Estate re-census and verification | P9-003 | Re-running the P9-003 census and comparing against the original | Every measured defect class is reduced; a class that is not blocks the programme rather than being footnoted | OPEN |
| **P9-304** | The estate-guarantee proof | P9-303 | The § 1 invariant made mechanical: performance, accessibility, error handling and offline guarantees asserted across the whole estate | Every guarantee holds across the estate by gate rather than by hand, and each fails when its platform mechanism is removed | OPEN |
| **P9-305** | Client release readiness | P9-284 | Release process, health monitoring, rollback and staged rollout for the client | A client release is staged, monitored and rollable back, verified by rehearsal | OPEN |
| **P9-306** | Programme 9 launch readiness | P9-304 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 17 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 17. Programme exit criteria

- [ ] **Performance, accessibility, error handling and offline guarantees hold across the whole estate by gate, not by hand** (P9-304)
- [ ] Every measured defect class from the 903-page census is reduced, none footnoted (P9-003, P9-303)
- [ ] The Programme 4 / Programme 9 boundary is enforced; a crossing commit fails CI (P9-002)
- [ ] Every data-bound surface declares loading, empty, error and permission states (P9-118)
- [ ] Interaction acknowledges under 100 ms and completes under 1 s, or shows honest progress (P9-140)
- [ ] Every state reachable by click is reachable by URL, and the back button always works (P9-057, P9-058)
- [ ] The user's work survives crash, navigation, session expiry and tab close (P9-125)
- [ ] A full task is completable without the mouse on every page kind (P9-060, P9-130)
- [ ] A cache entry from one tenant is unreachable from another (P9-082)
- [ ] A stale read after write is proven impossible (P9-081)
- [ ] A retried mutation applies once under induced network failure (P9-085)
- [ ] A concurrent edit surfaces a conflict, never a silent overwrite (P9-086, P9-177)
- [ ] No data loss or duplication across 1,000 interrupted sync cycles (P9-192)
- [ ] A security decision made only in the client fails an architecture gate (P9-243)
- [ ] No `unsafe-inline` script; XSS, CSRF and clickjacking suites all fail (P9-244, P9-266)
- [ ] No token is readable from client script; a bundle scan finds zero secrets (P9-249, P9-250)
- [ ] Sign-out clears every local trace of tenant data (P9-261)
- [ ] Every route is `axe` clean, usable at 400 % zoom, and verified with each supported screen reader (P9-210, P9-214, P9-298)
- [ ] Every complex widget — tree, grid, combobox, date picker — is verified by keyboard and screen reader (P9-219)
- [ ] Every locale renders completely, including RTL; a hardcoded string fails CI (P9-224, P9-231, P9-242)
- [ ] Budgets are met on the declared low-end device and slow-network profiles (P9-161, P9-297)
- [ ] Coverage thresholds have been proven able to fail (P9-289)
- [ ] Zero hardcoded colours or spacing; a reused local component fails the location gate (P9-011, P9-012)

---

## 18. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 9 established (P9-001–P9-306), the web client platform.** Registered per README § 0 rule 1. This programme and Programme 4 both touch `unierp-web`, so § 0 states the boundary — Programme 4 owns what the screens mean, Programme 9 owns the platform they run on — and `P9-002` encodes it as an enforced ownership map, because two programmes contending for the same files is exactly what the separation exists to prevent. `P9-003` measures all 903 route pages before any phase claims to improve them, and `P9-022` routes the result to platform phases rather than to 903 individual fixes: 903 pages each independently getting performance, accessibility and error handling right has never worked anywhere. Track I is 0/18, so the cross-client concerns it owns are entirely unstarted and the web client has grown without those constraints. | Claude Code |
