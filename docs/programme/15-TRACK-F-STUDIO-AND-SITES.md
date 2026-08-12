# TRACK F · STUDIO AND TENANT WEBSITES — F01–F26

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Waves 4–5.** Brief objective ⑤. Ranked **eighth** — a real revenue surface, near-greenfield,
> and dependent on both B (components) and G (builder runtime), so it cannot lead.

---

## 1. What this track owns

The Studio module and everything a tenant *publishes to the public internet*: websites, stores,
portals, portfolios — their templates, their editor, their hosting, and their content model.

**The invariant this track establishes:**

> **A published tenant site is untrusted content on a public origin.** It may read only what the
> tenant published, it may never reach plane 3 directly, and a compromise of one tenant's site
> reaches no other tenant.

This is not a theoretical concern. `ARCHITECTURE.md`'s plane table puts published tenant websites
in **plane 0, "Anyone"** — the same plane as marketing. A rendering path that reaches tenant data
without going through an explicitly published projection is a cross-tenant data leak with a public
URL.

### Starting position

`00-BASELINE § 4⑤` — skeleton. `unierp-web/app/_sites/` and `app/[slug]/` exist, so multi-site
routing is sketched. `unierp-developer/src/app/builder/web/` has `sites` (132 lines), `canvas`
(103 lines), `blog`, `collections`, `menus`, `assets`. `unierp-api/src/developer/builder/builder-web-content.service.ts` exists.
**`unierp-corporate-site-template` is a `package.json` and a licence** (**D010**) — it is listed in
the repository map and reads as a shipped template.

There is no template library, no commerce template, no theme marketplace, and no publishing
pipeline. A visual editor whose canvas is 103 lines is a wireframe.

**Depends:** B01–B12, **G09–G18 (hard — the page runtime is the builder runtime; building it twice
is the only alternative)**, F needs E19 for commerce inventory truth. **Blocks:** nothing.

---

## 2. Stage F-I · The content and rendering foundation (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **F01** | Site data model and tenancy | A03, A05 | Sites, pages, sections, collections, entries, menus, assets, redirects, locales — every table tenant-scoped and RLS-policied | `check-rls-verify.mjs` passes over every new table. A site provably cannot reference another tenant's content | WIP |
| **F02** | Published-projection boundary | F01 | An explicit publish step producing a read-only projection that the public renderer reads. **The renderer never queries plane-3 data directly** | A test proves the public renderer cannot reach an unpublished record or any plane-3 table, even with a crafted request. This is the phase that makes the whole track safe | OPEN |
| **F03** | Headless content model | F01 | Tenant-defined content types with fields, relations, validation, localisation and versioning — reusing D13's schema vocabulary rather than inventing a second one | A tenant defines a `CaseStudy` type with 12 fields and localises it into three languages, with no code | OPEN |
| **F04** | Content workflow | F03, E05 | Draft → review → scheduled → published → archived, with preview links, approvals and scheduled publication | A scheduled post publishes at its time in the tenant's timezone. A reviewer approves from a preview link that expires | OPEN |
| **F05** | Asset pipeline | F01, B07 | Upload, transform, responsive variants, focal point, alt-text enforcement, CDN, quota | An image uploaded once serves correctly sized variants to every viewport. Publishing without alt text is refused | OPEN |
| **F06** | Multi-site routing and domains | F02, C26 | Custom domains, subdomains, path-based sites, certificates, redirects, `robots.txt`, sitemaps — building out `app/_sites` and `app/[slug]` | Three tenants serve three sites on three custom domains with valid auto-renewing certificates and no cross-talk | OPEN |
| **F07** | Rendering, caching and performance | F02, F06 | Static generation where possible, ISR, per-tenant cache isolation and correct invalidation on publish | A published change appears within its stated SLA, and a cache purge for one tenant never affects another. Core Web Vitals pass on a representative template | OPEN |
| **F08** | Public form handling and anti-abuse | F02, A20 | Contact, lead capture, application and quote forms writing into plane 3 through a **narrow, validated, rate-limited, spam-resistant** ingress | A public form creates a CRM lead and cannot be used to write anything else. Verified adversarially — this is the one legitimate plane-0 → plane-3 path and it must be the only one | OPEN |

---

## 3. Stage F-II · The Studio editor (Wave 5)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **F09** | Studio shell and site management | F06, G18 | The `builder/web/(hub)` surfaces made real: site list, settings, environments, publish history, rollback | A tenant creates a site, publishes it, and rolls back to a previous version from the UI | OPEN |
| **F10** | Visual page editor | F03, G17 | The 103-line `canvas` replaced by a real editor: section-based composition, drag-and-drop, inline editing, responsive preview, undo/redo | A non-technical user builds a five-section page and previews it at three breakpoints without assistance | OPEN |
| **F11** | Section and block library | B01–B12, F10 | A governed library of marketing and commerce sections — hero, features, pricing, testimonial, FAQ, team, gallery, CTA, product grid, cart, checkout, blog list, form — all token-based and a11y-clean | Every section passes the same `axe` and token gates as first-party UI. A hardcoded colour in a section fails CI | OPEN |
| **F12** | Theme system | B18, F11 | Tenant themes: token overrides, typography, spacing and colour, with contrast validation before publish | A theme failing WCAG AA contrast is rejected at save with the failing pair named. Switching theme never breaks a layout | OPEN |
| **F13** | Low-code and no-code logic in sites | G13, G14 | Conditional visibility, personalisation rules, A/B tests, dynamic collections and computed fields — the "developer friendly with most no/low code options" requirement | A personalisation rule is authored visually; an A/B test reports a result; neither requires code, and both run in the sandbox | OPEN |
| **F14** | Developer escape hatch | G14, G17, A18 | Custom code, template overrides and custom sections for tenants who want them — running under sandbox constraints, never as an exception to them | Custom site code is subject to the same governor limits and cannot read another tenant's data. Verified adversarially | OPEN |

---

## 4. Stage F-III · Template library (Wave 5)

`unierp-corporate-site-template` is currently a `package.json` (**D010**). Each phase below
delivers: a complete, responsive, accessible, localisable, SEO-correct template with realistic
seed content, its own theme, and a one-click instantiate.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **F15** | Template framework and instantiation | F09–F12 | The mechanism: templates as versioned, installable packages with seed content, and an upgrade path that does not destroy tenant edits | Instantiating a template produces a complete editable site in one action. A template update does not overwrite a tenant's changes | OPEN |
| **F16** | Corporate and business template | F15 | The template the empty `unierp-corporate-site-template` repo promises — closes D010 | Published, `axe`-clean, Core Web Vitals green, localisable, with realistic seed content | OPEN |
| **F17** | Ecommerce storefront template | F15, F19 | Catalogue, search, filters, product detail, cart, checkout, account, order history | A complete purchase is possible on the published store, and stock reflects `inventory` (E14) in real time | OPEN |
| **F18** | Portfolio, personal and agency templates | F15 | Portfolio, résumé, agency, photography — gallery- and case-study-oriented | Published, `axe`-clean, Core Web Vitals green, media-heavy pages still passing performance budgets | OPEN |
| **F19** | Commerce engine integration | E14, E16, E19, F02 | The storefront wired to real inventory, pricing, tax, shipping, payment and order flow — **through the F02 projection, never directly** | An online order becomes a real sales order with correct tax and stock reservation. Overselling is impossible under concurrent checkout | OPEN |
| **F20** | Vertical templates | F15, E26 | Templates for the supported verticals: clinic, school, property listing, field-service booking | Each vertical template integrates with its module — a clinic template books a real appointment | OPEN |
| **F21** | Portal and member-area templates | F15, D02 | Authenticated tenant portals: customer, supplier, employee, student, patient — with permission-scoped data | A customer logs into a published portal and sees only their own orders and invoices. Verified with a two-account test | OPEN |
| **F22** | Landing-page and campaign templates | F15, F13 | Conversion-oriented pages with A/B testing, tracking and lead routing into CRM via F08 | A campaign page routes a lead to the right CRM owner and reports conversion | OPEN |
| **F23** | Blog, documentation and knowledge-base templates | F15, F03 | Editorial and documentation templates with search, versioning, tags and feeds | A documentation site with 200 pages has working search and navigation, and its feed validates | OPEN |
| **F24** | Template marketplace | F15, G20 | Third-party templates: submission, review, pricing, revenue share — reusing G's marketplace rather than a second one | A third-party template is published, purchased and instantiated. Review and revocation follow G21 | OPEN |
| **F25** | SEO, analytics and compliance for published sites | F06, F07 | Metadata, structured data, canonical URLs, sitemaps, `hreflang`, privacy-respecting analytics, consent management and cookie policy | A published site passes an SEO audit and serves a compliant consent banner that actually gates non-essential cookies | OPEN |
| **F26** | Site accessibility and quality gate | F11, B23 | Publish blocked on accessibility and performance failures, with an actionable report | Publishing a site with `axe` violations or a failing performance budget is refused, and the report names each failure | OPEN |

---

## 5. Track exit criteria

- [ ] `unierp-corporate-site-template` is a real template, not a `package.json` (D010 closed)
- [ ] The public renderer provably cannot reach an unpublished record or any plane-3 table
- [ ] F08 is the **only** plane-0 → plane-3 write path, and it is narrow, validated, rate-limited
      and adversarially tested
- [ ] A non-technical user builds and publishes a site on a custom domain with a valid certificate,
      unaided
- [ ] At least eight production-quality templates exist across corporate, commerce, portfolio,
      vertical, portal, landing and documentation categories
- [ ] Every section and template passes the same `axe`, token and performance gates as first-party UI
- [ ] A complete purchase on a published store creates a correct sales order with correct tax and
      stock reservation; overselling is impossible under concurrency
- [ ] Custom site code runs under sandbox governor limits with no exception path
- [ ] Publishing is refused on accessibility or performance failure
- [ ] Three tenants on three custom domains have no observable cross-talk

---

## 6. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established. 26 phases in three stages. F02 (published-projection boundary) added as the first structural phase because `ARCHITECTURE.md` places published tenant sites in plane 0 — a renderer reaching plane-3 data would be a cross-tenant leak on a public URL. Hard-blocked on G09–G18 so the page runtime is not built twice. | Claude Code |
