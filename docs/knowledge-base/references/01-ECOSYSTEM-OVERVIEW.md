# 01 — UniERP Ecosystem Overview & Repository Matrix

## 🌐 Platform Summary
UniERP is a full-stack, enterprise-grade Multi-Tenant Enterprise Resource Planning platform designed for 10-year production lifecycles. The codebase is organized across **31 specialized repositories** structured strictly into 8 architectural layers (L0 to L7).

---

## 📊 Comprehensive Repository Matrix

| Layer | Repository Directory | npm Package / ID | Tech Stack | Responsibility & Highlights |
| :--- | :--- | :--- | :--- | :--- |
| **L0** | `unierp-contracts` | `@kannan19302/contracts` | TypeScript, Zod | Pure DTOs, API contracts, RPC specifications, Event schemas (107 files) |
| **L1** | `kernel` | `@kannan19302/kernel` | TypeScript | Microkernel core, event bus, base interfaces, lifecycle primitives (38 files) |
| **L1** | `design-system` | `@kannan19302/ui` | React, CSS Tokens | 7 Themes, Orthogonal density, 49 Component Storybooks (212 files) |
| **L1** | `sdk` | `@kannan19302/sdk` | TypeScript | Strongly-typed TypeScript client SDK bindings for UniERP APIs (22 files) |
| **L1** | `shared` | `@kannan19302/shared` | TypeScript, Zod, date-fns | Common utilities, timezone converters, string/number formatters (57 files) |
| **L1** | `auth` | `@kannan19302/auth` | TypeScript | IAM client, JWT decoding, auth guards, token refresh flows (18 files) |
| **L1** | `config` | `@kannan19302/config` | TypeScript, Zod | Central configuration management, schema validation (22 files) |
| **L1** | `service-kit` | `@kannan19302/service-kit` | NestJS, TypeScript | Microservice bootstrap, logging interceptors, metrics, tracing (30 files) |
| **L2** | `data` | `@kannan19302/data` | Prisma, PostgreSQL | 43 multi-file Prisma schemas, RLS policies (`setup-rls.sql`), 1,910 models (316 files) |
| **L2** | `framework` | `@kannan19302/framework` | TypeScript | Dynamic plugin lifecycle manager, hook registry, runtime kernel (67 files) |
| **L2** | `extension-api` | `@kannan19302/extension-api` | TypeScript | Public safe extensibility API & hook contracts (26 files) |
| **L2** | `sandbox` | `@kannan19302/sandbox` | TypeScript, isolated-vm | Secure V8 sandbox runner with governor & memory limits (89 files) |
| **L2** | `blockchain` | `@kannan19302/blockchain` | Solidity, Web3 | Ledger hash verification, audit proofs, immutable hash logs (18 files) |
| **L3** | `api` | `@kannan19302/api` | NestJS, Prisma, Fastify | 46 Domain Business Modules, 574 Controllers, RBAC/ABAC guards (380+ files) |
| **L3** | `idp` | `@kannan19302/idp` | NestJS, OIDC, WebAuthn | OIDC/OAuth2 Server, SAML, Passkeys, SCIM, 14 Controllers, 18 Services (242 files) |
| **L4** | `tenant-apps` | `@kannan19302/web` | Next.js, React, Zustand | Multi-tenant ERP Suite with **810 route pages** across 40+ domains (3,584 files) |
| **L4** | `provider-admin-os`| `@kannan19302/console` | Next.js, React | Provider SuperAdmin Control Plane with **139 route pages** (225 files) |
| **L4** | `tenant-admin` | `@kannan19302/tenant-admin` | Next.js, React | Tenant Organization Administration Portal with **110 route pages** (222 files) |
| **L4** | `web-studio` | `@kannan19302/web-studio` | Next.js, React | Visual Site, Page & Form Designer with **62 route pages** (131 files) |
| **L4** | `marketing-site` | `@kannan19302/corporate-website` | Next.js, React | Corporate website, solutions, pricing, docs with **45 route pages** (269 files) |
| **L4** | `marketplace` | `@kannan19302/marketplace` | Next.js, React | App Store, Connectors, Discovery, Installed plugins with **17 route pages** (48 files) |
| **L4** | `developer-platform`| `@kannan19302/developer` | Next.js, React | Low-code Page/Form/Dashboard builders with **7 route pages** (97 files) |
| **L4** | `tenant-sites` | `@kannan19302/tenant-sites` | Next.js, React | Hosted Multi-tenant site manager with **8 route pages** (24 files) |
| **L4** | `tenant-site-template`| `@kannan19302/corporate-site-template` | React | Pre-built corporate site template for tenant deployment (13 files) |
| **L4** | `storybook` | `@kannan19302/storybook` | Storybook, Vite | Visual testing harness, 49 interactive component stories (1,629 files) |
| **L5** | `unierp-mobile` | `unierp_mobile` | Flutter, Dart, BLoC | Cross-platform Mobile App with 44 feature modules, 430 screens (981 files) |
| **L5** | `desktop-app` | `@kannan19302/desktop-app`| Electron/Tauri | Desktop client application (13 files) |
| **L6** | `extensions` | `@kannan19302/extensions` | TypeScript | Public and third-party extension packages (65 files) |
| **L7** | `infra` | `@kannan19302/infra` | Docker, K8s, Helm | Orchestration, Docker Compose, Kubernetes, CI/CD, Observability (59 files) |
| **L7** | `unierp-workspace` | `@kannan19302/unierp-workspace`| Node.js, Markdown | Governance docs (`docs/ai/`), 3,631 phase development tracker, ADP (555 files) |
| **-**  | `unierp-platform` | `@kannan19302/UniERP` | Umbrella Meta Repo | Root monorepo / governance checkout mirror |

---

## 🔒 Layer Rules & Dependency Rules
1. **Unidirectional Dependencies**: A package in Layer $N$ may only import packages in Layer $M$ where $M < N$.
2. **No Sideways Dependencies**: Two packages at the same layer (e.g. `api` and `idp`) may not depend on each other directly; they communicate via `contracts` (L0) or asynchronous events.
3. **No Upward Dependencies**: A lower layer package (e.g. `data` or `kernel`) can NEVER import from `api`, `tenant-apps`, or any L3–L7 package.

---

## 📦 Package Publishing Protocol
- **Public npm Registry Scope**: `@kannan19302/*` (registry: `https://registry.npmjs.org/`).
- **OIDC Trusted Publishing**: Tokenless publishing triggered by `v*.*.*` tags.
- **Never publish `workspace:*`**: All dependencies must resolve to concrete semver ranges before publishing.
