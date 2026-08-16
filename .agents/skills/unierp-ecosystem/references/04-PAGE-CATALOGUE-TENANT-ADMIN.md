# 04 — Tenant Admin OS Page-by-Page Catalogue

## 🏢 Repository: `tenant-admin` (`@kannan19302/tenant-admin`)
- **Total Route Pages**: **110 pages**
- **Architecture**: Next.js App Router (`app/`), React, Design Tokens.
- **Core Role**: Dedicated tenant-level administration portal where tenant organization administrators configure roles, manage employee accounts, monitor resource quotas, manage subscriptions, generate API keys, and review security audit trails.

---

## 📑 Tenant Admin Sections

| Section | Page Count | Administrative Scope |
| :--- | :--- | :--- |
| **`app`** | 100 pages | [Jump to app](#admin-app) |
| **`api-keys`** | 1 pages | [Jump to api-keys](#admin-api-keys) |
| **`audit`** | 1 pages | [Jump to audit](#admin-audit) |
| **`billing`** | 1 pages | [Jump to billing](#admin-billing) |
| **`login`** | 1 pages | [Jump to login](#admin-login) |
| **`overview`** | 1 pages | [Jump to overview](#admin-overview) |
| **`page.tsx`** | 1 pages | [Jump to page.tsx](#admin-page.tsx) |
| **`roles`** | 1 pages | [Jump to roles](#admin-roles) |
| **`settings`** | 1 pages | [Jump to settings](#admin-settings) |
| **`usage`** | 1 pages | [Jump to usage](#admin-usage) |
| **`users`** | 1 pages | [Jump to users](#admin-users) |

---

## 🔍 Granular Page Directory

### <a id="admin-app"></a> ⚙️ Admin Section: `app` (100 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/src/app/(dashboard)/profile` | [`src/app/(dashboard)/profile/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/profile/page.tsx) | Admin Console View for `/src/app/(dashboard)/profile` |
| `/src/app/(dashboard)/settings/access-control/matrix` | [`src/app/(dashboard)/settings/access-control/matrix/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/access-control/matrix/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/access-control/matrix` |
| `/src/app/(dashboard)/settings/access-control/packages` | [`src/app/(dashboard)/settings/access-control/packages/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/access-control/packages/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/access-control/packages` |
| `/src/app/(dashboard)/settings/access-control` | [`src/app/(dashboard)/settings/access-control/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/access-control/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/access-control` |
| `/src/app/(dashboard)/settings/access-control/roles` | [`src/app/(dashboard)/settings/access-control/roles/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/access-control/roles/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/access-control/roles` |
| `/src/app/(dashboard)/settings/activity-feed` | [`src/app/(dashboard)/settings/activity-feed/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/activity-feed/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/activity-feed` |
| `/src/app/(dashboard)/settings/alerts` | [`src/app/(dashboard)/settings/alerts/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/alerts/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/alerts` |
| `/src/app/(dashboard)/settings/announcements` | [`src/app/(dashboard)/settings/announcements/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/announcements/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/announcements` |
| `/src/app/(dashboard)/settings/api-keys` | [`src/app/(dashboard)/settings/api-keys/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/api-keys/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/api-keys` |
| `/src/app/(dashboard)/settings/api-platform/analytics` | [`src/app/(dashboard)/settings/api-platform/analytics/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/api-platform/analytics/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/api-platform/analytics` |
| `/src/app/(dashboard)/settings/api-platform/oauth` | [`src/app/(dashboard)/settings/api-platform/oauth/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/api-platform/oauth/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/api-platform/oauth` |
| `/src/app/(dashboard)/settings/api-platform` | [`src/app/(dashboard)/settings/api-platform/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/api-platform/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/api-platform` |
| `/src/app/(dashboard)/settings/api-platform/sandbox` | [`src/app/(dashboard)/settings/api-platform/sandbox/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/api-platform/sandbox/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/api-platform/sandbox` |
| `/src/app/(dashboard)/settings/approval-operations` | [`src/app/(dashboard)/settings/approval-operations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/approval-operations/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/approval-operations` |
| `/src/app/(dashboard)/settings/audit-trail-saas` | [`src/app/(dashboard)/settings/audit-trail-saas/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/audit-trail-saas/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/audit-trail-saas` |
| `/src/app/(dashboard)/settings/audit-trail` | [`src/app/(dashboard)/settings/audit-trail/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/audit-trail/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/audit-trail` |
| `/src/app/(dashboard)/settings/automation-rules` | [`src/app/(dashboard)/settings/automation-rules/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/automation-rules/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/automation-rules` |
| `/src/app/(dashboard)/settings/backups` | [`src/app/(dashboard)/settings/backups/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/backups/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/backups` |
| `/src/app/(dashboard)/settings/billing` | [`src/app/(dashboard)/settings/billing/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/billing/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/billing` |
| `/src/app/(dashboard)/settings/branding-communication` | [`src/app/(dashboard)/settings/branding-communication/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/branding-communication/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/branding-communication` |
| `/src/app/(dashboard)/settings/branding` | [`src/app/(dashboard)/settings/branding/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/branding/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/branding` |
| `/src/app/(dashboard)/settings/bulk-operations` | [`src/app/(dashboard)/settings/bulk-operations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/bulk-operations/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/bulk-operations` |
| `/src/app/(dashboard)/settings/compliance` | [`src/app/(dashboard)/settings/compliance/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/compliance/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/compliance` |
| `/src/app/(dashboard)/settings/custom-fields` | [`src/app/(dashboard)/settings/custom-fields/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/custom-fields/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/custom-fields` |
| `/src/app/(dashboard)/settings/data-quality` | [`src/app/(dashboard)/settings/data-quality/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/data-quality/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/data-quality` |
| `/src/app/(dashboard)/settings/data-retention` | [`src/app/(dashboard)/settings/data-retention/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/data-retention/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/data-retention` |
| `/src/app/(dashboard)/settings/db-schema` | [`src/app/(dashboard)/settings/db-schema/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/db-schema/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/db-schema` |
| `/src/app/(dashboard)/settings/devops` | [`src/app/(dashboard)/settings/devops/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/devops/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/devops` |
| `/src/app/(dashboard)/settings/domains` | [`src/app/(dashboard)/settings/domains/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/domains/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/domains` |
| `/src/app/(dashboard)/settings/email-config` | [`src/app/(dashboard)/settings/email-config/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/email-config/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/email-config` |
| `/src/app/(dashboard)/settings/email-templates` | [`src/app/(dashboard)/settings/email-templates/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/email-templates/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/email-templates` |
| `/src/app/(dashboard)/settings/environments` | [`src/app/(dashboard)/settings/environments/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/environments/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/environments` |
| `/src/app/(dashboard)/settings/error-logs` | [`src/app/(dashboard)/settings/error-logs/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/error-logs/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/error-logs` |
| `/src/app/(dashboard)/settings/export` | [`src/app/(dashboard)/settings/export/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/export/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/export` |
| `/src/app/(dashboard)/settings/feature-flags` | [`src/app/(dashboard)/settings/feature-flags/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/feature-flags/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/feature-flags` |
| `/src/app/(dashboard)/settings/feedback` | [`src/app/(dashboard)/settings/feedback/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/feedback/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/feedback` |
| `/src/app/(dashboard)/settings/gdpr/erasure` | [`src/app/(dashboard)/settings/gdpr/erasure/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/gdpr/erasure/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/gdpr/erasure` |
| `/src/app/(dashboard)/settings/gdpr` | [`src/app/(dashboard)/settings/gdpr/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/gdpr/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/gdpr` |
| `/src/app/(dashboard)/settings/gdpr/retention` | [`src/app/(dashboard)/settings/gdpr/retention/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/gdpr/retention/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/gdpr/retention` |
| `/src/app/(dashboard)/settings/general-branding` | [`src/app/(dashboard)/settings/general-branding/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/general-branding/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/general-branding` |
| `/src/app/(dashboard)/settings/general` | [`src/app/(dashboard)/settings/general/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/general/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/general` |
| `/src/app/(dashboard)/settings/groups` | [`src/app/(dashboard)/settings/groups/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/groups/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/groups` |
| `/src/app/(dashboard)/settings/identity-access` | [`src/app/(dashboard)/settings/identity-access/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/identity-access/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/identity-access` |
| `/src/app/(dashboard)/settings/import-export` | [`src/app/(dashboard)/settings/import-export/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/import-export/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/import-export` |
| `/src/app/(dashboard)/settings/import` | [`src/app/(dashboard)/settings/import/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/import/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/import` |
| `/src/app/(dashboard)/settings/integrations` | [`src/app/(dashboard)/settings/integrations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/integrations/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/integrations` |
| `/src/app/(dashboard)/settings/ip-restrictions` | [`src/app/(dashboard)/settings/ip-restrictions/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/ip-restrictions/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/ip-restrictions` |
| `/src/app/(dashboard)/settings/jobs` | [`src/app/(dashboard)/settings/jobs/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/jobs/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/jobs` |
| `/src/app/(dashboard)/settings/localization` | [`src/app/(dashboard)/settings/localization/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/localization/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/localization` |
| `/src/app/(dashboard)/settings/login-customizer` | [`src/app/(dashboard)/settings/login-customizer/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/login-customizer/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/login-customizer` |
| `/src/app/(dashboard)/settings/login-history` | [`src/app/(dashboard)/settings/login-history/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/login-history/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/login-history` |
| `/src/app/(dashboard)/settings/maintenance` | [`src/app/(dashboard)/settings/maintenance/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/maintenance/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/maintenance` |
| `/src/app/(dashboard)/settings/mfa` | [`src/app/(dashboard)/settings/mfa/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/mfa/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/mfa` |
| `/src/app/(dashboard)/settings/notifications` | [`src/app/(dashboard)/settings/notifications/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/notifications/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/notifications` |
| `/src/app/(dashboard)/settings` | [`src/app/(dashboard)/settings/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings` |
| `/src/app/(dashboard)/settings/password-policy` | [`src/app/(dashboard)/settings/password-policy/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/password-policy/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/password-policy` |
| `/src/app/(dashboard)/settings/recycle-bin` | [`src/app/(dashboard)/settings/recycle-bin/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/recycle-bin/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/recycle-bin` |
| `/src/app/(dashboard)/settings/scheduled-reports` | [`src/app/(dashboard)/settings/scheduled-reports/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/scheduled-reports/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/scheduled-reports` |
| `/src/app/(dashboard)/settings/scheduled-tasks` | [`src/app/(dashboard)/settings/scheduled-tasks/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/scheduled-tasks/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/scheduled-tasks` |
| `/src/app/(dashboard)/settings/security` | [`src/app/(dashboard)/settings/security/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/security/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/security` |
| `/src/app/(dashboard)/settings/sessions` | [`src/app/(dashboard)/settings/sessions/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/sessions/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/sessions` |
| `/src/app/(dashboard)/settings/sso-saas` | [`src/app/(dashboard)/settings/sso-saas/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/sso-saas/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/sso-saas` |
| `/src/app/(dashboard)/settings/sso` | [`src/app/(dashboard)/settings/sso/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/sso/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/sso` |
| `/src/app/(dashboard)/settings/subscription` | [`src/app/(dashboard)/settings/subscription/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/subscription/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/subscription` |
| `/src/app/(dashboard)/settings/super-admin/admins` | [`src/app/(dashboard)/settings/super-admin/admins/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/admins/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/admins` |
| `/src/app/(dashboard)/settings/super-admin/health` | [`src/app/(dashboard)/settings/super-admin/health/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/health/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/health` |
| `/src/app/(dashboard)/settings/super-admin` | [`src/app/(dashboard)/settings/super-admin/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin` |
| `/src/app/(dashboard)/settings/super-admin/plans` | [`src/app/(dashboard)/settings/super-admin/plans/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/plans/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/plans` |
| `/src/app/(dashboard)/settings/super-admin/subscriptions` | [`src/app/(dashboard)/settings/super-admin/subscriptions/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/subscriptions/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/subscriptions` |
| `/src/app/(dashboard)/settings/super-admin/tenants/[id]` | [`src/app/(dashboard)/settings/super-admin/tenants/[id]/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/tenants/[id]/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/tenants/[id]` |
| `/src/app/(dashboard)/settings/super-admin/tenants` | [`src/app/(dashboard)/settings/super-admin/tenants/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/super-admin/tenants/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/super-admin/tenants` |
| `/src/app/(dashboard)/settings/support` | [`src/app/(dashboard)/settings/support/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/support/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/support` |
| `/src/app/(dashboard)/settings/sync` | [`src/app/(dashboard)/settings/sync/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/sync/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/sync` |
| `/src/app/(dashboard)/settings/system-health` | [`src/app/(dashboard)/settings/system-health/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/system-health/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/system-health` |
| `/src/app/(dashboard)/settings/system-operations` | [`src/app/(dashboard)/settings/system-operations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/system-operations/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/system-operations` |
| `/src/app/(dashboard)/settings/tenant-analytics` | [`src/app/(dashboard)/settings/tenant-analytics/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/tenant-analytics/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/tenant-analytics` |
| `/src/app/(dashboard)/settings/updates` | [`src/app/(dashboard)/settings/updates/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/updates/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/updates` |
| `/src/app/(dashboard)/settings/users` | [`src/app/(dashboard)/settings/users/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/users/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/users` |
| `/src/app/(dashboard)/settings/webhook-logs` | [`src/app/(dashboard)/settings/webhook-logs/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/webhook-logs/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/webhook-logs` |
| `/src/app/(dashboard)/settings/webhooks` | [`src/app/(dashboard)/settings/webhooks/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/webhooks/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/webhooks` |
| `/src/app/(dashboard)/settings/white-label` | [`src/app/(dashboard)/settings/white-label/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/white-label/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/white-label` |
| `/src/app/(dashboard)/settings/workflow-builder` | [`src/app/(dashboard)/settings/workflow-builder/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflow-builder/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflow-builder` |
| `/src/app/(dashboard)/settings/workflows/advanced` | [`src/app/(dashboard)/settings/workflows/advanced/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/advanced/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/advanced` |
| `/src/app/(dashboard)/settings/workflows/analytics` | [`src/app/(dashboard)/settings/workflows/analytics/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/analytics/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/analytics` |
| `/src/app/(dashboard)/settings/workflows/approvals` | [`src/app/(dashboard)/settings/workflows/approvals/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/approvals/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/approvals` |
| `/src/app/(dashboard)/settings/workflows/bulk` | [`src/app/(dashboard)/settings/workflows/bulk/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/bulk/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/bulk` |
| `/src/app/(dashboard)/settings/workflows/email` | [`src/app/(dashboard)/settings/workflows/email/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/email/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/email` |
| `/src/app/(dashboard)/settings/workflows/escalations` | [`src/app/(dashboard)/settings/workflows/escalations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/escalations/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/escalations` |
| `/src/app/(dashboard)/settings/workflows` | [`src/app/(dashboard)/settings/workflows/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows` |
| `/src/app/(dashboard)/settings/workflows/routing` | [`src/app/(dashboard)/settings/workflows/routing/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/routing/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/routing` |
| `/src/app/(dashboard)/settings/workflows/simulation` | [`src/app/(dashboard)/settings/workflows/simulation/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/simulation/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/simulation` |
| `/src/app/(dashboard)/settings/workflows/templates` | [`src/app/(dashboard)/settings/workflows/templates/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/settings/workflows/templates/page.tsx) | Admin Console View for `/src/app/(dashboard)/settings/workflows/templates` |
| `/src/app/(dashboard)/subscriptions/coupons` | [`src/app/(dashboard)/subscriptions/coupons/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/coupons/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/coupons` |
| `/src/app/(dashboard)/subscriptions/credit-notes` | [`src/app/(dashboard)/subscriptions/credit-notes/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/credit-notes/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/credit-notes` |
| `/src/app/(dashboard)/subscriptions/dunning` | [`src/app/(dashboard)/subscriptions/dunning/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/dunning/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/dunning` |
| `/src/app/(dashboard)/subscriptions/migrations` | [`src/app/(dashboard)/subscriptions/migrations/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/migrations/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/migrations` |
| `/src/app/(dashboard)/subscriptions` | [`src/app/(dashboard)/subscriptions/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions` |
| `/src/app/(dashboard)/subscriptions/plans` | [`src/app/(dashboard)/subscriptions/plans/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/plans/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/plans` |
| `/src/app/(dashboard)/subscriptions/tiers` | [`src/app/(dashboard)/subscriptions/tiers/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/tiers/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/tiers` |
| `/src/app/(dashboard)/subscriptions/usage` | [`src/app/(dashboard)/subscriptions/usage/page.tsx`](file:///d:/UniERP/tenant-admin/src/app/(dashboard)/subscriptions/usage/page.tsx) | Admin Console View for `/src/app/(dashboard)/subscriptions/usage` |

### <a id="admin-api-keys"></a> ⚙️ Admin Section: `api-keys` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/api-keys` | [`app/api-keys/page.tsx`](file:///d:/UniERP/tenant-admin/app/api-keys/page.tsx) | Admin Console View for `/api-keys` |

### <a id="admin-audit"></a> ⚙️ Admin Section: `audit` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/audit` | [`app/audit/page.tsx`](file:///d:/UniERP/tenant-admin/app/audit/page.tsx) | Admin Console View for `/audit` |

### <a id="admin-billing"></a> ⚙️ Admin Section: `billing` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/billing` | [`app/billing/page.tsx`](file:///d:/UniERP/tenant-admin/app/billing/page.tsx) | Admin Console View for `/billing` |

### <a id="admin-login"></a> ⚙️ Admin Section: `login` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/login` | [`app/login/page.tsx`](file:///d:/UniERP/tenant-admin/app/login/page.tsx) | Admin Console View for `/login` |

### <a id="admin-overview"></a> ⚙️ Admin Section: `overview` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/overview` | [`app/overview/page.tsx`](file:///d:/UniERP/tenant-admin/app/overview/page.tsx) | Admin Console View for `/overview` |

### <a id="admin-page.tsx"></a> ⚙️ Admin Section: `page.tsx` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/` | [`app/page.tsx`](file:///d:/UniERP/tenant-admin/app/page.tsx) | Admin Console View for `/` |

### <a id="admin-roles"></a> ⚙️ Admin Section: `roles` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/roles` | [`app/roles/page.tsx`](file:///d:/UniERP/tenant-admin/app/roles/page.tsx) | Admin Console View for `/roles` |

### <a id="admin-settings"></a> ⚙️ Admin Section: `settings` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/settings` | [`app/settings/page.tsx`](file:///d:/UniERP/tenant-admin/app/settings/page.tsx) | Admin Console View for `/settings` |

### <a id="admin-usage"></a> ⚙️ Admin Section: `usage` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/usage` | [`app/usage/page.tsx`](file:///d:/UniERP/tenant-admin/app/usage/page.tsx) | Admin Console View for `/usage` |

### <a id="admin-users"></a> ⚙️ Admin Section: `users` (1 pages)

| Admin Route | File Location | Administrative Function |
| :--- | :--- | :--- |
| `/users` | [`app/users/page.tsx`](file:///d:/UniERP/tenant-admin/app/users/page.tsx) | Admin Console View for `/users` |

