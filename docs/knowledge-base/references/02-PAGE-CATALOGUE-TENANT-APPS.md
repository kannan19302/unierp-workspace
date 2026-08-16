# 02 — Tenant Apps (Web ERP) Page-by-Page Catalogue

## 📱 Repository: `tenant-apps` (`@kannan19302/web`)
- **Total Route Pages**: **810 pages**
- **Architecture**: Next.js App Router (`app/`), React 18, Zustand, TanStack Query, DnD Kit, Tailwind CSS Variables (Design Tokens).
- **Core Role**: Main multi-tenant business portal accessed by tenant employees, managers, and administrators to run daily enterprise operations.

---

## 📑 Module Summary Index

| Domain Module | Page Count | Key Capabilities |
| :--- | :--- | :--- |
| **`crm`** | 199 pages | [Jump to crm](#module-crm) |
| **`finance`** | 84 pages | [Jump to finance](#module-finance) |
| **`inventory`** | 72 pages | [Jump to inventory](#module-inventory) |
| **`supply-chain`** | 31 pages | [Jump to supply-chain](#module-supply-chain) |
| **`hr`** | 28 pages | [Jump to hr](#module-hr) |
| **`procurement`** | 26 pages | [Jump to procurement](#module-procurement) |
| **`projects`** | 26 pages | [Jump to projects](#module-projects) |
| **`manufacturing`** | 22 pages | [Jump to manufacturing](#module-manufacturing) |
| **`pos`** | 21 pages | [Jump to pos](#module-pos) |
| **`sales`** | 20 pages | [Jump to sales](#module-sales) |
| **`analytics`** | 19 pages | [Jump to analytics](#module-analytics) |
| **`education`** | 18 pages | [Jump to education](#module-education) |
| **`healthcare`** | 17 pages | [Jump to healthcare](#module-healthcare) |
| **`communication`** | 16 pages | [Jump to communication](#module-communication) |
| **`app`** | 15 pages | [Jump to app](#module-app) |
| **`drive`** | 14 pages | [Jump to drive](#module-drive) |
| **`field-service`** | 14 pages | [Jump to field-service](#module-field-service) |
| **`pages`** | 14 pages | [Jump to pages](#module-pages) |
| **`real-estate`** | 13 pages | [Jump to real-estate](#module-real-estate) |
| **`ecommerce`** | 11 pages | [Jump to ecommerce](#module-ecommerce) |
| **`fixed-assets`** | 10 pages | [Jump to fixed-assets](#module-fixed-assets) |
| **`workflow`** | 10 pages | [Jump to workflow](#module-workflow) |
| **`reporting`** | 9 pages | [Jump to reporting](#module-reporting) |
| **`storage`** | 9 pages | [Jump to storage](#module-storage) |
| **`localization`** | 8 pages | [Jump to localization](#module-localization) |
| **`advanced-hr`** | 6 pages | [Jump to advanced-hr](#module-advanced-hr) |
| **`ai`** | 6 pages | [Jump to ai](#module-ai) |
| **`documents`** | 6 pages | [Jump to documents](#module-documents) |
| **`devops`** | 5 pages | [Jump to devops](#module-devops) |
| **`ext-gateway`** | 5 pages | [Jump to ext-gateway](#module-ext-gateway) |
| **`public`** | 5 pages | [Jump to public](#module-public) |
| **`api-platform`** | 4 pages | [Jump to api-platform](#module-api-platform) |
| **`auth`** | 4 pages | [Jump to auth](#module-auth) |
| **`blockchain`** | 4 pages | [Jump to blockchain](#module-blockchain) |
| **`outbox`** | 4 pages | [Jump to outbox](#module-outbox) |
| **`pwa`** | 4 pages | [Jump to pwa](#module-pwa) |
| **`search`** | 4 pages | [Jump to search](#module-search) |
| **`store`** | 4 pages | [Jump to store](#module-store) |
| **`notifications`** | 3 pages | [Jump to notifications](#module-notifications) |
| **`people`** | 2 pages | [Jump to people](#module-people) |
| **`saved-views`** | 2 pages | [Jump to saved-views](#module-saved-views) |
| **`login`** | 1 pages | [Jump to login](#module-login) |
| **`oauth`** | 1 pages | [Jump to oauth](#module-oauth) |
| **`register`** | 1 pages | [Jump to register](#module-register) |
| **`reset-password`** | 1 pages | [Jump to reset-password](#module-reset-password) |
| **`verify-email`** | 1 pages | [Jump to verify-email](#module-verify-email) |
| **`custom`** | 1 pages | [Jump to custom](#module-custom) |
| **`dashboard`** | 1 pages | [Jump to dashboard](#module-dashboard) |
| **`forbidden`** | 1 pages | [Jump to forbidden](#module-forbidden) |
| **`onboarding`** | 1 pages | [Jump to onboarding](#module-onboarding) |
| **`service-management`** | 1 pages | [Jump to service-management](#module-service-management) |
| **`LandingPage.tsx`** | 1 pages | [Jump to LandingPage.tsx](#module-landingpage.tsx) |
| **`[slug]`** | 1 pages | [Jump to [slug]](#module-[slug]) |
| **`_sites`** | 1 pages | [Jump to _sites](#module-_sites) |
| **`page.tsx`** | 1 pages | [Jump to page.tsx](#module-page.tsx) |
| **`privacy`** | 1 pages | [Jump to privacy](#module-privacy) |
| **`terms`** | 1 pages | [Jump to terms](#module-terms) |

---

## 🔍 Granular Page Directory by Domain

### <a id="module-crm"></a> 📦 Domain Module: `crm` (199 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/crm/account-hierarchy` | [`app/(dashboard)/crm/account-hierarchy/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/account-hierarchy/page.tsx) | Enterprise UI View for `/crm/account-hierarchy` |
| `/crm/account-plans` | [`app/(dashboard)/crm/account-plans/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/account-plans/page.tsx) | Enterprise UI View for `/crm/account-plans` |
| `/crm/activities` | [`app/(dashboard)/crm/activities/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/activities/page.tsx) | Enterprise UI View for `/crm/activities` |
| `/crm/activity-capture/ab-tests` | [`app/(dashboard)/crm/activity-capture/ab-tests/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/activity-capture/ab-tests/page.tsx) | Enterprise UI View for `/crm/activity-capture/ab-tests` |
| `/crm/activity-capture/email-tracking` | [`app/(dashboard)/crm/activity-capture/email-tracking/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/activity-capture/email-tracking/page.tsx) | Enterprise UI View for `/crm/activity-capture/email-tracking` |
| `/crm/activity-capture` | [`app/(dashboard)/crm/activity-capture/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/activity-capture/page.tsx) | Enterprise UI View for `/crm/activity-capture` |
| `/crm/activity-capture/unlinked` | [`app/(dashboard)/crm/activity-capture/unlinked/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/activity-capture/unlinked/page.tsx) | Enterprise UI View for `/crm/activity-capture/unlinked` |
| `/crm/advanced` | [`app/(dashboard)/crm/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/advanced/page.tsx) | Enterprise UI View for `/crm/advanced` |
| `/crm/ai-drafting` | [`app/(dashboard)/crm/ai-drafting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-drafting/page.tsx) | Enterprise UI View for `/crm/ai-drafting` |
| `/crm/ai-intelligence/deal-health` | [`app/(dashboard)/crm/ai-intelligence/deal-health/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/deal-health/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/deal-health` |
| `/crm/ai-intelligence/next-best-action` | [`app/(dashboard)/crm/ai-intelligence/next-best-action/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/next-best-action/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/next-best-action` |
| `/crm/ai-intelligence` | [`app/(dashboard)/crm/ai-intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/page.tsx) | Enterprise UI View for `/crm/ai-intelligence` |
| `/crm/ai-intelligence/pipeline-anomalies` | [`app/(dashboard)/crm/ai-intelligence/pipeline-anomalies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/pipeline-anomalies/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/pipeline-anomalies` |
| `/crm/ai-intelligence/revenue-intelligence` | [`app/(dashboard)/crm/ai-intelligence/revenue-intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/revenue-intelligence/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/revenue-intelligence` |
| `/crm/ai-intelligence/sales-velocity` | [`app/(dashboard)/crm/ai-intelligence/sales-velocity/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/sales-velocity/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/sales-velocity` |
| `/crm/ai-intelligence/win-probability` | [`app/(dashboard)/crm/ai-intelligence/win-probability/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/ai-intelligence/win-probability/page.tsx) | Enterprise UI View for `/crm/ai-intelligence/win-probability` |
| `/crm/approvals` | [`app/(dashboard)/crm/approvals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/approvals/page.tsx) | Enterprise UI View for `/crm/approvals` |
| `/crm/automation` | [`app/(dashboard)/crm/automation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/automation/page.tsx) | Enterprise UI View for `/crm/automation` |
| `/crm/battlecards` | [`app/(dashboard)/crm/battlecards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/battlecards/page.tsx) | Enterprise UI View for `/crm/battlecards` |
| `/crm/campaigns` | [`app/(dashboard)/crm/campaigns/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/campaigns/page.tsx) | Enterprise UI View for `/crm/campaigns` |
| `/crm/cases/[id]` | [`app/(dashboard)/crm/cases/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cases/[id]/page.tsx) | Enterprise UI View for `/crm/cases/[id]` |
| `/crm/cases` | [`app/(dashboard)/crm/cases/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cases/page.tsx) | Enterprise UI View for `/crm/cases` |
| `/crm/cases/sla` | [`app/(dashboard)/crm/cases/sla/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cases/sla/page.tsx) | Enterprise UI View for `/crm/cases/sla` |
| `/crm/coaching-deep/effectiveness` | [`app/(dashboard)/crm/coaching-deep/effectiveness/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching-deep/effectiveness/page.tsx) | Enterprise UI View for `/crm/coaching-deep/effectiveness` |
| `/crm/coaching-deep` | [`app/(dashboard)/crm/coaching-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching-deep/page.tsx) | Enterprise UI View for `/crm/coaching-deep` |
| `/crm/coaching-deep/programs/[id]` | [`app/(dashboard)/crm/coaching-deep/programs/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching-deep/programs/[id]/page.tsx) | Enterprise UI View for `/crm/coaching-deep/programs/[id]` |
| `/crm/coaching-deep/programs` | [`app/(dashboard)/crm/coaching-deep/programs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching-deep/programs/page.tsx) | Enterprise UI View for `/crm/coaching-deep/programs` |
| `/crm/coaching-deep/recommendations/[repId]` | [`app/(dashboard)/crm/coaching-deep/recommendations/[repId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching-deep/recommendations/[repId]/page.tsx) | Enterprise UI View for `/crm/coaching-deep/recommendations/[repId]` |
| `/crm/coaching` | [`app/(dashboard)/crm/coaching/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/coaching/page.tsx) | Enterprise UI View for `/crm/coaching` |
| `/crm/commission-plans` | [`app/(dashboard)/crm/commission-plans/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/commission-plans/page.tsx) | Enterprise UI View for `/crm/commission-plans` |
| `/crm/commissions` | [`app/(dashboard)/crm/commissions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/commissions/page.tsx) | Enterprise UI View for `/crm/commissions` |
| `/crm/communication-deep/analytics` | [`app/(dashboard)/crm/communication-deep/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/analytics/page.tsx) | Enterprise UI View for `/crm/communication-deep/analytics` |
| `/crm/communication-deep/message-history` | [`app/(dashboard)/crm/communication-deep/message-history/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/message-history/page.tsx) | Enterprise UI View for `/crm/communication-deep/message-history` |
| `/crm/communication-deep/opt-out` | [`app/(dashboard)/crm/communication-deep/opt-out/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/opt-out/page.tsx) | Enterprise UI View for `/crm/communication-deep/opt-out` |
| `/crm/communication-deep` | [`app/(dashboard)/crm/communication-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/page.tsx) | Enterprise UI View for `/crm/communication-deep` |
| `/crm/communication-deep/preferences` | [`app/(dashboard)/crm/communication-deep/preferences/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/preferences/page.tsx) | Enterprise UI View for `/crm/communication-deep/preferences` |
| `/crm/communication-deep/sms-templates` | [`app/(dashboard)/crm/communication-deep/sms-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/sms-templates/page.tsx) | Enterprise UI View for `/crm/communication-deep/sms-templates` |
| `/crm/communication-deep/social-posts` | [`app/(dashboard)/crm/communication-deep/social-posts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/social-posts/page.tsx) | Enterprise UI View for `/crm/communication-deep/social-posts` |
| `/crm/communication-deep/whatsapp-templates` | [`app/(dashboard)/crm/communication-deep/whatsapp-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-deep/whatsapp-templates/page.tsx) | Enterprise UI View for `/crm/communication-deep/whatsapp-templates` |
| `/crm/communication-templates` | [`app/(dashboard)/crm/communication-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/communication-templates/page.tsx) | Enterprise UI View for `/crm/communication-templates` |
| `/crm/competitor-intelligence/landscape` | [`app/(dashboard)/crm/competitor-intelligence/landscape/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/competitor-intelligence/landscape/page.tsx) | Enterprise UI View for `/crm/competitor-intelligence/landscape` |
| `/crm/competitor-intelligence` | [`app/(dashboard)/crm/competitor-intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/competitor-intelligence/page.tsx) | Enterprise UI View for `/crm/competitor-intelligence` |
| `/crm/competitor-intelligence/reports` | [`app/(dashboard)/crm/competitor-intelligence/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/competitor-intelligence/reports/page.tsx) | Enterprise UI View for `/crm/competitor-intelligence/reports` |
| `/crm/competitor-intelligence/win-loss-categories` | [`app/(dashboard)/crm/competitor-intelligence/win-loss-categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/competitor-intelligence/win-loss-categories/page.tsx) | Enterprise UI View for `/crm/competitor-intelligence/win-loss-categories` |
| `/crm/contacts/[id]` | [`app/(dashboard)/crm/contacts/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contacts/[id]/page.tsx) | Enterprise UI View for `/crm/contacts/[id]` |
| `/crm/contacts` | [`app/(dashboard)/crm/contacts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contacts/page.tsx) | Enterprise UI View for `/crm/contacts` |
| `/crm/contract-deep/clause-library` | [`app/(dashboard)/crm/contract-deep/clause-library/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/clause-library/page.tsx) | Enterprise UI View for `/crm/contract-deep/clause-library` |
| `/crm/contract-deep/compliance` | [`app/(dashboard)/crm/contract-deep/compliance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/compliance/page.tsx) | Enterprise UI View for `/crm/contract-deep/compliance` |
| `/crm/contract-deep/financial-summary` | [`app/(dashboard)/crm/contract-deep/financial-summary/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/financial-summary/page.tsx) | Enterprise UI View for `/crm/contract-deep/financial-summary` |
| `/crm/contract-deep/obligations` | [`app/(dashboard)/crm/contract-deep/obligations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/obligations/page.tsx) | Enterprise UI View for `/crm/contract-deep/obligations` |
| `/crm/contract-deep` | [`app/(dashboard)/crm/contract-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/page.tsx) | Enterprise UI View for `/crm/contract-deep` |
| `/crm/contract-deep/templates` | [`app/(dashboard)/crm/contract-deep/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/templates/page.tsx) | Enterprise UI View for `/crm/contract-deep/templates` |
| `/crm/contract-deep/version-history` | [`app/(dashboard)/crm/contract-deep/version-history/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contract-deep/version-history/page.tsx) | Enterprise UI View for `/crm/contract-deep/version-history` |
| `/crm/contracts/[id]` | [`app/(dashboard)/crm/contracts/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contracts/[id]/page.tsx) | Enterprise UI View for `/crm/contracts/[id]` |
| `/crm/contracts` | [`app/(dashboard)/crm/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/contracts/page.tsx) | Enterprise UI View for `/crm/contracts` |
| `/crm/conversation-intelligence` | [`app/(dashboard)/crm/conversation-intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/conversation-intelligence/page.tsx) | Enterprise UI View for `/crm/conversation-intelligence` |
| `/crm/cpq/bundles/[id]` | [`app/(dashboard)/crm/cpq/bundles/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/bundles/[id]/page.tsx) | Enterprise UI View for `/crm/cpq/bundles/[id]` |
| `/crm/cpq/bundles` | [`app/(dashboard)/crm/cpq/bundles/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/bundles/page.tsx) | Enterprise UI View for `/crm/cpq/bundles` |
| `/crm/cpq` | [`app/(dashboard)/crm/cpq/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/page.tsx) | Enterprise UI View for `/crm/cpq` |
| `/crm/cpq/pricing-rules/[id]` | [`app/(dashboard)/crm/cpq/pricing-rules/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/pricing-rules/[id]/page.tsx) | Enterprise UI View for `/crm/cpq/pricing-rules/[id]` |
| `/crm/cpq/pricing-rules` | [`app/(dashboard)/crm/cpq/pricing-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/pricing-rules/page.tsx) | Enterprise UI View for `/crm/cpq/pricing-rules` |
| `/crm/cpq/quote-analysis` | [`app/(dashboard)/crm/cpq/quote-analysis/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/cpq/quote-analysis/page.tsx) | Enterprise UI View for `/crm/cpq/quote-analysis` |
| `/crm/customer-portal` | [`app/(dashboard)/crm/customer-portal/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/customer-portal/page.tsx) | Enterprise UI View for `/crm/customer-portal` |
| `/crm/customer-success` | [`app/(dashboard)/crm/customer-success/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/customer-success/page.tsx) | Enterprise UI View for `/crm/customer-success` |
| `/crm/customers/[id]` | [`app/(dashboard)/crm/customers/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/customers/[id]/page.tsx) | Enterprise UI View for `/crm/customers/[id]` |
| `/crm/customers` | [`app/(dashboard)/crm/customers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/customers/page.tsx) | Enterprise UI View for `/crm/customers` |
| `/crm/dashboards/[id]` | [`app/(dashboard)/crm/dashboards/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/dashboards/[id]/page.tsx) | Enterprise UI View for `/crm/dashboards/[id]` |
| `/crm/dashboards` | [`app/(dashboard)/crm/dashboards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/dashboards/page.tsx) | Enterprise UI View for `/crm/dashboards` |
| `/crm/data-management/bulk-operations` | [`app/(dashboard)/crm/data-management/bulk-operations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/bulk-operations/page.tsx) | Enterprise UI View for `/crm/data-management/bulk-operations` |
| `/crm/data-management/duplicates` | [`app/(dashboard)/crm/data-management/duplicates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/duplicates/page.tsx) | Enterprise UI View for `/crm/data-management/duplicates` |
| `/crm/data-management/export` | [`app/(dashboard)/crm/data-management/export/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/export/page.tsx) | Enterprise UI View for `/crm/data-management/export` |
| `/crm/data-management/imports` | [`app/(dashboard)/crm/data-management/imports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/imports/page.tsx) | Enterprise UI View for `/crm/data-management/imports` |
| `/crm/data-management` | [`app/(dashboard)/crm/data-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/page.tsx) | Enterprise UI View for `/crm/data-management` |
| `/crm/data-management/quality` | [`app/(dashboard)/crm/data-management/quality/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/data-management/quality/page.tsx) | Enterprise UI View for `/crm/data-management/quality` |
| `/crm/deal-analytics` | [`app/(dashboard)/crm/deal-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-analytics/page.tsx) | Enterprise UI View for `/crm/deal-analytics` |
| `/crm/deal-desk/alerts` | [`app/(dashboard)/crm/deal-desk/alerts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-desk/alerts/page.tsx) | Enterprise UI View for `/crm/deal-desk/alerts` |
| `/crm/deal-desk/automation` | [`app/(dashboard)/crm/deal-desk/automation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-desk/automation/page.tsx) | Enterprise UI View for `/crm/deal-desk/automation` |
| `/crm/deal-desk` | [`app/(dashboard)/crm/deal-desk/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-desk/page.tsx) | Enterprise UI View for `/crm/deal-desk` |
| `/crm/deal-desk/requests/[id]` | [`app/(dashboard)/crm/deal-desk/requests/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-desk/requests/[id]/page.tsx) | Enterprise UI View for `/crm/deal-desk/requests/[id]` |
| `/crm/deal-desk/requests` | [`app/(dashboard)/crm/deal-desk/requests/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-desk/requests/page.tsx) | Enterprise UI View for `/crm/deal-desk/requests` |
| `/crm/deal-rooms/[id]` | [`app/(dashboard)/crm/deal-rooms/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-rooms/[id]/page.tsx) | Enterprise UI View for `/crm/deal-rooms/[id]` |
| `/crm/deal-rooms` | [`app/(dashboard)/crm/deal-rooms/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/deal-rooms/page.tsx) | Enterprise UI View for `/crm/deal-rooms` |
| `/crm/documents` | [`app/(dashboard)/crm/documents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/documents/page.tsx) | Enterprise UI View for `/crm/documents` |
| `/crm/email-templates` | [`app/(dashboard)/crm/email-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/email-templates/page.tsx) | Enterprise UI View for `/crm/email-templates` |
| `/crm/forecast-governance/accuracy` | [`app/(dashboard)/crm/forecast-governance/accuracy/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecast-governance/accuracy/page.tsx) | Enterprise UI View for `/crm/forecast-governance/accuracy` |
| `/crm/forecast-governance` | [`app/(dashboard)/crm/forecast-governance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecast-governance/page.tsx) | Enterprise UI View for `/crm/forecast-governance` |
| `/crm/forecast-governance/team-rollup` | [`app/(dashboard)/crm/forecast-governance/team-rollup/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecast-governance/team-rollup/page.tsx) | Enterprise UI View for `/crm/forecast-governance/team-rollup` |
| `/crm/forecasting/conversion-analytics` | [`app/(dashboard)/crm/forecasting/conversion-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecasting/conversion-analytics/page.tsx) | Enterprise UI View for `/crm/forecasting/conversion-analytics` |
| `/crm/forecasting` | [`app/(dashboard)/crm/forecasting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecasting/page.tsx) | Enterprise UI View for `/crm/forecasting` |
| `/crm/forecasting/pipeline-risk` | [`app/(dashboard)/crm/forecasting/pipeline-risk/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecasting/pipeline-risk/page.tsx) | Enterprise UI View for `/crm/forecasting/pipeline-risk` |
| `/crm/forecasting/revenue-intelligence` | [`app/(dashboard)/crm/forecasting/revenue-intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forecasting/revenue-intelligence/page.tsx) | Enterprise UI View for `/crm/forecasting/revenue-intelligence` |
| `/crm/forms` | [`app/(dashboard)/crm/forms/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/forms/page.tsx) | Enterprise UI View for `/crm/forms` |
| `/crm/gamification-deep/achievements/[userId]` | [`app/(dashboard)/crm/gamification-deep/achievements/[userId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/achievements/[userId]/page.tsx) | Enterprise UI View for `/crm/gamification-deep/achievements/[userId]` |
| `/crm/gamification-deep/contests/[id]` | [`app/(dashboard)/crm/gamification-deep/contests/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/contests/[id]/page.tsx) | Enterprise UI View for `/crm/gamification-deep/contests/[id]` |
| `/crm/gamification-deep/contests` | [`app/(dashboard)/crm/gamification-deep/contests/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/contests/page.tsx) | Enterprise UI View for `/crm/gamification-deep/contests` |
| `/crm/gamification-deep/goals` | [`app/(dashboard)/crm/gamification-deep/goals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/goals/page.tsx) | Enterprise UI View for `/crm/gamification-deep/goals` |
| `/crm/gamification-deep/leaderboard` | [`app/(dashboard)/crm/gamification-deep/leaderboard/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/leaderboard/page.tsx) | Enterprise UI View for `/crm/gamification-deep/leaderboard` |
| `/crm/gamification-deep` | [`app/(dashboard)/crm/gamification-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/page.tsx) | Enterprise UI View for `/crm/gamification-deep` |
| `/crm/gamification-deep/streaks/[userId]` | [`app/(dashboard)/crm/gamification-deep/streaks/[userId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification-deep/streaks/[userId]/page.tsx) | Enterprise UI View for `/crm/gamification-deep/streaks/[userId]` |
| `/crm/gamification` | [`app/(dashboard)/crm/gamification/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/gamification/page.tsx) | Enterprise UI View for `/crm/gamification` |
| `/crm/help-center/articles/[id]` | [`app/(dashboard)/crm/help-center/articles/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/help-center/articles/[id]/page.tsx) | Enterprise UI View for `/crm/help-center/articles/[id]` |
| `/crm/help-center/articles` | [`app/(dashboard)/crm/help-center/articles/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/help-center/articles/page.tsx) | Enterprise UI View for `/crm/help-center/articles` |
| `/crm/help-center` | [`app/(dashboard)/crm/help-center/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/help-center/page.tsx) | Enterprise UI View for `/crm/help-center` |
| `/crm/integrations/calendar` | [`app/(dashboard)/crm/integrations/calendar/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/integrations/calendar/page.tsx) | Enterprise UI View for `/crm/integrations/calendar` |
| `/crm/integrations/event-logs` | [`app/(dashboard)/crm/integrations/event-logs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/integrations/event-logs/page.tsx) | Enterprise UI View for `/crm/integrations/event-logs` |
| `/crm/integrations` | [`app/(dashboard)/crm/integrations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/integrations/page.tsx) | Enterprise UI View for `/crm/integrations` |
| `/crm/integrations/slack` | [`app/(dashboard)/crm/integrations/slack/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/integrations/slack/page.tsx) | Enterprise UI View for `/crm/integrations/slack` |
| `/crm/integrations/webhooks` | [`app/(dashboard)/crm/integrations/webhooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/integrations/webhooks/page.tsx) | Enterprise UI View for `/crm/integrations/webhooks` |
| `/crm/intelligence/campaigns` | [`app/(dashboard)/crm/intelligence/campaigns/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/campaigns/page.tsx) | Enterprise UI View for `/crm/intelligence/campaigns` |
| `/crm/intelligence/clv` | [`app/(dashboard)/crm/intelligence/clv/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/clv/page.tsx) | Enterprise UI View for `/crm/intelligence/clv` |
| `/crm/intelligence/deal-velocity` | [`app/(dashboard)/crm/intelligence/deal-velocity/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/deal-velocity/page.tsx) | Enterprise UI View for `/crm/intelligence/deal-velocity` |
| `/crm/intelligence/health` | [`app/(dashboard)/crm/intelligence/health/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/health/page.tsx) | Enterprise UI View for `/crm/intelligence/health` |
| `/crm/intelligence/journey` | [`app/(dashboard)/crm/intelligence/journey/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/journey/page.tsx) | Enterprise UI View for `/crm/intelligence/journey` |
| `/crm/intelligence/lead-scoring` | [`app/(dashboard)/crm/intelligence/lead-scoring/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/lead-scoring/page.tsx) | Enterprise UI View for `/crm/intelligence/lead-scoring` |
| `/crm/intelligence` | [`app/(dashboard)/crm/intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/page.tsx) | Enterprise UI View for `/crm/intelligence` |
| `/crm/intelligence/partners` | [`app/(dashboard)/crm/intelligence/partners/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/partners/page.tsx) | Enterprise UI View for `/crm/intelligence/partners` |
| `/crm/intelligence/sentiment` | [`app/(dashboard)/crm/intelligence/sentiment/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/intelligence/sentiment/page.tsx) | Enterprise UI View for `/crm/intelligence/sentiment` |
| `/crm/journey/[customerId]` | [`app/(dashboard)/crm/journey/[customerId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/[customerId]/page.tsx) | Enterprise UI View for `/crm/journey/[customerId]` |
| `/crm/journey/churn` | [`app/(dashboard)/crm/journey/churn/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/churn/page.tsx) | Enterprise UI View for `/crm/journey/churn` |
| `/crm/journey/clv` | [`app/(dashboard)/crm/journey/clv/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/clv/page.tsx) | Enterprise UI View for `/crm/journey/clv` |
| `/crm/journey/customer-360/[customerId]` | [`app/(dashboard)/crm/journey/customer-360/[customerId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/customer-360/[customerId]/page.tsx) | Enterprise UI View for `/crm/journey/customer-360/[customerId]` |
| `/crm/journey/nps` | [`app/(dashboard)/crm/journey/nps/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/nps/page.tsx) | Enterprise UI View for `/crm/journey/nps` |
| `/crm/journey/nps/surveys/[id]` | [`app/(dashboard)/crm/journey/nps/surveys/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/nps/surveys/[id]/page.tsx) | Enterprise UI View for `/crm/journey/nps/surveys/[id]` |
| `/crm/journey` | [`app/(dashboard)/crm/journey/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/page.tsx) | Enterprise UI View for `/crm/journey` |
| `/crm/journey/stages` | [`app/(dashboard)/crm/journey/stages/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/stages/page.tsx) | Enterprise UI View for `/crm/journey/stages` |
| `/crm/journey/upsell` | [`app/(dashboard)/crm/journey/upsell/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/journey/upsell/page.tsx) | Enterprise UI View for `/crm/journey/upsell` |
| `/crm/knowledge-base` | [`app/(dashboard)/crm/knowledge-base/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/knowledge-base/page.tsx) | Enterprise UI View for `/crm/knowledge-base` |
| `/crm/leads/[id]` | [`app/(dashboard)/crm/leads/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/leads/[id]/page.tsx) | Enterprise UI View for `/crm/leads/[id]` |
| `/crm/leads` | [`app/(dashboard)/crm/leads/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/leads/page.tsx) | Enterprise UI View for `/crm/leads` |
| `/crm/marketing-deep/assets` | [`app/(dashboard)/crm/marketing-deep/assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-deep/assets/page.tsx) | Enterprise UI View for `/crm/marketing-deep/assets` |
| `/crm/marketing-deep/attribution` | [`app/(dashboard)/crm/marketing-deep/attribution/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-deep/attribution/page.tsx) | Enterprise UI View for `/crm/marketing-deep/attribution` |
| `/crm/marketing-deep/landing-pages` | [`app/(dashboard)/crm/marketing-deep/landing-pages/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-deep/landing-pages/page.tsx) | Enterprise UI View for `/crm/marketing-deep/landing-pages` |
| `/crm/marketing-deep` | [`app/(dashboard)/crm/marketing-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-deep/page.tsx) | Enterprise UI View for `/crm/marketing-deep` |
| `/crm/marketing-deep/visitor-analytics` | [`app/(dashboard)/crm/marketing-deep/visitor-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-deep/visitor-analytics/page.tsx) | Enterprise UI View for `/crm/marketing-deep/visitor-analytics` |
| `/crm/marketing-outreach` | [`app/(dashboard)/crm/marketing-outreach/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/marketing-outreach/page.tsx) | Enterprise UI View for `/crm/marketing-outreach` |
| `/crm/opportunities/[id]` | [`app/(dashboard)/crm/opportunities/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/opportunities/[id]/page.tsx) | Enterprise UI View for `/crm/opportunities/[id]` |
| `/crm/opportunities` | [`app/(dashboard)/crm/opportunities/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/opportunities/page.tsx) | Enterprise UI View for `/crm/opportunities` |
| `/crm` | [`app/(dashboard)/crm/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/page.tsx) | Enterprise UI View for `/crm` |
| `/crm/partner-deep/contracts` | [`app/(dashboard)/crm/partner-deep/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/contracts/page.tsx) | Enterprise UI View for `/crm/partner-deep/contracts` |
| `/crm/partner-deep/dashboard` | [`app/(dashboard)/crm/partner-deep/dashboard/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/dashboard/page.tsx) | Enterprise UI View for `/crm/partner-deep/dashboard` |
| `/crm/partner-deep` | [`app/(dashboard)/crm/partner-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/page.tsx) | Enterprise UI View for `/crm/partner-deep` |
| `/crm/partner-deep/performance` | [`app/(dashboard)/crm/partner-deep/performance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/performance/page.tsx) | Enterprise UI View for `/crm/partner-deep/performance` |
| `/crm/partner-deep/referrals` | [`app/(dashboard)/crm/partner-deep/referrals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/referrals/page.tsx) | Enterprise UI View for `/crm/partner-deep/referrals` |
| `/crm/partner-deep/tier-requirements` | [`app/(dashboard)/crm/partner-deep/tier-requirements/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-deep/tier-requirements/page.tsx) | Enterprise UI View for `/crm/partner-deep/tier-requirements` |
| `/crm/partner-management` | [`app/(dashboard)/crm/partner-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/partner-management/page.tsx) | Enterprise UI View for `/crm/partner-management` |
| `/crm/pipeline-deep/analytics` | [`app/(dashboard)/crm/pipeline-deep/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/pipeline-deep/analytics/page.tsx) | Enterprise UI View for `/crm/pipeline-deep/analytics` |
| `/crm/pipeline-deep/conversion` | [`app/(dashboard)/crm/pipeline-deep/conversion/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/pipeline-deep/conversion/page.tsx) | Enterprise UI View for `/crm/pipeline-deep/conversion` |
| `/crm/pipeline-deep/deal-comparison` | [`app/(dashboard)/crm/pipeline-deep/deal-comparison/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/pipeline-deep/deal-comparison/page.tsx) | Enterprise UI View for `/crm/pipeline-deep/deal-comparison` |
| `/crm/pipeline-deep/inspection` | [`app/(dashboard)/crm/pipeline-deep/inspection/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/pipeline-deep/inspection/page.tsx) | Enterprise UI View for `/crm/pipeline-deep/inspection` |
| `/crm/pipeline-deep` | [`app/(dashboard)/crm/pipeline-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/pipeline-deep/page.tsx) | Enterprise UI View for `/crm/pipeline-deep` |
| `/crm/playbooks` | [`app/(dashboard)/crm/playbooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/playbooks/page.tsx) | Enterprise UI View for `/crm/playbooks` |
| `/crm/portal-settings/documents` | [`app/(dashboard)/crm/portal-settings/documents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/portal-settings/documents/page.tsx) | Enterprise UI View for `/crm/portal-settings/documents` |
| `/crm/portal-settings/forum` | [`app/(dashboard)/crm/portal-settings/forum/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/portal-settings/forum/page.tsx) | Enterprise UI View for `/crm/portal-settings/forum` |
| `/crm/portal-settings/notifications` | [`app/(dashboard)/crm/portal-settings/notifications/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/portal-settings/notifications/page.tsx) | Enterprise UI View for `/crm/portal-settings/notifications` |
| `/crm/portal-settings` | [`app/(dashboard)/crm/portal-settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/portal-settings/page.tsx) | Enterprise UI View for `/crm/portal-settings` |
| `/crm/price-books` | [`app/(dashboard)/crm/price-books/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/price-books/page.tsx) | Enterprise UI View for `/crm/price-books` |
| `/crm/products` | [`app/(dashboard)/crm/products/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/products/page.tsx) | Enterprise UI View for `/crm/products` |
| `/crm/quotations` | [`app/(dashboard)/crm/quotations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/quotations/page.tsx) | Enterprise UI View for `/crm/quotations` |
| `/crm/quotations/signatures` | [`app/(dashboard)/crm/quotations/signatures/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/quotations/signatures/page.tsx) | Enterprise UI View for `/crm/quotations/signatures` |
| `/crm/reporting-deep/dashboards/templates` | [`app/(dashboard)/crm/reporting-deep/dashboards/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/dashboards/templates/page.tsx) | Enterprise UI View for `/crm/reporting-deep/dashboards/templates` |
| `/crm/reporting-deep` | [`app/(dashboard)/crm/reporting-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/page.tsx) | Enterprise UI View for `/crm/reporting-deep` |
| `/crm/reporting-deep/reports/[id]` | [`app/(dashboard)/crm/reporting-deep/reports/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/reports/[id]/page.tsx) | Enterprise UI View for `/crm/reporting-deep/reports/[id]` |
| `/crm/reporting-deep/reports/[id]/schedules` | [`app/(dashboard)/crm/reporting-deep/reports/[id]/schedules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/reports/[id]/schedules/page.tsx) | Enterprise UI View for `/crm/reporting-deep/reports/[id]/schedules` |
| `/crm/reporting-deep/reports/new` | [`app/(dashboard)/crm/reporting-deep/reports/new/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/reports/new/page.tsx) | Enterprise UI View for `/crm/reporting-deep/reports/new` |
| `/crm/reporting-deep/reports` | [`app/(dashboard)/crm/reporting-deep/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reporting-deep/reports/page.tsx) | Enterprise UI View for `/crm/reporting-deep/reports` |
| `/crm/reports` | [`app/(dashboard)/crm/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/reports/page.tsx) | Enterprise UI View for `/crm/reports` |
| `/crm/sales-enablement/analytics` | [`app/(dashboard)/crm/sales-enablement/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-enablement/analytics/page.tsx) | Enterprise UI View for `/crm/sales-enablement/analytics` |
| `/crm/sales-enablement/categories` | [`app/(dashboard)/crm/sales-enablement/categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-enablement/categories/page.tsx) | Enterprise UI View for `/crm/sales-enablement/categories` |
| `/crm/sales-enablement/content/[id]` | [`app/(dashboard)/crm/sales-enablement/content/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-enablement/content/[id]/page.tsx) | Enterprise UI View for `/crm/sales-enablement/content/[id]` |
| `/crm/sales-enablement/content` | [`app/(dashboard)/crm/sales-enablement/content/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-enablement/content/page.tsx) | Enterprise UI View for `/crm/sales-enablement/content` |
| `/crm/sales-enablement` | [`app/(dashboard)/crm/sales-enablement/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-enablement/page.tsx) | Enterprise UI View for `/crm/sales-enablement` |
| `/crm/sales-orders` | [`app/(dashboard)/crm/sales-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sales-orders/page.tsx) | Enterprise UI View for `/crm/sales-orders` |
| `/crm/segments/[id]` | [`app/(dashboard)/crm/segments/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/segments/[id]/page.tsx) | Enterprise UI View for `/crm/segments/[id]` |
| `/crm/segments` | [`app/(dashboard)/crm/segments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/segments/page.tsx) | Enterprise UI View for `/crm/segments` |
| `/crm/sequences/cadences` | [`app/(dashboard)/crm/sequences/cadences/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sequences/cadences/page.tsx) | Enterprise UI View for `/crm/sequences/cadences` |
| `/crm/sequences` | [`app/(dashboard)/crm/sequences/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/sequences/page.tsx) | Enterprise UI View for `/crm/sequences` |
| `/crm/settings/approvals` | [`app/(dashboard)/crm/settings/approvals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/approvals/page.tsx) | Enterprise UI View for `/crm/settings/approvals` |
| `/crm/settings/custom-fields` | [`app/(dashboard)/crm/settings/custom-fields/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/custom-fields/page.tsx) | Enterprise UI View for `/crm/settings/custom-fields` |
| `/crm/settings/duplicate-rules` | [`app/(dashboard)/crm/settings/duplicate-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/duplicate-rules/page.tsx) | Enterprise UI View for `/crm/settings/duplicate-rules` |
| `/crm/settings/email-integration` | [`app/(dashboard)/crm/settings/email-integration/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/email-integration/page.tsx) | Enterprise UI View for `/crm/settings/email-integration` |
| `/crm/settings/lead-scoring` | [`app/(dashboard)/crm/settings/lead-scoring/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/lead-scoring/page.tsx) | Enterprise UI View for `/crm/settings/lead-scoring` |
| `/crm/settings` | [`app/(dashboard)/crm/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/page.tsx) | Enterprise UI View for `/crm/settings` |
| `/crm/settings/pipelines` | [`app/(dashboard)/crm/settings/pipelines/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/pipelines/page.tsx) | Enterprise UI View for `/crm/settings/pipelines` |
| `/crm/settings/record-types` | [`app/(dashboard)/crm/settings/record-types/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/record-types/page.tsx) | Enterprise UI View for `/crm/settings/record-types` |
| `/crm/settings/sla-policies` | [`app/(dashboard)/crm/settings/sla-policies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/settings/sla-policies/page.tsx) | Enterprise UI View for `/crm/settings/sla-policies` |
| `/crm/support-deep/agent-performance` | [`app/(dashboard)/crm/support-deep/agent-performance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/support-deep/agent-performance/page.tsx) | Enterprise UI View for `/crm/support-deep/agent-performance` |
| `/crm/support-deep/live-chat` | [`app/(dashboard)/crm/support-deep/live-chat/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/support-deep/live-chat/page.tsx) | Enterprise UI View for `/crm/support-deep/live-chat` |
| `/crm/support-deep` | [`app/(dashboard)/crm/support-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/support-deep/page.tsx) | Enterprise UI View for `/crm/support-deep` |
| `/crm/territories/assignment-rules` | [`app/(dashboard)/crm/territories/assignment-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territories/assignment-rules/page.tsx) | Enterprise UI View for `/crm/territories/assignment-rules` |
| `/crm/territories` | [`app/(dashboard)/crm/territories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territories/page.tsx) | Enterprise UI View for `/crm/territories` |
| `/crm/territory-deep/account-teams` | [`app/(dashboard)/crm/territory-deep/account-teams/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territory-deep/account-teams/page.tsx) | Enterprise UI View for `/crm/territory-deep/account-teams` |
| `/crm/territory-deep/named-accounts` | [`app/(dashboard)/crm/territory-deep/named-accounts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territory-deep/named-accounts/page.tsx) | Enterprise UI View for `/crm/territory-deep/named-accounts` |
| `/crm/territory-deep` | [`app/(dashboard)/crm/territory-deep/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territory-deep/page.tsx) | Enterprise UI View for `/crm/territory-deep` |
| `/crm/territory-deep/plans/[id]` | [`app/(dashboard)/crm/territory-deep/plans/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territory-deep/plans/[id]/page.tsx) | Enterprise UI View for `/crm/territory-deep/plans/[id]` |
| `/crm/territory-deep/plans/new` | [`app/(dashboard)/crm/territory-deep/plans/new/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/territory-deep/plans/new/page.tsx) | Enterprise UI View for `/crm/territory-deep/plans/new` |
| `/crm/vendors/[id]` | [`app/(dashboard)/crm/vendors/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/vendors/[id]/page.tsx) | Enterprise UI View for `/crm/vendors/[id]` |
| `/crm/vendors` | [`app/(dashboard)/crm/vendors/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/vendors/page.tsx) | Enterprise UI View for `/crm/vendors` |
| `/crm/win-loss` | [`app/(dashboard)/crm/win-loss/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/win-loss/page.tsx) | Enterprise UI View for `/crm/win-loss` |
| `/crm/workflows` | [`app/(dashboard)/crm/workflows/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/crm/workflows/page.tsx) | Enterprise UI View for `/crm/workflows` |

### <a id="module-finance"></a> 📦 Domain Module: `finance` (84 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/finance/advanced/1099-reporting` | [`app/(dashboard)/finance/advanced/1099-reporting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/1099-reporting/page.tsx) | Enterprise UI View for `/finance/advanced/1099-reporting` |
| `/finance/advanced/account-reconciliation` | [`app/(dashboard)/finance/advanced/account-reconciliation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/account-reconciliation/page.tsx) | Enterprise UI View for `/finance/advanced/account-reconciliation` |
| `/finance/advanced/accounting-books` | [`app/(dashboard)/finance/advanced/accounting-books/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/accounting-books/page.tsx) | Enterprise UI View for `/finance/advanced/accounting-books` |
| `/finance/advanced/ai-analytics` | [`app/(dashboard)/finance/advanced/ai-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ai-analytics/page.tsx) | Enterprise UI View for `/finance/advanced/ai-analytics` |
| `/finance/advanced/allocations` | [`app/(dashboard)/finance/advanced/allocations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/allocations/page.tsx) | Enterprise UI View for `/finance/advanced/allocations` |
| `/finance/advanced/ap-automation-v2` | [`app/(dashboard)/finance/advanced/ap-automation-v2/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ap-automation-v2/page.tsx) | Enterprise UI View for `/finance/advanced/ap-automation-v2` |
| `/finance/advanced/ap-automation` | [`app/(dashboard)/finance/advanced/ap-automation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ap-automation/page.tsx) | Enterprise UI View for `/finance/advanced/ap-automation` |
| `/finance/advanced/ap-match-rules` | [`app/(dashboard)/finance/advanced/ap-match-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ap-match-rules/page.tsx) | Enterprise UI View for `/finance/advanced/ap-match-rules` |
| `/finance/advanced/ar-aging` | [`app/(dashboard)/finance/advanced/ar-aging/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ar-aging/page.tsx) | Enterprise UI View for `/finance/advanced/ar-aging` |
| `/finance/advanced/ar-automation` | [`app/(dashboard)/finance/advanced/ar-automation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/ar-automation/page.tsx) | Enterprise UI View for `/finance/advanced/ar-automation` |
| `/finance/advanced/audit-logs` | [`app/(dashboard)/finance/advanced/audit-logs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/audit-logs/page.tsx) | Enterprise UI View for `/finance/advanced/audit-logs` |
| `/finance/advanced/bank-accounts` | [`app/(dashboard)/finance/advanced/bank-accounts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/bank-accounts/page.tsx) | Enterprise UI View for `/finance/advanced/bank-accounts` |
| `/finance/advanced/bank-feeds` | [`app/(dashboard)/finance/advanced/bank-feeds/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/bank-feeds/page.tsx) | Enterprise UI View for `/finance/advanced/bank-feeds` |
| `/finance/advanced/bank-recon` | [`app/(dashboard)/finance/advanced/bank-recon/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/bank-recon/page.tsx) | Enterprise UI View for `/finance/advanced/bank-recon` |
| `/finance/advanced/budget-scenarios` | [`app/(dashboard)/finance/advanced/budget-scenarios/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/budget-scenarios/page.tsx) | Enterprise UI View for `/finance/advanced/budget-scenarios` |
| `/finance/advanced/budgeting` | [`app/(dashboard)/finance/advanced/budgeting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/budgeting/page.tsx) | Enterprise UI View for `/finance/advanced/budgeting` |
| `/finance/advanced/cash-flow-forecast` | [`app/(dashboard)/finance/advanced/cash-flow-forecast/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/cash-flow-forecast/page.tsx) | Enterprise UI View for `/finance/advanced/cash-flow-forecast` |
| `/finance/advanced/cash-position` | [`app/(dashboard)/finance/advanced/cash-position/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/cash-position/page.tsx) | Enterprise UI View for `/finance/advanced/cash-position` |
| `/finance/advanced/chart-of-accounts` | [`app/(dashboard)/finance/advanced/chart-of-accounts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/chart-of-accounts/page.tsx) | Enterprise UI View for `/finance/advanced/chart-of-accounts` |
| `/finance/advanced/close-management` | [`app/(dashboard)/finance/advanced/close-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/close-management/page.tsx) | Enterprise UI View for `/finance/advanced/close-management` |
| `/finance/advanced/close-tasks` | [`app/(dashboard)/finance/advanced/close-tasks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/close-tasks/page.tsx) | Enterprise UI View for `/finance/advanced/close-tasks` |
| `/finance/advanced/consolidation-v2` | [`app/(dashboard)/finance/advanced/consolidation-v2/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/consolidation-v2/page.tsx) | Enterprise UI View for `/finance/advanced/consolidation-v2` |
| `/finance/advanced/consolidation` | [`app/(dashboard)/finance/advanced/consolidation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/consolidation/page.tsx) | Enterprise UI View for `/finance/advanced/consolidation` |
| `/finance/advanced/corporate-cards/[id]` | [`app/(dashboard)/finance/advanced/corporate-cards/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/corporate-cards/[id]/page.tsx) | Enterprise UI View for `/finance/advanced/corporate-cards/[id]` |
| `/finance/advanced/corporate-cards` | [`app/(dashboard)/finance/advanced/corporate-cards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/corporate-cards/page.tsx) | Enterprise UI View for `/finance/advanced/corporate-cards` |
| `/finance/advanced/credit-risk` | [`app/(dashboard)/finance/advanced/credit-risk/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/credit-risk/page.tsx) | Enterprise UI View for `/finance/advanced/credit-risk` |
| `/finance/advanced/currency-revaluation` | [`app/(dashboard)/finance/advanced/currency-revaluation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/currency-revaluation/page.tsx) | Enterprise UI View for `/finance/advanced/currency-revaluation` |
| `/finance/advanced/customer-statement` | [`app/(dashboard)/finance/advanced/customer-statement/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/customer-statement/page.tsx) | Enterprise UI View for `/finance/advanced/customer-statement` |
| `/finance/advanced/e-invoicing` | [`app/(dashboard)/finance/advanced/e-invoicing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/e-invoicing/page.tsx) | Enterprise UI View for `/finance/advanced/e-invoicing` |
| `/finance/advanced/esg-accounting` | [`app/(dashboard)/finance/advanced/esg-accounting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/esg-accounting/page.tsx) | Enterprise UI View for `/finance/advanced/esg-accounting` |
| `/finance/advanced/exception-queue` | [`app/(dashboard)/finance/advanced/exception-queue/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/exception-queue/page.tsx) | Enterprise UI View for `/finance/advanced/exception-queue` |
| `/finance/advanced/exchange-rates` | [`app/(dashboard)/finance/advanced/exchange-rates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/exchange-rates/page.tsx) | Enterprise UI View for `/finance/advanced/exchange-rates` |
| `/finance/advanced/expense-policies` | [`app/(dashboard)/finance/advanced/expense-policies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/expense-policies/page.tsx) | Enterprise UI View for `/finance/advanced/expense-policies` |
| `/finance/advanced/expense-reports` | [`app/(dashboard)/finance/advanced/expense-reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/expense-reports/page.tsx) | Enterprise UI View for `/finance/advanced/expense-reports` |
| `/finance/advanced/financial-periods` | [`app/(dashboard)/finance/advanced/financial-periods/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/financial-periods/page.tsx) | Enterprise UI View for `/finance/advanced/financial-periods` |
| `/finance/advanced/financial-ratios` | [`app/(dashboard)/finance/advanced/financial-ratios/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/financial-ratios/page.tsx) | Enterprise UI View for `/finance/advanced/financial-ratios` |
| `/finance/advanced/fixed-assets/assets/[id]` | [`app/(dashboard)/finance/advanced/fixed-assets/assets/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/fixed-assets/assets/[id]/page.tsx) | Enterprise UI View for `/finance/advanced/fixed-assets/assets/[id]` |
| `/finance/advanced/fixed-assets/assets/new` | [`app/(dashboard)/finance/advanced/fixed-assets/assets/new/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/fixed-assets/assets/new/page.tsx) | Enterprise UI View for `/finance/advanced/fixed-assets/assets/new` |
| `/finance/advanced/fixed-assets/assets` | [`app/(dashboard)/finance/advanced/fixed-assets/assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/fixed-assets/assets/page.tsx) | Enterprise UI View for `/finance/advanced/fixed-assets/assets` |
| `/finance/advanced/fixed-assets` | [`app/(dashboard)/finance/advanced/fixed-assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/fixed-assets/page.tsx) | Enterprise UI View for `/finance/advanced/fixed-assets` |
| `/finance/advanced/forecast-scenarios` | [`app/(dashboard)/finance/advanced/forecast-scenarios/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/forecast-scenarios/page.tsx) | Enterprise UI View for `/finance/advanced/forecast-scenarios` |
| `/finance/advanced/fx-revaluation` | [`app/(dashboard)/finance/advanced/fx-revaluation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/fx-revaluation/page.tsx) | Enterprise UI View for `/finance/advanced/fx-revaluation` |
| `/finance/advanced/intercompany/eliminations` | [`app/(dashboard)/finance/advanced/intercompany/eliminations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/intercompany/eliminations/page.tsx) | Enterprise UI View for `/finance/advanced/intercompany/eliminations` |
| `/finance/advanced/intercompany/netting` | [`app/(dashboard)/finance/advanced/intercompany/netting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/intercompany/netting/page.tsx) | Enterprise UI View for `/finance/advanced/intercompany/netting` |
| `/finance/advanced/intercompany` | [`app/(dashboard)/finance/advanced/intercompany/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/intercompany/page.tsx) | Enterprise UI View for `/finance/advanced/intercompany` |
| `/finance/advanced/invoice-analytics` | [`app/(dashboard)/finance/advanced/invoice-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/invoice-analytics/page.tsx) | Enterprise UI View for `/finance/advanced/invoice-analytics` |
| `/finance/advanced/invoice-capture` | [`app/(dashboard)/finance/advanced/invoice-capture/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/invoice-capture/page.tsx) | Enterprise UI View for `/finance/advanced/invoice-capture` |
| `/finance/advanced/journal-entries` | [`app/(dashboard)/finance/advanced/journal-entries/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/journal-entries/page.tsx) | Enterprise UI View for `/finance/advanced/journal-entries` |
| `/finance/advanced/leases/[id]` | [`app/(dashboard)/finance/advanced/leases/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/leases/[id]/page.tsx) | Enterprise UI View for `/finance/advanced/leases/[id]` |
| `/finance/advanced/leases/new` | [`app/(dashboard)/finance/advanced/leases/new/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/leases/new/page.tsx) | Enterprise UI View for `/finance/advanced/leases/new` |
| `/finance/advanced/leases` | [`app/(dashboard)/finance/advanced/leases/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/leases/page.tsx) | Enterprise UI View for `/finance/advanced/leases` |
| `/finance/advanced` | [`app/(dashboard)/finance/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/page.tsx) | Enterprise UI View for `/finance/advanced` |
| `/finance/advanced/payment-batches` | [`app/(dashboard)/finance/advanced/payment-batches/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/payment-batches/page.tsx) | Enterprise UI View for `/finance/advanced/payment-batches` |
| `/finance/advanced/payment-terms` | [`app/(dashboard)/finance/advanced/payment-terms/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/payment-terms/page.tsx) | Enterprise UI View for `/finance/advanced/payment-terms` |
| `/finance/advanced/reconciliations` | [`app/(dashboard)/finance/advanced/reconciliations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/reconciliations/page.tsx) | Enterprise UI View for `/finance/advanced/reconciliations` |
| `/finance/advanced/recurring` | [`app/(dashboard)/finance/advanced/recurring/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/recurring/page.tsx) | Enterprise UI View for `/finance/advanced/recurring` |
| `/finance/advanced/reports` | [`app/(dashboard)/finance/advanced/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/reports/page.tsx) | Enterprise UI View for `/finance/advanced/reports` |
| `/finance/advanced/revenue-schedules` | [`app/(dashboard)/finance/advanced/revenue-schedules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/revenue-schedules/page.tsx) | Enterprise UI View for `/finance/advanced/revenue-schedules` |
| `/finance/advanced/risk-management` | [`app/(dashboard)/finance/advanced/risk-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/risk-management/page.tsx) | Enterprise UI View for `/finance/advanced/risk-management` |
| `/finance/advanced/scenario-comparison` | [`app/(dashboard)/finance/advanced/scenario-comparison/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/scenario-comparison/page.tsx) | Enterprise UI View for `/finance/advanced/scenario-comparison` |
| `/finance/advanced/subscriptions/[id]` | [`app/(dashboard)/finance/advanced/subscriptions/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/subscriptions/[id]/page.tsx) | Enterprise UI View for `/finance/advanced/subscriptions/[id]` |
| `/finance/advanced/subscriptions/new` | [`app/(dashboard)/finance/advanced/subscriptions/new/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/subscriptions/new/page.tsx) | Enterprise UI View for `/finance/advanced/subscriptions/new` |
| `/finance/advanced/subscriptions` | [`app/(dashboard)/finance/advanced/subscriptions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/subscriptions/page.tsx) | Enterprise UI View for `/finance/advanced/subscriptions` |
| `/finance/advanced/tax-engine` | [`app/(dashboard)/finance/advanced/tax-engine/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/tax-engine/page.tsx) | Enterprise UI View for `/finance/advanced/tax-engine` |
| `/finance/advanced/tax-filing-summary` | [`app/(dashboard)/finance/advanced/tax-filing-summary/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/tax-filing-summary/page.tsx) | Enterprise UI View for `/finance/advanced/tax-filing-summary` |
| `/finance/advanced/tax-filing` | [`app/(dashboard)/finance/advanced/tax-filing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/tax-filing/page.tsx) | Enterprise UI View for `/finance/advanced/tax-filing` |
| `/finance/advanced/tax-nexus` | [`app/(dashboard)/finance/advanced/tax-nexus/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/tax-nexus/page.tsx) | Enterprise UI View for `/finance/advanced/tax-nexus` |
| `/finance/advanced/tax-provisioning` | [`app/(dashboard)/finance/advanced/tax-provisioning/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/tax-provisioning/page.tsx) | Enterprise UI View for `/finance/advanced/tax-provisioning` |
| `/finance/advanced/treasury` | [`app/(dashboard)/finance/advanced/treasury/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/treasury/page.tsx) | Enterprise UI View for `/finance/advanced/treasury` |
| `/finance/advanced/working-capital` | [`app/(dashboard)/finance/advanced/working-capital/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/advanced/working-capital/page.tsx) | Enterprise UI View for `/finance/advanced/working-capital` |
| `/finance/ap` | [`app/(dashboard)/finance/ap/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/ap/page.tsx) | Enterprise UI View for `/finance/ap` |
| `/finance/ar/dunning-page.tsx` | [`app/(dashboard)/finance/ar/dunning-page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/ar/dunning-page.tsx) | Enterprise UI View for `/finance/ar/dunning-page.tsx` |
| `/finance/ar` | [`app/(dashboard)/finance/ar/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/ar/page.tsx) | Enterprise UI View for `/finance/ar` |
| `/finance/assets` | [`app/(dashboard)/finance/assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/assets/page.tsx) | Enterprise UI View for `/finance/assets` |
| `/finance/banking` | [`app/(dashboard)/finance/banking/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/banking/page.tsx) | Enterprise UI View for `/finance/banking` |
| `/finance/budget-planning` | [`app/(dashboard)/finance/budget-planning/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/budget-planning/page.tsx) | Enterprise UI View for `/finance/budget-planning` |
| `/finance/expenses` | [`app/(dashboard)/finance/expenses/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/expenses/page.tsx) | Enterprise UI View for `/finance/expenses` |
| `/finance/gl` | [`app/(dashboard)/finance/gl/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/gl/page.tsx) | Enterprise UI View for `/finance/gl` |
| `/finance/invoices/[id]` | [`app/(dashboard)/finance/invoices/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/invoices/[id]/page.tsx) | Enterprise UI View for `/finance/invoices/[id]` |
| `/finance` | [`app/(dashboard)/finance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/page.tsx) | Enterprise UI View for `/finance` |
| `/finance/recurring` | [`app/(dashboard)/finance/recurring/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/recurring/page.tsx) | Enterprise UI View for `/finance/recurring` |
| `/finance/reports` | [`app/(dashboard)/finance/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/reports/page.tsx) | Enterprise UI View for `/finance/reports` |
| `/finance/settings` | [`app/(dashboard)/finance/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/settings/page.tsx) | Enterprise UI View for `/finance/settings` |
| `/finance/tax` | [`app/(dashboard)/finance/tax/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/finance/tax/page.tsx) | Enterprise UI View for `/finance/tax` |

### <a id="module-inventory"></a> 📦 Domain Module: `inventory` (72 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/inventory/advanced` | [`app/(dashboard)/inventory/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/advanced/page.tsx) | Enterprise UI View for `/inventory/advanced` |
| `/inventory/asl` | [`app/(dashboard)/inventory/asl/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/asl/page.tsx) | Enterprise UI View for `/inventory/asl` |
| `/inventory/asn` | [`app/(dashboard)/inventory/asn/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/asn/page.tsx) | Enterprise UI View for `/inventory/asn` |
| `/inventory/atp-ctp` | [`app/(dashboard)/inventory/atp-ctp/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/atp-ctp/page.tsx) | Enterprise UI View for `/inventory/atp-ctp` |
| `/inventory/automation-rules` | [`app/(dashboard)/inventory/automation-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/automation-rules/page.tsx) | Enterprise UI View for `/inventory/automation-rules` |
| `/inventory/batches` | [`app/(dashboard)/inventory/batches/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/batches/page.tsx) | Enterprise UI View for `/inventory/batches` |
| `/inventory/bin-locations` | [`app/(dashboard)/inventory/bin-locations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/bin-locations/page.tsx) | Enterprise UI View for `/inventory/bin-locations` |
| `/inventory/catch-weight-recall` | [`app/(dashboard)/inventory/catch-weight-recall/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/catch-weight-recall/page.tsx) | Enterprise UI View for `/inventory/catch-weight-recall` |
| `/inventory/cold-chain-writeoff` | [`app/(dashboard)/inventory/cold-chain-writeoff/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/cold-chain-writeoff/page.tsx) | Enterprise UI View for `/inventory/cold-chain-writeoff` |
| `/inventory/consignment` | [`app/(dashboard)/inventory/consignment/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/consignment/page.tsx) | Enterprise UI View for `/inventory/consignment` |
| `/inventory/container-pallet` | [`app/(dashboard)/inventory/container-pallet/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/container-pallet/page.tsx) | Enterprise UI View for `/inventory/container-pallet` |
| `/inventory/costing` | [`app/(dashboard)/inventory/costing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/costing/page.tsx) | Enterprise UI View for `/inventory/costing` |
| `/inventory/cross-dock` | [`app/(dashboard)/inventory/cross-dock/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/cross-dock/page.tsx) | Enterprise UI View for `/inventory/cross-dock` |
| `/inventory/customer-consignment` | [`app/(dashboard)/inventory/customer-consignment/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/customer-consignment/page.tsx) | Enterprise UI View for `/inventory/customer-consignment` |
| `/inventory/customer-returns` | [`app/(dashboard)/inventory/customer-returns/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/customer-returns/page.tsx) | Enterprise UI View for `/inventory/customer-returns` |
| `/inventory/cycle-count-schedules` | [`app/(dashboard)/inventory/cycle-count-schedules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/cycle-count-schedules/page.tsx) | Enterprise UI View for `/inventory/cycle-count-schedules` |
| `/inventory/cycle-counts` | [`app/(dashboard)/inventory/cycle-counts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/cycle-counts/page.tsx) | Enterprise UI View for `/inventory/cycle-counts` |
| `/inventory/demand-forecasting` | [`app/(dashboard)/inventory/demand-forecasting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/demand-forecasting/page.tsx) | Enterprise UI View for `/inventory/demand-forecasting` |
| `/inventory/dock-scheduling` | [`app/(dashboard)/inventory/dock-scheduling/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/dock-scheduling/page.tsx) | Enterprise UI View for `/inventory/dock-scheduling` |
| `/inventory/drop-ship` | [`app/(dashboard)/inventory/drop-ship/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/drop-ship/page.tsx) | Enterprise UI View for `/inventory/drop-ship` |
| `/inventory/drp` | [`app/(dashboard)/inventory/drp/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/drp/page.tsx) | Enterprise UI View for `/inventory/drp` |
| `/inventory/edi` | [`app/(dashboard)/inventory/edi/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/edi/page.tsx) | Enterprise UI View for `/inventory/edi` |
| `/inventory/expiry-fefo` | [`app/(dashboard)/inventory/expiry-fefo/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/expiry-fefo/page.tsx) | Enterprise UI View for `/inventory/expiry-fefo` |
| `/inventory/freight-claims` | [`app/(dashboard)/inventory/freight-claims/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/freight-claims/page.tsx) | Enterprise UI View for `/inventory/freight-claims` |
| `/inventory/global-inventory` | [`app/(dashboard)/inventory/global-inventory/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/global-inventory/page.tsx) | Enterprise UI View for `/inventory/global-inventory` |
| `/inventory/hazmat` | [`app/(dashboard)/inventory/hazmat/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/hazmat/page.tsx) | Enterprise UI View for `/inventory/hazmat` |
| `/inventory/inventory-analytics` | [`app/(dashboard)/inventory/inventory-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/inventory-analytics/page.tsx) | Enterprise UI View for `/inventory/inventory-analytics` |
| `/inventory/kits` | [`app/(dashboard)/inventory/kits/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/kits/page.tsx) | Enterprise UI View for `/inventory/kits` |
| `/inventory/labor-management` | [`app/(dashboard)/inventory/labor-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/labor-management/page.tsx) | Enterprise UI View for `/inventory/labor-management` |
| `/inventory/landed-cost` | [`app/(dashboard)/inventory/landed-cost/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/landed-cost/page.tsx) | Enterprise UI View for `/inventory/landed-cost` |
| `/inventory/license-plates` | [`app/(dashboard)/inventory/license-plates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/license-plates/page.tsx) | Enterprise UI View for `/inventory/license-plates` |
| `/inventory/logistics` | [`app/(dashboard)/inventory/logistics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/logistics/page.tsx) | Enterprise UI View for `/inventory/logistics` |
| `/inventory/lot-expiry` | [`app/(dashboard)/inventory/lot-expiry/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/lot-expiry/page.tsx) | Enterprise UI View for `/inventory/lot-expiry` |
| `/inventory/lot-serial` | [`app/(dashboard)/inventory/lot-serial/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/lot-serial/page.tsx) | Enterprise UI View for `/inventory/lot-serial` |
| `/inventory/minmax-replen` | [`app/(dashboard)/inventory/minmax-replen/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/minmax-replen/page.tsx) | Enterprise UI View for `/inventory/minmax-replen` |
| `/inventory/mobile-pick` | [`app/(dashboard)/inventory/mobile-pick/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/mobile-pick/page.tsx) | Enterprise UI View for `/inventory/mobile-pick` |
| `/inventory/movement-history` | [`app/(dashboard)/inventory/movement-history/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/movement-history/page.tsx) | Enterprise UI View for `/inventory/movement-history` |
| `/inventory/packaging-gs1` | [`app/(dashboard)/inventory/packaging-gs1/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/packaging-gs1/page.tsx) | Enterprise UI View for `/inventory/packaging-gs1` |
| `/inventory` | [`app/(dashboard)/inventory/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/page.tsx) | Enterprise UI View for `/inventory` |
| `/inventory/pick-waves` | [`app/(dashboard)/inventory/pick-waves/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/pick-waves/page.tsx) | Enterprise UI View for `/inventory/pick-waves` |
| `/inventory/products/[id]` | [`app/(dashboard)/inventory/products/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/products/[id]/page.tsx) | Enterprise UI View for `/inventory/products/[id]` |
| `/inventory/products` | [`app/(dashboard)/inventory/products/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/products/page.tsx) | Enterprise UI View for `/inventory/products` |
| `/inventory/qa-inspections` | [`app/(dashboard)/inventory/qa-inspections/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/qa-inspections/page.tsx) | Enterprise UI View for `/inventory/qa-inspections` |
| `/inventory/qa-templates` | [`app/(dashboard)/inventory/qa-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/qa-templates/page.tsx) | Enterprise UI View for `/inventory/qa-templates` |
| `/inventory/quality-compliance` | [`app/(dashboard)/inventory/quality-compliance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/quality-compliance/page.tsx) | Enterprise UI View for `/inventory/quality-compliance` |
| `/inventory/reorder-rules` | [`app/(dashboard)/inventory/reorder-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/reorder-rules/page.tsx) | Enterprise UI View for `/inventory/reorder-rules` |
| `/inventory/rfid` | [`app/(dashboard)/inventory/rfid/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/rfid/page.tsx) | Enterprise UI View for `/inventory/rfid` |
| `/inventory/rma` | [`app/(dashboard)/inventory/rma/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/rma/page.tsx) | Enterprise UI View for `/inventory/rma` |
| `/inventory/rtv` | [`app/(dashboard)/inventory/rtv/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/rtv/page.tsx) | Enterprise UI View for `/inventory/rtv` |
| `/inventory/serial-numbers` | [`app/(dashboard)/inventory/serial-numbers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/serial-numbers/page.tsx) | Enterprise UI View for `/inventory/serial-numbers` |
| `/inventory/settings` | [`app/(dashboard)/inventory/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/settings/page.tsx) | Enterprise UI View for `/inventory/settings` |
| `/inventory/shipment-tracking` | [`app/(dashboard)/inventory/shipment-tracking/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/shipment-tracking/page.tsx) | Enterprise UI View for `/inventory/shipment-tracking` |
| `/inventory/slotting` | [`app/(dashboard)/inventory/slotting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/slotting/page.tsx) | Enterprise UI View for `/inventory/slotting` |
| `/inventory/stock-entries` | [`app/(dashboard)/inventory/stock-entries/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-entries/page.tsx) | Enterprise UI View for `/inventory/stock-entries` |
| `/inventory/stock-ledger` | [`app/(dashboard)/inventory/stock-ledger/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-ledger/page.tsx) | Enterprise UI View for `/inventory/stock-ledger` |
| `/inventory/stock-levels` | [`app/(dashboard)/inventory/stock-levels/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-levels/page.tsx) | Enterprise UI View for `/inventory/stock-levels` |
| `/inventory/stock-reservations` | [`app/(dashboard)/inventory/stock-reservations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-reservations/page.tsx) | Enterprise UI View for `/inventory/stock-reservations` |
| `/inventory/stock-takes` | [`app/(dashboard)/inventory/stock-takes/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-takes/page.tsx) | Enterprise UI View for `/inventory/stock-takes` |
| `/inventory/stock-valuation` | [`app/(dashboard)/inventory/stock-valuation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/stock-valuation/page.tsx) | Enterprise UI View for `/inventory/stock-valuation` |
| `/inventory/subinventory` | [`app/(dashboard)/inventory/subinventory/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/subinventory/page.tsx) | Enterprise UI View for `/inventory/subinventory` |
| `/inventory/supplier-quality` | [`app/(dashboard)/inventory/supplier-quality/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/supplier-quality/page.tsx) | Enterprise UI View for `/inventory/supplier-quality` |
| `/inventory/traceability` | [`app/(dashboard)/inventory/traceability/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/traceability/page.tsx) | Enterprise UI View for `/inventory/traceability` |
| `/inventory/transfer-approvals` | [`app/(dashboard)/inventory/transfer-approvals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/transfer-approvals/page.tsx) | Enterprise UI View for `/inventory/transfer-approvals` |
| `/inventory/transfer-orders` | [`app/(dashboard)/inventory/transfer-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/transfer-orders/page.tsx) | Enterprise UI View for `/inventory/transfer-orders` |
| `/inventory/valuations` | [`app/(dashboard)/inventory/valuations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/valuations/page.tsx) | Enterprise UI View for `/inventory/valuations` |
| `/inventory/velocity-abc-xyz` | [`app/(dashboard)/inventory/velocity-abc-xyz/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/velocity-abc-xyz/page.tsx) | Enterprise UI View for `/inventory/velocity-abc-xyz` |
| `/inventory/vmi` | [`app/(dashboard)/inventory/vmi/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/vmi/page.tsx) | Enterprise UI View for `/inventory/vmi` |
| `/inventory/warehouse-kpis` | [`app/(dashboard)/inventory/warehouse-kpis/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/warehouse-kpis/page.tsx) | Enterprise UI View for `/inventory/warehouse-kpis` |
| `/inventory/warehouse-ops` | [`app/(dashboard)/inventory/warehouse-ops/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/warehouse-ops/page.tsx) | Enterprise UI View for `/inventory/warehouse-ops` |
| `/inventory/warehouses` | [`app/(dashboard)/inventory/warehouses/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/warehouses/page.tsx) | Enterprise UI View for `/inventory/warehouses` |
| `/inventory/wave-planning` | [`app/(dashboard)/inventory/wave-planning/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/wave-planning/page.tsx) | Enterprise UI View for `/inventory/wave-planning` |
| `/inventory/yard-management` | [`app/(dashboard)/inventory/yard-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/inventory/yard-management/page.tsx) | Enterprise UI View for `/inventory/yard-management` |

### <a id="module-supply-chain"></a> 📦 Domain Module: `supply-chain` (31 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/supply-chain/advanced-analytics` | [`app/(dashboard)/supply-chain/advanced-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/advanced-analytics/page.tsx) | Enterprise UI View for `/supply-chain/advanced-analytics` |
| `/supply-chain/analytics` | [`app/(dashboard)/supply-chain/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/analytics/page.tsx) | Enterprise UI View for `/supply-chain/analytics` |
| `/supply-chain/budgets` | [`app/(dashboard)/supply-chain/budgets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/budgets/page.tsx) | Enterprise UI View for `/supply-chain/budgets` |
| `/supply-chain/carrier-contracts` | [`app/(dashboard)/supply-chain/carrier-contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/carrier-contracts/page.tsx) | Enterprise UI View for `/supply-chain/carrier-contracts` |
| `/supply-chain/carriers` | [`app/(dashboard)/supply-chain/carriers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/carriers/page.tsx) | Enterprise UI View for `/supply-chain/carriers` |
| `/supply-chain/containers` | [`app/(dashboard)/supply-chain/containers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/containers/page.tsx) | Enterprise UI View for `/supply-chain/containers` |
| `/supply-chain/contracts` | [`app/(dashboard)/supply-chain/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/contracts/page.tsx) | Enterprise UI View for `/supply-chain/contracts` |
| `/supply-chain/control-hub` | [`app/(dashboard)/supply-chain/control-hub/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/control-hub/page.tsx) | Enterprise UI View for `/supply-chain/control-hub` |
| `/supply-chain/control-tower` | [`app/(dashboard)/supply-chain/control-tower/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/control-tower/page.tsx) | Enterprise UI View for `/supply-chain/control-tower` |
| `/supply-chain/customs` | [`app/(dashboard)/supply-chain/customs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/customs/page.tsx) | Enterprise UI View for `/supply-chain/customs` |
| `/supply-chain/demand-forecast` | [`app/(dashboard)/supply-chain/demand-forecast/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/demand-forecast/page.tsx) | Enterprise UI View for `/supply-chain/demand-forecast` |
| `/supply-chain/digital-twin` | [`app/(dashboard)/supply-chain/digital-twin/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/digital-twin/page.tsx) | Enterprise UI View for `/supply-chain/digital-twin` |
| `/supply-chain/fleet` | [`app/(dashboard)/supply-chain/fleet/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/fleet/page.tsx) | Enterprise UI View for `/supply-chain/fleet` |
| `/supply-chain/global-trade` | [`app/(dashboard)/supply-chain/global-trade/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/global-trade/page.tsx) | Enterprise UI View for `/supply-chain/global-trade` |
| `/supply-chain/lane-rates` | [`app/(dashboard)/supply-chain/lane-rates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/lane-rates/page.tsx) | Enterprise UI View for `/supply-chain/lane-rates` |
| `/supply-chain/logistics` | [`app/(dashboard)/supply-chain/logistics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/logistics/page.tsx) | Enterprise UI View for `/supply-chain/logistics` |
| `/supply-chain/meio` | [`app/(dashboard)/supply-chain/meio/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/meio/page.tsx) | Enterprise UI View for `/supply-chain/meio` |
| `/supply-chain/operations` | [`app/(dashboard)/supply-chain/operations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/operations/page.tsx) | Enterprise UI View for `/supply-chain/operations` |
| `/supply-chain` | [`app/(dashboard)/supply-chain/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/page.tsx) | Enterprise UI View for `/supply-chain` |
| `/supply-chain/routes` | [`app/(dashboard)/supply-chain/routes/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/routes/page.tsx) | Enterprise UI View for `/supply-chain/routes` |
| `/supply-chain/settings` | [`app/(dashboard)/supply-chain/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/settings/page.tsx) | Enterprise UI View for `/supply-chain/settings` |
| `/supply-chain/shipments/[id]` | [`app/(dashboard)/supply-chain/shipments/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/shipments/[id]/page.tsx) | Enterprise UI View for `/supply-chain/shipments/[id]` |
| `/supply-chain/shipments` | [`app/(dashboard)/supply-chain/shipments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/shipments/page.tsx) | Enterprise UI View for `/supply-chain/shipments` |
| `/supply-chain/supplier-assessments` | [`app/(dashboard)/supply-chain/supplier-assessments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supplier-assessments/page.tsx) | Enterprise UI View for `/supply-chain/supplier-assessments` |
| `/supply-chain/supplier-performance` | [`app/(dashboard)/supply-chain/supplier-performance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supplier-performance/page.tsx) | Enterprise UI View for `/supply-chain/supplier-performance` |
| `/supply-chain/supplier-portal` | [`app/(dashboard)/supply-chain/supplier-portal/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supplier-portal/page.tsx) | Enterprise UI View for `/supply-chain/supplier-portal` |
| `/supply-chain/supplier-risk` | [`app/(dashboard)/supply-chain/supplier-risk/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supplier-risk/page.tsx) | Enterprise UI View for `/supply-chain/supplier-risk` |
| `/supply-chain/supply-chain-finance` | [`app/(dashboard)/supply-chain/supply-chain-finance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supply-chain-finance/page.tsx) | Enterprise UI View for `/supply-chain/supply-chain-finance` |
| `/supply-chain/supply-planning` | [`app/(dashboard)/supply-chain/supply-planning/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/supply-planning/page.tsx) | Enterprise UI View for `/supply-chain/supply-planning` |
| `/supply-chain/sustainability` | [`app/(dashboard)/supply-chain/sustainability/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/sustainability/page.tsx) | Enterprise UI View for `/supply-chain/sustainability` |
| `/supply-chain/tracking` | [`app/(dashboard)/supply-chain/tracking/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/supply-chain/tracking/page.tsx) | Enterprise UI View for `/supply-chain/tracking` |

### <a id="module-hr"></a> 📦 Domain Module: `hr` (28 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/hr/advanced/analytics` | [`app/(dashboard)/hr/advanced/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/analytics/page.tsx) | Enterprise UI View for `/hr/advanced/analytics` |
| `/hr/advanced/appraisals` | [`app/(dashboard)/hr/advanced/appraisals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/appraisals/page.tsx) | Enterprise UI View for `/hr/advanced/appraisals` |
| `/hr/advanced/assets` | [`app/(dashboard)/hr/advanced/assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/assets/page.tsx) | Enterprise UI View for `/hr/advanced/assets` |
| `/hr/advanced/attendance` | [`app/(dashboard)/hr/advanced/attendance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/attendance/page.tsx) | Enterprise UI View for `/hr/advanced/attendance` |
| `/hr/advanced/benefits` | [`app/(dashboard)/hr/advanced/benefits/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/benefits/page.tsx) | Enterprise UI View for `/hr/advanced/benefits` |
| `/hr/advanced/compliance` | [`app/(dashboard)/hr/advanced/compliance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/compliance/page.tsx) | Enterprise UI View for `/hr/advanced/compliance` |
| `/hr/advanced/documents` | [`app/(dashboard)/hr/advanced/documents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/documents/page.tsx) | Enterprise UI View for `/hr/advanced/documents` |
| `/hr/advanced/feedback` | [`app/(dashboard)/hr/advanced/feedback/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/feedback/page.tsx) | Enterprise UI View for `/hr/advanced/feedback` |
| `/hr/advanced/goals` | [`app/(dashboard)/hr/advanced/goals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/goals/page.tsx) | Enterprise UI View for `/hr/advanced/goals` |
| `/hr/advanced/holidays` | [`app/(dashboard)/hr/advanced/holidays/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/holidays/page.tsx) | Enterprise UI View for `/hr/advanced/holidays` |
| `/hr/advanced/leaves` | [`app/(dashboard)/hr/advanced/leaves/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/leaves/page.tsx) | Enterprise UI View for `/hr/advanced/leaves` |
| `/hr/advanced/offboarding` | [`app/(dashboard)/hr/advanced/offboarding/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/offboarding/page.tsx) | Enterprise UI View for `/hr/advanced/offboarding` |
| `/hr/advanced/onboarding` | [`app/(dashboard)/hr/advanced/onboarding/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/onboarding/page.tsx) | Enterprise UI View for `/hr/advanced/onboarding` |
| `/hr/advanced/operations-service` | [`app/(dashboard)/hr/advanced/operations-service/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/operations-service/page.tsx) | Enterprise UI View for `/hr/advanced/operations-service` |
| `/hr/advanced` | [`app/(dashboard)/hr/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/page.tsx) | Enterprise UI View for `/hr/advanced` |
| `/hr/advanced/payroll` | [`app/(dashboard)/hr/advanced/payroll/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/payroll/page.tsx) | Enterprise UI View for `/hr/advanced/payroll` |
| `/hr/advanced/positions` | [`app/(dashboard)/hr/advanced/positions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/positions/page.tsx) | Enterprise UI View for `/hr/advanced/positions` |
| `/hr/advanced/recruitment` | [`app/(dashboard)/hr/advanced/recruitment/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/recruitment/page.tsx) | Enterprise UI View for `/hr/advanced/recruitment` |
| `/hr/advanced/self-service` | [`app/(dashboard)/hr/advanced/self-service/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/self-service/page.tsx) | Enterprise UI View for `/hr/advanced/self-service` |
| `/hr/advanced/shifts` | [`app/(dashboard)/hr/advanced/shifts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/shifts/page.tsx) | Enterprise UI View for `/hr/advanced/shifts` |
| `/hr/advanced/skills` | [`app/(dashboard)/hr/advanced/skills/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/skills/page.tsx) | Enterprise UI View for `/hr/advanced/skills` |
| `/hr/advanced/succession` | [`app/(dashboard)/hr/advanced/succession/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/succession/page.tsx) | Enterprise UI View for `/hr/advanced/succession` |
| `/hr/advanced/surveys` | [`app/(dashboard)/hr/advanced/surveys/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/surveys/page.tsx) | Enterprise UI View for `/hr/advanced/surveys` |
| `/hr/advanced/tickets` | [`app/(dashboard)/hr/advanced/tickets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/tickets/page.tsx) | Enterprise UI View for `/hr/advanced/tickets` |
| `/hr/advanced/trainings` | [`app/(dashboard)/hr/advanced/trainings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/advanced/trainings/page.tsx) | Enterprise UI View for `/hr/advanced/trainings` |
| `/hr/employees/[id]` | [`app/(dashboard)/hr/employees/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/employees/[id]/page.tsx) | Enterprise UI View for `/hr/employees/[id]` |
| `/hr` | [`app/(dashboard)/hr/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/page.tsx) | Enterprise UI View for `/hr` |
| `/hr/settings` | [`app/(dashboard)/hr/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/hr/settings/page.tsx) | Enterprise UI View for `/hr/settings` |

### <a id="module-procurement"></a> 📦 Domain Module: `procurement` (26 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/procurement/analytics` | [`app/(dashboard)/procurement/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/analytics/page.tsx) | Enterprise UI View for `/procurement/analytics` |
| `/procurement/approvals` | [`app/(dashboard)/procurement/approvals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/approvals/page.tsx) | Enterprise UI View for `/procurement/approvals` |
| `/procurement/blanket-agreements` | [`app/(dashboard)/procurement/blanket-agreements/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/blanket-agreements/page.tsx) | Enterprise UI View for `/procurement/blanket-agreements` |
| `/procurement/contracts` | [`app/(dashboard)/procurement/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/contracts/page.tsx) | Enterprise UI View for `/procurement/contracts` |
| `/procurement/debit-notes` | [`app/(dashboard)/procurement/debit-notes/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/debit-notes/page.tsx) | Enterprise UI View for `/procurement/debit-notes` |
| `/procurement/intelligence` | [`app/(dashboard)/procurement/intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/intelligence/page.tsx) | Enterprise UI View for `/procurement/intelligence` |
| `/procurement/ncr-car` | [`app/(dashboard)/procurement/ncr-car/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/ncr-car/page.tsx) | Enterprise UI View for `/procurement/ncr-car` |
| `/procurement/onboarding` | [`app/(dashboard)/procurement/onboarding/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/onboarding/page.tsx) | Enterprise UI View for `/procurement/onboarding` |
| `/procurement` | [`app/(dashboard)/procurement/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/page.tsx) | Enterprise UI View for `/procurement` |
| `/procurement/payment-schedules` | [`app/(dashboard)/procurement/payment-schedules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/payment-schedules/page.tsx) | Enterprise UI View for `/procurement/payment-schedules` |
| `/procurement/portal` | [`app/(dashboard)/procurement/portal/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/portal/page.tsx) | Enterprise UI View for `/procurement/portal` |
| `/procurement/purchase-orders/[id]` | [`app/(dashboard)/procurement/purchase-orders/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/purchase-orders/[id]/page.tsx) | Enterprise UI View for `/procurement/purchase-orders/[id]` |
| `/procurement/purchase-orders` | [`app/(dashboard)/procurement/purchase-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/purchase-orders/page.tsx) | Enterprise UI View for `/procurement/purchase-orders` |
| `/procurement/purchase-receipts` | [`app/(dashboard)/procurement/purchase-receipts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/purchase-receipts/page.tsx) | Enterprise UI View for `/procurement/purchase-receipts` |
| `/procurement/requisitions` | [`app/(dashboard)/procurement/requisitions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/requisitions/page.tsx) | Enterprise UI View for `/procurement/requisitions` |
| `/procurement/returns` | [`app/(dashboard)/procurement/returns/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/returns/page.tsx) | Enterprise UI View for `/procurement/returns` |
| `/procurement/rfq-auctions` | [`app/(dashboard)/procurement/rfq-auctions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/rfq-auctions/page.tsx) | Enterprise UI View for `/procurement/rfq-auctions` |
| `/procurement/rfqs` | [`app/(dashboard)/procurement/rfqs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/rfqs/page.tsx) | Enterprise UI View for `/procurement/rfqs` |
| `/procurement/settings` | [`app/(dashboard)/procurement/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/settings/page.tsx) | Enterprise UI View for `/procurement/settings` |
| `/procurement/sourcing` | [`app/(dashboard)/procurement/sourcing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/sourcing/page.tsx) | Enterprise UI View for `/procurement/sourcing` |
| `/procurement/subcontracting` | [`app/(dashboard)/procurement/subcontracting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/subcontracting/page.tsx) | Enterprise UI View for `/procurement/subcontracting` |
| `/procurement/supplier-quotations` | [`app/(dashboard)/procurement/supplier-quotations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/supplier-quotations/page.tsx) | Enterprise UI View for `/procurement/supplier-quotations` |
| `/procurement/supplier-scorecards` | [`app/(dashboard)/procurement/supplier-scorecards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/supplier-scorecards/page.tsx) | Enterprise UI View for `/procurement/supplier-scorecards` |
| `/procurement/vendor-rma` | [`app/(dashboard)/procurement/vendor-rma/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/vendor-rma/page.tsx) | Enterprise UI View for `/procurement/vendor-rma` |
| `/procurement/vendors/[id]/scorecard` | [`app/(dashboard)/procurement/vendors/[id]/scorecard/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/vendors/[id]/scorecard/page.tsx) | Enterprise UI View for `/procurement/vendors/[id]/scorecard` |
| `/procurement/vendors` | [`app/(dashboard)/procurement/vendors/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/procurement/vendors/page.tsx) | Enterprise UI View for `/procurement/vendors` |

### <a id="module-projects"></a> 📦 Domain Module: `projects` (26 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/projects/advanced-evm` | [`app/(dashboard)/projects/advanced-evm/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/advanced-evm/page.tsx) | Enterprise UI View for `/projects/advanced-evm` |
| `/projects/agile` | [`app/(dashboard)/projects/agile/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/agile/page.tsx) | Enterprise UI View for `/projects/agile` |
| `/projects/billing-rates` | [`app/(dashboard)/projects/billing-rates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/billing-rates/page.tsx) | Enterprise UI View for `/projects/billing-rates` |
| `/projects/budgets` | [`app/(dashboard)/projects/budgets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/budgets/page.tsx) | Enterprise UI View for `/projects/budgets` |
| `/projects/capex` | [`app/(dashboard)/projects/capex/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/capex/page.tsx) | Enterprise UI View for `/projects/capex` |
| `/projects/claims` | [`app/(dashboard)/projects/claims/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/claims/page.tsx) | Enterprise UI View for `/projects/claims` |
| `/projects/client-portal` | [`app/(dashboard)/projects/client-portal/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/client-portal/page.tsx) | Enterprise UI View for `/projects/client-portal` |
| `/projects/collaboration` | [`app/(dashboard)/projects/collaboration/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/collaboration/page.tsx) | Enterprise UI View for `/projects/collaboration` |
| `/projects/documents` | [`app/(dashboard)/projects/documents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/documents/page.tsx) | Enterprise UI View for `/projects/documents` |
| `/projects/health` | [`app/(dashboard)/projects/health/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/health/page.tsx) | Enterprise UI View for `/projects/health` |
| `/projects/milestone-templates` | [`app/(dashboard)/projects/milestone-templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/milestone-templates/page.tsx) | Enterprise UI View for `/projects/milestone-templates` |
| `/projects` | [`app/(dashboard)/projects/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/page.tsx) | Enterprise UI View for `/projects` |
| `/projects/pmo` | [`app/(dashboard)/projects/pmo/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/pmo/page.tsx) | Enterprise UI View for `/projects/pmo` |
| `/projects/portfolios` | [`app/(dashboard)/projects/portfolios/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/portfolios/page.tsx) | Enterprise UI View for `/projects/portfolios` |
| `/projects/ppm-hub` | [`app/(dashboard)/projects/ppm-hub/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/ppm-hub/page.tsx) | Enterprise UI View for `/projects/ppm-hub` |
| `/projects/programs` | [`app/(dashboard)/projects/programs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/programs/page.tsx) | Enterprise UI View for `/projects/programs` |
| `/projects/reports` | [`app/(dashboard)/projects/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/reports/page.tsx) | Enterprise UI View for `/projects/reports` |
| `/projects/resource-skills` | [`app/(dashboard)/projects/resource-skills/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/resource-skills/page.tsx) | Enterprise UI View for `/projects/resource-skills` |
| `/projects/resources` | [`app/(dashboard)/projects/resources/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/resources/page.tsx) | Enterprise UI View for `/projects/resources` |
| `/projects/revenue-recognition` | [`app/(dashboard)/projects/revenue-recognition/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/revenue-recognition/page.tsx) | Enterprise UI View for `/projects/revenue-recognition` |
| `/projects/risks` | [`app/(dashboard)/projects/risks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/risks/page.tsx) | Enterprise UI View for `/projects/risks` |
| `/projects/settings` | [`app/(dashboard)/projects/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/settings/page.tsx) | Enterprise UI View for `/projects/settings` |
| `/projects/templates` | [`app/(dashboard)/projects/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/templates/page.tsx) | Enterprise UI View for `/projects/templates` |
| `/projects/timesheets` | [`app/(dashboard)/projects/timesheets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/timesheets/page.tsx) | Enterprise UI View for `/projects/timesheets` |
| `/projects/wip-reports` | [`app/(dashboard)/projects/wip-reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/wip-reports/page.tsx) | Enterprise UI View for `/projects/wip-reports` |
| `/projects/workloads` | [`app/(dashboard)/projects/workloads/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/projects/workloads/page.tsx) | Enterprise UI View for `/projects/workloads` |

### <a id="module-manufacturing"></a> 📦 Domain Module: `manufacturing` (22 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/manufacturing/advanced-quality` | [`app/(dashboard)/manufacturing/advanced-quality/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/advanced-quality/page.tsx) | Enterprise UI View for `/manufacturing/advanced-quality` |
| `/manufacturing/aps` | [`app/(dashboard)/manufacturing/aps/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/aps/page.tsx) | Enterprise UI View for `/manufacturing/aps` |
| `/manufacturing/boms` | [`app/(dashboard)/manufacturing/boms/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/boms/page.tsx) | Enterprise UI View for `/manufacturing/boms` |
| `/manufacturing/configurator` | [`app/(dashboard)/manufacturing/configurator/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/configurator/page.tsx) | Enterprise UI View for `/manufacturing/configurator` |
| `/manufacturing/contract-mfg` | [`app/(dashboard)/manufacturing/contract-mfg/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/contract-mfg/page.tsx) | Enterprise UI View for `/manufacturing/contract-mfg` |
| `/manufacturing/ddmrp` | [`app/(dashboard)/manufacturing/ddmrp/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/ddmrp/page.tsx) | Enterprise UI View for `/manufacturing/ddmrp` |
| `/manufacturing/diagnostics` | [`app/(dashboard)/manufacturing/diagnostics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/diagnostics/page.tsx) | Enterprise UI View for `/manufacturing/diagnostics` |
| `/manufacturing/energy` | [`app/(dashboard)/manufacturing/energy/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/energy/page.tsx) | Enterprise UI View for `/manufacturing/energy` |
| `/manufacturing/industry-hub` | [`app/(dashboard)/manufacturing/industry-hub/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/industry-hub/page.tsx) | Enterprise UI View for `/manufacturing/industry-hub` |
| `/manufacturing/lean` | [`app/(dashboard)/manufacturing/lean/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/lean/page.tsx) | Enterprise UI View for `/manufacturing/lean` |
| `/manufacturing/mrp` | [`app/(dashboard)/manufacturing/mrp/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/mrp/page.tsx) | Enterprise UI View for `/manufacturing/mrp` |
| `/manufacturing` | [`app/(dashboard)/manufacturing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/page.tsx) | Enterprise UI View for `/manufacturing` |
| `/manufacturing/quality-checks` | [`app/(dashboard)/manufacturing/quality-checks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/quality-checks/page.tsx) | Enterprise UI View for `/manufacturing/quality-checks` |
| `/manufacturing/quality` | [`app/(dashboard)/manufacturing/quality/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/quality/page.tsx) | Enterprise UI View for `/manufacturing/quality` |
| `/manufacturing/routing` | [`app/(dashboard)/manufacturing/routing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/routing/page.tsx) | Enterprise UI View for `/manufacturing/routing` |
| `/manufacturing/scheduling` | [`app/(dashboard)/manufacturing/scheduling/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/scheduling/page.tsx) | Enterprise UI View for `/manufacturing/scheduling` |
| `/manufacturing/scrap` | [`app/(dashboard)/manufacturing/scrap/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/scrap/page.tsx) | Enterprise UI View for `/manufacturing/scrap` |
| `/manufacturing/settings` | [`app/(dashboard)/manufacturing/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/settings/page.tsx) | Enterprise UI View for `/manufacturing/settings` |
| `/manufacturing/shop-floor` | [`app/(dashboard)/manufacturing/shop-floor/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/shop-floor/page.tsx) | Enterprise UI View for `/manufacturing/shop-floor` |
| `/manufacturing/tooling` | [`app/(dashboard)/manufacturing/tooling/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/tooling/page.tsx) | Enterprise UI View for `/manufacturing/tooling` |
| `/manufacturing/tpm` | [`app/(dashboard)/manufacturing/tpm/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/tpm/page.tsx) | Enterprise UI View for `/manufacturing/tpm` |
| `/manufacturing/work-centers` | [`app/(dashboard)/manufacturing/work-centers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/manufacturing/work-centers/page.tsx) | Enterprise UI View for `/manufacturing/work-centers` |

### <a id="module-pos"></a> 📦 Domain Module: `pos` (21 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/pos/advanced` | [`app/(dashboard)/pos/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/advanced/page.tsx) | Enterprise UI View for `/pos/advanced` |
| `/pos/customers` | [`app/(dashboard)/pos/customers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/customers/page.tsx) | Enterprise UI View for `/pos/customers` |
| `/pos/designer` | [`app/(dashboard)/pos/designer/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/designer/page.tsx) | Enterprise UI View for `/pos/designer` |
| `/pos/diagnostics` | [`app/(dashboard)/pos/diagnostics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/diagnostics/page.tsx) | Enterprise UI View for `/pos/diagnostics` |
| `/pos/discount-rules` | [`app/(dashboard)/pos/discount-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/discount-rules/page.tsx) | Enterprise UI View for `/pos/discount-rules` |
| `/pos/gift-cards` | [`app/(dashboard)/pos/gift-cards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/gift-cards/page.tsx) | Enterprise UI View for `/pos/gift-cards` |
| `/pos/held-orders` | [`app/(dashboard)/pos/held-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/held-orders/page.tsx) | Enterprise UI View for `/pos/held-orders` |
| `/pos/kitchen-display` | [`app/(dashboard)/pos/kitchen-display/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/kitchen-display/page.tsx) | Enterprise UI View for `/pos/kitchen-display` |
| `/pos/layaway` | [`app/(dashboard)/pos/layaway/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/layaway/page.tsx) | Enterprise UI View for `/pos/layaway` |
| `/pos/order-types` | [`app/(dashboard)/pos/order-types/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/order-types/page.tsx) | Enterprise UI View for `/pos/order-types` |
| `/pos/orders` | [`app/(dashboard)/pos/orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/orders/page.tsx) | Enterprise UI View for `/pos/orders` |
| `/pos` | [`app/(dashboard)/pos/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/page.tsx) | Enterprise UI View for `/pos` |
| `/pos/payment-methods` | [`app/(dashboard)/pos/payment-methods/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/payment-methods/page.tsx) | Enterprise UI View for `/pos/payment-methods` |
| `/pos/promotions` | [`app/(dashboard)/pos/promotions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/promotions/page.tsx) | Enterprise UI View for `/pos/promotions` |
| `/pos/refunds` | [`app/(dashboard)/pos/refunds/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/refunds/page.tsx) | Enterprise UI View for `/pos/refunds` |
| `/pos/registers` | [`app/(dashboard)/pos/registers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/registers/page.tsx) | Enterprise UI View for `/pos/registers` |
| `/pos/reports` | [`app/(dashboard)/pos/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/reports/page.tsx) | Enterprise UI View for `/pos/reports` |
| `/pos/settings` | [`app/(dashboard)/pos/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/settings/page.tsx) | Enterprise UI View for `/pos/settings` |
| `/pos/shifts` | [`app/(dashboard)/pos/shifts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/shifts/page.tsx) | Enterprise UI View for `/pos/shifts` |
| `/pos/split-payments` | [`app/(dashboard)/pos/split-payments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/split-payments/page.tsx) | Enterprise UI View for `/pos/split-payments` |
| `/pos/tax-rules` | [`app/(dashboard)/pos/tax-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pos/tax-rules/page.tsx) | Enterprise UI View for `/pos/tax-rules` |

### <a id="module-sales"></a> 📦 Domain Module: `sales` (20 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/sales/analytics` | [`app/(dashboard)/sales/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/analytics/page.tsx) | Enterprise UI View for `/sales/analytics` |
| `/sales/commissions` | [`app/(dashboard)/sales/commissions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/commissions/page.tsx) | Enterprise UI View for `/sales/commissions` |
| `/sales/contracts` | [`app/(dashboard)/sales/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/contracts/page.tsx) | Enterprise UI View for `/sales/contracts` |
| `/sales/cpq` | [`app/(dashboard)/sales/cpq/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/cpq/page.tsx) | Enterprise UI View for `/sales/cpq` |
| `/sales/customer-success` | [`app/(dashboard)/sales/customer-success/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/customer-success/page.tsx) | Enterprise UI View for `/sales/customer-success` |
| `/sales/delivery-notes` | [`app/(dashboard)/sales/delivery-notes/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/delivery-notes/page.tsx) | Enterprise UI View for `/sales/delivery-notes` |
| `/sales/documents` | [`app/(dashboard)/sales/documents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/documents/page.tsx) | Enterprise UI View for `/sales/documents` |
| `/sales/forecasting` | [`app/(dashboard)/sales/forecasting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/forecasting/page.tsx) | Enterprise UI View for `/sales/forecasting` |
| `/sales/fulfillment` | [`app/(dashboard)/sales/fulfillment/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/fulfillment/page.tsx) | Enterprise UI View for `/sales/fulfillment` |
| `/sales/gamification` | [`app/(dashboard)/sales/gamification/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/gamification/page.tsx) | Enterprise UI View for `/sales/gamification` |
| `/sales/intelligence` | [`app/(dashboard)/sales/intelligence/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/intelligence/page.tsx) | Enterprise UI View for `/sales/intelligence` |
| `/sales/orders` | [`app/(dashboard)/sales/orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/orders/page.tsx) | Enterprise UI View for `/sales/orders` |
| `/sales` | [`app/(dashboard)/sales/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/page.tsx) | Enterprise UI View for `/sales` |
| `/sales/partners` | [`app/(dashboard)/sales/partners/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/partners/page.tsx) | Enterprise UI View for `/sales/partners` |
| `/sales/playbooks` | [`app/(dashboard)/sales/playbooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/playbooks/page.tsx) | Enterprise UI View for `/sales/playbooks` |
| `/sales/pricing` | [`app/(dashboard)/sales/pricing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/pricing/page.tsx) | Enterprise UI View for `/sales/pricing` |
| `/sales/promotions` | [`app/(dashboard)/sales/promotions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/promotions/page.tsx) | Enterprise UI View for `/sales/promotions` |
| `/sales/quotations` | [`app/(dashboard)/sales/quotations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/quotations/page.tsx) | Enterprise UI View for `/sales/quotations` |
| `/sales/returns` | [`app/(dashboard)/sales/returns/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/returns/page.tsx) | Enterprise UI View for `/sales/returns` |
| `/sales/settings` | [`app/(dashboard)/sales/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/sales/settings/page.tsx) | Enterprise UI View for `/sales/settings` |

### <a id="module-analytics"></a> 📦 Domain Module: `analytics` (19 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/analytics/advanced` | [`app/(dashboard)/analytics/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/advanced/page.tsx) | Enterprise UI View for `/analytics/advanced` |
| `/analytics/anomalies` | [`app/(dashboard)/analytics/anomalies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/anomalies/page.tsx) | Enterprise UI View for `/analytics/anomalies` |
| `/analytics/builder` | [`app/(dashboard)/analytics/builder/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/builder/page.tsx) | Enterprise UI View for `/analytics/builder` |
| `/analytics/catalog` | [`app/(dashboard)/analytics/catalog/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/catalog/page.tsx) | Enterprise UI View for `/analytics/catalog` |
| `/analytics/custom-dashboards` | [`app/(dashboard)/analytics/custom-dashboards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/custom-dashboards/page.tsx) | Enterprise UI View for `/analytics/custom-dashboards` |
| `/analytics/dashboards` | [`app/(dashboard)/analytics/dashboards/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/dashboards/page.tsx) | Enterprise UI View for `/analytics/dashboards` |
| `/analytics/exports` | [`app/(dashboard)/analytics/exports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/exports/page.tsx) | Enterprise UI View for `/analytics/exports` |
| `/analytics/funnels` | [`app/(dashboard)/analytics/funnels/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/funnels/page.tsx) | Enterprise UI View for `/analytics/funnels` |
| `/analytics/insights` | [`app/(dashboard)/analytics/insights/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/insights/page.tsx) | Enterprise UI View for `/analytics/insights` |
| `/analytics/kpis` | [`app/(dashboard)/analytics/kpis/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/kpis/page.tsx) | Enterprise UI View for `/analytics/kpis` |
| `/analytics` | [`app/(dashboard)/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/page.tsx) | Enterprise UI View for `/analytics` |
| `/analytics/pipelines` | [`app/(dashboard)/analytics/pipelines/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/pipelines/page.tsx) | Enterprise UI View for `/analytics/pipelines` |
| `/analytics/pivot` | [`app/(dashboard)/analytics/pivot/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/pivot/page.tsx) | Enterprise UI View for `/analytics/pivot` |
| `/analytics/predictive` | [`app/(dashboard)/analytics/predictive/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/predictive/page.tsx) | Enterprise UI View for `/analytics/predictive` |
| `/analytics/query` | [`app/(dashboard)/analytics/query/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/query/page.tsx) | Enterprise UI View for `/analytics/query` |
| `/analytics/realtime` | [`app/(dashboard)/analytics/realtime/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/realtime/page.tsx) | Enterprise UI View for `/analytics/realtime` |
| `/analytics/reports` | [`app/(dashboard)/analytics/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/reports/page.tsx) | Enterprise UI View for `/analytics/reports` |
| `/analytics/settings` | [`app/(dashboard)/analytics/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/settings/page.tsx) | Enterprise UI View for `/analytics/settings` |
| `/analytics/trends` | [`app/(dashboard)/analytics/trends/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/analytics/trends/page.tsx) | Enterprise UI View for `/analytics/trends` |

### <a id="module-education"></a> 📦 Domain Module: `education` (18 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/education/attendance` | [`app/(dashboard)/education/attendance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/attendance/page.tsx) | Enterprise UI View for `/education/attendance` |
| `/education/courses/[id]` | [`app/(dashboard)/education/courses/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/courses/[id]/page.tsx) | Enterprise UI View for `/education/courses/[id]` |
| `/education/courses` | [`app/(dashboard)/education/courses/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/courses/page.tsx) | Enterprise UI View for `/education/courses` |
| `/education/enrollments` | [`app/(dashboard)/education/enrollments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/enrollments/page.tsx) | Enterprise UI View for `/education/enrollments` |
| `/education/exams` | [`app/(dashboard)/education/exams/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/exams/page.tsx) | Enterprise UI View for `/education/exams` |
| `/education/fees` | [`app/(dashboard)/education/fees/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/fees/page.tsx) | Enterprise UI View for `/education/fees` |
| `/education/fees/pay` | [`app/(dashboard)/education/fees/pay/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/fees/pay/page.tsx) | Enterprise UI View for `/education/fees/pay` |
| `/education/gradebooks` | [`app/(dashboard)/education/gradebooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/gradebooks/page.tsx) | Enterprise UI View for `/education/gradebooks` |
| `/education/grades` | [`app/(dashboard)/education/grades/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/grades/page.tsx) | Enterprise UI View for `/education/grades` |
| `/education/invoices` | [`app/(dashboard)/education/invoices/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/invoices/page.tsx) | Enterprise UI View for `/education/invoices` |
| `/education/library` | [`app/(dashboard)/education/library/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/library/page.tsx) | Enterprise UI View for `/education/library` |
| `/education` | [`app/(dashboard)/education/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/page.tsx) | Enterprise UI View for `/education` |
| `/education/parents` | [`app/(dashboard)/education/parents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/parents/page.tsx) | Enterprise UI View for `/education/parents` |
| `/education/reports` | [`app/(dashboard)/education/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/reports/page.tsx) | Enterprise UI View for `/education/reports` |
| `/education/settings` | [`app/(dashboard)/education/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/settings/page.tsx) | Enterprise UI View for `/education/settings` |
| `/education/students/[id]` | [`app/(dashboard)/education/students/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/students/[id]/page.tsx) | Enterprise UI View for `/education/students/[id]` |
| `/education/students` | [`app/(dashboard)/education/students/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/students/page.tsx) | Enterprise UI View for `/education/students` |
| `/education/timetable` | [`app/(dashboard)/education/timetable/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/education/timetable/page.tsx) | Enterprise UI View for `/education/timetable` |

### <a id="module-healthcare"></a> 📦 Domain Module: `healthcare` (17 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/healthcare/allergies` | [`app/(dashboard)/healthcare/allergies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/allergies/page.tsx) | Enterprise UI View for `/healthcare/allergies` |
| `/healthcare/appointments` | [`app/(dashboard)/healthcare/appointments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/appointments/page.tsx) | Enterprise UI View for `/healthcare/appointments` |
| `/healthcare/clinical` | [`app/(dashboard)/healthcare/clinical/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/clinical/page.tsx) | Enterprise UI View for `/healthcare/clinical` |
| `/healthcare/fhir` | [`app/(dashboard)/healthcare/fhir/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/fhir/page.tsx) | Enterprise UI View for `/healthcare/fhir` |
| `/healthcare/insurance` | [`app/(dashboard)/healthcare/insurance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/insurance/page.tsx) | Enterprise UI View for `/healthcare/insurance` |
| `/healthcare/lab-orders` | [`app/(dashboard)/healthcare/lab-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/lab-orders/page.tsx) | Enterprise UI View for `/healthcare/lab-orders` |
| `/healthcare/lab-results` | [`app/(dashboard)/healthcare/lab-results/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/lab-results/page.tsx) | Enterprise UI View for `/healthcare/lab-results` |
| `/healthcare/medical-records` | [`app/(dashboard)/healthcare/medical-records/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/medical-records/page.tsx) | Enterprise UI View for `/healthcare/medical-records` |
| `/healthcare` | [`app/(dashboard)/healthcare/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/page.tsx) | Enterprise UI View for `/healthcare` |
| `/healthcare/patients/[id]` | [`app/(dashboard)/healthcare/patients/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/patients/[id]/page.tsx) | Enterprise UI View for `/healthcare/patients/[id]` |
| `/healthcare/patients` | [`app/(dashboard)/healthcare/patients/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/patients/page.tsx) | Enterprise UI View for `/healthcare/patients` |
| `/healthcare/pharmacy` | [`app/(dashboard)/healthcare/pharmacy/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/pharmacy/page.tsx) | Enterprise UI View for `/healthcare/pharmacy` |
| `/healthcare/practitioners` | [`app/(dashboard)/healthcare/practitioners/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/practitioners/page.tsx) | Enterprise UI View for `/healthcare/practitioners` |
| `/healthcare/prescriptions` | [`app/(dashboard)/healthcare/prescriptions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/prescriptions/page.tsx) | Enterprise UI View for `/healthcare/prescriptions` |
| `/healthcare/reports` | [`app/(dashboard)/healthcare/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/reports/page.tsx) | Enterprise UI View for `/healthcare/reports` |
| `/healthcare/settings` | [`app/(dashboard)/healthcare/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/settings/page.tsx) | Enterprise UI View for `/healthcare/settings` |
| `/healthcare/vitals` | [`app/(dashboard)/healthcare/vitals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/healthcare/vitals/page.tsx) | Enterprise UI View for `/healthcare/vitals` |

### <a id="module-communication"></a> 📦 Domain Module: `communication` (16 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/communication/advanced` | [`app/(dashboard)/communication/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/advanced/page.tsx) | Enterprise UI View for `/communication/advanced` |
| `/communication/calendar` | [`app/(dashboard)/communication/calendar/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/calendar/page.tsx) | Enterprise UI View for `/communication/calendar` |
| `/communication/dm` | [`app/(dashboard)/communication/dm/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/dm/page.tsx) | Enterprise UI View for `/communication/dm` |
| `/communication/enterprise-search` | [`app/(dashboard)/communication/enterprise-search/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/enterprise-search/page.tsx) | Enterprise UI View for `/communication/enterprise-search` |
| `/communication/helpdesk` | [`app/(dashboard)/communication/helpdesk/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/helpdesk/page.tsx) | Enterprise UI View for `/communication/helpdesk` |
| `/communication/knowledge` | [`app/(dashboard)/communication/knowledge/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/knowledge/page.tsx) | Enterprise UI View for `/communication/knowledge` |
| `/communication/meetings` | [`app/(dashboard)/communication/meetings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/meetings/page.tsx) | Enterprise UI View for `/communication/meetings` |
| `/communication/notifications` | [`app/(dashboard)/communication/notifications/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/notifications/page.tsx) | Enterprise UI View for `/communication/notifications` |
| `/communication/omnichannel` | [`app/(dashboard)/communication/omnichannel/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/omnichannel/page.tsx) | Enterprise UI View for `/communication/omnichannel` |
| `/communication` | [`app/(dashboard)/communication/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/page.tsx) | Enterprise UI View for `/communication` |
| `/communication/real-time-collab` | [`app/(dashboard)/communication/real-time-collab/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/real-time-collab/page.tsx) | Enterprise UI View for `/communication/real-time-collab` |
| `/communication/spaces` | [`app/(dashboard)/communication/spaces/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/spaces/page.tsx) | Enterprise UI View for `/communication/spaces` |
| `/communication/survey` | [`app/(dashboard)/communication/survey/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/survey/page.tsx) | Enterprise UI View for `/communication/survey` |
| `/communication/unified-hub` | [`app/(dashboard)/communication/unified-hub/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/unified-hub/page.tsx) | Enterprise UI View for `/communication/unified-hub` |
| `/communication/video` | [`app/(dashboard)/communication/video/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/video/page.tsx) | Enterprise UI View for `/communication/video` |
| `/communication/voip` | [`app/(dashboard)/communication/voip/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/communication/voip/page.tsx) | Enterprise UI View for `/communication/voip` |

### <a id="module-app"></a> 📦 Domain Module: `app` (15 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/app/[module]/[slug]` | [`app/(dashboard)/app/[module]/[slug]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/app/[module]/[slug]/page.tsx) | Enterprise UI View for `/app/[module]/[slug]` |
| `/app/[module]/clinical` | [`app/(dashboard)/app/[module]/clinical/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/app/[module]/clinical/page.tsx) | Enterprise UI View for `/app/[module]/clinical` |
| `/app/[module]` | [`app/(dashboard)/app/[module]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/app/[module]/page.tsx) | Enterprise UI View for `/app/[module]` |
| `/src/app/education/report-cards` | [`src/app/education/report-cards/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/education/report-cards/page.tsx) | Enterprise UI View for `/src/app/education/report-cards` |
| `/src/app/education/scholarships` | [`src/app/education/scholarships/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/education/scholarships/page.tsx) | Enterprise UI View for `/src/app/education/scholarships` |
| `/src/app/field-service/expenses` | [`src/app/field-service/expenses/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/field-service/expenses/page.tsx) | Enterprise UI View for `/src/app/field-service/expenses` |
| `/src/app/field-service/warranties` | [`src/app/field-service/warranties/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/field-service/warranties/page.tsx) | Enterprise UI View for `/src/app/field-service/warranties` |
| `/src/app/fixed-assets/insurance` | [`src/app/fixed-assets/insurance/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/fixed-assets/insurance/page.tsx) | Enterprise UI View for `/src/app/fixed-assets/insurance` |
| `/src/app/fixed-assets/revaluation` | [`src/app/fixed-assets/revaluation/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/fixed-assets/revaluation/page.tsx) | Enterprise UI View for `/src/app/fixed-assets/revaluation` |
| `/src/app/healthcare/clinical` | [`src/app/healthcare/clinical/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/healthcare/clinical/page.tsx) | Enterprise UI View for `/src/app/healthcare/clinical` |
| `/src/app/healthcare/telehealth` | [`src/app/healthcare/telehealth/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/healthcare/telehealth/page.tsx) | Enterprise UI View for `/src/app/healthcare/telehealth` |
| `/src/app/people/onboarding` | [`src/app/people/onboarding/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/people/onboarding/page.tsx) | Enterprise UI View for `/src/app/people/onboarding` |
| `/src/app/people/recognition` | [`src/app/people/recognition/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/people/recognition/page.tsx) | Enterprise UI View for `/src/app/people/recognition` |
| `/src/app/real-estate/inspections` | [`src/app/real-estate/inspections/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/real-estate/inspections/page.tsx) | Enterprise UI View for `/src/app/real-estate/inspections` |
| `/src/app/real-estate/rent-collection` | [`src/app/real-estate/rent-collection/page.tsx`](file:///d:/UniERP/tenant-apps/src/app/real-estate/rent-collection/page.tsx) | Enterprise UI View for `/src/app/real-estate/rent-collection` |

### <a id="module-drive"></a> 📦 Domain Module: `drive` (14 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/drive/advanced` | [`app/(dashboard)/drive/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/advanced/page.tsx) | Enterprise UI View for `/drive/advanced` |
| `/drive/designer` | [`app/(dashboard)/drive/designer/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/designer/page.tsx) | Enterprise UI View for `/drive/designer` |
| `/drive/folder/[id]` | [`app/(dashboard)/drive/folder/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/folder/[id]/page.tsx) | Enterprise UI View for `/drive/folder/[id]` |
| `/drive/media` | [`app/(dashboard)/drive/media/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/media/page.tsx) | Enterprise UI View for `/drive/media` |
| `/drive` | [`app/(dashboard)/drive/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/page.tsx) | Enterprise UI View for `/drive` |
| `/drive/quotas` | [`app/(dashboard)/drive/quotas/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/quotas/page.tsx) | Enterprise UI View for `/drive/quotas` |
| `/drive/recent` | [`app/(dashboard)/drive/recent/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/recent/page.tsx) | Enterprise UI View for `/drive/recent` |
| `/drive/settings` | [`app/(dashboard)/drive/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/settings/page.tsx) | Enterprise UI View for `/drive/settings` |
| `/drive/shared` | [`app/(dashboard)/drive/shared/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/shared/page.tsx) | Enterprise UI View for `/drive/shared` |
| `/drive/starred` | [`app/(dashboard)/drive/starred/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/starred/page.tsx) | Enterprise UI View for `/drive/starred` |
| `/drive/tags` | [`app/(dashboard)/drive/tags/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/tags/page.tsx) | Enterprise UI View for `/drive/tags` |
| `/drive/templates` | [`app/(dashboard)/drive/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/templates/page.tsx) | Enterprise UI View for `/drive/templates` |
| `/drive/trash` | [`app/(dashboard)/drive/trash/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/trash/page.tsx) | Enterprise UI View for `/drive/trash` |
| `/drive/usage` | [`app/(dashboard)/drive/usage/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/drive/usage/page.tsx) | Enterprise UI View for `/drive/usage` |

### <a id="module-field-service"></a> 📦 Domain Module: `field-service` (14 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/field-service/checklists` | [`app/(dashboard)/field-service/checklists/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/checklists/page.tsx) | Enterprise UI View for `/field-service/checklists` |
| `/field-service/customers` | [`app/(dashboard)/field-service/customers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/customers/page.tsx) | Enterprise UI View for `/field-service/customers` |
| `/field-service/dispatch` | [`app/(dashboard)/field-service/dispatch/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/dispatch/page.tsx) | Enterprise UI View for `/field-service/dispatch` |
| `/field-service/mobile-dispatch` | [`app/(dashboard)/field-service/mobile-dispatch/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/mobile-dispatch/page.tsx) | Enterprise UI View for `/field-service/mobile-dispatch` |
| `/field-service` | [`app/(dashboard)/field-service/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/page.tsx) | Enterprise UI View for `/field-service` |
| `/field-service/parts` | [`app/(dashboard)/field-service/parts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/parts/page.tsx) | Enterprise UI View for `/field-service/parts` |
| `/field-service/preventive` | [`app/(dashboard)/field-service/preventive/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/preventive/page.tsx) | Enterprise UI View for `/field-service/preventive` |
| `/field-service/reports` | [`app/(dashboard)/field-service/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/reports/page.tsx) | Enterprise UI View for `/field-service/reports` |
| `/field-service/scheduling` | [`app/(dashboard)/field-service/scheduling/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/scheduling/page.tsx) | Enterprise UI View for `/field-service/scheduling` |
| `/field-service/settings` | [`app/(dashboard)/field-service/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/settings/page.tsx) | Enterprise UI View for `/field-service/settings` |
| `/field-service/technicians` | [`app/(dashboard)/field-service/technicians/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/technicians/page.tsx) | Enterprise UI View for `/field-service/technicians` |
| `/field-service/tickets/[id]` | [`app/(dashboard)/field-service/tickets/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/tickets/[id]/page.tsx) | Enterprise UI View for `/field-service/tickets/[id]` |
| `/field-service/tickets` | [`app/(dashboard)/field-service/tickets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/tickets/page.tsx) | Enterprise UI View for `/field-service/tickets` |
| `/field-service/van-stock` | [`app/(dashboard)/field-service/van-stock/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/field-service/van-stock/page.tsx) | Enterprise UI View for `/field-service/van-stock` |

### <a id="module-pages"></a> 📦 Domain Module: `pages` (14 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/e2e/pages/builder.page.ts` | [`e2e/pages/builder.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/builder.page.ts) | Enterprise UI View for `/e2e/pages/builder.page.ts` |
| `/e2e/pages/communication.page.ts` | [`e2e/pages/communication.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/communication.page.ts) | Enterprise UI View for `/e2e/pages/communication.page.ts` |
| `/e2e/pages/dashboard.page.ts` | [`e2e/pages/dashboard.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/dashboard.page.ts) | Enterprise UI View for `/e2e/pages/dashboard.page.ts` |
| `/e2e/pages/gl-journal.page.ts` | [`e2e/pages/gl-journal.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/gl-journal.page.ts) | Enterprise UI View for `/e2e/pages/gl-journal.page.ts` |
| `/e2e/pages/goods-receipt.page.ts` | [`e2e/pages/goods-receipt.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/goods-receipt.page.ts) | Enterprise UI View for `/e2e/pages/goods-receipt.page.ts` |
| `/e2e/pages/inventory.page.ts` | [`e2e/pages/inventory.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/inventory.page.ts) | Enterprise UI View for `/e2e/pages/inventory.page.ts` |
| `/e2e/pages/invoice.page.ts` | [`e2e/pages/invoice.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/invoice.page.ts) | Enterprise UI View for `/e2e/pages/invoice.page.ts` |
| `/e2e/pages/login.page.ts` | [`e2e/pages/login.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/login.page.ts) | Enterprise UI View for `/e2e/pages/login.page.ts` |
| `/e2e/pages/manufacturing.page.ts` | [`e2e/pages/manufacturing.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/manufacturing.page.ts) | Enterprise UI View for `/e2e/pages/manufacturing.page.ts` |
| `/e2e/pages/payment.page.ts` | [`e2e/pages/payment.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/payment.page.ts) | Enterprise UI View for `/e2e/pages/payment.page.ts` |
| `/e2e/pages/projects.page.ts` | [`e2e/pages/projects.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/projects.page.ts) | Enterprise UI View for `/e2e/pages/projects.page.ts` |
| `/e2e/pages/purchase-order.page.ts` | [`e2e/pages/purchase-order.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/purchase-order.page.ts) | Enterprise UI View for `/e2e/pages/purchase-order.page.ts` |
| `/e2e/pages/sales-order.page.ts` | [`e2e/pages/sales-order.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/sales-order.page.ts) | Enterprise UI View for `/e2e/pages/sales-order.page.ts` |
| `/e2e/pages/supply-chain.page.ts` | [`e2e/pages/supply-chain.page.ts`](file:///d:/UniERP/tenant-apps/e2e/pages/supply-chain.page.ts) | Enterprise UI View for `/e2e/pages/supply-chain.page.ts` |

### <a id="module-real-estate"></a> 📦 Domain Module: `real-estate` (13 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/real-estate/commissions` | [`app/(dashboard)/real-estate/commissions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/commissions/page.tsx) | Enterprise UI View for `/real-estate/commissions` |
| `/real-estate/financials` | [`app/(dashboard)/real-estate/financials/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/financials/page.tsx) | Enterprise UI View for `/real-estate/financials` |
| `/real-estate/lease-renewals` | [`app/(dashboard)/real-estate/lease-renewals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/lease-renewals/page.tsx) | Enterprise UI View for `/real-estate/lease-renewals` |
| `/real-estate/leases/[id]` | [`app/(dashboard)/real-estate/leases/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/leases/[id]/page.tsx) | Enterprise UI View for `/real-estate/leases/[id]` |
| `/real-estate/leases` | [`app/(dashboard)/real-estate/leases/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/leases/page.tsx) | Enterprise UI View for `/real-estate/leases` |
| `/real-estate/maintenance-requests` | [`app/(dashboard)/real-estate/maintenance-requests/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/maintenance-requests/page.tsx) | Enterprise UI View for `/real-estate/maintenance-requests` |
| `/real-estate/maintenance` | [`app/(dashboard)/real-estate/maintenance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/maintenance/page.tsx) | Enterprise UI View for `/real-estate/maintenance` |
| `/real-estate` | [`app/(dashboard)/real-estate/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/page.tsx) | Enterprise UI View for `/real-estate` |
| `/real-estate/properties/[id]` | [`app/(dashboard)/real-estate/properties/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/properties/[id]/page.tsx) | Enterprise UI View for `/real-estate/properties/[id]` |
| `/real-estate/properties` | [`app/(dashboard)/real-estate/properties/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/properties/page.tsx) | Enterprise UI View for `/real-estate/properties` |
| `/real-estate/reports` | [`app/(dashboard)/real-estate/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/reports/page.tsx) | Enterprise UI View for `/real-estate/reports` |
| `/real-estate/settings` | [`app/(dashboard)/real-estate/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/settings/page.tsx) | Enterprise UI View for `/real-estate/settings` |
| `/real-estate/tenants` | [`app/(dashboard)/real-estate/tenants/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/real-estate/tenants/page.tsx) | Enterprise UI View for `/real-estate/tenants` |

### <a id="module-ecommerce"></a> 📦 Domain Module: `ecommerce` (11 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/ecommerce/categories` | [`app/(dashboard)/ecommerce/categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/categories/page.tsx) | Enterprise UI View for `/ecommerce/categories` |
| `/ecommerce/coupons` | [`app/(dashboard)/ecommerce/coupons/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/coupons/page.tsx) | Enterprise UI View for `/ecommerce/coupons` |
| `/ecommerce/exp-orders` | [`app/(dashboard)/ecommerce/exp-orders/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/exp-orders/page.tsx) | Enterprise UI View for `/ecommerce/exp-orders` |
| `/ecommerce/listings` | [`app/(dashboard)/ecommerce/listings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/listings/page.tsx) | Enterprise UI View for `/ecommerce/listings` |
| `/ecommerce` | [`app/(dashboard)/ecommerce/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/page.tsx) | Enterprise UI View for `/ecommerce` |
| `/ecommerce/reviews` | [`app/(dashboard)/ecommerce/reviews/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/reviews/page.tsx) | Enterprise UI View for `/ecommerce/reviews` |
| `/ecommerce/settings` | [`app/(dashboard)/ecommerce/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/settings/page.tsx) | Enterprise UI View for `/ecommerce/settings` |
| `/ecommerce/shipping` | [`app/(dashboard)/ecommerce/shipping/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/shipping/page.tsx) | Enterprise UI View for `/ecommerce/shipping` |
| `/ecommerce/stores` | [`app/(dashboard)/ecommerce/stores/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/stores/page.tsx) | Enterprise UI View for `/ecommerce/stores` |
| `/ecommerce/tax` | [`app/(dashboard)/ecommerce/tax/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/tax/page.tsx) | Enterprise UI View for `/ecommerce/tax` |
| `/ecommerce/themes` | [`app/(dashboard)/ecommerce/themes/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ecommerce/themes/page.tsx) | Enterprise UI View for `/ecommerce/themes` |

### <a id="module-fixed-assets"></a> 📦 Domain Module: `fixed-assets` (10 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/fixed-assets/audits` | [`app/(dashboard)/fixed-assets/audits/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/audits/page.tsx) | Enterprise UI View for `/fixed-assets/audits` |
| `/fixed-assets/categories` | [`app/(dashboard)/fixed-assets/categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/categories/page.tsx) | Enterprise UI View for `/fixed-assets/categories` |
| `/fixed-assets/depreciation` | [`app/(dashboard)/fixed-assets/depreciation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/depreciation/page.tsx) | Enterprise UI View for `/fixed-assets/depreciation` |
| `/fixed-assets/disposals` | [`app/(dashboard)/fixed-assets/disposals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/disposals/page.tsx) | Enterprise UI View for `/fixed-assets/disposals` |
| `/fixed-assets/groups` | [`app/(dashboard)/fixed-assets/groups/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/groups/page.tsx) | Enterprise UI View for `/fixed-assets/groups` |
| `/fixed-assets/insurance` | [`app/(dashboard)/fixed-assets/insurance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/insurance/page.tsx) | Enterprise UI View for `/fixed-assets/insurance` |
| `/fixed-assets/maintenance` | [`app/(dashboard)/fixed-assets/maintenance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/maintenance/page.tsx) | Enterprise UI View for `/fixed-assets/maintenance` |
| `/fixed-assets` | [`app/(dashboard)/fixed-assets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/page.tsx) | Enterprise UI View for `/fixed-assets` |
| `/fixed-assets/reports` | [`app/(dashboard)/fixed-assets/reports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/reports/page.tsx) | Enterprise UI View for `/fixed-assets/reports` |
| `/fixed-assets/transfers` | [`app/(dashboard)/fixed-assets/transfers/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/fixed-assets/transfers/page.tsx) | Enterprise UI View for `/fixed-assets/transfers` |

### <a id="module-workflow"></a> 📦 Domain Module: `workflow` (10 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/workflow/advanced` | [`app/(dashboard)/workflow/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/advanced/page.tsx) | Enterprise UI View for `/workflow/advanced` |
| `/workflow/analytics` | [`app/(dashboard)/workflow/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/analytics/page.tsx) | Enterprise UI View for `/workflow/analytics` |
| `/workflow/categories` | [`app/(dashboard)/workflow/categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/categories/page.tsx) | Enterprise UI View for `/workflow/categories` |
| `/workflow/conditions` | [`app/(dashboard)/workflow/conditions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/conditions/page.tsx) | Enterprise UI View for `/workflow/conditions` |
| `/workflow/instances` | [`app/(dashboard)/workflow/instances/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/instances/page.tsx) | Enterprise UI View for `/workflow/instances` |
| `/workflow` | [`app/(dashboard)/workflow/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/page.tsx) | Enterprise UI View for `/workflow` |
| `/workflow/tasks` | [`app/(dashboard)/workflow/tasks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/tasks/page.tsx) | Enterprise UI View for `/workflow/tasks` |
| `/workflow/templates` | [`app/(dashboard)/workflow/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/templates/page.tsx) | Enterprise UI View for `/workflow/templates` |
| `/workflow/versions` | [`app/(dashboard)/workflow/versions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/versions/page.tsx) | Enterprise UI View for `/workflow/versions` |
| `/workflow/webhooks` | [`app/(dashboard)/workflow/webhooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/workflow/webhooks/page.tsx) | Enterprise UI View for `/workflow/webhooks` |

### <a id="module-reporting"></a> 📦 Domain Module: `reporting` (9 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/reporting/alerts` | [`app/(dashboard)/reporting/alerts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/alerts/page.tsx) | Enterprise UI View for `/reporting/alerts` |
| `/reporting/bookmarks` | [`app/(dashboard)/reporting/bookmarks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/bookmarks/page.tsx) | Enterprise UI View for `/reporting/bookmarks` |
| `/reporting/compliance` | [`app/(dashboard)/reporting/compliance/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/compliance/page.tsx) | Enterprise UI View for `/reporting/compliance` |
| `/reporting/drilldown` | [`app/(dashboard)/reporting/drilldown/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/drilldown/page.tsx) | Enterprise UI View for `/reporting/drilldown` |
| `/reporting/exports` | [`app/(dashboard)/reporting/exports/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/exports/page.tsx) | Enterprise UI View for `/reporting/exports` |
| `/reporting/jobs` | [`app/(dashboard)/reporting/jobs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/jobs/page.tsx) | Enterprise UI View for `/reporting/jobs` |
| `/reporting` | [`app/(dashboard)/reporting/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/page.tsx) | Enterprise UI View for `/reporting` |
| `/reporting/templates` | [`app/(dashboard)/reporting/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/templates/page.tsx) | Enterprise UI View for `/reporting/templates` |
| `/reporting/viewer` | [`app/(dashboard)/reporting/viewer/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/reporting/viewer/page.tsx) | Enterprise UI View for `/reporting/viewer` |

### <a id="module-storage"></a> 📦 Domain Module: `storage` (9 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/storage/advanced` | [`app/(dashboard)/storage/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/advanced/page.tsx) | Enterprise UI View for `/storage/advanced` |
| `/storage/alerts` | [`app/(dashboard)/storage/alerts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/alerts/page.tsx) | Enterprise UI View for `/storage/alerts` |
| `/storage/backups` | [`app/(dashboard)/storage/backups/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/backups/page.tsx) | Enterprise UI View for `/storage/backups` |
| `/storage/buckets` | [`app/(dashboard)/storage/buckets/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/buckets/page.tsx) | Enterprise UI View for `/storage/buckets` |
| `/storage/encryption` | [`app/(dashboard)/storage/encryption/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/encryption/page.tsx) | Enterprise UI View for `/storage/encryption` |
| `/storage` | [`app/(dashboard)/storage/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/page.tsx) | Enterprise UI View for `/storage` |
| `/storage/quota` | [`app/(dashboard)/storage/quota/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/quota/page.tsx) | Enterprise UI View for `/storage/quota` |
| `/storage/shared` | [`app/(dashboard)/storage/shared/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/shared/page.tsx) | Enterprise UI View for `/storage/shared` |
| `/storage/snapshots` | [`app/(dashboard)/storage/snapshots/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/storage/snapshots/page.tsx) | Enterprise UI View for `/storage/snapshots` |

### <a id="module-localization"></a> 📦 Domain Module: `localization` (8 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/localization/content-schedule` | [`app/(dashboard)/localization/content-schedule/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/content-schedule/page.tsx) | Enterprise UI View for `/localization/content-schedule` |
| `/localization/context` | [`app/(dashboard)/localization/context/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/context/page.tsx) | Enterprise UI View for `/localization/context` |
| `/localization/fallback` | [`app/(dashboard)/localization/fallback/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/fallback/page.tsx) | Enterprise UI View for `/localization/fallback` |
| `/localization/glossary` | [`app/(dashboard)/localization/glossary/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/glossary/page.tsx) | Enterprise UI View for `/localization/glossary` |
| `/localization/machine-translation` | [`app/(dashboard)/localization/machine-translation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/machine-translation/page.tsx) | Enterprise UI View for `/localization/machine-translation` |
| `/localization` | [`app/(dashboard)/localization/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/page.tsx) | Enterprise UI View for `/localization` |
| `/localization/regions` | [`app/(dashboard)/localization/regions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/regions/page.tsx) | Enterprise UI View for `/localization/regions` |
| `/localization/translations` | [`app/(dashboard)/localization/translations/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/localization/translations/page.tsx) | Enterprise UI View for `/localization/translations` |

### <a id="module-advanced-hr"></a> 📦 Domain Module: `advanced-hr` (6 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/advanced-hr/compensation` | [`app/(dashboard)/advanced-hr/compensation/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/compensation/page.tsx) | Enterprise UI View for `/advanced-hr/compensation` |
| `/advanced-hr/exit-interviews` | [`app/(dashboard)/advanced-hr/exit-interviews/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/exit-interviews/page.tsx) | Enterprise UI View for `/advanced-hr/exit-interviews` |
| `/advanced-hr/learning` | [`app/(dashboard)/advanced-hr/learning/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/learning/page.tsx) | Enterprise UI View for `/advanced-hr/learning` |
| `/advanced-hr/org-chart` | [`app/(dashboard)/advanced-hr/org-chart/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/org-chart/page.tsx) | Enterprise UI View for `/advanced-hr/org-chart` |
| `/advanced-hr/succession` | [`app/(dashboard)/advanced-hr/succession/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/succession/page.tsx) | Enterprise UI View for `/advanced-hr/succession` |
| `/advanced-hr/workforce-analytics` | [`app/(dashboard)/advanced-hr/workforce-analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/advanced-hr/workforce-analytics/page.tsx) | Enterprise UI View for `/advanced-hr/workforce-analytics` |

### <a id="module-ai"></a> 📦 Domain Module: `ai` (6 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/ai/intents` | [`app/(dashboard)/ai/intents/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/intents/page.tsx) | Enterprise UI View for `/ai/intents` |
| `/ai/models` | [`app/(dashboard)/ai/models/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/models/page.tsx) | Enterprise UI View for `/ai/models` |
| `/ai` | [`app/(dashboard)/ai/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/page.tsx) | Enterprise UI View for `/ai` |
| `/ai/prompts` | [`app/(dashboard)/ai/prompts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/prompts/page.tsx) | Enterprise UI View for `/ai/prompts` |
| `/ai/settings` | [`app/(dashboard)/ai/settings/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/settings/page.tsx) | Enterprise UI View for `/ai/settings` |
| `/ai/training` | [`app/(dashboard)/ai/training/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ai/training/page.tsx) | Enterprise UI View for `/ai/training` |

### <a id="module-documents"></a> 📦 Domain Module: `documents` (6 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/documents/advanced` | [`app/(dashboard)/documents/advanced/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/advanced/page.tsx) | Enterprise UI View for `/documents/advanced` |
| `/documents/approvals` | [`app/(dashboard)/documents/approvals/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/approvals/page.tsx) | Enterprise UI View for `/documents/approvals` |
| `/documents/categories` | [`app/(dashboard)/documents/categories/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/categories/page.tsx) | Enterprise UI View for `/documents/categories` |
| `/documents/smart-collections` | [`app/(dashboard)/documents/smart-collections/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/smart-collections/page.tsx) | Enterprise UI View for `/documents/smart-collections` |
| `/documents/tags` | [`app/(dashboard)/documents/tags/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/tags/page.tsx) | Enterprise UI View for `/documents/tags` |
| `/documents/templates` | [`app/(dashboard)/documents/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/documents/templates/page.tsx) | Enterprise UI View for `/documents/templates` |

### <a id="module-devops"></a> 📦 Domain Module: `devops` (5 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/devops/analytics` | [`app/(dashboard)/devops/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/devops/analytics/page.tsx) | Enterprise UI View for `/devops/analytics` |
| `/devops/deployments` | [`app/(dashboard)/devops/deployments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/devops/deployments/page.tsx) | Enterprise UI View for `/devops/deployments` |
| `/devops/environments` | [`app/(dashboard)/devops/environments/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/devops/environments/page.tsx) | Enterprise UI View for `/devops/environments` |
| `/devops` | [`app/(dashboard)/devops/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/devops/page.tsx) | Enterprise UI View for `/devops` |
| `/devops/releases` | [`app/(dashboard)/devops/releases/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/devops/releases/page.tsx) | Enterprise UI View for `/devops/releases` |

### <a id="module-ext-gateway"></a> 📦 Domain Module: `ext-gateway` (5 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/ext-gateway/analytics` | [`app/(dashboard)/ext-gateway/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ext-gateway/analytics/page.tsx) | Enterprise UI View for `/ext-gateway/analytics` |
| `/ext-gateway/connections` | [`app/(dashboard)/ext-gateway/connections/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ext-gateway/connections/page.tsx) | Enterprise UI View for `/ext-gateway/connections` |
| `/ext-gateway` | [`app/(dashboard)/ext-gateway/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ext-gateway/page.tsx) | Enterprise UI View for `/ext-gateway` |
| `/ext-gateway/templates` | [`app/(dashboard)/ext-gateway/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ext-gateway/templates/page.tsx) | Enterprise UI View for `/ext-gateway/templates` |
| `/ext-gateway/webhooks` | [`app/(dashboard)/ext-gateway/webhooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/ext-gateway/webhooks/page.tsx) | Enterprise UI View for `/ext-gateway/webhooks` |

### <a id="module-public"></a> 📦 Domain Module: `public` (5 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/public/bids/[rfqNumber]` | [`app/public/bids/[rfqNumber]/page.tsx`](file:///d:/UniERP/tenant-apps/app/public/bids/[rfqNumber]/page.tsx) | Enterprise UI View for `/public/bids/[rfqNumber]` |
| `/public/customer-portal/cases/[id]` | [`app/public/customer-portal/cases/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/public/customer-portal/cases/[id]/page.tsx) | Enterprise UI View for `/public/customer-portal/cases/[id]` |
| `/public/customer-portal/dashboard` | [`app/public/customer-portal/dashboard/page.tsx`](file:///d:/UniERP/tenant-apps/app/public/customer-portal/dashboard/page.tsx) | Enterprise UI View for `/public/customer-portal/dashboard` |
| `/public/customer-portal/login` | [`app/public/customer-portal/login/page.tsx`](file:///d:/UniERP/tenant-apps/app/public/customer-portal/login/page.tsx) | Enterprise UI View for `/public/customer-portal/login` |
| `/public/forms/[id]` | [`app/public/forms/[id]/page.tsx`](file:///d:/UniERP/tenant-apps/app/public/forms/[id]/page.tsx) | Enterprise UI View for `/public/forms/[id]` |

### <a id="module-api-platform"></a> 📦 Domain Module: `api-platform` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/api-platform` | [`app/(dashboard)/api-platform/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/api-platform/page.tsx) | Enterprise UI View for `/api-platform` |
| `/api-platform/rate-limits` | [`app/(dashboard)/api-platform/rate-limits/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/api-platform/rate-limits/page.tsx) | Enterprise UI View for `/api-platform/rate-limits` |
| `/api-platform/usage` | [`app/(dashboard)/api-platform/usage/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/api-platform/usage/page.tsx) | Enterprise UI View for `/api-platform/usage` |
| `/api-platform/webhooks` | [`app/(dashboard)/api-platform/webhooks/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/api-platform/webhooks/page.tsx) | Enterprise UI View for `/api-platform/webhooks` |

### <a id="module-auth"></a> 📦 Domain Module: `auth` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/auth/api-tokens` | [`app/(dashboard)/auth/api-tokens/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/auth/api-tokens/page.tsx) | Enterprise UI View for `/auth/api-tokens` |
| `/auth/login-history` | [`app/(dashboard)/auth/login-history/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/auth/login-history/page.tsx) | Enterprise UI View for `/auth/login-history` |
| `/auth/security` | [`app/(dashboard)/auth/security/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/auth/security/page.tsx) | Enterprise UI View for `/auth/security` |
| `/auth/sessions` | [`app/(dashboard)/auth/sessions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/auth/sessions/page.tsx) | Enterprise UI View for `/auth/sessions` |

### <a id="module-blockchain"></a> 📦 Domain Module: `blockchain` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/blockchain/audit` | [`app/(dashboard)/blockchain/audit/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/blockchain/audit/page.tsx) | Enterprise UI View for `/blockchain/audit` |
| `/blockchain/contracts` | [`app/(dashboard)/blockchain/contracts/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/blockchain/contracts/page.tsx) | Enterprise UI View for `/blockchain/contracts` |
| `/blockchain/network` | [`app/(dashboard)/blockchain/network/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/blockchain/network/page.tsx) | Enterprise UI View for `/blockchain/network` |
| `/blockchain/transactions` | [`app/(dashboard)/blockchain/transactions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/blockchain/transactions/page.tsx) | Enterprise UI View for `/blockchain/transactions` |

### <a id="module-outbox"></a> 📦 Domain Module: `outbox` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/outbox/analytics` | [`app/(dashboard)/outbox/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/outbox/analytics/page.tsx) | Enterprise UI View for `/outbox/analytics` |
| `/outbox/dead-letters` | [`app/(dashboard)/outbox/dead-letters/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/outbox/dead-letters/page.tsx) | Enterprise UI View for `/outbox/dead-letters` |
| `/outbox/dlq` | [`app/(dashboard)/outbox/dlq/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/outbox/dlq/page.tsx) | Enterprise UI View for `/outbox/dlq` |
| `/outbox` | [`app/(dashboard)/outbox/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/outbox/page.tsx) | Enterprise UI View for `/outbox` |

### <a id="module-pwa"></a> 📦 Domain Module: `pwa` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/pwa/cache-rules` | [`app/(dashboard)/pwa/cache-rules/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pwa/cache-rules/page.tsx) | Enterprise UI View for `/pwa/cache-rules` |
| `/pwa/offline-sync` | [`app/(dashboard)/pwa/offline-sync/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pwa/offline-sync/page.tsx) | Enterprise UI View for `/pwa/offline-sync` |
| `/pwa` | [`app/(dashboard)/pwa/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pwa/page.tsx) | Enterprise UI View for `/pwa` |
| `/pwa/push-subscriptions` | [`app/(dashboard)/pwa/push-subscriptions/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/pwa/push-subscriptions/page.tsx) | Enterprise UI View for `/pwa/push-subscriptions` |

### <a id="module-search"></a> 📦 Domain Module: `search` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/search/analytics` | [`app/(dashboard)/search/analytics/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/search/analytics/page.tsx) | Enterprise UI View for `/search/analytics` |
| `/search/configs` | [`app/(dashboard)/search/configs/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/search/configs/page.tsx) | Enterprise UI View for `/search/configs` |
| `/search` | [`app/(dashboard)/search/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/search/page.tsx) | Enterprise UI View for `/search` |
| `/search/saved` | [`app/(dashboard)/search/saved/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/search/saved/page.tsx) | Enterprise UI View for `/search/saved` |

### <a id="module-store"></a> 📦 Domain Module: `store` (4 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/store/[tenantSlug]/cart` | [`app/(storefront)/store/[tenantSlug]/cart/page.tsx`](file:///d:/UniERP/tenant-apps/app/(storefront)/store/[tenantSlug]/cart/page.tsx) | Enterprise UI View for `/store/[tenantSlug]/cart` |
| `/store/[tenantSlug]/checkout` | [`app/(storefront)/store/[tenantSlug]/checkout/page.tsx`](file:///d:/UniERP/tenant-apps/app/(storefront)/store/[tenantSlug]/checkout/page.tsx) | Enterprise UI View for `/store/[tenantSlug]/checkout` |
| `/store/[tenantSlug]` | [`app/(storefront)/store/[tenantSlug]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(storefront)/store/[tenantSlug]/page.tsx) | Enterprise UI View for `/store/[tenantSlug]` |
| `/store/[tenantSlug]/products/[listingId]` | [`app/(storefront)/store/[tenantSlug]/products/[listingId]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(storefront)/store/[tenantSlug]/products/[listingId]/page.tsx) | Enterprise UI View for `/store/[tenantSlug]/products/[listingId]` |

### <a id="module-notifications"></a> 📦 Domain Module: `notifications` (3 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/notifications/digests` | [`app/(dashboard)/notifications/digests/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/notifications/digests/page.tsx) | Enterprise UI View for `/notifications/digests` |
| `/notifications/preferences` | [`app/(dashboard)/notifications/preferences/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/notifications/preferences/page.tsx) | Enterprise UI View for `/notifications/preferences` |
| `/notifications/templates` | [`app/(dashboard)/notifications/templates/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/notifications/templates/page.tsx) | Enterprise UI View for `/notifications/templates` |

### <a id="module-people"></a> 📦 Domain Module: `people` (2 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/people/competencies` | [`app/(dashboard)/people/competencies/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/people/competencies/page.tsx) | Enterprise UI View for `/people/competencies` |
| `/people/succession` | [`app/(dashboard)/people/succession/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/people/succession/page.tsx) | Enterprise UI View for `/people/succession` |

### <a id="module-saved-views"></a> 📦 Domain Module: `saved-views` (2 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/saved-views` | [`app/(dashboard)/saved-views/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/saved-views/page.tsx) | Enterprise UI View for `/saved-views` |
| `/saved-views/sharing` | [`app/(dashboard)/saved-views/sharing/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/saved-views/sharing/page.tsx) | Enterprise UI View for `/saved-views/sharing` |

### <a id="module-login"></a> 📦 Domain Module: `login` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/login` | [`app/(auth)/login/page.tsx`](file:///d:/UniERP/tenant-apps/app/(auth)/login/page.tsx) | Enterprise UI View for `/login` |

### <a id="module-oauth"></a> 📦 Domain Module: `oauth` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/oauth/complete` | [`app/(auth)/oauth/complete/page.tsx`](file:///d:/UniERP/tenant-apps/app/(auth)/oauth/complete/page.tsx) | Enterprise UI View for `/oauth/complete` |

### <a id="module-register"></a> 📦 Domain Module: `register` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/register` | [`app/(auth)/register/page.tsx`](file:///d:/UniERP/tenant-apps/app/(auth)/register/page.tsx) | Enterprise UI View for `/register` |

### <a id="module-reset-password"></a> 📦 Domain Module: `reset-password` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/reset-password` | [`app/(auth)/reset-password/page.tsx`](file:///d:/UniERP/tenant-apps/app/(auth)/reset-password/page.tsx) | Enterprise UI View for `/reset-password` |

### <a id="module-verify-email"></a> 📦 Domain Module: `verify-email` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/verify-email` | [`app/(auth)/verify-email/page.tsx`](file:///d:/UniERP/tenant-apps/app/(auth)/verify-email/page.tsx) | Enterprise UI View for `/verify-email` |

### <a id="module-custom"></a> 📦 Domain Module: `custom` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/custom/[moduleSlug]` | [`app/(dashboard)/custom/[moduleSlug]/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/custom/[moduleSlug]/page.tsx) | Enterprise UI View for `/custom/[moduleSlug]` |

### <a id="module-dashboard"></a> 📦 Domain Module: `dashboard` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/dashboard` | [`app/(dashboard)/dashboard/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/dashboard/page.tsx) | Enterprise UI View for `/dashboard` |

### <a id="module-forbidden"></a> 📦 Domain Module: `forbidden` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/forbidden` | [`app/(dashboard)/forbidden/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/forbidden/page.tsx) | Enterprise UI View for `/forbidden` |

### <a id="module-onboarding"></a> 📦 Domain Module: `onboarding` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/onboarding` | [`app/(dashboard)/onboarding/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/onboarding/page.tsx) | Enterprise UI View for `/onboarding` |

### <a id="module-service-management"></a> 📦 Domain Module: `service-management` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/service-management` | [`app/(dashboard)/service-management/page.tsx`](file:///d:/UniERP/tenant-apps/app/(dashboard)/service-management/page.tsx) | Enterprise UI View for `/service-management` |

### <a id="module-landingpage.tsx"></a> 📦 Domain Module: `LandingPage.tsx` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/LandingPage.tsx` | [`app/LandingPage.tsx`](file:///d:/UniERP/tenant-apps/app/LandingPage.tsx) | Enterprise UI View for `/LandingPage.tsx` |

### <a id="module-[slug]"></a> 📦 Domain Module: `[slug]` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/[slug]` | [`app/[slug]/page.tsx`](file:///d:/UniERP/tenant-apps/app/[slug]/page.tsx) | Enterprise UI View for `/[slug]` |

### <a id="module-_sites"></a> 📦 Domain Module: `_sites` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/_sites/[host]/[[...path]]` | [`app/_sites/[host]/[[...path]]/page.tsx`](file:///d:/UniERP/tenant-apps/app/_sites/[host]/[[...path]]/page.tsx) | Enterprise UI View for `/_sites/[host]/[[...path]]` |

### <a id="module-page.tsx"></a> 📦 Domain Module: `page.tsx` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/` | [`app/page.tsx`](file:///d:/UniERP/tenant-apps/app/page.tsx) | Enterprise UI View for `/` |

### <a id="module-privacy"></a> 📦 Domain Module: `privacy` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/privacy` | [`app/privacy/page.tsx`](file:///d:/UniERP/tenant-apps/app/privacy/page.tsx) | Enterprise UI View for `/privacy` |

### <a id="module-terms"></a> 📦 Domain Module: `terms` (1 pages)

| Route Path | File Location | Purpose & UI Role |
| :--- | :--- | :--- |
| `/terms` | [`app/terms/page.tsx`](file:///d:/UniERP/tenant-apps/app/terms/page.tsx) | Enterprise UI View for `/terms` |

