# PROGRAMME 21 — Revenue & Billing (Global)

> **Governing Repository**: `unierp-workspace`
> **Track Lead**: AI Agent

## 1. Waves

### Wave 0 · "Initial scaffold"
**Phases:** P21-001–P21-002 · Initial scaffolding

### Wave 1 · "Revenue Model & Pricing"
**Phases:** P21-003–P21-010 · Provider pricing plans, tier definitions, and feature gates

### Wave 2 · "Tenant Subscription Management"
**Phases:** P21-011–P21-020 · Subscription lifecycle, upgrades/downgrades, and proration

### Wave 3 · "Usage & Metering"
**Phases:** P21-021–P21-030 · Tracking storage, compute, and API usage across platforms

### Wave 4 · "Billing & Invoicing"
**Phases:** P21-031–P21-040 · Invoice generation, payment gateways, and tax calculation

## 2. Stage A · Scaffold (Wave 0)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P21-001** | Scaffold Platform | — | Scaffold Platform | `echo scaffolded` | DONE |
| **P21-002** | Configure Docker Profile | P21-001 | Configure Docker Profile | `docker compose config` | DONE |

## 3. Stage B · Revenue Model & Pricing Policies (Wave 1)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P21-003** | Schema: Pricing Plans | P21-002 | Prisma models for PricingPlan, PlanFeature | `pnpm exec prisma validate` | OPEN |
| **P21-004** | API: Plan Management | P21-003 | CRUD endpoints for provider admin OS | `curl -f http://localhost:3001/platform/v1/plans` | OPEN |
| **P21-005** | UI: Provider Plan Builder | P21-004 | UI to create/edit subscription tiers | `npx playwright test provider-plans.spec.ts` | OPEN |
| **P21-006** | Engine: Feature Gating | P21-004 | Middleware to check plan features | `pnpm test feature-gate.spec.ts` | OPEN |

## 4. Stage C · Tenant Subscription Management (Wave 2)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P21-011** | Schema: Tenant Subscriptions | P21-006 | Prisma models for TenantSubscription | `pnpm exec prisma validate` | OPEN |
| **P21-012** | API: Subscription Lifecycle | P21-011 | Endpoints for start, upgrade, cancel | `curl -f http://localhost:3001/platform/v1/subscriptions` | OPEN |
| **P21-013** | UI: Tenant Billing Portal | P21-012 | UI for tenants to manage subscriptions | `npx playwright test tenant-billing.spec.ts` | OPEN |
| **P21-014** | Logic: Proration Engine | P21-012 | Calculate proration for mid-cycle changes | `pnpm test proration.spec.ts` | OPEN |

## 5. Stage D · Usage & Metering (Wave 3)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P21-021** | Schema: Usage Events | P21-014 | Prisma models for MeteredEvent, DailyUsage | `pnpm exec prisma validate` | OPEN |
| **P21-022** | API: Ingestion Endpoint | P21-021 | High-throughput endpoint for usage events | `curl -f http://localhost:3001/platform/v1/usage` | OPEN |
| **P21-023** | Worker: Usage Aggregator | P21-022 | Cron job to aggregate daily usage | `pnpm test usage-aggregator.spec.ts` | OPEN |
| **P21-024** | UI: Usage Dashboards | P21-023 | Provider and Tenant usage views | `npx playwright test usage-dashboard.spec.ts` | OPEN |

## 6. Stage E · Billing & Invoicing (Wave 4)

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **P21-031** | Schema: Invoices & Payments | P21-024 | Prisma models for Invoice, LineItem, Payment | `pnpm exec prisma validate` | OPEN |
| **P21-032** | Logic: Invoice Generator | P21-031 | Service to generate monthly invoices | `pnpm test invoice-generator.spec.ts` | OPEN |
| **P21-033** | API: Payment Gateway | P21-032 | Integration with Stripe/Braintree | `pnpm test payment-gateway.spec.ts` | OPEN |
| **P21-034** | Worker: Payment Collection | P21-033 | Auto-charge saved payment methods | `pnpm test payment-worker.spec.ts` | OPEN |
| **P21-035** | UI: Invoice History | P21-032 | View and download PDF invoices | `npx playwright test invoice-history.spec.ts` | OPEN |
