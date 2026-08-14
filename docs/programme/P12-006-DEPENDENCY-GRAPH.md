# Repository Dependency Graph (P12-006)

> **Generated from source code imports and package declarations across all repositories.**
> Generated: 2026-08-14T14:01:30.416Z · Total Repositories: 31 · Total In-Family Edges: 42

## 1. Graph Summary & Acyclicity Status

✅ **Acyclicity Verification:** Graph is strictly ACYCLIC (0 cycles detected across 42 dependencies).

## 2. Layer Distribution and Dependencies

| Layer | Repository | Owner Programme | Dependencies (Outbound) | Consumed By (Inbound) |
| :--- | :--- | :--- | :--- | :--- |
| L0 | `unierp-contracts` | P12 | *(none)* | `unierp-kernel`, `unierp-sdk` |
| L1 | `unierp-auth` | P12 | `unierp-config`, `unierp-shared` | `unierp-api`, `unierp-console`, `unierp-idp`, `unierp-web` |
| L1 | `unierp-config` | P12 | *(none)* | `unierp-api`, `unierp-auth`, `unierp-blockchain`, `unierp-data`, `unierp-design-system`, `unierp-developer`, `unierp-framework`, `unierp-idp`, `unierp-sandbox`, `unierp-shared`, `unierp-storybook`, `unierp-web` |
| L1 | `unierp-design-system` | P1 | `unierp-config` | *(none)* |
| L1 | `unierp-kernel` | P12 | `unierp-contracts` | *(none)* |
| L1 | `unierp-sdk` | P12 | `unierp-contracts` | `unierp-developer`, `unierp-web` |
| L1 | `unierp-service-kit` | P12 | *(none)* | `unierp-api`, `unierp-idp` |
| L1 | `unierp-shared` | P12 | `unierp-config` | `unierp-api`, `unierp-auth`, `unierp-blockchain`, `unierp-data`, `unierp-developer`, `unierp-idp`, `unierp-loop-a`, `unierp-loop-b`, `unierp-loop-c`, `unierp-web`, `unierp-workspace` |
| L2 | `unierp-blockchain` | P12 | `unierp-config`, `unierp-shared` | `unierp-api`, `unierp-idp` |
| L2 | `unierp-corporate-site-template` | P12 | *(none)* | *(none)* |
| L2 | `unierp-data` | P12 | `unierp-config`, `unierp-shared` | *(none)* |
| L2 | `unierp-desktop` | P11 | *(none)* | *(none)* |
| L2 | `unierp-extension-api` | P12 | *(none)* | `unierp-api`, `unierp-extensions`, `unierp-sandbox` |
| L2 | `unierp-framework` | P12 | `unierp-config` | `unierp-console`, `unierp-developer`, `unierp-web` |
| L2 | `unierp-loop-a` | P12 | `unierp-shared` | *(none)* |
| L2 | `unierp-loop-b` | P12 | `unierp-shared` | *(none)* |
| L2 | `unierp-loop-c` | P12 | `unierp-shared` | *(none)* |
| L2 | `unierp-platform` | P12 | *(none)* | *(none)* |
| L2 | `unierp-sandbox` | P12 | `unierp-config`, `unierp-extension-api` | `unierp-api` |
| L2 | `unierp-storybook` | P12 | `unierp-config` | *(none)* |
| L2 | `unierp-studio` | P5 | *(none)* | *(none)* |
| L3 | `unierp-api` | P4 | `unierp-auth`, `unierp-blockchain`, `unierp-config`, `unierp-extension-api`, `unierp-sandbox`, `unierp-service-kit`, `unierp-shared` | *(none)* |
| L3 | `unierp-idp` | P12 | `unierp-auth`, `unierp-blockchain`, `unierp-config`, `unierp-service-kit`, `unierp-shared` | *(none)* |
| L4 | `unierp-console` | P8 | `unierp-auth`, `unierp-framework` | *(none)* |
| L4 | `unierp-corporate-website` | P7 | *(none)* | *(none)* |
| L4 | `unierp-developer` | P2 | `unierp-config`, `unierp-framework`, `unierp-sdk`, `unierp-shared` | *(none)* |
| L4 | `unierp-web` | P9 | `unierp-auth`, `unierp-config`, `unierp-framework`, `unierp-sdk`, `unierp-shared` | *(none)* |
| L5 | `unierp-mobile` | P10 | *(none)* | *(none)* |
| L6 | `unierp-extensions` | P12 | `unierp-extension-api` | *(none)* |
| L7 | `unierp-infra` | P12 | *(none)* | *(none)* |
| L7 | `unierp-workspace` | P13 | `unierp-shared` | *(none)* |

## 3. Direct In-Family Dependency Edges

| From Repository (Consumer) | Layer | To Repository (Provider) | Layer | Reference Locations |
| :--- | :--- | :--- | :--- | :--- |
| `unierp-api` | L3 | `unierp-auth` | L1 | 11 |
| `unierp-api` | L3 | `unierp-blockchain` | L2 | 9 |
| `unierp-api` | L3 | `unierp-config` | L1 | 1 |
| `unierp-api` | L3 | `unierp-extension-api` | L2 | 10 |
| `unierp-api` | L3 | `unierp-sandbox` | L2 | 3 |
| `unierp-api` | L3 | `unierp-service-kit` | L1 | 9 |
| `unierp-api` | L3 | `unierp-shared` | L1 | 75 |
| `unierp-auth` | L1 | `unierp-config` | L1 | 1 |
| `unierp-auth` | L1 | `unierp-shared` | L1 | 1 |
| `unierp-blockchain` | L2 | `unierp-config` | L1 | 1 |
| `unierp-blockchain` | L2 | `unierp-shared` | L1 | 1 |
| `unierp-console` | L4 | `unierp-auth` | L1 | 2 |
| `unierp-console` | L4 | `unierp-framework` | L2 | 1 |
| `unierp-data` | L2 | `unierp-config` | L1 | 1 |
| `unierp-data` | L2 | `unierp-shared` | L1 | 2 |
| `unierp-design-system` | L1 | `unierp-config` | L1 | 1 |
| `unierp-developer` | L4 | `unierp-config` | L1 | 1 |
| `unierp-developer` | L4 | `unierp-framework` | L2 | 42 |
| `unierp-developer` | L4 | `unierp-sdk` | L1 | 1 |
| `unierp-developer` | L4 | `unierp-shared` | L1 | 24 |
| `unierp-extensions` | L6 | `unierp-extension-api` | L2 | 20 |
| `unierp-framework` | L2 | `unierp-config` | L1 | 1 |
| `unierp-idp` | L3 | `unierp-auth` | L1 | 9 |
| `unierp-idp` | L3 | `unierp-blockchain` | L2 | 1 |
| `unierp-idp` | L3 | `unierp-config` | L1 | 1 |
| `unierp-idp` | L3 | `unierp-service-kit` | L1 | 1 |
| `unierp-idp` | L3 | `unierp-shared` | L1 | 8 |
| `unierp-kernel` | L1 | `unierp-contracts` | L0 | 1 |
| `unierp-loop-a` | L2 | `unierp-shared` | L1 | 1 |
| `unierp-loop-b` | L2 | `unierp-shared` | L1 | 1 |
| `unierp-loop-c` | L2 | `unierp-shared` | L1 | 1 |
| `unierp-sandbox` | L2 | `unierp-config` | L1 | 1 |
| `unierp-sandbox` | L2 | `unierp-extension-api` | L2 | 20 |
| `unierp-sdk` | L1 | `unierp-contracts` | L0 | 2 |
| `unierp-shared` | L1 | `unierp-config` | L1 | 1 |
| `unierp-storybook` | L2 | `unierp-config` | L1 | 1 |
| `unierp-web` | L4 | `unierp-auth` | L1 | 1 |
| `unierp-web` | L4 | `unierp-config` | L1 | 1 |
| `unierp-web` | L4 | `unierp-framework` | L2 | 615 |
| `unierp-web` | L4 | `unierp-sdk` | L1 | 3 |
| `unierp-web` | L4 | `unierp-shared` | L1 | 27 |
| `unierp-workspace` | L7 | `unierp-shared` | L1 | 1 |
