import fs from 'fs';
import path from 'path';

const allPages = JSON.parse(fs.readFileSync('d:/UniERP/unierp-workspace/scripts/all-pages.json', 'utf8'));
const backend = JSON.parse(fs.readFileSync('d:/UniERP/unierp-workspace/scripts/api-controllers.json', 'utf8'));
const schema = JSON.parse(fs.readFileSync('d:/UniERP/unierp-workspace/scripts/data-schema-report.json', 'utf8'));
const dsStories = JSON.parse(fs.readFileSync('d:/UniERP/unierp-workspace/scripts/ds-stories.json', 'utf8'));
const mobile = JSON.parse(fs.readFileSync('d:/UniERP/unierp-workspace/scripts/mobile-summary.json', 'utf8'));

const globalSkillsDir = 'C:/Users/kanna/.gemini/config/skills/unierp-ecosystem';
const workspaceSkillsDir = 'd:/UniERP/unierp-workspace/.agents/skills/unierp-ecosystem';
const workspaceDocsDir = 'd:/UniERP/unierp-workspace/docs/knowledge-base';

const targets = [
  { root: globalSkillsDir, isSkill: true },
  { root: workspaceSkillsDir, isSkill: true },
  { root: workspaceDocsDir, isSkill: false }
];

targets.forEach(t => {
  if (!fs.existsSync(t.root)) fs.mkdirSync(t.root, { recursive: true });
  const refDir = path.join(t.root, 'references');
  if (!fs.existsSync(refDir)) fs.mkdirSync(refDir, { recursive: true });
});

function writeDoc(fileName, content) {
  targets.forEach(t => {
    let filePath;
    if (fileName === 'SKILL.md' || fileName === 'INDEX.md') {
      filePath = t.isSkill ? path.join(t.root, 'SKILL.md') : path.join(t.root, 'README.md');
    } else {
      filePath = path.join(t.root, 'references', fileName);
    }
    fs.writeFileSync(filePath, content, 'utf8');
  });
  console.log('Successfully generated:', fileName);
}

// ----------------------------------------------------
// 1. SKILL.md
// ----------------------------------------------------
const skillMd = `---
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

\`\`\`
L7  OPERATIONS     workspace ── infra
L6  EXTENSIONS     extensions (public extension API only)
L5  CLIENTS        mobile ── desktop-app
L4  PRESENTATION   tenant-apps ── provider-admin-os ── tenant-admin ── web-studio ── marketing-site ── marketplace ── developer-platform ── tenant-sites
L3  SERVICE        api ── idp
L2  RUNTIME        data ── framework ── extension-api ── sandbox ── blockchain
L1  FOUNDATION     kernel ── design-system ── sdk ── shared ── auth ── config ── service-kit
L0  CONTRACT       contracts (depends on nothing at all)
\`\`\`

> **Strict Rule:** A repository may depend only on published artifacts of a strictly lower layer. Never sideways. Never upward.

---

## 🚫 The 5 Inviolable Platform Laws (Rejected on Sight)

1. **Multi-Tenant Isolation**: Every database table must have a \`tenantId\` field and an explicit PostgreSQL Row-Level Security (RLS) policy in its migration (\`setup-rls.sql\`). No policy = instant security rejection.
2. **Permission Guarding**: Every backend API endpoint must register an explicit \`@Permissions('...')\` guard in the same commit. Unauthorized access returns **403 Forbidden** (never 404 or 500).
3. **Exact Currency Math**: No IEEE-754 floats near financial fields. Use \`Decimal(19,4)\` in Prisma and \`decimal.js\` in TypeScript. Arithmetic must remain in Decimal across recalculations.
4. **Design Tokens Only**: No hardcoded hex (\`#ffffff\`) or pixel (\`px\`) values in UI components or pages. Always use design system CSS tokens (\`var(--token-...)\`) to support the 7 themes and orthogonal density scale.
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
\`\`\`
① MODEL     → contracts (DTOs, Events)
② DATABASE  → data (Prisma schema, migration, RLS policy in setup-rls.sql)
③ API       → api (NestJS module, Service, Controller with @Permissions)
④ AUTH      → idp / auth (Register permission, two-tenant isolation test)
⑤ UI        → tenant-apps / provider-admin-os (Design tokens only, framework components)
⑥ TEST      → E2E test, tenant isolation test, typecheck, lint
⑦ SHIP      → Append one line to docs/ai/CHANGELOG.md in unierp-workspace
\`\`\`

### 2. Finding an Existing Page or API Endpoint
Before creating a new page or endpoint, search the reference catalogues. UniERP already contains **1,198 web routes**, **574 API controllers**, **430 mobile screens**, and **1,910 database models**.
`;

writeDoc('SKILL.md', skillMd);

// ----------------------------------------------------
// 2. 01-ECOSYSTEM-OVERVIEW.md
// ----------------------------------------------------
const doc01 = `# 01 — UniERP Ecosystem Overview & Repository Matrix

## 🌐 Platform Summary
UniERP is a full-stack, enterprise-grade Multi-Tenant Enterprise Resource Planning platform designed for 10-year production lifecycles. The codebase is organized across **31 specialized repositories** structured strictly into 8 architectural layers (L0 to L7).

---

## 📊 Comprehensive Repository Matrix

| Layer | Repository Directory | npm Package / ID | Tech Stack | Responsibility & Highlights |
| :--- | :--- | :--- | :--- | :--- |
| **L0** | \`unierp-contracts\` | \`@kannan19302/contracts\` | TypeScript, Zod | Pure DTOs, API contracts, RPC specifications, Event schemas (107 files) |
| **L1** | \`kernel\` | \`@kannan19302/kernel\` | TypeScript | Microkernel core, event bus, base interfaces, lifecycle primitives (38 files) |
| **L1** | \`design-system\` | \`@kannan19302/ui\` | React, CSS Tokens | 7 Themes, Orthogonal density, 49 Component Storybooks (212 files) |
| **L1** | \`sdk\` | \`@kannan19302/sdk\` | TypeScript | Strongly-typed TypeScript client SDK bindings for UniERP APIs (22 files) |
| **L1** | \`shared\` | \`@kannan19302/shared\` | TypeScript, Zod, date-fns | Common utilities, timezone converters, string/number formatters (57 files) |
| **L1** | \`auth\` | \`@kannan19302/auth\` | TypeScript | IAM client, JWT decoding, auth guards, token refresh flows (18 files) |
| **L1** | \`config\` | \`@kannan19302/config\` | TypeScript, Zod | Central configuration management, schema validation (22 files) |
| **L1** | \`service-kit\` | \`@kannan19302/service-kit\` | NestJS, TypeScript | Microservice bootstrap, logging interceptors, metrics, tracing (30 files) |
| **L2** | \`data\` | \`@kannan19302/data\` | Prisma, PostgreSQL | 43 multi-file Prisma schemas, RLS policies (\`setup-rls.sql\`), 1,910 models (316 files) |
| **L2** | \`framework\` | \`@kannan19302/framework\` | TypeScript | Dynamic plugin lifecycle manager, hook registry, runtime kernel (67 files) |
| **L2** | \`extension-api\` | \`@kannan19302/extension-api\` | TypeScript | Public safe extensibility API & hook contracts (26 files) |
| **L2** | \`sandbox\` | \`@kannan19302/sandbox\` | TypeScript, isolated-vm | Secure V8 sandbox runner with governor & memory limits (89 files) |
| **L2** | \`blockchain\` | \`@kannan19302/blockchain\` | Solidity, Web3 | Ledger hash verification, audit proofs, immutable hash logs (18 files) |
| **L3** | \`api\` | \`@kannan19302/api\` | NestJS, Prisma, Fastify | 46 Domain Business Modules, 574 Controllers, RBAC/ABAC guards (380+ files) |
| **L3** | \`idp\` | \`@kannan19302/idp\` | NestJS, OIDC, WebAuthn | OIDC/OAuth2 Server, SAML, Passkeys, SCIM, 14 Controllers, 18 Services (242 files) |
| **L4** | \`tenant-apps\` | \`@kannan19302/web\` | Next.js, React, Zustand | Multi-tenant ERP Suite with **810 route pages** across 40+ domains (3,584 files) |
| **L4** | \`provider-admin-os\`| \`@kannan19302/console\` | Next.js, React | Provider SuperAdmin Control Plane with **139 route pages** (225 files) |
| **L4** | \`tenant-admin\` | \`@kannan19302/tenant-admin\` | Next.js, React | Tenant Organization Administration Portal with **110 route pages** (222 files) |
| **L4** | \`web-studio\` | \`@kannan19302/web-studio\` | Next.js, React | Visual Site, Page & Form Designer with **62 route pages** (131 files) |
| **L4** | \`marketing-site\` | \`@kannan19302/corporate-website\` | Next.js, React | Corporate website, solutions, pricing, docs with **45 route pages** (269 files) |
| **L4** | \`marketplace\` | \`@kannan19302/marketplace\` | Next.js, React | App Store, Connectors, Discovery, Installed plugins with **17 route pages** (48 files) |
| **L4** | \`developer-platform\`| \`@kannan19302/developer\` | Next.js, React | Low-code Page/Form/Dashboard builders with **7 route pages** (97 files) |
| **L4** | \`tenant-sites\` | \`@kannan19302/tenant-sites\` | Next.js, React | Hosted Multi-tenant site manager with **8 route pages** (24 files) |
| **L4** | \`tenant-site-template\`| \`@kannan19302/corporate-site-template\` | React | Pre-built corporate site template for tenant deployment (13 files) |
| **L4** | \`storybook\` | \`@kannan19302/storybook\` | Storybook, Vite | Visual testing harness, 49 interactive component stories (1,629 files) |
| **L5** | \`unierp-mobile\` | \`unierp_mobile\` | Flutter, Dart, BLoC | Cross-platform Mobile App with 44 feature modules, 430 screens (981 files) |
| **L5** | \`desktop-app\` | \`@kannan19302/desktop-app\`| Electron/Tauri | Desktop client application (13 files) |
| **L6** | \`extensions\` | \`@kannan19302/extensions\` | TypeScript | Public and third-party extension packages (65 files) |
| **L7** | \`infra\` | \`@kannan19302/infra\` | Docker, K8s, Helm | Orchestration, Docker Compose, Kubernetes, CI/CD, Observability (59 files) |
| **L7** | \`unierp-workspace\` | \`@kannan19302/unierp-workspace\`| Node.js, Markdown | Governance docs (\`docs/ai/\`), 3,631 phase development tracker, ADP (555 files) |
| **-**  | \`unierp-platform\` | \`@kannan19302/UniERP\` | Umbrella Meta Repo | Root monorepo / governance checkout mirror |

---

## 🔒 Layer Rules & Dependency Rules
1. **Unidirectional Dependencies**: A package in Layer $N$ may only import packages in Layer $M$ where $M < N$.
2. **No Sideways Dependencies**: Two packages at the same layer (e.g. \`api\` and \`idp\`) may not depend on each other directly; they communicate via \`contracts\` (L0) or asynchronous events.
3. **No Upward Dependencies**: A lower layer package (e.g. \`data\` or \`kernel\`) can NEVER import from \`api\`, \`tenant-apps\`, or any L3–L7 package.

---

## 📦 Package Publishing Protocol
- **Public npm Registry Scope**: \`@kannan19302/*\` (registry: \`https://registry.npmjs.org/\`).
- **OIDC Trusted Publishing**: Tokenless publishing triggered by \`v*.*.*\` tags.
- **Never publish \`workspace:*\`**: All dependencies must resolve to concrete semver ranges before publishing.
`;

writeDoc('01-ECOSYSTEM-OVERVIEW.md', doc01);

// ----------------------------------------------------
// 3. 02-PAGE-CATALOGUE-TENANT-APPS.md
// ----------------------------------------------------
const tenantAppPages = allPages.tenantApps;

// Group tenant apps by module
const taGroups = {};
for (const p of tenantAppPages) {
  let parts = p.split('/');
  let mod = parts[1] || 'root';
  if (mod.startsWith('(')) {
    mod = parts[2] || parts[1];
  }
  if (!taGroups[mod]) taGroups[mod] = [];
  taGroups[mod].push(p);
}

let doc02 = `# 02 — Tenant Apps (Web ERP) Page-by-Page Catalogue

## 📱 Repository: \`tenant-apps\` (\`@kannan19302/web\`)
- **Total Route Pages**: **${tenantAppPages.length} pages**
- **Architecture**: Next.js App Router (\`app/\`), React 18, Zustand, TanStack Query, DnD Kit, Tailwind CSS Variables (Design Tokens).
- **Core Role**: Main multi-tenant business portal accessed by tenant employees, managers, and administrators to run daily enterprise operations.

---

## 📑 Module Summary Index

| Domain Module | Page Count | Key Capabilities |
| :--- | :--- | :--- |
`;

for (const [mod, list] of Object.entries(taGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc02 += `| **\`${mod}\`** | ${list.length} pages | [Jump to ${mod}](#module-${mod.toLowerCase()}) |\n`;
}

doc02 += `\n---\n\n## 🔍 Granular Page Directory by Domain\n\n`;

for (const [mod, list] of Object.entries(taGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc02 += `### <a id="module-${mod.toLowerCase()}"></a> 📦 Domain Module: \`${mod}\` (${list.length} pages)\n\n`;
  doc02 += `| Route Path | File Location | Purpose & UI Role |\n`;
  doc02 += `| :--- | :--- | :--- |\n`;
  for (const page of list) {
    let cleanRoute = page
      .replace(/^app\//, '/')
      .replace(/\/page\.(tsx|jsx|js|ts)$/, '')
      .replace(/\/\(dashboard\)/, '')
      .replace(/\/\(auth\)/, '')
      .replace(/\/\(storefront\)/, '');
    if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
    if (cleanRoute === '') cleanRoute = '/';
    doc02 += `| \`${cleanRoute}\` | [\`${page}\`](file:///d:/UniERP/tenant-apps/${page}) | Enterprise UI View for \`${cleanRoute}\` |\n`;
  }
  doc02 += `\n`;
}

writeDoc('02-PAGE-CATALOGUE-TENANT-APPS.md', doc02);

// ----------------------------------------------------
// 4. 03-PAGE-CATALOGUE-PROVIDER-ADMIN.md
// ----------------------------------------------------
const providerPages = allPages.providerAdmin;
const paGroups = {};
for (const p of providerPages) {
  let parts = p.split('/');
  let mod = parts[1] || 'root';
  if (mod.startsWith('(')) {
    mod = parts[2] || parts[1];
  }
  if (!paGroups[mod]) paGroups[mod] = [];
  paGroups[mod].push(p);
}

let doc03 = `# 03 — Provider Admin OS (Control Plane) Page-by-Page Catalogue

## 🛡️ Repository: \`provider-admin-os\` (\`@kannan19302/console\`)
- **Total Route Pages**: **${providerPages.length} pages**
- **Architecture**: Next.js App Router (\`app/\`), React 18, Lucide React, Socket.io, Design System Tokens.
- **Core Role**: SuperAdmin Control Plane used by the SaaS provider / cloud operators to manage tenants, global infrastructure, billing, platform security, AI model gateways, and marketplace publishing.

---

## 📑 Control Plane Modules

| Section | Pages | Primary Functions |
| :--- | :--- | :--- |
`;

for (const [mod, list] of Object.entries(paGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc03 += `| **\`${mod}\`** | ${list.length} pages | [Jump to ${mod}](#section-${mod.toLowerCase()}) |\n`;
}

doc03 += `\n---\n\n## 🔍 Granular Page Directory by Section\n\n`;

for (const [mod, list] of Object.entries(paGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc03 += `### <a id="section-${mod.toLowerCase()}"></a> 🛠️ Section: \`${mod}\` (${list.length} pages)\n\n`;
  doc03 += `| Control Plane Route | File Location | Operational Purpose |\n`;
  doc03 += `| :--- | :--- | :--- |\n`;
  for (const page of list) {
    let cleanRoute = page
      .replace(/^app\//, '/')
      .replace(/\/page\.(tsx|jsx|js|ts)$/, '')
      .replace(/\/\(control-plane\)/, '')
      .replace(/\/\(auth\)/, '');
    if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
    if (cleanRoute === '') cleanRoute = '/';
    doc03 += `| \`${cleanRoute}\` | [\`${page}\`](file:///d:/UniERP/provider-admin-os/${page}) | Provider Control Plane UI for \`${cleanRoute}\` |\n`;
  }
  doc03 += `\n`;
}

writeDoc('03-PAGE-CATALOGUE-PROVIDER-ADMIN.md', doc03);

// ----------------------------------------------------
// 5. 04-PAGE-CATALOGUE-TENANT-ADMIN.md
// ----------------------------------------------------
const tenantAdminPages = allPages.tenantAdmin;
const taAdminGroups = {};
for (const p of tenantAdminPages) {
  let parts = p.split('/');
  let mod = parts[1] || 'root';
  if (!taAdminGroups[mod]) taAdminGroups[mod] = [];
  taAdminGroups[mod].push(p);
}

let doc04 = `# 04 — Tenant Admin OS Page-by-Page Catalogue

## 🏢 Repository: \`tenant-admin\` (\`@kannan19302/tenant-admin\`)
- **Total Route Pages**: **${tenantAdminPages.length} pages**
- **Architecture**: Next.js App Router (\`app/\`), React, Design Tokens.
- **Core Role**: Dedicated tenant-level administration portal where tenant organization administrators configure roles, manage employee accounts, monitor resource quotas, manage subscriptions, generate API keys, and review security audit trails.

---

## 📑 Tenant Admin Sections

| Section | Page Count | Administrative Scope |
| :--- | :--- | :--- |
`;

for (const [mod, list] of Object.entries(taAdminGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc04 += `| **\`${mod}\`** | ${list.length} pages | [Jump to ${mod}](#admin-${mod.toLowerCase()}) |\n`;
}

doc04 += `\n---\n\n## 🔍 Granular Page Directory\n\n`;

for (const [mod, list] of Object.entries(taAdminGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc04 += `### <a id="admin-${mod.toLowerCase()}"></a> ⚙️ Admin Section: \`${mod}\` (${list.length} pages)\n\n`;
  doc04 += `| Admin Route | File Location | Administrative Function |\n`;
  doc04 += `| :--- | :--- | :--- |\n`;
  for (const page of list) {
    let cleanRoute = page.replace(/^app\//, '/').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
    if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
    if (cleanRoute === '') cleanRoute = '/';
    doc04 += `| \`${cleanRoute}\` | [\`${page}\`](file:///d:/UniERP/tenant-admin/${page}) | Admin Console View for \`${cleanRoute}\` |\n`;
  }
  doc04 += `\n`;
}

writeDoc('04-PAGE-CATALOGUE-TENANT-ADMIN.md', doc04);

// ----------------------------------------------------
// 6. 05-PAGE-CATALOGUE-WEB-STUDIO.md
// ----------------------------------------------------
const webStudioPages = allPages.webStudio;
const wsGroups = {};
for (const p of webStudioPages) {
  let parts = p.split('/');
  let mod = parts[1] || 'root';
  if (!wsGroups[mod]) wsGroups[mod] = [];
  wsGroups[mod].push(p);
}

let doc05 = `# 05 — Web Studio (Visual Site & Form Builder) Page-by-Page Catalogue

## 🎨 Repository: \`web-studio\` (\`@kannan19302/web-studio\`)
- **Total Route Pages**: **${webStudioPages.length} pages**
- **Architecture**: Next.js App Router (\`app/\`), Visual Canvas, Monaco Editor, Component Palette.
- **Core Role**: No-code and Low-code visual design environment allowing tenants to create custom website pages, enterprise forms, custom dashboard widgets, and embed them directly into tenant storefronts or internal workflows.

---

## 📑 Studio Sections

| Toolset | Page Count | Visual Builder Features |
| :--- | :--- | :--- |
`;

for (const [mod, list] of Object.entries(wsGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc05 += `| **\`${mod}\`** | ${list.length} pages | [Jump to ${mod}](#studio-${mod.toLowerCase()}) |\n`;
}

doc05 += `\n---\n\n## 🔍 Granular Page Directory\n\n`;

for (const [mod, list] of Object.entries(wsGroups).sort((a,b) => b[1].length - a[1].length)) {
  doc05 += `### <a id="studio-${mod.toLowerCase()}"></a> 🖌️ Studio Toolset: \`${mod}\` (${list.length} pages)\n\n`;
  doc05 += `| Studio Route | File Location | Studio Capability |\n`;
  doc05 += `| :--- | :--- | :--- |\n`;
  for (const page of list) {
    let cleanRoute = page.replace(/^app\//, '/').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
    if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
    if (cleanRoute === '') cleanRoute = '/';
    doc05 += `| \`${cleanRoute}\` | [\`${page}\`](file:///d:/UniERP/web-studio/${page}) | Visual Studio Interface for \`${cleanRoute}\` |\n`;
  }
  doc05 += `\n`;
}

writeDoc('05-PAGE-CATALOGUE-WEB-STUDIO.md', doc05);

// ----------------------------------------------------
// 7. 06-PAGE-CATALOGUE-MARKETING-MARKETPLACE-SITES.md
// ----------------------------------------------------
let doc06 = `# 06 — Marketing Site, Marketplace, Developer Portal & Hosted Sites Catalogue

This document catalogues the remaining public-facing, developer, and multi-tenant storefront presentation repositories.

---

## 1. 🌐 Marketing Site (\`marketing-site\`)
- **Total Pages**: **${allPages.marketingSite.length} pages**
- **Repository**: \`marketing-site\` (\`@kannan19302/corporate-website\`)
- **Purpose**: Public corporate web presence, solution landing pages, pricing calculators, case studies, and enterprise sales leads.

| Route | File | Scope |
| :--- | :--- | :--- |
`;

for (const p of allPages.marketingSite) {
  let cleanRoute = p.replace(/^app\//, '/').replace(/\/\(site\)/, '').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
  if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
  if (cleanRoute === '') cleanRoute = '/';
  doc06 += `| \`${cleanRoute}\` | [\`${p}\`](file:///d:/UniERP/marketing-site/${p}) | Corporate Marketing Page |\n`;
}

doc06 += `\n---\n\n## 2. 🏪 Extension Marketplace (\`marketplace\`)\n- **Total Pages**: **${allPages.marketplace.length} pages**\n- **Repository**: \`marketplace\` (\`@kannan19302/marketplace\`)\n- **Purpose**: Extension store, third-party connector catalogue, reviews, discovery, and update manager.\n\n| Marketplace Route | File | Feature Area |\n| :--- | :--- | :--- |\n`;

for (const p of allPages.marketplace) {
  let cleanRoute = p.replace(/^app\//, '/').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
  if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
  if (cleanRoute === '') cleanRoute = '/';
  doc06 += `| \`${cleanRoute}\` | [\`${p}\`](file:///d:/UniERP/marketplace/${p}) | Marketplace Storefront |\n`;
}

doc06 += `\n---\n\n## 3. 👩‍💻 Developer Platform (\`developer-platform\`)\n- **Total Pages**: **${allPages.developerPlatform.length} pages**\n- **Repository**: \`developer-platform\` (\`@kannan19302/developer\`)\n- **Purpose**: Developer dashboard, form builder, page builder, and workflow automation designer.\n\n| Developer Route | File | Builder Capability |\n| :--- | :--- | :--- |\n`;

for (const p of allPages.developerPlatform) {
  let cleanRoute = p.replace(/^src\/app\//, '/').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
  if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
  if (cleanRoute === '') cleanRoute = '/';
  doc06 += `| \`${cleanRoute}\` | [\`${p}\`](file:///d:/UniERP/developer-platform/${p}) | Developer Studio Builder |\n`;
}

doc06 += `\n---\n\n## 4. 🌍 Hosted Multi-Tenant Sites (\`tenant-sites\`)\n- **Total Pages**: **${allPages.tenantSites.length} pages**\n- **Repository**: \`tenant-sites\` (\`@kannan19302/tenant-sites\`)\n- **Purpose**: Hosted multi-tenant site runtime, custom domain mapping, SEO optimization, and analytics.\n\n| Site Route | File | Multi-tenant Feature |\n| :--- | :--- | :--- |\n`;

for (const p of allPages.tenantSites) {
  let cleanRoute = p.replace(/^app\//, '/').replace(/\/page\.(tsx|jsx|js|ts)$/, '');
  if (!cleanRoute.startsWith('/')) cleanRoute = '/' + cleanRoute;
  if (cleanRoute === '') cleanRoute = '/';
  doc06 += `| \`${cleanRoute}\` | [\`${p}\`](file:///d:/UniERP/tenant-sites/${p}) | Hosted Site Management |\n`;
}

writeDoc('06-PAGE-CATALOGUE-MARKETING-MARKETPLACE-SITES.md', doc06);

// ----------------------------------------------------
// 8. 07-MOBILE-AND-CLIENTS-CATALOGUE.md
// ----------------------------------------------------
let doc07 = `# 07 — Mobile & Desktop Clients Catalogue

## 📱 Mobile Client: \`unierp-mobile\` (\`unierp_mobile\`)
- **Total Dart Files**: **${mobile.totalDartFiles} files**
- **Total Screens/Views/Pages**: **${mobile.screens.length} screens**
- **Architecture**: Flutter (iOS & Android), Clean Architecture, BLoC pattern, Offline-first database (SQLite/Isar), Biometric Auth, Device Camera/Barcode scanning, Push Notifications.
- **Coverage**: 44 Enterprise Modules replicated natively for mobile field workers, warehouse operators, and executives.

---

### 📂 Mobile Feature Modules (44 Modules)

| Feature Module | Screen Count | Key Mobile Screen Views |
| :--- | :--- | :--- |
`;

const mobileFeatures = {};
for (const s of mobile.screens) {
  const parts = s.split('/');
  const feat = parts[1] || 'core';
  if (!mobileFeatures[feat]) mobileFeatures[feat] = [];
  mobileFeatures[feat].push(s);
}

for (const [feat, list] of Object.entries(mobileFeatures).sort((a,b) => b[1].length - a[1].length)) {
  doc07 += `| **\`${feat}\`** | ${list.length} screens | ${list.slice(0, 3).map(p => path.basename(p)).join(', ')}${list.length > 3 ? '...' : ''} |\n`;
}

doc07 += `\n---\n\n## 🔍 Granular Mobile Screens Directory\n\n`;

for (const [feat, list] of Object.entries(mobileFeatures).sort((a,b) => b[1].length - a[1].length)) {
  doc07 += `### 📱 Mobile Module: \`${feat}\` (${list.length} screens)\n\n`;
  doc07 += `| Screen Name | File Path | Mobile Functionality |\n`;
  doc07 += `| :--- | :--- | :--- |\n`;
  for (const screen of list) {
    const name = path.basename(screen, '.dart');
    doc07 += `| \`${name}\` | [\`${screen}\`](file:///d:/UniERP/unierp-mobile/lib/${screen}) | Flutter Screen View |\n`;
  }
  doc07 += `\n`;
}

doc07 += `\n---\n\n## 💻 Desktop Client: \`desktop-app\` (\`@kannan19302/desktop-app\`)\n- **Architecture**: Electron / Tauri Desktop container wrapping UniERP presentation.\n- **Features**: Native OS system tray, direct hardware thermal printer integration, offline POS caching, multi-window support.\n`;

writeDoc('07-MOBILE-AND-CLIENTS-CATALOGUE.md', doc07);

// ----------------------------------------------------
// 9. 08-BACKEND-API-AND-IDP-CATALOGUE.md
// ----------------------------------------------------
const apiCtrls = backend.apiControllers;
const idpCtrls = backend.idpControllers;

let doc08 = `# 08 — Backend API & Identity Provider (IDP) Services Catalogue

This document details the complete backend service architecture, NestJS modules, REST controllers, HTTP endpoints, and \`@Permissions\` authorization guards across Layer L3 services.

---

## 1. ⚙️ UniERP API (\`api\`)
- **Repository**: \`api\` (\`@kannan19302/api\`)
- **Controllers Count**: **${apiCtrls.length} NestJS Controllers**
- **Domain Modules Count**: **46 Business Modules**
- **Architecture**: NestJS, Fastify, Prisma ORM, Outbox Pattern for event emission, JWT / OIDC Auth Guards, Decimal(19,4) arithmetic.

### 📑 46 Domain API Modules Summary

| Module Name | Controllers Count | Key Controller Prefixes |
| :--- | :--- | :--- |
`;

const apiModules = {};
for (const c of apiCtrls) {
  const parts = c.file.split('/');
  const mod = parts[1] || 'root';
  if (!apiModules[mod]) apiModules[mod] = [];
  apiModules[mod].push(c);
}

for (const [mod, list] of Object.entries(apiModules).sort((a,b) => b[1].length - a[1].length)) {
  doc08 += `| **\`${mod}\`** | ${list.length} controllers | ${list.slice(0, 3).map(c => '\`' + (c.prefix || '/') + '\`').join(', ')} |\n`;
}

doc08 += `\n---\n\n### 🔍 Granular API Controllers Directory\n\n`;

for (const [mod, list] of Object.entries(apiModules).sort((a,b) => b[1].length - a[1].length)) {
  doc08 += `#### 📦 Module: \`${mod}\` (${list.length} controllers)\n\n`;
  doc08 += `| Controller File | Route Prefix | Endpoints | Permissions Required |\n`;
  doc08 += `| :--- | :--- | :--- | :--- |\n`;
  for (const ctrl of list) {
    const perms = ctrl.permissions.length > 0 ? ctrl.permissions.map(p => '\`' + p + '\`').join(', ') : '_Inherited Guard_';
    doc08 += `| [\`${ctrl.file}\`](file:///d:/UniERP/api/src/${ctrl.file}) | \`/${ctrl.prefix}\` | ${ctrl.endpointsCount} endpoints | ${perms} |\n`;
  }
  doc08 += `\n`;
}

doc08 += `\n---\n\n## 2. 🛡️ Identity Provider (\`idp\`)\n- **Repository**: \`idp\` (\`@kannan19302/idp\`)\n- **Controllers Count**: **${idpCtrls.length} Controllers**\n- **Services Count**: **18 Services**\n- **Protocols**: OpenID Connect (OIDC), OAuth2 (PKCE), SAML 2.0, WebAuthn (Passkeys), SCIM 2.0 User Provisioning, MFA (TOTP/SMS/Push).\n\n| IDP Controller File | Route Prefix | Endpoints | Security Protocols |\n| :--- | :--- | :--- | :--- |\n`;

for (const ctrl of idpCtrls) {
  doc08 += `| [\`${ctrl.file}\`](file:///d:/UniERP/idp/src/${ctrl.file}) | \`/${ctrl.prefix}\` | ${ctrl.endpointsCount} endpoints | OIDC / OAuth2 / SCIM |\n`;
}

writeDoc('08-BACKEND-API-AND-IDP-CATALOGUE.md', doc08);

// ----------------------------------------------------
// 10. 09-DATABASE-SCHEMA-AND-DATA-CATALOGUE.md
// ----------------------------------------------------
let doc09 = `# 09 — Database Schema, Prisma Models & Tenant Isolation Catalogue

## 🗄️ Repository: \`data\` (\`@kannan19302/data\`)
- **Total Schema Files**: **${schema.length} multi-file Prisma schemas**
- **Total Prisma Models**: **${schema.reduce((acc, f) => acc + f.modelsCount, 0)} database models**
- **Total Enums**: **${schema.reduce((acc, f) => acc + f.enumsCount, 0)} enums**
- **Database Engine**: PostgreSQL 16+ with Row-Level Security (RLS).
- **Core Isolation Rule**: 100% of tenant-scoped tables carry \`tenantId\` + PostgreSQL RLS policies applied via \`setup-rls.sql\` during migrations.

---

## 📑 43 Schema Files Directory

| Schema File | Models Count | Enums Count | Sample Models Included |
| :--- | :--- | :--- | :--- |
`;

for (const s of schema.sort((a,b) => b.modelsCount - a.modelsCount)) {
  const sample = s.models.slice(0, 3).map(m => '\`' + m.modelName + '\`').join(', ');
  doc09 += `| [\`${s.file}\`](file:///d:/UniERP/data/prisma/schema/${s.file}) | ${s.modelsCount} models | ${s.enumsCount} enums | ${sample}${s.modelsCount > 3 ? '...' : ''} |\n`;
}

doc09 += `\n---\n\n## 🔍 Granular Model Inventory by Schema File\n\n`;

for (const s of schema.sort((a,b) => b.modelsCount - a.modelsCount)) {
  doc09 += `### 📄 Schema: \`${s.file}\` (${s.modelsCount} models, ${s.enumsCount} enums)\n\n`;
  doc09 += `| Model Name | Field Count | Tenant Isolated (\`tenantId\`) | Sample Fields |\n`;
  doc09 += `| :--- | :--- | :--- | :--- |\n`;
  for (const m of s.models) {
    const isIso = m.hasTenantId ? '✅ Yes (\`tenantId\`)' : '🌐 Global / Reference';
    doc09 += `| **\`${m.modelName}\`** | ${m.fieldCount} fields | ${isIso} | \`${m.fields.join(', ')}\` |\n`;
  }
  doc09 += `\n`;
}

doc09 += `\n---\n\n## 🔒 Row-Level Security (RLS) Enforcement Architecture\n\`\`\`sql\n-- Standard RLS Policy Pattern in setup-rls.sql\nALTER TABLE "TableName" ENABLE ROW LEVEL SECURITY;\nCREATE POLICY tenant_isolation_policy ON "TableName"\n  FOR ALL\n  USING ("tenantId" = current_setting('app.current_tenant_id', true)::uuid);\n\`\`\`\n`;

writeDoc('09-DATABASE-SCHEMA-AND-DATA-CATALOGUE.md', doc09);

// ----------------------------------------------------
// 11. 10-DESIGN-SYSTEM-AND-STORYBOOK.md
// ----------------------------------------------------
let doc10 = `# 10 — Design System, Tokens & Storybook Component Catalogue

## 🎨 Repositories: \`design-system\` (\`@kannan19302/ui\`) & \`storybook\`
- **Total Stories Count**: **${dsStories.length} Component Stories**
- **Token Themes**: 7 Distinct Themes (\`light\`, \`dark\`, \`midnight\`, \`corporate\`, \`high-contrast\`, \`emerald\`, \`sapphire\`).
- **Density Scales**: Orthogonal Density Scale (\`compact\`, \`default\`, \`spacious\`).
- **Accessibility Standards**: WCAG 2.1 AAA Compliant with full keyboard navigation and high-contrast support.

---

## 📑 Component Storybook Catalogue

| Category | Component Story | File Location |
| :--- | :--- | :--- |
`;

for (const story of dsStories.sort()) {
  const parts = story.split('/');
  const cat = parts[0] || 'general';
  const name = path.basename(story, '.stories.tsx');
  doc10 += `| **\`${cat}\`** | \`${name}\` | [\`${story}\`](file:///d:/UniERP/design-system/src/${story}) |\n`;
}

doc10 += `\n---\n\n## 🎨 Token Usage Rules\n- **Strict Rule:** Never use raw hex colors (\`#000000\`) or raw pixel widths (\`16px\`).\n- **Correct:** \`background-color: var(--token-surface-primary);\`, \`padding: var(--token-spacing-md);\`, \`font-size: var(--token-text-base);\`, \`color: var(--token-text-primary);\`, \`border-radius: var(--token-radius-md);\`. \n`;

writeDoc('10-DESIGN-SYSTEM-AND-STORYBOOK.md', doc10);

// ----------------------------------------------------
// 12. 11-FOUNDATION-RUNTIME-OPERATIONS.md
// ----------------------------------------------------
const doc11 = `# 11 — Foundation, Runtime & Operations Guide

This document details the support, runtime, and operational repositories across UniERP.

---

## 1. 🏗️ Foundation Repositories (Layer L1)

### \`kernel\` (\`@kannan19302/kernel\`)
- **Role**: Microkernel core, event bus, base lifecycle hooks, typed event emitters.
- **Key Modules**: \`EventBus\`, \`LifecycleManager\`, \`BaseEntity\`, \`Result<T, E>\`.

### \`unierp-contracts\` (\`@kannan19302/contracts\`)
- **Role**: Pure Layer L0 contracts, Zod DTOs, API specifications, RPC interfaces, outbox event payloads.
- **Independence**: 0 external dependencies.

### \`sdk\` (\`@kannan19302/sdk\`)
- **Role**: TypeScript client SDK providing strongly typed API clients for web and mobile frontends.

### \`shared\` (\`@kannan19302/shared\`)
- **Role**: Cross-cutting utilities, Decimal arithmetic helpers, date-fns timezone formatters, validation utilities.

### \`auth\` (\`@kannan19302/auth\`)
- **Role**: Client authentication helpers, JWT decoder, token refresh handlers, permission checking utility.

### \`config\` (\`@kannan19302/config\`)
- **Role**: Central environment schema validation, runtime config loading, secret managers.

### \`service-kit\` (\`@kannan19302/service-kit\`)
- **Role**: Shared NestJS / Fastify microservice toolkit, OpenTelemetry tracing interceptor, standard logging formatter, health checks.

---

## 2. ⚡ Runtime Repositories (Layer L2)

### \`framework\` (\`@kannan19302/framework\`)
- **Role**: Dynamic plugin engine, hook dispatcher, extension lifecycle governor.

### \`extension-api\` (\`@kannan19302/extension-api\`)
- **Role**: Public API surface exposed to third-party plugins and developers.

### \`sandbox\` (\`@kannan19302/sandbox\`)
- **Role**: Isolated V8 execution sandbox (\`isolated-vm\`) with CPU execution governor, memory ceilings, and call limits.

### \`blockchain\` (\`@kannan19302/blockchain\`)
- **Role**: Smart contracts and cryptographic audit trail verification. Anchors state root hashes to public/private ledgers.

---

## 3. 🚢 Extensions & Operations (Layers L6 & L7)

### \`extensions\` (\`@kannan19302/extensions\`)
- **Role**: Pre-built extension plugins (payment gateways, CRM synchronizers, logistics trackers).

### \`infra\` (\`@kannan19302/infra\`)
- **Role**: Docker Compose multi-service stacks, Kubernetes Helm charts, Terraform infrastructure-as-code, Prometheus & Grafana telemetry.

### \`unierp-workspace\` (\`@kannan19302/unierp-workspace\`)
- **Role**: Master orchestrator repository containing:
  - Governance docs (\`docs/ai/\`): 10 core governance documents.
  - Development Programme: 3,631 phases across 23 tracks and 12 programmes.
  - Agent Dispatch Protocol (ADP): \`scripts/start.mjs\` phase locking and worklog journaling.
`;

writeDoc('11-FOUNDATION-RUNTIME-OPERATIONS.md', doc11);

console.log('ALL KNOWLEDGE BASE AND SKILL FILES GENERATED SUCCESSFULLY!');
