# P12-002 · The Unowned-Code Census

> **Generated automatically by `scripts/check-unowned-code-census.mjs`.**
> Phase **P12-002**: Every claimed repository measured: what it does, what is reachable, what is tested, what is dead, what other repositories import from it.

**Census Date:** 2026-08-14T13:52:16.573Z  
**Total Repositories Claimed:** 31 (29 on disk, 2 planned)  

## 1. Summary Overview

| Repository | Owner | Role Summary | Files | Code Lines | Tests | Consumers (Imported By) |
| :--------- | :---: | :----------- | ----: | ---------: | ----: | :---------------------- |
| `unierp-api` | P4 | ERP application services — 45 business modules ... | 3886 | 7,18,262 | 564 | *(none)* |
| `unierp-auth` | P12 | Authorization primitives: permission evaluation... | 39 | 731 | 1 | unierp-api, unierp-console, unierp-idp, unierp-web |
| `unierp-blockchain` | P12 | Ledger and attestation integration. | 66 | 2,838 | 1 | unierp-api, unierp-idp |
| `unierp-config` | P12 | Shared configuration consumed by every repository. | 22 | 114 | 0 | unierp-api, unierp-auth, unierp-blockchain, unierp-data, unierp-design-system, unierp-developer, unierp-framework, unierp-idp, unierp-sandbox, unierp-shared, unierp-storybook, unierp-web |
| `unierp-console` | P8 | The provider control plane (plane 1): estate, r... | 219 | 25,435 | 4 | *(none)* |
| `unierp-contracts` | P12 | The API contracts every client, SDK and type is... | 35 | 1,184 | 5 | unierp-kernel, unierp-sdk |
| `unierp-corporate-site-template` | P12 | The starting template for tenant corporate site... | 13 | 114 | 0 | *(none)* |
| `unierp-corporate-website` | P7 | unierp.com and its admin console (plane 0). Its... | 267 | 19,911 | 1 | *(none)* |
| `unierp-data` | P12 | Prisma schema, migrations and the data layer. O... | 315 | 1,31,518 | 7 | unierp-api, unierp-auth, unierp-idp, unierp-loop-a, unierp-loop-b, unierp-loop-c, unierp-workspace |
| `unierp-design-system` | P1 | The design system. Owned by Track B; every clie... | 212 | 15,330 | 10 | unierp-console, unierp-developer, unierp-framework, unierp-loop-a, unierp-loop-b, unierp-loop-c, unierp-storybook, unierp-web, unierp-workspace |
| `unierp-desktop` | P11 | Windows, macOS and Linux. Greenfield — the tech... | 0 | 0 | 0 | *(none)* |
| `unierp-developer` | P2 | The developer portal: builders, sandbox surface... | 192 | 37,156 | 0 | *(none)* |
| `unierp-extension-api` | P12 | The versioned contract extensions implement. | 24 | 635 | 0 | unierp-api, unierp-extensions, unierp-sandbox |
| `unierp-extensions` | P12 | First-party extension implementations, built on... | 65 | 4,836 | 4 | *(none)* |
| `unierp-framework` | P12 | The application framework: request lifecycle, t... | 67 | 3,641 | 2 | unierp-console, unierp-developer, unierp-web |
| `unierp-idp` | P12 | Identity provider: authentication, federation, ... | 241 | 18,613 | 13 | *(none)* |
| `unierp-infra` | P12 | Infrastructure definitions: environments, deplo... | 47 | 1,270 | 0 | *(none)* |
| `unierp-kernel` | P12 | Core runtime primitives: module registration, l... | 34 | 779 | 1 | *(none)* |
| `unierp-loop-a` | P12 | Agent worktree. Hygiene rules apply; no committ... | 405 | 14,081 | 0 | *(none)* |
| `unierp-loop-b` | P12 | Agent worktree. Hygiene rules apply; no committ... | 405 | 14,081 | 0 | *(none)* |
| `unierp-loop-c` | P12 | Agent worktree. Hygiene rules apply; no committ... | 405 | 14,081 | 0 | *(none)* |
| `unierp-mobile` | P10 | Android and iOS, offline-first (Flutter). | 888 | 1,43,083 | 24 | *(none)* |
| `unierp-platform` | P12 | Aggregation repository. P12-201 decides whether... | 30 | 114 | 0 | *(none)* |
| `unierp-sandbox` | P12 | The isolated runtime for untrusted extension an... | 89 | 21,129 | 4 | unierp-api |
| `unierp-sdk` | P12 | The published client SDK, layered over the gene... | 19 | 222 | 0 | unierp-developer, unierp-web |
| `unierp-service-kit` | P12 | Service scaffolding — generates a service that ... | 30 | 915 | 1 | unierp-api, unierp-idp |
| `unierp-shared` | P12 | Shared libraries used across every service. | 74 | 19,513 | 6 | unierp-api, unierp-auth, unierp-blockchain, unierp-data, unierp-developer, unierp-idp, unierp-loop-a, unierp-loop-b, unierp-loop-c, unierp-web, unierp-workspace |
| `unierp-storybook` | P12 | Published component documentation for the desig... | 51 | 56,196 | 1 | *(none)* |
| `unierp-studio` | P5 | The tenant website builder, extracted from unie... | 0 | 0 | 0 | *(none)* |
| `unierp-web` | P9 | The web client platform — the runtime the 903 r... | 3800 | 3,03,614 | 17 | *(none)* |
| `unierp-workspace` | P13 | The programme plan, its tooling and its gates; ... | 430 | 15,187 | 0 | *(none)* |

---

## 2. Detailed Profiles per Repository

### `unierp-api` (Programme 4)

- **Role**: ERP application services — 45 business modules (plane 3).
- **Status**: Present on disk
- **Total Files**: 3886 (2152 code, 564 test, 6 docs, 19 config)
- **Lines of Code**: 7,18,262 lines (total lines: 22,07,332)
- **Testing**: framework=`vitest`, test files=564, coverage configured=`true`
- **Exports**: 2784 exported symbols
- **Internal In-Family Dependencies**: `unierp-auth`, `unierp-blockchain`, `unierp-config`, `unierp-data`, `unierp-extension-api`, `unierp-sandbox`, `unierp-service-kit`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-auth` (Programme 12)

- **Role**: Authorization primitives: permission evaluation, guards, record-level rules.
- **Status**: Present on disk
- **Total Files**: 39 (7 code, 1 test, 6 docs, 11 config)
- **Lines of Code**: 731 lines (total lines: 7,893)
- **Testing**: framework=`vitest`, test files=1, coverage configured=`true`
- **Exports**: 10 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-data`, `unierp-shared`
- **Consumers (Imported By)**: `unierp-api`, `unierp-console`, `unierp-idp`, `unierp-web`

### `unierp-blockchain` (Programme 12)

- **Role**: Ledger and attestation integration.
- **Status**: Present on disk
- **Total Files**: 66 (21 code, 1 test, 6 docs, 19 config)
- **Lines of Code**: 2,838 lines (total lines: 12,542)
- **Testing**: framework=`vitest`, test files=1, coverage configured=`true`
- **Exports**: 40 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-shared`
- **Consumers (Imported By)**: `unierp-api`, `unierp-idp`

### `unierp-config` (Programme 12)

- **Role**: Shared configuration consumed by every repository.
- **Status**: Present on disk
- **Total Files**: 22 (1 code, 0 test, 6 docs, 11 config)
- **Lines of Code**: 114 lines (total lines: 1,304)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: `unierp-api`, `unierp-auth`, `unierp-blockchain`, `unierp-data`, `unierp-design-system`, `unierp-developer`, `unierp-framework`, `unierp-idp`, `unierp-sandbox`, `unierp-shared`, `unierp-storybook`, `unierp-web`

### `unierp-console` (Programme 8)

- **Role**: The provider control plane (plane 1): estate, reconciliation, release, cost.
- **Status**: Present on disk
- **Total Files**: 219 (170 code, 4 test, 7 docs, 12 config)
- **Lines of Code**: 25,435 lines (total lines: 39,979)
- **Testing**: framework=`vitest`, test files=4, coverage configured=`true`
- **Exports**: 194 exported symbols
- **Internal In-Family Dependencies**: `unierp-auth`, `unierp-design-system`, `unierp-framework`
- **Consumers (Imported By)**: none

### `unierp-contracts` (Programme 12)

- **Role**: The API contracts every client, SDK and type is generated from. The single source of truth for the API surface.
- **Status**: Present on disk
- **Total Files**: 35 (18 code, 5 test, 6 docs, 7 config)
- **Lines of Code**: 1,184 lines (total lines: 2,300)
- **Testing**: framework=`none`, test files=5, coverage configured=`false`
- **Exports**: 60 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: `unierp-kernel`, `unierp-sdk`

### `unierp-corporate-site-template` (Programme 12)

- **Role**: The starting template for tenant corporate sites, maintained against the current design system.
- **Status**: Present on disk
- **Total Files**: 13 (1 code, 0 test, 6 docs, 3 config)
- **Lines of Code**: 114 lines (total lines: 1,090)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-corporate-website` (Programme 7)

- **Role**: unierp.com and its admin console (plane 0). Its own database, middleware and auth, deliberately separate.
- **Status**: Present on disk
- **Total Files**: 267 (218 code, 1 test, 10 docs, 15 config)
- **Lines of Code**: 19,911 lines (total lines: 27,061)
- **Testing**: framework=`none`, test files=1, coverage configured=`false`
- **Exports**: 242 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-data` (Programme 12)

- **Role**: Prisma schema, migrations and the data layer. Owns the model every service reads.
- **Status**: Present on disk
- **Total Files**: 315 (283 code, 7 test, 6 docs, 16 config)
- **Lines of Code**: 1,31,518 lines (total lines: 2,44,191)
- **Testing**: framework=`vitest`, test files=7, coverage configured=`true`
- **Exports**: 1241 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-shared`
- **Consumers (Imported By)**: `unierp-api`, `unierp-auth`, `unierp-idp`, `unierp-loop-a`, `unierp-loop-b`, `unierp-loop-c`, `unierp-workspace`

### `unierp-design-system` (Programme 1)

- **Role**: The design system. Owned by Track B; every client programme extends it through its own design-system phase, which is why those are contributors rather than co-owners.
- **Status**: Present on disk
- **Total Files**: 212 (157 code, 10 test, 8 docs, 10 config)
- **Lines of Code**: 15,330 lines (total lines: 29,790)
- **Testing**: framework=`vitest`, test files=10, coverage configured=`true`
- **Exports**: 464 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`
- **Consumers (Imported By)**: `unierp-console`, `unierp-developer`, `unierp-framework`, `unierp-loop-a`, `unierp-loop-b`, `unierp-loop-c`, `unierp-storybook`, `unierp-web`, `unierp-workspace`

### `unierp-desktop` (Programme 11)

- **Role**: Windows, macOS and Linux. Greenfield — the technology decision is P11-002.
- **Status**: Planned (not yet on disk)
- **Total Files**: 0 (0 code, 0 test, 0 docs, 0 config)
- **Lines of Code**: 0 lines (total lines: 0)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-developer` (Programme 2)

- **Role**: The developer portal: builders, sandbox surfaces, app lifecycle (plane 4).
- **Status**: Present on disk
- **Total Files**: 192 (125 code, 0 test, 6 docs, 7 config)
- **Lines of Code**: 37,156 lines (total lines: 46,054)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 138 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-design-system`, `unierp-framework`, `unierp-sdk`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-extension-api` (Programme 12)

- **Role**: The versioned contract extensions implement.
- **Status**: Present on disk
- **Total Files**: 24 (6 code, 0 test, 6 docs, 8 config)
- **Lines of Code**: 635 lines (total lines: 1,778)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 39 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: `unierp-api`, `unierp-extensions`, `unierp-sandbox`

### `unierp-extensions` (Programme 12)

- **Role**: First-party extension implementations, built on the same public contract as third-party ones.
- **Status**: Present on disk
- **Total Files**: 65 (34 code, 4 test, 6 docs, 23 config)
- **Lines of Code**: 4,836 lines (total lines: 7,184)
- **Testing**: framework=`vitest`, test files=4, coverage configured=`true`
- **Exports**: 134 exported symbols
- **Internal In-Family Dependencies**: `unierp-extension-api`
- **Consumers (Imported By)**: none

### `unierp-framework` (Programme 12)

- **Role**: The application framework: request lifecycle, tenant context, middleware.
- **Status**: Present on disk
- **Total Files**: 67 (24 code, 2 test, 6 docs, 12 config)
- **Lines of Code**: 3,641 lines (total lines: 19,195)
- **Testing**: framework=`vitest`, test files=2, coverage configured=`true`
- **Exports**: 63 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-design-system`
- **Consumers (Imported By)**: `unierp-console`, `unierp-developer`, `unierp-web`

### `unierp-idp` (Programme 12)

- **Role**: Identity provider: authentication, federation, tokens, sessions. The most security-critical repository in the family.
- **Status**: Present on disk
- **Total Files**: 241 (104 code, 13 test, 6 docs, 13 config)
- **Lines of Code**: 18,613 lines (total lines: 91,267)
- **Testing**: framework=`vitest`, test files=13, coverage configured=`true`
- **Exports**: 142 exported symbols
- **Internal In-Family Dependencies**: `unierp-auth`, `unierp-blockchain`, `unierp-config`, `unierp-data`, `unierp-service-kit`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-infra` (Programme 12)

- **Role**: Infrastructure definitions: environments, deployment, networking, secrets.
- **Status**: Present on disk
- **Total Files**: 47 (15 code, 0 test, 11 docs, 16 config)
- **Lines of Code**: 1,270 lines (total lines: 3,599)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 8 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-kernel` (Programme 12)

- **Role**: Core runtime primitives: module registration, lifecycle, composition.
- **Status**: Present on disk
- **Total Files**: 34 (8 code, 1 test, 6 docs, 11 config)
- **Lines of Code**: 779 lines (total lines: 5,603)
- **Testing**: framework=`vitest`, test files=1, coverage configured=`true`
- **Exports**: 10 exported symbols
- **Internal In-Family Dependencies**: `unierp-contracts`
- **Consumers (Imported By)**: none

### `unierp-loop-a` (Programme 12)

- **Role**: Agent worktree. Hygiene rules apply; no committed evidence files or stray artefacts (D145).
- **Status**: Present on disk
- **Total Files**: 405 (105 code, 0 test, 235 docs, 51 config)
- **Lines of Code**: 14,081 lines (total lines: 90,032)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 11 exported symbols
- **Internal In-Family Dependencies**: `unierp-data`, `unierp-design-system`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-loop-b` (Programme 12)

- **Role**: Agent worktree. Hygiene rules apply; no committed evidence files or stray artefacts (D145).
- **Status**: Present on disk
- **Total Files**: 405 (105 code, 0 test, 235 docs, 51 config)
- **Lines of Code**: 14,081 lines (total lines: 90,034)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 11 exported symbols
- **Internal In-Family Dependencies**: `unierp-data`, `unierp-design-system`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-loop-c` (Programme 12)

- **Role**: Agent worktree. Hygiene rules apply; no committed evidence files or stray artefacts (D145).
- **Status**: Present on disk
- **Total Files**: 405 (105 code, 0 test, 235 docs, 51 config)
- **Lines of Code**: 14,081 lines (total lines: 90,037)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 11 exported symbols
- **Internal In-Family Dependencies**: `unierp-data`, `unierp-design-system`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-mobile` (Programme 10)

- **Role**: Android and iOS, offline-first (Flutter).
- **Status**: Present on disk
- **Total Files**: 888 (811 code, 24 test, 10 docs, 6 config)
- **Lines of Code**: 1,43,083 lines (total lines: 1,46,885)
- **Testing**: framework=`none`, test files=24, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-platform` (Programme 12)

- **Role**: Aggregation repository. P12-201 decides whether it keeps that role or is retired with its content rehomed.
- **Status**: Present on disk
- **Total Files**: 30 (1 code, 0 test, 15 docs, 7 config)
- **Lines of Code**: 114 lines (total lines: 2,643)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-sandbox` (Programme 12)

- **Role**: The isolated runtime for untrusted extension and developer code.
- **Status**: Present on disk
- **Total Files**: 89 (28 code, 4 test, 7 docs, 10 config)
- **Lines of Code**: 21,129 lines (total lines: 83,882)
- **Testing**: framework=`vitest`, test files=4, coverage configured=`true`
- **Exports**: 16 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-extension-api`
- **Consumers (Imported By)**: `unierp-api`

### `unierp-sdk` (Programme 12)

- **Role**: The published client SDK, layered over the generated client.
- **Status**: Present on disk
- **Total Files**: 19 (2 code, 0 test, 6 docs, 7 config)
- **Lines of Code**: 222 lines (total lines: 1,327)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 7 exported symbols
- **Internal In-Family Dependencies**: `unierp-contracts`
- **Consumers (Imported By)**: `unierp-developer`, `unierp-web`

### `unierp-service-kit` (Programme 12)

- **Role**: Service scaffolding — generates a service that is compliant by construction.
- **Status**: Present on disk
- **Total Files**: 30 (7 code, 1 test, 6 docs, 9 config)
- **Lines of Code**: 915 lines (total lines: 5,333)
- **Testing**: framework=`vitest`, test files=1, coverage configured=`true`
- **Exports**: 34 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: `unierp-api`, `unierp-idp`

### `unierp-shared` (Programme 12)

- **Role**: Shared libraries used across every service.
- **Status**: Present on disk
- **Total Files**: 74 (56 code, 6 test, 6 docs, 9 config)
- **Lines of Code**: 19,513 lines (total lines: 23,633)
- **Testing**: framework=`vitest`, test files=6, coverage configured=`true`
- **Exports**: 897 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`
- **Consumers (Imported By)**: `unierp-api`, `unierp-auth`, `unierp-blockchain`, `unierp-data`, `unierp-developer`, `unierp-idp`, `unierp-loop-a`, `unierp-loop-b`, `unierp-loop-c`, `unierp-web`, `unierp-workspace`

### `unierp-storybook` (Programme 12)

- **Role**: Published component documentation for the design system.
- **Status**: Present on disk
- **Total Files**: 51 (22 code, 1 test, 6 docs, 9 config)
- **Lines of Code**: 56,196 lines (total lines: 62,464)
- **Testing**: framework=`none`, test files=1, coverage configured=`false`
- **Exports**: 5 exported symbols
- **Internal In-Family Dependencies**: `unierp-config`, `unierp-design-system`
- **Consumers (Imported By)**: none

### `unierp-studio` (Programme 5)

- **Role**: The tenant website builder, extracted from unierp-web/app/_sites into its own deployable.
- **Status**: Planned (not yet on disk)
- **Total Files**: 0 (0 code, 0 test, 0 docs, 0 config)
- **Lines of Code**: 0 lines (total lines: 0)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 0 exported symbols
- **Internal In-Family Dependencies**: none
- **Consumers (Imported By)**: none

### `unierp-web` (Programme 9)

- **Role**: The web client platform — the runtime the 903 route pages run on.
- **Status**: Present on disk
- **Total Files**: 3800 (1199 code, 17 test, 16 docs, 15 config)
- **Lines of Code**: 3,03,614 lines (total lines: 15,02,396)
- **Testing**: framework=`vitest`, test files=17, coverage configured=`true`
- **Exports**: 1765 exported symbols
- **Internal In-Family Dependencies**: `unierp-auth`, `unierp-config`, `unierp-design-system`, `unierp-framework`, `unierp-sdk`, `unierp-shared`
- **Consumers (Imported By)**: none

### `unierp-workspace` (Programme 13)

- **Role**: The programme plan, its tooling and its gates; integration and release surfaces.
- **Status**: Present on disk
- **Total Files**: 430 (109 code, 0 test, 253 docs, 54 config)
- **Lines of Code**: 15,187 lines (total lines: 1,04,296)
- **Testing**: framework=`none`, test files=0, coverage configured=`false`
- **Exports**: 24 exported symbols
- **Internal In-Family Dependencies**: `unierp-data`, `unierp-design-system`, `unierp-shared`
- **Consumers (Imported By)**: none

