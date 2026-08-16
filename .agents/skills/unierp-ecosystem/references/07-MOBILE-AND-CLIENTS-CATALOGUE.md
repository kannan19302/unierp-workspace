# 07 — Mobile & Desktop Clients Catalogue

## 📱 Mobile Client: `unierp-mobile` (`unierp_mobile`)
- **Total Dart Files**: **785 files**
- **Total Screens/Views/Pages**: **430 screens**
- **Architecture**: Flutter (iOS & Android), Clean Architecture, BLoC pattern, Offline-first database (SQLite/Isar), Biometric Auth, Device Camera/Barcode scanning, Push Notifications.
- **Coverage**: 44 Enterprise Modules replicated natively for mobile field workers, warehouse operators, and executives.

---

### 📂 Mobile Feature Modules (44 Modules)

| Feature Module | Screen Count | Key Mobile Screen Views |
| :--- | :--- | :--- |
| **`pos`** | 27 screens | pos_coupon_detail_page.dart, pos_coupon_form_page.dart, pos_coupon_list_page.dart... |
| **`finance`** | 26 screens | bank_account_detail_page.dart, bank_account_form_page.dart, bank_account_list_page.dart... |
| **`hr`** | 25 screens | attendance_detail_page.dart, attendance_form_page.dart, attendance_list_page.dart... |
| **`manufacturing`** | 22 screens | bom_detail_page.dart, bom_form_page.dart, bom_list_page.dart... |
| **`procurement`** | 22 screens | procurement_dashboard_page.dart, purchase_order_detail_page.dart, purchase_order_form_page.dart... |
| **`projects`** | 20 screens | milestone_list_page.dart, project_budget_detail_page.dart, project_budget_form_page.dart... |
| **`inventory`** | 19 screens | inventory_adjustment_detail_page.dart, inventory_adjustment_form_page.dart, inventory_adjustment_list_page.dart... |
| **`sales`** | 18 screens | delivery_note_detail_page.dart, delivery_note_form_page.dart, delivery_note_list_page.dart... |
| **`admin`** | 17 screens | admin_api_key_detail_page.dart, admin_api_key_form_page.dart, admin_api_key_list_page.dart... |
| **`supply_chain`** | 17 screens | carrier_detail_page.dart, carrier_list_page.dart, demand_forecast_list_page.dart... |
| **`crm`** | 16 screens | activity_detail_page.dart, activity_form_page.dart, activity_list_page.dart... |
| **`ai`** | 12 screens | model_detail_page.dart, model_form_page.dart, model_list_page.dart... |
| **`reporting`** | 12 screens | compliance_detail_page.dart, compliance_form_page.dart, compliance_list_page.dart... |
| **`saas`** | 12 screens | plan_detail_page.dart, saas_billing_detail_page.dart, saas_billing_form_page.dart... |
| **`analytics`** | 11 screens | dashboard_detail_page.dart, dashboard_form_page.dart, dashboard_list_page.dart... |
| **`education`** | 9 screens | course_detail_page.dart, course_form_page.dart, course_list_page.dart... |
| **`field_service`** | 9 screens | contract_detail_page.dart, contract_form_page.dart, schedule_form_page.dart... |
| **`healthcare`** | 9 screens | appointment_detail_page.dart, appointment_form_page.dart, appointment_list_page.dart... |
| **`auth`** | 8 screens | auth_profile_page.dart, auth_security_page.dart, auth_sessions_page.dart... |
| **`communication`** | 7 screens | channel_detail_page.dart, channel_form_page.dart, meeting_form_page.dart... |
| **`real_estate`** | 7 screens | lease_detail_page.dart, lease_form_page.dart, property_detail_page.dart... |
| **`saas_portal`** | 7 screens | billing_history_page.dart, plan_detail_page.dart, portal_plan_list_page.dart... |
| **`advanced_finance`** | 6 screens | financial_close_task_detail_page.dart, financial_close_task_form_page.dart, financial_close_task_list_page.dart... |
| **`advanced_hr`** | 6 screens | compensation_band_detail_page.dart, compensation_band_form_page.dart, compensation_band_list_page.dart... |
| **`api_platform`** | 6 screens | api_key_detail_page.dart, api_key_form_page.dart, api_key_list_page.dart... |
| **`builder`** | 6 screens | builder_form_detail_page.dart, builder_form_form_page.dart, builder_form_list_page.dart... |
| **`documents`** | 6 screens | documents_list_page.dart, document_folders_list_page.dart, document_template_detail_page.dart... |
| **`subscriptions`** | 6 screens | billing_detail_page.dart, billing_form_page.dart, plan_detail_page.dart... |
| **`blockchain`** | 5 screens | blockchain_contract_list_page.dart, blockchain_transaction_list_page.dart, contract_detail_page.dart... |
| **`ecommerce`** | 5 screens | category_form_page.dart, ecommerce_product_list_page.dart, order_detail_page.dart... |
| **`fixed_assets`** | 5 screens | asset_detail_page.dart, asset_form_page.dart, disposal_form_page.dart... |
| **`people`** | 5 screens | person_detail_page.dart, person_form_page.dart, person_list_page.dart... |
| **`search`** | 5 screens | search_config_form_page.dart, search_config_page.dart, search_result_page.dart... |
| **`service_management`** | 5 screens | catalog_item_detail_page.dart, service_catalog_list_page.dart, service_request_detail_page.dart... |
| **`localization`** | 4 screens | language_detail_page.dart, language_form_page.dart, language_list_page.dart... |
| **`marketplace`** | 4 screens | app_detail_page.dart, app_form_page.dart, marketplace_app_list_page.dart... |
| **`pwa`** | 4 screens | manifest_form_page.dart, offline_queue_page.dart, push_subscription_detail_page.dart... |
| **`storage`** | 4 screens | bucket_detail_page.dart, bucket_form_page.dart, bucket_list_page.dart... |
| **`widgets`** | 3 screens | form_page.dart, paginated_list_view.dart, tabbed_detail_view.dart |
| **`drive`** | 3 screens | drive_file_list_page.dart, drive_folder_list_page.dart, file_detail_page.dart |
| **`saved_views`** | 3 screens | saved_view_detail_page.dart, saved_view_form_page.dart, saved_view_list_page.dart |
| **`workflow`** | 3 screens | workflow_approval_list_page.dart, workflow_detail_page.dart, workflow_list_page.dart |
| **`notifications`** | 2 screens | notifications_page.dart, notification_preferences_page.dart |
| **`home`** | 1 screens | home_page.dart |
| **`onboarding`** | 1 screens | onboarding_page.dart |

---

## 🔍 Granular Mobile Screens Directory

### 📱 Mobile Module: `pos` (27 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `pos_coupon_detail_page` | [`features/pos/presentation/pages/pos_coupon_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_coupon_detail_page.dart) | Flutter Screen View |
| `pos_coupon_form_page` | [`features/pos/presentation/pages/pos_coupon_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_coupon_form_page.dart) | Flutter Screen View |
| `pos_coupon_list_page` | [`features/pos/presentation/pages/pos_coupon_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_coupon_list_page.dart) | Flutter Screen View |
| `pos_dashboard_page` | [`features/pos/presentation/pages/pos_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_dashboard_page.dart) | Flutter Screen View |
| `pos_discount_detail_page` | [`features/pos/presentation/pages/pos_discount_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_discount_detail_page.dart) | Flutter Screen View |
| `pos_discount_form_page` | [`features/pos/presentation/pages/pos_discount_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_discount_form_page.dart) | Flutter Screen View |
| `pos_discount_list_page` | [`features/pos/presentation/pages/pos_discount_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_discount_list_page.dart) | Flutter Screen View |
| `pos_gift_card_detail_page` | [`features/pos/presentation/pages/pos_gift_card_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_gift_card_detail_page.dart) | Flutter Screen View |
| `pos_gift_card_form_page` | [`features/pos/presentation/pages/pos_gift_card_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_gift_card_form_page.dart) | Flutter Screen View |
| `pos_gift_card_list_page` | [`features/pos/presentation/pages/pos_gift_card_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_gift_card_list_page.dart) | Flutter Screen View |
| `pos_loyalty_member_detail_page` | [`features/pos/presentation/pages/pos_loyalty_member_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_loyalty_member_detail_page.dart) | Flutter Screen View |
| `pos_loyalty_member_list_page` | [`features/pos/presentation/pages/pos_loyalty_member_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_loyalty_member_list_page.dart) | Flutter Screen View |
| `pos_loyalty_program_detail_page` | [`features/pos/presentation/pages/pos_loyalty_program_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_loyalty_program_detail_page.dart) | Flutter Screen View |
| `pos_loyalty_program_form_page` | [`features/pos/presentation/pages/pos_loyalty_program_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_loyalty_program_form_page.dart) | Flutter Screen View |
| `pos_loyalty_program_list_page` | [`features/pos/presentation/pages/pos_loyalty_program_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_loyalty_program_list_page.dart) | Flutter Screen View |
| `pos_order_detail_page` | [`features/pos/presentation/pages/pos_order_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_order_detail_page.dart) | Flutter Screen View |
| `pos_order_form_page` | [`features/pos/presentation/pages/pos_order_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_order_form_page.dart) | Flutter Screen View |
| `pos_order_list_page` | [`features/pos/presentation/pages/pos_order_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_order_list_page.dart) | Flutter Screen View |
| `pos_price_list_detail_page` | [`features/pos/presentation/pages/pos_price_list_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_price_list_detail_page.dart) | Flutter Screen View |
| `pos_price_list_form_page` | [`features/pos/presentation/pages/pos_price_list_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_price_list_form_page.dart) | Flutter Screen View |
| `pos_price_list_list_page` | [`features/pos/presentation/pages/pos_price_list_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_price_list_list_page.dart) | Flutter Screen View |
| `pos_register_detail_page` | [`features/pos/presentation/pages/pos_register_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_register_detail_page.dart) | Flutter Screen View |
| `pos_register_form_page` | [`features/pos/presentation/pages/pos_register_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_register_form_page.dart) | Flutter Screen View |
| `pos_register_list_page` | [`features/pos/presentation/pages/pos_register_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_register_list_page.dart) | Flutter Screen View |
| `pos_shift_detail_page` | [`features/pos/presentation/pages/pos_shift_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_shift_detail_page.dart) | Flutter Screen View |
| `pos_shift_form_page` | [`features/pos/presentation/pages/pos_shift_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_shift_form_page.dart) | Flutter Screen View |
| `pos_shift_list_page` | [`features/pos/presentation/pages/pos_shift_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pos/presentation/pages/pos_shift_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `finance` (26 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `bank_account_detail_page` | [`features/finance/presentation/pages/bank_account_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/bank_account_detail_page.dart) | Flutter Screen View |
| `bank_account_form_page` | [`features/finance/presentation/pages/bank_account_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/bank_account_form_page.dart) | Flutter Screen View |
| `bank_account_list_page` | [`features/finance/presentation/pages/bank_account_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/bank_account_list_page.dart) | Flutter Screen View |
| `budget_detail_page` | [`features/finance/presentation/pages/budget_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/budget_detail_page.dart) | Flutter Screen View |
| `budget_form_page` | [`features/finance/presentation/pages/budget_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/budget_form_page.dart) | Flutter Screen View |
| `budget_list_page` | [`features/finance/presentation/pages/budget_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/budget_list_page.dart) | Flutter Screen View |
| `chart_of_account_detail_page` | [`features/finance/presentation/pages/chart_of_account_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/chart_of_account_detail_page.dart) | Flutter Screen View |
| `chart_of_account_form_page` | [`features/finance/presentation/pages/chart_of_account_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/chart_of_account_form_page.dart) | Flutter Screen View |
| `chart_of_account_list_page` | [`features/finance/presentation/pages/chart_of_account_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/chart_of_account_list_page.dart) | Flutter Screen View |
| `credit_note_detail_page` | [`features/finance/presentation/pages/credit_note_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/credit_note_detail_page.dart) | Flutter Screen View |
| `credit_note_form_page` | [`features/finance/presentation/pages/credit_note_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/credit_note_form_page.dart) | Flutter Screen View |
| `credit_note_list_page` | [`features/finance/presentation/pages/credit_note_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/credit_note_list_page.dart) | Flutter Screen View |
| `invoice_detail_page` | [`features/finance/presentation/pages/invoice_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/invoice_detail_page.dart) | Flutter Screen View |
| `invoice_list_page` | [`features/finance/presentation/pages/invoice_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/invoice_list_page.dart) | Flutter Screen View |
| `journal_entry_detail_page` | [`features/finance/presentation/pages/journal_entry_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/journal_entry_detail_page.dart) | Flutter Screen View |
| `journal_entry_form_page` | [`features/finance/presentation/pages/journal_entry_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/journal_entry_form_page.dart) | Flutter Screen View |
| `journal_entry_list_page` | [`features/finance/presentation/pages/journal_entry_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/journal_entry_list_page.dart) | Flutter Screen View |
| `payment_detail_page` | [`features/finance/presentation/pages/payment_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/payment_detail_page.dart) | Flutter Screen View |
| `payment_form_page` | [`features/finance/presentation/pages/payment_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/payment_form_page.dart) | Flutter Screen View |
| `payment_list_page` | [`features/finance/presentation/pages/payment_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/payment_list_page.dart) | Flutter Screen View |
| `tax_filing_detail_page` | [`features/finance/presentation/pages/tax_filing_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_filing_detail_page.dart) | Flutter Screen View |
| `tax_filing_form_page` | [`features/finance/presentation/pages/tax_filing_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_filing_form_page.dart) | Flutter Screen View |
| `tax_filing_list_page` | [`features/finance/presentation/pages/tax_filing_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_filing_list_page.dart) | Flutter Screen View |
| `tax_rate_detail_page` | [`features/finance/presentation/pages/tax_rate_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_rate_detail_page.dart) | Flutter Screen View |
| `tax_rate_form_page` | [`features/finance/presentation/pages/tax_rate_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_rate_form_page.dart) | Flutter Screen View |
| `tax_rate_list_page` | [`features/finance/presentation/pages/tax_rate_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/finance/presentation/pages/tax_rate_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `hr` (25 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `attendance_detail_page` | [`features/hr/presentation/pages/attendance_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/attendance_detail_page.dart) | Flutter Screen View |
| `attendance_form_page` | [`features/hr/presentation/pages/attendance_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/attendance_form_page.dart) | Flutter Screen View |
| `attendance_list_page` | [`features/hr/presentation/pages/attendance_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/attendance_list_page.dart) | Flutter Screen View |
| `department_detail_page` | [`features/hr/presentation/pages/department_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/department_detail_page.dart) | Flutter Screen View |
| `department_form_page` | [`features/hr/presentation/pages/department_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/department_form_page.dart) | Flutter Screen View |
| `department_list_page` | [`features/hr/presentation/pages/department_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/department_list_page.dart) | Flutter Screen View |
| `employee_detail_page` | [`features/hr/presentation/pages/employee_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/employee_detail_page.dart) | Flutter Screen View |
| `employee_list_page` | [`features/hr/presentation/pages/employee_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/employee_list_page.dart) | Flutter Screen View |
| `hr_dashboard_page` | [`features/hr/presentation/pages/hr_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/hr_dashboard_page.dart) | Flutter Screen View |
| `leave_request_form_page` | [`features/hr/presentation/pages/leave_request_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/leave_request_form_page.dart) | Flutter Screen View |
| `leave_request_list_page` | [`features/hr/presentation/pages/leave_request_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/leave_request_list_page.dart) | Flutter Screen View |
| `leave_type_detail_page` | [`features/hr/presentation/pages/leave_type_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/leave_type_detail_page.dart) | Flutter Screen View |
| `leave_type_form_page` | [`features/hr/presentation/pages/leave_type_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/leave_type_form_page.dart) | Flutter Screen View |
| `leave_type_list_page` | [`features/hr/presentation/pages/leave_type_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/leave_type_list_page.dart) | Flutter Screen View |
| `payroll_entry_detail_page` | [`features/hr/presentation/pages/payroll_entry_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/payroll_entry_detail_page.dart) | Flutter Screen View |
| `payroll_entry_list_page` | [`features/hr/presentation/pages/payroll_entry_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/payroll_entry_list_page.dart) | Flutter Screen View |
| `payroll_run_detail_page` | [`features/hr/presentation/pages/payroll_run_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/payroll_run_detail_page.dart) | Flutter Screen View |
| `payroll_run_form_page` | [`features/hr/presentation/pages/payroll_run_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/payroll_run_form_page.dart) | Flutter Screen View |
| `payroll_run_list_page` | [`features/hr/presentation/pages/payroll_run_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/payroll_run_list_page.dart) | Flutter Screen View |
| `performance_review_detail_page` | [`features/hr/presentation/pages/performance_review_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/performance_review_detail_page.dart) | Flutter Screen View |
| `performance_review_form_page` | [`features/hr/presentation/pages/performance_review_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/performance_review_form_page.dart) | Flutter Screen View |
| `performance_review_list_page` | [`features/hr/presentation/pages/performance_review_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/performance_review_list_page.dart) | Flutter Screen View |
| `timesheet_detail_page` | [`features/hr/presentation/pages/timesheet_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/timesheet_detail_page.dart) | Flutter Screen View |
| `timesheet_form_page` | [`features/hr/presentation/pages/timesheet_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/timesheet_form_page.dart) | Flutter Screen View |
| `timesheet_list_page` | [`features/hr/presentation/pages/timesheet_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/hr/presentation/pages/timesheet_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `manufacturing` (22 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `bom_detail_page` | [`features/manufacturing/presentation/pages/bom_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/bom_detail_page.dart) | Flutter Screen View |
| `bom_form_page` | [`features/manufacturing/presentation/pages/bom_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/bom_form_page.dart) | Flutter Screen View |
| `bom_list_page` | [`features/manufacturing/presentation/pages/bom_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/bom_list_page.dart) | Flutter Screen View |
| `eco_detail_page` | [`features/manufacturing/presentation/pages/eco_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/eco_detail_page.dart) | Flutter Screen View |
| `eco_form_page` | [`features/manufacturing/presentation/pages/eco_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/eco_form_page.dart) | Flutter Screen View |
| `eco_list_page` | [`features/manufacturing/presentation/pages/eco_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/eco_list_page.dart) | Flutter Screen View |
| `manufacturing_dashboard_page` | [`features/manufacturing/presentation/pages/manufacturing_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/manufacturing_dashboard_page.dart) | Flutter Screen View |
| `mrp_run_detail_page` | [`features/manufacturing/presentation/pages/mrp_run_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/mrp_run_detail_page.dart) | Flutter Screen View |
| `mrp_run_form_page` | [`features/manufacturing/presentation/pages/mrp_run_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/mrp_run_form_page.dart) | Flutter Screen View |
| `mrp_run_list_page` | [`features/manufacturing/presentation/pages/mrp_run_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/mrp_run_list_page.dart) | Flutter Screen View |
| `quality_inspection_detail_page` | [`features/manufacturing/presentation/pages/quality_inspection_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/quality_inspection_detail_page.dart) | Flutter Screen View |
| `quality_inspection_form_page` | [`features/manufacturing/presentation/pages/quality_inspection_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/quality_inspection_form_page.dart) | Flutter Screen View |
| `quality_inspection_list_page` | [`features/manufacturing/presentation/pages/quality_inspection_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/quality_inspection_list_page.dart) | Flutter Screen View |
| `routing_detail_page` | [`features/manufacturing/presentation/pages/routing_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/routing_detail_page.dart) | Flutter Screen View |
| `routing_form_page` | [`features/manufacturing/presentation/pages/routing_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/routing_form_page.dart) | Flutter Screen View |
| `routing_list_page` | [`features/manufacturing/presentation/pages/routing_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/routing_list_page.dart) | Flutter Screen View |
| `workstation_detail_page` | [`features/manufacturing/presentation/pages/workstation_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/workstation_detail_page.dart) | Flutter Screen View |
| `workstation_form_page` | [`features/manufacturing/presentation/pages/workstation_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/workstation_form_page.dart) | Flutter Screen View |
| `workstation_list_page` | [`features/manufacturing/presentation/pages/workstation_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/workstation_list_page.dart) | Flutter Screen View |
| `work_order_detail_page` | [`features/manufacturing/presentation/pages/work_order_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/work_order_detail_page.dart) | Flutter Screen View |
| `work_order_form_page` | [`features/manufacturing/presentation/pages/work_order_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/work_order_form_page.dart) | Flutter Screen View |
| `work_order_list_page` | [`features/manufacturing/presentation/pages/work_order_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/manufacturing/presentation/pages/work_order_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `procurement` (22 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `procurement_dashboard_page` | [`features/procurement/presentation/pages/procurement_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/procurement_dashboard_page.dart) | Flutter Screen View |
| `purchase_order_detail_page` | [`features/procurement/presentation/pages/purchase_order_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_order_detail_page.dart) | Flutter Screen View |
| `purchase_order_form_page` | [`features/procurement/presentation/pages/purchase_order_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_order_form_page.dart) | Flutter Screen View |
| `purchase_order_list_page` | [`features/procurement/presentation/pages/purchase_order_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_order_list_page.dart) | Flutter Screen View |
| `purchase_receipt_detail_page` | [`features/procurement/presentation/pages/purchase_receipt_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_receipt_detail_page.dart) | Flutter Screen View |
| `purchase_receipt_form_page` | [`features/procurement/presentation/pages/purchase_receipt_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_receipt_form_page.dart) | Flutter Screen View |
| `purchase_receipt_list_page` | [`features/procurement/presentation/pages/purchase_receipt_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_receipt_list_page.dart) | Flutter Screen View |
| `purchase_requisition_detail_page` | [`features/procurement/presentation/pages/purchase_requisition_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_requisition_detail_page.dart) | Flutter Screen View |
| `purchase_requisition_form_page` | [`features/procurement/presentation/pages/purchase_requisition_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_requisition_form_page.dart) | Flutter Screen View |
| `purchase_requisition_list_page` | [`features/procurement/presentation/pages/purchase_requisition_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/purchase_requisition_list_page.dart) | Flutter Screen View |
| `rfq_detail_page` | [`features/procurement/presentation/pages/rfq_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/rfq_detail_page.dart) | Flutter Screen View |
| `rfq_form_page` | [`features/procurement/presentation/pages/rfq_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/rfq_form_page.dart) | Flutter Screen View |
| `rfq_list_page` | [`features/procurement/presentation/pages/rfq_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/rfq_list_page.dart) | Flutter Screen View |
| `supplier_contract_detail_page` | [`features/procurement/presentation/pages/supplier_contract_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_contract_detail_page.dart) | Flutter Screen View |
| `supplier_contract_form_page` | [`features/procurement/presentation/pages/supplier_contract_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_contract_form_page.dart) | Flutter Screen View |
| `supplier_contract_list_page` | [`features/procurement/presentation/pages/supplier_contract_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_contract_list_page.dart) | Flutter Screen View |
| `supplier_quotation_detail_page` | [`features/procurement/presentation/pages/supplier_quotation_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_quotation_detail_page.dart) | Flutter Screen View |
| `supplier_quotation_form_page` | [`features/procurement/presentation/pages/supplier_quotation_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_quotation_form_page.dart) | Flutter Screen View |
| `supplier_quotation_list_page` | [`features/procurement/presentation/pages/supplier_quotation_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/supplier_quotation_list_page.dart) | Flutter Screen View |
| `vendor_detail_page` | [`features/procurement/presentation/pages/vendor_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/vendor_detail_page.dart) | Flutter Screen View |
| `vendor_form_page` | [`features/procurement/presentation/pages/vendor_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/vendor_form_page.dart) | Flutter Screen View |
| `vendor_list_page` | [`features/procurement/presentation/pages/vendor_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/procurement/presentation/pages/vendor_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `projects` (20 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `milestone_list_page` | [`features/projects/presentation/pages/milestone_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/milestone_list_page.dart) | Flutter Screen View |
| `project_budget_detail_page` | [`features/projects/presentation/pages/project_budget_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_budget_detail_page.dart) | Flutter Screen View |
| `project_budget_form_page` | [`features/projects/presentation/pages/project_budget_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_budget_form_page.dart) | Flutter Screen View |
| `project_budget_list_page` | [`features/projects/presentation/pages/project_budget_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_budget_list_page.dart) | Flutter Screen View |
| `project_dashboard_page` | [`features/projects/presentation/pages/project_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_dashboard_page.dart) | Flutter Screen View |
| `project_detail_page` | [`features/projects/presentation/pages/project_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_detail_page.dart) | Flutter Screen View |
| `project_form_page` | [`features/projects/presentation/pages/project_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_form_page.dart) | Flutter Screen View |
| `project_list_page` | [`features/projects/presentation/pages/project_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_list_page.dart) | Flutter Screen View |
| `project_milestone_form_page` | [`features/projects/presentation/pages/project_milestone_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_milestone_form_page.dart) | Flutter Screen View |
| `project_portfolio_detail_page` | [`features/projects/presentation/pages/project_portfolio_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_portfolio_detail_page.dart) | Flutter Screen View |
| `project_portfolio_form_page` | [`features/projects/presentation/pages/project_portfolio_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_portfolio_form_page.dart) | Flutter Screen View |
| `project_portfolio_list_page` | [`features/projects/presentation/pages/project_portfolio_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_portfolio_list_page.dart) | Flutter Screen View |
| `project_risk_detail_page` | [`features/projects/presentation/pages/project_risk_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_risk_detail_page.dart) | Flutter Screen View |
| `project_risk_form_page` | [`features/projects/presentation/pages/project_risk_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_risk_form_page.dart) | Flutter Screen View |
| `project_risk_list_page` | [`features/projects/presentation/pages/project_risk_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_risk_list_page.dart) | Flutter Screen View |
| `project_task_form_page` | [`features/projects/presentation/pages/project_task_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/project_task_form_page.dart) | Flutter Screen View |
| `task_list_page` | [`features/projects/presentation/pages/task_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/task_list_page.dart) | Flutter Screen View |
| `timesheet_detail_page` | [`features/projects/presentation/pages/timesheet_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/timesheet_detail_page.dart) | Flutter Screen View |
| `timesheet_form_page` | [`features/projects/presentation/pages/timesheet_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/timesheet_form_page.dart) | Flutter Screen View |
| `timesheet_list_page` | [`features/projects/presentation/pages/timesheet_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/projects/presentation/pages/timesheet_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `inventory` (19 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `inventory_adjustment_detail_page` | [`features/inventory/presentation/pages/inventory_adjustment_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/inventory_adjustment_detail_page.dart) | Flutter Screen View |
| `inventory_adjustment_form_page` | [`features/inventory/presentation/pages/inventory_adjustment_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/inventory_adjustment_form_page.dart) | Flutter Screen View |
| `inventory_adjustment_list_page` | [`features/inventory/presentation/pages/inventory_adjustment_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/inventory_adjustment_list_page.dart) | Flutter Screen View |
| `product_category_detail_page` | [`features/inventory/presentation/pages/product_category_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/product_category_detail_page.dart) | Flutter Screen View |
| `product_category_form_page` | [`features/inventory/presentation/pages/product_category_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/product_category_form_page.dart) | Flutter Screen View |
| `product_category_list_page` | [`features/inventory/presentation/pages/product_category_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/product_category_list_page.dart) | Flutter Screen View |
| `product_detail_page` | [`features/inventory/presentation/pages/product_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/product_detail_page.dart) | Flutter Screen View |
| `product_list_page` | [`features/inventory/presentation/pages/product_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/product_list_page.dart) | Flutter Screen View |
| `reorder_rule_detail_page` | [`features/inventory/presentation/pages/reorder_rule_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/reorder_rule_detail_page.dart) | Flutter Screen View |
| `reorder_rule_form_page` | [`features/inventory/presentation/pages/reorder_rule_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/reorder_rule_form_page.dart) | Flutter Screen View |
| `reorder_rule_list_page` | [`features/inventory/presentation/pages/reorder_rule_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/reorder_rule_list_page.dart) | Flutter Screen View |
| `stock_level_detail_page` | [`features/inventory/presentation/pages/stock_level_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/stock_level_detail_page.dart) | Flutter Screen View |
| `stock_level_list_page` | [`features/inventory/presentation/pages/stock_level_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/stock_level_list_page.dart) | Flutter Screen View |
| `stock_movement_detail_page` | [`features/inventory/presentation/pages/stock_movement_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/stock_movement_detail_page.dart) | Flutter Screen View |
| `stock_movement_form_page` | [`features/inventory/presentation/pages/stock_movement_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/stock_movement_form_page.dart) | Flutter Screen View |
| `stock_movement_list_page` | [`features/inventory/presentation/pages/stock_movement_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/stock_movement_list_page.dart) | Flutter Screen View |
| `warehouse_detail_page` | [`features/inventory/presentation/pages/warehouse_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/warehouse_detail_page.dart) | Flutter Screen View |
| `warehouse_form_page` | [`features/inventory/presentation/pages/warehouse_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/warehouse_form_page.dart) | Flutter Screen View |
| `warehouse_list_page` | [`features/inventory/presentation/pages/warehouse_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/inventory/presentation/pages/warehouse_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `sales` (18 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `delivery_note_detail_page` | [`features/sales/presentation/pages/delivery_note_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/delivery_note_detail_page.dart) | Flutter Screen View |
| `delivery_note_form_page` | [`features/sales/presentation/pages/delivery_note_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/delivery_note_form_page.dart) | Flutter Screen View |
| `delivery_note_list_page` | [`features/sales/presentation/pages/delivery_note_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/delivery_note_list_page.dart) | Flutter Screen View |
| `opportunity_detail_page` | [`features/sales/presentation/pages/opportunity_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/opportunity_detail_page.dart) | Flutter Screen View |
| `opportunity_form_page` | [`features/sales/presentation/pages/opportunity_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/opportunity_form_page.dart) | Flutter Screen View |
| `opportunity_list_page` | [`features/sales/presentation/pages/opportunity_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/opportunity_list_page.dart) | Flutter Screen View |
| `quotation_detail_page` | [`features/sales/presentation/pages/quotation_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/quotation_detail_page.dart) | Flutter Screen View |
| `quotation_form_page` | [`features/sales/presentation/pages/quotation_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/quotation_form_page.dart) | Flutter Screen View |
| `quotation_list_page` | [`features/sales/presentation/pages/quotation_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/quotation_list_page.dart) | Flutter Screen View |
| `sales_dashboard_page` | [`features/sales/presentation/pages/sales_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_dashboard_page.dart) | Flutter Screen View |
| `sales_forecast_page` | [`features/sales/presentation/pages/sales_forecast_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_forecast_page.dart) | Flutter Screen View |
| `sales_order_detail_page` | [`features/sales/presentation/pages/sales_order_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_order_detail_page.dart) | Flutter Screen View |
| `sales_order_form_page` | [`features/sales/presentation/pages/sales_order_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_order_form_page.dart) | Flutter Screen View |
| `sales_order_list_page` | [`features/sales/presentation/pages/sales_order_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_order_list_page.dart) | Flutter Screen View |
| `sales_pipeline_page` | [`features/sales/presentation/pages/sales_pipeline_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_pipeline_page.dart) | Flutter Screen View |
| `sales_return_detail_page` | [`features/sales/presentation/pages/sales_return_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_return_detail_page.dart) | Flutter Screen View |
| `sales_return_form_page` | [`features/sales/presentation/pages/sales_return_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_return_form_page.dart) | Flutter Screen View |
| `sales_return_list_page` | [`features/sales/presentation/pages/sales_return_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/sales/presentation/pages/sales_return_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `admin` (17 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `admin_api_key_detail_page` | [`features/admin/presentation/pages/admin_api_key_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_api_key_detail_page.dart) | Flutter Screen View |
| `admin_api_key_form_page` | [`features/admin/presentation/pages/admin_api_key_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_api_key_form_page.dart) | Flutter Screen View |
| `admin_api_key_list_page` | [`features/admin/presentation/pages/admin_api_key_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_api_key_list_page.dart) | Flutter Screen View |
| `admin_dashboard_page` | [`features/admin/presentation/pages/admin_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_dashboard_page.dart) | Flutter Screen View |
| `admin_role_detail_page` | [`features/admin/presentation/pages/admin_role_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_role_detail_page.dart) | Flutter Screen View |
| `admin_role_form_page` | [`features/admin/presentation/pages/admin_role_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_role_form_page.dart) | Flutter Screen View |
| `admin_role_list_page` | [`features/admin/presentation/pages/admin_role_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_role_list_page.dart) | Flutter Screen View |
| `admin_settings_detail_page` | [`features/admin/presentation/pages/admin_settings_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_settings_detail_page.dart) | Flutter Screen View |
| `admin_settings_list_page` | [`features/admin/presentation/pages/admin_settings_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_settings_list_page.dart) | Flutter Screen View |
| `admin_setting_edit_page` | [`features/admin/presentation/pages/admin_setting_edit_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_setting_edit_page.dart) | Flutter Screen View |
| `admin_system_health_page` | [`features/admin/presentation/pages/admin_system_health_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_system_health_page.dart) | Flutter Screen View |
| `admin_tenant_detail_page` | [`features/admin/presentation/pages/admin_tenant_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_tenant_detail_page.dart) | Flutter Screen View |
| `admin_tenant_form_page` | [`features/admin/presentation/pages/admin_tenant_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_tenant_form_page.dart) | Flutter Screen View |
| `admin_tenant_list_page` | [`features/admin/presentation/pages/admin_tenant_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_tenant_list_page.dart) | Flutter Screen View |
| `admin_user_form_page` | [`features/admin/presentation/pages/admin_user_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_user_form_page.dart) | Flutter Screen View |
| `admin_user_list_page` | [`features/admin/presentation/pages/admin_user_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/admin_user_list_page.dart) | Flutter Screen View |
| `audit_log_list_page` | [`features/admin/presentation/pages/audit_log_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/admin/presentation/pages/audit_log_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `supply_chain` (17 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `carrier_detail_page` | [`features/supply_chain/presentation/pages/carrier_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/carrier_detail_page.dart) | Flutter Screen View |
| `carrier_list_page` | [`features/supply_chain/presentation/pages/carrier_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/carrier_list_page.dart) | Flutter Screen View |
| `demand_forecast_list_page` | [`features/supply_chain/presentation/pages/demand_forecast_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/demand_forecast_list_page.dart) | Flutter Screen View |
| `dock_appointment_detail_page` | [`features/supply_chain/presentation/pages/dock_appointment_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/dock_appointment_detail_page.dart) | Flutter Screen View |
| `dock_appointment_form_page` | [`features/supply_chain/presentation/pages/dock_appointment_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/dock_appointment_form_page.dart) | Flutter Screen View |
| `dock_appointment_list_page` | [`features/supply_chain/presentation/pages/dock_appointment_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/dock_appointment_list_page.dart) | Flutter Screen View |
| `reorder_suggestion_list_page` | [`features/supply_chain/presentation/pages/reorder_suggestion_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/reorder_suggestion_list_page.dart) | Flutter Screen View |
| `shipment_detail_page` | [`features/supply_chain/presentation/pages/shipment_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/shipment_detail_page.dart) | Flutter Screen View |
| `shipment_list_page` | [`features/supply_chain/presentation/pages/shipment_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/shipment_list_page.dart) | Flutter Screen View |
| `supply_chain_dashboard_page` | [`features/supply_chain/presentation/pages/supply_chain_dashboard_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/supply_chain_dashboard_page.dart) | Flutter Screen View |
| `supply_chain_route_detail_page` | [`features/supply_chain/presentation/pages/supply_chain_route_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/supply_chain_route_detail_page.dart) | Flutter Screen View |
| `supply_chain_route_form_page` | [`features/supply_chain/presentation/pages/supply_chain_route_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/supply_chain_route_form_page.dart) | Flutter Screen View |
| `supply_chain_route_list_page` | [`features/supply_chain/presentation/pages/supply_chain_route_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/supply_chain_route_list_page.dart) | Flutter Screen View |
| `tracking_event_list_page` | [`features/supply_chain/presentation/pages/tracking_event_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/tracking_event_list_page.dart) | Flutter Screen View |
| `warehouse_transfer_detail_page` | [`features/supply_chain/presentation/pages/warehouse_transfer_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/warehouse_transfer_detail_page.dart) | Flutter Screen View |
| `warehouse_transfer_form_page` | [`features/supply_chain/presentation/pages/warehouse_transfer_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/warehouse_transfer_form_page.dart) | Flutter Screen View |
| `warehouse_transfer_list_page` | [`features/supply_chain/presentation/pages/warehouse_transfer_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/supply_chain/presentation/pages/warehouse_transfer_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `crm` (16 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `activity_detail_page` | [`features/crm/presentation/pages/activity_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/activity_detail_page.dart) | Flutter Screen View |
| `activity_form_page` | [`features/crm/presentation/pages/activity_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/activity_form_page.dart) | Flutter Screen View |
| `activity_list_page` | [`features/crm/presentation/pages/activity_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/activity_list_page.dart) | Flutter Screen View |
| `contact_detail_page` | [`features/crm/presentation/pages/contact_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/contact_detail_page.dart) | Flutter Screen View |
| `contact_form_page` | [`features/crm/presentation/pages/contact_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/contact_form_page.dart) | Flutter Screen View |
| `contact_list_page` | [`features/crm/presentation/pages/contact_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/contact_list_page.dart) | Flutter Screen View |
| `customer_detail_page` | [`features/crm/presentation/pages/customer_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/customer_detail_page.dart) | Flutter Screen View |
| `customer_form_page` | [`features/crm/presentation/pages/customer_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/customer_form_page.dart) | Flutter Screen View |
| `customer_list_page` | [`features/crm/presentation/pages/customer_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/customer_list_page.dart) | Flutter Screen View |
| `email_template_detail_page` | [`features/crm/presentation/pages/email_template_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/email_template_detail_page.dart) | Flutter Screen View |
| `email_template_form_page` | [`features/crm/presentation/pages/email_template_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/email_template_form_page.dart) | Flutter Screen View |
| `email_template_list_page` | [`features/crm/presentation/pages/email_template_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/email_template_list_page.dart) | Flutter Screen View |
| `lead_form_page` | [`features/crm/presentation/pages/lead_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/lead_form_page.dart) | Flutter Screen View |
| `lead_list_page` | [`features/crm/presentation/pages/lead_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/lead_list_page.dart) | Flutter Screen View |
| `lead_source_form_page` | [`features/crm/presentation/pages/lead_source_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/lead_source_form_page.dart) | Flutter Screen View |
| `lead_source_list_page` | [`features/crm/presentation/pages/lead_source_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/crm/presentation/pages/lead_source_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `ai` (12 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `model_detail_page` | [`features/ai/presentation/pages/model_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/model_detail_page.dart) | Flutter Screen View |
| `model_form_page` | [`features/ai/presentation/pages/model_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/model_form_page.dart) | Flutter Screen View |
| `model_list_page` | [`features/ai/presentation/pages/model_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/model_list_page.dart) | Flutter Screen View |
| `prediction_detail_page` | [`features/ai/presentation/pages/prediction_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prediction_detail_page.dart) | Flutter Screen View |
| `prediction_form_page` | [`features/ai/presentation/pages/prediction_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prediction_form_page.dart) | Flutter Screen View |
| `prediction_list_page` | [`features/ai/presentation/pages/prediction_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prediction_list_page.dart) | Flutter Screen View |
| `prompt_detail_page` | [`features/ai/presentation/pages/prompt_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prompt_detail_page.dart) | Flutter Screen View |
| `prompt_form_page` | [`features/ai/presentation/pages/prompt_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prompt_form_page.dart) | Flutter Screen View |
| `prompt_list_page` | [`features/ai/presentation/pages/prompt_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/prompt_list_page.dart) | Flutter Screen View |
| `training_data_detail_page` | [`features/ai/presentation/pages/training_data_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/training_data_detail_page.dart) | Flutter Screen View |
| `training_data_form_page` | [`features/ai/presentation/pages/training_data_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/training_data_form_page.dart) | Flutter Screen View |
| `training_data_list_page` | [`features/ai/presentation/pages/training_data_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ai/presentation/pages/training_data_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `reporting` (12 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `compliance_detail_page` | [`features/reporting/presentation/pages/compliance_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/compliance_detail_page.dart) | Flutter Screen View |
| `compliance_form_page` | [`features/reporting/presentation/pages/compliance_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/compliance_form_page.dart) | Flutter Screen View |
| `compliance_list_page` | [`features/reporting/presentation/pages/compliance_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/compliance_list_page.dart) | Flutter Screen View |
| `export_detail_page` | [`features/reporting/presentation/pages/export_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/export_detail_page.dart) | Flutter Screen View |
| `export_form_page` | [`features/reporting/presentation/pages/export_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/export_form_page.dart) | Flutter Screen View |
| `export_list_page` | [`features/reporting/presentation/pages/export_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/export_list_page.dart) | Flutter Screen View |
| `job_detail_page` | [`features/reporting/presentation/pages/job_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/job_detail_page.dart) | Flutter Screen View |
| `job_form_page` | [`features/reporting/presentation/pages/job_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/job_form_page.dart) | Flutter Screen View |
| `job_list_page` | [`features/reporting/presentation/pages/job_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/job_list_page.dart) | Flutter Screen View |
| `template_detail_page` | [`features/reporting/presentation/pages/template_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/template_detail_page.dart) | Flutter Screen View |
| `template_form_page` | [`features/reporting/presentation/pages/template_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/template_form_page.dart) | Flutter Screen View |
| `template_list_page` | [`features/reporting/presentation/pages/template_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/reporting/presentation/pages/template_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `saas` (12 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `plan_detail_page` | [`features/saas/presentation/pages/plan_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/plan_detail_page.dart) | Flutter Screen View |
| `saas_billing_detail_page` | [`features/saas/presentation/pages/saas_billing_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_billing_detail_page.dart) | Flutter Screen View |
| `saas_billing_form_page` | [`features/saas/presentation/pages/saas_billing_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_billing_form_page.dart) | Flutter Screen View |
| `saas_plan_detail_page` | [`features/saas/presentation/pages/saas_plan_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_plan_detail_page.dart) | Flutter Screen View |
| `saas_plan_form_page` | [`features/saas/presentation/pages/saas_plan_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_plan_form_page.dart) | Flutter Screen View |
| `saas_plan_list_page` | [`features/saas/presentation/pages/saas_plan_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_plan_list_page.dart) | Flutter Screen View |
| `saas_subscription_detail_page` | [`features/saas/presentation/pages/saas_subscription_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_subscription_detail_page.dart) | Flutter Screen View |
| `saas_subscription_form_page` | [`features/saas/presentation/pages/saas_subscription_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_subscription_form_page.dart) | Flutter Screen View |
| `saas_subscription_list_page` | [`features/saas/presentation/pages/saas_subscription_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_subscription_list_page.dart) | Flutter Screen View |
| `saas_tenant_detail_page` | [`features/saas/presentation/pages/saas_tenant_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_tenant_detail_page.dart) | Flutter Screen View |
| `saas_tenant_form_page` | [`features/saas/presentation/pages/saas_tenant_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_tenant_form_page.dart) | Flutter Screen View |
| `saas_tenant_list_page` | [`features/saas/presentation/pages/saas_tenant_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas/presentation/pages/saas_tenant_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `analytics` (11 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `dashboard_detail_page` | [`features/analytics/presentation/pages/dashboard_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/dashboard_detail_page.dart) | Flutter Screen View |
| `dashboard_form_page` | [`features/analytics/presentation/pages/dashboard_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/dashboard_form_page.dart) | Flutter Screen View |
| `dashboard_list_page` | [`features/analytics/presentation/pages/dashboard_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/dashboard_list_page.dart) | Flutter Screen View |
| `kpi_detail_page` | [`features/analytics/presentation/pages/kpi_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/kpi_detail_page.dart) | Flutter Screen View |
| `kpi_form_page` | [`features/analytics/presentation/pages/kpi_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/kpi_form_page.dart) | Flutter Screen View |
| `kpi_list_page` | [`features/analytics/presentation/pages/kpi_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/kpi_list_page.dart) | Flutter Screen View |
| `pipeline_detail_page` | [`features/analytics/presentation/pages/pipeline_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/pipeline_detail_page.dart) | Flutter Screen View |
| `pipeline_list_page` | [`features/analytics/presentation/pages/pipeline_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/pipeline_list_page.dart) | Flutter Screen View |
| `report_detail_page` | [`features/analytics/presentation/pages/report_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/report_detail_page.dart) | Flutter Screen View |
| `report_form_page` | [`features/analytics/presentation/pages/report_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/report_form_page.dart) | Flutter Screen View |
| `report_list_page` | [`features/analytics/presentation/pages/report_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/analytics/presentation/pages/report_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `education` (9 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `course_detail_page` | [`features/education/presentation/pages/course_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/course_detail_page.dart) | Flutter Screen View |
| `course_form_page` | [`features/education/presentation/pages/course_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/course_form_page.dart) | Flutter Screen View |
| `course_list_page` | [`features/education/presentation/pages/course_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/course_list_page.dart) | Flutter Screen View |
| `enrollment_form_page` | [`features/education/presentation/pages/enrollment_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/enrollment_form_page.dart) | Flutter Screen View |
| `exam_form_page` | [`features/education/presentation/pages/exam_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/exam_form_page.dart) | Flutter Screen View |
| `gradebook_form_page` | [`features/education/presentation/pages/gradebook_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/gradebook_form_page.dart) | Flutter Screen View |
| `student_detail_page` | [`features/education/presentation/pages/student_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/student_detail_page.dart) | Flutter Screen View |
| `student_form_page` | [`features/education/presentation/pages/student_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/student_form_page.dart) | Flutter Screen View |
| `student_list_page` | [`features/education/presentation/pages/student_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/education/presentation/pages/student_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `field_service` (9 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `contract_detail_page` | [`features/field_service/presentation/pages/contract_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/contract_detail_page.dart) | Flutter Screen View |
| `contract_form_page` | [`features/field_service/presentation/pages/contract_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/contract_form_page.dart) | Flutter Screen View |
| `schedule_form_page` | [`features/field_service/presentation/pages/schedule_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/schedule_form_page.dart) | Flutter Screen View |
| `service_ticket_list_page` | [`features/field_service/presentation/pages/service_ticket_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/service_ticket_list_page.dart) | Flutter Screen View |
| `technician_detail_page` | [`features/field_service/presentation/pages/technician_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/technician_detail_page.dart) | Flutter Screen View |
| `technician_form_page` | [`features/field_service/presentation/pages/technician_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/technician_form_page.dart) | Flutter Screen View |
| `technician_list_page` | [`features/field_service/presentation/pages/technician_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/technician_list_page.dart) | Flutter Screen View |
| `ticket_detail_page` | [`features/field_service/presentation/pages/ticket_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/ticket_detail_page.dart) | Flutter Screen View |
| `ticket_form_page` | [`features/field_service/presentation/pages/ticket_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/field_service/presentation/pages/ticket_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `healthcare` (9 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `appointment_detail_page` | [`features/healthcare/presentation/pages/appointment_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/appointment_detail_page.dart) | Flutter Screen View |
| `appointment_form_page` | [`features/healthcare/presentation/pages/appointment_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/appointment_form_page.dart) | Flutter Screen View |
| `appointment_list_page` | [`features/healthcare/presentation/pages/appointment_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/appointment_list_page.dart) | Flutter Screen View |
| `lab_order_form_page` | [`features/healthcare/presentation/pages/lab_order_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/lab_order_form_page.dart) | Flutter Screen View |
| `patient_detail_page` | [`features/healthcare/presentation/pages/patient_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/patient_detail_page.dart) | Flutter Screen View |
| `patient_form_page` | [`features/healthcare/presentation/pages/patient_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/patient_form_page.dart) | Flutter Screen View |
| `patient_list_page` | [`features/healthcare/presentation/pages/patient_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/patient_list_page.dart) | Flutter Screen View |
| `prescription_detail_page` | [`features/healthcare/presentation/pages/prescription_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/prescription_detail_page.dart) | Flutter Screen View |
| `prescription_form_page` | [`features/healthcare/presentation/pages/prescription_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/healthcare/presentation/pages/prescription_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `auth` (8 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `auth_profile_page` | [`features/auth/presentation/pages/auth_profile_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/auth_profile_page.dart) | Flutter Screen View |
| `auth_security_page` | [`features/auth/presentation/pages/auth_security_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/auth_security_page.dart) | Flutter Screen View |
| `auth_sessions_page` | [`features/auth/presentation/pages/auth_sessions_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/auth_sessions_page.dart) | Flutter Screen View |
| `login_page` | [`features/auth/presentation/pages/login_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/login_page.dart) | Flutter Screen View |
| `mfa_challenge_page` | [`features/auth/presentation/pages/mfa_challenge_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/mfa_challenge_page.dart) | Flutter Screen View |
| `register_page` | [`features/auth/presentation/pages/register_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/register_page.dart) | Flutter Screen View |
| `splash_page` | [`features/auth/presentation/pages/splash_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/splash_page.dart) | Flutter Screen View |
| `verify_email_pending_page` | [`features/auth/presentation/pages/verify_email_pending_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/auth/presentation/pages/verify_email_pending_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `communication` (7 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `channel_detail_page` | [`features/communication/presentation/pages/channel_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/channel_detail_page.dart) | Flutter Screen View |
| `channel_form_page` | [`features/communication/presentation/pages/channel_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/channel_form_page.dart) | Flutter Screen View |
| `meeting_form_page` | [`features/communication/presentation/pages/meeting_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/meeting_form_page.dart) | Flutter Screen View |
| `message_detail_page` | [`features/communication/presentation/pages/message_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/message_detail_page.dart) | Flutter Screen View |
| `message_list_page` | [`features/communication/presentation/pages/message_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/message_list_page.dart) | Flutter Screen View |
| `notification_list_page` | [`features/communication/presentation/pages/notification_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/notification_list_page.dart) | Flutter Screen View |
| `poll_form_page` | [`features/communication/presentation/pages/poll_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/communication/presentation/pages/poll_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `real_estate` (7 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `lease_detail_page` | [`features/real_estate/presentation/pages/lease_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/lease_detail_page.dart) | Flutter Screen View |
| `lease_form_page` | [`features/real_estate/presentation/pages/lease_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/lease_form_page.dart) | Flutter Screen View |
| `property_detail_page` | [`features/real_estate/presentation/pages/property_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/property_detail_page.dart) | Flutter Screen View |
| `property_form_page` | [`features/real_estate/presentation/pages/property_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/property_form_page.dart) | Flutter Screen View |
| `property_list_page` | [`features/real_estate/presentation/pages/property_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/property_list_page.dart) | Flutter Screen View |
| `tenant_detail_page` | [`features/real_estate/presentation/pages/tenant_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/tenant_detail_page.dart) | Flutter Screen View |
| `unit_form_page` | [`features/real_estate/presentation/pages/unit_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/real_estate/presentation/pages/unit_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `saas_portal` (7 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `billing_history_page` | [`features/saas_portal/presentation/pages/billing_history_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/billing_history_page.dart) | Flutter Screen View |
| `plan_detail_page` | [`features/saas_portal/presentation/pages/plan_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/plan_detail_page.dart) | Flutter Screen View |
| `portal_plan_list_page` | [`features/saas_portal/presentation/pages/portal_plan_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/portal_plan_list_page.dart) | Flutter Screen View |
| `portal_support_ticket_list_page` | [`features/saas_portal/presentation/pages/portal_support_ticket_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/portal_support_ticket_list_page.dart) | Flutter Screen View |
| `saas_portal_plan_detail_page` | [`features/saas_portal/presentation/pages/saas_portal_plan_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/saas_portal_plan_detail_page.dart) | Flutter Screen View |
| `saas_portal_support_ticket_detail_page` | [`features/saas_portal/presentation/pages/saas_portal_support_ticket_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/saas_portal_support_ticket_detail_page.dart) | Flutter Screen View |
| `saas_portal_support_ticket_form_page` | [`features/saas_portal/presentation/pages/saas_portal_support_ticket_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saas_portal/presentation/pages/saas_portal_support_ticket_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `advanced_finance` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `financial_close_task_detail_page` | [`features/advanced_finance/presentation/pages/financial_close_task_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/financial_close_task_detail_page.dart) | Flutter Screen View |
| `financial_close_task_form_page` | [`features/advanced_finance/presentation/pages/financial_close_task_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/financial_close_task_form_page.dart) | Flutter Screen View |
| `financial_close_task_list_page` | [`features/advanced_finance/presentation/pages/financial_close_task_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/financial_close_task_list_page.dart) | Flutter Screen View |
| `multi_currency_rate_detail_page` | [`features/advanced_finance/presentation/pages/multi_currency_rate_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/multi_currency_rate_detail_page.dart) | Flutter Screen View |
| `multi_currency_rate_form_page` | [`features/advanced_finance/presentation/pages/multi_currency_rate_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/multi_currency_rate_form_page.dart) | Flutter Screen View |
| `multi_currency_rate_list_page` | [`features/advanced_finance/presentation/pages/multi_currency_rate_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_finance/presentation/pages/multi_currency_rate_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `advanced_hr` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `compensation_band_detail_page` | [`features/advanced_hr/presentation/pages/compensation_band_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/compensation_band_detail_page.dart) | Flutter Screen View |
| `compensation_band_form_page` | [`features/advanced_hr/presentation/pages/compensation_band_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/compensation_band_form_page.dart) | Flutter Screen View |
| `compensation_band_list_page` | [`features/advanced_hr/presentation/pages/compensation_band_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/compensation_band_list_page.dart) | Flutter Screen View |
| `learning_path_detail_page` | [`features/advanced_hr/presentation/pages/learning_path_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/learning_path_detail_page.dart) | Flutter Screen View |
| `learning_path_form_page` | [`features/advanced_hr/presentation/pages/learning_path_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/learning_path_form_page.dart) | Flutter Screen View |
| `learning_path_list_page` | [`features/advanced_hr/presentation/pages/learning_path_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/advanced_hr/presentation/pages/learning_path_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `api_platform` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `api_key_detail_page` | [`features/api_platform/presentation/pages/api_key_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/api_key_detail_page.dart) | Flutter Screen View |
| `api_key_form_page` | [`features/api_platform/presentation/pages/api_key_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/api_key_form_page.dart) | Flutter Screen View |
| `api_key_list_page` | [`features/api_platform/presentation/pages/api_key_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/api_key_list_page.dart) | Flutter Screen View |
| `usage_log_detail_page` | [`features/api_platform/presentation/pages/usage_log_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/usage_log_detail_page.dart) | Flutter Screen View |
| `usage_log_list_page` | [`features/api_platform/presentation/pages/usage_log_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/usage_log_list_page.dart) | Flutter Screen View |
| `webhook_form_page` | [`features/api_platform/presentation/pages/webhook_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/api_platform/presentation/pages/webhook_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `builder` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `builder_form_detail_page` | [`features/builder/presentation/pages/builder_form_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/builder_form_detail_page.dart) | Flutter Screen View |
| `builder_form_form_page` | [`features/builder/presentation/pages/builder_form_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/builder_form_form_page.dart) | Flutter Screen View |
| `builder_form_list_page` | [`features/builder/presentation/pages/builder_form_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/builder_form_list_page.dart) | Flutter Screen View |
| `builder_page_detail_page` | [`features/builder/presentation/pages/builder_page_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/builder_page_detail_page.dart) | Flutter Screen View |
| `builder_page_form_page` | [`features/builder/presentation/pages/builder_page_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/builder_page_form_page.dart) | Flutter Screen View |
| `form_runtime_page` | [`features/builder/presentation/pages/form_runtime_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/builder/presentation/pages/form_runtime_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `documents` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `documents_list_page` | [`features/documents/presentation/pages/documents_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/documents_list_page.dart) | Flutter Screen View |
| `document_folders_list_page` | [`features/documents/presentation/pages/document_folders_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/document_folders_list_page.dart) | Flutter Screen View |
| `document_template_detail_page` | [`features/documents/presentation/pages/document_template_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/document_template_detail_page.dart) | Flutter Screen View |
| `document_template_form_page` | [`features/documents/presentation/pages/document_template_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/document_template_form_page.dart) | Flutter Screen View |
| `folder_detail_page` | [`features/documents/presentation/pages/folder_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/folder_detail_page.dart) | Flutter Screen View |
| `folder_form_page` | [`features/documents/presentation/pages/folder_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/documents/presentation/pages/folder_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `subscriptions` (6 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `billing_detail_page` | [`features/subscriptions/presentation/pages/billing_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/billing_detail_page.dart) | Flutter Screen View |
| `billing_form_page` | [`features/subscriptions/presentation/pages/billing_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/billing_form_page.dart) | Flutter Screen View |
| `plan_detail_page` | [`features/subscriptions/presentation/pages/plan_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/plan_detail_page.dart) | Flutter Screen View |
| `plan_form_page` | [`features/subscriptions/presentation/pages/plan_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/plan_form_page.dart) | Flutter Screen View |
| `subscription_billing_list_page` | [`features/subscriptions/presentation/pages/subscription_billing_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/subscription_billing_list_page.dart) | Flutter Screen View |
| `subscription_plan_list_page` | [`features/subscriptions/presentation/pages/subscription_plan_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/subscriptions/presentation/pages/subscription_plan_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `blockchain` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `blockchain_contract_list_page` | [`features/blockchain/presentation/pages/blockchain_contract_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/blockchain/presentation/pages/blockchain_contract_list_page.dart) | Flutter Screen View |
| `blockchain_transaction_list_page` | [`features/blockchain/presentation/pages/blockchain_transaction_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/blockchain/presentation/pages/blockchain_transaction_list_page.dart) | Flutter Screen View |
| `contract_detail_page` | [`features/blockchain/presentation/pages/contract_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/blockchain/presentation/pages/contract_detail_page.dart) | Flutter Screen View |
| `contract_form_page` | [`features/blockchain/presentation/pages/contract_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/blockchain/presentation/pages/contract_form_page.dart) | Flutter Screen View |
| `transaction_detail_page` | [`features/blockchain/presentation/pages/transaction_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/blockchain/presentation/pages/transaction_detail_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `ecommerce` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `category_form_page` | [`features/ecommerce/presentation/pages/category_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ecommerce/presentation/pages/category_form_page.dart) | Flutter Screen View |
| `ecommerce_product_list_page` | [`features/ecommerce/presentation/pages/ecommerce_product_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ecommerce/presentation/pages/ecommerce_product_list_page.dart) | Flutter Screen View |
| `order_detail_page` | [`features/ecommerce/presentation/pages/order_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ecommerce/presentation/pages/order_detail_page.dart) | Flutter Screen View |
| `product_detail_page` | [`features/ecommerce/presentation/pages/product_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ecommerce/presentation/pages/product_detail_page.dart) | Flutter Screen View |
| `product_form_page` | [`features/ecommerce/presentation/pages/product_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/ecommerce/presentation/pages/product_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `fixed_assets` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `asset_detail_page` | [`features/fixed_assets/presentation/pages/asset_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/fixed_assets/presentation/pages/asset_detail_page.dart) | Flutter Screen View |
| `asset_form_page` | [`features/fixed_assets/presentation/pages/asset_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/fixed_assets/presentation/pages/asset_form_page.dart) | Flutter Screen View |
| `disposal_form_page` | [`features/fixed_assets/presentation/pages/disposal_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/fixed_assets/presentation/pages/disposal_form_page.dart) | Flutter Screen View |
| `fixed_asset_list_page` | [`features/fixed_assets/presentation/pages/fixed_asset_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/fixed_assets/presentation/pages/fixed_asset_list_page.dart) | Flutter Screen View |
| `maintenance_form_page` | [`features/fixed_assets/presentation/pages/maintenance_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/fixed_assets/presentation/pages/maintenance_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `people` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `person_detail_page` | [`features/people/presentation/pages/person_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/people/presentation/pages/person_detail_page.dart) | Flutter Screen View |
| `person_form_page` | [`features/people/presentation/pages/person_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/people/presentation/pages/person_form_page.dart) | Flutter Screen View |
| `person_list_page` | [`features/people/presentation/pages/person_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/people/presentation/pages/person_list_page.dart) | Flutter Screen View |
| `recognition_form_page` | [`features/people/presentation/pages/recognition_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/people/presentation/pages/recognition_form_page.dart) | Flutter Screen View |
| `team_form_page` | [`features/people/presentation/pages/team_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/people/presentation/pages/team_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `search` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `search_config_form_page` | [`features/search/presentation/pages/search_config_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/search/presentation/pages/search_config_form_page.dart) | Flutter Screen View |
| `search_config_page` | [`features/search/presentation/pages/search_config_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/search/presentation/pages/search_config_page.dart) | Flutter Screen View |
| `search_result_page` | [`features/search/presentation/pages/search_result_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/search/presentation/pages/search_result_page.dart) | Flutter Screen View |
| `search_synonym_list_page` | [`features/search/presentation/pages/search_synonym_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/search/presentation/pages/search_synonym_list_page.dart) | Flutter Screen View |
| `synonym_form_page` | [`features/search/presentation/pages/synonym_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/search/presentation/pages/synonym_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `service_management` (5 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `catalog_item_detail_page` | [`features/service_management/presentation/pages/catalog_item_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/service_management/presentation/pages/catalog_item_detail_page.dart) | Flutter Screen View |
| `service_catalog_list_page` | [`features/service_management/presentation/pages/service_catalog_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/service_management/presentation/pages/service_catalog_list_page.dart) | Flutter Screen View |
| `service_request_detail_page` | [`features/service_management/presentation/pages/service_request_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/service_management/presentation/pages/service_request_detail_page.dart) | Flutter Screen View |
| `service_request_list_page` | [`features/service_management/presentation/pages/service_request_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/service_management/presentation/pages/service_request_list_page.dart) | Flutter Screen View |
| `sla_detail_page` | [`features/service_management/presentation/pages/sla_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/service_management/presentation/pages/sla_detail_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `localization` (4 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `language_detail_page` | [`features/localization/presentation/pages/language_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/localization/presentation/pages/language_detail_page.dart) | Flutter Screen View |
| `language_form_page` | [`features/localization/presentation/pages/language_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/localization/presentation/pages/language_form_page.dart) | Flutter Screen View |
| `language_list_page` | [`features/localization/presentation/pages/language_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/localization/presentation/pages/language_list_page.dart) | Flutter Screen View |
| `translation_form_page` | [`features/localization/presentation/pages/translation_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/localization/presentation/pages/translation_form_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `marketplace` (4 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `app_detail_page` | [`features/marketplace/presentation/pages/app_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/marketplace/presentation/pages/app_detail_page.dart) | Flutter Screen View |
| `app_form_page` | [`features/marketplace/presentation/pages/app_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/marketplace/presentation/pages/app_form_page.dart) | Flutter Screen View |
| `marketplace_app_list_page` | [`features/marketplace/presentation/pages/marketplace_app_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/marketplace/presentation/pages/marketplace_app_list_page.dart) | Flutter Screen View |
| `marketplace_submission_list_page` | [`features/marketplace/presentation/pages/marketplace_submission_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/marketplace/presentation/pages/marketplace_submission_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `pwa` (4 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `manifest_form_page` | [`features/pwa/presentation/pages/manifest_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pwa/presentation/pages/manifest_form_page.dart) | Flutter Screen View |
| `offline_queue_page` | [`features/pwa/presentation/pages/offline_queue_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pwa/presentation/pages/offline_queue_page.dart) | Flutter Screen View |
| `push_subscription_detail_page` | [`features/pwa/presentation/pages/push_subscription_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pwa/presentation/pages/push_subscription_detail_page.dart) | Flutter Screen View |
| `push_subscription_list_page` | [`features/pwa/presentation/pages/push_subscription_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/pwa/presentation/pages/push_subscription_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `storage` (4 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `bucket_detail_page` | [`features/storage/presentation/pages/bucket_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/storage/presentation/pages/bucket_detail_page.dart) | Flutter Screen View |
| `bucket_form_page` | [`features/storage/presentation/pages/bucket_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/storage/presentation/pages/bucket_form_page.dart) | Flutter Screen View |
| `bucket_list_page` | [`features/storage/presentation/pages/bucket_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/storage/presentation/pages/bucket_list_page.dart) | Flutter Screen View |
| `file_list_page` | [`features/storage/presentation/pages/file_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/storage/presentation/pages/file_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `widgets` (3 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `form_page` | [`core/widgets/form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/core/widgets/form_page.dart) | Flutter Screen View |
| `paginated_list_view` | [`core/widgets/paginated_list_view.dart`](file:///d:/UniERP/unierp-mobile/lib/core/widgets/paginated_list_view.dart) | Flutter Screen View |
| `tabbed_detail_view` | [`core/widgets/tabbed_detail_view.dart`](file:///d:/UniERP/unierp-mobile/lib/core/widgets/tabbed_detail_view.dart) | Flutter Screen View |

### 📱 Mobile Module: `drive` (3 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `drive_file_list_page` | [`features/drive/presentation/pages/drive_file_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/drive/presentation/pages/drive_file_list_page.dart) | Flutter Screen View |
| `drive_folder_list_page` | [`features/drive/presentation/pages/drive_folder_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/drive/presentation/pages/drive_folder_list_page.dart) | Flutter Screen View |
| `file_detail_page` | [`features/drive/presentation/pages/file_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/drive/presentation/pages/file_detail_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `saved_views` (3 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `saved_view_detail_page` | [`features/saved_views/presentation/pages/saved_view_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saved_views/presentation/pages/saved_view_detail_page.dart) | Flutter Screen View |
| `saved_view_form_page` | [`features/saved_views/presentation/pages/saved_view_form_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saved_views/presentation/pages/saved_view_form_page.dart) | Flutter Screen View |
| `saved_view_list_page` | [`features/saved_views/presentation/pages/saved_view_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/saved_views/presentation/pages/saved_view_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `workflow` (3 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `workflow_approval_list_page` | [`features/workflow/presentation/pages/workflow_approval_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/workflow/presentation/pages/workflow_approval_list_page.dart) | Flutter Screen View |
| `workflow_detail_page` | [`features/workflow/presentation/pages/workflow_detail_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/workflow/presentation/pages/workflow_detail_page.dart) | Flutter Screen View |
| `workflow_list_page` | [`features/workflow/presentation/pages/workflow_list_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/workflow/presentation/pages/workflow_list_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `notifications` (2 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `notifications_page` | [`features/notifications/presentation/pages/notifications_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/notifications/presentation/pages/notifications_page.dart) | Flutter Screen View |
| `notification_preferences_page` | [`features/notifications/presentation/pages/notification_preferences_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/notifications/presentation/pages/notification_preferences_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `home` (1 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `home_page` | [`features/home/presentation/pages/home_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/home/presentation/pages/home_page.dart) | Flutter Screen View |

### 📱 Mobile Module: `onboarding` (1 screens)

| Screen Name | File Path | Mobile Functionality |
| :--- | :--- | :--- |
| `onboarding_page` | [`features/onboarding/presentation/pages/onboarding_page.dart`](file:///d:/UniERP/unierp-mobile/lib/features/onboarding/presentation/pages/onboarding_page.dart) | Flutter Screen View |


---

## 💻 Desktop Client: `desktop-app` (`@kannan19302/desktop-app`)
- **Architecture**: Electron / Tauri Desktop container wrapping UniERP presentation.
- **Features**: Native OS system tray, direct hardware thermal printer integration, offline POS caching, multi-window support.
