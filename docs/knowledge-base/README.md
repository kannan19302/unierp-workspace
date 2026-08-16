---
name: unierp-ecosystem
description: Comprehensive architecture, page-by-page catalogue, API endpoints, database schemas, and multi-repo guide across all 31 UniERP repositories.
version: 1.0.0
author: UniERP Engineering & AI Pair Architect
---

# UniERP Ecosystem Skill & Knowledge Base

This skill provides an authoritative, single-source-of-truth reference for developing, debugging, navigating, and testing within the **UniERP** enterprise ecosystem. UniERP is a 10-year production multi-tenant ERP platform composed of **31 specialized repositories** spanning Layers L0 to L7.

---

## 🏛️ Layered Architecture & Boundary Rules

All code and dependencies must strictly follow the unidirectional layer hierarchy:

```
L7  OPERATIONS     workspace ── infra
L6  EXTENSIONS     extensions (public extension API only)
L5  CLIENTS        mobile ── desktop-app
L4  PRESENTATION   tenant-apps ── provider-admin-os ── tenant-admin ── web-studio ── marketing-site ── marketplace ── developer-platform ── tenant-sites
L3  SERVICE        api ── idp
L2  RUNTIME        data ── framework ── extension-api ── sandbox ── blockchain
L1  FOUNDATION     kernel ── design-system ── sdk ── shared ── auth ── config ── service-kit
L0  CONTRACT       contracts (depends on nothing at all)
```

> **Strict Rule:** A repository may depend only on published artifacts of a strictly lower layer. Never sideways. Never upward.

---

## 🚫 The 5 Inviolable Platform Laws (Rejected on Sight)

1. **Multi-Tenant Isolation**: Every database table must have a `tenantId` field and an explicit PostgreSQL Row-Level Security (RLS) policy in its migration (`setup-rls.sql`). No policy = instant security rejection.
2. **Permission Guarding**: Every backend API endpoint must register an explicit `@Permissions('...')` guard in the same commit. Unauthorized access returns **403 Forbidden** (never 404 or 500).
3. **Exact Currency Math**: No IEEE-754 floats near financial fields. Use `Decimal(19,4)` in Prisma and `decimal.js` in TypeScript. Arithmetic must remain in Decimal across recalculations.
4. **Design Tokens Only**: No hardcoded hex (`#ffffff`) or pixel (`px`) values in UI components or pages. Always use design system CSS tokens (`var(--token-...)`) to support the 7 themes and orthogonal density scale.
5. **No Disconnected Claims**: "No claim without a mechanism that can fail." Never claim tests pass or gates pass without running and demonstrating failing behavior when perturbed.

---

## 📚 Knowledge Base References

| Document | Description | Key Metrics |
| :--- | :--- | :--- |
| **[01-ECOSYSTEM-OVERVIEW.md](references/01-ECOSYSTEM-OVERVIEW.md)** | Multi-repo matrix, Layer hierarchy, Build order | 31 Repositories, L0–L7 |
| **[02-PAGE-CATALOGUE-TENANT-APPS.md](references/02-PAGE-CATALOGUE-TENANT-APPS.md)** | Full page catalogue for Tenant ERP Suite | **810 Pages**, 40+ Domains |
| **[03-PAGE-CATALOGUE-PROVIDER-ADMIN.md](references/03-PAGE-CATALOGUE-PROVIDER-ADMIN.md)** | Provider Admin OS Control Plane catalogue | **139 Pages**, 12 Core Domains |
| **[04-PAGE-CATALOGUE-TENANT-ADMIN.md](references/04-PAGE-CATALOGUE-TENANT-ADMIN.md)** | Tenant Admin Portal catalogue | **110 Pages**, 8 Sections |
| **[05-PAGE-CATALOGUE-WEB-STUDIO.md](references/05-PAGE-CATALOGUE-WEB-STUDIO.md)** | Web Studio Visual Designer catalogue | **62 Pages**, Visual Builder |
| **[06-PAGE-CATALOGUE-MARKETING-MARKETPLACE-SITES.md](references/06-PAGE-CATALOGUE-MARKETING-MARKETPLACE-SITES.md)** | Marketing, Marketplace & Hosted Sites | **77 Pages** combined |
| **[07-MOBILE-AND-CLIENTS-CATALOGUE.md](references/07-MOBILE-AND-CLIENTS-CATALOGUE.md)** | Flutter Mobile & Desktop Apps | **430 Flutter Screens**, 44 Modules |
| **[08-BACKEND-API-AND-IDP-CATALOGUE.md](references/08-BACKEND-API-AND-IDP-CATALOGUE.md)** | Backend API Modules & IDP Controllers | **574 Controllers** (API) + **14** (IDP) |
| **[09-DATABASE-SCHEMA-AND-DATA-CATALOGUE.md](references/09-DATABASE-SCHEMA-AND-DATA-CATALOGUE.md)** | Prisma Schemas, Models & RLS | **43 Schemas**, **1,910 Models** |
| **[10-DESIGN-SYSTEM-AND-STORYBOOK.md](references/10-DESIGN-SYSTEM-AND-STORYBOOK.md)** | Design Tokens, Themes & Storybook | 7 Themes, **49 Stories** |
| **[11-FOUNDATION-RUNTIME-OPERATIONS.md](references/11-FOUNDATION-RUNTIME-OPERATIONS.md)** | Foundation Libraries & Infra Ops | 13 Support Repositories |

---

## 🛠️ Typical Development Workflows

### 1. Adding a New Enterprise Feature (Build Order)
```
① MODEL     → contracts (DTOs, Events)
② DATABASE  → data (Prisma schema, migration, RLS policy in setup-rls.sql)
③ API       → api (NestJS module, Service, Controller with @Permissions)
④ AUTH      → idp / auth (Register permission, two-tenant isolation test)
⑤ UI        → tenant-apps / provider-admin-os (Design tokens only, framework components)
⑥ TEST      → E2E test, tenant isolation test, typecheck, lint
⑦ SHIP      → Append one line to docs/ai/CHANGELOG.md in unierp-workspace
```

### 2. Finding an Existing Page or API Endpoint
Before creating a new page or endpoint, search the reference catalogues. UniERP already contains **1,198 web routes**, **574 API controllers**, **430 mobile screens**, and **1,910 database models**.
