# TRACK I · MOBILE, DESKTOP AND CLIENT PARITY — I01–I18

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Wave 5.** The other half of brief objective ③ ("covering all clients"). Ranked **tenth** —
> deliberately late, because parity with an incomplete thing must be built twice.

---

## 1. What this track owns

`unierp-mobile` (L5) — Flutter, with **Android, iOS and Windows** targets present — and the
desktop experience. Plus the cross-client contract: what "parity" means, and how it is asserted
rather than assumed.

**The invariant this track establishes:**

> **A schema-declared screen renders on every client without a client-specific authoring step.**

That is the payoff of the schema-driven framework. Where a client genuinely differs — a camera, a
barcode scanner, an offline queue, a keyboard shortcut — the difference is **declared and logged**,
not discovered.

### Starting position

`00-BASELINE § 3` — `unierp-mobile` is **810 source files** in `lib/{app,core,features}` with
`main.dart`, `main_prod.dart`, `main_staging.dart`, and `android`, `ios`, `windows`, `web` targets.
That is a substantial real client.

Two problems define this track:

1. **The design system does not reach it.** The tokens are TypeScript; Flutter cannot consume them
   (`00-BASELINE § 4③`). "Covering all clients" currently means one client. **B18–B21 is the
   hard prerequisite** — without it, every Flutter screen hardcodes what web derives from tokens,
   and the divergence is permanent.
2. **The repo root carries repair debris** — 11 one-off scripts (`fix_router.py` through
   `fix_router_5.py`, `auto_fix_router.py`, `revert_script.py`, `specific_remover.py`,
   `restore.py`, `gen_batch1.ps1`, `generate.ps1`) and 3 error dumps (`full_analyze.txt`,
   `remaining_errors.txt`, `missing_controllers.txt`) — **D006**. Those names describe a period of
   automated mass-repair, which is exactly the history that makes an independent correctness pass
   (I02) worth doing before adding features.

**Depends:** **B18–B21 (hard)**, E module depth (parity with an incomplete module is wasted).
**Blocks:** nothing.

---

## 2. Stage I-I · Make the mobile client trustworthy (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **I01** | Mobile repo hygiene and CI | A14 | The 11 repair scripts and 3 error dumps removed; `mobile-ci.yml` running analyse, test, and build for all three platforms as blocking steps | `git ls-files` matches an allowlist. `flutter analyze` exits 0 with no baseline suppressions. CI builds Android, iOS and Windows artefacts (**D006**) | OPEN |
| **I02** | Mobile correctness pass | I01 | An independent review of the routing and controller layer that the `fix_router*.py` history touched, with tests for what those scripts changed | Every route resolves to a real screen; every controller referenced in `missing_controllers.txt` either exists or its route is removed. No silent dead route | OPEN |
| **I03** | Mobile test foundation | I01 | Widget, integration and golden tests with an enforced coverage threshold — the mobile equivalent of A06 | Coverage threshold enforced in `mobile-ci.yml`; deleting a test fails the build. Golden tests cover the primitives from B19 | OPEN |
| **I04** | Token and theme adoption | B18, B19 | Generated Dart tokens consumed throughout; every hardcoded colour, spacing and type value removed | A hardcoded `Color(0x...)` or raw padding value fails `flutter analyze` via a custom lint. All 7 themes and both densities render | OPEN |
| **I05** | Schema-driven rendering on mobile | B19, I04 | The `@kannan19302/framework` schema interpreted by the Flutter client, so a module's list/detail/form comes from the same declaration web uses | A module screen added on web appears on mobile with **no** Dart written for it. This is the phase that makes parity sustainable | OPEN |
| **I06** | Navigation, deep links and app shell | I05, B04 | Unified navigation, deep linking into any record, universal links, and state restoration | A notification deep-links to the exact record and restores after a cold start | OPEN |

---

## 3. Stage I-II · What mobile is actually for (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **I07** | Offline architecture | I05 | Local store, mutation queue, sync engine, conflict detection and resolution, and explicit conflict UI — designed once, not per feature | A field technician completes a full day's work offline; on reconnect every change syncs, and conflicts are surfaced for resolution rather than silently lost | OPEN |
| **I08** | Offline-capable modules | I07, E25, E19 | The modules where offline is the requirement rather than a bonus: field service, POS, inventory count, timesheets, inspections, delivery | Each works fully offline with reconciled sync. POS reconciles a shift with no double-posting | OPEN |
| **I09** | Device capabilities | I05 | Camera, barcode and QR scanning, GPS, geofencing, biometrics, file access, printing, NFC — behind a capability abstraction with graceful degradation | A stock count via barcode scan works on Android and iOS; on desktop the same screen offers manual entry rather than failing | OPEN |
| **I10** | Push notifications | A21, I06 | Native push integrated with the unified notification engine, honouring D06 preferences and supporting the MFA push approval flow already in `unierp-web/app/mfa-push-sw` | A notification respects quiet hours, deep-links correctly, and MFA push approval completes on mobile | OPEN |
| **I11** | Mobile security | A24, D22 | Biometric unlock, secure storage, certificate pinning, jailbreak/root detection, screenshot policy, remote wipe, and enforced session policy | A tenant's MFA and session policy are enforced on mobile identically to web. Credentials are provably not in plain storage | OPEN |
| **I12** | Mobile performance and battery | I05, I07 | Startup, scroll and sync budgets; battery and data-usage measurement on low-end devices | Cold start and list-scroll budgets met on a low-end Android device, measured in CI on a device farm or emulator matrix — not on a developer's flagship | OPEN |
| **I13** | Mobile accessibility | B23, I04 | Screen-reader support (TalkBack, VoiceOver), dynamic type, contrast, touch-target sizes, and reduced motion | Every screen is navigable by screen reader; text scales to the OS maximum without truncation or overlap | OPEN |
| **I14** | Store readiness and release pipeline | I01, I11 | Signing, store listings, privacy declarations, phased rollout, crash reporting, and forced-upgrade handling | A release reaches both stores through an automated pipeline, with a rehearsed rollback and a working forced-upgrade path | OPEN |

---

## 4. Stage I-III · Desktop and the parity contract (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **I15** | Desktop application | B20, I05 | The Windows target as a first-class client: window management, native menus, keyboard conventions, multi-window, native file dialogs, tray | The desktop build runs the full navigation with platform-correct shortcuts and a native menu bar. Density defaults differ from mobile and are user-overridable | OPEN |
| **I16** | Desktop-specific productivity | I15, B04, E40 | What desktop is *for*: dense grids, multi-record editing, keyboard-only operation, multi-window, drag-and-drop between windows, bulk import from local files | A power user completes a bulk data-entry task keyboard-only, faster than in the browser. Measured, not asserted | OPEN |
| **I17** | Parity contract and gate | I05, I15 | A declared parity matrix: every module × every client × supported/partial/exempt, with a logged reason for anything not supported — making `IMPLEMENTATION_PLAN § 6.9`'s "or a logged Tier-4 exemption" real | A module shipped on web without a client decision fails CI. The matrix is published and no cell is blank | OPEN |
| **I18** | Cross-client E2E suite | I17, J19 | End-to-end journeys executed on web, mobile and desktop from one specification | A core journey — login → find record → edit → approve → verify — passes on all three clients from a single test definition | OPEN |

---

## 5. Track exit criteria

- [ ] `git ls-files` in `unierp-mobile` matches an allowlist; the 11 repair scripts and 3 error
      dumps are gone (D006)
- [ ] `flutter analyze` exits 0 with no baseline suppressions
- [ ] Mobile coverage threshold enforced; deleting a test fails CI
- [ ] A hardcoded colour or spacing value in Dart fails lint; all 7 themes render
- [ ] **A module screen added on web appears on mobile with no Dart written for it**
- [ ] A full day of offline field work syncs completely, with conflicts surfaced not lost
- [ ] Tenant MFA and session policy are enforced identically on mobile and web
- [ ] Every screen is screen-reader navigable; text scales to OS maximum without truncation
- [ ] The desktop client runs the full navigation with native menus and platform shortcuts
- [ ] The parity matrix is published with **no blank cells**, and a module shipped without a client
      decision fails CI
- [ ] One journey specification passes on web, mobile and desktop

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 18 phases in three stages. Hard-blocked on B18–B21 because the tokens are TypeScript and Flutter cannot consume them — objective ③'s "all clients" is currently one client. I02 added because the `fix_router*.py` / `missing_controllers.txt` debris (D006) documents a mass automated repair whose results were never independently verified. | Claude Code |
