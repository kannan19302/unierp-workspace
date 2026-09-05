# Strata reference research — 2026-09-05

Design synthesis, not copied branding. These references inform proposed interaction patterns; they do not prove UniERP implementation.

| Reference | Evidence | Strata application |
|---|---|---|
| IBM Carbon | https://carbondesignsystem.com/components/data-table/usage/ | Structured table toolbar, predictable selection and bulk actions; explicit AI presence |
| Atlassian | https://atlassian.design/components/navigation-system/ | Global app navigation separated from contextual module navigation |
| Google Material | https://m3.material.io/foundations/interaction/states/overview | Consistent hover, focus, pressed and disabled states with more than color alone |
| Microsoft Fluent | https://fluent2.microsoft.design/components/web/react/core/nav/usage | Clear main-section navigation and concise sentence-case labels |
| SAP Fiori | https://www.sap.com/design-system/fiori-design-web/v1-120/page-types/floorplan-overview | Deliberate list, object and transaction floorplans |
| SAP flexible columns | https://help.sap.com/docs/SAPUI5/b2f662dd9d7a4ec680056733050b4d34/75631b78e3444231bb31cf80b3b50922.html | Keep list context while inspecting a record; resizable, personalized columns |
| Salesforce | https://resources.docs.salesforce.com/latest/latest/en-us/sfdc/pdf/lightning.pdf | Structured record forms; Strata's existing accepted ADR also identifies Lightning as an interaction reference |
| Odoo | https://www.odoo.com/documentation/18.0/developer/reference/user_interface/view_records.html | Context-aware record views and mobile alternatives; permissions still govern capabilities |
| Zoho Canvas | https://www.zoho.com/canvas/ | Role-specific fields and related information rather than one generic dashboard |
| Frappe | https://docs.frappe.io/framework/user/en/desk/workspace | Useful app/workspace entry points and shortcuts |

## Own identity
The accepted slate/cobalt palette and Plus Jakarta Sans / Inter / JetBrains Mono typography remain. The proposed three-layer mark represents context, work and evidence. White work surfaces sit within quiet slate chrome; one context path and a focused side navigation establish hierarchy. Cobalt communicates the current location and primary decision. Semantic colors indicate status with text. Inspector panels retain source context. A thin lifecycle strip belongs to the record, not to redundant module navigation.

## Code and current design differences
Static scan: 1,193 Next.js page files, 794 tenant-apps files. Penpot: 30 original pages, 216 boards, no actual local library components/colors/tokens before this session. Board names sometimes differ from source modules (hrm vs hr, assets vs fixed-assets, retail vs pos). Existing sales board children are outside the board, causing blank export.
Hosted IDP owns login, registration, recovery, verification and account center; app redirect routes are not independent password forms. Sales orders embeds create, payment and delivery modals and a detail drawer in a single route. Onboarding has organization data, industry blueprint, account template, team and import steps. Route presence is not a functioning-screen or accessibility claim.

## Design evidence boundaries
Generated route atlas entries are source-informed low-fidelity proposals. They require interaction review, imported-component inspection and runtime checks before code implementation. Synthetic examples are for design review only. No real account data is copied to Penpot.
