# 03 · GAP ANALYSIS — what the ten-point brief did not name

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> The brief listed ten objectives and asked whether anything was missing. **Twenty-four things
> were**, and four of them are load-bearing enough that shipping the ten without them produces a
> platform that demos well and cannot be sold, operated, or audited.
>
> This document is the answer to that question. Each gap names the track and phases that now
> cover it, so nothing here is left as an observation.

---

## 1. The four that change the plan

These are not additions to the list. They are things without which items on the list do not
function.

### G-1 · Nobody has verified the thing that contains customer code

**Objectives ⑥ and ⑦ describe a Salesforce-class developer platform: flow builder, logic builder,
custom UI builder, query builder, a sandbox for third-party ERP apps, a global marketplace.
Every one of those executes code that a customer wrote, inside our process, against our
database.** The component that is supposed to contain it — `unierp-sandbox` — is **393 lines**
(`00-BASELINE § 4⑥`, D009). It has one spec file. No adversarial test suite exists.

`ARCHITECTURE.md` claims the isolate has "no `process`, no `require`, no filesystem, and metered
CPU, memory, query and egress budgets". That is the right specification. It is also the platform's
**highest-consequence unverified claim**: it is the only thing standing between one tenant's
custom logic and every other tenant's payroll and patient records.

Shipping the developer platform before proving the sandbox is the single largest risk in this
programme, and it is not visible anywhere in the brief.

→ **A16–A19** (sandbox hardening and an escape-attempt suite), a hard block on all of Track G.

### G-2 · There is no way to charge anyone

Objective ⑧ says "proper SaaS portal … full control over the platform for tenets". Objective ①
says an internal admin console. Neither names **metering, rating, invoicing, tax, payment,
dunning, proration, refunds, credit notes, or revenue recognition**.

`unierp-api/src/modules/subscriptions` and `platform/v1/feature-flags-metering` exist, and
`saas_invoices` / `payment_transactions` tables exist — they appear in `§ F5`'s list of tables
that had *no RLS policy*, which is its own commentary. But a billing system is not a table: it is
a metering pipeline that cannot double-count, a rating engine that survives a mid-cycle plan
change, a tax determination that is jurisdiction-correct, a dunning ladder, and a reconciliation
report that ties invoiced revenue to collected cash. None of that is on the list.

A multi-tenant SaaS platform that cannot invoice correctly is not a product. Worse, billing bugs
are the class of bug customers never forgive.

→ **K05–K10**, and **C13–C17** for the provider-side controls.

### G-3 · Compliance is a product feature here, not paperwork

The platform's own documents state the intent: healthcare, education, government and
EU-regulated buyers. `docs/ai/PRD.md` treats local-first AI as the decision that makes those
segments addressable at all. `check-pii-registry.mjs`'s first real run found 21 undeclared PII
models **including `HealthcarePatient` and `EducationStudent`**.

That means the product already holds regulated data and the brief does not mention **GDPR data
subject access requests, right to erasure against an immutable audit log, data residency, a
records-of-processing register, sub-processor disclosure, a DPA template, HIPAA BAA readiness,
FERPA constraints, SOC 2 evidence collection, or breach notification runbooks**.

Two of these are engineering problems that are *hard to retrofit* and must be designed in:

- **Erasure vs. audit immutability.** "Delete my data" and "the audit trail is append-only" are in
  direct conflict. Resolving it late means rewriting the audit subsystem. `DELETION_POLICY.md` and
  `DATA_RETENTION_MATRIX.md` exist, which is a genuinely good start — they now need to be true of
  all 1,836 models, not documented.
- **Data residency.** If it is not in the tenancy model from the start, it becomes a migration of
  every tenant.

→ **K01–K04** (start immediately — these take calendar time), **K11–K14**, and **A24–A26** for
residency in the tenancy model.

### G-4 · Migration, import and export — how does anyone actually start using this?

No objective covers **getting a customer's existing data in**. This is the single most common
reason an ERP purchase fails after signature. A prospect with fifteen years of history in Tally,
QuickBooks, SAP B1, Zoho or spreadsheets needs: a mapping tool, staged validation, a dry-run with
an error report they can act on, an incremental re-import, a rollback, and a reconciliation
statement proving the opening balances match.

The reverse also matters and is a contractual obligation under the AGPL self-hosting promise:
**complete tenant data export**, in a format that is genuinely re-importable, without our help.
"You can self-host" is hollow if the only export is a `pg_dump` nobody can interpret.

→ **D08–D12** (tenant-side), **C22–C24** (provider-assisted migration), **K15**.

---

## 2. The twenty that also matter

| # | Gap | Why it bites | Covered by |
| :- | :-- | :----------- | :--------- |
| G-5 | **Notification and communication infrastructure** — one engine for email, SMS, push, in-app, webhook, with per-user preferences, digesting, quiet hours, templates, localisation and delivery tracking | 45 modules each inventing "send an email" produces 45 dialects, no preference centre, and an unsubscribe obligation nobody owns. `modules/notifications` and `modules/communication` exist and need to become *the* engine. | **A20–A21**, D06 |
| G-6 | **Search across the platform** — federated, permission-filtered, typo-tolerant, entity-aware | Users judge an ERP on whether they can find a thing. `modules/search` and `app/(dashboard)/search` exist; permission-filtered federated search is a distinct problem from per-module list filters, and getting it wrong leaks data through result counts. | **E39–E40** |
| G-7 | **Reporting and analytics as a platform capability** — semantic layer, ad-hoc builder, scheduled delivery, drill-through, cross-module joins | Objective ⑦ names a dashboard builder, which is the *presentation* half. Without a semantic layer underneath, every dashboard hand-writes SQL against 1,836 models and breaks on the next migration. | **E33–E38**, G22–G24 |
| G-8 | **Document generation and e-signature** — templated, branded, localised, versioned PDFs; attachment lifecycle | An ERP that cannot produce a correct invoice PDF in the customer's language and currency format is not deployable, regardless of module depth. | **E29–E32** |
| G-9 | **Audit trail as a first-class, queryable product surface** | Audit exists as infrastructure. It is not exposed as something a tenant admin can search, filter, export, and hand to an auditor — which is the entire reason it exists commercially. | **D05**, C11 |
| G-10 | **Impersonation with consent and a paper trail** | Support cannot function without it; it is also the most dangerous feature in the platform. Needs tenant opt-in, scoping, time limits, banner, immutable log, and notification to the impersonated user. Mentioned in `ARCHITECTURE.md`'s plane table; not on the brief. | **C08–C10** |
| G-11 | **Backup, restore, and per-tenant point-in-time recovery — rehearsed** | `RUNBOOK_BACKUP_RESTORE.md`, `backup-database.mjs` and `verify-backup.mjs` exist. An unrehearsed restore is a hypothesis. Per-*tenant* PITR is a different and harder problem than cluster PITR, and it is what customers actually ask for. | **A22–A23**, J25 |
| G-12 | **Disaster recovery and business continuity** — RPO/RTO stated, tested, published | Enterprise procurement asks for this in writing. `DATABASE-FAILOVER.md` exists; the numbers are not committed to or proven. | **J25–J26**, K17 |
| G-13 | **Rate limiting, quotas, abuse prevention, and fair-use isolation** | One tenant's runaway report must not degrade another's payroll run. Noisy-neighbour is the defining failure mode of multi-tenant SaaS and the brief does not mention it. | **A20**, C18–C19 |
| G-14 | **API lifecycle for external consumers** — versioning, deprecation windows, keys, OAuth apps, quotas, changelog, published SDKs | `API_VERSIONING_POLICY.md` and `modules/api-platform` exist. The developer-facing half — self-service keys, scoped tokens, usage dashboards, a deprecation calendar — is the difference between "we have an API" and "third parties build on us", which objective ⑥ requires. | **G25–G28** |
| G-15 | **Localisation, i18n and regionalisation** — not just translation: date/number/currency formats, RTL, timezones, fiscal calendars, per-country tax and statutory reporting, address formats, name ordering | `modules/localization` exists. Statutory reporting is the hard part: it is per-country, it changes annually, and it is legally required. It also decides which markets are addressable at all. | **K16**, E41–E42 |
| G-16 | **Accessibility as a gate, not an aspiration** | `IMPLEMENTATION_PLAN § 6.8` requires axe-clean. Nothing enforces it in CI. Public-sector procurement in most jurisdictions requires WCAG 2.2 AA conformance in writing. | **J07**, B23 |
| G-17 | **Performance budgets and capacity planning** | `ROADMAP.md` says 10,000-tenant capacity is currently proven "by argument". Budgets must be per-route and enforced, or performance regresses one 20 ms increment at a time. | **J13–J16** |
| G-18 | **Onboarding, in-product guidance, and help** — guided setup, contextual help, sample data, tours, empty-state coaching | Determines whether a signup becomes a customer. `app/(dashboard)/onboarding` and `modules/onboarding` exist as a start. A 45-module platform with no guided start is unusable by a new admin. | **D07**, H14 |
| G-19 | **Support and success tooling** — ticketing, health scores, usage insight, in-app messaging, status page integration | The marketing site already has `admin/tickets` and a `status` page. Support tooling for the *platform* (which tenant, which plan, what did they do, what broke) belongs in the console and is not on the list. | **C20–C21**, K18 |
| G-20 | **Extension and app review, certification, and revocation** | Objective ⑥ says apps reach a "global market place". A marketplace without review, signing, permission disclosure at install, and the ability to revoke a malicious app is a supply-chain attack surface pointed at every tenant. | **G19–G21** |
| G-21 | **Secrets and key management, encryption at rest, and per-tenant key custody** | The platform has already committed npm tokens once, in fourteen repositories (`unierp-api/.npmrc` documents it honestly). Field-level encryption for PII, key rotation, and BYOK for regulated tenants are procurement blockers. | **A24–A26** |
| G-22 | **Design system governance** — contribution process, versioning, deprecation, adoption measurement, Figma↔code parity | Objective ③ says "improve the design system". Without governance it drifts back into 500 hand-rolled tables within two waves. `unierp-storybook` currently cannot even install (D008). | **B13–B17** |
| G-23 | **Developer experience for *this* repo family** — one-command dev environment across 30 repos, a working `pnpm dev`, seeded data, and a documented golden path | `ARCHITECTURE.md § Running it` still tells a newcomer to clone the retired monorepo (D005). Right now the *documented* way to run UniERP does not work. Nothing costs more contributor throughput than this. | **A02**, A15 |
| G-24 | **Data model consolidation** — 1,836 models with a 31,092-line `core.prisma` (D001) | Objective ④ deepens 45 modules against a core schema no human or agent can read in one context. Duplicate entities are already the documented top failure mode of multi-agent development here, and this is the condition that causes them. | **A03–A04** |

---

## 3. Two things on the brief that need reframing

Not gaps — but taking them literally would produce the wrong work.

### "Complete all apps to next level (not stubbed or UI placeholders)"

The audit does not support the premise. `unierp-web` has **890 pages with a median of 200 lines**,
and only **15 files** platform-wide carry a `TODO` / `Coming soon` / `not implemented` marker
(`00-BASELINE § 4④`). This is not a placeholder codebase.

The real problem is harder to see and more dangerous: **pages that look finished.** They render,
they fetch real data, they save. What they lack is what an ERP is actually judged on — approval
chains, period close, reversal and correction paths, audit on the detail view, bulk operations,
print fidelity, and the six required UI states. A reviewer scanning for placeholders will find
almost none and conclude the modules are done.

So Track E is **not** a hunt for stubs. It is a per-module audit against the fixed 16-row rubric in
`02-EXECUTION-GUIDELINES § 5`, scored with evidence. That is why E is 42 phases rather than a
sweep: you cannot deepen 45 modules by inspiration, and 890 pages is far too many to eyeball.

### "Developer console should be the advanced level of salesforce or even more advanced"

Salesforce's platform is roughly two decades of work by thousands of engineers, and its moat is
not the builders — it is the **governor limits, the metadata API, the deployment model, and
twenty years of backwards compatibility**. Matching the *builders* is achievable and Track G
targets it. Matching the *guarantees* underneath is the actual work, and it is why G is gated on
A16–A19: Salesforce's Apex governor limits are the direct analogue of our sandbox budgets, and
they are the reason customers trust running third-party code.

The honest framing, and the one Track G is written to: **be genuinely better than Salesforce on
the three axes where we structurally can** — open source and self-hostable (they cannot be),
local-first AI with no data egress (they will not be), and one coherent design system across web,
mobile and desktop (they have never been) — and be *credibly equivalent* on the builders. Claiming
"more advanced than Salesforce" as a whole would be the same category of statement as
`typecheck` passing with `@ts-nocheck` on every file, and this project has already paid for that
lesson once.

---

## 4. What is genuinely absent from the brief and out of scope anyway

Recorded so the omission is a decision rather than an oversight, consistent with
`ROADMAP.md § Out of scope`:

| Not doing | Why |
| :-------- | :-- |
| Splitting the API into microservices | Finance, inventory and sales write to each other constantly. `ARCHITECTURE.md` is right and this stays out. |
| An open-core edition | Isolation, sandbox and audit are the parts most worth paying for; withholding them makes the AGPL claim hollow. |
| Supporting a second database engine | PostgreSQL-only buys RLS, pgvector and JSONB. That trade is already made and is correct. |
| A mandatory hosted-only SaaS offering | UniERP is self-hostable. A *provider-operated* instance is in scope (Track C exists); forcing tenants into it is not. |

---

## 5. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Established. 24 gaps identified against the ten-point brief; four flagged as load-bearing; two brief items reframed with reasoning. | Claude Code |
