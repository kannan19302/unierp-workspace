# V1.0 — WHAT IT IS, WHEN IT SHIPS, AND WHAT ELSE MUST BE TRUE

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **This document holds no phase IDs.** It defines the release, fixes the order the programmes are
> worked in, and states the go-live gate. The work itself lives in the programme documents;
> Programme 13 owns executing this gate.

---

## 1. The decision, recorded

**v1.0 ships when every phase in every programme is DONE.** That is the maintainer's decision,
recorded here so no later agent re-opens it, and so the alternative that was considered is not lost.

**The alternative that was rejected.** A smaller v1.0 — Programme 1 finished plus the ERP kernel and
financial core, identity and permissions, the client platform guarantees and the platform contracts,
roughly 400–600 phases — with Marketplace, Website Builder, Desktop, AI Builder and most verticals
deferred to v1.x. The argument for it is in § 2 and it has not gone away. The argument against it is
the maintainer's: a partial ERP is not a product anyone can adopt, and shipping one costs more in
support and reputation than it earns in feedback.

**Both readings are legitimate.** This document proceeds on the decision that was made, and § 2
states the risk plainly rather than burying it, because a plan that hides its own largest risk is
the failure mode this programme exists to prevent.

---

## 2. The standing risk of this decision

Stated once, honestly, and not repeated elsewhere.

- **3,388 phases remain** (243 of 3,631 are DONE — **6.7 %**).
- `README § 1` records the constraint that governs everything here: *"There are no dates and no
  effort estimates. UniERP has one maintainer (`GOVERNANCE.md`); a dated plan from a single
  maintainer is a wish list."* At one maintainer, an all-or-nothing v1.0 is the longest possible
  route to a first release.
- **No external feedback reaches the product before v1.0.** Every design decision in 3,388 phases
  will be validated against judgement rather than against a user. Some of them will be wrong, and
  the cost of discovering that at v1.0 is higher than at v0.3.
- **Some exit criteria cannot be proven in the current environment at all.** `docs/ai/CHANGELOG.md`
  records H05 released rather than claimed for want of a live `DATABASE_URL` — the same blocker as
  E38, E44, I11, J25 and G05. Phases whose proof needs live infrastructure will accumulate as
  BLOCKED until that infrastructure exists. **`P13-004` exists to stop that accumulating silently.**

**What reduces the risk without changing the decision:** § 3's ordering front-loads the programmes
that everything else depends on, so that if the decision is ever revisited, the work already done is
the work a smaller v1.0 would have needed anyway. That is deliberate. Nothing in § 3 is wasted under
either reading.

---

## 3. Programme order — the sequence, and why

`start.mjs --programme <n>` will hand out work in any programme. This section decides which
programme an agent opens when the user has not named one. **It is the authority for that decision**;
`AGENTS.md § 0` and the `run-phase` skill both defer to it.

The ordering rule is dependency depth, not importance: **a programme is worked when the things it
asserts through its precondition gate mostly exist**, so its phases are provable rather than
perpetually degraded.

| Order | Programme | Why here |
| :---- | :-------- | :------- |
| **1** | **Programme 1** (A–M) | 116 phases from complete, and it is the foundation every programme's precondition gate asserts against. Finishing it converts degraded surfaces across all twelve into provable ones. Tracks F and I are 0/26 and 0/18 — the largest holes. |
| **2** | **Programme 12 — Platform Core** | Owns the identity provider, the contracts, the data layer, the kernel and the sandbox. Every other programme generates clients from `unierp-contracts` and authenticates against `unierp-idp`. Nothing downstream is stable while these are unowned. |
| **3** | **Programme 9 — Web Client Platform** | The runtime under 903 pages. Programme 4's screens cannot be made good on a platform that is not. Front-loaded deliberately: platform-level fixes here are the only economical way to reach 903 pages. |
| **4** | **Programme 4 — Tenant Apps (ERP)** | The product itself, and the largest single programme at 370. Depends on 1, 12 and 9 being real. |
| **5** | **Programme 6 — Tenant Admin Console** | Identity, permissions and governance for the ERP that now exists. |
| **6** | **Programme 8 — Platform Admin OS** | Operating an estate that now has something in it to operate. |
| **7** | **Programme 2 — Developer Portal** | Needs a stable metadata and contract layer beneath it; publishes the contract Programme 3 consumes. |
| **8** | **Programme 3 — Marketplace** | Consumes `P2-334`. Buildable against the contract earlier via `P3-004`'s reference publisher, but not finishable before it. |
| **9** | **Programme 10 — Mobile** | Offline-first against an ERP whose semantics have settled. Ordering it before Programme 4 would mean building sync for a data model still moving. |
| **10** | **Programme 5 — Website Builder** | Independent of most of the above by construction (`P5-005`'s projection boundary), so it is safely late rather than urgently early. |
| **11** | **Programme 7 — Marketing Site** | Its claim gate (`P7-030`) can only be satisfied by capabilities that exist. Marketing a platform before it is real is precisely what `H03` was built to prevent. |
| **12** | **Programme 11 — Desktop** | Greenfield, and `P11-310` requires measuring every desktop-only capability against a web client that must therefore already be good. |
| **13** | **Programme 13 — Integration & Release** | Runs throughout for its integration phases; its release phases are last by definition. |

**Programme 13 is the exception to the ordering.** Its integration phases attach to whatever exists
and should be worked continuously, in the way Track J does for Programme 1 — not saved for the end,
when the cost of discovering an integration defect is highest.

**This ordering is guidance for choosing, not a dependency.** No programme is blocked by another;
that is what the precondition gates are for. An agent may work any programme the user names.

---

## 4. What "all phases DONE" does not, by itself, prove

Every programme has its own launch-readiness phase, and each proves that *programme* internally.
None of them proves the platform. These are the things that remain true after 3,631 DONE ticks, and
they are why Programme 13 exists:

1. **That the programmes work together.** Every `Depends` cell is intra-programme by design. The
   integration between them is asserted by precondition gates, which prove a capability is *present*
   — not that it is *correct* for the consumer. `P13-011`–`P13-060` close this.
2. **That the platform runs as one system under load.** Twelve programmes each meeting their own
   performance budget does not mean the composed system meets any.
3. **That a real customer can be brought onto it.** Data migration from a legacy ERP, opening
   balances, cutover, parallel running and rollback are a discipline of their own.
4. **That it can be operated by people who did not build it.** Runbooks executed in rehearsal,
   support tooling with support staff, and an on-call rotation that has been woken up.
5. **That it is legally and commercially able to trade.** Terms, DPAs, tax registration, pricing
   published truthfully, and the ability to invoice and be paid.
6. **That it can be supported after launch.** A defect found by a customer in week one has a route
   to a fix, and that route has been walked before launch, not after.

---

## 5. The go-live gate

v1.0 ships when **all** of the following hold. Each is owned by a Programme 13 phase, and each is
evidenced by a command and its output — including its output when deliberately broken.

### 5.1 Completeness

- [ ] Every phase in every programme is `DONE` or `WITHDRAWN` with a recorded reason
- [ ] `node scripts/check-plan-integrity.mjs` passes
- [ ] `node scripts/ci/verify.mjs` passes across every repository
- [ ] Zero phases stranded `WIP`; zero `BLOCKED` without a current, re-tested blocker
- [ ] Every `--despite-red-gate` override in the worklog has been reviewed and either resolved or
      accepted in writing

### 5.2 Integration

- [ ] Cross-programme contract conformance passes in a running system, not against a reference
- [ ] End-to-end journeys spanning three or more programmes pass against a real deployment
- [ ] The composed platform meets a stated whole-system performance budget under realistic load
- [ ] A tenant's data is provably isolated across every programme's surfaces simultaneously

### 5.3 Operability

- [ ] Every runbook has been executed in rehearsal within its review period
- [ ] Disaster recovery rehearsed end to end, meeting its stated objective, with the books balancing
- [ ] On-call rotation staffed, alerting proven to fire, and an incident rehearsed to resolution
- [ ] Support tooling exercised by someone who did not build the platform

### 5.4 Customer readiness

- [ ] A legacy-ERP migration rehearsed to reconciled opening balances, with rollback exercised
- [ ] Cutover and parallel-running procedure documented and rehearsed
- [ ] Onboarding measured: a new tenant reaches productive use within its stated budget
- [ ] Documentation generated from contracts, with every code sample and tutorial executing in CI

### 5.5 Commercial and legal

- [ ] Terms, DPA and sub-processor disclosure published, versioned, with acceptance recorded
- [ ] Tax registration and invoicing proven in every market being opened
- [ ] Published prices equal charged prices, enforced by gate (`P7-149`)
- [ ] Every public capability claim maps to a shipped capability, enforced by gate (`P7-030`)
- [ ] Accessibility conformance published from real audit results, not asserted

### 5.6 Truthfulness

- [ ] **No claim in any user-facing surface, document or README lacks a mechanism that can fail.**
      This is `AGENTS.md § 1` applied to the release itself. The project's own history — a
      typecheck passing over 3,241 `@ts-nocheck` files, a layer gate running in 21 repositories and
      existing in none, a pricing page hardcoding plans a real billing model sat behind — is why
      this box is on the list and why it is last.

---

## 6. What v1.0 explicitly does not promise

Recorded so the release is not read as claiming more than it does:

- **Not a schedule.** No date is stated here or anywhere. `ROADMAP.md` says the same.
- **Not scale-proven beyond its measured profiles.** Every performance claim is bounded by the
  reference profile it was measured on, and those profiles are stated.
- **Not certified** for any compliance framework unless a certificate with an unexpired date exists.
  Frameworks are *supported* — evidence is generated by mechanism — which is not the same claim.
- **Not multi-maintainer-proven.** The protocol's claim mechanism has a documented limit: an agent
  that claims offline and never pushes is invisible. `A27` is the fix; until it is done, parallelism
  is bounded by that.

---

## 7. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-14 | Document established. Records the maintainer's decision that **v1.0 ships only when all phases are DONE**, after the alternative — a 400–600 phase minimum release — was proposed and declined; both readings are recorded in § 1 so the decision is not silently re-litigated, and § 2 states the standing risk of the decision rather than burying it. § 3 fixes the programme ordering by dependency depth and is the authority `AGENTS.md § 0` and the `run-phase` skill defer to; it is deliberately arranged so that no work done under it is wasted if the decision is ever revisited. § 4 states what 3,631 DONE ticks do *not* prove, which is the charter for Programme 13. | Claude Code |
