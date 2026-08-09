# TRACK K · OPERATIONS, COMPLIANCE AND GO-TO-MARKET — K01–K18

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **K01–K04 start in Wave 1 and run in the background; the rest lands in Waves 2 and 6.**
> None of this was in the ten-point brief. Three of the four load-bearing gaps in
> `03-GAP-ANALYSIS § 1` live here.

---

## 1. What this track owns

Everything between "the software works" and "a business can buy it, pay for it, trust it with
regulated data, and get support when it breaks."

**The invariant this track establishes:**

> **Every commercial and regulatory promise is backed by a mechanism, and the mechanism is
> rehearsed.**

**Why K01–K04 start in Wave 1 despite ranking last.** Legal review, SOC 2 evidence collection, a
DPA template and a licence audit take **calendar time regardless of engineering effort**. An
auditor's observation window cannot be compressed by working harder. Starting them in Wave 6 means
discovering in Wave 6 that the first enterprise deal is nine months out for reasons no amount of
code will fix. So they start immediately and run in the background — and they are also the right
work to pick up when another track is blocked.

**Depends:** C13–C17 for the billing phases. **Blocks:** the Wave 6 claim.

---

## 2. Stage K-I · Long-lead items (start in Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **K01** | Licence and IP audit | — | Every dependency's licence verified against the open-source-first requirement; `check-licenses.mjs` made blocking; the AGPL-3.0 position documented for both self-hosters and commercial users | `check-licenses.mjs` blocking with zero non-open licences. The AGPL implications for a tenant's custom code and for the marketplace are stated in writing — because "can I build on this commercially" is the first question a serious adopter asks | WIP |
| **K02** | Legal document set | — | Terms of service, acceptable use, SLA, DPA, sub-processor list, privacy policy, cookie policy — each reviewed and each published on the marketing site (H08) | Every document exists, is published, is versioned, and its acceptance is recorded per tenant with a timestamp | OPEN |
| **K03** | Compliance framework scoping | K01 | Which frameworks are in scope and which are explicitly not: SOC 2 Type II, ISO 27001, GDPR, HIPAA, FERPA, and regional requirements. Control mapping to actual platform mechanisms | Every in-scope control maps to an implemented, tested mechanism or to a dated gap. Out-of-scope frameworks are stated so a prospect is never misled (**G-3**) | OPEN |
| **K04** | Evidence collection automation | K03, C03 | Automated evidence: access reviews, change management, audit logs, vulnerability management, backup verification — generated continuously rather than assembled before an audit | An auditor's evidence request is satisfiable from generated artefacts. Nothing is assembled by hand the week before | OPEN |

---

## 3. Stage K-II · Billing and revenue (Wave 2, with C13–C17)

`03-GAP-ANALYSIS § G-2`: the brief describes a SaaS platform and never mentions charging for it.
`saas_invoices` and `payment_transactions` appear in `ARCHITECTURE_REVIEW § F5`'s list of tables
that had **no RLS policy** — which is its own commentary on how well this area has been examined.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **K05** | Metering pipeline | C14, A05 | Usage events collected, deduplicated, aggregated and stored immutably, with a reconciliation report from raw event to invoiced quantity | Metering is idempotent under replay: the same event delivered twice is counted once, proven by test. An invoiced quantity traces to individual events | OPEN |
| **K06** | Rating and pricing engine | C13, K05 | Plan rules, tiers, overages, minimums, discounts, coupons, contract pricing, proration and mid-cycle changes | Every pricing scenario has a test with an independently computed expected total. **100 %** coverage per the DoD. A mid-cycle downgrade produces the correct proration | OPEN |
| **K07** | Tax determination for SaaS | K06, E12 | Jurisdiction-correct tax on subscriptions: VAT/GST, reverse charge, US sales tax nexus, digital-services rules, exemption certificates | Tax on a subscription is correct for each supported jurisdiction and reproducible for an audit. Rate changes are effective-dated, never retroactive | OPEN |
| **K08** | Payment processing | K06 | Multiple payment methods and providers, secure tokenisation, SCA/3DS, retries, and **no card data ever touching our systems** | A card is charged without any card data entering our database or logs. PCI scope is documented and minimal | OPEN |
| **K09** | Revenue recognition and financial reporting | K06, E09 | MRR, ARR, churn, expansion, deferred revenue, and recognition schedules — reconciling to the general ledger | Recognised revenue reconciles to the GL and to invoiced amounts. Three numbers, one truth | OPEN |
| **K10** | Marketplace revenue and payouts | G22, K09 | Third-party developer revenue share, payout scheduling, statements, and tax handling for payees | A developer's payout statement reconciles to platform invoices and to their marketplace sales | OPEN |

---

## 4. Stage K-III · Trust and regulated markets (Wave 6)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **K11** | GDPR operational readiness | D11, K03 | Records of processing, lawful-basis register, sub-processor management, cross-border transfer mechanism, DPIA template, and a rehearsed 72-hour breach process | A data-subject request is fulfilled within the statutory window using product features, not engineering. The breach process is rehearsed and timed | OPEN |
| **K12** | Healthcare readiness | E26, A25, K03 | HIPAA-oriented controls for the healthcare vertical: BAA readiness, PHI handling, minimum necessary access, and disclosure accounting | Every PHI-bearing model is encrypted, access-audited, and disclosure-accountable. `HealthcarePatient` — one of the 21 models the PII gate found undeclared — is fully covered | OPEN |
| **K13** | Education readiness | E26, K03 | FERPA-oriented controls: directory-information handling, parental access, consent, and record disclosure | `EducationStudent` and related models meet the stated constraints, with consent and disclosure tracked | OPEN |
| **K14** | Security certification readiness | K04, J22, J23 | Policies, access reviews, vendor management, incident response, business continuity, and secure-development evidence, all continuously generated | A readiness assessment against K03's in-scope frameworks reports no unaddressed control | OPEN |
| **K15** | Data portability and exit rights | D10, C24 | A contractual, tested exit path: complete export, assisted migration away, deletion certificate — the honest counterpart to the self-hosting promise | A tenant exits fully unaided and receives a deletion certificate. Verified by rehearsal, not by clause (**G-4**) | OPEN |
| **K16** | Market localisation | E41, E42, K07 | Per-market readiness: language, currency, tax, statutory reporting, payment methods, data residency, and legal documents — with supported markets stated explicitly | Each launched market has its readiness matrix complete. An unsupported market is named as unsupported rather than implied (**G-15**) | OPEN |
| **K17** | Operational readiness and SLA commitment | A13, A22, J24, J25 | Published SLA with committed availability, credit terms, escalation and on-call — backed by measured SLOs and rehearsed DR | The published availability figure is supported by measured history and a rehearsed DR plan. No number is published that is not measured (**G-12**) | OPEN |
| **K18** | Support organisation and launch readiness | C20–C21, H18, J26 | Support tiers, response targets, knowledge base, escalation, on-call rota, and a launch checklist covering every track's exit criteria | The Wave 6 claim is demonstrable end to end: a stranger signs up, pays, uses the product, gets support, exports their data and leaves — and each step is evidenced | OPEN |
| **K19** | Unit economics and cost per tenant | C14, K09, A13 | Infrastructure cost attributed per tenant and per feature — compute, storage, egress, AI inference, backup — reconciled against what that tenant is billed. K09 covers revenue; **nothing covered cost, so nothing could answer whether a plan is profitable** | Gross margin is computable per tenant and per plan. A tenant costing more than it pays is identified automatically, not discovered at year end. AI inference cost is attributed, because a local-first model shifts cost from API spend to hardware and that is invisible without this | OPEN |

---

## 5. Track exit criteria

- [ ] `check-licenses.mjs` blocking with zero non-open licences; the AGPL position is documented
      for self-hosters, commercial users and marketplace developers
- [ ] Every legal document is published, versioned, and its acceptance recorded per tenant
- [ ] Every in-scope compliance control maps to a tested mechanism or a dated gap; out-of-scope
      frameworks are stated
- [ ] Audit evidence is continuously generated, not assembled before an audit
- [ ] Metering is idempotent under replay; an invoiced quantity traces to individual events
- [ ] Rating, tax and revenue recognition each reconcile to independently computed values, at
      **100 %** coverage
- [ ] No card data enters our database or logs; PCI scope documented and minimal
- [ ] Recognised revenue reconciles to the GL, to invoices, and to developer payouts
- [ ] A data-subject request is fulfilled within the statutory window using product features
- [ ] PHI and student records are encrypted, access-audited and disclosure-accountable
- [ ] A tenant exits fully unaided and receives a deletion certificate — rehearsed
- [ ] Every launched market's readiness matrix is complete; unsupported markets are named
- [ ] The published SLA figure is supported by measured history and rehearsed DR
- [ ] **The Wave 6 claim is demonstrable end to end, with evidence at each step**

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 18 phases in three stages, covering the three load-bearing gaps the brief omitted: billing (G-2), compliance (G-3) and exit rights (G-4). K01–K04 deliberately scheduled into Wave 1 because legal, audit and certification consume calendar time that engineering effort cannot compress. | Claude Code |
