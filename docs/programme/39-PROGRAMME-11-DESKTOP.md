# PROGRAMME 11 · DESKTOP — WINDOWS, macOS AND LINUX — P11-001–P11-312

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Independently executable.** `node scripts/start.mjs --programme 11` resolves waves from this
> document and can only ever hand out a `P11-` phase.

---

## 0. The independence rule

**No phase here may name a phase from another programme in its `Depends` cell.** `P11-005` is the
runtime precondition gate.

---

## 1. What this programme owns

The **Windows, macOS and Linux desktop applications**.

**The invariant this programme establishes:**

> **The desktop application earns its existence.** Every capability it has is one a browser tab
> genuinely cannot provide — deep OS integration, multi-window work, local file and device access,
> real offline operation, and sustained all-day performance — and each is measured against the
> browser rather than asserted over it.

This is the honest framing for a desktop client in 2026, and `P11-310` enforces it: every declared
desktop-only capability is tested against the web client, and a capability the browser can do
equally well is either removed or its justification recorded. A desktop application that is a
browser in a frame is a maintenance burden with a splash screen.

### Verified starting position — this is greenfield

| Measure | Value | How it was counted |
| :------ | :---- | :----------------- |
| Desktop repository | **none** | `ls -d unierp-*/src-tauri unierp-*/electron` returns nothing |
| Programme 1 Track I | **0/18 DONE**, 15 OPEN, 3 BLOCKED | `node scripts/phase-brief.mjs --status` |
| Design system | 112 components | `find unierp-design-system/src -name '*.tsx'` |
| Web client | 903 route pages | `find unierp-web -name page.tsx -not -path "*/node_modules/*"` |

**There is no desktop code in this family today.** No `src-tauri`, no `electron`, no desktop entry in
any repository. Track I — which owns mobile, desktop, offline and parity — is 0/18. This programme
is therefore written as a genuine greenfield build, and it says so rather than implying it extends
something. That has one large consequence, and `P11-002` is where it is faced rather than assumed:
**the technology decision is made first, in the open, with the alternative recorded.**

**Reference set.** Visual Studio Code and Figma Desktop (large applications on web technology done
well, and their real costs), Slack and Linear desktop (the honest question of what the wrapper adds),
Tauri and Electron (the two mainstream paths and their trade-offs), Microsoft Office and Adobe
Creative Cloud (OS integration and update infrastructure at scale), 1Password and Tailscale
(cross-platform native feel with a small team), and Apple, Microsoft and freedesktop platform
guidelines for what each operating system's users actually expect.

---

## 2. UX principles

| # | Principle | Drawn from | Enforced by |
| :- | :-------- | :--------- | :---------- |
| **UX-1** | **Native where the platform has an opinion.** Menus, shortcuts, window behaviour and file dialogs follow the OS, not a shared compromise. | Apple HIG; Microsoft; freedesktop | `P11-056` |
| **UX-2** | **Multi-window is the point.** Work across several documents and monitors simultaneously, which a tab cannot do. | VS Code; Figma | `P11-151` |
| **UX-3** | **The keyboard is the primary interface.** Every action has a shortcut and every shortcut is discoverable and rebindable. | VS Code | `P11-160` |
| **UX-4** | **Local files and devices are first-class.** Drag in, drag out, watch, print, scan. | Office | `P11-131` |
| **UX-5** | **All-day resident.** Starts fast, stays fast, uses resources proportionately, and never becomes the reason a laptop is warm. | 1Password; Tailscale | `P11-215` |
| **UX-6** | **Updates are invisible and never lose work.** | VS Code | `P11-286` |
| **UX-7** | **Every desktop-only capability is justified against the browser.** | — | `P11-310` |

---

## 3. Design-system rule

`unierp-design-system` is the source of tokens and components. Where the desktop shares a rendering
technology with the web, it shares components directly; where it does not, `P11-053` binds the same
tokens natively. Either way the token gate applies unchanged, and `P11-063` is the enforcement.

---

## 4. Waves

### Wave 0 · "Decide, in the open"
**Phases:** P11-001–P11-024 · Independence, the technology decision, and the foundation.

### Wave 1 · "The application"
**Phases:** P11-025–P11-078 · Architecture, shell, and the desktop design system.

### Wave 2 · "Data and the operating system"
**Phases:** P11-079–P11-150 · Local data, sync, and per-platform OS integration.

### Wave 3 · "Desktop interaction"
**Phases:** P11-151–P11-206 · Multi-window, keyboard, and desktop security.

### Wave 4 · "Resources and reach"
**Phases:** P11-207–P11-254 · Performance, resource use, accessibility and internationalisation.

### Wave 5 · "Coverage, distribution and production"
**Phases:** P11-255–P11-312 · Parity, packaging, updates, the test estate, and the justification proof.

---

## 5. Stage A · The technology decision and foundation (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-001** | Programme charter and boundary declaration | — | A manifest declaring the repositories this programme creates and writes to, and the contracts it consumes | A P11 commit touching an undeclared repository fails CI. Deleting the declaration fails CI | OPEN |
| **P11-002** | The technology decision | P11-001 | A written decision between the mainstream paths — web-technology shell versus native — with the criteria, the measurements behind them, the rejected alternative, and what would falsify the choice | The decision names its falsification condition. A prototype of each candidate is measured on binary size, memory, startup and integration depth before the choice is recorded | OPEN |
| **P11-003** | Desktop repository establishment | P11-002 | The repository created with structure, licensing, CI and contribution rules matching the family | The repository builds from a clean clone on all three platforms with no sibling repository present | OPEN |
| **P11-004** | Code sharing strategy | P11-002 | The declared, enforced boundary: what is shared with the web client and what is desktop-specific | A shared module diverging without justification fails the boundary gate, proven on a seeded example | OPEN |
| **P11-005** | Runtime precondition gate | P11-003 | Startup and CI assertion of each external capability with explicit degradation | With a capability absent, the dependent surface says exactly what is missing and no other surface is affected | OPEN |
| **P11-006** | Three-platform build pipeline | P11-003 | CI building and testing Windows, macOS and Linux on every change | All three platforms build and test on every commit; a broken platform fails the build | OPEN |
| **P11-007** | Platform support matrix | P11-006 | The declared, tested OS versions, architectures and distributions | Every supported combination is tested in CI; an unsupported one degrades explicitly | OPEN |
| **P11-008** | Architecture support | P11-007 | x86-64 and ARM64 across all three platforms | Every declared architecture builds and is tested, verified per architecture | OPEN |
| **P11-009** | Linux distribution and desktop-environment support | P11-007 | The declared distribution and desktop-environment matrix | Every declared environment is tested; behaviour differences are documented and handled | OPEN |
| **P11-010** | Dependency governance | P11-003 | Allowlisted dependencies with size, licence, maintenance and vulnerability policy | An unvetted or vulnerable dependency fails the build with its advisory named | OPEN |
| **P11-011** | Generated API client | P11-004 | A typed client generated from API contracts so it cannot drift | A contract change producing an incompatible call fails the build, proven on a seeded change | OPEN |
| **P11-012** | Error taxonomy | P11-011 | Typed errors distinguishing network, authorization, validation, conflict, OS and platform fault | Every error carries a registry code and maps to a defined presentation | OPEN |
| **P11-013** | Structured logging and correlation | P11-012 | Correlation from user action through local queue to server and back, with local log files | One offline action is traceable from click to server commit by one correlation ID | OPEN |
| **P11-014** | Local log management | P11-013 | Log files with rotation, size bounds, redaction and user access | Logs never exceed their size bound and contain no personal data, verified by inspection | OPEN |
| **P11-015** | Configuration and secret handling | P11-003 | Validated configuration with no secret in the shipped binary | A binary scan finds zero secrets, run in CI | OPEN |
| **P11-016** | Crash reporting | P11-013 | Crash capture with symbolication across all three platforms, consent-gated | Every crash reaches reporting symbolicated, with consent and no personal data | OPEN |
| **P11-017** | Performance measurement infrastructure | P11-006 | Startup, memory, CPU, frame time and binary size measured per platform | Every platform's performance profile is measured and tracked over time | OPEN |
| **P11-018** | Performance and resource budgets | P11-017 | Budgets for startup, idle memory, idle CPU and binary size per platform | A regression beyond budget fails CI on the reference machines | OPEN |
| **P11-019** | Accessibility measurement infrastructure | P11-006 | Automated accessibility scanning across every window and view | Every view's accessibility state is measured and tracked | OPEN |
| **P11-020** | Reference machines and test fixtures | P11-007 | Physical and virtual reference machines including a declared low-end profile | Every benchmark runs on the reference machine set, including low-end | OPEN |
| **P11-021** | Test harness for desktop | P11-020 | Window driver, OS integration doubles, file system control, network and clock control | A desktop test is writable without new infrastructure. The harness has tests that fail when broken | OPEN |
| **P11-022** | Module boundaries and architecture gates | P11-004 | Enforced boundaries between shell, platform, shared and feature code | A forbidden import fails the boundary gate, proven on a seeded example | OPEN |
| **P11-023** | Binary size governance | P11-018 | Tracking and budgeting installed size per platform | A size regression fails CI with the responsible dependency named | OPEN |
| **P11-024** | Desktop-capability register | P11-002 | The register of every capability claimed as desktop-only, each with its browser comparison | A capability without a recorded browser comparison cannot be claimed as desktop-only | OPEN |

---

## 6. Stage B · Application architecture and shell (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-025** | Process architecture | P11-002 | The declared process model: main, renderer, worker and their privilege boundaries | A privilege boundary violation fails an architecture gate, proven on a seeded example | OPEN |
| **P11-026** | Inter-process communication | P11-025 | Typed, validated, least-privilege IPC between processes | An unvalidated IPC message is rejected; an untyped channel fails the gate | OPEN |
| **P11-027** | Privilege separation | P11-025 | Rendering code without direct OS, file or network privilege | Rendering code cannot reach the file system directly, proven by an escape test | OPEN |
| **P11-028** | State management model | P11-026 | One state approach with declared categories and no hidden global mutable state | A second state approach or hidden global state fails an architecture gate | OPEN |
| **P11-029** | Application lifecycle | P11-025 | Launch, foreground, background, sleep, wake, quit and forced termination | State survives sleep, wake and forced termination, proven by test | OPEN |
| **P11-030** | Session and work restoration | P11-029 | Restoring windows, tabs, scroll and unsaved work after any exit | A forced termination restores every window and entered value on relaunch, proven by test | OPEN |
| **P11-031** | Application shell | P11-028 | The frame: navigation, context, search, sync indicator and status | Every view renders in the shell; a view bypassing it fails the contract test | OPEN |
| **P11-032** | Navigation architecture | P11-031 | Routing across views with history, typed arguments and deep-link support | Every route resolves deterministically; a route conflict fails the build | OPEN |
| **P11-033** | Deep linking and protocol handling | P11-032 | Custom protocol registration opening the correct view with authorisation | A deep link to a forbidden resource refuses appropriately rather than leaking its existence | OPEN |
| **P11-034** | Tenant and workspace context | P11-031 | Context propagation across requests, local storage, cache keys and windows | Local data from one tenant is unreachable from another, proven by test | OPEN |
| **P11-035** | Context switching | P11-034 | Switching tenant or entity without stale data or leaked local state | A switch clears every context-bound store; a stale cross-context read is impossible | OPEN |
| **P11-036** | Multi-account support | P11-034 | Several accounts on one machine with complete separation | Data from one account is unreachable from another, proven by test | OPEN |
| **P11-037** | View classification and contracts | P11-031 | Every view classified by kind with a platform contract per kind | An unclassified view fails the gate; each kind's contract is testable | OPEN |
| **P11-038** | Loading, empty, error, permission and offline states | P11-037 | Every data-bound view required to declare all five | A view missing a required state fails the contract gate, proven on a seeded view | OPEN |
| **P11-039** | Error boundaries and recovery | P11-012 | Boundaries at process, window and view level with recovery | A view crash degrades that region only, never the application, proven by injection | OPEN |
| **P11-040** | Renderer crash recovery | P11-025 | Recovering a crashed renderer without losing the user's work | A renderer crash restores the view and unsaved work, proven by injection | OPEN |
| **P11-041** | Global search | P11-031 | Cross-module search including offline search of local data | Search works offline over locally available data, proven with the network disabled | OPEN |
| **P11-042** | Feature flag runtime | P11-028 | Runtime feature control with consistent assignment and offline evaluation | Flag evaluation is consistent offline and across restarts, proven by test | OPEN |
| **P11-043** | Preference and settings management | P11-028 | Application preferences stored per platform convention and synced across devices | Preferences follow each platform's convention and sync within the stated window | OPEN |
| **P11-044** | Onboarding and first run | P11-031 | First-run setup: sign-in, permissions, initial sync and guidance | A new user reaches a usable, synced application unaided, measured | OPEN |
| **P11-045** | Version skew handling | P11-011 | Operating correctly against a server of a different version within the compatibility window | A version-skewed client behaves per policy rather than failing obscurely | OPEN |
| **P11-046** | Application architecture documentation | P11-025 | Generated architecture documentation from the real structure | Documentation is generated from the code structure and cannot drift | OPEN |
| **P11-047** | Architecture conformance gates | P11-025 | Gates enforcing the process model, privilege separation and state model | Each architectural rule has a gate proven to fail on a seeded violation | OPEN |
| **P11-048** | Background and idle behaviour | P11-029 | Declared behaviour when minimised, idle or on battery | Idle resource use stays within budget, measured over an hour | OPEN |
| **P11-049** | System tray and background residency | P11-048 | Running in the tray or menu bar with a clear, controllable presence | Tray residency is optional, discoverable and fully controllable by the user | OPEN |
| **P11-050** | Launch at login | P11-049 | Optional launch at login following each platform's mechanism | Launch at login is opt-in, uses the platform mechanism, and is removable, verified per platform | OPEN |
| **P11-051** | Single-instance and multi-instance policy | P11-036 | Declared behaviour when the application is launched twice | Launching twice behaves per the declared policy on every platform, verified per platform | OPEN |
| **P11-052** | Stage B architecture proof | P11-030 | A suite injecting crash, forced termination, sleep, wake and context switch | Every condition restores correctly with no work lost, and removing restoration is caught | OPEN |

---

## 7. Stage C · The desktop design system (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-053** | Desktop component library | P11-004 | The component set bound to the shared design tokens per the P11-002 decision | Every component consumes tokens; a component defined in a view fails the location gate | OPEN |
| **P11-054** | Token synchronisation | P11-053 | Tokens generated from the shared design system rather than transcribed | A token change propagates without a manual edit, proven by test | OPEN |
| **P11-055** | Theme support | P11-054 | The seven themes rendering correctly on all three platforms | Every theme renders correctly on each platform, verified by visual regression | OPEN |
| **P11-056** | Platform appearance conventions | P11-055 | The UX-1 mechanism: honouring each platform's appearance and control conventions | Platform-specific appearance is verified on each platform against its guidelines | OPEN |
| **P11-057** | System appearance and dark mode | P11-055 | Following the OS light and dark setting, with manual override | Appearance follows the system setting immediately on change, verified per platform | OPEN |
| **P11-058** | System accent and high-contrast modes | P11-057 | Respecting OS accent colour and high-contrast settings | High-contrast mode renders correctly on every platform that offers it, verified per platform | OPEN |
| **P11-059** | Density for desktop | P11-055 | Desktop-appropriate density making real use of screen space | Every density renders correctly and remains accessible, verified per density | OPEN |
| **P11-060** | Typography and system fonts | P11-054 | Type scale honouring platform font conventions and OS text scaling | Typography renders correctly on each platform at every OS text scale | OPEN |
| **P11-061** | Display scaling and high-DPI | P11-060 | Correct rendering across scale factors and mixed-DPI multi-monitor setups | The application renders correctly when dragged between differently-scaled monitors, verified | OPEN |
| **P11-062** | Layout for large and ultrawide screens | P11-059 | Layouts making genuine use of large screens rather than centring a phone column | Ultrawide layouts use available width meaningfully, verified visually | OPEN |
| **P11-063** | Hardcoded value gate | P11-054 | The token gate for desktop: no hardcoded colour or dimension | A hardcoded colour or dimension fails CI, proven on a seeded example | OPEN |
| **P11-064** | Data-dense components | P11-062 | Tables, trees and grids exploiting desktop screen space and precision input | A 100,000-row table scrolls at target frame rate with inline editing, measured | OPEN |
| **P11-065** | Form and input components | P11-053 | Desktop-appropriate inputs with correct focus, tab order and validation | Every input follows platform focus and tab conventions, verified per platform | OPEN |
| **P11-066** | Chart and visualisation components | P11-053 | Desktop charts with accessible equivalents | Every chart has a screen-reader-navigable equivalent, verified per chart type | OPEN |
| **P11-067** | Context menus | P11-056 | Platform-appropriate right-click menus throughout | Every context menu follows platform convention and is keyboard-reachable | OPEN |
| **P11-068** | Toolbars and command surfaces | P11-056 | Toolbars, ribbons or command bars per platform expectation | Command surfaces follow platform convention and are fully keyboard-operable | OPEN |
| **P11-069** | Tooltips and hover affordances | P11-053 | Hover states and tooltips appropriate to a precise pointer | Every tooltip is also reachable by keyboard focus, verified per component | OPEN |
| **P11-070** | Selection and precision interaction | P11-064 | Range selection, modifier keys and precision pointer interaction | Shift and modifier selection behave per platform convention, verified per platform | OPEN |
| **P11-071** | Resizable and splittable layouts | P11-062 | Panes the user can resize, collapse and persist | Layout adjustments persist across restart, proven by test | OPEN |
| **P11-072** | Animation and motion | P11-055 | Restrained motion respecting OS reduce-motion settings | Every animation respects the OS setting, verified per platform | OPEN |
| **P11-073** | Component states completeness | P11-038 | Every component defining default, hover, focus, pressed, disabled, loading, empty and error | A component missing a required state fails the completeness gate | OPEN |
| **P11-074** | Component documentation and gallery | P11-053 | A runnable component gallery with every state, theme and density | Every component appears in the gallery; one that does not fails the gate | OPEN |
| **P11-075** | Cross-platform visual consistency | P11-056 | Deliberate decisions on where platforms diverge and where they must not | Every divergence is recorded and justified; an unrecorded one fails review | OPEN |
| **P11-076** | Design system parity with web | P11-004 | Verifying desktop components match web behaviour where they should | A behavioural divergence from the shared contract is detected and justified or fixed | OPEN |
| **P11-077** | Window chrome and title bar | P11-056 | Platform-appropriate window decoration including custom chrome where used | Custom chrome preserves every platform window behaviour, verified per platform | OPEN |
| **P11-078** | Stage C design proof | P11-063 | A visual regression suite across every component, theme, density, appearance and platform | The library passes on all three platforms, and a seeded hardcoded value is caught | OPEN |

---

## 8. Stage D · Local data, offline and synchronisation (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-079** | Local database architecture | P11-025 | The on-disk store with schema, indexes and a declared relationship to server data | Local queries meet the interaction budget at realistic volume on the low-end machine | OPEN |
| **P11-080** | Local schema versioning and migration | P11-079 | Versioned local schema with tested migrations and a defined failure path | A migration preserves local data or clears it deliberately, never corrupting, proven by test | OPEN |
| **P11-081** | Local data encryption | P11-079 | Encryption at rest with keys held in the platform credential store | Local data is unreadable without the platform key, verified by inspecting the file system | OPEN |
| **P11-082** | Local data scoping | P11-034 | Local data partitioned by account and tenant on disk | Data from one account is unreachable from another on the same machine, proven by test | OPEN |
| **P11-083** | Offline capability model | P11-037 | Every view and action declaring its offline capability | An undeclared view fails the gate. The declared capability is what is tested | OPEN |
| **P11-084** | Sync scope and replication | P11-083 | Choosing what replicates locally, with desktop's larger storage budget | Local data volume stays within the declared budget, measured | OPEN |
| **P11-085** | Initial sync | P11-084 | First-run replication with progress, resumption and bounded time | Initial sync completes within budget and resumes after interruption without restarting | OPEN |
| **P11-086** | Incremental sync | P11-085 | Delta synchronisation using watermarks and change tracking | An incremental sync transfers only changes, verified by payload measurement | OPEN |
| **P11-087** | Mutation queue | P11-083 | A durable, ordered queue of offline actions surviving forced termination | The queue survives forced termination with no entry lost, proven by test | OPEN |
| **P11-088** | Exactly-once delivery | P11-087 | Idempotency keys and server deduplication guaranteeing single application | A queued mutation replayed under repeated interruption applies exactly once, proven by test | OPEN |
| **P11-089** | Queue ordering and dependency | P11-087 | Preserving causal order between queued mutations | A create followed by an update on the same record applies in order, proven by test | OPEN |
| **P11-090** | Optimistic local application | P11-087 | Applying mutations locally immediately with clear pending state | A local mutation is visible immediately and clearly marked as not yet synced | OPEN |
| **P11-091** | Conflict detection and resolution | P11-086 | Detecting divergence and resolving per declared per-entity strategy | A concurrent server change surfaces rather than being silently overwritten, proven by test | OPEN |
| **P11-092** | Conflict resolution UX | P11-091 | Presenting conflicts with desktop's larger screen to show both sides fully | A conflict is resolvable with both versions visible side by side, verified by exercise | OPEN |
| **P11-093** | Server rejection handling | P11-088 | Handling a queued mutation the server refuses | A rejected mutation is surfaced with its reason and never silently dropped, per rejection class | OPEN |
| **P11-094** | Work preservation | P11-030 | In-progress entry persisted continuously, not only on submit | A forced termination restores every entered value, proven across view kinds | OPEN |
| **P11-095** | Draft management | P11-094 | Explicit drafts the user can see, resume and discard across windows | Every draft is listable, resumable and discardable from any window | OPEN |
| **P11-096** | Sync state visibility | P11-090 | Always-visible, honest sync state per record and overall | The user can always tell what has reached the server, verified by exercise | OPEN |
| **P11-097** | Pending action review | P11-096 | A surface listing everything waiting to sync, with detail and action | Every queued action is inspectable and individually actionable | OPEN |
| **P11-098** | Data freshness indication | P11-086 | Showing how current local data is, per entity | Every offline-readable surface indicates its data age where staleness matters | OPEN |
| **P11-099** | Local storage management | P11-084 | Managing disk usage with eviction that never discards unsynced work | Disk pressure evicts synced data only; unsynced work is never evicted, proven by test | OPEN |
| **P11-100** | Local search and query | P11-041 | Full local query capability including full-text search | Local search returns correct results offline, proven with the network disabled | OPEN |
| **P11-101** | Offline validation and permissions | P11-083 | Local validation and cached permission evaluation with the server as authority | An offline action is re-verified server-side and rejected if no longer permitted, proven by test | OPEN |
| **P11-102** | Offline numbering | P11-088 | Handling document numbering for offline-created documents | An offline-created document receives a correct, gapless number on sync, proven under concurrency | OPEN |
| **P11-103** | Multi-window data consistency | P11-090 | Several windows viewing the same data staying consistent | Two windows on one record never disagree after a mutation, proven by test | OPEN |
| **P11-104** | Multi-device convergence | P11-091 | The same account on several machines converging correctly | Two machines working offline converge to one consistent state, proven by test | OPEN |
| **P11-105** | Large local dataset handling | P11-079 | Handling substantially more local data than a mobile device | Local operations meet budget at desktop-scale data volume, measured | OPEN |
| **P11-106** | Background synchronisation | P11-048 | Syncing while minimised or in the tray, within resource budget | Background sync completes within its resource budget, measured | OPEN |
| **P11-107** | Network change handling | P11-086 | Adapting to network changes, VPN transitions and captive portals | A network transition resumes sync correctly, verified by injection | OPEN |
| **P11-108** | Sync performance | P11-086 | Sync within time and data budgets on the low-end machine | Sync meets its budget on the low-end profile over a slow connection, measured | OPEN |
| **P11-109** | Sync observability | P11-013 | Telemetry on sync duration, payload, failure, conflict and queue depth | A stuck or slow sync is diagnosable from telemetry and local logs alone | OPEN |
| **P11-110** | Sync testing infrastructure | P11-021 | Deterministic control of network, disk, clock and process lifecycle | Any sync scenario is testable deterministically, and the harness has its own tests | OPEN |
| **P11-111** | Data integrity verification | P11-104 | Continuous verification that local and server state agree after sync | A divergence after sync is detected and reported, proven by seeded corruption | OPEN |
| **P11-112** | Stage D offline proof | P11-088 | A suite driving extended offline use with queued mutations, forced termination, disk pressure and conflict | No action lost or duplicated across 1,000 interrupted cycles, and removing exactly-once handling is caught | OPEN |

---

## 9. Stage E · Operating system integration (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-113** | Platform integration architecture | P11-027 | The typed, tested boundary between application and OS APIs, per platform | An untyped or untested platform binding fails the gate, proven on a seeded example | OPEN |
| **P11-114** | Native menu bar | P11-056 | Platform menus: macOS menu bar, Windows and Linux application menus | Menus follow each platform's convention and every item has a shortcut, verified per platform | OPEN |
| **P11-115** | Menu state and context sensitivity | P11-114 | Menu items enabled, disabled and checked according to real state | Menu state always matches actual availability, proven by test | OPEN |
| **P11-116** | System notifications | P11-113 | Native notifications with actions, per platform | A notification appears natively and its action performs correctly, verified per platform | OPEN |
| **P11-117** | Notification permission and preference | P11-116 | Requesting notification permission in context with granular preference | No notification is sent for a disabled category, proven by test | OPEN |
| **P11-118** | System tray and menu bar presence | P11-049 | Tray icon with menu, status and quick actions per platform | Tray behaviour follows platform convention and is fully controllable, verified per platform | OPEN |
| **P11-119** | Badge and dock indicators | P11-116 | Unread and status indication on the dock, taskbar or launcher | Badge counts are accurate and clear correctly, verified per platform | OPEN |
| **P11-120** | Jump lists, dock menus and shortcuts | P11-118 | Platform quick-action menus into common tasks | Every quick action opens its target correctly, verified per platform | OPEN |
| **P11-121** | Global shortcuts | P11-114 | System-wide shortcuts with conflict detection and user rebinding | A conflicting global shortcut is detected and the user can rebind it | OPEN |
| **P11-122** | Clipboard integration | P11-070 | Rich clipboard support including structured data and images | Structured data copies and pastes correctly between the application and native applications | OPEN |
| **P11-123** | Drag and drop with the OS | P11-122 | Dragging files, records and content into and out of the application | A file dragged in and a record dragged out both behave correctly, verified per platform | OPEN |
| **P11-124** | File dialogs | P11-113 | Native open, save and folder dialogs with correct filters and defaults | Every dialog is the native one with correct filters, verified per platform | OPEN |
| **P11-125** | File type associations | P11-124 | Registering document types so files open in the application | A double-clicked associated file opens correctly, verified per platform | OPEN |
| **P11-126** | Recent files and documents | P11-125 | Platform recent-document integration | Recent documents appear in the platform's own list, verified per platform | OPEN |
| **P11-127** | File system watching | P11-124 | Watching local folders for changes where a workflow requires it | A watched folder change is detected within the stated window without polling cost | OPEN |
| **P11-128** | Local file import and export | P11-124 | Reading and writing local files with correct encoding and permissions | Import and export round-trip correctly including non-ASCII paths and content | OPEN |
| **P11-129** | Printing | P11-113 | Native printing with page setup, preview and printer selection | A document prints correctly to a native printer, verified per platform | OPEN |
| **P11-130** | Label and receipt printing | P11-129 | Direct printing to label and receipt printers | A label prints correctly to each declared printer class, verified on hardware | OPEN |
| **P11-131** | Peripheral device access | P11-113 | The UX-4 mechanism: scanners, cameras, card readers, scales and serial devices | Each declared peripheral class connects and operates, verified on hardware | OPEN |
| **P11-132** | USB and serial device integration | P11-131 | Direct device communication where a workflow requires it | A serial device exchanges data correctly, verified on hardware | OPEN |
| **P11-133** | Document scanner integration | P11-131 | Scanning through platform scanner interfaces | A scan completes and attaches to the correct record, verified on hardware | OPEN |
| **P11-134** | Camera and capture | P11-131 | Camera capture for photos and video where required | Capture works on every platform with a connected camera, verified per platform | OPEN |
| **P11-135** | Audio and voice input | P11-134 | Audio capture for notes and dictation | Audio capture and playback work correctly, verified per platform | OPEN |
| **P11-136** | Power and sleep management | P11-029 | Correct behaviour across sleep, wake, hibernate and battery transitions | A sleep and wake cycle resumes sync and session correctly, verified per platform | OPEN |
| **P11-137** | Sleep prevention | P11-136 | Preventing sleep only during genuinely long operations, and releasing it | Sleep prevention is released when the operation ends, proven by test | OPEN |
| **P11-138** | Network detection and proxy support | P11-107 | System proxy, VPN and network state integration | A system proxy configuration is honoured automatically, verified per platform | OPEN |
| **P11-139** | Certificate store integration | P11-138 | Using the platform certificate store including enterprise roots | An enterprise root certificate is honoured, verified in a managed environment | OPEN |
| **P11-140** | Credential store integration | P11-081 | Keychain, Credential Manager and Secret Service for credentials | No credential is stored outside the platform credential store, verified by inspection | OPEN |
| **P11-141** | Biometric and platform authentication | P11-140 | Touch ID, Windows Hello and equivalent for unlock and step-up | Platform authentication works with a non-biometric fallback, verified per platform | OPEN |
| **P11-142** | Single sign-on with the OS | P11-140 | Integrated authentication where the platform and enterprise support it | Integrated sign-in works in a domain environment, verified in a managed environment | OPEN |
| **P11-143** | Enterprise policy and management | P11-142 | Group Policy, MDM and configuration profile support | A managed policy is honoured and cannot be overridden by the user, verified per platform | OPEN |
| **P11-144** | Spell check and platform text services | P11-065 | Platform spell checking and text services in text inputs | Spell check works in the user's language, verified per platform | OPEN |
| **P11-145** | Platform sharing | P11-123 | Sharing content through the platform share mechanism | Sharing works to native targets, verified per platform | OPEN |
| **P11-146** | Calendar and contacts integration | P11-113 | Reading and writing platform calendar and contacts under permission | Platform data is accessed only under permission and within its declared purpose | OPEN |
| **P11-147** | Platform search integration | P11-126 | Making application content findable in the platform's own search | Application content appears in platform search where supported, verified per platform | OPEN |
| **P11-148** | Accessibility API integration | P11-231 | Correct exposure to platform accessibility APIs | The application exposes a correct accessibility tree on every platform, verified per platform | OPEN |
| **P11-149** | Platform integration testing | P11-113 | Testing OS integration on real machines per platform | Every integration is verified on real machines in CI, not only mocked | OPEN |
| **P11-150** | Stage E integration proof | P11-131 | A machine-lab suite exercising every OS integration on all three platforms | Every integration works on the reference machine set, and a regression is caught in CI | OPEN |

---

## 10. Stage F · Multi-window and desktop interaction (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-151** | Multi-window architecture | P11-025 | The UX-2 mechanism: several independent windows sharing state correctly | Two windows on one record stay consistent and neither blocks the other, proven by test | OPEN |
| **P11-152** | Window management | P11-151 | Creating, closing, focusing and arranging windows per platform convention | Window behaviour follows each platform's convention, verified per platform | OPEN |
| **P11-153** | Window state persistence | P11-030 | Position, size, monitor and layout restored across restart | Window layout restores exactly, including on a multi-monitor setup, proven by test | OPEN |
| **P11-154** | Multi-monitor support | P11-061 | Correct behaviour across monitors with different resolutions and scaling | Dragging a window between differently-scaled monitors renders correctly, verified | OPEN |
| **P11-155** | Detachable and tear-off views | P11-151 | Detaching a view into its own window and reattaching it | A detached view retains full function and state, proven by test | OPEN |
| **P11-156** | Tabbed windows | P11-152 | Tabs within windows where the platform expects them | Tab behaviour follows platform convention, verified per platform | OPEN |
| **P11-157** | Split views and panes | P11-071 | Side-by-side comparison and editing within a window | Two documents are comparable side by side with independent scroll, verified by exercise | OPEN |
| **P11-158** | Picking up work across windows | P11-103 | Moving a task between windows without losing state | A task moved between windows retains its exact state, proven by test | OPEN |
| **P11-159** | Always-on-top and floating utilities | P11-152 | Small always-available surfaces such as a timer or scanner input | A floating utility stays available without stealing focus, verified per platform | OPEN |
| **P11-160** | Keyboard shortcut system | P11-114 | The UX-3 mechanism: every action having a discoverable, rebindable shortcut | Every action has a shortcut, listed in one place, and rebindable, verified by audit | OPEN |
| **P11-161** | Command palette | P11-160 | A searchable command surface for every action | Every action is reachable from the palette; an action missing from it fails the gate | OPEN |
| **P11-162** | Keyboard-only operation | P11-160 | Complete operation without a pointer across every view | A full task completes without the mouse on every view kind, recorded as a test | OPEN |
| **P11-163** | Focus management across windows | P11-152 | Correct focus behaviour within and between windows | Focus moves predictably and is never lost, verified with a screen reader | OPEN |
| **P11-164** | Text editing conventions | P11-065 | Platform text editing shortcuts and selection behaviour | Every platform text shortcut behaves natively, verified per platform | OPEN |
| **P11-165** | Undo and redo | P11-094 | Application-wide undo with a stated scope and depth | Undo scope is declared per view and behaves consistently, verified per view kind | OPEN |
| **P11-166** | Bulk and power-user operations | P11-064 | Multi-select, bulk edit and keyboard-driven mass operations | A bulk operation on 1,000 records completes with per-record outcome reported | OPEN |
| **P11-167** | High-volume data entry | P11-065 | Keyboard-optimised entry with auto-advance, defaulting and validation timing | A 20-line document is entered without the mouse within the time budget, measured | OPEN |
| **P11-168** | Search and filter interaction | P11-041 | Fast, keyboard-driven search and filtering across large datasets | Search-as-you-type meets the interaction budget at desktop data scale, measured | OPEN |
| **P11-169** | Inline editing in tables | P11-064 | Spreadsheet-like editing with keyboard traversal and paste | Pasting tabular data maps correctly and reports what it could not map | OPEN |
| **P11-170** | Zoom and view scaling | P11-061 | Application-level zoom independent of OS scaling | Zoom to 200 % keeps every view usable without loss of content, verified | OPEN |
| **P11-171** | Customisable workspace | P11-071 | Saveable workspace layouts for different roles and tasks | A saved workspace restores exactly, including window arrangement, proven by test | OPEN |
| **P11-172** | Session and workspace switching | P11-171 | Switching between saved workspaces without losing work | A workspace switch preserves unsaved work in every window, proven by test | OPEN |
| **P11-173** | Pointer precision interactions | P11-070 | Hover, right-click, middle-click and precise drag interactions | Every pointer interaction has a keyboard equivalent, verified per interaction | OPEN |
| **P11-174** | Touch and pen input on desktop | P11-173 | Touch and stylus support on convertible devices | Touch and pen input work correctly on a convertible device, verified on hardware | OPEN |
| **P11-175** | Interaction performance | P11-018 | Input latency and scroll smoothness within budget | Input latency meets budget on the low-end machine under realistic data, measured | OPEN |
| **P11-176** | Stage F interaction proof | P11-162 | A suite asserting multi-window consistency, keyboard completeness and state restoration | Every guarantee holds, and an action missing a shortcut is caught immediately | OPEN |

---

## 11. Stage G · Desktop security (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-177** | Desktop threat model | P11-027 | The written threat model: local attacker, malicious file, hostile network, compromised update | Every identified threat maps to a control and a test that fails when the control is removed | OPEN |
| **P11-178** | Process sandboxing | P11-027 | Rendering and untrusted work sandboxed with least privilege | Sandboxed code cannot reach the file system or network directly, proven by an escape suite | OPEN |
| **P11-179** | Content isolation | P11-178 | Isolating any remote or user-supplied content from privileged code | Remote content cannot invoke a privileged operation, proven by test | OPEN |
| **P11-180** | Authentication architecture | P11-140 | Desktop authentication with tokens in the platform credential store | No token is stored outside the credential store, verified by inspection | OPEN |
| **P11-181** | Federated sign-in | P11-180 | SAML and OIDC through the system browser, never an embedded view | Credentials are never entered in an embedded view, verified by inspection | OPEN |
| **P11-182** | Multi-factor and step-up | P11-141 | MFA including platform authenticators, enforced for privileged actions | MFA cannot be bypassed by any authentication path, proven per path | OPEN |
| **P11-183** | Session lifetime and offline sessions | P11-180 | Session policy including offline session validity | An offline session operates for its declared window then degrades, proven against a controlled clock | OPEN |
| **P11-184** | Application lock | P11-141 | Locking on idle, sleep, lock-screen or explicit request | The application locks per policy and hides content from screenshots and previews | OPEN |
| **P11-185** | Sign-out and local data clearing | P11-081 | Sign-out clearing local data, with unsynced work handled explicitly | Sign-out with unsynced work warns; after sign-out no tenant data remains, verified | OPEN |
| **P11-186** | Shared and multi-user machine handling | P11-036 | Correct behaviour on machines shared between OS users | One OS user cannot read another's application data, proven by test | OPEN |
| **P11-187** | Local file permission model | P11-124 | Accessing only the files the user selects, with no ambient file access | The application cannot read outside granted paths, proven by an escape test | OPEN |
| **P11-188** | Untrusted file handling | P11-128 | Safely parsing and rendering files the user opens | A malicious file cannot execute code or escape the sandbox, proven by a corpus | OPEN |
| **P11-189** | Code signing | P11-006 | Signed binaries on every platform with verified provenance | Every shipped binary is signed and verifiable, checked at install and update | OPEN |
| **P11-190** | Notarisation and platform verification | P11-189 | macOS notarisation and equivalent platform verification | The application installs without a security warning on every platform, verified | OPEN |
| **P11-191** | Update security | P11-189 | Signed, verified updates that cannot be substituted | A tampered update is rejected, proven by test | OPEN |
| **P11-192** | Supply-chain integrity | P11-010 | SBOM, dependency pinning and build provenance attestation | An unattested or tampered dependency fails the build, proven on a seeded example | OPEN |
| **P11-193** | Network security and pinning | P11-139 | Transport security with pinning that respects enterprise interception policy | No plaintext connection is possible; enterprise interception is handled per policy | OPEN |
| **P11-194** | Protocol handler security | P11-033 | Validating custom protocol invocations against forgery | A forged protocol invocation cannot trigger a privileged action, proven by test | OPEN |
| **P11-195** | IPC security | P11-026 | Authenticated, validated inter-process communication | A forged IPC message is rejected, proven by test | OPEN |
| **P11-196** | Local server and port security | P11-025 | Any local listener bound minimally and authenticated | No local listener is reachable by another local process without authentication, proven by test | OPEN |
| **P11-197** | Memory safety and secret handling | P11-140 | Minimising secret residency in memory and clearing it | Secrets are cleared from memory after use, verified by inspection where the runtime permits | OPEN |
| **P11-198** | Anti-tamper and integrity checking | P11-189 | Detecting modification of the installed application | A tampered installation is detected at startup, proven by test | OPEN |
| **P11-199** | Screenshot and screen-sharing protection | P11-184 | Protecting sensitive content from capture where policy requires | A protected view is excluded from capture, verified per platform | OPEN |
| **P11-200** | Data loss prevention | P11-122 | Controlling copy, export and printing of restricted content | A DLP restriction blocks the restricted channel, verified per channel | OPEN |
| **P11-201** | Local log and diagnostic privacy | P11-014 | No personal data in local logs or diagnostic bundles | Logs and diagnostic bundles contain no personal data, verified by inspection | OPEN |
| **P11-202** | Enterprise security policy | P11-143 | Honouring enterprise security configuration | A managed security policy cannot be overridden by the user, proven by test | OPEN |
| **P11-203** | Vulnerability response for desktop | P11-192 | Detecting and shipping fixes for vulnerabilities in the shipped binary | A critical vulnerability reaches users within the stated window, verified by rehearsal | OPEN |
| **P11-204** | Privacy and telemetry consent | P11-016 | Consent-gated telemetry with no personal data | Declining telemetry results in zero telemetry transmission, verified by network inspection | OPEN |
| **P11-205** | Security testing for desktop | P11-177 | Automated security testing across binary, storage, IPC and file handling | Each attack class is tested and each succeeds the moment its control is removed | OPEN |
| **P11-206** | Stage G adversarial proof | P11-205 | An adversarial suite attempting sandbox escape, credential extraction, update substitution and malicious file execution | Every attempt fails, and each succeeds the moment its control is removed | OPEN |

---

## 12. Stage H · Performance and resource use (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-207** | Startup performance | P11-018 | Cold and warm start within budget on the low-end machine | Cold start meets budget on the low-end reference machine, measured | OPEN |
| **P11-208** | Time to interactive | P11-207 | Reaching a usable state quickly, before full sync completes | The application is usable before initial sync completes, measured | OPEN |
| **P11-209** | Idle resource use | P11-048 | Idle CPU and memory within budget when minimised or in the tray | Idle CPU stays within budget over an hour, measured | OPEN |
| **P11-210** | Memory management | P11-025 | Bounded memory across windows and long sessions | An 8-hour session with 10 windows shows no unbounded growth, measured | OPEN |
| **P11-211** | Memory per window | P11-151 | Bounded incremental cost of each additional window | The tenth window costs no more than the declared increment, measured | OPEN |
| **P11-212** | Frame rendering performance | P11-175 | Consistent target frame rate across scrolling, resizing and animation | No view drops below target frame rate on the low-end machine, measured | OPEN |
| **P11-213** | Large dataset rendering | P11-064 | Tables, trees and lists at desktop data scale | A 100,000-row table scrolls at target frame rate with inline editing, measured | OPEN |
| **P11-214** | Local query performance | P11-079 | Local database queries within budget at desktop volume | Local queries meet budget at fixture volume on the low-end machine, measured | OPEN |
| **P11-215** | Battery and thermal impact | P11-209 | The UX-5 mechanism: measured battery impact with an enforced budget | A feature exceeding its battery budget fails the gate, proven on a seeded regression | OPEN |
| **P11-216** | Background work discipline | P11-106 | Background sync and work within resource budget | Background work stays within its budget over a working day, measured | OPEN |
| **P11-217** | Computation offloading | P11-025 | Moving expensive work off the UI thread or process | Heavy computation never blocks the interface, verified by frame timing under load | OPEN |
| **P11-218** | Disk usage and I/O | P11-099 | Bounded disk usage and I/O with awareness of slow storage | Disk usage stays within budget; I/O does not saturate a slow disk, measured | OPEN |
| **P11-219** | Network efficiency | P11-108 | Minimising requests and payload, respecting metered connections | On a metered connection, non-essential transfer is deferred, verified by test | OPEN |
| **P11-220** | Installed and download size | P11-023 | Application size within budget per platform | Installed size stays within budget; a regression fails CI with its cause named | OPEN |
| **P11-221** | Asset and dependency size | P11-220 | Optimised assets and eliminated unused code | Unused components contribute zero bytes, verified by size analysis | OPEN |
| **P11-222** | Low-end machine support | P11-020 | Meeting every budget on the declared low-end machine | Every budget is met on the low-end machine, measured, not only on developer hardware | OPEN |
| **P11-223** | Poor-network performance | P11-108 | Usable behaviour on slow, high-latency and lossy connections | The application remains usable on the declared poor-network profile, verified under simulation | OPEN |
| **P11-224** | Offline performance | P11-083 | Full offline operation at the same interaction speed | Offline interaction meets the online budget, measured | OPEN |
| **P11-225** | Performance regression gates | P11-018 | CI gates on startup, memory, CPU, frame rate and size | A deliberately regressed build fails the gate; the gate has been proven able to fail | OPEN |
| **P11-226** | Performance observability in production | P11-017 | Field measurement of startup, memory, crashes and responsiveness | Field data covers every platform, OS version and machine class in use | OPEN |
| **P11-227** | Real machine performance lab | P11-020 | Continuous measurement on physical reference machines per platform | Benchmarks run on physical machines in CI, not only in virtual machines | OPEN |
| **P11-228** | Resource use transparency | P11-209 | Showing the user what the application is using and why | The user can see current resource use and its cause from within the application | OPEN |
| **P11-229** | Multi-window performance | P11-211 | Performance holding with many windows open | Ten open windows stay within the aggregate budget, measured | OPEN |
| **P11-230** | Stage H performance proof | P11-225 | A full performance run across platforms, machines and network conditions on real hardware | Every budget is met on every reference machine, and a seeded regression on any axis is caught | OPEN |

---

## 13. Stage I · Accessibility and internationalisation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-231** | Desktop accessibility architecture | P11-019 | Platform-level mechanisms making accessible output the default | An accessible outcome requires no per-view effort for standard patterns, proven per pattern | OPEN |
| **P11-232** | Platform accessibility API exposure | P11-148 | Correct accessibility tree on Windows, macOS and Linux | The application exposes a correct tree on every platform, verified with each platform's inspector | OPEN |
| **P11-233** | Screen reader support | P11-232 | Full operation with NVDA, JAWS, VoiceOver and Orca | Every view is operable with each supported screen reader, recorded per combination | OPEN |
| **P11-234** | Keyboard accessibility | P11-162 | Complete keyboard operation including menus, dialogs and windows | Every view and window is fully keyboard-operable, verified by audit | OPEN |
| **P11-235** | Focus visibility and traversal | P11-163 | Visible focus and logical traversal order across every view and window | Focus is always visible and order matches visual order, verified by audit | OPEN |
| **P11-236** | Dynamic content announcement | P11-233 | Announcing loading, results, errors and sync state changes | Every asynchronous outcome is announced once, verified with each screen reader | OPEN |
| **P11-237** | OS text scaling and zoom | P11-170 | Usability at OS text scaling and application zoom without loss | Every view is usable at maximum OS text scale, verified across the estate | OPEN |
| **P11-238** | Contrast and high-contrast modes | P11-058 | Contrast enforced and platform high-contrast modes honoured | Contrast passes on every theme; platform high-contrast renders correctly per platform | OPEN |
| **P11-239** | Colour independence | P11-238 | Information never conveyed by colour alone | A colour-only information pattern fails a gate, proven on a seeded example | OPEN |
| **P11-240** | Motion and reduce-motion | P11-072 | Respecting OS reduce-motion settings | Every animation respects the OS setting, verified per platform | OPEN |
| **P11-241** | Alternative input support | P11-234 | Voice control, switch access and eye tracking where the platform supports it | The application is operable by platform voice control, verified per platform | OPEN |
| **P11-242** | Accessible tables and grids | P11-064 | Screen-reader-navigable tables with correct roles and announcements | A 100,000-row table is navigable and comprehensible with a screen reader, recorded as a test | OPEN |
| **P11-243** | Accessible dialogs and menus | P11-114 | Correct roles, focus and announcements for menus, dialogs and context menus | Every menu and dialog is operable and announced correctly, verified per platform | OPEN |
| **P11-244** | Accessible multi-window navigation | P11-163 | Moving between windows with assistive technology | Window switching is announced and operable with each screen reader, verified | OPEN |
| **P11-245** | Automated accessibility gates | P11-019 | CI gates preventing accessibility regressions | A seeded violation fails CI; the gate has been proven able to fail | OPEN |
| **P11-246** | Accessibility conformance reporting | P11-233 | Conformance reports generated from real audit results | The report is generated from audit data and cannot claim untested conformance | OPEN |
| **P11-247** | Internationalisation architecture | P11-043 | Locale resolution, message loading and formatting on desktop | A locale change applies without restart, proven by test | OPEN |
| **P11-248** | System locale integration | P11-247 | Following the OS locale, region and format settings | The application follows OS locale settings by default, verified per platform | OPEN |
| **P11-249** | Message extraction and hardcoded-string detection | P11-247 | Extracting translatable strings and detecting hardcoded ones | A hardcoded user-facing string fails the gate, proven on a seeded example | OPEN |
| **P11-250** | Formatting and pluralisation | P11-248 | Locale-correct numbers, currency, dates and plural rules | Formatted values match locale expectations, verified per locale | OPEN |
| **P11-251** | Right-to-left layout | P11-062 | Complete RTL layout and mirroring including window chrome and menus | Every view and menu renders correctly in RTL, verified across the estate | OPEN |
| **P11-252** | Input method support | P11-144 | Correct behaviour with composition-based input methods | Composition input works correctly in every text field, verified per platform | OPEN |
| **P11-253** | Font and script coverage | P11-060 | Fonts covering every supported script with correct fallback | Every supported script renders without fallback boxes, verified per script | OPEN |
| **P11-254** | Stage I reach proof | P11-245 | A full audit across every view, locale, text scale, RTL and every supported screen reader | The estate passes automated and manual review on all three platforms, and a seeded regression is caught | OPEN |

---

## 14. Stage J · Feature coverage and parity (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-255** | Parity model | P11-024 | The declared parity position: what desktop does, what it deliberately does not, and why | Every capability is classified as full, partial-by-design or absent-by-design; unclassified is a defect | OPEN |
| **P11-256** | Desktop-first workflow identification | P11-255 | Identifying the work that genuinely belongs on desktop | Each desktop workflow is justified by real usage context, recorded | OPEN |
| **P11-257** | Core ERP module coverage | P11-255 | The modules a desktop user needs, at full capability | Every declared module works fully, verified per module | OPEN |
| **P11-258** | High-volume data entry workflows | P11-167 | The workflows desktop exists for: bulk entry, reconciliation, close | A high-volume workflow completes faster on desktop than in the browser, measured | OPEN |
| **P11-259** | Reconciliation and comparison workflows | P11-157 | Side-by-side comparison and matching that needs screen space | A reconciliation is completed with both sides visible, verified by exercise | OPEN |
| **P11-260** | Reporting and analysis on desktop | P11-066 | Large reports, drill-through and export at desktop scale | A large report renders and exports within budget, measured | OPEN |
| **P11-261** | Document-heavy workflows | P11-128 | Working with local documents, attachments and generated output | A document workflow completes with local file integration, verified by exercise | OPEN |
| **P11-262** | Bulk import and export | P11-124 | Local file import and export at volume with mapping and validation | A large import completes with per-row diagnostics and rollback, proven by test | OPEN |
| **P11-263** | Point-of-sale and counter operation | P11-130 | Counter operation with peripherals, offline-capable | A full sale completes offline with printing and payment device, verified on hardware | OPEN |
| **P11-264** | Warehouse desktop operations | P11-131 | Desk-based warehouse operation with scanners and label printing | A warehouse operation completes with scanner and label printer, verified on hardware | OPEN |
| **P11-265** | Period close and month-end workflows | P11-259 | The close, which is a desktop workflow by nature | A period close is completed on desktop, verified by exercise | OPEN |
| **P11-266** | Approval and review workflows | P11-151 | Reviewing and approving with full context across windows | An approval is completed with the source document open beside it, verified by exercise | OPEN |
| **P11-267** | Administration from desktop | P11-255 | Administrative capability where it belongs on desktop | Every declared administrative capability works, verified per capability | OPEN |
| **P11-268** | Capability gap reporting | P11-255 | Surfacing when a task requires another client, with a handoff | An unavailable capability explains itself and offers a handoff, never a dead end | OPEN |
| **P11-269** | Cross-client handoff | P11-268 | Moving a task between desktop, web and mobile without losing context | A handoff resumes the exact task context on the other client, proven by test | OPEN |
| **P11-270** | Parity verification | P11-255 | Automated verification that declared parity matches reality | A capability declared present but absent fails the parity gate, proven on a seeded example | OPEN |
| **P11-271** | Feature usage measurement | P11-226 | Which desktop capabilities are actually used, informing investment | Usage is measured per capability and per role, from real events | OPEN |
| **P11-272** | Desktop workflow optimisation | P11-271 | Optimising the highest-volume desktop workflows for speed | The top workflows meet their task-completion time budget, measured | OPEN |
| **P11-273** | Cross-platform behaviour consistency | P11-075 | Consistent behaviour across the three platforms except where convention demands otherwise | Every behavioural divergence is recorded and justified, verified by audit | OPEN |
| **P11-274** | Stage J coverage proof | P11-270 | A suite executing every declared desktop workflow end to end on all three platforms | Every declared workflow completes on every platform, and a false parity claim is caught | OPEN |

---

## 15. Stage K · Packaging, distribution and update (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-275** | Build and packaging pipeline | P11-006 | Reproducible, signed packages for all three platforms from CI | Two builds of one commit produce identical artefacts, verified by hash | OPEN |
| **P11-276** | Windows packaging | P11-275 | MSI or MSIX installer with correct registration and per-user or per-machine install | The installer installs, upgrades and uninstalls cleanly, verified on reference machines | OPEN |
| **P11-277** | macOS packaging | P11-275 | Signed, notarised application bundle and installer | The application installs and launches with no security warning, verified | OPEN |
| **P11-278** | Linux packaging | P11-275 | Packages for the declared distributions plus a portable format | Each declared package format installs and runs correctly, verified per distribution | OPEN |
| **P11-279** | Signing key management | P11-189 | Secure key storage, rotation and recovery across all three platforms | Signing keys are never accessible to an individual and their loss is recoverable, verified by rehearsal | OPEN |
| **P11-280** | Clean install and uninstall | P11-276 | Installing and uninstalling leaving no residue beyond declared user data | Uninstall leaves no file, registry entry or service behind, verified by inspection | OPEN |
| **P11-281** | Silent and enterprise deployment | P11-143 | Unattended installation with configuration for managed environments | A silent, preconfigured deployment succeeds, verified in a managed environment | OPEN |
| **P11-282** | Distribution channels | P11-276 | Direct download plus platform stores where appropriate | Each channel distributes correctly, verified per channel | OPEN |
| **P11-283** | Store distribution and compliance | P11-282 | Microsoft Store, Mac App Store and Linux stores where the sandbox permits | A store build passes review, and any capability lost to sandboxing is recorded | OPEN |
| **P11-284** | Auto-update infrastructure | P11-191 | Signed, verified, differential updates on all three platforms | An update downloads, verifies and applies correctly, verified per platform | OPEN |
| **P11-285** | Update scheduling and user control | P11-284 | Updating without interrupting work, with user control over timing | An update never interrupts an active task, verified by exercise | OPEN |
| **P11-286** | Update work preservation | P11-094 | The UX-6 mechanism: an update never loses unsaved or unsynced work | An update applied with unsaved work in every window loses nothing, proven by test | OPEN |
| **P11-287** | Update rollback | P11-284 | Reverting a bad update on the user's machine | A failed update rolls back to the working version automatically, proven by injection | OPEN |
| **P11-288** | Staged rollout | P11-284 | Progressive release with health gates | A rollout halts automatically on a health regression, proven by injection | OPEN |
| **P11-289** | Release health monitoring | P11-226 | Comparing a new version's crash rate and performance against its predecessor | A regressing release is detected from field data within the stated window | OPEN |
| **P11-290** | Forced update and minimum version | P11-045 | Forcing users off a broken or insecure version | A broken version can be forced to update, verified by rehearsal | OPEN |
| **P11-291** | Offline and air-gapped installation | P11-281 | Installing and updating without internet access | An air-gapped install and update succeed, verified in an isolated environment | OPEN |
| **P11-292** | Version support and deprecation | P11-007 | Declared support windows for application and OS versions | An unsupported version prompts to update rather than failing obscurely | OPEN |
| **P11-293** | Release notes and communication | P11-289 | Release notes generated from the actual change set, localised | Release notes derive from the diff and cannot be hand-invented, verified by generation | OPEN |
| **P11-294** | Stage K release proof | P11-288 | A full release rehearsal on all three platforms: build, sign, distribute, update, roll back | The complete cycle is rehearsed on every platform with the rollback exercised | OPEN |

---

## 16. Stage L · Testing and production readiness (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P11-295** | Coverage that can fail | P11-021 | Coverage across the desktop application with real thresholds and a ratchet | Deleting a test lowers the number and fails the gate. The threshold has been proven to fail | OPEN |
| **P11-296** | Unit and component testing | P11-295 | Unit coverage of the sync engine, queue, local store, IPC and state model | Each engine meets threshold with tests that fail when it is deliberately broken | OPEN |
| **P11-297** | Visual regression testing | P11-078 | Golden-image comparison across components, themes, densities and all three platforms | A visual regression fails CI; the suite is proven able to fail on a seeded change | OPEN |
| **P11-298** | Integration testing with a real API | P11-011 | Integration suites against a real API rather than mocked responses | The suite runs against a real API in CI; a mock-only pass is caught | OPEN |
| **P11-299** | Contract testing | P11-011 | Consumer-driven contract tests against the API | A breaking API change fails before it reaches the application, proven on a seeded change | OPEN |
| **P11-300** | End-to-end testing on real machines | P11-227 | Automated end-to-end journeys on physical machines per platform | Each journey runs on real machines and fails when any step regresses | OPEN |
| **P11-301** | Multi-window and lifecycle testing | P11-176 | Testing window management, restoration, sleep, wake and forced termination | State and unsaved work survive every injection point, proven exhaustively | OPEN |
| **P11-302** | Offline and sync testing | P11-112 | Deterministic testing of offline operation, queueing, sync and conflict | No action lost or duplicated across 1,000 interrupted cycles, proven repeatedly | OPEN |
| **P11-303** | OS integration testing | P11-150 | Testing menus, files, printing, peripherals and credentials on real hardware | Every OS integration is verified on real machines in the lab | OPEN |
| **P11-304** | Platform and OS version matrix testing | P11-007 | Testing across every supported OS version, distribution and architecture | Every supported combination passes; an unsupported one degrades explicitly | OPEN |
| **P11-305** | Accessibility testing, automated and manual | P11-254 | Automated scanning plus manual verification with every supported screen reader | The estate is clean automatically and passes manual review on all three platforms | OPEN |
| **P11-306** | Performance and resource testing | P11-230 | Automated performance, memory and battery measurement on physical machines | Every budget is met on reference machines; a regression fails CI | OPEN |
| **P11-307** | Security testing | P11-206 | Automated desktop security testing plus a penetration exercise | Every finding is remediated or explicitly accepted, and each remediation has a failing-without-it test | OPEN |
| **P11-308** | Installation and update testing | P11-294 | Testing install, upgrade, downgrade, rollback and uninstall on every platform | Every path leaves a working or cleanly removed installation, verified per platform | OPEN |
| **P11-309** | Soak and endurance testing | P11-210 | Multi-day sessions with many windows and background operation | A working week of continuous use shows no leak, drift or resource breach | OPEN |
| **P11-310** | The justification proof | P11-024 | The § 1 invariant made mechanical: every declared desktop-only capability tested against the web client | Every capability the browser can do equally well is removed or its justification recorded. An unjustified capability fails the gate | OPEN |
| **P11-311** | Cross-client consistency verification | P11-269 | Verifying behaviour and data consistency across desktop, web and mobile | The three clients agree on identical inputs, verified differentially | OPEN |
| **P11-312** | Programme 11 launch readiness | P11-310 | The final review: every exit criterion below evidenced by a command and its output, including its output when broken | Every box in § 17 is ticked with evidence. An unticked box blocks completion | OPEN |

---

## 17. Programme exit criteria

- [ ] **Every desktop-only capability is tested against the web client; one the browser does equally well is removed or justified** (P11-024, P11-310)
- [ ] The technology decision is recorded with both candidates measured and its falsification condition stated (P11-002)
- [ ] All three platforms build, test and sign on every commit; two builds of one commit are identical (P11-006, P11-275)
- [ ] Rendering code cannot reach the file system or network directly (P11-027, P11-178)
- [ ] No action is lost or duplicated across 1,000 interrupted sync cycles (P11-112, P11-302)
- [ ] Unsaved work survives forced termination, sleep, wake and update (P11-094, P11-286, P11-301)
- [ ] Disk pressure evicts synced data only; unsynced work is never evicted (P11-099)
- [ ] Two windows on one record never disagree after a mutation (P11-103)
- [ ] Local data is encrypted; no credential is stored outside the platform credential store (P11-081, P11-140)
- [ ] Credentials are never entered in an embedded view (P11-181)
- [ ] Sandbox escape, credential extraction, update substitution and malicious file execution all fail (P11-206)
- [ ] A tampered update or installation is detected and rejected (P11-191, P11-198)
- [ ] Every action has a discoverable, rebindable shortcut, and every view is keyboard-complete (P11-160, P11-162)
- [ ] Window layout restores exactly, including on multi-monitor setups (P11-153, P11-154)
- [ ] Menus, dialogs and file pickers are the platform's own on every platform (P11-114, P11-124)
- [ ] Every budget — startup, idle CPU, memory, size, battery — is met on the low-end reference machine (P11-222, P11-230)
- [ ] Every view is operable with NVDA, JAWS, VoiceOver and Orca (P11-233, P11-305)
- [ ] Every view renders correctly in RTL; a hardcoded string fails CI (P11-249, P11-251)
- [ ] Every OS integration is verified on real hardware in CI (P11-150, P11-303)
- [ ] Install, upgrade, rollback and uninstall leave a working or cleanly removed installation (P11-280, P11-308)
- [ ] Declared parity matches reality; a false parity claim fails the gate (P11-255, P11-270)
- [ ] Coverage thresholds have been proven able to fail (P11-295)
- [ ] Zero hardcoded colours or dimensions; components come from the shared tokens (P11-054, P11-063)

---

## 18. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | **Programme 11 established (P11-001–P11-312), the Windows, macOS and Linux applications.** Registered per README § 0 rule 1. **This is genuine greenfield and the document says so**: `ls -d unierp-*/src-tauri unierp-*/electron` returns nothing, there is no desktop code anywhere in the family, and Track I — which owns desktop — is 0/18. The consequence is faced in `P11-002` rather than assumed: the technology decision between a web-technology shell and native is made first, in the open, with both candidates prototyped and measured on binary size, memory, startup and integration depth, and with the falsification condition recorded. The § 1 invariant is that the application must earn its existence — `P11-024` registers every capability claimed as desktop-only with its browser comparison, and `P11-310` tests each against the web client, because a desktop application that is a browser in a frame is a maintenance burden with a splash screen. | Claude Code |
