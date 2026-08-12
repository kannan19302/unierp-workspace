# TRACK J · QUALITY AND TESTING — J01–J26

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Runs alongside every wave.** Brief objective ⑩. Ranked **third overall** — and it must run
> *with* the other tracks, not after them. A test discipline retrofitted at the end tests what was
> built, not what was required.

---

## 1. What this track owns

Every testing discipline the brief named — functional, non-functional, black box, white box,
manual — plus the ones it did not: mutation, property-based, contract, chaos, accessibility,
visual, security, and disaster-recovery rehearsal.

**The invariant this track establishes:**

> **A test that cannot fail is worse than no test, because it manufactures confidence.**

This is not a slogan here; it is the project's documented history. `ARCHITECTURE_REVIEW § F2`
found ten gates of which almost none could fail. `00-BASELINE § 2` found that still true of
coverage (**D002**) and newly true of the layer gate (**D013** — 21 repositories declare it, zero
contain it). So **every phase in this track has a second exit criterion: the check must be observed
failing.** A gate is not delivered until someone has broken it on purpose and watched it go red.

### Starting position

`00-BASELINE § 4⑩` — **489 spec files, 27 e2e files.** Real work. But
`unierp-api/vitest.config.ts` sets `all: false` with **no `thresholds` block**, so the number is
unfalsifiable: it reports and cannot fail. Non-functional testing is partly scaffolded
(`load-tests/`, `RUNBOOK_LOAD_TESTING.md`, `load-test.yml`). Absent entirely: mutation testing,
manual test-case management, exploratory charters, accessibility as a gate, visual regression,
security testing as a discipline, chaos, and DR rehearsal.

**Depends:** A06 (the coverage gate). **Blocks:** nothing formally — but no wave's claim is
truthful without its J phases.

---

## 2. Stage J-I · Make testing falsifiable (Wave 0–1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **J01** | Test strategy and taxonomy | — | One document defining every test type, what it covers, where it lives, when it runs, and who owns it — so 489 specs become a portfolio rather than a pile | Every existing spec file is classified. An unclassifiable test is either reclassified or deleted with a reason | BLOCKED |
| **J02** | Coverage that can fail — everywhere | A06 | Thresholds and `all: true` in every testable repo, with a ratchet that may only rise | Deleting any test file fails CI in every repo. Coverage floor recorded per repo and never lowered without a logged amendment (**D002**) | BLOCKED |
| **J03** | Tenant-isolation test framework | A05 | A reusable two-tenant harness so the DoD's "tenant B gets zero rows" test is one line per entity rather than bespoke each time | Every protected table has an isolation test. Removing an RLS policy makes a test fail — verified by doing it | BLOCKED |
| **J04** | Permission test framework | C02, D03 | A harness asserting authorised → 200 and unauthorised → **403** (not 404, not 500) for every endpoint | Every endpoint has a permission test. Removing a `@Permissions` decorator fails CI | DONE |
| **J05** | Contract testing across 30 repos | A01, A02 | The existing CDC expectations (`cdc/expectations.json`, `cdc-harness.mjs`) enforced for every consumer/provider pair | A provider change that breaks any published consumer expectation fails the provider's CI. Verified by breaking one on purpose | DONE |
| **J06** | Integration test environment | A15 | Reproducible ephemeral environments with real Postgres, real migrations and seeded data — no mocked database in integration tests | Integration suites run against a real database in CI and locally with one command, and are not flaky across ten consecutive runs | OPEN |
| **J07** | Accessibility as a blocking gate | B23 | `axe` in CI across every component and every route; keyboard-navigation assertions; the documented screen-reader script | A new `axe` violation fails CI. Zero violations across the component library and all routes (**G-16**) | DONE |
| **J08** | Visual regression | B14 | Screenshot baselines per component × 7 themes × 2 densities × light/dark, and per critical route | An unintended visual change fails CI with a diff. A deliberate one updates the baseline in the same commit | OPEN |

---

## 3. Stage J-II · White box and correctness (Waves 2–3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **J09** | Mutation testing on the correctness-critical core | J02 | Mutation testing over financial arithmetic, tax, payroll, inventory valuation and the permission engine — the answer to "is 80 % coverage actually testing anything" | Mutation score threshold enforced on those paths. A surviving mutant in financial arithmetic fails CI | OPEN |
| **J10** | Property-based and invariant testing | E06, E09 | Generative tests for the domain invariants: a ledger always balances, stock never goes negative against policy, a posted document is never mutated | Each invariant from `IMPLEMENTATION_PLAN § 2.7` has a property test that has found at least one real edge case, recorded | DONE |
| **J11** | Financial arithmetic certification | E09–E13, E21 | **100 %** branch coverage plus reconciliation tests on every money path: rounding, currency conversion, tax, depreciation, payroll | Every money calculation is covered and reconciles against an independently computed expected value. `check-decimal-arithmetic.mjs` blocking with a zero baseline | DONE |
| **J12** | State-machine and lifecycle testing | E06 | Exhaustive transition testing per entity lifecycle, including every forbidden transition | Every forbidden transition is proven to be rejected. A new state added without tests fails CI | DONE |
| **J13** | Performance budgets per route | A20 | Declared budgets for API p95 and page load, enforced in CI on a representative dataset | A regression beyond budget fails the build. Budgets are declared as data, not measured ad hoc (**G-17**) | WIP |
| **J14** | Load and scalability testing | J13, A20 | The existing `load-tests/` and `load-test.yml` driven to real targets: concurrent tenants, hot paths, report generation, bulk operations | p95 < 300 ms on hot paths under target concurrency. `ROADMAP.md`'s 10,000-tenant claim is proven by load test rather than by argument | OPEN |
| **J15** | Data-volume testing | J14, A03 | Every module verified at 10× expected volume, with N+1 detection | No N+1 query on any list or detail path, asserted by a query-count test. Performance holds at 10× data | OPEN |
| **J16** | Multi-tenant noisy-neighbour testing | A20, J14 | Adversarial load from one tenant while measuring another's SLO | One tenant's abusive load leaves another tenant's p95 within SLO. This is the test that makes multi-tenancy a promise rather than a hope (**G-13**) | OPEN |
| **J17** | Migration and upgrade testing | A03, J06 | Every migration tested forward and backward against production-shaped data, with lock and duration measurement | No migration locks a large table beyond its stated budget. `check-migration-safety.mjs` blocking. A release upgrade is rehearsed from the previous train | OPEN |
| **J18** | Outbox, idempotency and eventual-consistency testing | E28 | Duplicate delivery, out-of-order delivery, dead-letter handling and replay all tested | A duplicated event produces no duplicated effect. A dead-lettered event replays to a correct outcome | DONE |

---

## 4. Stage J-III · Black box, security and human testing (Waves 4–5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **J19** | End-to-end journey suite | E02 | Playwright coverage of every journey in `APP_FLOW.md`, tagged by criticality, running on merge | Every documented journey has an E2E test. An undocumented journey is either documented or removed | OPEN |
| **J20** | Manual test-case management | J01 | A maintained manual suite for what automation cannot reach: print output, document fidelity, real payment flows, device behaviour, third-party integrations | Every release runs the manual suite with recorded results. A failing manual case blocks release the same way a failing unit test does | OPEN |
| **J21** | Exploratory testing charters | J20 | Time-boxed exploratory charters per surface, with findings filed to `90-DEFECT-LOG.md` | Each surface has been explored with a recorded charter and outcome. Exploratory findings are tracked, not remembered | OPEN |
| **J22** | Security testing as a discipline | A10, A18 | Beyond CodeQL: authenticated DAST, dependency and container scanning, secret scanning, IDOR sweeps, authorisation fuzzing, and the sandbox escape suite (A18) as a permanent gate | The open CodeQL alerts that pre-date current work are triaged to zero-or-justified. An IDOR sweep covers every record endpoint | BLOCKED |
| **J23** | Penetration testing programme | J22 | A scoped, repeatable internal pentest against every plane — with plane 1 and the sandbox as priority targets | Findings are filed with reproductions and fixed at root cause with a regression test each. Repeated per major release | OPEN |
| **J24** | Chaos and resilience testing | J14 | Deliberate failure injection: database failover, cache loss, queue backlog, dependency timeout, region loss | The platform degrades predictably and recovers. `DATABASE-FAILOVER.md` is validated by execution, not by reading (**G-12**) | OPEN |
| **J25** | Backup, restore and DR rehearsal | A22, A23 | Scheduled rehearsal of full restore and per-tenant PITR, with measured RPO/RTO published | RPO and RTO are committed numbers proven by rehearsal, and the rehearsal is on a schedule that fails loudly if skipped (**G-11**) | BLOCKED |
| **J26** | Release certification | J01–J25 | A single release gate: every discipline green, manual suite run, budgets met, DR current, security triaged — one artefact per release | No release ships without a signed certification artefact naming which suites ran, at which commit, with which results | OPEN |

---

## 5. Track exit criteria

- [ ] Every repo enforces a coverage threshold with `all: true`; deleting a test fails CI
- [ ] **Every gate in this track has been observed failing on a deliberate break** — the A09
      break-it suite covers J's gates too
- [ ] Every protected table has a tenant-isolation test; removing a policy fails a test
- [ ] Every endpoint has a permission test asserting 403 for the unauthorised case
- [ ] Mutation score enforced on financial, tax, payroll, valuation and permission code
- [ ] Financial arithmetic at 100 % branch coverage, reconciling to independently computed values
- [ ] p95 < 300 ms on hot paths under target concurrency, and 10,000-tenant capacity proven by
      load test rather than argument
- [ ] One tenant's abusive load provably does not breach another tenant's SLO
- [ ] Zero `axe` violations; visual regression baselines current
- [ ] Every `APP_FLOW.md` journey has an E2E test; the manual suite runs every release
- [ ] CodeQL alerts triaged to zero-or-justified; sandbox escape suite permanently blocking
- [ ] RPO and RTO are committed numbers proven by scheduled rehearsal
- [ ] No release ships without a certification artefact

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 26 phases in three stages, covering all five disciplines the brief named plus mutation, property-based, contract, chaos, visual, accessibility and DR. Every phase carries the second exit criterion "observed failing", because D002 and D013 show this project's characteristic failure is a check that cannot fail. | Claude Code |
