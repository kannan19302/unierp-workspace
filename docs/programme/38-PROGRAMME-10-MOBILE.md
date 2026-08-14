# PROGRAMME 10 · MOBILE — ANDROID AND iOS — P10-001–P10-312

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 10` resolves waves from this
> document and can only ever hand out a `P10-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** `P10-004` is the
runtime precondition gate: each external capability is asserted at startup and in CI, and the
dependent surface degrades to an explicit "requires \<capability\>" state.

---

## 1. What this programme owns

`unierp-mobile` — the **Android and iOS applications**. Not a wrapper around the web client, and not
a viewer: a first-class client for the work that actually happens away from a desk — warehouse
scanning, field service, approvals, expense capture, time recording, and the manager who approves a
purchase order from a taxi.

**The invariant this programme establishes:**

> **The application is fully usable with no network, and every action taken offline reaches the
> server exactly once, or is surfaced for the user to resolve — never lost, never duplicated,
> never silently discarded.**

This is the sentence the whole programme is written to make true, because it is the one thing a
mobile ERP client must get right and the one thing that cannot be retrofitted. `P10-310` is its
mechanical proof.

### Verified starting position

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Files | 915 | `find unierp-mobile -type f` |
| Dart files | **811** | `find unierp-mobile -name '*.dart' \| wc -l` |
| Structure | `lib/app`, `lib/core`, `lib/features`, `lib/src`, `lib/widgets`, three entry points (`main`, `main_staging`, `main_prod`) | `ls unierp-mobile/lib` |
| Last commit | `G10: runtime form renderer — multi-step + conditional logic` (2026-08-13) | `git log -1` |
| Programme 1 Track I | **0/18 DONE**, 15 OPEN, 3 BLOCKED | `node scripts/phase-brief.mjs --status` |

Flutter, 811 Dart files, three build flavours already separated — a real application, not a
prototype. Two things are load-bearing about the starting position. First, **Track I is 0/18**: the
track that owns mobile, desktop, offline and parity has not started, so nothing in this repository
has yet been held to a cross-client standard. Second, the workspace carries
`scripts/check-dart-syntax.mjs` — a gate written for this repository specifically, which is a signal
worth measuring rather than ignoring. `P10-002` measures the existing application's real state before
any phase claims to extend it, and `P10-003` establishes what the Dart toolchain actually enforces.

**Reference set.** Salesforce Mobile and SAP Fiori (enterprise mobile patterns and offline
briefcases), Microsoft Outlook and Teams mobile (large enterprise applications done well on small
screens), Notion and Linear mobile (sync architecture and perceived speed), Zebra and Honeywell
scanner platforms (warehouse hardware integration), ServiceMax and Salesforce Field Service (field
work offline), Apple Human Interface Guidelines and Material Design (platform-native expectation),
and Firebase and Realm for the local-first data patterns.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Offline is the default assumption, not the exception.** | ServiceMax; field reality | `P10-081` |
| **UX-2** | **Never lose a user's work — including when the OS kills the process.** | Mobile platform reality | `P10-095` |
| **UX-3** | **Native where it matters.** Platform navigation, gestures, and controls follow the platform, not a shared lowest denominator. | Apple HIG; Material | `P10-052` |
| **UX-4** | **One hand, in motion, in bad light, wearing gloves.** The real usage context. | Zebra; warehouse practice | `P10-069` |
| **UX-5** | **Battery and data are the user's, not ours.** Both are budgeted and measured. | — | `P10-218` |
| **UX-6** | **Sync state is always visible and always honest.** The user knows what has reached the server. | Notion | `P10-100` |
| **UX-7** | **The device is a sensor.** Camera, scanner, location, signature and voice are first-class inputs. | Field service practice | `P10-152` |

---

## 3. Design-system rule

`unierp-design-system` defines the tokens; this programme implements them natively in Flutter rather
than embedding web views. `P10-051` establishes the mobile component library bound to the same
tokens, with the same seven themes and orthogonal density, and `P10-062` is the gate that keeps a
hardcoded colour or dimension out.

---

## 4. Waves

### Wave 0 · "Measure the application"
**Phases:** P10-001–P10-022 · Independence, measuring the 811-file application, and the toolchain gates.

### Wave 1 · "Architecture and appearance"
**Phases:** P10-023–P10-076 · Application architecture, navigation, and the native design system.

### Wave 2 · "Offline first"
**Phases:** P10-077–P10-116 · Local storage, sync, conflict and the offline guarantee. The largest stage.

### Wave 3 · "Identity and the device"
**Phases:** P10-117–P10-202 · Authentication, device security, native integration, notifications and background work.

### Wave 4 · "Speed and reach"
**Phases:** P10-203–P10-252 · Performance, battery, data, accessibility and internationalisation.

### Wave 5 · "Parity, release and production"
**Phases:** P10-253–P10-312 · Feature coverage, store distribution, the test estate, and the offline proof.

---

## 5. Stage A · Foundation and measurement (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme writes to and the contracts it consumes | A P10 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P10-002** | The existing application census | P10-001 | The 811 Dart files measured: architecture, feature coverage, test coverage, offline capability, platform channel use, dead code | The census is reproducible by command and published as data | OPEN |
| **P10-003** | Dart and Flutter toolchain gates | P10-002 | Analysis, lint, format and type gates that actually fail, including what `check-dart-syntax.mjs` covers and what it does not | Each gate is proven to fail on a seeded violation. Coverage of the existing gate is measured, not assumed | OPEN |
| **P10-004** | Runtime precondition gate | P10-001 | Startup and CI assertion of each external capability with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P10-005** | Build flavours and environments | P10-002 | The three entry points formalised with configuration, signing and environment separation | A staging build cannot reach production, proven by request | OPEN |
| **P10-006** | Dependency governance | P10-003 | Allowlisted packages with size, licence, maintenance and vulnerability policy | An unvetted or vulnerable package fails the build with its advisory named | OPEN |
| **P10-007** | Project structure and module boundaries | P10-002 | Enforced boundaries between `core`, `features`, `widgets` and platform code | A forbidden import fails the boundary gate, proven on a seeded example | OPEN |
| **P10-008** | Generated API client for Dart | P10-001 | A typed client generated from API contracts so it cannot drift | A contract change producing an incompatible call fails the build, proven on a seeded change | OPEN |
| **P10-009** | Error taxonomy | P10-008 | Typed errors distinguishing network, authorization, validation, conflict, device and platform fault | Every error carries a registry code and maps to a defined presentation | OPEN |
| **P10-010** | Structured logging and correlation | P10-009 | Correlation from user action through local queue to server and back | One offline action is traceable from tap to server commit by a single correlation ID | OPEN |
| **P10-011** | Configuration and secret handling | P10-005 | Validated configuration with no secret in the binary | A binary scan finds zero secrets, run in CI | OPEN |
| **P10-012** | Crash reporting infrastructure | P10-010 | Crash capture with symbolication, grouping and privacy protection | Every crash reaches reporting symbolicated, with no personal data attached | OPEN |
| **P10-013** | Performance measurement infrastructure | P10-002 | Frame timing, startup, memory and jank measurement per screen | Every screen's performance profile is measured and tracked over time | OPEN |
| **P10-014** | Performance budgets | P10-013 | Budgets for startup, frame time, memory and binary size on declared device profiles | A regression beyond budget fails CI on the reference devices | OPEN |
| **P10-015** | Accessibility measurement infrastructure | P10-002 | Automated accessibility scanning across every screen | Every screen's accessibility state is measured and tracked | OPEN |
| **P10-016** | Device and OS support matrix | P10-005 | The declared, tested device and OS version matrix with a degradation policy | Every supported OS version is tested in CI; an unsupported one degrades explicitly | OPEN |
| **P10-017** | Reference devices and test fixtures | P10-016 | Physical and emulated reference devices including a declared low-end profile | Every benchmark runs on the reference device set, including low-end | OPEN |
| **P10-018** | Test harness for mobile | P10-017 | Widget harness, network control, storage control, clock control and platform-channel doubles | A mobile test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |
| **P10-019** | Continuous integration for mobile | P10-018 | CI building, testing and signing both platforms on every change | Both platforms build and test on every commit; a broken platform fails the build | OPEN |
| **P10-020** | Binary size governance | P10-014 | Tracking and budgeting application size per platform | A size regression fails CI with the responsible dependency or asset named | OPEN |
| **P10-021** | Dead code and unused feature removal | P10-002 | Removing what the census finds unreachable | Unreachable code is removed or justified; the census's dead-code count falls, verified by re-census | OPEN |
| **P10-022** | Estate remediation backlog | P10-002 | The census turned into a prioritised backlog routed to platform phases | Every measured defect class is routed to a phase rather than to individual screens | OPEN |

---

## 6. Stage B · Application architecture and navigation (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-023** | Application architecture | P10-007 | The declared layered architecture: presentation, domain, data, platform | A layer violation fails the boundary gate, proven on a seeded example | OPEN |
| **P10-024** | State management model | P10-023 | One state approach with declared categories and no hidden global mutable state | A second state approach or hidden global state fails an architecture gate | OPEN |
| **P10-025** | Dependency injection and composition | P10-023 | Explicit composition with testable substitution | Every dependency is substitutable in tests without global mutation | OPEN |
| **P10-026** | Application lifecycle handling | P10-024 | Correct behaviour across foreground, background, resume, and OS termination | State survives backgrounding and OS termination, proven by test | OPEN |
| **P10-027** | Process death and state restoration | P10-026 | The UX-2 foundation: restoring the user to exactly where they were | A process killed by the OS restores the exact screen and entered data, proven by test | OPEN |
| **P10-028** | Navigation architecture | P10-023 | Declarative routing with typed arguments and deep-link support | Every route resolves deterministically; a route conflict fails the build | OPEN |
| **P10-029** | Deep linking and universal links | P10-028 | Platform deep links opening the correct screen with authorisation | A deep link to a forbidden resource refuses appropriately rather than leaking its existence | OPEN |
| **P10-030** | Navigation state persistence | P10-027 | Navigation stack restored after process death | The navigation stack restores exactly after termination, proven by test | OPEN |
| **P10-031** | Platform-appropriate navigation patterns | P10-028 | Android and iOS navigation conventions respected, including back behaviour | Android system back and iOS swipe-back behave per platform expectation, verified per platform | OPEN |
| **P10-032** | Tab and shell navigation | P10-031 | Bottom navigation, tabs and nested stacks with correct state preservation | Switching tabs preserves each tab's stack and scroll, proven by test | OPEN |
| **P10-033** | Modal and sheet presentation | P10-031 | Platform-appropriate modals, sheets and dialogs with correct dismissal | Every modal dismisses per platform convention and restores focus, verified per platform | OPEN |
| **P10-034** | Application shell | P10-032 | The frame: navigation, context, search, sync indicator and notifications | Every screen renders in the shell; a screen bypassing it fails the contract test | OPEN |
| **P10-035** | Tenant and workspace context | P10-034 | Context propagation across requests, local storage and cache keys | Local data from one tenant is unreachable from another, proven by test | OPEN |
| **P10-036** | Context switching | P10-035 | Switching tenant or entity without stale data or leaked local state | A switch clears every context-bound local store; a stale cross-context read is impossible | OPEN |
| **P10-037** | Global search | P10-034 | Cross-module search including offline search of local data | Search works offline over locally available data, proven with the network disabled | OPEN |
| **P10-038** | Screen classification and contracts | P10-002 | Every screen classified by kind with a platform contract per kind | An unclassified screen fails the gate; each kind's contract is testable | OPEN |
| **P10-039** | Error boundaries and recovery | P10-009 | Boundaries at shell, screen and widget level with recovery | A widget crash degrades that region only, never the application, proven by injection | OPEN |
| **P10-040** | Loading, empty, error and permission states | P10-038 | Every data-bound screen required to declare all four, plus an offline state | A screen missing a required state fails the contract gate, proven on a seeded screen | OPEN |
| **P10-041** | Feature flag runtime | P10-025 | Runtime feature control with consistent assignment and offline evaluation | Flag evaluation is consistent offline and across restarts, proven by test | OPEN |
| **P10-042** | Preference and personalisation | P10-024 | User preferences applied consistently and synced across devices | A preference set on one device reaches another within the stated window | OPEN |
| **P10-043** | Application update handling | P10-026 | Detecting and prompting for updates, including forced updates for breaking changes | A client incompatible with the server prompts to update rather than failing obscurely | OPEN |
| **P10-044** | Version skew handling | P10-043 | Operating correctly against a server of a different version within the compatibility window | A version-skewed client behaves per the declared policy, proven by test | OPEN |
| **P10-045** | Onboarding and first run | P10-034 | First-run setup: sign-in, permissions, initial sync and guidance | A new user reaches a usable, synced application unaided, measured | OPEN |
| **P10-046** | Permission request choreography | P10-045 | Requesting OS permissions in context with clear rationale and graceful denial | No permission is requested before it is needed; a denial degrades gracefully, verified per permission | OPEN |
| **P10-047** | Multi-account support | P10-035 | Several accounts on one device with complete separation | Data from one account is unreachable from another, proven by test | OPEN |
| **P10-048** | Application architecture documentation | P10-023 | Generated architecture documentation from the real structure | Documentation is generated from the code structure and cannot drift | OPEN |
| **P10-049** | Architecture conformance gates | P10-023 | Gates enforcing the layered architecture and state model | Each architectural rule has a gate proven to fail on a seeded violation | OPEN |
| **P10-050** | Stage B architecture proof | P10-027 | A suite injecting process death, backgrounding, context switch, deep link and crash | Every condition restores correctly with no work lost, and removing restoration is caught | OPEN |

---

## 7. Stage C · The native design system (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-051** | Mobile component library | P10-023 | The native Flutter component library bound to the shared design tokens | Every component consumes tokens; a component defined in a screen fails the location gate | OPEN |
| **P10-052** | Platform-adaptive components | P10-051 | The UX-3 mechanism: components adopting platform conventions where users expect them | Platform-specific behaviour is verified on both platforms per component | OPEN |
| **P10-053** | Token synchronisation | P10-051 | Tokens generated from the shared design system rather than transcribed | A token change propagates without a manual edit, proven by test | OPEN |
| **P10-054** | Theme support | P10-053 | The seven themes rendering correctly on mobile | Every theme renders correctly on both platforms, verified by visual regression | OPEN |
| **P10-055** | Dark mode and system appearance | P10-054 | Automatic and manual appearance switching following system preference | Every surface passes contrast in every theme and appearance, verified automatically | OPEN |
| **P10-056** | Density and text scaling | P10-054 | Orthogonal density plus respect for the OS text-size setting | Every screen remains usable at the largest OS text size, verified across the estate | OPEN |
| **P10-057** | Typography | P10-053 | Type scale rendering correctly across platforms and scripts | Typography renders correctly on both platforms at every text scale | OPEN |
| **P10-058** | Layout and responsive behaviour | P10-051 | Layouts from small phone to large tablet, portrait and landscape | Every screen is usable on the smallest supported device in both orientations, verified | OPEN |
| **P10-059** | Tablet and large-screen layouts | P10-058 | Multi-pane layouts making real use of tablet space | Tablet layouts use the available space rather than stretching phone layouts, verified visually | OPEN |
| **P10-060** | Foldable and multi-window support | P10-059 | Correct behaviour across fold, unfold and split-screen | A fold transition preserves state and re-lays out correctly, verified on device | OPEN |
| **P10-061** | Safe areas, notches and system UI | P10-058 | Correct handling of insets, notches, gesture bars and status bars | No content is obscured by system UI on any reference device, verified per device | OPEN |
| **P10-062** | Hardcoded value gate | P10-053 | The token gate for mobile: no hardcoded colour or dimension | A hardcoded colour or dimension fails CI, proven on a seeded example | OPEN |
| **P10-063** | Form and input components | P10-051 | Mobile-appropriate inputs with correct keyboards, validation and error placement | Every input type presents the correct keyboard and validates identically to the server | OPEN |
| **P10-064** | List and data presentation | P10-051 | Efficient lists with virtualisation, grouping, sticky headers and pull-to-refresh | A 10,000-item list scrolls at target frame rate on the low-end device, measured | OPEN |
| **P10-065** | Data-dense presentation on small screens | P10-064 | Presenting ERP data density without a spreadsheet | A document with 20 lines is readable and editable on a phone, verified by exercise | OPEN |
| **P10-066** | Chart and visualisation components | P10-051 | Mobile charts with accessible equivalents | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P10-067** | Gesture and touch interaction | P10-052 | Platform-appropriate gestures with discoverable alternatives | Every gesture has a non-gesture alternative, verified per gesture | OPEN |
| **P10-068** | Haptics and feedback | P10-067 | Purposeful haptic feedback respecting system settings | Haptics respect the system setting and are never the only feedback channel | OPEN |
| **P10-069** | One-handed and field-condition usability | P10-058 | The UX-4 mechanism: reachable targets, large tap areas, high-contrast field mode | Primary actions are reachable one-handed on the largest supported phone, verified by exercise | OPEN |
| **P10-070** | Glove and wet-hand operation | P10-069 | Larger targets and tolerant touch handling for warehouse and field use | Field-mode targets meet the enlarged minimum size, verified automatically | OPEN |
| **P10-071** | Outdoor and low-light legibility | P10-055 | High-contrast and low-light modes for field conditions | Field mode meets the enhanced contrast threshold, verified automatically | OPEN |
| **P10-072** | Animation and motion | P10-052 | Platform-appropriate motion respecting reduced-motion settings | Every animation respects the OS reduce-motion setting, verified per platform | OPEN |
| **P10-073** | Component states completeness | P10-040 | Every component defining default, pressed, focused, disabled, loading, empty and error | A component missing a required state fails the completeness gate | OPEN |
| **P10-074** | Component documentation and gallery | P10-051 | A runnable component gallery with every state, theme and density | Every component appears in the gallery; one that does not fails the gate | OPEN |
| **P10-075** | Design system parity verification | P10-053 | Verifying mobile components match web behaviour where they should | A behavioural divergence from the shared contract is detected and justified or fixed | OPEN |
| **P10-076** | Stage C design proof | P10-062 | A visual regression suite across every component, theme, density, appearance and device class | The library passes on both platforms, and a seeded hardcoded value is caught immediately | OPEN |

---

## 8. Stage D · Offline-first data and synchronisation (Wave 2)

The largest stage, and the one the programme's invariant rests on. Everything here is built before
any feature depends on it, because an offline guarantee added after the features is not a guarantee.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-077** | Local database architecture | P10-023 | The on-device store with schema, indexes, and a declared relationship to server data | Local queries meet the interaction budget at realistic data volume on the low-end device | OPEN |
| **P10-078** | Local schema versioning and migration | P10-077 | Versioned local schema with tested migrations and a defined failure path | A schema migration preserves local data or clears it deliberately, never corrupting, proven by test | OPEN |
| **P10-079** | Local data encryption | P10-077 | Encryption at rest with device-bound keys and OS keystore integration | Local data is unreadable without the device key, verified by inspecting the file system | OPEN |
| **P10-080** | Data scoping and multi-tenant local isolation | P10-035 | Local data partitioned by account and tenant | Data from one account is unreachable from another on the same device, proven by test | OPEN |
| **P10-081** | The offline capability model | P10-077 | The UX-1 mechanism: every screen and action declaring its offline capability | An undeclared screen fails the gate. The declared capability is what is tested | OPEN |
| **P10-082** | Sync scope and selective replication | P10-081 | Choosing what replicates locally by relevance, recency and role | Local data volume stays within the declared budget on the low-end device, measured | OPEN |
| **P10-083** | Initial sync | P10-082 | First-run replication with progress, resumption and bounded time | Initial sync completes within its budget and resumes after interruption without restarting | OPEN |
| **P10-084** | Incremental sync | P10-083 | Delta synchronisation using watermarks and change tracking | An incremental sync transfers only changes, verified by payload measurement | OPEN |
| **P10-085** | Sync scheduling and triggers | P10-084 | Syncing on connectivity, foreground, schedule and explicit request | Sync triggers behave per policy and never run unbounded in the background | OPEN |
| **P10-086** | Mutation queue | P10-081 | A durable, ordered queue of offline actions surviving process death | The queue survives OS termination with no entry lost, proven by test | OPEN |
| **P10-087** | Queue ordering and dependency | P10-086 | Preserving causal order and dependencies between queued mutations | A create followed by an update on the same record applies in order, proven by test | OPEN |
| **P10-088** | Exactly-once delivery | P10-086 | Idempotency keys and server-side deduplication guaranteeing single application | A queued mutation replayed under repeated interruption applies exactly once, proven by test | OPEN |
| **P10-089** | Local identifier and server identifier reconciliation | P10-087 | Locally created records receiving server identifiers without breaking references | A locally created record's references remain valid after it receives a server identifier | OPEN |
| **P10-090** | Optimistic local application | P10-086 | Applying mutations locally immediately with clear pending state | A local mutation is visible immediately and clearly marked as not yet synced | OPEN |
| **P10-091** | Conflict detection | P10-084 | Detecting divergence between local and server state | A concurrent server change is detected on sync rather than silently overwritten | OPEN |
| **P10-092** | Conflict resolution strategies | P10-091 | Declared per-entity resolution: server wins, client wins, merge, or user decides | Each strategy behaves per its declaration, verified per entity type | OPEN |
| **P10-093** | Conflict resolution UX | P10-092 | Presenting conflicts so a non-technical field user can resolve them | A conflict is resolvable by a warehouse operator, verified by exercise | OPEN |
| **P10-094** | Server rejection handling | P10-088 | Handling a queued mutation the server refuses — validation, permission or business rule | A rejected mutation is surfaced with its reason and never silently dropped, proven per rejection class | OPEN |
| **P10-095** | Work preservation across process death | P10-027 | The UX-2 mechanism: in-progress entry persisted continuously, not only on submit | A form abandoned by OS termination restores every entered value, proven across form kinds | OPEN |
| **P10-096** | Draft management | P10-095 | Explicit drafts the user can see, resume and discard | Every draft is listable, resumable and discardable; an orphaned draft is impossible | OPEN |
| **P10-097** | Attachment and media queueing | P10-086 | Photos, signatures and files captured offline and uploaded reliably | A photo captured offline uploads on reconnect without loss, proven under interruption | OPEN |
| **P10-098** | Large attachment handling | P10-097 | Chunked, resumable upload with bounded memory and data awareness | A large attachment uploads within the memory budget and resumes after interruption | OPEN |
| **P10-099** | Sync failure recovery | P10-094 | Recovering from permanently failing queue entries without blocking the queue | A permanently failing entry is quarantined for user decision and does not block later entries | OPEN |
| **P10-100** | Sync state visibility | P10-090 | The UX-6 mechanism: always-visible, honest sync state per record and overall | The user can always tell what has reached the server and what has not, verified by exercise | OPEN |
| **P10-101** | Pending action review | P10-100 | A surface listing everything waiting to sync, with detail and action | Every queued action is inspectable and individually actionable | OPEN |
| **P10-102** | Data freshness indication | P10-084 | Showing how current local data is, per entity | Every offline-readable surface indicates its data age where staleness matters | OPEN |
| **P10-103** | Stale data policy | P10-102 | Declared behaviour when local data exceeds its freshness window | Data past its freshness window behaves per policy, never presented as current | OPEN |
| **P10-104** | Local storage quota management | P10-082 | Managing device storage limits with eviction that never discards unsynced work | Storage pressure evicts synced data only; unsynced work is never evicted, proven by test | OPEN |
| **P10-105** | Local search and query | P10-037 | Full local query capability including search and filtering | Local search returns correct results offline, proven with the network disabled | OPEN |
| **P10-106** | Reference and master data caching | P10-082 | Keeping the master data offline work requires | An offline document can be created with all its required references, proven by test | OPEN |
| **P10-107** | Offline validation | P10-063 | Running validation locally with the server as the ultimate authority | Local validation matches server validation, verified differentially per rule | OPEN |
| **P10-108** | Offline permission evaluation | P10-080 | Evaluating cached permissions offline without becoming the security authority | An offline action is re-verified server-side and rejected if no longer permitted, proven by test | OPEN |
| **P10-109** | Offline numbering and identifiers | P10-089 | Handling document numbering for offline-created documents | An offline-created document receives a correct, gapless number on sync, proven under concurrency | OPEN |
| **P10-110** | Multi-device convergence | P10-091 | The same account on several devices converging correctly | Two devices working offline converge to one consistent state, proven by test | OPEN |
| **P10-111** | Sync performance | P10-084 | Sync within time and data budgets on the low-end device and slow networks | Sync meets its budget on the low-end profile over a slow connection, measured | OPEN |
| **P10-112** | Sync data usage | P10-084 | Minimising data transfer with compression and delta encoding | Sync data volume stays within the declared budget, measured | OPEN |
| **P10-113** | Sync observability | P10-010 | Telemetry on sync duration, payload, failure, conflict and queue depth | A stuck or slow sync is diagnosable from telemetry alone | OPEN |
| **P10-114** | Sync testing infrastructure | P10-018 | Deterministic control of network, storage, clock and process lifecycle for sync tests | Any sync scenario is testable deterministically, and the harness has its own tests | OPEN |
| **P10-115** | Data integrity verification | P10-110 | Continuous verification that local and server state agree after sync | A divergence after sync is detected and reported, proven by seeded corruption | OPEN |
| **P10-116** | Stage D offline proof | P10-088 | A suite driving extended offline use with queued mutations, process death, interruption and conflict | No action is lost or duplicated across 1,000 interrupted cycles, and removing exactly-once handling is caught | OPEN |

---

## 9. Stage E · Authentication and device security (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-117** | Authentication architecture | P10-008 | The mobile authentication model with token handling and refresh | Tokens are stored in the OS keystore, never in accessible storage, verified by inspection | OPEN |
| **P10-118** | Sign-in experience | P10-117 | The sign-in journey including federation and error handling | The full journey is completable with a screen reader and by keyboard where applicable | OPEN |
| **P10-119** | Federated and enterprise sign-in | P10-118 | SAML and OIDC via the platform's secure browser, never an embedded web view | Credentials are never entered in an embedded web view, verified by inspection | OPEN |
| **P10-120** | Multi-factor authentication | P10-118 | TOTP, push and platform authenticator support | MFA cannot be bypassed by any authentication path, proven per path | OPEN |
| **P10-121** | Biometric authentication | P10-120 | Platform biometrics for unlock and step-up, with a non-biometric fallback | Biometric failure falls back without weakening the factor requirement, proven by test | OPEN |
| **P10-122** | Device registration and trust | P10-117 | Registering devices with the platform, including revocation | A revoked device loses access within the stated window, proven by test | OPEN |
| **P10-123** | Session lifetime and offline sessions | P10-117 | Session policy including how long an offline session remains valid | An offline session operates for its declared window then degrades as stated, proven against a controlled clock | OPEN |
| **P10-124** | Token refresh and rotation | P10-117 | Refresh with rotation-reuse detection and offline tolerance | A stolen refresh token is detected by reuse detection and the family revoked, proven by test | OPEN |
| **P10-125** | Sign-out and data clearing | P10-079 | Sign-out clearing every local trace, with unsynced work handled explicitly | Sign-out with unsynced work warns and never silently discards; after sign-out no tenant data remains, verified | OPEN |
| **P10-126** | Application lock | P10-121 | Locking the application on background, timeout or explicit request | The application locks per policy and content is hidden from the app switcher, verified visually | OPEN |
| **P10-127** | Screenshot and screen-recording protection | P10-126 | Preventing capture of sensitive screens where policy requires | A protected screen cannot be captured, verified per platform | OPEN |
| **P10-128** | Jailbreak and root detection | P10-079 | Detecting compromised devices and applying policy | A compromised device is detected and policy applied, proven against a seeded environment | OPEN |
| **P10-129** | Certificate pinning | P10-008 | Pinning with a rotation strategy that cannot brick the application | A pinned connection rejects an intercepted certificate; pin rotation is proven not to lock users out | OPEN |
| **P10-130** | Network security | P10-129 | Transport security policy with no plaintext exception | No plaintext connection is possible, verified by inspection of network configuration | OPEN |
| **P10-131** | Mobile device management integration | P10-122 | Working correctly under enterprise MDM with managed configuration | Managed configuration is honoured and a remote wipe removes all application data, verified | OPEN |
| **P10-132** | Application configuration by policy | P10-131 | Enterprise policy controlling features, storage and offline behaviour | A policy restriction cannot be overridden by the user, proven by test | OPEN |
| **P10-133** | Data loss prevention | P10-127 | Controlling copy, paste, share and export from the application | A DLP restriction blocks the restricted channel, verified per channel | OPEN |
| **P10-134** | Secure storage of credentials and secrets | P10-079 | Keystore and keychain use for every credential | No credential is recoverable from application storage, verified by inspection | OPEN |
| **P10-135** | Binary hardening | P10-011 | Obfuscation, anti-tamper and integrity verification appropriate to the threat | A tampered binary fails integrity verification, proven by test | OPEN |
| **P10-136** | Reverse-engineering resistance | P10-135 | Making static analysis of the shipped binary meaningfully harder | Sensitive logic and endpoints are not trivially extractable, verified by exercise | OPEN |
| **P10-137** | Deep link and intent security | P10-029 | Validating deep links and platform intents against forgery | A forged deep link cannot trigger a privileged action, proven by test | OPEN |
| **P10-138** | Inter-application communication security | P10-137 | Safe sharing and receiving with other applications | Received content is validated and cannot execute or escalate, proven by an injection suite | OPEN |
| **P10-139** | Web view security | P10-119 | Any embedded web content sandboxed, restricted and never used for credentials | An embedded web view cannot access native capability or tokens, proven by test | OPEN |
| **P10-140** | Clipboard security | P10-133 | Sensitive data excluded from the clipboard or automatically cleared | Copied sensitive data clears within the stated window, verified per platform | OPEN |
| **P10-141** | Backup and cloud sync exclusion | P10-079 | Excluding sensitive local data from OS backup where required | Sensitive data is absent from a device backup, verified by inspecting one | OPEN |
| **P10-142** | Shared and kiosk device mode | P10-125 | A mode for shared devices with aggressive clearing between users | On a shared device, no data persists between users, verified by inspection | OPEN |
| **P10-143** | Location and sensor privacy | P10-046 | Requesting and using sensors with minimal scope and clear purpose | No sensor is accessed outside its declared purpose, verified by audit | OPEN |
| **P10-144** | Privacy manifests and platform disclosure | P10-143 | Accurate platform privacy declarations matching real behaviour | The declared data collection matches actual behaviour, verified by audit | OPEN |
| **P10-145** | Security testing for mobile | P10-135 | Automated mobile security testing across storage, network, binary and platform surfaces | Each attack class is tested and each succeeds the moment its control is removed | OPEN |
| **P10-146** | Stage E adversarial proof | P10-145 | An adversarial suite attempting credential extraction, traffic interception, tampering and data recovery | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 10. Stage F · Native platform integration (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-147** | Platform channel architecture | P10-023 | The typed, tested boundary between Dart and native code | An untyped or untested platform channel fails the gate, proven on a seeded example | OPEN |
| **P10-148** | Native code quality gates | P10-147 | Lint, analysis and test gates for Kotlin and Swift code | Each gate is proven to fail on a seeded violation in both languages | OPEN |
| **P10-149** | Camera integration | P10-046 | Photo capture with quality control, compression and metadata handling | A captured photo is compressed within budget and strips location metadata unless required | OPEN |
| **P10-150** | Document scanning | P10-149 | Edge detection, perspective correction and multi-page document capture | A scanned document is legible and correctly cropped, verified against a fixture set | OPEN |
| **P10-151** | Barcode and QR scanning | P10-149 | Fast, reliable scanning of the declared symbology set | Every declared symbology scans within the stated time on the low-end device, measured | OPEN |
| **P10-152** | Hardware scanner integration | P10-151 | The UX-7 mechanism for warehouses: integration with Zebra and Honeywell scanners | A hardware scan enters data identically to a keyed entry, verified on device | OPEN |
| **P10-153** | Continuous and batch scanning | P10-152 | Scanning many items in sequence without leaving the screen | 100 sequential scans complete without interaction beyond scanning, verified by exercise | OPEN |
| **P10-154** | NFC and RFID | P10-152 | Reading tags where hardware supports it | An NFC read populates the correct record, verified on device | OPEN |
| **P10-155** | Location services | P10-143 | Foreground and background location with accuracy and battery policy | Location accuracy meets its requirement within the battery budget, measured | OPEN |
| **P10-156** | Geofencing | P10-155 | Entry and exit triggers for site-based workflows | A geofence trigger fires reliably and does not drain battery, measured over a day | OPEN |
| **P10-157** | Maps and navigation | P10-155 | Map display, routing and handoff to platform navigation | A map has an accessible textual alternative conveying the same information | OPEN |
| **P10-158** | Signature capture | P10-149 | On-screen signature with pressure where available and legal-grade storage | A captured signature is stored with its context and is tamper-evident | OPEN |
| **P10-159** | Voice input and dictation | P10-046 | Voice as an input method for notes and fields | Voice input works offline where the platform supports it, verified per platform | OPEN |
| **P10-160** | Text recognition and extraction | P10-150 | On-device text extraction from captured images | Extraction runs on device with no image leaving the device, verified by network inspection | OPEN |
| **P10-161** | Biometric sensors beyond authentication | P10-121 | Using platform sensors where a workflow requires them | Every sensor use is declared, permissioned and purpose-limited | OPEN |
| **P10-162** | Bluetooth device integration | P10-152 | Connecting to printers, scales, sensors and payment devices | Each declared peripheral class connects and operates, verified on device | OPEN |
| **P10-163** | Printing | P10-162 | Printing documents and labels to network and Bluetooth printers | A label prints correctly to each declared printer class, verified on device | OPEN |
| **P10-164** | Payment and card reader integration | P10-162 | Accepting payment through certified readers, with no card data in the application | No card data touches this application, verified by inspection and by scan | OPEN |
| **P10-165** | Telephony and messaging integration | P10-046 | Initiating calls and messages with correct context | A call from a record is initiated with correct context and is logged | OPEN |
| **P10-166** | Calendar and contacts integration | P10-046 | Reading and writing platform calendar and contacts under permission | Platform data is accessed only under permission and only within its declared purpose | OPEN |
| **P10-167** | File system and document provider integration | P10-098 | Opening, saving and sharing files through platform providers | A file opens from and saves to the platform provider correctly, verified per platform | OPEN |
| **P10-168** | Share sheet integration | P10-133 | Sharing to and receiving from other applications safely | Received content is validated before use, proven by an injection suite | OPEN |
| **P10-169** | Widgets and home-screen surfaces | P10-042 | Platform widgets showing approvals, tasks and key figures | A widget updates within its declared window without draining battery | OPEN |
| **P10-170** | App shortcuts and quick actions | P10-029 | Platform shortcuts into common tasks | Every shortcut opens its target correctly, verified per platform | OPEN |
| **P10-171** | Siri, Assistant and voice shortcuts | P10-159 | Voice-invoked actions for common workflows | Each declared voice action performs correctly, verified per platform | OPEN |
| **P10-172** | Wearable companion | P10-169 | Watch surfaces for approvals, alerts and time recording | A wearable approval reaches the server reliably, proven by test | OPEN |
| **P10-173** | Platform sharing and continuity | P10-030 | Handoff between devices where the platform supports it | A handoff resumes the exact context on another device, verified per platform | OPEN |
| **P10-174** | Accessibility service integration | P10-229 | Correct behaviour with platform accessibility services | The application is fully operable with each platform's screen reader, verified per platform | OPEN |
| **P10-175** | Platform capability degradation | P10-004 | Graceful behaviour when a device lacks a capability | A device without a capability degrades explicitly rather than crashing, verified per capability | OPEN |
| **P10-176** | Permission state changes | P10-046 | Handling permissions revoked while the application runs | A revoked permission degrades the dependent feature immediately and explains why | OPEN |
| **P10-177** | Platform API version handling | P10-016 | Correct behaviour across the supported OS version range | Every supported OS version behaves correctly, verified per version | OPEN |
| **P10-178** | Native module testing | P10-148 | Testing platform channels and native code on both platforms | Native code is covered by tests that fail when it is deliberately broken | OPEN |
| **P10-179** | Platform integration observability | P10-113 | Telemetry on native integration success, failure and latency | A failing peripheral integration is diagnosable from telemetry alone | OPEN |
| **P10-180** | Stage F integration proof | P10-152 | A device-lab suite exercising every native integration on real hardware | Every integration works on the reference device set, and a regression is caught in CI | OPEN |

---

## 11. Stage G · Notifications and background work (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-181** | Push notification infrastructure | P10-122 | Registration, token management and delivery across both platforms | A push reaches the device within the stated window on both platforms, measured | OPEN |
| **P10-182** | Notification permission and preference | P10-046 | Permission requested in context, with granular per-category preference | No notification is sent for a category the user disabled, proven by test | OPEN |
| **P10-183** | Notification content and privacy | P10-126 | Content appropriate to lock-screen visibility settings | Sensitive content is hidden on the lock screen per policy, verified per platform | OPEN |
| **P10-184** | Notification actions and deep links | P10-029 | Actionable notifications opening the right screen or acting directly | Every notification action performs correctly, verified per action | OPEN |
| **P10-185** | Notification grouping and summarisation | P10-181 | Grouping so a busy day does not produce a hundred separate alerts | Notification volume per user stays within the declared cap, measured | OPEN |
| **P10-186** | Critical and time-sensitive alerts | P10-183 | Elevated delivery for genuinely urgent alerts, used sparingly | Critical alerts are used only for declared categories, verified by audit | OPEN |
| **P10-187** | Quiet hours and delivery timing | P10-182 | Respecting quiet hours, timezone and working patterns | No non-critical notification arrives during declared quiet hours, proven by test | OPEN |
| **P10-188** | Notification synchronisation across devices | P10-110 | Reading on one device clearing it on others | A notification actioned on one device clears on another within the stated window | OPEN |
| **P10-189** | In-application notification centre | P10-034 | An in-application record of notifications independent of OS delivery | Every notification is retrievable in-application even if OS delivery failed | OPEN |
| **P10-190** | Background execution model | P10-026 | The declared background work model within each platform's constraints | Background work completes within platform limits without being killed, verified per platform | OPEN |
| **P10-191** | Background sync | P10-085 | Syncing in the background within platform and battery constraints | A background sync completes and its result is visible on return, proven by test | OPEN |
| **P10-192** | Background upload | P10-098 | Completing attachment uploads while backgrounded | A large upload completes while backgrounded, verified per platform | OPEN |
| **P10-193** | Background location tracking | P10-155 | Continuous location for field workflows within battery budget | Background tracking meets the battery budget over a working day, measured | OPEN |
| **P10-194** | Background task scheduling | P10-190 | Scheduled work respecting platform scheduling policies | Scheduled work runs within its window on both platforms, verified per platform | OPEN |
| **P10-195** | Background work observability | P10-179 | Telemetry on background execution, completion and termination | Background termination by the OS is visible in telemetry and its cause attributable | OPEN |
| **P10-196** | Silent push and data messages | P10-181 | Server-initiated background sync where the platform permits | A silent push triggers sync without disturbing the user, verified per platform | OPEN |
| **P10-197** | Notification delivery verification | P10-181 | Measuring actual delivery rather than assuming it | Delivery rate is measured per platform and a drop is detected and alerted | OPEN |
| **P10-198** | Notification failure handling | P10-197 | Behaviour when push is unavailable or the token is invalid | An invalid token is refreshed or reported, and the user is not silently cut off | OPEN |
| **P10-199** | Approval and action-from-notification | P10-184 | Completing approvals directly from a notification, including offline | An approval from a notification is queued when offline and applied on reconnect | OPEN |
| **P10-200** | Notification accessibility | P10-229 | Notifications announced correctly by assistive technology | Every notification is announced correctly, verified with each platform screen reader | OPEN |
| **P10-201** | Notification analytics | P10-197 | Delivery, open, action and dismissal measurement | Notification effectiveness is measured per category, not assumed | OPEN |
| **P10-202** | Stage G proof | P10-190 | A suite asserting delivery, action, background completion and quiet-hours respect on both platforms | Every guarantee holds on real devices, and a seeded quiet-hours violation is caught | OPEN |

---

## 12. Stage H · Performance, battery and data (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-203** | Startup performance | P10-014 | Cold, warm and hot start within budget on the low-end device | Cold start meets budget on the low-end reference device, measured | OPEN |
| **P10-204** | Frame rendering performance | P10-013 | Consistent target frame rate across scrolling, transitions and animation | No screen drops below target frame rate on the low-end device, measured | OPEN |
| **P10-205** | Jank detection and elimination | P10-204 | Detecting and removing dropped frames per screen | Jank per screen is measured and below threshold; a regression fails CI | OPEN |
| **P10-206** | List and scroll performance | P10-064 | Large lists scrolling smoothly with images and complex rows | A 10,000-item list with images scrolls at target frame rate, measured | OPEN |
| **P10-207** | Image loading and caching | P10-206 | Efficient image loading, sizing, caching and memory management | Image memory stays within budget with a large list scrolled repeatedly, measured | OPEN |
| **P10-208** | Memory management | P10-207 | Bounded memory with no leaks across navigation and long sessions | An 8-hour session shows no unbounded memory growth, measured | OPEN |
| **P10-209** | Memory pressure handling | P10-208 | Responding to OS memory warnings without losing work | Under memory pressure the application sheds caches and never unsynced work, proven by test | OPEN |
| **P10-210** | Binary and install size | P10-020 | Application size within budget per platform | Install size stays within budget; a regression fails CI with its cause named | OPEN |
| **P10-211** | Asset optimisation | P10-210 | Optimised images, fonts and bundled assets | No unoptimised asset ships, enforced at build | OPEN |
| **P10-212** | Code size and tree shaking | P10-210 | Eliminating unused code including unused design-system components | Unused components contribute zero bytes, verified by size analysis | OPEN |
| **P10-213** | Database and query performance | P10-077 | Local query performance within budget at realistic volume | Local queries meet budget at fixture volume on the low-end device, measured | OPEN |
| **P10-214** | Computation offloading | P10-204 | Moving expensive work off the UI isolate | Heavy computation never blocks the UI thread, verified by frame timing under load | OPEN |
| **P10-215** | Network efficiency | P10-112 | Minimising requests, payload and round trips | Data usage per session stays within the declared budget, measured | OPEN |
| **P10-216** | Data usage awareness | P10-215 | Respecting metered connections and data-saver settings | On a metered connection, non-essential transfer is deferred, verified by test | OPEN |
| **P10-217** | Battery measurement | P10-013 | Measuring battery consumption per feature and per background activity | Battery consumption is measured per feature on reference devices | OPEN |
| **P10-218** | Battery budget | P10-217 | The UX-5 mechanism: declared battery budgets enforced in CI | A feature exceeding its battery budget fails the gate, proven on a seeded regression | OPEN |
| **P10-219** | Background battery discipline | P10-193 | Background work within its battery budget over a working day | A full working day of background operation stays within budget, measured | OPEN |
| **P10-220** | Thermal management | P10-217 | Behaviour under thermal throttling | Under thermal pressure the application degrades gracefully, verified on device | OPEN |
| **P10-221** | Low-end device support | P10-017 | Meeting every budget on the declared low-end device | Every budget is met on the low-end device, measured, not only on flagships | OPEN |
| **P10-222** | Poor-network performance | P10-111 | Usable behaviour on slow, high-latency and lossy connections | The application remains usable on the declared poor-network profile, verified under simulation | OPEN |
| **P10-223** | Airplane-mode and no-network performance | P10-081 | Full offline operation at the same interaction speed | Offline interaction meets the online budget, measured | OPEN |
| **P10-224** | Performance regression gates | P10-014 | CI gates on startup, frame rate, memory, size and battery | A deliberately regressed build fails the gate; the gate has been proven able to fail | OPEN |
| **P10-225** | Performance observability in production | P10-013 | Field measurement of startup, frames, crashes and battery | Field data covers every device class and OS version in use | OPEN |
| **P10-226** | Performance on real device lab | P10-017 | Continuous measurement on physical reference devices | Benchmarks run on physical devices in CI, not only on emulators | OPEN |
| **P10-227** | Estate performance remediation | P10-022 | Applying platform-level fixes across every screen | A platform fix improves the measured estate profile, verified by re-census | OPEN |
| **P10-228** | Stage H performance proof | P10-224 | A full performance run across devices, networks and battery on real hardware | Every budget is met on every reference device, and a seeded regression on any axis is caught | OPEN |

---

## 13. Stage I · Accessibility and internationalisation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-229** | Mobile accessibility architecture | P10-015 | Platform-level mechanisms making accessible output the default | An accessible outcome requires no per-screen effort for standard patterns, proven per pattern | OPEN |
| **P10-230** | Semantics and labelling | P10-229 | Every interactive element carrying correct semantics and labels | An unlabelled interactive element fails the gate, proven on a seeded example | OPEN |
| **P10-231** | Screen reader support | P10-230 | Full operation with TalkBack and VoiceOver | Every screen is operable with each platform's screen reader, recorded per screen kind | OPEN |
| **P10-232** | Focus and traversal order | P10-231 | Logical traversal order across every screen | Traversal order matches visual order on every screen, verified by audit | OPEN |
| **P10-233** | Dynamic content announcement | P10-231 | Announcing loading, results, errors and sync state changes | Every asynchronous outcome is announced once, verified with each screen reader | OPEN |
| **P10-234** | Text scaling and reflow | P10-056 | Usability at the largest OS text size without loss of content | Every screen is usable at maximum text scale with no truncation, verified across the estate | OPEN |
| **P10-235** | Contrast and colour independence | P10-055 | Contrast enforced and information never conveyed by colour alone | Contrast passes on every theme; a colour-only pattern fails a gate | OPEN |
| **P10-236** | Target size and touch accessibility | P10-069 | Minimum target sizes and spacing across every interactive element | Every target meets the minimum size, verified automatically | OPEN |
| **P10-237** | Motion and vestibular safety | P10-072 | Respecting reduce-motion and limiting automatic movement | Every animation respects the OS setting, verified per platform | OPEN |
| **P10-238** | Alternative input support | P10-231 | Switch access, voice control and external keyboard support | The application is operable by switch access and voice control, verified by exercise | OPEN |
| **P10-239** | Accessible forms | P10-063 | Labels, errors, hints and required indication from the form engine | Every generated form is accessible without per-form effort, verified across form kinds | OPEN |
| **P10-240** | Accessible lists and grids | P10-064 | Screen-reader-navigable lists with correct announcements | A long list is navigable and comprehensible with a screen reader, recorded as a test | OPEN |
| **P10-241** | Accessible media and scanning | P10-151 | Camera, scanning and signature flows usable with assistive technology | Scanning is completable with a screen reader active, verified by exercise | OPEN |
| **P10-242** | Automated accessibility gates | P10-015 | CI gates preventing accessibility regressions | A seeded violation fails CI; the gate has been proven able to fail | OPEN |
| **P10-243** | Accessibility conformance reporting | P10-231 | Conformance reports generated from real audit results | The report is generated from audit data and cannot claim untested conformance | OPEN |
| **P10-244** | Internationalisation architecture | P10-024 | Locale resolution, message loading and formatting on mobile | A locale change applies without restart, proven by test | OPEN |
| **P10-245** | Message extraction and hardcoded-string detection | P10-244 | Extracting translatable strings and detecting hardcoded ones | A hardcoded user-facing string fails the gate, proven on a seeded example | OPEN |
| **P10-246** | Pluralisation and grammatical correctness | P10-244 | Correct plural, gender and case handling per locale | Rules are correct for every supported locale, verified per locale | OPEN |
| **P10-247** | Number, currency and date formatting | P10-244 | Locale-correct formatting with explicit currency and no precision loss | Formatted values match locale expectations, verified per locale | OPEN |
| **P10-248** | Timezone handling | P10-247 | Correct display and entry across timezones, including offline capture | An offline-captured timestamp syncs with the correct timezone, proven by test | OPEN |
| **P10-249** | Right-to-left layout | P10-058 | Complete RTL layout and mirroring across every screen | Every screen renders correctly in RTL, verified across the estate | OPEN |
| **P10-250** | Text expansion resilience | P10-234 | Layouts tolerating substantial text expansion | Every layout survives 40 % expansion without breaking, verified by pseudo-locale | OPEN |
| **P10-251** | Font and script coverage | P10-057 | Fonts covering every supported script with correct fallback | Every supported script renders without fallback boxes, verified per script | OPEN |
| **P10-252** | Stage I reach proof | P10-242 | A full audit across every screen, locale, text scale, RTL and both screen readers | The estate passes automated and manual review, and a seeded regression is caught | OPEN |

---

## 14. Stage J · Feature coverage and parity (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-253** | Parity model | P10-002 | The declared parity position: what mobile does, what it deliberately does not, and why | Every capability is classified as full, partial-by-design, or absent-by-design; unclassified is a defect | OPEN |
| **P10-254** | Mobile-first workflow identification | P10-253 | Identifying the work that genuinely belongs on mobile rather than porting everything | Each mobile workflow is justified by real usage context, recorded | OPEN |
| **P10-255** | Approvals and workflow tasks | P10-199 | Approving, rejecting and delegating from mobile, including offline | An approval completes offline and applies exactly once on sync, proven by test | OPEN |
| **P10-256** | Time recording | P10-081 | Time entry, clocking and timesheet submission, offline-capable | Time recorded offline reaches the server exactly once, proven under interruption | OPEN |
| **P10-257** | Expense capture | P10-149 | Receipt capture, extraction, policy validation and submission offline | An expense captured offline with a photo submits completely on reconnect | OPEN |
| **P10-258** | Warehouse and inventory operations | P10-153 | Picking, putaway, counting and transfers with scanning, offline-capable | A full picking run completes offline and posts exactly once, proven by test | OPEN |
| **P10-259** | Field service execution | P10-155 | Work orders, parts, time, signature and completion offline | A field job completes fully offline including signature and parts, proven by test | OPEN |
| **P10-260** | Sales and CRM on mobile | P10-105 | Accounts, contacts, opportunities and activities with offline access | A salesperson works a full day offline and syncs cleanly, proven by test | OPEN |
| **P10-261** | Order and quotation entry | P10-107 | Creating orders and quotations on mobile, offline-capable | An offline order applies correct pricing and posts exactly once, proven by test | OPEN |
| **P10-262** | Delivery and proof of delivery | P10-158 | Delivery confirmation with signature, photo and location | A delivery confirmation captures its evidence and syncs completely, proven by test | OPEN |
| **P10-263** | Manufacturing shop-floor operations | P10-152 | Operation confirmation, consumption and quality recording | A shop-floor confirmation posts correctly, including offline, proven by test | OPEN |
| **P10-264** | Maintenance execution | P10-259 | Maintenance work orders with checklists, parts and readings | A maintenance job completes offline with readings and parts, proven by test | OPEN |
| **P10-265** | Human resources self-service | P10-081 | Leave, payslips, personal data and requests on mobile | An employee sees only their own data, proven by test | OPEN |
| **P10-266** | Dashboards and reporting on mobile | P10-066 | Key figures and reports readable on a small screen with drill-through | Every mobile figure reconciles to its server value exactly | OPEN |
| **P10-267** | Document viewing and annotation | P10-167 | Viewing and annotating documents offline | A document is viewable and annotatable offline, proven with the network disabled | OPEN |
| **P10-268** | Search across modules | P10-105 | Cross-module search including offline local search | Search works offline and online with consistent semantics, verified differentially | OPEN |
| **P10-269** | Notifications-to-action coverage | P10-184 | Every notification type having a corresponding mobile action | A notification without a mobile action path fails the coverage gate | OPEN |
| **P10-270** | Runtime form renderer coverage | P10-063 | The existing form renderer extended to every form type it must support | Every declared form type renders and submits correctly, verified per type | OPEN |
| **P10-271** | Capability gap reporting | P10-253 | Surfacing to the user when a task requires the web client, with a handoff | An unavailable capability explains itself and offers a handoff, never a dead end | OPEN |
| **P10-272** | Cross-client handoff | P10-271 | Moving a task between mobile and web without losing context | A handoff resumes the exact task context on the other client, proven by test | OPEN |
| **P10-273** | Parity verification | P10-253 | Automated verification that declared parity matches reality | A capability declared present but absent fails the parity gate, proven on a seeded example | OPEN |
| **P10-274** | Feature usage measurement | P10-225 | Which mobile capabilities are actually used, informing investment | Usage is measured per capability and per role, from real events | OPEN |
| **P10-275** | Mobile-specific workflow optimisation | P10-274 | Optimising the highest-volume mobile workflows for speed | The top workflows meet their task-completion time budget, measured | OPEN |
| **P10-276** | Stage J coverage proof | P10-273 | A suite executing every declared mobile workflow end to end, offline and online | Every declared workflow completes on both paths, and a false parity claim is caught | OPEN |

---

## 15. Stage K · Release, distribution and store compliance (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-277** | Build and signing pipeline | P10-019 | Reproducible, signed builds for both platforms from CI | Two builds of one commit produce identical artefacts, verified by hash | OPEN |
| **P10-278** | Signing key management | P10-277 | Secure key storage, rotation and recovery for both platforms | Signing keys are never accessible to an individual and their loss is recoverable, verified by rehearsal | OPEN |
| **P10-279** | Store submission automation | P10-277 | Automated submission to both stores with metadata and assets | A release submits to both stores from CI with no manual step | OPEN |
| **P10-280** | Store listing and metadata | P10-279 | Listing content, screenshots and descriptions, versioned and localised | Every listing exists in every supported store locale; a claim without a capability fails the check | OPEN |
| **P10-281** | Store review compliance | P10-144 | Meeting both platforms' review requirements including privacy declarations | A submission passes review; a rejection reason is mapped to a mechanism, not to a retry | OPEN |
| **P10-282** | Privacy labels and data disclosure | P10-144 | Accurate store privacy declarations matching real behaviour | Declared data collection matches actual behaviour, verified by audit | OPEN |
| **P10-283** | Staged rollout | P10-279 | Progressive release to a percentage of users with health gates | A rollout halts automatically on a health regression, proven by injection | OPEN |
| **P10-284** | Release health monitoring | P10-225 | Comparing a new version's crash rate and performance against its predecessor | A regressing release is detected from field data within the stated window | OPEN |
| **P10-285** | Rollback and forced update | P10-043 | Halting a bad release and forcing users off a broken version | A broken version can be halted and users forced to update, verified by rehearsal | OPEN |
| **P10-286** | Beta and internal distribution | P10-279 | Internal, beta and enterprise distribution channels | Each channel distributes correctly and cannot reach production users, verified per channel | OPEN |
| **P10-287** | Enterprise and managed distribution | P10-131 | Distribution through enterprise programmes and managed stores | A managed distribution installs and configures correctly, verified per platform | OPEN |
| **P10-288** | Minimum supported version policy | P10-016 | Declared support for OS and application versions with a deprecation path | An unsupported version prompts to update rather than failing obscurely | OPEN |
| **P10-289** | Release notes | P10-280 | Release notes generated from the actual change set, localised | Release notes derive from the diff and cannot be hand-invented, verified by generation | OPEN |
| **P10-290** | Store compliance monitoring | P10-281 | Tracking store policy changes and their impact | A policy change affecting the application is detected before it causes a rejection | OPEN |
| **P10-291** | Crash-free rate targets | P10-284 | Declared crash-free session and user targets with alerting | Crash-free rate is measured and a breach alerts, verified by rehearsal | OPEN |
| **P10-292** | Store rating and review response | P10-280 | Monitoring and responding to store reviews | Store feedback is triaged and routed to owners, measured | OPEN |
| **P10-293** | Release cadence and process | P10-283 | A repeatable release process with declared cadence and gates | Every release passes the same gates; a bypass requires a recorded exception | OPEN |
| **P10-294** | Stage K release proof | P10-283 | A full release rehearsal: build, sign, submit, stage, monitor, roll back | The complete cycle is rehearsed on both platforms with the rollback exercised | OPEN |

---

## 16. Stage L · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P10-295** | Coverage that can fail | P10-018 | Coverage across the mobile application with real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P10-296** | Unit and widget testing | P10-295 | Unit coverage of the sync engine, queue, local store, form runtime and state model | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P10-297** | Golden and visual regression testing | P10-076 | Golden-image comparison across components, themes, densities and device classes | A visual regression fails CI; the suite is proven able to fail on a seeded change | OPEN |
| **P10-298** | Integration testing with a real API | P10-008 | Integration suites against a real API rather than mocked responses | The suite runs against a real API in CI; a mock-only pass is caught | OPEN |
| **P10-299** | Contract testing | P10-008 | Consumer-driven contract tests against the API | A breaking API change fails before it reaches the application, proven on a seeded change | OPEN |
| **P10-300** | End-to-end testing on real devices | P10-226 | Automated end-to-end journeys on physical devices in CI | Each journey runs on real devices and fails when any step regresses | OPEN |
| **P10-301** | Offline and sync testing | P10-116 | Deterministic testing of offline operation, queueing, sync and conflict | No action lost or duplicated across 1,000 interrupted cycles, proven repeatedly | OPEN |
| **P10-302** | Process death and lifecycle testing | P10-027 | Testing OS termination, backgrounding and restoration systematically | State and unsaved work survive termination at every injection point, proven exhaustively | OPEN |
| **P10-303** | Platform and OS version matrix testing | P10-016 | Testing across every supported OS version and device class | Every supported combination passes; an unsupported one degrades explicitly | OPEN |
| **P10-304** | Network condition testing | P10-222 | Testing across offline, slow, lossy and transitioning connections | The application behaves correctly on every declared network profile, verified under simulation | OPEN |
| **P10-305** | Native integration testing | P10-180 | Testing camera, scanner, Bluetooth, location and printing on real hardware | Every native integration is verified on real hardware in the device lab | OPEN |
| **P10-306** | Accessibility testing, automated and manual | P10-252 | Automated scanning plus manual verification with both screen readers | The estate is clean automatically and passes manual review on both platforms | OPEN |
| **P10-307** | Performance and battery testing | P10-228 | Automated performance and battery measurement on physical devices | Every budget is met on reference devices; a regression fails CI | OPEN |
| **P10-308** | Security testing | P10-146 | Automated mobile security testing plus a penetration exercise | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P10-309** | Soak and endurance testing | P10-208 | Long-session and multi-day testing including background operation | A working day of continuous use shows no leak, no drift and no battery breach | OPEN |
| **P10-310** | The offline guarantee proof | P10-301 | The § 1 invariant made adversarial: extended offline use with process death, storage pressure, conflict and rejection injected throughout | No action is lost or duplicated, every unresolvable case is surfaced, and removing any guarantee is caught immediately | OPEN |
| **P10-311** | Application re-census and verification | P10-002 | Re-running the P10-002 census and comparing against the original | Every measured defect class is reduced; a class that is not blocks the programme rather than being footnoted | OPEN |
| **P10-312** | Programme 10 launch readiness | P10-310 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 17 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 17. Programme exit criteria

- [ ] **The application is fully usable offline, and every offline action reaches the server exactly once or is surfaced for resolution** (P10-310)
- [ ] No action is lost or duplicated across 1,000 interrupted sync cycles (P10-116, P10-301)
- [ ] Unsaved work survives OS process termination at every injection point (P10-095, P10-302)
- [ ] Storage pressure evicts synced data only; unsynced work is never evicted (P10-104)
- [ ] An offline-created document receives a correct, gapless number on sync (P10-109)
- [ ] Two devices working offline converge to one consistent state (P10-110)
- [ ] An offline action is re-verified server-side and rejected if no longer permitted (P10-108)
- [ ] Local data is encrypted and unreadable without the device key (P10-079)
- [ ] Sign-out clears every local trace; sign-out with unsynced work warns first (P10-125)
- [ ] Tokens live in the OS keystore; credentials are never entered in an embedded web view (P10-117, P10-119)
- [ ] Credential extraction, traffic interception and binary tampering all fail (P10-146)
- [ ] Every budget — startup, frame rate, memory, size, battery, data — is met on the low-end reference device (P10-221, P10-228)
- [ ] Background operation over a working day stays within the battery budget (P10-219)
- [ ] Every screen is operable with TalkBack and VoiceOver, and usable at maximum text scale (P10-231, P10-234)
- [ ] Every screen renders correctly in RTL; a hardcoded string fails CI (P10-245, P10-249)
- [ ] Every native integration is verified on real hardware in CI (P10-180, P10-305)
- [ ] Declared parity matches reality; a false parity claim fails the gate (P10-253, P10-273)
- [ ] An unavailable capability explains itself and offers a handoff, never a dead end (P10-271)
- [ ] Both platforms build, test and sign on every commit; two builds of one commit are identical (P10-019, P10-277)
- [ ] A release is staged, monitored and rollable back, rehearsed on both platforms (P10-294)
- [ ] Store privacy declarations match actual behaviour, verified by audit (P10-282)
- [ ] Coverage thresholds have been proven able to fail (P10-295)
- [ ] Zero hardcoded colours or dimensions; components come from the shared tokens (P10-053, P10-062)

---

## 18. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 10 established (P10-001–P10-312), the Android and iOS applications.** Registered per README § 0 rule 1. The starting position is a real Flutter application — 811 Dart files, three build flavours — not a prototype, so `P10-002` measures it before any phase claims to extend it. Two facts shape the programme: Track I is 0/18, so nothing here has been held to a cross-client standard; and the workspace already carries `scripts/check-dart-syntax.mjs`, a gate written for this repository specifically, whose actual coverage `P10-003` measures rather than assumes. The § 1 invariant — fully usable offline, every offline action reaching the server exactly once or surfaced for resolution — is the one property a mobile ERP client cannot retrofit, which is why Stage D is the largest stage and `P10-310` is its adversarial proof. The design system is implemented natively in Flutter against the shared tokens rather than embedded as web views. | Claude Code |
