# 03 — Provider Admin OS (Control Plane) Page-by-Page Catalogue

## 🛡️ Repository: `provider-admin-os` (`@kannan19302/console`)
- **Total Route Pages**: **139 pages**
- **Architecture**: Next.js App Router (`app/`), React 18, Lucide React, Socket.io, Design System Tokens.
- **Core Role**: SuperAdmin Control Plane used by the SaaS provider / cloud operators to manage tenants, global infrastructure, billing, platform security, AI model gateways, and marketplace publishing.

---

## 📑 Control Plane Modules

| Section | Pages | Primary Functions |
| :--- | :--- | :--- |
| **`infrastructure`** | 15 pages | [Jump to infrastructure](#section-infrastructure) |
| **`tenants`** | 15 pages | [Jump to tenants](#section-tenants) |
| **`ai`** | 12 pages | [Jump to ai](#section-ai) |
| **`ops`** | 11 pages | [Jump to ops](#section-ops) |
| **`billing`** | 9 pages | [Jump to billing](#section-billing) |
| **`developers`** | 9 pages | [Jump to developers](#section-developers) |
| **`integrations`** | 9 pages | [Jump to integrations](#section-integrations) |
| **`marketplace`** | 9 pages | [Jump to marketplace](#section-marketplace) |
| **`security`** | 9 pages | [Jump to security](#section-security) |
| **`access`** | 8 pages | [Jump to access](#section-access) |
| **`analytics`** | 8 pages | [Jump to analytics](#section-analytics) |
| **`settings`** | 8 pages | [Jump to settings](#section-settings) |
| **`overview`** | 7 pages | [Jump to overview](#section-overview) |
| **`support`** | 7 pages | [Jump to support](#section-support) |
| **`login`** | 1 pages | [Jump to login](#section-login) |
| **`page.tsx`** | 1 pages | [Jump to page.tsx](#section-page.tsx) |
| **`profile`** | 1 pages | [Jump to profile](#section-profile) |

---

## 🔍 Granular Page Directory by Section

### <a id="section-infrastructure"></a> 🛠️ Section: `infrastructure` (15 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/infrastructure/backup` | [`app/(control-plane)/infrastructure/backup/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/backup/page.tsx) | Provider Control Plane UI for `/infrastructure/backup` |
| `/infrastructure/capacity` | [`app/(control-plane)/infrastructure/capacity/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/capacity/page.tsx) | Provider Control Plane UI for `/infrastructure/capacity` |
| `/infrastructure/cloud-accounts` | [`app/(control-plane)/infrastructure/cloud-accounts/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/cloud-accounts/page.tsx) | Provider Control Plane UI for `/infrastructure/cloud-accounts` |
| `/infrastructure/compute` | [`app/(control-plane)/infrastructure/compute/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/compute/page.tsx) | Provider Control Plane UI for `/infrastructure/compute` |
| `/infrastructure/database` | [`app/(control-plane)/infrastructure/database/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/database/page.tsx) | Provider Control Plane UI for `/infrastructure/database` |
| `/infrastructure/dr` | [`app/(control-plane)/infrastructure/dr/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/dr/page.tsx) | Provider Control Plane UI for `/infrastructure/dr` |
| `/infrastructure/estate` | [`app/(control-plane)/infrastructure/estate/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/estate/page.tsx) | Provider Control Plane UI for `/infrastructure/estate` |
| `/infrastructure/kubernetes/[id]` | [`app/(control-plane)/infrastructure/kubernetes/[id]/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/kubernetes/[id]/page.tsx) | Provider Control Plane UI for `/infrastructure/kubernetes/[id]` |
| `/infrastructure/kubernetes` | [`app/(control-plane)/infrastructure/kubernetes/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/kubernetes/page.tsx) | Provider Control Plane UI for `/infrastructure/kubernetes` |
| `/infrastructure/network` | [`app/(control-plane)/infrastructure/network/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/network/page.tsx) | Provider Control Plane UI for `/infrastructure/network` |
| `/infrastructure` | [`app/(control-plane)/infrastructure/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/page.tsx) | Provider Control Plane UI for `/infrastructure` |
| `/infrastructure/regions` | [`app/(control-plane)/infrastructure/regions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/regions/page.tsx) | Provider Control Plane UI for `/infrastructure/regions` |
| `/infrastructure/resources` | [`app/(control-plane)/infrastructure/resources/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/resources/page.tsx) | Provider Control Plane UI for `/infrastructure/resources` |
| `/infrastructure/resources/provision` | [`app/(control-plane)/infrastructure/resources/provision/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/resources/provision/page.tsx) | Provider Control Plane UI for `/infrastructure/resources/provision` |
| `/infrastructure/storage` | [`app/(control-plane)/infrastructure/storage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/infrastructure/storage/page.tsx) | Provider Control Plane UI for `/infrastructure/storage` |

### <a id="section-tenants"></a> 🛠️ Section: `tenants` (15 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/tenants/activity` | [`app/(control-plane)/tenants/activity/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/activity/page.tsx) | Provider Control Plane UI for `/tenants/activity` |
| `/tenants/configuration` | [`app/(control-plane)/tenants/configuration/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/configuration/page.tsx) | Provider Control Plane UI for `/tenants/configuration` |
| `/tenants/data` | [`app/(control-plane)/tenants/data/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/data/page.tsx) | Provider Control Plane UI for `/tenants/data` |
| `/tenants/directory` | [`app/(control-plane)/tenants/directory/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/directory/page.tsx) | Provider Control Plane UI for `/tenants/directory` |
| `/tenants/integrations` | [`app/(control-plane)/tenants/integrations/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/integrations/page.tsx) | Provider Control Plane UI for `/tenants/integrations` |
| `/tenants/modules` | [`app/(control-plane)/tenants/modules/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/modules/page.tsx) | Provider Control Plane UI for `/tenants/modules` |
| `/tenants` | [`app/(control-plane)/tenants/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/page.tsx) | Provider Control Plane UI for `/tenants` |
| `/tenants/provision` | [`app/(control-plane)/tenants/provision/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/provision/page.tsx) | Provider Control Plane UI for `/tenants/provision` |
| `/tenants/quotas` | [`app/(control-plane)/tenants/quotas/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/quotas/page.tsx) | Provider Control Plane UI for `/tenants/quotas` |
| `/tenants/security` | [`app/(control-plane)/tenants/security/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/security/page.tsx) | Provider Control Plane UI for `/tenants/security` |
| `/tenants/structure` | [`app/(control-plane)/tenants/structure/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/structure/page.tsx) | Provider Control Plane UI for `/tenants/structure` |
| `/tenants/subscription` | [`app/(control-plane)/tenants/subscription/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/subscription/page.tsx) | Provider Control Plane UI for `/tenants/subscription` |
| `/tenants/support` | [`app/(control-plane)/tenants/support/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/support/page.tsx) | Provider Control Plane UI for `/tenants/support` |
| `/tenants/usage` | [`app/(control-plane)/tenants/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/usage/page.tsx) | Provider Control Plane UI for `/tenants/usage` |
| `/tenants/users` | [`app/(control-plane)/tenants/users/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/tenants/users/page.tsx) | Provider Control Plane UI for `/tenants/users` |

### <a id="section-ai"></a> 🛠️ Section: `ai` (12 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/ai/agents` | [`app/(control-plane)/ai/agents/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/agents/page.tsx) | Provider Control Plane UI for `/ai/agents` |
| `/ai/costs` | [`app/(control-plane)/ai/costs/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/costs/page.tsx) | Provider Control Plane UI for `/ai/costs` |
| `/ai/evaluation` | [`app/(control-plane)/ai/evaluation/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/evaluation/page.tsx) | Provider Control Plane UI for `/ai/evaluation` |
| `/ai/governance` | [`app/(control-plane)/ai/governance/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/governance/page.tsx) | Provider Control Plane UI for `/ai/governance` |
| `/ai/guardrails` | [`app/(control-plane)/ai/guardrails/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/guardrails/page.tsx) | Provider Control Plane UI for `/ai/guardrails` |
| `/ai/knowledge` | [`app/(control-plane)/ai/knowledge/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/knowledge/page.tsx) | Provider Control Plane UI for `/ai/knowledge` |
| `/ai/models` | [`app/(control-plane)/ai/models/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/models/page.tsx) | Provider Control Plane UI for `/ai/models` |
| `/ai` | [`app/(control-plane)/ai/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/page.tsx) | Provider Control Plane UI for `/ai` |
| `/ai/providers` | [`app/(control-plane)/ai/providers/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/providers/page.tsx) | Provider Control Plane UI for `/ai/providers` |
| `/ai/tools` | [`app/(control-plane)/ai/tools/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/tools/page.tsx) | Provider Control Plane UI for `/ai/tools` |
| `/ai/usage` | [`app/(control-plane)/ai/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/usage/page.tsx) | Provider Control Plane UI for `/ai/usage` |
| `/ai/workflows` | [`app/(control-plane)/ai/workflows/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ai/workflows/page.tsx) | Provider Control Plane UI for `/ai/workflows` |

### <a id="section-ops"></a> 🛠️ Section: `ops` (11 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/ops/automation` | [`app/(control-plane)/ops/automation/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/automation/page.tsx) | Provider Control Plane UI for `/ops/automation` |
| `/ops/deployments` | [`app/(control-plane)/ops/deployments/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/deployments/page.tsx) | Provider Control Plane UI for `/ops/deployments` |
| `/ops/environments` | [`app/(control-plane)/ops/environments/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/environments/page.tsx) | Provider Control Plane UI for `/ops/environments` |
| `/ops/incidents` | [`app/(control-plane)/ops/incidents/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/incidents/page.tsx) | Provider Control Plane UI for `/ops/incidents` |
| `/ops/jobs` | [`app/(control-plane)/ops/jobs/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/jobs/page.tsx) | Provider Control Plane UI for `/ops/jobs` |
| `/ops/maintenance` | [`app/(control-plane)/ops/maintenance/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/maintenance/page.tsx) | Provider Control Plane UI for `/ops/maintenance` |
| `/ops` | [`app/(control-plane)/ops/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/page.tsx) | Provider Control Plane UI for `/ops` |
| `/ops/queues` | [`app/(control-plane)/ops/queues/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/queues/page.tsx) | Provider Control Plane UI for `/ops/queues` |
| `/ops/releases` | [`app/(control-plane)/ops/releases/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/releases/page.tsx) | Provider Control Plane UI for `/ops/releases` |
| `/ops/services` | [`app/(control-plane)/ops/services/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/services/page.tsx) | Provider Control Plane UI for `/ops/services` |
| `/ops/workflows` | [`app/(control-plane)/ops/workflows/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/ops/workflows/page.tsx) | Provider Control Plane UI for `/ops/workflows` |

### <a id="section-billing"></a> 🛠️ Section: `billing` (9 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/billing/configuration` | [`app/(control-plane)/billing/configuration/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/configuration/page.tsx) | Provider Control Plane UI for `/billing/configuration` |
| `/billing/customers` | [`app/(control-plane)/billing/customers/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/customers/page.tsx) | Provider Control Plane UI for `/billing/customers` |
| `/billing/invoices` | [`app/(control-plane)/billing/invoices/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/invoices/page.tsx) | Provider Control Plane UI for `/billing/invoices` |
| `/billing` | [`app/(control-plane)/billing/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/page.tsx) | Provider Control Plane UI for `/billing` |
| `/billing/payments` | [`app/(control-plane)/billing/payments/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/payments/page.tsx) | Provider Control Plane UI for `/billing/payments` |
| `/billing/plans` | [`app/(control-plane)/billing/plans/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/plans/page.tsx) | Provider Control Plane UI for `/billing/plans` |
| `/billing/revenue` | [`app/(control-plane)/billing/revenue/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/revenue/page.tsx) | Provider Control Plane UI for `/billing/revenue` |
| `/billing/subscriptions` | [`app/(control-plane)/billing/subscriptions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/subscriptions/page.tsx) | Provider Control Plane UI for `/billing/subscriptions` |
| `/billing/usage` | [`app/(control-plane)/billing/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/billing/usage/page.tsx) | Provider Control Plane UI for `/billing/usage` |

### <a id="section-developers"></a> 🛠️ Section: `developers` (9 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/developers/apis` | [`app/(control-plane)/developers/apis/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/apis/page.tsx) | Provider Control Plane UI for `/developers/apis` |
| `/developers/apps` | [`app/(control-plane)/developers/apps/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/apps/page.tsx) | Provider Control Plane UI for `/developers/apps` |
| `/developers/authentication` | [`app/(control-plane)/developers/authentication/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/authentication/page.tsx) | Provider Control Plane UI for `/developers/authentication` |
| `/developers/documentation` | [`app/(control-plane)/developers/documentation/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/documentation/page.tsx) | Provider Control Plane UI for `/developers/documentation` |
| `/developers` | [`app/(control-plane)/developers/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/page.tsx) | Provider Control Plane UI for `/developers` |
| `/developers/sandbox` | [`app/(control-plane)/developers/sandbox/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/sandbox/page.tsx) | Provider Control Plane UI for `/developers/sandbox` |
| `/developers/sdk` | [`app/(control-plane)/developers/sdk/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/sdk/page.tsx) | Provider Control Plane UI for `/developers/sdk` |
| `/developers/usage` | [`app/(control-plane)/developers/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/usage/page.tsx) | Provider Control Plane UI for `/developers/usage` |
| `/developers/webhooks` | [`app/(control-plane)/developers/webhooks/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/developers/webhooks/page.tsx) | Provider Control Plane UI for `/developers/webhooks` |

### <a id="section-integrations"></a> 🛠️ Section: `integrations` (9 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/integrations/catalog` | [`app/(control-plane)/integrations/catalog/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/catalog/page.tsx) | Provider Control Plane UI for `/integrations/catalog` |
| `/integrations/connections` | [`app/(control-plane)/integrations/connections/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/connections/page.tsx) | Provider Control Plane UI for `/integrations/connections` |
| `/integrations/credentials` | [`app/(control-plane)/integrations/credentials/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/credentials/page.tsx) | Provider Control Plane UI for `/integrations/credentials` |
| `/integrations/events` | [`app/(control-plane)/integrations/events/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/events/page.tsx) | Provider Control Plane UI for `/integrations/events` |
| `/integrations/health` | [`app/(control-plane)/integrations/health/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/health/page.tsx) | Provider Control Plane UI for `/integrations/health` |
| `/integrations/logs` | [`app/(control-plane)/integrations/logs/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/logs/page.tsx) | Provider Control Plane UI for `/integrations/logs` |
| `/integrations/mapping` | [`app/(control-plane)/integrations/mapping/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/mapping/page.tsx) | Provider Control Plane UI for `/integrations/mapping` |
| `/integrations` | [`app/(control-plane)/integrations/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/page.tsx) | Provider Control Plane UI for `/integrations` |
| `/integrations/synchronization` | [`app/(control-plane)/integrations/synchronization/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/integrations/synchronization/page.tsx) | Provider Control Plane UI for `/integrations/synchronization` |

### <a id="section-marketplace"></a> 🛠️ Section: `marketplace` (9 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/marketplace/approvals` | [`app/(control-plane)/marketplace/approvals/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/approvals/page.tsx) | Provider Control Plane UI for `/marketplace/approvals` |
| `/marketplace/apps` | [`app/(control-plane)/marketplace/apps/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/apps/page.tsx) | Provider Control Plane UI for `/marketplace/apps` |
| `/marketplace/catalog` | [`app/(control-plane)/marketplace/catalog/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/catalog/page.tsx) | Provider Control Plane UI for `/marketplace/catalog` |
| `/marketplace/extensions` | [`app/(control-plane)/marketplace/extensions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/extensions/page.tsx) | Provider Control Plane UI for `/marketplace/extensions` |
| `/marketplace/installations` | [`app/(control-plane)/marketplace/installations/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/installations/page.tsx) | Provider Control Plane UI for `/marketplace/installations` |
| `/marketplace` | [`app/(control-plane)/marketplace/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/page.tsx) | Provider Control Plane UI for `/marketplace` |
| `/marketplace/publishing` | [`app/(control-plane)/marketplace/publishing/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/publishing/page.tsx) | Provider Control Plane UI for `/marketplace/publishing` |
| `/marketplace/reviews` | [`app/(control-plane)/marketplace/reviews/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/reviews/page.tsx) | Provider Control Plane UI for `/marketplace/reviews` |
| `/marketplace/versions` | [`app/(control-plane)/marketplace/versions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/marketplace/versions/page.tsx) | Provider Control Plane UI for `/marketplace/versions` |

### <a id="section-security"></a> 🛠️ Section: `security` (9 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/security/audit` | [`app/(control-plane)/security/audit/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/audit/page.tsx) | Provider Control Plane UI for `/security/audit` |
| `/security/compliance/controls` | [`app/(control-plane)/security/compliance/controls/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/compliance/controls/page.tsx) | Provider Control Plane UI for `/security/compliance/controls` |
| `/security/compliance` | [`app/(control-plane)/security/compliance/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/compliance/page.tsx) | Provider Control Plane UI for `/security/compliance` |
| `/security/identity` | [`app/(control-plane)/security/identity/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/identity/page.tsx) | Provider Control Plane UI for `/security/identity` |
| `/security` | [`app/(control-plane)/security/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/page.tsx) | Provider Control Plane UI for `/security` |
| `/security/policies` | [`app/(control-plane)/security/policies/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/policies/page.tsx) | Provider Control Plane UI for `/security/policies` |
| `/security/privacy` | [`app/(control-plane)/security/privacy/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/privacy/page.tsx) | Provider Control Plane UI for `/security/privacy` |
| `/security/secrets` | [`app/(control-plane)/security/secrets/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/secrets/page.tsx) | Provider Control Plane UI for `/security/secrets` |
| `/security/threats` | [`app/(control-plane)/security/threats/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/security/threats/page.tsx) | Provider Control Plane UI for `/security/threats` |

### <a id="section-access"></a> 🛠️ Section: `access` (8 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/access/audit` | [`app/(control-plane)/access/audit/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/audit/page.tsx) | Provider Control Plane UI for `/access/audit` |
| `/access/authentication` | [`app/(control-plane)/access/authentication/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/authentication/page.tsx) | Provider Control Plane UI for `/access/authentication` |
| `/access/directory` | [`app/(control-plane)/access/directory/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/directory/page.tsx) | Provider Control Plane UI for `/access/directory` |
| `/access/governance` | [`app/(control-plane)/access/governance/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/governance/page.tsx) | Provider Control Plane UI for `/access/governance` |
| `/access` | [`app/(control-plane)/access/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/page.tsx) | Provider Control Plane UI for `/access` |
| `/access/permissions` | [`app/(control-plane)/access/permissions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/permissions/page.tsx) | Provider Control Plane UI for `/access/permissions` |
| `/access/roles` | [`app/(control-plane)/access/roles/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/roles/page.tsx) | Provider Control Plane UI for `/access/roles` |
| `/access/sessions` | [`app/(control-plane)/access/sessions/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/access/sessions/page.tsx) | Provider Control Plane UI for `/access/sessions` |

### <a id="section-analytics"></a> 🛠️ Section: `analytics` (8 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/analytics/customers` | [`app/(control-plane)/analytics/customers/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/customers/page.tsx) | Provider Control Plane UI for `/analytics/customers` |
| `/analytics/financial` | [`app/(control-plane)/analytics/financial/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/financial/page.tsx) | Provider Control Plane UI for `/analytics/financial` |
| `/analytics` | [`app/(control-plane)/analytics/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/page.tsx) | Provider Control Plane UI for `/analytics` |
| `/analytics/performance` | [`app/(control-plane)/analytics/performance/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/performance/page.tsx) | Provider Control Plane UI for `/analytics/performance` |
| `/analytics/product` | [`app/(control-plane)/analytics/product/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/product/page.tsx) | Provider Control Plane UI for `/analytics/product` |
| `/analytics/reports` | [`app/(control-plane)/analytics/reports/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/reports/page.tsx) | Provider Control Plane UI for `/analytics/reports` |
| `/analytics/support` | [`app/(control-plane)/analytics/support/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/support/page.tsx) | Provider Control Plane UI for `/analytics/support` |
| `/analytics/usage` | [`app/(control-plane)/analytics/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/analytics/usage/page.tsx) | Provider Control Plane UI for `/analytics/usage` |

### <a id="section-settings"></a> 🛠️ Section: `settings` (8 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/settings/branding` | [`app/(control-plane)/settings/branding/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/branding/page.tsx) | Provider Control Plane UI for `/settings/branding` |
| `/settings/defaults` | [`app/(control-plane)/settings/defaults/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/defaults/page.tsx) | Provider Control Plane UI for `/settings/defaults` |
| `/settings/features` | [`app/(control-plane)/settings/features/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/features/page.tsx) | Provider Control Plane UI for `/settings/features` |
| `/settings/localization` | [`app/(control-plane)/settings/localization/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/localization/page.tsx) | Provider Control Plane UI for `/settings/localization` |
| `/settings` | [`app/(control-plane)/settings/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/page.tsx) | Provider Control Plane UI for `/settings` |
| `/settings/platform` | [`app/(control-plane)/settings/platform/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/platform/page.tsx) | Provider Control Plane UI for `/settings/platform` |
| `/settings/policies` | [`app/(control-plane)/settings/policies/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/policies/page.tsx) | Provider Control Plane UI for `/settings/policies` |
| `/settings/templates` | [`app/(control-plane)/settings/templates/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/settings/templates/page.tsx) | Provider Control Plane UI for `/settings/templates` |

### <a id="section-overview"></a> 🛠️ Section: `overview` (7 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/overview/activity` | [`app/(control-plane)/overview/activity/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/activity/page.tsx) | Provider Control Plane UI for `/overview/activity` |
| `/overview/business` | [`app/(control-plane)/overview/business/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/business/page.tsx) | Provider Control Plane UI for `/overview/business` |
| `/overview/operations` | [`app/(control-plane)/overview/operations/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/operations/page.tsx) | Provider Control Plane UI for `/overview/operations` |
| `/overview` | [`app/(control-plane)/overview/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/page.tsx) | Provider Control Plane UI for `/overview` |
| `/overview/platform-health` | [`app/(control-plane)/overview/platform-health/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/platform-health/page.tsx) | Provider Control Plane UI for `/overview/platform-health` |
| `/overview/security` | [`app/(control-plane)/overview/security/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/security/page.tsx) | Provider Control Plane UI for `/overview/security` |
| `/overview/usage` | [`app/(control-plane)/overview/usage/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/overview/usage/page.tsx) | Provider Control Plane UI for `/overview/usage` |

### <a id="section-support"></a> 🛠️ Section: `support` (7 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/support/communications` | [`app/(control-plane)/support/communications/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/communications/page.tsx) | Provider Control Plane UI for `/support/communications` |
| `/support/customers` | [`app/(control-plane)/support/customers/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/customers/page.tsx) | Provider Control Plane UI for `/support/customers` |
| `/support/incidents` | [`app/(control-plane)/support/incidents/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/incidents/page.tsx) | Provider Control Plane UI for `/support/incidents` |
| `/support/knowledge` | [`app/(control-plane)/support/knowledge/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/knowledge/page.tsx) | Provider Control Plane UI for `/support/knowledge` |
| `/support` | [`app/(control-plane)/support/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/page.tsx) | Provider Control Plane UI for `/support` |
| `/support/sla` | [`app/(control-plane)/support/sla/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/sla/page.tsx) | Provider Control Plane UI for `/support/sla` |
| `/support/tickets` | [`app/(control-plane)/support/tickets/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/support/tickets/page.tsx) | Provider Control Plane UI for `/support/tickets` |

### <a id="section-login"></a> 🛠️ Section: `login` (1 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/login` | [`app/(auth)/login/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(auth)/login/page.tsx) | Provider Control Plane UI for `/login` |

### <a id="section-page.tsx"></a> 🛠️ Section: `page.tsx` (1 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/` | [`app/(control-plane)/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/page.tsx) | Provider Control Plane UI for `/` |

### <a id="section-profile"></a> 🛠️ Section: `profile` (1 pages)

| Control Plane Route | File Location | Operational Purpose |
| :--- | :--- | :--- |
| `/profile` | [`app/(control-plane)/profile/page.tsx`](file:///d:/UniERP/provider-admin-os/app/(control-plane)/profile/page.tsx) | Provider Control Plane UI for `/profile` |

