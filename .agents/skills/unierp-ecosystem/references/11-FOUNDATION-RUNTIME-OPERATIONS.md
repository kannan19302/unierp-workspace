# 11 — Foundation, Runtime & Operations Guide

This document details the support, runtime, and operational repositories across UniERP.

---

## 1. 🏗️ Foundation Repositories (Layer L1)

### `kernel` (`@kannan19302/kernel`)
- **Role**: Microkernel core, event bus, base lifecycle hooks, typed event emitters.
- **Key Modules**: `EventBus`, `LifecycleManager`, `BaseEntity`, `Result<T, E>`.

### `unierp-contracts` (`@kannan19302/contracts`)
- **Role**: Pure Layer L0 contracts, Zod DTOs, API specifications, RPC interfaces, outbox event payloads.
- **Independence**: 0 external dependencies.

### `sdk` (`@kannan19302/sdk`)
- **Role**: TypeScript client SDK providing strongly typed API clients for web and mobile frontends.

### `shared` (`@kannan19302/shared`)
- **Role**: Cross-cutting utilities, Decimal arithmetic helpers, date-fns timezone formatters, validation utilities.

### `auth` (`@kannan19302/auth`)
- **Role**: Client authentication helpers, JWT decoder, token refresh handlers, permission checking utility.

### `config` (`@kannan19302/config`)
- **Role**: Central environment schema validation, runtime config loading, secret managers.

### `service-kit` (`@kannan19302/service-kit`)
- **Role**: Shared NestJS / Fastify microservice toolkit, OpenTelemetry tracing interceptor, standard logging formatter, health checks.

---

## 2. ⚡ Runtime Repositories (Layer L2)

### `framework` (`@kannan19302/framework`)
- **Role**: Dynamic plugin engine, hook dispatcher, extension lifecycle governor.

### `extension-api` (`@kannan19302/extension-api`)
- **Role**: Public API surface exposed to third-party plugins and developers.

### `sandbox` (`@kannan19302/sandbox`)
- **Role**: Isolated V8 execution sandbox (`isolated-vm`) with CPU execution governor, memory ceilings, and call limits.

### `blockchain` (`@kannan19302/blockchain`)
- **Role**: Smart contracts and cryptographic audit trail verification. Anchors state root hashes to public/private ledgers.

---

## 3. 🚢 Extensions & Operations (Layers L6 & L7)

### `extensions` (`@kannan19302/extensions`)
- **Role**: Pre-built extension plugins (payment gateways, CRM synchronizers, logistics trackers).

### `infra` (`@kannan19302/infra`)
- **Role**: Docker Compose multi-service stacks, Kubernetes Helm charts, Terraform infrastructure-as-code, Prometheus & Grafana telemetry.

### `unierp-workspace` (`@kannan19302/unierp-workspace`)
- **Role**: Master orchestrator repository containing:
  - Governance docs (`docs/ai/`): 10 core governance documents.
  - Development Programme: 3,631 phases across 23 tracks and 12 programmes.
  - Agent Dispatch Protocol (ADP): `scripts/start.mjs` phase locking and worklog journaling.
