# TRACK H · MARKETING SITE AND ITS ADMIN — H01–H18

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Runs throughout, formally Waves 1 and 5.** Brief objective ②. Ranked **ninth** — genuinely
> important, but it blocks nothing, which makes it the programme's most useful parallel work when
> another track is stalled.

---

## 1. What this track owns

`unierp-corporate-website` — **plane 0, public.** unierp.com, its content, its conversion path,
and the admin console that controls all of it.

**The invariant this track establishes:**

> **Every word on the public site is true and is changeable without a deploy.**

Both halves matter. The second is what the admin console is for. **The first is a standing hazard
for this project specifically**: the platform's own documents have repeatedly claimed capabilities
that did not exist — `typecheck` passing with `@ts-nocheck` on every file, a layer gate that runs
in 21 repos and exists in none (**D013**), a documented `pnpm dev` that points at a retired
monorepo (**D005**). A marketing site is the highest-consequence place for that pattern to recur,
because a false claim there is a false claim to a customer. **H03 exists specifically to make that
impossible.**

### Starting position — the most complete surface relative to its scope

`00-BASELINE § 4②`:

- **20 public sections**: `product`, `products`, `modules`, `features`, `industries`, `pricing`,
  `customers`, `docs`, `help`, `resources`, `security`, `status`, `careers`, `blog`, `about`,
  `contact`, `marketplace`, `privacy`, `terms`.
- **19 admin pages** over **38 API routes**, backed by its own 25-model Prisma schema: `content`,
  `leads`, `subscribers`, `emails`, `broadcast`, `seo`, `automation`, `audit-log`, `data-center`,
  `system-health`, `tickets`, `tools`, `users`, `settings`, `console-settings`, `components`.

That is a genuine CMS foundation, not a stub. But **`admin/content/page.tsx` and
`admin/tools/page.tsx` are 5 lines each** — and content is the admin's entire reason to exist.

### The architectural note

This site has **its own database, its own `middleware.ts`, and its own auth**, independent of the
platform. That is deliberate (plane 0, separate blast radius) and worth keeping. But it means
auth, RBAC and audit are solved twice in this family, and only the platform's copy has been
reviewed. **H04 addresses that.** It is not a call to merge them.

**Depends:** B01–B12 loosely. **Blocks:** nothing — which is the point.

---

## 2. Stage H-I · Truth, trust and the conversion path (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **H01** | Content architecture and design refresh | B01–B12 | The site rebuilt on the design system's tokens and components, with a coherent information architecture across the 20 existing sections | Zero hardcoded colours or spacing; the token gate (B15) passes on this repo. Core Web Vitals green on every top-level page | OPEN |
| **H02** | Product narrative and messaging | — | Positioning that states what UniERP is, for whom, and against which alternatives — including the honest differentiators `03-GAP-ANALYSIS § 3` identifies: open-source and self-hostable, local-first AI with no data egress, one design system across three clients | Every claim on the site maps to a shipped, verifiable capability. Nothing aspirational is stated in the present tense | OPEN |
| **H03** | Claim-verification gate | H02, A12 | **A CI gate that fails when the marketing site asserts a capability the platform does not have.** Feature claims are declared as data, checked against the platform's own capability manifest | Adding a feature claim with no corresponding capability entry fails CI. This is the mechanism that prevents the site becoming another `@ts-nocheck`-shaped lie | OPEN |
| **H04** | Auth, RBAC and audit review for the site's admin | A10 | The site's independent auth reviewed to the same standard as the platform's: session policy, MFA, RBAC, audit, rate limiting, and secret handling | The site's admin passes the same security checklist as plane 1. Findings filed in `90-DEFECT-LOG.md`. The duplication stays, deliberately — but it is now reviewed | DONE |
| **H05** | Pricing, plans and comparison | H02, C13 | Pricing page driven by the **same plan definitions the platform bills from**, so published prices cannot drift from what is charged | A plan change in C13 updates the pricing page without an edit. A mismatch fails CI | OPEN |
| **H06** | Signup and trial conversion | H05, C07 | Self-serve signup provisioning a real tenant: plan selection, verification, guided first-run handoff into D07 | A stranger signs up and reaches a working tenant with sample data, unaided, in under five minutes | OPEN |
| **H07** | Lead capture and routing | H06, F08 | Contact, demo request, quote and enterprise enquiry routed into CRM (E23) with attribution, deduplication and SLA | A demo request reaches the right owner with its source attributed, and duplicates merge rather than multiply | OPEN |
| **H08** | Trust surfaces | H02, K11 | Security, compliance, privacy, sub-processors, uptime and status pages — each stating only what is true and each linked to its evidence | Every compliance claim links to real evidence or is absent. The status page reflects genuine SLO data, not a static image | OPEN |

---

## 3. Stage H-II · The admin console (Wave 5) — the depth that matters

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **H09** | Content management — the real one | H01, B07 | The 5-line `admin/content` replaced: content types, entries, rich text, media, relations, localisation, versioning and diff | Every word on the public site is editable in the admin with no deploy. A revision is comparable and revertable | OPEN |
| **H10** | Visual page composition | H09, F10 | Marketing pages composed from sections without code — reusing Studio's editor (F10) rather than building a second one | A marketing page is restructured by a non-developer, previewed, and published | OPEN |
| **H11** | Publishing workflow | H09, E05 | Draft → review → schedule → publish → rollback, with preview links and an audit trail | A campaign page publishes on schedule and is rollable back in one action | OPEN |
| **H12** | SEO and content operations | H09 | The existing `admin/seo` page deepened: metadata, structured data, redirects, canonical URLs, sitemaps, `hreflang`, broken-link detection | A URL change creates a redirect automatically. A broken internal link is reported before publish, not after | OPEN |
| **H13** | Marketing automation and campaigns | H07, A21 | The existing `admin/automation`, `admin/emails`, `admin/broadcast` pages deepened: sequences, segmentation, templates, sending, and deliverability — with unsubscribe honoured | A nurture sequence runs with per-recipient personalisation, and an unsubscribe is honoured across every channel | OPEN |
| **H14** | Documentation, help centre and changelog | H09, G27 | The `docs`, `help` and `resources` sections given real depth, with search, feedback and versioning — API reference generated from contracts (G27) rather than written twice | Documentation search returns useful results across guides and reference. API docs cannot drift from the API (**G-18**) | OPEN |
| **H15** | Customer evidence | H09 | Case studies, testimonials and logos — with a consent record and a review date for each | No customer is named without a stored consent record. An expired consent removes the asset automatically | OPEN |
| **H16** | Careers and applicant tracking | H09, E22 | The `careers` section wired to real recruitment (E22): postings, applications, status | An application creates a real recruitment record and the candidate receives acknowledgement | OPEN |
| **H17** | Site analytics and experimentation | H01, F13 | Privacy-respecting analytics, funnel reporting, A/B testing, and consent-gated tracking | The conversion funnel from landing to activated tenant is measurable end to end without third-party tracking cookies | OPEN |
| **H18** | Support, ticketing and status integration | H08, C20–C21 | The existing `admin/tickets` reconciled with the platform's support tooling, and the status page fed by real incident data from C21 | A public incident is published from one action in the console and appears on the status page and in-product | OPEN |

---

## 4. Track exit criteria

- [ ] No admin page is under 20 lines (`admin/content` and `admin/tools` are 5 each today)
- [ ] Every word on the public site is editable in the admin with no deploy
- [ ] **Every capability claim on the site maps to a shipped capability, enforced by the H03 gate**
- [ ] Published prices come from the same plan definitions the platform bills from; drift fails CI
- [ ] A stranger signs up and reaches a working tenant, unaided, in under five minutes
- [ ] A demo request reaches the right CRM owner with attribution, deduplicated
- [ ] The site's independent admin auth has passed the same security review as plane 1
- [ ] Core Web Vitals green and `axe`-clean on every public page
- [ ] The status page reflects real SLO and incident data
- [ ] API documentation is generated from contracts and cannot drift
- [ ] No customer is named without a stored consent record

---

## 5. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 18 phases in two stages, sized against the verified 20 public sections / 19 admin pages / 38 API routes. H03 (claim-verification gate) added because this project has a documented history of claims outliving their mechanisms, and a marketing site is the costliest place for that to recur. H04 added because the site solves auth, RBAC and audit a second time and only the platform's copy has been reviewed. | Claude Code |
