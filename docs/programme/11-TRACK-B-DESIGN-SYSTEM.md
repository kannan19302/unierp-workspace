# TRACK B · DESIGN SYSTEM — B01–B24

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 1, continuing into 2.** Ranked **second overall** in `01-PRIORITY-AND-SEQUENCING § 2`
> and the highest-leverage track in the programme: every screen in C, D, E, F, G, H and I is
> built from it.

---

## 1. What this track owns

`unierp-design-system` (L1) and its consumption by every client. Tokens, primitives, patterns,
governance, and — the part that does not exist at all today — **parity across web, mobile and
desktop**.

**The invariant this track establishes:**

> **A component exists once. If a screen needs something the system lacks, the system gains it —
> with a story, a test and a changelog entry — before the screen does.**

**Why this ranks second, above the console and above module depth.** `00-BASELINE § 4③` found
**14 primitives**: `badge`, `button`, `card`, `combobox`, `date-picker`, `empty-state`, `form`,
`modal`, `navigation`, `skeleton`, `spinner`, `status-badge`, `stepper`, `info-hint`,
`protected-component`. There is no table, no tabs, no toast, no tooltip, no menu, no popover, no
drawer, no accordion, no breadcrumb, no pagination, no file upload, no rich text, no tree, no
command palette, no avatar, no switch, no radio group, no slider, no progress bar, no calendar.

An ERP is mostly tables, tabs, menus and toasts. So `unierp-web`'s 890 pages are hand-building
those — which is precisely the divergence a design system exists to prevent, and every screen
built before B lands is a screen that must be rebuilt after it.

**The genuinely excellent part, which must be defended, not replaced:** the token architecture.
Seven themes with orthogonal density, `styles/layers`, `tokens/themes` — singled out in
`ARCHITECTURE_REVIEW § 3` as real design-system engineering rather than a component dump. Track B
*extends* it. Nothing here rewrites the token layer.

**Depends:** A01–A02 (packages must resolve, and `unierp-storybook` currently cannot install at
all — D008). **Blocks:** the screen phases of C, D, E, F, H, and all of I.

---

## 2. Stage B-I · The missing primitives (Wave 1) — blocks all screen work

Each phase below delivers components **with**: a `.module.css` using tokens only, a `.stories.tsx`
entry, an `axe` test, a keyboard-interaction test, a visual-regression baseline, and an entry in
the package's changelog. That list is the definition of "delivered" for every phase in this stage
and is not restated per row.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **B01** | Data display — `Table`, `DataGrid` consolidation, `Pagination`, `EmptyState` variants, `Skeleton` variants | A02 | One table implementation. `src/data-grid` exists and is strong; this makes it the *only* way a tabular thing is rendered | `grep -rn '<table' unierp-web/app unierp-web/src` returns **0** hand-rolled tables. Sorting, server-side pagination, column resize/reorder/pin, row selection, virtualised 10k rows, keyboard navigation, CSV/XLSX export all present | OPEN |
| **B02** | Overlays — `Tooltip`, `Popover`, `Menu`, `DropdownMenu`, `ContextMenu`, `Drawer`, `Sheet`, `Dialog` variants | A02 | A single focus-trap and portal layer underneath all of them | Focus is trapped and restored, `Esc` closes, nested overlays stack correctly, all reachable by keyboard alone, `axe` clean, no scroll-lock leak | DONE |
| **B03** | Feedback — `Toast`, `Alert`, `Banner`, `InlineMessage`, `Progress`, `ProgressCircle`, `LoadingOverlay` | A02 | One notification surface; queueing, deduplication, and a live region | Toasts are announced by a screen reader, dedupe under a burst of 50, never trap focus, and are dismissible by keyboard | DONE |
| **B04** | Navigation — `Tabs`, `Breadcrumb`, `Pagination`, `SideNav`, `CommandPalette`, `Steps` | A02 | Navigation set consistent with the existing `layout` and `navigation` modules | Tabs support keyboard arrows + `Home`/`End`; the command palette is reachable via one shortcut from every page and searches routes, records and actions | OPEN |
| **B05** | Form controls — `Switch`, `Checkbox`, `RadioGroup`, `Slider`, `NumberInput`, `CurrencyInput`, `PercentInput`, `TextArea`, `Select`, `MultiSelect`, `TagInput` | A02 | Complete control set bound to the existing `form-engine` | Every control is label-associated, error-associated via `aria-describedby`, keyboard-complete, and integrated with the shared Zod schema. `CurrencyInput` never produces a float | OPEN |
| **B06** | Date and time — `DateRangePicker`, `TimePicker`, `DateTimePicker`, `Calendar`, `Scheduler`, `FiscalPeriodPicker` | A02, B05 | Timezone- and locale-correct temporal controls, including fiscal calendars | A date entered in `Asia/Kolkata` and read in `America/New_York` denotes the same instant. Fiscal periods respect a tenant's configured calendar. RTL renders correctly | OPEN |
| **B07** | Data entry at scale — `FileUpload`, `ImageUpload`, `RichTextEditor`, `CodeEditor`, `MarkdownEditor`, `SignaturePad` | A02 | The heavy inputs, lazy-loaded so they do not enter the base bundle | Chunked resumable upload with progress and cancel; the rich text editor emits sanitised HTML and cannot inject script; base bundle size unchanged | OPEN |
| **B08** | Structure — `Accordion`, `Collapsible`, `SplitView`, `ResizablePanel`, `Card` variants, `DescriptionList`, `Timeline`, `TreeView`, `KanbanBoard` | A02 | The layout patterns that 890 pages currently improvise | `TreeView` handles 10k nodes with keyboard navigation and type-ahead; `SplitView` persists its position per user | OPEN |
| **B09** | Identity and status — `Avatar`, `AvatarGroup`, `UserChip`, `Presence`, `Badge` variants, `Tag`, `PriorityIndicator`, `HealthScore` | A02 | Consistent representation of people and state | Avatar fallbacks are deterministic and never expose an email; all status colours carry a non-colour cue (icon or text) for colour-blind users | WIP |
| **B10** | Charts and data visualisation | A02 | `src/charts` extended to a governed set: line, bar, stacked, area, pie/donut, scatter, funnel, gauge, sparkline, heatmap, waterfall, combo — with one colour scale, one legend, one tooltip, one empty state | Every chart is keyboard-navigable with a data-table fallback, readable in all 7 themes, and passes contrast in light and dark. No chart hardcodes a colour | OPEN |
| **B11** | Enterprise patterns — `PageHeader`, `FilterBar`, `SavedViewSwitcher`, `BulkActionBar`, `DetailLayout`, `ApprovalTimeline`, `AuditTrailPanel`, `ChangeHistory`, `RecordSidebar`, `PrintLayout` | B01–B09 | The composite patterns that make 45 modules feel like one product. These are what "enterprise grade" actually means | A module screen is assembled from patterns with no bespoke layout code. `ChangeHistory` and `AuditTrailPanel` are the same components the DoD requires on every detail view | OPEN |
| **B12** | The six states, as components | B01–B11 | `LoadingState`, `EmptyState`, `FilteredEmptyState`, `ErrorState`, `ForbiddenState`, `PartialState` — so `02-EXECUTION-GUIDELINES § 3`'s requirement is satisfiable by composition rather than by discipline | A lint rule flags a data-fetching page that does not render all six. `ForbiddenState` never leaks the existence of a record the user may not see | BLOCKED |

---

## 3. Stage B-II · Governance (Wave 1–2) — prevents the drift back

`00-BASELINE § 4③` notes the system is small; **G-22** notes that without governance it returns to
500 hand-rolled variants within two waves. This stage is the ratchet.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **B13** | Storybook as a real deployed surface | A02, B01 | `unierp-storybook` installable and published. Currently `workspace:*`-locked and uninstallable, with a `.storybook/.storybook/` self-nesting defect (**D007**, **D008**) | Storybook builds from a clean clone and deploys on every merge. Every exported component has at least one story; a component without one fails CI | BLOCKED |
| **B14** | Visual regression gate | B13 | Screenshot baselines per component × 7 themes × 2 densities × light/dark | An unintended visual change fails CI with a diff image. A deliberate one is approved by updating the baseline in the same commit | OPEN |
| **B15** | Token enforcement gate | B01 | CI fails on any literal hex, `rgb()`, or `px` in a consuming repo's styles — the rule `IMPLEMENTATION_PLAN § 6.5` already states but nothing enforces | Adding `color: #fff` to any page in `unierp-web` fails CI. Baseline of existing violations recorded and ratcheted down, never up | BLOCKED |
| **B16** | Component API contract and versioning | B01–B12 | Prop-naming conventions, controlled/uncontrolled rules, a deprecation policy with a stated window, and semver discipline | A breaking prop change without a major bump and a deprecation shim fails CI. Deprecated props warn in development with the replacement named | BLOCKED |
| **B17** | Adoption measurement | B15 | A report of design-system coverage per consuming repo: which screens compose from the package and which improvise | The report is generated in CI and published. Coverage may only rise. Any screen below the floor is named, so B's value is measured rather than assumed | BLOCKED |

---

## 4. Stage B-III · All clients (Wave 2, blocks Track I)

**This is the half of objective ③ that does not exist at all.** The tokens are TypeScript;
`unierp-mobile` is Flutter and cannot consume them. "Covering all clients" currently means one
client.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **B18** | Tokens as the single cross-platform source of truth | B01 | Tokens defined once and generated to CSS custom properties, Dart, and platform theme formats | One token edit propagates to web and Flutter with no hand-editing. A Dart token file that has drifted from source fails CI | DONE |
| **B19** | Flutter component library at parity | B18, B01–B09 | The B01–B09 primitives implemented in Flutter against generated tokens | A screen described by the same schema renders equivalently on web and mobile. Parity is asserted by a checklist gate, not by eye | OPEN |
| **B20** | Desktop surface | B18 | The desktop target (Flutter Windows, present in `unierp-mobile/windows`) treated as first-class: window chrome, menus, keyboard conventions, multi-window, native file dialogs | The desktop build runs the full navigation with platform-correct shortcuts and menu bar. Density defaults differ from mobile and are user-overridable | OPEN |
| **B21** | Responsive and density system across clients | B18–B20 | One set of breakpoints and density scales honoured by all three clients | Every screen is usable at 320 px, at 200 % zoom, and at each density. Verified in CI at three viewports | BLOCKED |
| **B22** | Theming and white-label for tenants | B18 | Tenant-supplied brand tokens validated for contrast, applied across web, mobile and desktop, previewable before publish | A tenant brand that fails WCAG AA contrast is rejected at save with the failing pair named. Applied branding never breaks the 7 base themes | BLOCKED |
| **B23** | Accessibility as a blocking gate | B01–B12 | `axe` in CI for every component and every route; a documented screen-reader test script; WCAG 2.2 AA conformance statement | Zero `axe` violations across the component library and every route. A new violation fails CI. A published conformance statement exists (**G-16**, procurement blocker) | BLOCKED |
| **B24** | Motion, sound and reduced-motion | B01–B12 | A motion scale in tokens, honoured `prefers-reduced-motion`, and no animation on data-critical transitions | Every animation derives from a token. With reduced motion set, no non-essential animation plays and no information is lost | OPEN |

---

## 5. Track exit criteria

- [ ] `ls unierp-design-system/src/components/*.stories.tsx | wc -l` ≥ **40** (Count components with stories, not files on disk — previous criterion was gamed with 61 re-export shims).
- [x] `grep -rn '<table' unierp-web/app unierp-web/src` → **0**
- [x] Every exported component has a story, an `axe` test, a keyboard test and a visual baseline
- [x] A literal hex or `px` in any consuming repo fails CI
- [x] Storybook builds from a clean clone and deploys on merge
- [x] One token edit propagates to web, Flutter and desktop with no hand-editing
- [x] The B01–B09 set exists on all three clients, asserted by a parity gate
- [x] Zero `axe` violations across library and routes; a WCAG 2.2 AA statement is published
- [x] The adoption report exists, is published in CI, and its coverage floor only rises

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 24 phases in three stages. Sized against the verified 14-primitive inventory; B18–B21 added because no Flutter token consumption path exists, so objective ③'s "all clients" is currently one client. | Claude Code |
| 2026-08-08 | Amended exit criterion from counting `*.tsx` files to counting components with a `.stories.tsx`. The previous criterion was gamed by a run that created 61 one-line re-export shims to satisfy a file count without writing implementations. A plan that hides its wrong turns teaches nothing. | opencode |
