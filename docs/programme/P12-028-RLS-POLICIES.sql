-- P12-028: Mechanically Generated Row Level Security (RLS) Policies
-- Generated from unierp-data Prisma schema definitions
-- Total Tenant Tables: 1820
-- IDEMPOTENT EXECUTION

CREATE OR REPLACE FUNCTION current_tenant_id() RETURNS text AS $$
  SELECT NULLIF(current_setting('app.current_tenant_id', true), '');
$$ LANGUAGE sql STABLE;
-- RLS Policy for ABTestCampaign (ab_test_campaigns)
ALTER TABLE "ab_test_campaigns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ab_test_campaigns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ab_test_campaigns" ON "ab_test_campaigns";
CREATE POLICY "tenant_isolation_ab_test_campaigns" ON "ab_test_campaigns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ABTestResult (ab_test_results)
ALTER TABLE "ab_test_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ab_test_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ab_test_results" ON "ab_test_results";
CREATE POLICY "tenant_isolation_ab_test_results" ON "ab_test_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AbTestVariant (ab_test_variants)
ALTER TABLE "ab_test_variants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ab_test_variants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ab_test_variants" ON "ab_test_variants";
CREATE POLICY "tenant_isolation_ab_test_variants" ON "ab_test_variants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AbTest (ab_tests)
ALTER TABLE "ab_tests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ab_tests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ab_tests" ON "ab_tests";
CREATE POLICY "tenant_isolation_ab_tests" ON "ab_tests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccessPackage (access_packages)
ALTER TABLE "access_packages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "access_packages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_access_packages" ON "access_packages";
CREATE POLICY "tenant_isolation_access_packages" ON "access_packages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountPlan (account_plans)
ALTER TABLE "account_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "account_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_account_plans" ON "account_plans";
CREATE POLICY "tenant_isolation_account_plans" ON "account_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountScore (account_scores)
ALTER TABLE "account_scores" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "account_scores" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_account_scores" ON "account_scores";
CREATE POLICY "tenant_isolation_account_scores" ON "account_scores"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountTeamMember (account_team_members)
ALTER TABLE "account_team_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "account_team_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_account_team_members" ON "account_team_members";
CREATE POLICY "tenant_isolation_account_team_members" ON "account_team_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountTeam (account_teams)
ALTER TABLE "account_teams" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "account_teams" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_account_teams" ON "account_teams";
CREATE POLICY "tenant_isolation_account_teams" ON "account_teams"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountingBookRule (accounting_book_rules)
ALTER TABLE "accounting_book_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "accounting_book_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_accounting_book_rules" ON "accounting_book_rules";
CREATE POLICY "tenant_isolation_accounting_book_rules" ON "accounting_book_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AccountingBook (accounting_books)
ALTER TABLE "accounting_books" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "accounting_books" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_accounting_books" ON "accounting_books";
CREATE POLICY "tenant_isolation_accounting_books" ON "accounting_books"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Account (accounts)
ALTER TABLE "accounts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "accounts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_accounts" ON "accounts";
CREATE POLICY "tenant_isolation_accounts" ON "accounts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Activity (activities)
ALTER TABLE "activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_activities" ON "activities";
CREATE POLICY "tenant_isolation_activities" ON "activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdminAlert (admin_alerts)
ALTER TABLE "admin_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "admin_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_admin_alerts" ON "admin_alerts";
CREATE POLICY "tenant_isolation_admin_alerts" ON "admin_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvanceShippingNotice (advance_shipping_notices)
ALTER TABLE "advance_shipping_notices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advance_shipping_notices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advance_shipping_notices" ON "advance_shipping_notices";
CREATE POLICY "tenant_isolation_advance_shipping_notices" ON "advance_shipping_notices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedForm (advanced_forms)
ALTER TABLE "advanced_forms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_forms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_forms" ON "advanced_forms";
CREATE POLICY "tenant_isolation_advanced_forms" ON "advanced_forms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrBenefitsEnrollment (advanced_hr_benefits_enrollments)
ALTER TABLE "advanced_hr_benefits_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_benefits_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_benefits_enrollments" ON "advanced_hr_benefits_enrollments";
CREATE POLICY "tenant_isolation_advanced_hr_benefits_enrollments" ON "advanced_hr_benefits_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrBenefitsPlanDeep (advanced_hr_benefits_plans_deep)
ALTER TABLE "advanced_hr_benefits_plans_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_benefits_plans_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_benefits_plans_deep" ON "advanced_hr_benefits_plans_deep";
CREATE POLICY "tenant_isolation_advanced_hr_benefits_plans_deep" ON "advanced_hr_benefits_plans_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrCompensationBandDeep (advanced_hr_compensation_bands_deep)
ALTER TABLE "advanced_hr_compensation_bands_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_compensation_bands_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_compensation_bands_deep" ON "advanced_hr_compensation_bands_deep";
CREATE POLICY "tenant_isolation_advanced_hr_compensation_bands_deep" ON "advanced_hr_compensation_bands_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrExitInterviewDeep (advanced_hr_exit_interviews_deep)
ALTER TABLE "advanced_hr_exit_interviews_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_exit_interviews_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_exit_interviews_deep" ON "advanced_hr_exit_interviews_deep";
CREATE POLICY "tenant_isolation_advanced_hr_exit_interviews_deep" ON "advanced_hr_exit_interviews_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrLearningEnrollment (advanced_hr_learning_enrollments)
ALTER TABLE "advanced_hr_learning_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_learning_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_learning_enrollments" ON "advanced_hr_learning_enrollments";
CREATE POLICY "tenant_isolation_advanced_hr_learning_enrollments" ON "advanced_hr_learning_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrLearningPathDeep (advanced_hr_learning_paths_deep)
ALTER TABLE "advanced_hr_learning_paths_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_learning_paths_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_learning_paths_deep" ON "advanced_hr_learning_paths_deep";
CREATE POLICY "tenant_isolation_advanced_hr_learning_paths_deep" ON "advanced_hr_learning_paths_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrOrgChartNodeDeep (advanced_hr_org_chart_nodes_deep)
ALTER TABLE "advanced_hr_org_chart_nodes_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_org_chart_nodes_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_org_chart_nodes_deep" ON "advanced_hr_org_chart_nodes_deep";
CREATE POLICY "tenant_isolation_advanced_hr_org_chart_nodes_deep" ON "advanced_hr_org_chart_nodes_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrSuccessionCandidate (advanced_hr_succession_candidates)
ALTER TABLE "advanced_hr_succession_candidates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_succession_candidates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_succession_candidates" ON "advanced_hr_succession_candidates";
CREATE POLICY "tenant_isolation_advanced_hr_succession_candidates" ON "advanced_hr_succession_candidates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrSuccessionPlan (advanced_hr_succession_plans)
ALTER TABLE "advanced_hr_succession_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_succession_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_succession_plans" ON "advanced_hr_succession_plans";
CREATE POLICY "tenant_isolation_advanced_hr_succession_plans" ON "advanced_hr_succession_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AdvancedHrWorkforceAnalyticsDeep (advanced_hr_workforce_analytics_deep)
ALTER TABLE "advanced_hr_workforce_analytics_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "advanced_hr_workforce_analytics_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_advanced_hr_workforce_analytics_deep" ON "advanced_hr_workforce_analytics_deep";
CREATE POLICY "tenant_isolation_advanced_hr_workforce_analytics_deep" ON "advanced_hr_workforce_analytics_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AgileBacklogItem (agile_backlog_items)
ALTER TABLE "agile_backlog_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "agile_backlog_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_agile_backlog_items" ON "agile_backlog_items";
CREATE POLICY "tenant_isolation_agile_backlog_items" ON "agile_backlog_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AgileRetrospective (agile_retrospectives)
ALTER TABLE "agile_retrospectives" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "agile_retrospectives" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_agile_retrospectives" ON "agile_retrospectives";
CREATE POLICY "tenant_isolation_agile_retrospectives" ON "agile_retrospectives"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AgileSprintItem (agile_sprint_items)
ALTER TABLE "agile_sprint_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "agile_sprint_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_agile_sprint_items" ON "agile_sprint_items";
CREATE POLICY "tenant_isolation_agile_sprint_items" ON "agile_sprint_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AgileSprint (agile_sprints)
ALTER TABLE "agile_sprints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "agile_sprints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_agile_sprints" ON "agile_sprints";
CREATE POLICY "tenant_isolation_agile_sprints" ON "agile_sprints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiAgentTool (ai_agent_tools)
ALTER TABLE "ai_agent_tools" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_agent_tools" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_agent_tools" ON "ai_agent_tools";
CREATE POLICY "tenant_isolation_ai_agent_tools" ON "ai_agent_tools"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiAgent (ai_agents)
ALTER TABLE "ai_agents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_agents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_agents" ON "ai_agents";
CREATE POLICY "tenant_isolation_ai_agents" ON "ai_agents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiConversationMessage (ai_conversation_messages)
ALTER TABLE "ai_conversation_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_conversation_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_conversation_messages" ON "ai_conversation_messages";
CREATE POLICY "tenant_isolation_ai_conversation_messages" ON "ai_conversation_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiConversation (ai_conversations)
ALTER TABLE "ai_conversations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_conversations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_conversations" ON "ai_conversations";
CREATE POLICY "tenant_isolation_ai_conversations" ON "ai_conversations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiDocumentChunk (ai_document_chunks)
ALTER TABLE "ai_document_chunks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_document_chunks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_document_chunks" ON "ai_document_chunks";
CREATE POLICY "tenant_isolation_ai_document_chunks" ON "ai_document_chunks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiDocument (ai_documents)
ALTER TABLE "ai_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_documents" ON "ai_documents";
CREATE POLICY "tenant_isolation_ai_documents" ON "ai_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiEmbedding (ai_embeddings)
ALTER TABLE "ai_embeddings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_embeddings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_embeddings" ON "ai_embeddings";
CREATE POLICY "tenant_isolation_ai_embeddings" ON "ai_embeddings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiForecastScenarioLine (ai_forecast_scenario_lines)
ALTER TABLE "ai_forecast_scenario_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_forecast_scenario_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_forecast_scenario_lines" ON "ai_forecast_scenario_lines";
CREATE POLICY "tenant_isolation_ai_forecast_scenario_lines" ON "ai_forecast_scenario_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiForecastScenario (ai_forecast_scenarios)
ALTER TABLE "ai_forecast_scenarios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_forecast_scenarios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_forecast_scenarios" ON "ai_forecast_scenarios";
CREATE POLICY "tenant_isolation_ai_forecast_scenarios" ON "ai_forecast_scenarios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiIntentTrainingExample (ai_intent_training_examples)
ALTER TABLE "ai_intent_training_examples" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_intent_training_examples" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_intent_training_examples" ON "ai_intent_training_examples";
CREATE POLICY "tenant_isolation_ai_intent_training_examples" ON "ai_intent_training_examples"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiModelAccuracyMetric (ai_model_accuracy_metrics)
ALTER TABLE "ai_model_accuracy_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_model_accuracy_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_model_accuracy_metrics" ON "ai_model_accuracy_metrics";
CREATE POLICY "tenant_isolation_ai_model_accuracy_metrics" ON "ai_model_accuracy_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiModelDeployment (ai_model_deployments)
ALTER TABLE "ai_model_deployments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_model_deployments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_model_deployments" ON "ai_model_deployments";
CREATE POLICY "tenant_isolation_ai_model_deployments" ON "ai_model_deployments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiModel (ai_models)
ALTER TABLE "ai_models" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_models" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_models" ON "ai_models";
CREATE POLICY "tenant_isolation_ai_models" ON "ai_models"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiNluEntity (ai_nlu_entities)
ALTER TABLE "ai_nlu_entities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_nlu_entities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_nlu_entities" ON "ai_nlu_entities";
CREATE POLICY "tenant_isolation_ai_nlu_entities" ON "ai_nlu_entities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiPrompt (ai_prompts)
ALTER TABLE "ai_prompts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_prompts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_prompts" ON "ai_prompts";
CREATE POLICY "tenant_isolation_ai_prompts" ON "ai_prompts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiTrainingJob (ai_training_jobs)
ALTER TABLE "ai_training_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_training_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_training_jobs" ON "ai_training_jobs";
CREATE POLICY "tenant_isolation_ai_training_jobs" ON "ai_training_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AiTrainingRun (ai_training_runs)
ALTER TABLE "ai_training_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ai_training_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ai_training_runs" ON "ai_training_runs";
CREATE POLICY "tenant_isolation_ai_training_runs" ON "ai_training_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AlertThreshold (alert_thresholds)
ALTER TABLE "alert_thresholds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "alert_thresholds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_alert_thresholds" ON "alert_thresholds";
CREATE POLICY "tenant_isolation_alert_thresholds" ON "alert_thresholds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AllocationRule (allocation_rules)
ALTER TABLE "allocation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "allocation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_allocation_rules" ON "allocation_rules";
CREATE POLICY "tenant_isolation_allocation_rules" ON "allocation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AllocationRun (allocation_runs)
ALTER TABLE "allocation_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "allocation_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_allocation_runs" ON "allocation_runs";
CREATE POLICY "tenant_isolation_allocation_runs" ON "allocation_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AlternativeSourcing (alternative_sourcing)
ALTER TABLE "alternative_sourcing" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "alternative_sourcing" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_alternative_sourcing" ON "alternative_sourcing";
CREATE POLICY "tenant_isolation_alternative_sourcing" ON "alternative_sourcing"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AlumniEventAttendee (alumni_event_attendees)
ALTER TABLE "alumni_event_attendees" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "alumni_event_attendees" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_alumni_event_attendees" ON "alumni_event_attendees";
CREATE POLICY "tenant_isolation_alumni_event_attendees" ON "alumni_event_attendees"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AlumniEvent (alumni_events)
ALTER TABLE "alumni_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "alumni_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_alumni_events" ON "alumni_events";
CREATE POLICY "tenant_isolation_alumni_events" ON "alumni_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AlumniRecord (alumni_records)
ALTER TABLE "alumni_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "alumni_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_alumni_records" ON "alumni_records";
CREATE POLICY "tenant_isolation_alumni_records" ON "alumni_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AmendedTaxFiling (amended_tax_filings)
ALTER TABLE "amended_tax_filings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "amended_tax_filings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_amended_tax_filings" ON "amended_tax_filings";
CREATE POLICY "tenant_isolation_amended_tax_filings" ON "amended_tax_filings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsBiMetricDefinition (analytics_bi_metric_definitions)
ALTER TABLE "analytics_bi_metric_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_bi_metric_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_bi_metric_definitions" ON "analytics_bi_metric_definitions";
CREATE POLICY "tenant_isolation_analytics_bi_metric_definitions" ON "analytics_bi_metric_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsCohortAnalysis (analytics_cohort_analyses)
ALTER TABLE "analytics_cohort_analyses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_cohort_analyses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_cohort_analyses" ON "analytics_cohort_analyses";
CREATE POLICY "tenant_isolation_analytics_cohort_analyses" ON "analytics_cohort_analyses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsCohortGroup (analytics_cohort_groups)
ALTER TABLE "analytics_cohort_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_cohort_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_cohort_groups" ON "analytics_cohort_groups";
CREATE POLICY "tenant_isolation_analytics_cohort_groups" ON "analytics_cohort_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsCrossFilterDashboard (analytics_cross_filter_dashboards)
ALTER TABLE "analytics_cross_filter_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_cross_filter_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_cross_filter_dashboards" ON "analytics_cross_filter_dashboards";
CREATE POLICY "tenant_isolation_analytics_cross_filter_dashboards" ON "analytics_cross_filter_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsCustomDashboard (analytics_custom_dashboards)
ALTER TABLE "analytics_custom_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_custom_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_custom_dashboards" ON "analytics_custom_dashboards";
CREATE POLICY "tenant_isolation_analytics_custom_dashboards" ON "analytics_custom_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsDashboardWidget (analytics_dashboard_widgets)
ALTER TABLE "analytics_dashboard_widgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_dashboard_widgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_dashboard_widgets" ON "analytics_dashboard_widgets";
CREATE POLICY "tenant_isolation_analytics_dashboard_widgets" ON "analytics_dashboard_widgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsDataDataset (analytics_data_datasets)
ALTER TABLE "analytics_data_datasets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_data_datasets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_data_datasets" ON "analytics_data_datasets";
CREATE POLICY "tenant_isolation_analytics_data_datasets" ON "analytics_data_datasets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsDataPipeline (analytics_data_pipelines)
ALTER TABLE "analytics_data_pipelines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_data_pipelines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_data_pipelines" ON "analytics_data_pipelines";
CREATE POLICY "tenant_isolation_analytics_data_pipelines" ON "analytics_data_pipelines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsForecastRun (analytics_forecast_runs)
ALTER TABLE "analytics_forecast_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_forecast_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_forecast_runs" ON "analytics_forecast_runs";
CREATE POLICY "tenant_isolation_analytics_forecast_runs" ON "analytics_forecast_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsFunnelConversion (analytics_funnel_conversions)
ALTER TABLE "analytics_funnel_conversions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_funnel_conversions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_funnel_conversions" ON "analytics_funnel_conversions";
CREATE POLICY "tenant_isolation_analytics_funnel_conversions" ON "analytics_funnel_conversions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsFunnelStep (analytics_funnel_steps)
ALTER TABLE "analytics_funnel_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_funnel_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_funnel_steps" ON "analytics_funnel_steps";
CREATE POLICY "tenant_isolation_analytics_funnel_steps" ON "analytics_funnel_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsKpiDefinition (analytics_kpi_definitions)
ALTER TABLE "analytics_kpi_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_kpi_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_kpi_definitions" ON "analytics_kpi_definitions";
CREATE POLICY "tenant_isolation_analytics_kpi_definitions" ON "analytics_kpi_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsKpiValue (analytics_kpi_values)
ALTER TABLE "analytics_kpi_values" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_kpi_values" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_kpi_values" ON "analytics_kpi_values";
CREATE POLICY "tenant_isolation_analytics_kpi_values" ON "analytics_kpi_values"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsPredictiveModel (analytics_predictive_models)
ALTER TABLE "analytics_predictive_models" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_predictive_models" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_predictive_models" ON "analytics_predictive_models";
CREATE POLICY "tenant_isolation_analytics_predictive_models" ON "analytics_predictive_models"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsReportFilter (analytics_report_filters)
ALTER TABLE "analytics_report_filters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_report_filters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_report_filters" ON "analytics_report_filters";
CREATE POLICY "tenant_isolation_analytics_report_filters" ON "analytics_report_filters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsScheduledExport (analytics_scheduled_exports)
ALTER TABLE "analytics_scheduled_exports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_scheduled_exports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_scheduled_exports" ON "analytics_scheduled_exports";
CREATE POLICY "tenant_isolation_analytics_scheduled_exports" ON "analytics_scheduled_exports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnalyticsTrendResult (analytics_trend_results)
ALTER TABLE "analytics_trend_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "analytics_trend_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_analytics_trend_results" ON "analytics_trend_results";
CREATE POLICY "tenant_isolation_analytics_trend_results" ON "analytics_trend_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnnouncementTarget (announcement_targets)
ALTER TABLE "announcement_targets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "announcement_targets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_announcement_targets" ON "announcement_targets";
CREATE POLICY "tenant_isolation_announcement_targets" ON "announcement_targets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Announcement (announcements)
ALTER TABLE "announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_announcements" ON "announcements";
CREATE POLICY "tenant_isolation_announcements" ON "announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnomalyDetectionResult (anomaly_detection_results)
ALTER TABLE "anomaly_detection_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "anomaly_detection_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_anomaly_detection_results" ON "anomaly_detection_results";
CREATE POLICY "tenant_isolation_anomaly_detection_results" ON "anomaly_detection_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AnomalyDetectionRun (anomaly_detection_runs)
ALTER TABLE "anomaly_detection_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "anomaly_detection_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_anomaly_detection_runs" ON "anomaly_detection_runs";
CREATE POLICY "tenant_isolation_anomaly_detection_runs" ON "anomaly_detection_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APApprovalPolicy (ap_approval_policies)
ALTER TABLE "ap_approval_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_approval_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_approval_policies" ON "ap_approval_policies";
CREATE POLICY "tenant_isolation_ap_approval_policies" ON "ap_approval_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APDuplicateFlag (ap_duplicate_flags)
ALTER TABLE "ap_duplicate_flags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_duplicate_flags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_duplicate_flags" ON "ap_duplicate_flags";
CREATE POLICY "tenant_isolation_ap_duplicate_flags" ON "ap_duplicate_flags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APInvoiceCaptureLine (ap_invoice_capture_lines)
ALTER TABLE "ap_invoice_capture_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_invoice_capture_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_invoice_capture_lines" ON "ap_invoice_capture_lines";
CREATE POLICY "tenant_isolation_ap_invoice_capture_lines" ON "ap_invoice_capture_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APInvoiceCapture (ap_invoice_captures)
ALTER TABLE "ap_invoice_captures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_invoice_captures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_invoice_captures" ON "ap_invoice_captures";
CREATE POLICY "tenant_isolation_ap_invoice_captures" ON "ap_invoice_captures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APMatchException (ap_match_exceptions)
ALTER TABLE "ap_match_exceptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_match_exceptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_match_exceptions" ON "ap_match_exceptions";
CREATE POLICY "tenant_isolation_ap_match_exceptions" ON "ap_match_exceptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for APMatchRule (ap_match_rules)
ALTER TABLE "ap_match_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ap_match_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ap_match_rules" ON "ap_match_rules";
CREATE POLICY "tenant_isolation_ap_match_rules" ON "ap_match_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiEndpointMapping (api_endpoint_mappings)
ALTER TABLE "api_endpoint_mappings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_endpoint_mappings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_endpoint_mappings" ON "api_endpoint_mappings";
CREATE POLICY "tenant_isolation_api_endpoint_mappings" ON "api_endpoint_mappings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiEndpoint (api_endpoints)
ALTER TABLE "api_endpoints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_endpoints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_endpoints" ON "api_endpoints";
CREATE POLICY "tenant_isolation_api_endpoints" ON "api_endpoints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiKeyScope (api_key_scopes)
ALTER TABLE "api_key_scopes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_key_scopes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_key_scopes" ON "api_key_scopes";
CREATE POLICY "tenant_isolation_api_key_scopes" ON "api_key_scopes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiKey (api_keys)
ALTER TABLE "api_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_keys" ON "api_keys";
CREATE POLICY "tenant_isolation_api_keys" ON "api_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiQuotaPolicy (api_quota_policies)
ALTER TABLE "api_quota_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_quota_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_quota_policies" ON "api_quota_policies";
CREATE POLICY "tenant_isolation_api_quota_policies" ON "api_quota_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiRateLimitRule (api_rate_limit_rules)
ALTER TABLE "api_rate_limit_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_rate_limit_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_rate_limit_rules" ON "api_rate_limit_rules";
CREATE POLICY "tenant_isolation_api_rate_limit_rules" ON "api_rate_limit_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiTestResult (api_test_results)
ALTER TABLE "api_test_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_test_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_test_results" ON "api_test_results";
CREATE POLICY "tenant_isolation_api_test_results" ON "api_test_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiTestRun (api_test_runs)
ALTER TABLE "api_test_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_test_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_test_runs" ON "api_test_runs";
CREATE POLICY "tenant_isolation_api_test_runs" ON "api_test_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiUsageAnalytics (api_usage_analytics)
ALTER TABLE "api_usage_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_usage_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_usage_analytics" ON "api_usage_analytics";
CREATE POLICY "tenant_isolation_api_usage_analytics" ON "api_usage_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApiUsageMetric (api_usage_metrics)
ALTER TABLE "api_usage_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "api_usage_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_api_usage_metrics" ON "api_usage_metrics";
CREATE POLICY "tenant_isolation_api_usage_metrics" ON "api_usage_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppFavorite (app_favorites)
ALTER TABLE "app_favorites" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_favorites" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_favorites" ON "app_favorites";
CREATE POLICY "tenant_isolation_app_favorites" ON "app_favorites"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppNavOverlay (app_nav_overlays)
ALTER TABLE "app_nav_overlays" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_nav_overlays" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_nav_overlays" ON "app_nav_overlays";
CREATE POLICY "tenant_isolation_app_nav_overlays" ON "app_nav_overlays"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppRelease (app_releases)
ALTER TABLE "app_releases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_releases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_releases" ON "app_releases";
CREATE POLICY "tenant_isolation_app_releases" ON "app_releases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppReview (app_reviews)
ALTER TABLE "app_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_reviews" ON "app_reviews";
CREATE POLICY "tenant_isolation_app_reviews" ON "app_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppSettings (app_settings)
ALTER TABLE "app_settings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_settings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_settings" ON "app_settings";
CREATE POLICY "tenant_isolation_app_settings" ON "app_settings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppStorageUsage (app_storage_usage)
ALTER TABLE "app_storage_usage" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_storage_usage" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_storage_usage" ON "app_storage_usage";
CREATE POLICY "tenant_isolation_app_storage_usage" ON "app_storage_usage"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppSubmission (app_submissions)
ALTER TABLE "app_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "app_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_app_submissions" ON "app_submissions";
CREATE POLICY "tenant_isolation_app_submissions" ON "app_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Applicant (applicants)
ALTER TABLE "applicants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "applicants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_applicants" ON "applicants";
CREATE POLICY "tenant_isolation_applicants" ON "applicants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AppointmentSchedule (appointment_schedules)
ALTER TABLE "appointment_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "appointment_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_appointment_schedules" ON "appointment_schedules";
CREATE POLICY "tenant_isolation_appointment_schedules" ON "appointment_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApportionmentFactor (apportionment_factors)
ALTER TABLE "apportionment_factors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "apportionment_factors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_apportionment_factors" ON "apportionment_factors";
CREATE POLICY "tenant_isolation_apportionment_factors" ON "apportionment_factors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Appraisal (appraisals)
ALTER TABLE "appraisals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "appraisals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_appraisals" ON "appraisals";
CREATE POLICY "tenant_isolation_appraisals" ON "appraisals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalChain (approval_chains)
ALTER TABLE "approval_chains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "approval_chains" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_approval_chains" ON "approval_chains";
CREATE POLICY "tenant_isolation_approval_chains" ON "approval_chains"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalRoutingRule (approval_routing_rules)
ALTER TABLE "approval_routing_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "approval_routing_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_approval_routing_rules" ON "approval_routing_rules";
CREATE POLICY "tenant_isolation_approval_routing_rules" ON "approval_routing_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalRouting (approval_routings)
ALTER TABLE "approval_routings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "approval_routings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_approval_routings" ON "approval_routings";
CREATE POLICY "tenant_isolation_approval_routings" ON "approval_routings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovedSupplier (approved_suppliers)
ALTER TABLE "approved_suppliers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "approved_suppliers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_approved_suppliers" ON "approved_suppliers";
CREATE POLICY "tenant_isolation_approved_suppliers" ON "approved_suppliers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApqpPhase (apqp_phases)
ALTER TABLE "apqp_phases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "apqp_phases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_apqp_phases" ON "apqp_phases";
CREATE POLICY "tenant_isolation_apqp_phases" ON "apqp_phases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApqpProject (apqp_projects)
ALTER TABLE "apqp_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "apqp_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_apqp_projects" ON "apqp_projects";
CREATE POLICY "tenant_isolation_apqp_projects" ON "apqp_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApsConstraint (aps_constraints)
ALTER TABLE "aps_constraints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "aps_constraints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_aps_constraints" ON "aps_constraints";
CREATE POLICY "tenant_isolation_aps_constraints" ON "aps_constraints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApsJob (aps_jobs)
ALTER TABLE "aps_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "aps_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_aps_jobs" ON "aps_jobs";
CREATE POLICY "tenant_isolation_aps_jobs" ON "aps_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApsSchedule (aps_schedules)
ALTER TABLE "aps_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "aps_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_aps_schedules" ON "aps_schedules";
CREATE POLICY "tenant_isolation_aps_schedules" ON "aps_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApsSimulationScenario (aps_simulation_scenarios)
ALTER TABLE "aps_simulation_scenarios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "aps_simulation_scenarios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_aps_simulation_scenarios" ON "aps_simulation_scenarios";
CREATE POLICY "tenant_isolation_aps_simulation_scenarios" ON "aps_simulation_scenarios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AqlSamplingPlan (aql_sampling_plans)
ALTER TABLE "aql_sampling_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "aql_sampling_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_aql_sampling_plans" ON "aql_sampling_plans";
CREATE POLICY "tenant_isolation_aql_sampling_plans" ON "aql_sampling_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ARDispute (ar_disputes)
ALTER TABLE "ar_disputes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ar_disputes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ar_disputes" ON "ar_disputes";
CREATE POLICY "tenant_isolation_ar_disputes" ON "ar_disputes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ARPromiseToPay (ar_promises_to_pay)
ALTER TABLE "ar_promises_to_pay" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ar_promises_to_pay" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ar_promises_to_pay" ON "ar_promises_to_pay";
CREATE POLICY "tenant_isolation_ar_promises_to_pay" ON "ar_promises_to_pay"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Asc606ContractModification (asc606_contract_modifications)
ALTER TABLE "asc606_contract_modifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asc606_contract_modifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asc606_contract_modifications" ON "asc606_contract_modifications";
CREATE POLICY "tenant_isolation_asc606_contract_modifications" ON "asc606_contract_modifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Asc606DeferredRevenueRollForward (asc606_deferred_revenue_roll_forwards)
ALTER TABLE "asc606_deferred_revenue_roll_forwards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asc606_deferred_revenue_roll_forwards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asc606_deferred_revenue_roll_forwards" ON "asc606_deferred_revenue_roll_forwards";
CREATE POLICY "tenant_isolation_asc606_deferred_revenue_roll_forwards" ON "asc606_deferred_revenue_roll_forwards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AslChangeLog (asl_change_logs)
ALTER TABLE "asl_change_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asl_change_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asl_change_logs" ON "asl_change_logs";
CREATE POLICY "tenant_isolation_asl_change_logs" ON "asl_change_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AslComplianceRule (asl_compliance_rules)
ALTER TABLE "asl_compliance_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asl_compliance_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asl_compliance_rules" ON "asl_compliance_rules";
CREATE POLICY "tenant_isolation_asl_compliance_rules" ON "asl_compliance_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AsnDiscrepancy (asn_discrepancies)
ALTER TABLE "asn_discrepancies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asn_discrepancies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asn_discrepancies" ON "asn_discrepancies";
CREATE POLICY "tenant_isolation_asn_discrepancies" ON "asn_discrepancies"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for ASNLineItem (asn_line_items)
ALTER TABLE "asn_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asn_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asn_line_items" ON "asn_line_items";
CREATE POLICY "tenant_isolation_asn_line_items" ON "asn_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetAssignment (asset_assignments)
ALTER TABLE "asset_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_assignments" ON "asset_assignments";
CREATE POLICY "tenant_isolation_asset_assignments" ON "asset_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetDepreciationSchedule (asset_depreciation_schedules)
ALTER TABLE "asset_depreciation_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_depreciation_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_depreciation_schedules" ON "asset_depreciation_schedules";
CREATE POLICY "tenant_isolation_asset_depreciation_schedules" ON "asset_depreciation_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetDepreciation (asset_depreciations)
ALTER TABLE "asset_depreciations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_depreciations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_depreciations" ON "asset_depreciations";
CREATE POLICY "tenant_isolation_asset_depreciations" ON "asset_depreciations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetDisposalLog (asset_disposal_logs)
ALTER TABLE "asset_disposal_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_disposal_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_disposal_logs" ON "asset_disposal_logs";
CREATE POLICY "tenant_isolation_asset_disposal_logs" ON "asset_disposal_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetDisposal (asset_disposals)
ALTER TABLE "asset_disposals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_disposals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_disposals" ON "asset_disposals";
CREATE POLICY "tenant_isolation_asset_disposals" ON "asset_disposals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetImpairment (asset_impairments)
ALTER TABLE "asset_impairments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_impairments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_impairments" ON "asset_impairments";
CREATE POLICY "tenant_isolation_asset_impairments" ON "asset_impairments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetInsurance (asset_insurances)
ALTER TABLE "asset_insurances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_insurances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_insurances" ON "asset_insurances";
CREATE POLICY "tenant_isolation_asset_insurances" ON "asset_insurances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetMaintenanceLog (asset_maintenance_logs)
ALTER TABLE "asset_maintenance_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_maintenance_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_maintenance_logs" ON "asset_maintenance_logs";
CREATE POLICY "tenant_isolation_asset_maintenance_logs" ON "asset_maintenance_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetMaintenanceSchedule (asset_maintenance_schedules)
ALTER TABLE "asset_maintenance_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_maintenance_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_maintenance_schedules" ON "asset_maintenance_schedules";
CREATE POLICY "tenant_isolation_asset_maintenance_schedules" ON "asset_maintenance_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetRevaluation (asset_revaluations)
ALTER TABLE "asset_revaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_revaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_revaluations" ON "asset_revaluations";
CREATE POLICY "tenant_isolation_asset_revaluations" ON "asset_revaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AssetTransferLog (asset_transfer_logs)
ALTER TABLE "asset_transfer_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "asset_transfer_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_asset_transfer_logs" ON "asset_transfer_logs";
CREATE POLICY "tenant_isolation_asset_transfer_logs" ON "asset_transfer_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AtpReservation (atp_reservations)
ALTER TABLE "atp_reservations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "atp_reservations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_atp_reservations" ON "atp_reservations";
CREATE POLICY "tenant_isolation_atp_reservations" ON "atp_reservations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AttendanceAdjustment (attendance_adjustments)
ALTER TABLE "attendance_adjustments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "attendance_adjustments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_attendance_adjustments" ON "attendance_adjustments";
CREATE POLICY "tenant_isolation_attendance_adjustments" ON "attendance_adjustments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AttendanceRecord (attendance_records)
ALTER TABLE "attendance_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "attendance_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_attendance_records" ON "attendance_records";
CREATE POLICY "tenant_isolation_attendance_records" ON "attendance_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AudienceSegment (audience_segments)
ALTER TABLE "audience_segments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "audience_segments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_audience_segments" ON "audience_segments";
CREATE POLICY "tenant_isolation_audience_segments" ON "audience_segments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AuditConfirmation (audit_confirmations)
ALTER TABLE "audit_confirmations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "audit_confirmations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_audit_confirmations" ON "audit_confirmations";
CREATE POLICY "tenant_isolation_audit_confirmations" ON "audit_confirmations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AuditLog (audit_logs)
ALTER TABLE "audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_audit_logs" ON "audit_logs";
CREATE POLICY "tenant_isolation_audit_logs" ON "audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AuthApiToken (auth_api_tokens)
ALTER TABLE "auth_api_tokens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "auth_api_tokens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_auth_api_tokens" ON "auth_api_tokens";
CREATE POLICY "tenant_isolation_auth_api_tokens" ON "auth_api_tokens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AutomationRuleExecution (automation_rule_executions)
ALTER TABLE "automation_rule_executions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "automation_rule_executions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_automation_rule_executions" ON "automation_rule_executions";
CREATE POLICY "tenant_isolation_automation_rule_executions" ON "automation_rule_executions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AutomationRule (automation_rules)
ALTER TABLE "automation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "automation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_automation_rules" ON "automation_rules";
CREATE POLICY "tenant_isolation_automation_rules" ON "automation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for AvailableToPromise (available_to_promise)
ALTER TABLE "available_to_promise" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "available_to_promise" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_available_to_promise" ON "available_to_promise";
CREATE POLICY "tenant_isolation_available_to_promise" ON "available_to_promise"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BackgroundCheckRequest (background_check_requests)
ALTER TABLE "background_check_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "background_check_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_background_check_requests" ON "background_check_requests";
CREATE POLICY "tenant_isolation_background_check_requests" ON "background_check_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BackgroundJob (background_jobs)
ALTER TABLE "background_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "background_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_background_jobs" ON "background_jobs";
CREATE POLICY "tenant_isolation_background_jobs" ON "background_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BadDebtProvision (bad_debt_provisions)
ALTER TABLE "bad_debt_provisions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bad_debt_provisions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bad_debt_provisions" ON "bad_debt_provisions";
CREATE POLICY "tenant_isolation_bad_debt_provisions" ON "bad_debt_provisions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BankAccount (bank_accounts)
ALTER TABLE "bank_accounts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bank_accounts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bank_accounts" ON "bank_accounts";
CREATE POLICY "tenant_isolation_bank_accounts" ON "bank_accounts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BankConnection (bank_connections)
ALTER TABLE "bank_connections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bank_connections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bank_connections" ON "bank_connections";
CREATE POLICY "tenant_isolation_bank_connections" ON "bank_connections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BankGuarantee (bank_guarantees)
ALTER TABLE "bank_guarantees" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bank_guarantees" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bank_guarantees" ON "bank_guarantees";
CREATE POLICY "tenant_isolation_bank_guarantees" ON "bank_guarantees"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BankReconciliation (bank_reconciliations)
ALTER TABLE "bank_reconciliations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bank_reconciliations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bank_reconciliations" ON "bank_reconciliations";
CREATE POLICY "tenant_isolation_bank_reconciliations" ON "bank_reconciliations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BankTransaction (bank_transactions)
ALTER TABLE "bank_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bank_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bank_transactions" ON "bank_transactions";
CREATE POLICY "tenant_isolation_bank_transactions" ON "bank_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BatchQuarantineLog (batch_quarantine_logs)
ALTER TABLE "batch_quarantine_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "batch_quarantine_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_batch_quarantine_logs" ON "batch_quarantine_logs";
CREATE POLICY "tenant_isolation_batch_quarantine_logs" ON "batch_quarantine_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Batch (batches)
ALTER TABLE "batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_batches" ON "batches";
CREATE POLICY "tenant_isolation_batches" ON "batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Battlecard (battlecards)
ALTER TABLE "battlecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "battlecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_battlecards" ON "battlecards";
CREATE POLICY "tenant_isolation_battlecards" ON "battlecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BenefitScheme (benefit_schemes)
ALTER TABLE "benefit_schemes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "benefit_schemes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_benefit_schemes" ON "benefit_schemes";
CREATE POLICY "tenant_isolation_benefit_schemes" ON "benefit_schemes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BenefitsEligibilityRule (benefits_eligibility_rules)
ALTER TABLE "benefits_eligibility_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "benefits_eligibility_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_benefits_eligibility_rules" ON "benefits_eligibility_rules";
CREATE POLICY "tenant_isolation_benefits_eligibility_rules" ON "benefits_eligibility_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BerthSlot (berth_slots)
ALTER TABLE "berth_slots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "berth_slots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_berth_slots" ON "berth_slots";
CREATE POLICY "tenant_isolation_berth_slots" ON "berth_slots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BidAnalysis (bid_analyses)
ALTER TABLE "bid_analyses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bid_analyses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bid_analyses" ON "bid_analyses";
CREATE POLICY "tenant_isolation_bid_analyses" ON "bid_analyses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BillingEvent (billing_events)
ALTER TABLE "billing_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "billing_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_billing_events" ON "billing_events";
CREATE POLICY "tenant_isolation_billing_events" ON "billing_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BillingMilestone (billing_milestones)
ALTER TABLE "billing_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "billing_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_billing_milestones" ON "billing_milestones";
CREATE POLICY "tenant_isolation_billing_milestones" ON "billing_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BillingRule (billing_rules)
ALTER TABLE "billing_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "billing_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_billing_rules" ON "billing_rules";
CREATE POLICY "tenant_isolation_billing_rules" ON "billing_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BinLocation (bin_locations)
ALTER TABLE "bin_locations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bin_locations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bin_locations" ON "bin_locations";
CREATE POLICY "tenant_isolation_bin_locations" ON "bin_locations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BinReplenishmentRule (bin_replenishment_rules)
ALTER TABLE "bin_replenishment_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bin_replenishment_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bin_replenishment_rules" ON "bin_replenishment_rules";
CREATE POLICY "tenant_isolation_bin_replenishment_rules" ON "bin_replenishment_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BinTransferRequest (bin_transfer_requests)
ALTER TABLE "bin_transfer_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bin_transfer_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bin_transfer_requests" ON "bin_transfer_requests";
CREATE POLICY "tenant_isolation_bin_transfer_requests" ON "bin_transfer_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlanketPurchaseAgreementItem (blanket_purchase_agreement_items)
ALTER TABLE "blanket_purchase_agreement_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blanket_purchase_agreement_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blanket_purchase_agreement_items" ON "blanket_purchase_agreement_items";
CREATE POLICY "tenant_isolation_blanket_purchase_agreement_items" ON "blanket_purchase_agreement_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlanketPurchaseAgreement (blanket_purchase_agreements)
ALTER TABLE "blanket_purchase_agreements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blanket_purchase_agreements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blanket_purchase_agreements" ON "blanket_purchase_agreements";
CREATE POLICY "tenant_isolation_blanket_purchase_agreements" ON "blanket_purchase_agreements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlockchainAuditTrail (blockchain_audit_trails)
ALTER TABLE "blockchain_audit_trails" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blockchain_audit_trails" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blockchain_audit_trails" ON "blockchain_audit_trails";
CREATE POLICY "tenant_isolation_blockchain_audit_trails" ON "blockchain_audit_trails"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlockchainSmartContract (blockchain_smart_contracts)
ALTER TABLE "blockchain_smart_contracts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blockchain_smart_contracts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blockchain_smart_contracts" ON "blockchain_smart_contracts";
CREATE POLICY "tenant_isolation_blockchain_smart_contracts" ON "blockchain_smart_contracts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlockchainTransactionExplorer (blockchain_transaction_explorers)
ALTER TABLE "blockchain_transaction_explorers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blockchain_transaction_explorers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blockchain_transaction_explorers" ON "blockchain_transaction_explorers";
CREATE POLICY "tenant_isolation_blockchain_transaction_explorers" ON "blockchain_transaction_explorers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlockchainTransaction (blockchain_transactions)
ALTER TABLE "blockchain_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blockchain_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blockchain_transactions" ON "blockchain_transactions";
CREATE POLICY "tenant_isolation_blockchain_transactions" ON "blockchain_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlockchainVerification (blockchain_verifications)
ALTER TABLE "blockchain_verifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blockchain_verifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blockchain_verifications" ON "blockchain_verifications";
CREATE POLICY "tenant_isolation_blockchain_verifications" ON "blockchain_verifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BlogPost (blog_posts)
ALTER TABLE "blog_posts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "blog_posts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_blog_posts" ON "blog_posts";
CREATE POLICY "tenant_isolation_blog_posts" ON "blog_posts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BOMItem (bom_items)
ALTER TABLE "bom_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bom_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bom_items" ON "bom_items";
CREATE POLICY "tenant_isolation_bom_items" ON "bom_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BOM (boms)
ALTER TABLE "boms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "boms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_boms" ON "boms";
CREATE POLICY "tenant_isolation_boms" ON "boms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BonusPayout (bonus_payouts)
ALTER TABLE "bonus_payouts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bonus_payouts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bonus_payouts" ON "bonus_payouts";
CREATE POLICY "tenant_isolation_bonus_payouts" ON "bonus_payouts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BonusPlan (bonus_plans)
ALTER TABLE "bonus_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bonus_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bonus_plans" ON "bonus_plans";
CREATE POLICY "tenant_isolation_bonus_plans" ON "bonus_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BookTransaction (book_transactions)
ALTER TABLE "book_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "book_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_book_transactions" ON "book_transactions";
CREATE POLICY "tenant_isolation_book_transactions" ON "book_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BpmnActivityInstance (bpmn_activity_instances)
ALTER TABLE "bpmn_activity_instances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bpmn_activity_instances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bpmn_activity_instances" ON "bpmn_activity_instances";
CREATE POLICY "tenant_isolation_bpmn_activity_instances" ON "bpmn_activity_instances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BpmnProcessDefinition (bpmn_process_definitions)
ALTER TABLE "bpmn_process_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bpmn_process_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bpmn_process_definitions" ON "bpmn_process_definitions";
CREATE POLICY "tenant_isolation_bpmn_process_definitions" ON "bpmn_process_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BpmnProcessInstance (bpmn_process_instances)
ALTER TABLE "bpmn_process_instances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bpmn_process_instances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bpmn_process_instances" ON "bpmn_process_instances";
CREATE POLICY "tenant_isolation_bpmn_process_instances" ON "bpmn_process_instances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BpmnTimerDefinition (bpmn_timer_definitions)
ALTER TABLE "bpmn_timer_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bpmn_timer_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bpmn_timer_definitions" ON "bpmn_timer_definitions";
CREATE POLICY "tenant_isolation_bpmn_timer_definitions" ON "bpmn_timer_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BreakoutRoom (breakout_rooms)
ALTER TABLE "breakout_rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "breakout_rooms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_breakout_rooms" ON "breakout_rooms";
CREATE POLICY "tenant_isolation_breakout_rooms" ON "breakout_rooms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetCarryForwardRule (budget_carry_forward_rules)
ALTER TABLE "budget_carry_forward_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_carry_forward_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_carry_forward_rules" ON "budget_carry_forward_rules";
CREATE POLICY "tenant_isolation_budget_carry_forward_rules" ON "budget_carry_forward_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetComment (budget_comments)
ALTER TABLE "budget_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_comments" ON "budget_comments";
CREATE POLICY "tenant_isolation_budget_comments" ON "budget_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetCommitment (budget_commitments)
ALTER TABLE "budget_commitments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_commitments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_commitments" ON "budget_commitments";
CREATE POLICY "tenant_isolation_budget_commitments" ON "budget_commitments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetControlConfig (budget_control_configs)
ALTER TABLE "budget_control_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_control_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_control_configs" ON "budget_control_configs";
CREATE POLICY "tenant_isolation_budget_control_configs" ON "budget_control_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetPeriodAmount (budget_period_amounts)
ALTER TABLE "budget_period_amounts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_period_amounts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_period_amounts" ON "budget_period_amounts";
CREATE POLICY "tenant_isolation_budget_period_amounts" ON "budget_period_amounts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetPolicy (budget_policies)
ALTER TABLE "budget_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_policies" ON "budget_policies";
CREATE POLICY "tenant_isolation_budget_policies" ON "budget_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetReallocationLine (budget_reallocation_lines)
ALTER TABLE "budget_reallocation_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_reallocation_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_reallocation_lines" ON "budget_reallocation_lines";
CREATE POLICY "tenant_isolation_budget_reallocation_lines" ON "budget_reallocation_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetReallocation (budget_reallocations)
ALTER TABLE "budget_reallocations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_reallocations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_reallocations" ON "budget_reallocations";
CREATE POLICY "tenant_isolation_budget_reallocations" ON "budget_reallocations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetRevision (budget_revisions)
ALTER TABLE "budget_revisions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_revisions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_revisions" ON "budget_revisions";
CREATE POLICY "tenant_isolation_budget_revisions" ON "budget_revisions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetScenarioLine (budget_scenario_lines)
ALTER TABLE "budget_scenario_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_scenario_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_scenario_lines" ON "budget_scenario_lines";
CREATE POLICY "tenant_isolation_budget_scenario_lines" ON "budget_scenario_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetScenario (budget_scenarios)
ALTER TABLE "budget_scenarios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_scenarios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_scenarios" ON "budget_scenarios";
CREATE POLICY "tenant_isolation_budget_scenarios" ON "budget_scenarios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BudgetTemplate (budget_templates)
ALTER TABLE "budget_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budget_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budget_templates" ON "budget_templates";
CREATE POLICY "tenant_isolation_budget_templates" ON "budget_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Budget (budgets)
ALTER TABLE "budgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "budgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_budgets" ON "budgets";
CREATE POLICY "tenant_isolation_budgets" ON "budgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuildLog (build_logs)
ALTER TABLE "build_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "build_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_build_logs" ON "build_logs";
CREATE POLICY "tenant_isolation_build_logs" ON "build_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderAnalyticsEvent (builder_analytics_events)
ALTER TABLE "builder_analytics_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_analytics_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_analytics_events" ON "builder_analytics_events";
CREATE POLICY "tenant_isolation_builder_analytics_events" ON "builder_analytics_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderApi (builder_apis)
ALTER TABLE "builder_apis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_apis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_apis" ON "builder_apis";
CREATE POLICY "tenant_isolation_builder_apis" ON "builder_apis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDashboard (builder_dashboards)
ALTER TABLE "builder_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_dashboards" ON "builder_dashboards";
CREATE POLICY "tenant_isolation_builder_dashboards" ON "builder_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDataField (builder_data_fields)
ALTER TABLE "builder_data_fields" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_data_fields" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_data_fields" ON "builder_data_fields";
CREATE POLICY "tenant_isolation_builder_data_fields" ON "builder_data_fields"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDataModel (builder_data_models)
ALTER TABLE "builder_data_models" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_data_models" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_data_models" ON "builder_data_models";
CREATE POLICY "tenant_isolation_builder_data_models" ON "builder_data_models"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDataView (builder_data_views)
ALTER TABLE "builder_data_views" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_data_views" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_data_views" ON "builder_data_views";
CREATE POLICY "tenant_isolation_builder_data_views" ON "builder_data_views"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDeployment (builder_deployments)
ALTER TABLE "builder_deployments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_deployments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_deployments" ON "builder_deployments";
CREATE POLICY "tenant_isolation_builder_deployments" ON "builder_deployments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDocumentRender (builder_document_renders)
ALTER TABLE "builder_document_renders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_document_renders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_document_renders" ON "builder_document_renders";
CREATE POLICY "tenant_isolation_builder_document_renders" ON "builder_document_renders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderDocumentTemplate (builder_document_templates)
ALTER TABLE "builder_document_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_document_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_document_templates" ON "builder_document_templates";
CREATE POLICY "tenant_isolation_builder_document_templates" ON "builder_document_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderEnvironment (builder_environments)
ALTER TABLE "builder_environments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_environments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_environments" ON "builder_environments";
CREATE POLICY "tenant_isolation_builder_environments" ON "builder_environments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderForm (builder_forms)
ALTER TABLE "builder_forms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_forms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_forms" ON "builder_forms";
CREATE POLICY "tenant_isolation_builder_forms" ON "builder_forms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GitConfig (builder_git_configs)
ALTER TABLE "builder_git_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_git_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_git_configs" ON "builder_git_configs";
CREATE POLICY "tenant_isolation_builder_git_configs" ON "builder_git_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderModule (builder_modules)
ALTER TABLE "builder_modules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_modules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_modules" ON "builder_modules";
CREATE POLICY "tenant_isolation_builder_modules" ON "builder_modules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NativeBuild (builder_native_builds)
ALTER TABLE "builder_native_builds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_native_builds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_native_builds" ON "builder_native_builds";
CREATE POLICY "tenant_isolation_builder_native_builds" ON "builder_native_builds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderPermissionRule (builder_permission_rules)
ALTER TABLE "builder_permission_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_permission_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_permission_rules" ON "builder_permission_rules";
CREATE POLICY "tenant_isolation_builder_permission_rules" ON "builder_permission_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderRelationship (builder_relationships)
ALTER TABLE "builder_relationships" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_relationships" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_relationships" ON "builder_relationships";
CREATE POLICY "tenant_isolation_builder_relationships" ON "builder_relationships"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderScript (builder_scripts)
ALTER TABLE "builder_scripts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_scripts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_scripts" ON "builder_scripts";
CREATE POLICY "tenant_isolation_builder_scripts" ON "builder_scripts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderTemplate (builder_templates)
ALTER TABLE "builder_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_templates" ON "builder_templates";
CREATE POLICY "tenant_isolation_builder_templates" ON "builder_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderTheme (builder_themes)
ALTER TABLE "builder_themes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_themes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_themes" ON "builder_themes";
CREATE POLICY "tenant_isolation_builder_themes" ON "builder_themes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderUsageMetric (builder_usage_metrics)
ALTER TABLE "builder_usage_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_usage_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_usage_metrics" ON "builder_usage_metrics";
CREATE POLICY "tenant_isolation_builder_usage_metrics" ON "builder_usage_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderWorkflowRunStep (builder_workflow_run_steps)
ALTER TABLE "builder_workflow_run_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_workflow_run_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_workflow_run_steps" ON "builder_workflow_run_steps";
CREATE POLICY "tenant_isolation_builder_workflow_run_steps" ON "builder_workflow_run_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderWorkflowRun (builder_workflow_runs)
ALTER TABLE "builder_workflow_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_workflow_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_workflow_runs" ON "builder_workflow_runs";
CREATE POLICY "tenant_isolation_builder_workflow_runs" ON "builder_workflow_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BuilderWorkflow (builder_workflows)
ALTER TABLE "builder_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "builder_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_builder_workflows" ON "builder_workflows";
CREATE POLICY "tenant_isolation_builder_workflows" ON "builder_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BulkOperation (bulk_operations)
ALTER TABLE "bulk_operations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bulk_operations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bulk_operations" ON "bulk_operations";
CREATE POLICY "tenant_isolation_bulk_operations" ON "bulk_operations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BulkOrderUpload (bulk_order_uploads)
ALTER TABLE "bulk_order_uploads" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "bulk_order_uploads" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_bulk_order_uploads" ON "bulk_order_uploads";
CREATE POLICY "tenant_isolation_bulk_order_uploads" ON "bulk_order_uploads"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BusinessRuleExecution (business_rule_executions)
ALTER TABLE "business_rule_executions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "business_rule_executions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_business_rule_executions" ON "business_rule_executions";
CREATE POLICY "tenant_isolation_business_rule_executions" ON "business_rule_executions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for BusinessRule (business_rules)
ALTER TABLE "business_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "business_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_business_rules" ON "business_rules";
CREATE POLICY "tenant_isolation_business_rules" ON "business_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CadenceAutoEnrollRule (cadence_auto_enroll_rules)
ALTER TABLE "cadence_auto_enroll_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cadence_auto_enroll_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cadence_auto_enroll_rules" ON "cadence_auto_enroll_rules";
CREATE POLICY "tenant_isolation_cadence_auto_enroll_rules" ON "cadence_auto_enroll_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CadenceStepTask (cadence_step_tasks)
ALTER TABLE "cadence_step_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cadence_step_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cadence_step_tasks" ON "cadence_step_tasks";
CREATE POLICY "tenant_isolation_cadence_step_tasks" ON "cadence_step_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CalculatedField (calculated_fields)
ALTER TABLE "calculated_fields" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "calculated_fields" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_calculated_fields" ON "calculated_fields";
CREATE POLICY "tenant_isolation_calculated_fields" ON "calculated_fields"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CalendarEvent (calendar_events)
ALTER TABLE "calendar_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "calendar_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_calendar_events" ON "calendar_events";
CREATE POLICY "tenant_isolation_calendar_events" ON "calendar_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CalibrationRecord (calibration_records)
ALTER TABLE "calibration_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "calibration_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_calibration_records" ON "calibration_records";
CREATE POLICY "tenant_isolation_calibration_records" ON "calibration_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CallScorecard (call_scorecards)
ALTER TABLE "call_scorecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "call_scorecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_call_scorecards" ON "call_scorecards";
CREATE POLICY "tenant_isolation_call_scorecards" ON "call_scorecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CampaignROI (campaign_rois)
ALTER TABLE "campaign_rois" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "campaign_rois" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_campaign_rois" ON "campaign_rois";
CREATE POLICY "tenant_isolation_campaign_rois" ON "campaign_rois"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CampaignWorkflowStat (campaign_workflow_stats)
ALTER TABLE "campaign_workflow_stats" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "campaign_workflow_stats" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_campaign_workflow_stats" ON "campaign_workflow_stats";
CREATE POLICY "tenant_isolation_campaign_workflow_stats" ON "campaign_workflow_stats"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CampaignWorkflowStep (campaign_workflow_steps)
ALTER TABLE "campaign_workflow_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "campaign_workflow_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_campaign_workflow_steps" ON "campaign_workflow_steps";
CREATE POLICY "tenant_isolation_campaign_workflow_steps" ON "campaign_workflow_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CampaignWorkflow (campaign_workflows)
ALTER TABLE "campaign_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "campaign_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_campaign_workflows" ON "campaign_workflows";
CREATE POLICY "tenant_isolation_campaign_workflows" ON "campaign_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Campaign (campaigns)
ALTER TABLE "campaigns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "campaigns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_campaigns" ON "campaigns";
CREATE POLICY "tenant_isolation_campaigns" ON "campaigns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CannedResponse (canned_responses)
ALTER TABLE "canned_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "canned_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_canned_responses" ON "canned_responses";
CREATE POLICY "tenant_isolation_canned_responses" ON "canned_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapaAction (capa_actions)
ALTER TABLE "capa_actions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capa_actions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capa_actions" ON "capa_actions";
CREATE POLICY "tenant_isolation_capa_actions" ON "capa_actions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapaRecord (capa_records)
ALTER TABLE "capa_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capa_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capa_records" ON "capa_records";
CREATE POLICY "tenant_isolation_capa_records" ON "capa_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapexBudgetLine (capex_budget_lines)
ALTER TABLE "capex_budget_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capex_budget_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capex_budget_lines" ON "capex_budget_lines";
CREATE POLICY "tenant_isolation_capex_budget_lines" ON "capex_budget_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapexCapitalization (capex_capitalizations)
ALTER TABLE "capex_capitalizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capex_capitalizations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capex_capitalizations" ON "capex_capitalizations";
CREATE POLICY "tenant_isolation_capex_capitalizations" ON "capex_capitalizations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapexGateReview (capex_gate_reviews)
ALTER TABLE "capex_gate_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capex_gate_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capex_gate_reviews" ON "capex_gate_reviews";
CREATE POLICY "tenant_isolation_capex_gate_reviews" ON "capex_gate_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapexProject (capex_projects)
ALTER TABLE "capex_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capex_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capex_projects" ON "capex_projects";
CREATE POLICY "tenant_isolation_capex_projects" ON "capex_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapitalProjectCost (capital_project_costs)
ALTER TABLE "capital_project_costs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capital_project_costs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capital_project_costs" ON "capital_project_costs";
CREATE POLICY "tenant_isolation_capital_project_costs" ON "capital_project_costs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CapitalProject (capital_projects)
ALTER TABLE "capital_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "capital_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_capital_projects" ON "capital_projects";
CREATE POLICY "tenant_isolation_capital_projects" ON "capital_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CarbonOffset (carbon_offsets)
ALTER TABLE "carbon_offsets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "carbon_offsets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_carbon_offsets" ON "carbon_offsets";
CREATE POLICY "tenant_isolation_carbon_offsets" ON "carbon_offsets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CardCategoryLimit (card_category_limits)
ALTER TABLE "card_category_limits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "card_category_limits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_card_category_limits" ON "card_category_limits";
CREATE POLICY "tenant_isolation_card_category_limits" ON "card_category_limits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CardLimitAuditLog (card_limit_audit_logs)
ALTER TABLE "card_limit_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "card_limit_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_card_limit_audit_logs" ON "card_limit_audit_logs";
CREATE POLICY "tenant_isolation_card_limit_audit_logs" ON "card_limit_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CardLimitIncreaseRequest (card_limit_increase_requests)
ALTER TABLE "card_limit_increase_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "card_limit_increase_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_card_limit_increase_requests" ON "card_limit_increase_requests";
CREATE POLICY "tenant_isolation_card_limit_increase_requests" ON "card_limit_increase_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CardSpendLimit (card_spend_limits)
ALTER TABLE "card_spend_limits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "card_spend_limits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_card_spend_limits" ON "card_spend_limits";
CREATE POLICY "tenant_isolation_card_spend_limits" ON "card_spend_limits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CareerPathRequirement (career_path_requirements)
ALTER TABLE "career_path_requirements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "career_path_requirements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_career_path_requirements" ON "career_path_requirements";
CREATE POLICY "tenant_isolation_career_path_requirements" ON "career_path_requirements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CareerPath (career_paths)
ALTER TABLE "career_paths" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "career_paths" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_career_paths" ON "career_paths";
CREATE POLICY "tenant_isolation_career_paths" ON "career_paths"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CargoDamageReport (cargo_damage_reports)
ALTER TABLE "cargo_damage_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cargo_damage_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cargo_damage_reports" ON "cargo_damage_reports";
CREATE POLICY "tenant_isolation_cargo_damage_reports" ON "cargo_damage_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CarrierRate (carrier_rates)
ALTER TABLE "carrier_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "carrier_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_carrier_rates" ON "carrier_rates";
CREATE POLICY "tenant_isolation_carrier_rates" ON "carrier_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CarrierServiceLevel (carrier_service_levels)
ALTER TABLE "carrier_service_levels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "carrier_service_levels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_carrier_service_levels" ON "carrier_service_levels";
CREATE POLICY "tenant_isolation_carrier_service_levels" ON "carrier_service_levels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CartItem (cart_items)
ALTER TABLE "cart_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cart_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cart_items" ON "cart_items";
CREATE POLICY "tenant_isolation_cart_items" ON "cart_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Cart (carts)
ALTER TABLE "carts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "carts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_carts" ON "carts";
CREATE POLICY "tenant_isolation_carts" ON "carts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CashEntry (cash_entries)
ALTER TABLE "cash_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cash_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cash_entries" ON "cash_entries";
CREATE POLICY "tenant_isolation_cash_entries" ON "cash_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CashPoolRun (cash_pool_runs)
ALTER TABLE "cash_pool_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cash_pool_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cash_pool_runs" ON "cash_pool_runs";
CREATE POLICY "tenant_isolation_cash_pool_runs" ON "cash_pool_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CashPool (cash_pools)
ALTER TABLE "cash_pools" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cash_pools" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cash_pools" ON "cash_pools";
CREATE POLICY "tenant_isolation_cash_pools" ON "cash_pools"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CatalogueProvisioning (catalogue_provisionings)
ALTER TABLE "catalogue_provisionings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "catalogue_provisionings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_catalogue_provisionings" ON "catalogue_provisionings";
CREATE POLICY "tenant_isolation_catalogue_provisionings" ON "catalogue_provisionings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CatchWeightConfig (catch_weight_configs)
ALTER TABLE "catch_weight_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "catch_weight_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_catch_weight_configs" ON "catch_weight_configs";
CREATE POLICY "tenant_isolation_catch_weight_configs" ON "catch_weight_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CatchWeightReading (catch_weight_readings)
ALTER TABLE "catch_weight_readings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "catch_weight_readings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_catch_weight_readings" ON "catch_weight_readings";
CREATE POLICY "tenant_isolation_catch_weight_readings" ON "catch_weight_readings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CatchWeightTare (catch_weight_tares)
ALTER TABLE "catch_weight_tares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "catch_weight_tares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_catch_weight_tares" ON "catch_weight_tares";
CREATE POLICY "tenant_isolation_catch_weight_tares" ON "catch_weight_tares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Certification (certifications)
ALTER TABLE "certifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "certifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_certifications" ON "certifications";
CREATE POLICY "tenant_isolation_certifications" ON "certifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChangeHistory (change_history)
ALTER TABLE "change_history" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "change_history" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_change_history" ON "change_history";
CREATE POLICY "tenant_isolation_change_history" ON "change_history"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChangeRequest (change_requests)
ALTER TABLE "change_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "change_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_change_requests" ON "change_requests";
CREATE POLICY "tenant_isolation_change_requests" ON "change_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelAnalytics (channel_analytics)
ALTER TABLE "channel_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_analytics" ON "channel_analytics";
CREATE POLICY "tenant_isolation_channel_analytics" ON "channel_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelIntegration (channel_integrations)
ALTER TABLE "channel_integrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_integrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_integrations" ON "channel_integrations";
CREATE POLICY "tenant_isolation_channel_integrations" ON "channel_integrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelInventory (channel_inventory)
ALTER TABLE "channel_inventory" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_inventory" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_inventory" ON "channel_inventory";
CREATE POLICY "tenant_isolation_channel_inventory" ON "channel_inventory"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelMember (channel_members)
ALTER TABLE "channel_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_members" ON "channel_members";
CREATE POLICY "tenant_isolation_channel_members" ON "channel_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelModeration (channel_moderation)
ALTER TABLE "channel_moderation" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_moderation" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_moderation" ON "channel_moderation";
CREATE POLICY "tenant_isolation_channel_moderation" ON "channel_moderation"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelRead (channel_reads)
ALTER TABLE "channel_reads" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_reads" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_reads" ON "channel_reads";
CREATE POLICY "tenant_isolation_channel_reads" ON "channel_reads"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelTab (channel_tabs)
ALTER TABLE "channel_tabs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_tabs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_tabs" ON "channel_tabs";
CREATE POLICY "tenant_isolation_channel_tabs" ON "channel_tabs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChannelTemplate (channel_templates)
ALTER TABLE "channel_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channel_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channel_templates" ON "channel_templates";
CREATE POLICY "tenant_isolation_channel_templates" ON "channel_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Channel (channels)
ALTER TABLE "channels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "channels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_channels" ON "channels";
CREATE POLICY "tenant_isolation_channels" ON "channels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatChannelMember (chat_channel_members)
ALTER TABLE "chat_channel_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_channel_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_channel_members" ON "chat_channel_members";
CREATE POLICY "tenant_isolation_chat_channel_members" ON "chat_channel_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatChannel (chat_channels)
ALTER TABLE "chat_channels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_channels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_channels" ON "chat_channels";
CREATE POLICY "tenant_isolation_chat_channels" ON "chat_channels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatMessageReaction (chat_message_reactions)
ALTER TABLE "chat_message_reactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_message_reactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_message_reactions" ON "chat_message_reactions";
CREATE POLICY "tenant_isolation_chat_message_reactions" ON "chat_message_reactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatMessage (chat_messages)
ALTER TABLE "chat_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_messages" ON "chat_messages";
CREATE POLICY "tenant_isolation_chat_messages" ON "chat_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatRoomMember (chat_room_members)
ALTER TABLE "chat_room_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_room_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_room_members" ON "chat_room_members";
CREATE POLICY "tenant_isolation_chat_room_members" ON "chat_room_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatRoom (chat_rooms)
ALTER TABLE "chat_rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chat_rooms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chat_rooms" ON "chat_rooms";
CREATE POLICY "tenant_isolation_chat_rooms" ON "chat_rooms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatbotConversation (chatbot_conversations)
ALTER TABLE "chatbot_conversations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chatbot_conversations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chatbot_conversations" ON "chatbot_conversations";
CREATE POLICY "tenant_isolation_chatbot_conversations" ON "chatbot_conversations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatbotDefinition (chatbot_definitions)
ALTER TABLE "chatbot_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chatbot_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chatbot_definitions" ON "chatbot_definitions";
CREATE POLICY "tenant_isolation_chatbot_definitions" ON "chatbot_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChatbotIntent (chatbot_intents)
ALTER TABLE "chatbot_intents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "chatbot_intents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_chatbot_intents" ON "chatbot_intents";
CREATE POLICY "tenant_isolation_chatbot_intents" ON "chatbot_intents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ChurnAnalysis (churn_analyses)
ALTER TABLE "churn_analyses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "churn_analyses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_churn_analyses" ON "churn_analyses";
CREATE POLICY "tenant_isolation_churn_analyses" ON "churn_analyses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ClaimDocument (claim_documents)
ALTER TABLE "claim_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "claim_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_claim_documents" ON "claim_documents";
CREATE POLICY "tenant_isolation_claim_documents" ON "claim_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseAnalyticsSnapshot (close_analytics_snapshots)
ALTER TABLE "close_analytics_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_analytics_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_analytics_snapshots" ON "close_analytics_snapshots";
CREATE POLICY "tenant_isolation_close_analytics_snapshots" ON "close_analytics_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseCalendarEvent (close_calendar_events)
ALTER TABLE "close_calendar_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_calendar_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_calendar_events" ON "close_calendar_events";
CREATE POLICY "tenant_isolation_close_calendar_events" ON "close_calendar_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseEscalationRule (close_escalation_rules)
ALTER TABLE "close_escalation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_escalation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_escalation_rules" ON "close_escalation_rules";
CREATE POLICY "tenant_isolation_close_escalation_rules" ON "close_escalation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseTaskDependency (close_task_dependencies)
ALTER TABLE "close_task_dependencies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_task_dependencies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_task_dependencies" ON "close_task_dependencies";
CREATE POLICY "tenant_isolation_close_task_dependencies" ON "close_task_dependencies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseTaskSla (close_task_slas)
ALTER TABLE "close_task_slas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_task_slas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_task_slas" ON "close_task_slas";
CREATE POLICY "tenant_isolation_close_task_slas" ON "close_task_slas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CloseTask (close_tasks)
ALTER TABLE "close_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "close_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_close_tasks" ON "close_tasks";
CREATE POLICY "tenant_isolation_close_tasks" ON "close_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CoProduct (co_products)
ALTER TABLE "co_products" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "co_products" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_co_products" ON "co_products";
CREATE POLICY "tenant_isolation_co_products" ON "co_products"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CoachingLibraryItem (coaching_library_items)
ALTER TABLE "coaching_library_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "coaching_library_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_coaching_library_items" ON "coaching_library_items";
CREATE POLICY "tenant_isolation_coaching_library_items" ON "coaching_library_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CoachingRubric (coaching_rubrics)
ALTER TABLE "coaching_rubrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "coaching_rubrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_coaching_rubrics" ON "coaching_rubrics";
CREATE POLICY "tenant_isolation_coaching_rubrics" ON "coaching_rubrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ColdChainExcursion (cold_chain_excursions)
ALTER TABLE "cold_chain_excursions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cold_chain_excursions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cold_chain_excursions" ON "cold_chain_excursions";
CREATE POLICY "tenant_isolation_cold_chain_excursions" ON "cold_chain_excursions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ColdChainRequirement (cold_chain_requirements)
ALTER TABLE "cold_chain_requirements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cold_chain_requirements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cold_chain_requirements" ON "cold_chain_requirements";
CREATE POLICY "tenant_isolation_cold_chain_requirements" ON "cold_chain_requirements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ColdChainShipment (cold_chain_shipments)
ALTER TABLE "cold_chain_shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cold_chain_shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cold_chain_shipments" ON "cold_chain_shipments";
CREATE POLICY "tenant_isolation_cold_chain_shipments" ON "cold_chain_shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ColdChainTemperatureLog (cold_chain_temperature_logs)
ALTER TABLE "cold_chain_temperature_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cold_chain_temperature_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cold_chain_temperature_logs" ON "cold_chain_temperature_logs";
CREATE POLICY "tenant_isolation_cold_chain_temperature_logs" ON "cold_chain_temperature_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CollabDocumentVersion (collab_document_versions)
ALTER TABLE "collab_document_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "collab_document_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_collab_document_versions" ON "collab_document_versions";
CREATE POLICY "tenant_isolation_collab_document_versions" ON "collab_document_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CollabDocument (collab_documents)
ALTER TABLE "collab_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "collab_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_collab_documents" ON "collab_documents";
CREATE POLICY "tenant_isolation_collab_documents" ON "collab_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommAnalyticsReport (comm_analytics_reports)
ALTER TABLE "comm_analytics_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_analytics_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_analytics_reports" ON "comm_analytics_reports";
CREATE POLICY "tenant_isolation_comm_analytics_reports" ON "comm_analytics_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommRetentionPolicy (comm_retention_policies)
ALTER TABLE "comm_retention_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_retention_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_retention_policies" ON "comm_retention_policies";
CREATE POLICY "tenant_isolation_comm_retention_policies" ON "comm_retention_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommSurveyAnswer (comm_survey_answers)
ALTER TABLE "comm_survey_answers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_survey_answers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_survey_answers" ON "comm_survey_answers";
CREATE POLICY "tenant_isolation_comm_survey_answers" ON "comm_survey_answers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommSurveyQuestion (comm_survey_questions)
ALTER TABLE "comm_survey_questions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_survey_questions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_survey_questions" ON "comm_survey_questions";
CREATE POLICY "tenant_isolation_comm_survey_questions" ON "comm_survey_questions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommSurveyResponse (comm_survey_responses)
ALTER TABLE "comm_survey_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_survey_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_survey_responses" ON "comm_survey_responses";
CREATE POLICY "tenant_isolation_comm_survey_responses" ON "comm_survey_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommSurveyTemplate (comm_survey_templates)
ALTER TABLE "comm_survey_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_survey_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_survey_templates" ON "comm_survey_templates";
CREATE POLICY "tenant_isolation_comm_survey_templates" ON "comm_survey_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommSurvey (comm_surveys)
ALTER TABLE "comm_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_surveys" ON "comm_surveys";
CREATE POLICY "tenant_isolation_comm_surveys" ON "comm_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommWebhook (comm_webhooks)
ALTER TABLE "comm_webhooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "comm_webhooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_comm_webhooks" ON "comm_webhooks";
CREATE POLICY "tenant_isolation_comm_webhooks" ON "comm_webhooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionEntry (commission_entries)
ALTER TABLE "commission_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_entries" ON "commission_entries";
CREATE POLICY "tenant_isolation_commission_entries" ON "commission_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionPayoutSpiffLine (commission_payout_spiff_lines)
ALTER TABLE "commission_payout_spiff_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_payout_spiff_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_payout_spiff_lines" ON "commission_payout_spiff_lines";
CREATE POLICY "tenant_isolation_commission_payout_spiff_lines" ON "commission_payout_spiff_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionPayout (commission_payouts)
ALTER TABLE "commission_payouts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_payouts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_payouts" ON "commission_payouts";
CREATE POLICY "tenant_isolation_commission_payouts" ON "commission_payouts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionPlanTier (commission_plan_tiers)
ALTER TABLE "commission_plan_tiers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_plan_tiers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_plan_tiers" ON "commission_plan_tiers";
CREATE POLICY "tenant_isolation_commission_plan_tiers" ON "commission_plan_tiers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionPlan (commission_plans)
ALTER TABLE "commission_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_plans" ON "commission_plans";
CREATE POLICY "tenant_isolation_commission_plans" ON "commission_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionRule (commission_rules)
ALTER TABLE "commission_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_rules" ON "commission_rules";
CREATE POLICY "tenant_isolation_commission_rules" ON "commission_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommissionSpiff (commission_spiffs)
ALTER TABLE "commission_spiffs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "commission_spiffs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_commission_spiffs" ON "commission_spiffs";
CREATE POLICY "tenant_isolation_commission_spiffs" ON "commission_spiffs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationChannel (communication_channels)
ALTER TABLE "communication_channels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_channels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_channels" ON "communication_channels";
CREATE POLICY "tenant_isolation_communication_channels" ON "communication_channels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationFileShare (communication_file_shares)
ALTER TABLE "communication_file_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_file_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_file_shares" ON "communication_file_shares";
CREATE POLICY "tenant_isolation_communication_file_shares" ON "communication_file_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationLog (communication_logs)
ALTER TABLE "communication_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_logs" ON "communication_logs";
CREATE POLICY "tenant_isolation_communication_logs" ON "communication_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationOptOut (communication_opt_outs)
ALTER TABLE "communication_opt_outs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_opt_outs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_opt_outs" ON "communication_opt_outs";
CREATE POLICY "tenant_isolation_communication_opt_outs" ON "communication_opt_outs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationPreference (communication_preferences)
ALTER TABLE "communication_preferences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_preferences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_preferences" ON "communication_preferences";
CREATE POLICY "tenant_isolation_communication_preferences" ON "communication_preferences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CommunicationTemplate (communication_templates)
ALTER TABLE "communication_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "communication_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_communication_templates" ON "communication_templates";
CREATE POLICY "tenant_isolation_communication_templates" ON "communication_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CompanyEvent (company_events)
ALTER TABLE "company_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "company_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_company_events" ON "company_events";
CREATE POLICY "tenant_isolation_company_events" ON "company_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CompensationBenchmark (compensation_benchmarks)
ALTER TABLE "compensation_benchmarks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "compensation_benchmarks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_compensation_benchmarks" ON "compensation_benchmarks";
CREATE POLICY "tenant_isolation_compensation_benchmarks" ON "compensation_benchmarks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CompensationReview (compensation_reviews)
ALTER TABLE "compensation_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "compensation_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_compensation_reviews" ON "compensation_reviews";
CREATE POLICY "tenant_isolation_compensation_reviews" ON "compensation_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CompetitiveIntelligence (competitive_intelligence)
ALTER TABLE "competitive_intelligence" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "competitive_intelligence" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_competitive_intelligence" ON "competitive_intelligence";
CREATE POLICY "tenant_isolation_competitive_intelligence" ON "competitive_intelligence"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Competitor (competitors)
ALTER TABLE "competitors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "competitors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_competitors" ON "competitors";
CREATE POLICY "tenant_isolation_competitors" ON "competitors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ComplianceAudit (compliance_audits)
ALTER TABLE "compliance_audits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "compliance_audits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_compliance_audits" ON "compliance_audits";
CREATE POLICY "tenant_isolation_compliance_audits" ON "compliance_audits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ComplianceCheck (compliance_checks)
ALTER TABLE "compliance_checks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "compliance_checks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_compliance_checks" ON "compliance_checks";
CREATE POLICY "tenant_isolation_compliance_checks" ON "compliance_checks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ComplianceRequirement (compliance_requirements)
ALTER TABLE "compliance_requirements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "compliance_requirements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_compliance_requirements" ON "compliance_requirements";
CREATE POLICY "tenant_isolation_compliance_requirements" ON "compliance_requirements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConnectBot (connect_bots)
ALTER TABLE "connect_bots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "connect_bots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_connect_bots" ON "connect_bots";
CREATE POLICY "tenant_isolation_connect_bots" ON "connect_bots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConnectMeeting (connect_meetings)
ALTER TABLE "connect_meetings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "connect_meetings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_connect_meetings" ON "connect_meetings";
CREATE POLICY "tenant_isolation_connect_meetings" ON "connect_meetings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConnectPollVote (connect_poll_votes)
ALTER TABLE "connect_poll_votes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "connect_poll_votes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_connect_poll_votes" ON "connect_poll_votes";
CREATE POLICY "tenant_isolation_connect_poll_votes" ON "connect_poll_votes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConnectPoll (connect_polls)
ALTER TABLE "connect_polls" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "connect_polls" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_connect_polls" ON "connect_polls";
CREATE POLICY "tenant_isolation_connect_polls" ON "connect_polls"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConnectSpace (connect_spaces)
ALTER TABLE "connect_spaces" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "connect_spaces" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_connect_spaces" ON "connect_spaces";
CREATE POLICY "tenant_isolation_connect_spaces" ON "connect_spaces"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsignmentConsumption (consignment_consumptions)
ALTER TABLE "consignment_consumptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consignment_consumptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consignment_consumptions" ON "consignment_consumptions";
CREATE POLICY "tenant_isolation_consignment_consumptions" ON "consignment_consumptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsignmentStock (consignment_stocks)
ALTER TABLE "consignment_stocks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consignment_stocks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consignment_stocks" ON "consignment_stocks";
CREATE POLICY "tenant_isolation_consignment_stocks" ON "consignment_stocks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationEliminationEntry (consolidation_elimination_entries)
ALTER TABLE "consolidation_elimination_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_elimination_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_elimination_entries" ON "consolidation_elimination_entries";
CREATE POLICY "tenant_isolation_consolidation_elimination_entries" ON "consolidation_elimination_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationEliminationRule (consolidation_elimination_rules)
ALTER TABLE "consolidation_elimination_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_elimination_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_elimination_rules" ON "consolidation_elimination_rules";
CREATE POLICY "tenant_isolation_consolidation_elimination_rules" ON "consolidation_elimination_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationElimination (consolidation_eliminations)
ALTER TABLE "consolidation_eliminations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_eliminations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_eliminations" ON "consolidation_eliminations";
CREATE POLICY "tenant_isolation_consolidation_eliminations" ON "consolidation_eliminations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationExecution (consolidation_executions)
ALTER TABLE "consolidation_executions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_executions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_executions" ON "consolidation_executions";
CREATE POLICY "tenant_isolation_consolidation_executions" ON "consolidation_executions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationGroupMember (consolidation_group_members)
ALTER TABLE "consolidation_group_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_group_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_group_members" ON "consolidation_group_members";
CREATE POLICY "tenant_isolation_consolidation_group_members" ON "consolidation_group_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationGroup (consolidation_groups)
ALTER TABLE "consolidation_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_groups" ON "consolidation_groups";
CREATE POLICY "tenant_isolation_consolidation_groups" ON "consolidation_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationRate (consolidation_rates)
ALTER TABLE "consolidation_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_rates" ON "consolidation_rates";
CREATE POLICY "tenant_isolation_consolidation_rates" ON "consolidation_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationRun (consolidation_runs)
ALTER TABLE "consolidation_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_runs" ON "consolidation_runs";
CREATE POLICY "tenant_isolation_consolidation_runs" ON "consolidation_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConsolidationTranslationAdjustment (consolidation_translation_adjustments)
ALTER TABLE "consolidation_translation_adjustments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "consolidation_translation_adjustments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_consolidation_translation_adjustments" ON "consolidation_translation_adjustments";
CREATE POLICY "tenant_isolation_consolidation_translation_adjustments" ON "consolidation_translation_adjustments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContactRole (contact_roles)
ALTER TABLE "contact_roles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contact_roles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contact_roles" ON "contact_roles";
CREATE POLICY "tenant_isolation_contact_roles" ON "contact_roles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContactTag (contact_tags)
ALTER TABLE "contact_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contact_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contact_tags" ON "contact_tags";
CREATE POLICY "tenant_isolation_contact_tags" ON "contact_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Contact (contacts)
ALTER TABLE "contacts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contacts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contacts" ON "contacts";
CREATE POLICY "tenant_isolation_contacts" ON "contacts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContainerTracking (container_tracking)
ALTER TABLE "container_tracking" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "container_tracking" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_container_tracking" ON "container_tracking";
CREATE POLICY "tenant_isolation_container_tracking" ON "container_tracking"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContainerTrackingEvent (container_tracking_events)
ALTER TABLE "container_tracking_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "container_tracking_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_container_tracking_events" ON "container_tracking_events";
CREATE POLICY "tenant_isolation_container_tracking_events" ON "container_tracking_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContainerType (container_types)
ALTER TABLE "container_types" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "container_types" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_container_types" ON "container_types";
CREATE POLICY "tenant_isolation_container_types" ON "container_types"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractAward (contract_awards)
ALTER TABLE "contract_awards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_awards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_awards" ON "contract_awards";
CREATE POLICY "tenant_isolation_contract_awards" ON "contract_awards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractComplianceStatus (contract_compliance_status)
ALTER TABLE "contract_compliance_status" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_compliance_status" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_compliance_status" ON "contract_compliance_status";
CREATE POLICY "tenant_isolation_contract_compliance_status" ON "contract_compliance_status"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractManufacturer (contract_manufacturers)
ALTER TABLE "contract_manufacturers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_manufacturers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_manufacturers" ON "contract_manufacturers";
CREATE POLICY "tenant_isolation_contract_manufacturers" ON "contract_manufacturers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractModification (contract_modifications)
ALTER TABLE "contract_modifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_modifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_modifications" ON "contract_modifications";
CREATE POLICY "tenant_isolation_contract_modifications" ON "contract_modifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractObligation (contract_obligations)
ALTER TABLE "contract_obligations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_obligations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_obligations" ON "contract_obligations";
CREATE POLICY "tenant_isolation_contract_obligations" ON "contract_obligations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractTemplateCategory (contract_template_categories)
ALTER TABLE "contract_template_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_template_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_template_categories" ON "contract_template_categories";
CREATE POLICY "tenant_isolation_contract_template_categories" ON "contract_template_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractVersion (contract_versions)
ALTER TABLE "contract_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "contract_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_contract_versions" ON "contract_versions";
CREATE POLICY "tenant_isolation_contract_versions" ON "contract_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ControlTest (control_tests)
ALTER TABLE "control_tests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "control_tests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_control_tests" ON "control_tests";
CREATE POLICY "tenant_isolation_control_tests" ON "control_tests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ControlTowerAction (control_tower_actions)
ALTER TABLE "control_tower_actions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "control_tower_actions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_control_tower_actions" ON "control_tower_actions";
CREATE POLICY "tenant_isolation_control_tower_actions" ON "control_tower_actions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ControlTowerAlertConfig (control_tower_alert_configs)
ALTER TABLE "control_tower_alert_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "control_tower_alert_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_control_tower_alert_configs" ON "control_tower_alert_configs";
CREATE POLICY "tenant_isolation_control_tower_alert_configs" ON "control_tower_alert_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ControlTowerEvent (control_tower_events)
ALTER TABLE "control_tower_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "control_tower_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_control_tower_events" ON "control_tower_events";
CREATE POLICY "tenant_isolation_control_tower_events" ON "control_tower_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ControlTowerKpi (control_tower_kpis)
ALTER TABLE "control_tower_kpis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "control_tower_kpis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_control_tower_kpis" ON "control_tower_kpis";
CREATE POLICY "tenant_isolation_control_tower_kpis" ON "control_tower_kpis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ConversationMessage (conversation_messages)
ALTER TABLE "conversation_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "conversation_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_conversation_messages" ON "conversation_messages";
CREATE POLICY "tenant_isolation_conversation_messages" ON "conversation_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CorporateCardTransaction (corporate_card_transactions)
ALTER TABLE "corporate_card_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "corporate_card_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_corporate_card_transactions" ON "corporate_card_transactions";
CREATE POLICY "tenant_isolation_corporate_card_transactions" ON "corporate_card_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CorporateCard (corporate_cards)
ALTER TABLE "corporate_cards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "corporate_cards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_corporate_cards" ON "corporate_cards";
CREATE POLICY "tenant_isolation_corporate_cards" ON "corporate_cards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CostAdjustment (cost_adjustments)
ALTER TABLE "cost_adjustments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cost_adjustments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cost_adjustments" ON "cost_adjustments";
CREATE POLICY "tenant_isolation_cost_adjustments" ON "cost_adjustments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CostCenter (cost_centers)
ALTER TABLE "cost_centers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cost_centers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cost_centers" ON "cost_centers";
CREATE POLICY "tenant_isolation_cost_centers" ON "cost_centers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CountSheetItem (count_sheet_items)
ALTER TABLE "count_sheet_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "count_sheet_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_count_sheet_items" ON "count_sheet_items";
CREATE POLICY "tenant_isolation_count_sheet_items" ON "count_sheet_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CountSheet (count_sheets)
ALTER TABLE "count_sheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "count_sheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_count_sheets" ON "count_sheets";
CREATE POLICY "tenant_isolation_count_sheets" ON "count_sheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CountryOfOrigin (countries_of_origin)
ALTER TABLE "countries_of_origin" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "countries_of_origin" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_countries_of_origin" ON "countries_of_origin";
CREATE POLICY "tenant_isolation_countries_of_origin" ON "countries_of_origin"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CreditNote (credit_notes)
ALTER TABLE "credit_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "credit_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_credit_notes" ON "credit_notes";
CREATE POLICY "tenant_isolation_credit_notes" ON "credit_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAbmAccountGroup (crm_abm_account_groups)
ALTER TABLE "crm_abm_account_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_abm_account_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_abm_account_groups" ON "crm_abm_account_groups";
CREATE POLICY "tenant_isolation_crm_abm_account_groups" ON "crm_abm_account_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAccountEngagementLog (crm_account_engagement_logs)
ALTER TABLE "crm_account_engagement_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_account_engagement_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_account_engagement_logs" ON "crm_account_engagement_logs";
CREATE POLICY "tenant_isolation_crm_account_engagement_logs" ON "crm_account_engagement_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAccountHealthRecord (crm_account_health_records)
ALTER TABLE "crm_account_health_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_account_health_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_account_health_records" ON "crm_account_health_records";
CREATE POLICY "tenant_isolation_crm_account_health_records" ON "crm_account_health_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmActionSuggestion (crm_action_suggestions)
ALTER TABLE "crm_action_suggestions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_action_suggestions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_action_suggestions" ON "crm_action_suggestions";
CREATE POLICY "tenant_isolation_crm_action_suggestions" ON "crm_action_suggestions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAiDraft (crm_ai_drafts)
ALTER TABLE "crm_ai_drafts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_ai_drafts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_ai_drafts" ON "crm_ai_drafts";
CREATE POLICY "tenant_isolation_crm_ai_drafts" ON "crm_ai_drafts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalAction (crm_approval_actions)
ALTER TABLE "crm_approval_actions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_approval_actions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_approval_actions" ON "crm_approval_actions";
CREATE POLICY "tenant_isolation_crm_approval_actions" ON "crm_approval_actions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalProcess (crm_approval_processes)
ALTER TABLE "crm_approval_processes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_approval_processes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_approval_processes" ON "crm_approval_processes";
CREATE POLICY "tenant_isolation_crm_approval_processes" ON "crm_approval_processes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ApprovalRequest (crm_approval_requests)
ALTER TABLE "crm_approval_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_approval_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_approval_requests" ON "crm_approval_requests";
CREATE POLICY "tenant_isolation_crm_approval_requests" ON "crm_approval_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAttributionModel (crm_attribution_models)
ALTER TABLE "crm_attribution_models" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_attribution_models" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_attribution_models" ON "crm_attribution_models";
CREATE POLICY "tenant_isolation_crm_attribution_models" ON "crm_attribution_models"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmAudienceSegmentRule (crm_audience_segment_rules)
ALTER TABLE "crm_audience_segment_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_audience_segment_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_audience_segment_rules" ON "crm_audience_segment_rules";
CREATE POLICY "tenant_isolation_crm_audience_segment_rules" ON "crm_audience_segment_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmBuyingCommitteeMember (crm_buying_committee_members)
ALTER TABLE "crm_buying_committee_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_buying_committee_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_buying_committee_members" ON "crm_buying_committee_members";
CREATE POLICY "tenant_isolation_crm_buying_committee_members" ON "crm_buying_committee_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmCampaignNode (crm_campaign_nodes)
ALTER TABLE "crm_campaign_nodes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_campaign_nodes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_campaign_nodes" ON "crm_campaign_nodes";
CREATE POLICY "tenant_isolation_crm_campaign_nodes" ON "crm_campaign_nodes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CaseComment (crm_case_comments)
ALTER TABLE "crm_case_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_case_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_case_comments" ON "crm_case_comments";
CREATE POLICY "tenant_isolation_crm_case_comments" ON "crm_case_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Case (crm_cases)
ALTER TABLE "crm_cases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_cases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_cases" ON "crm_cases";
CREATE POLICY "tenant_isolation_crm_cases" ON "crm_cases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmComment (crm_comments)
ALTER TABLE "crm_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_comments" ON "crm_comments";
CREATE POLICY "tenant_isolation_crm_comments" ON "crm_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmCompetitorBattlecard (crm_competitor_battlecards)
ALTER TABLE "crm_competitor_battlecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_competitor_battlecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_competitor_battlecards" ON "crm_competitor_battlecards";
CREATE POLICY "tenant_isolation_crm_competitor_battlecards" ON "crm_competitor_battlecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractAmendment (crm_contract_amendments)
ALTER TABLE "crm_contract_amendments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_amendments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_amendments" ON "crm_contract_amendments";
CREATE POLICY "tenant_isolation_crm_contract_amendments" ON "crm_contract_amendments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractAutoRenewalLog (crm_contract_auto_renewal_logs)
ALTER TABLE "crm_contract_auto_renewal_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_auto_renewal_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_auto_renewal_logs" ON "crm_contract_auto_renewal_logs";
CREATE POLICY "tenant_isolation_crm_contract_auto_renewal_logs" ON "crm_contract_auto_renewal_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractBillingMilestone (crm_contract_billing_milestones)
ALTER TABLE "crm_contract_billing_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_billing_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_billing_milestones" ON "crm_contract_billing_milestones";
CREATE POLICY "tenant_isolation_crm_contract_billing_milestones" ON "crm_contract_billing_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractClause (crm_contract_clauses)
ALTER TABLE "crm_contract_clauses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_clauses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_clauses" ON "crm_contract_clauses";
CREATE POLICY "tenant_isolation_crm_contract_clauses" ON "crm_contract_clauses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractExpirationPipelineItem (crm_contract_expiration_pipeline_items)
ALTER TABLE "crm_contract_expiration_pipeline_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_expiration_pipeline_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_expiration_pipeline_items" ON "crm_contract_expiration_pipeline_items";
CREATE POLICY "tenant_isolation_crm_contract_expiration_pipeline_items" ON "crm_contract_expiration_pipeline_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractLineItem (crm_contract_line_items)
ALTER TABLE "crm_contract_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_line_items" ON "crm_contract_line_items";
CREATE POLICY "tenant_isolation_crm_contract_line_items" ON "crm_contract_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractPriceEscalationRule (crm_contract_price_escalation_rules)
ALTER TABLE "crm_contract_price_escalation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_price_escalation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_price_escalation_rules" ON "crm_contract_price_escalation_rules";
CREATE POLICY "tenant_isolation_crm_contract_price_escalation_rules" ON "crm_contract_price_escalation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ContractTemplate (crm_contract_templates)
ALTER TABLE "crm_contract_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contract_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contract_templates" ON "crm_contract_templates";
CREATE POLICY "tenant_isolation_crm_contract_templates" ON "crm_contract_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Contract (crm_contracts)
ALTER TABLE "crm_contracts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_contracts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_contracts" ON "crm_contracts";
CREATE POLICY "tenant_isolation_crm_contracts" ON "crm_contracts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmCustomFieldValue (crm_custom_field_values)
ALTER TABLE "crm_custom_field_values" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_custom_field_values" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_custom_field_values" ON "crm_custom_field_values";
CREATE POLICY "tenant_isolation_crm_custom_field_values" ON "crm_custom_field_values"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmCustomField (crm_custom_fields)
ALTER TABLE "crm_custom_fields" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_custom_fields" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_custom_fields" ON "crm_custom_fields";
CREATE POLICY "tenant_isolation_crm_custom_fields" ON "crm_custom_fields"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmCustomerFeedbackSurvey (crm_customer_feedback_surveys)
ALTER TABLE "crm_customer_feedback_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_customer_feedback_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_customer_feedback_surveys" ON "crm_customer_feedback_surveys";
CREATE POLICY "tenant_isolation_crm_customer_feedback_surveys" ON "crm_customer_feedback_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDashboardShare (crm_dashboard_shares)
ALTER TABLE "crm_dashboard_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_dashboard_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_dashboard_shares" ON "crm_dashboard_shares";
CREATE POLICY "tenant_isolation_crm_dashboard_shares" ON "crm_dashboard_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDashboardTemplate (crm_dashboard_templates)
ALTER TABLE "crm_dashboard_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_dashboard_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_dashboard_templates" ON "crm_dashboard_templates";
CREATE POLICY "tenant_isolation_crm_dashboard_templates" ON "crm_dashboard_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDashboardWidget (crm_dashboard_widgets)
ALTER TABLE "crm_dashboard_widgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_dashboard_widgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_dashboard_widgets" ON "crm_dashboard_widgets";
CREATE POLICY "tenant_isolation_crm_dashboard_widgets" ON "crm_dashboard_widgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDashboard (crm_dashboards)
ALTER TABLE "crm_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_dashboards" ON "crm_dashboards";
CREATE POLICY "tenant_isolation_crm_dashboards" ON "crm_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDealGuidance (crm_deal_guidances)
ALTER TABLE "crm_deal_guidances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_deal_guidances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_deal_guidances" ON "crm_deal_guidances";
CREATE POLICY "tenant_isolation_crm_deal_guidances" ON "crm_deal_guidances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDealReadinessScore (crm_deal_readiness_scores)
ALTER TABLE "crm_deal_readiness_scores" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_deal_readiness_scores" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_deal_readiness_scores" ON "crm_deal_readiness_scores";
CREATE POLICY "tenant_isolation_crm_deal_readiness_scores" ON "crm_deal_readiness_scores"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmDocument (crm_documents)
ALTER TABLE "crm_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_documents" ON "crm_documents";
CREATE POLICY "tenant_isolation_crm_documents" ON "crm_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DuplicateRule (crm_duplicate_rules)
ALTER TABLE "crm_duplicate_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_duplicate_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_duplicate_rules" ON "crm_duplicate_rules";
CREATE POLICY "tenant_isolation_crm_duplicate_rules" ON "crm_duplicate_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentCache (crm_enrichment_cache)
ALTER TABLE "crm_enrichment_cache" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_cache" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_cache" ON "crm_enrichment_cache";
CREATE POLICY "tenant_isolation_crm_enrichment_cache" ON "crm_enrichment_cache"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentFieldMapping (crm_enrichment_field_mappings)
ALTER TABLE "crm_enrichment_field_mappings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_field_mappings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_field_mappings" ON "crm_enrichment_field_mappings";
CREATE POLICY "tenant_isolation_crm_enrichment_field_mappings" ON "crm_enrichment_field_mappings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentJobStep (crm_enrichment_job_steps)
ALTER TABLE "crm_enrichment_job_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_job_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_job_steps" ON "crm_enrichment_job_steps";
CREATE POLICY "tenant_isolation_crm_enrichment_job_steps" ON "crm_enrichment_job_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentJob (crm_enrichment_jobs)
ALTER TABLE "crm_enrichment_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_jobs" ON "crm_enrichment_jobs";
CREATE POLICY "tenant_isolation_crm_enrichment_jobs" ON "crm_enrichment_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentLog (crm_enrichment_logs)
ALTER TABLE "crm_enrichment_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_logs" ON "crm_enrichment_logs";
CREATE POLICY "tenant_isolation_crm_enrichment_logs" ON "crm_enrichment_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentProvider (crm_enrichment_providers)
ALTER TABLE "crm_enrichment_providers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_providers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_providers" ON "crm_enrichment_providers";
CREATE POLICY "tenant_isolation_crm_enrichment_providers" ON "crm_enrichment_providers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentRule (crm_enrichment_rules)
ALTER TABLE "crm_enrichment_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_rules" ON "crm_enrichment_rules";
CREATE POLICY "tenant_isolation_crm_enrichment_rules" ON "crm_enrichment_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentSchedule (crm_enrichment_schedules)
ALTER TABLE "crm_enrichment_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_schedules" ON "crm_enrichment_schedules";
CREATE POLICY "tenant_isolation_crm_enrichment_schedules" ON "crm_enrichment_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentSource (crm_enrichment_sources)
ALTER TABLE "crm_enrichment_sources" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_sources" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_sources" ON "crm_enrichment_sources";
CREATE POLICY "tenant_isolation_crm_enrichment_sources" ON "crm_enrichment_sources"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEnrichmentWorkflow (crm_enrichment_workflows)
ALTER TABLE "crm_enrichment_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_enrichment_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_enrichment_workflows" ON "crm_enrichment_workflows";
CREATE POLICY "tenant_isolation_crm_enrichment_workflows" ON "crm_enrichment_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmEventWebinar (crm_event_webinars)
ALTER TABLE "crm_event_webinars" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_event_webinars" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_event_webinars" ON "crm_event_webinars";
CREATE POLICY "tenant_isolation_crm_event_webinars" ON "crm_event_webinars"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmFieldVisitSchedule (crm_field_visit_schedules)
ALTER TABLE "crm_field_visit_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_field_visit_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_field_visit_schedules" ON "crm_field_visit_schedules";
CREATE POLICY "tenant_isolation_crm_field_visit_schedules" ON "crm_field_visit_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmFollower (crm_followers)
ALTER TABLE "crm_followers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_followers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_followers" ON "crm_followers";
CREATE POLICY "tenant_isolation_crm_followers" ON "crm_followers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmGuidedSellingPlaybook (crm_guided_selling_playbooks)
ALTER TABLE "crm_guided_selling_playbooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_guided_selling_playbooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_guided_selling_playbooks" ON "crm_guided_selling_playbooks";
CREATE POLICY "tenant_isolation_crm_guided_selling_playbooks" ON "crm_guided_selling_playbooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmHealthScoreConfig (crm_health_score_configs)
ALTER TABLE "crm_health_score_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_health_score_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_health_score_configs" ON "crm_health_score_configs";
CREATE POLICY "tenant_isolation_crm_health_score_configs" ON "crm_health_score_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmIntentSignal (crm_intent_signals)
ALTER TABLE "crm_intent_signals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_intent_signals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_intent_signals" ON "crm_intent_signals";
CREATE POLICY "tenant_isolation_crm_intent_signals" ON "crm_intent_signals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmLeadEnrichmentData (crm_lead_enrichment_data)
ALTER TABLE "crm_lead_enrichment_data" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_lead_enrichment_data" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_lead_enrichment_data" ON "crm_lead_enrichment_data";
CREATE POLICY "tenant_isolation_crm_lead_enrichment_data" ON "crm_lead_enrichment_data"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmLeadRoundRobinState (crm_lead_round_robin_states)
ALTER TABLE "crm_lead_round_robin_states" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_lead_round_robin_states" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_lead_round_robin_states" ON "crm_lead_round_robin_states";
CREATE POLICY "tenant_isolation_crm_lead_round_robin_states" ON "crm_lead_round_robin_states"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmLeadRoutingHistory (crm_lead_routing_history)
ALTER TABLE "crm_lead_routing_history" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_lead_routing_history" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_lead_routing_history" ON "crm_lead_routing_history";
CREATE POLICY "tenant_isolation_crm_lead_routing_history" ON "crm_lead_routing_history"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmLeadRoutingRule (crm_lead_routing_rules)
ALTER TABLE "crm_lead_routing_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_lead_routing_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_lead_routing_rules" ON "crm_lead_routing_rules";
CREATE POLICY "tenant_isolation_crm_lead_routing_rules" ON "crm_lead_routing_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeadScoringRule (crm_lead_scoring_rules)
ALTER TABLE "crm_lead_scoring_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_lead_scoring_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_lead_scoring_rules" ON "crm_lead_scoring_rules";
CREATE POLICY "tenant_isolation_crm_lead_scoring_rules" ON "crm_lead_scoring_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MailboxConnection (crm_mailbox_connections)
ALTER TABLE "crm_mailbox_connections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_mailbox_connections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_mailbox_connections" ON "crm_mailbox_connections";
CREATE POLICY "tenant_isolation_crm_mailbox_connections" ON "crm_mailbox_connections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmMarketingAsset (crm_marketing_assets)
ALTER TABLE "crm_marketing_assets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_marketing_assets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_marketing_assets" ON "crm_marketing_assets";
CREATE POLICY "tenant_isolation_crm_marketing_assets" ON "crm_marketing_assets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmNextBestActionConfig (crm_next_best_action_configs)
ALTER TABLE "crm_next_best_action_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_next_best_action_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_next_best_action_configs" ON "crm_next_best_action_configs";
CREATE POLICY "tenant_isolation_crm_next_best_action_configs" ON "crm_next_best_action_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmNote (crm_notes)
ALTER TABLE "crm_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_notes" ON "crm_notes";
CREATE POLICY "tenant_isolation_crm_notes" ON "crm_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmNpsResponse (crm_nps_responses)
ALTER TABLE "crm_nps_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_nps_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_nps_responses" ON "crm_nps_responses";
CREATE POLICY "tenant_isolation_crm_nps_responses" ON "crm_nps_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmObjectionHandler (crm_objection_handlers)
ALTER TABLE "crm_objection_handlers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_objection_handlers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_objection_handlers" ON "crm_objection_handlers";
CREATE POLICY "tenant_isolation_crm_objection_handlers" ON "crm_objection_handlers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmOmnichannelCampaign (crm_omnichannel_campaigns)
ALTER TABLE "crm_omnichannel_campaigns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_omnichannel_campaigns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_omnichannel_campaigns" ON "crm_omnichannel_campaigns";
CREATE POLICY "tenant_isolation_crm_omnichannel_campaigns" ON "crm_omnichannel_campaigns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmPartnerCertification (crm_partner_certifications)
ALTER TABLE "crm_partner_certifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_partner_certifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_partner_certifications" ON "crm_partner_certifications";
CREATE POLICY "tenant_isolation_crm_partner_certifications" ON "crm_partner_certifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmPartnerTierBenefit (crm_partner_tier_benefits)
ALTER TABLE "crm_partner_tier_benefits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_partner_tier_benefits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_partner_tier_benefits" ON "crm_partner_tier_benefits";
CREATE POLICY "tenant_isolation_crm_partner_tier_benefits" ON "crm_partner_tier_benefits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PipelineStage (crm_pipeline_stages)
ALTER TABLE "crm_pipeline_stages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_pipeline_stages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_pipeline_stages" ON "crm_pipeline_stages";
CREATE POLICY "tenant_isolation_crm_pipeline_stages" ON "crm_pipeline_stages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmPlaybookAction (crm_playbook_actions)
ALTER TABLE "crm_playbook_actions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_playbook_actions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_playbook_actions" ON "crm_playbook_actions";
CREATE POLICY "tenant_isolation_crm_playbook_actions" ON "crm_playbook_actions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmPlaybookStage (crm_playbook_stages)
ALTER TABLE "crm_playbook_stages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_playbook_stages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_playbook_stages" ON "crm_playbook_stages";
CREATE POLICY "tenant_isolation_crm_playbook_stages" ON "crm_playbook_stages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmRecordType (crm_record_types)
ALTER TABLE "crm_record_types" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_record_types" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_record_types" ON "crm_record_types";
CREATE POLICY "tenant_isolation_crm_record_types" ON "crm_record_types"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmRenewalPipeline (crm_renewal_pipelines)
ALTER TABLE "crm_renewal_pipelines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_renewal_pipelines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_renewal_pipelines" ON "crm_renewal_pipelines";
CREATE POLICY "tenant_isolation_crm_renewal_pipelines" ON "crm_renewal_pipelines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmReportSchedule (crm_report_schedules)
ALTER TABLE "crm_report_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_report_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_report_schedules" ON "crm_report_schedules";
CREATE POLICY "tenant_isolation_crm_report_schedules" ON "crm_report_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmReportShare (crm_report_shares)
ALTER TABLE "crm_report_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_report_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_report_shares" ON "crm_report_shares";
CREATE POLICY "tenant_isolation_crm_report_shares" ON "crm_report_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmSalesPlaybook (crm_sales_playbooks)
ALTER TABLE "crm_sales_playbooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_sales_playbooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_sales_playbooks" ON "crm_sales_playbooks";
CREATE POLICY "tenant_isolation_crm_sales_playbooks" ON "crm_sales_playbooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmSalesRoutePlan (crm_sales_route_plans)
ALTER TABLE "crm_sales_route_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_sales_route_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_sales_route_plans" ON "crm_sales_route_plans";
CREATE POLICY "tenant_isolation_crm_sales_route_plans" ON "crm_sales_route_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmSavedReport (crm_saved_reports)
ALTER TABLE "crm_saved_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_saved_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_saved_reports" ON "crm_saved_reports";
CREATE POLICY "tenant_isolation_crm_saved_reports" ON "crm_saved_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Segment (crm_segments)
ALTER TABLE "crm_segments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_segments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_segments" ON "crm_segments";
CREATE POLICY "tenant_isolation_crm_segments" ON "crm_segments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SlaBreach (crm_sla_breaches)
ALTER TABLE "crm_sla_breaches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_sla_breaches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_sla_breaches" ON "crm_sla_breaches";
CREATE POLICY "tenant_isolation_crm_sla_breaches" ON "crm_sla_breaches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SlaPolicy (crm_sla_policies)
ALTER TABLE "crm_sla_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_sla_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_sla_policies" ON "crm_sla_policies";
CREATE POLICY "tenant_isolation_crm_sla_policies" ON "crm_sla_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrmWorkflowRule (crm_workflow_rules)
ALTER TABLE "crm_workflow_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "crm_workflow_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_crm_workflow_rules" ON "crm_workflow_rules";
CREATE POLICY "tenant_isolation_crm_workflow_rules" ON "crm_workflow_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CrossDockEvent (cross_dock_events)
ALTER TABLE "cross_dock_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cross_dock_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cross_dock_events" ON "cross_dock_events";
CREATE POLICY "tenant_isolation_cross_dock_events" ON "cross_dock_events"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for CrossDockOrder (cross_dock_orders)
ALTER TABLE "cross_dock_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cross_dock_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cross_dock_orders" ON "cross_dock_orders";
CREATE POLICY "tenant_isolation_cross_dock_orders" ON "cross_dock_orders"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for CrossDockStation (cross_dock_stations)
ALTER TABLE "cross_dock_stations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cross_dock_stations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cross_dock_stations" ON "cross_dock_stations";
CREATE POLICY "tenant_isolation_cross_dock_stations" ON "cross_dock_stations"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for CrossSellRule (cross_sell_rules)
ALTER TABLE "cross_sell_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cross_sell_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cross_sell_rules" ON "cross_sell_rules";
CREATE POLICY "tenant_isolation_cross_sell_rules" ON "cross_sell_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Currency (currencies)
ALTER TABLE "currencies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "currencies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_currencies" ON "currencies";
CREATE POLICY "tenant_isolation_currencies" ON "currencies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CurrencyRevaluation (currency_revaluations)
ALTER TABLE "currency_revaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "currency_revaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_currency_revaluations" ON "currency_revaluations";
CREATE POLICY "tenant_isolation_currency_revaluations" ON "currency_revaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomDashboard (custom_dashboards)
ALTER TABLE "custom_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_dashboards" ON "custom_dashboards";
CREATE POLICY "tenant_isolation_custom_dashboards" ON "custom_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomEmoji (custom_emojis)
ALTER TABLE "custom_emojis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_emojis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_emojis" ON "custom_emojis";
CREATE POLICY "tenant_isolation_custom_emojis" ON "custom_emojis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomFieldDefinition (custom_field_definitions)
ALTER TABLE "custom_field_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_field_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_field_definitions" ON "custom_field_definitions";
CREATE POLICY "tenant_isolation_custom_field_definitions" ON "custom_field_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomFieldValue (custom_field_values)
ALTER TABLE "custom_field_values" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_field_values" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_field_values" ON "custom_field_values";
CREATE POLICY "tenant_isolation_custom_field_values" ON "custom_field_values"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomObjectDefinition (custom_object_definitions)
ALTER TABLE "custom_object_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_object_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_object_definitions" ON "custom_object_definitions";
CREATE POLICY "tenant_isolation_custom_object_definitions" ON "custom_object_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomObjectFieldDefinition (custom_object_field_definitions)
ALTER TABLE "custom_object_field_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_object_field_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_object_field_definitions" ON "custom_object_field_definitions";
CREATE POLICY "tenant_isolation_custom_object_field_definitions" ON "custom_object_field_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomRecord (custom_records)
ALTER TABLE "custom_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_records" ON "custom_records";
CREATE POLICY "tenant_isolation_custom_records" ON "custom_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomWidget (custom_widgets)
ALTER TABLE "custom_widgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_widgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_widgets" ON "custom_widgets";
CREATE POLICY "tenant_isolation_custom_widgets" ON "custom_widgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomWorkflow (custom_workflows)
ALTER TABLE "custom_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "custom_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_custom_workflows" ON "custom_workflows";
CREATE POLICY "tenant_isolation_custom_workflows" ON "custom_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerCatalogItem (customer_catalog_items)
ALTER TABLE "customer_catalog_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_catalog_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_catalog_items" ON "customer_catalog_items";
CREATE POLICY "tenant_isolation_customer_catalog_items" ON "customer_catalog_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerCatalog (customer_catalogs)
ALTER TABLE "customer_catalogs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_catalogs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_catalogs" ON "customer_catalogs";
CREATE POLICY "tenant_isolation_customer_catalogs" ON "customer_catalogs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerConsignmentConsumption (customer_consignment_consumptions)
ALTER TABLE "customer_consignment_consumptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_consignment_consumptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_consignment_consumptions" ON "customer_consignment_consumptions";
CREATE POLICY "tenant_isolation_customer_consignment_consumptions" ON "customer_consignment_consumptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerConsignmentStock (customer_consignment_stocks)
ALTER TABLE "customer_consignment_stocks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_consignment_stocks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_consignment_stocks" ON "customer_consignment_stocks";
CREATE POLICY "tenant_isolation_customer_consignment_stocks" ON "customer_consignment_stocks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerCreditScorecard (customer_credit_scorecards)
ALTER TABLE "customer_credit_scorecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_credit_scorecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_credit_scorecards" ON "customer_credit_scorecards";
CREATE POLICY "tenant_isolation_customer_credit_scorecards" ON "customer_credit_scorecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerCreditScore (customer_credit_scores)
ALTER TABLE "customer_credit_scores" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_credit_scores" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_credit_scores" ON "customer_credit_scores";
CREATE POLICY "tenant_isolation_customer_credit_scores" ON "customer_credit_scores"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerHealthLog (customer_health_logs)
ALTER TABLE "customer_health_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_health_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_health_logs" ON "customer_health_logs";
CREATE POLICY "tenant_isolation_customer_health_logs" ON "customer_health_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerPortalMessage (customer_portal_messages)
ALTER TABLE "customer_portal_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_portal_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_portal_messages" ON "customer_portal_messages";
CREATE POLICY "tenant_isolation_customer_portal_messages" ON "customer_portal_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerPortalUser (customer_portal_users)
ALTER TABLE "customer_portal_users" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_portal_users" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_portal_users" ON "customer_portal_users";
CREATE POLICY "tenant_isolation_customer_portal_users" ON "customer_portal_users"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerPriceListItem (customer_price_list_items)
ALTER TABLE "customer_price_list_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_price_list_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_price_list_items" ON "customer_price_list_items";
CREATE POLICY "tenant_isolation_customer_price_list_items" ON "customer_price_list_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerPriceList (customer_price_lists)
ALTER TABLE "customer_price_lists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_price_lists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_price_lists" ON "customer_price_lists";
CREATE POLICY "tenant_isolation_customer_price_lists" ON "customer_price_lists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerRmaLine (customer_rma_lines)
ALTER TABLE "customer_rma_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_rma_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_rma_lines" ON "customer_rma_lines";
CREATE POLICY "tenant_isolation_customer_rma_lines" ON "customer_rma_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerRma (customer_rmas)
ALTER TABLE "customer_rmas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_rmas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_rmas" ON "customer_rmas";
CREATE POLICY "tenant_isolation_customer_rmas" ON "customer_rmas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerSatisfaction (customer_satisfaction)
ALTER TABLE "customer_satisfaction" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_satisfaction" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_satisfaction" ON "customer_satisfaction";
CREATE POLICY "tenant_isolation_customer_satisfaction" ON "customer_satisfaction"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerStatement (customer_statements)
ALTER TABLE "customer_statements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_statements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_statements" ON "customer_statements";
CREATE POLICY "tenant_isolation_customer_statements" ON "customer_statements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerSuccessMilestone (customer_success_milestones)
ALTER TABLE "customer_success_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_success_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_success_milestones" ON "customer_success_milestones";
CREATE POLICY "tenant_isolation_customer_success_milestones" ON "customer_success_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerSuccessPlan (customer_success_plans)
ALTER TABLE "customer_success_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_success_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_success_plans" ON "customer_success_plans";
CREATE POLICY "tenant_isolation_customer_success_plans" ON "customer_success_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomerTag (customer_tags)
ALTER TABLE "customer_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customer_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customer_tags" ON "customer_tags";
CREATE POLICY "tenant_isolation_customer_tags" ON "customer_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Customer (customers)
ALTER TABLE "customers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customers" ON "customers";
CREATE POLICY "tenant_isolation_customers" ON "customers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CustomsDocument (customs_documents)
ALTER TABLE "customs_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "customs_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_customs_documents" ON "customs_documents";
CREATE POLICY "tenant_isolation_customs_documents" ON "customs_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CycleCountItem (cycle_count_items)
ALTER TABLE "cycle_count_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cycle_count_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cycle_count_items" ON "cycle_count_items";
CREATE POLICY "tenant_isolation_cycle_count_items" ON "cycle_count_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CycleCountSchedule (cycle_count_schedules)
ALTER TABLE "cycle_count_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cycle_count_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cycle_count_schedules" ON "cycle_count_schedules";
CREATE POLICY "tenant_isolation_cycle_count_schedules" ON "cycle_count_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for CycleCount (cycle_counts)
ALTER TABLE "cycle_counts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "cycle_counts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_cycle_counts" ON "cycle_counts";
CREATE POLICY "tenant_isolation_cycle_counts" ON "cycle_counts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DashboardDefinition (dashboard_definitions)
ALTER TABLE "dashboard_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dashboard_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dashboard_definitions" ON "dashboard_definitions";
CREATE POLICY "tenant_isolation_dashboard_definitions" ON "dashboard_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DashboardWidget (dashboard_widgets)
ALTER TABLE "dashboard_widgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dashboard_widgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dashboard_widgets" ON "dashboard_widgets";
CREATE POLICY "tenant_isolation_dashboard_widgets" ON "dashboard_widgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Dashboard (dashboards)
ALTER TABLE "dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dashboards" ON "dashboards";
CREATE POLICY "tenant_isolation_dashboards" ON "dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DataBreach (data_breaches)
ALTER TABLE "data_breaches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "data_breaches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_data_breaches" ON "data_breaches";
CREATE POLICY "tenant_isolation_data_breaches" ON "data_breaches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DataErasureRequest (data_erasure_requests)
ALTER TABLE "data_erasure_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "data_erasure_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_data_erasure_requests" ON "data_erasure_requests";
CREATE POLICY "tenant_isolation_data_erasure_requests" ON "data_erasure_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DataExportJob (data_export_jobs)
ALTER TABLE "data_export_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "data_export_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_data_export_jobs" ON "data_export_jobs";
CREATE POLICY "tenant_isolation_data_export_jobs" ON "data_export_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DataImportJob (data_import_jobs)
ALTER TABLE "data_import_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "data_import_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_data_import_jobs" ON "data_import_jobs";
CREATE POLICY "tenant_isolation_data_import_jobs" ON "data_import_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DataRetentionPolicy (data_retention_policies)
ALTER TABLE "data_retention_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "data_retention_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_data_retention_policies" ON "data_retention_policies";
CREATE POLICY "tenant_isolation_data_retention_policies" ON "data_retention_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DdmrpBuffer (ddmrp_buffers)
ALTER TABLE "ddmrp_buffers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ddmrp_buffers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ddmrp_buffers" ON "ddmrp_buffers";
CREATE POLICY "tenant_isolation_ddmrp_buffers" ON "ddmrp_buffers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DdmrpNetFlowStatus (ddmrp_net_flow_statuses)
ALTER TABLE "ddmrp_net_flow_statuses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ddmrp_net_flow_statuses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ddmrp_net_flow_statuses" ON "ddmrp_net_flow_statuses";
CREATE POLICY "tenant_isolation_ddmrp_net_flow_statuses" ON "ddmrp_net_flow_statuses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DdmrpPart (ddmrp_parts)
ALTER TABLE "ddmrp_parts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ddmrp_parts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ddmrp_parts" ON "ddmrp_parts";
CREATE POLICY "tenant_isolation_ddmrp_parts" ON "ddmrp_parts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DdmrpRecommendation (ddmrp_recommendations)
ALTER TABLE "ddmrp_recommendations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ddmrp_recommendations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ddmrp_recommendations" ON "ddmrp_recommendations";
CREATE POLICY "tenant_isolation_ddmrp_recommendations" ON "ddmrp_recommendations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealAlert (deal_alerts)
ALTER TABLE "deal_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_alerts" ON "deal_alerts";
CREATE POLICY "tenant_isolation_deal_alerts" ON "deal_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealDeskRequest (deal_desk_requests)
ALTER TABLE "deal_desk_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_desk_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_desk_requests" ON "deal_desk_requests";
CREATE POLICY "tenant_isolation_deal_desk_requests" ON "deal_desk_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealRiskDigestRun (deal_risk_digest_runs)
ALTER TABLE "deal_risk_digest_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_risk_digest_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_risk_digest_runs" ON "deal_risk_digest_runs";
CREATE POLICY "tenant_isolation_deal_risk_digest_runs" ON "deal_risk_digest_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealRoomDocument (deal_room_documents)
ALTER TABLE "deal_room_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_room_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_room_documents" ON "deal_room_documents";
CREATE POLICY "tenant_isolation_deal_room_documents" ON "deal_room_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealRoomMilestone (deal_room_milestones)
ALTER TABLE "deal_room_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_room_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_room_milestones" ON "deal_room_milestones";
CREATE POLICY "tenant_isolation_deal_room_milestones" ON "deal_room_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealRoomStakeholder (deal_room_stakeholders)
ALTER TABLE "deal_room_stakeholders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_room_stakeholders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_room_stakeholders" ON "deal_room_stakeholders";
CREATE POLICY "tenant_isolation_deal_room_stakeholders" ON "deal_room_stakeholders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealRoom (deal_rooms)
ALTER TABLE "deal_rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_rooms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_rooms" ON "deal_rooms";
CREATE POLICY "tenant_isolation_deal_rooms" ON "deal_rooms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealTag (deal_tags)
ALTER TABLE "deal_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_tags" ON "deal_tags";
CREATE POLICY "tenant_isolation_deal_tags" ON "deal_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DealTeamMember (deal_team_members)
ALTER TABLE "deal_team_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deal_team_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deal_team_members" ON "deal_team_members";
CREATE POLICY "tenant_isolation_deal_team_members" ON "deal_team_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DebitNote (debit_notes)
ALTER TABLE "debit_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "debit_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_debit_notes" ON "debit_notes";
CREATE POLICY "tenant_isolation_debit_notes" ON "debit_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DebtFacility (debt_facilities)
ALTER TABLE "debt_facilities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "debt_facilities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_debt_facilities" ON "debt_facilities";
CREATE POLICY "tenant_isolation_debt_facilities" ON "debt_facilities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DecisionTableRule (decision_table_rules)
ALTER TABLE "decision_table_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "decision_table_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_decision_table_rules" ON "decision_table_rules";
CREATE POLICY "tenant_isolation_decision_table_rules" ON "decision_table_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DecisionTable (decision_tables)
ALTER TABLE "decision_tables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "decision_tables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_decision_tables" ON "decision_tables";
CREATE POLICY "tenant_isolation_decision_tables" ON "decision_tables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeferredRevenueRollForward (deferred_revenue_roll_forwards)
ALTER TABLE "deferred_revenue_roll_forwards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deferred_revenue_roll_forwards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deferred_revenue_roll_forwards" ON "deferred_revenue_roll_forwards";
CREATE POLICY "tenant_isolation_deferred_revenue_roll_forwards" ON "deferred_revenue_roll_forwards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeferredTaxSchedule (deferred_tax_schedules)
ALTER TABLE "deferred_tax_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deferred_tax_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deferred_tax_schedules" ON "deferred_tax_schedules";
CREATE POLICY "tenant_isolation_deferred_tax_schedules" ON "deferred_tax_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DEIMetric (dei_metrics)
ALTER TABLE "dei_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dei_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dei_metrics" ON "dei_metrics";
CREATE POLICY "tenant_isolation_dei_metrics" ON "dei_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DEIReport (dei_reports)
ALTER TABLE "dei_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dei_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dei_reports" ON "dei_reports";
CREATE POLICY "tenant_isolation_dei_reports" ON "dei_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Delegation (delegations)
ALTER TABLE "delegations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delegations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delegations" ON "delegations";
CREATE POLICY "tenant_isolation_delegations" ON "delegations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeliveryConfirmationLine (delivery_confirmation_lines)
ALTER TABLE "delivery_confirmation_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_confirmation_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_confirmation_lines" ON "delivery_confirmation_lines";
CREATE POLICY "tenant_isolation_delivery_confirmation_lines" ON "delivery_confirmation_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentDeliveryConfirmation (delivery_confirmations)
ALTER TABLE "delivery_confirmations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_confirmations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_confirmations" ON "delivery_confirmations";
CREATE POLICY "tenant_isolation_delivery_confirmations" ON "delivery_confirmations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeliveryNoteItem (delivery_note_items)
ALTER TABLE "delivery_note_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_note_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_note_items" ON "delivery_note_items";
CREATE POLICY "tenant_isolation_delivery_note_items" ON "delivery_note_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeliveryNote (delivery_notes)
ALTER TABLE "delivery_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_notes" ON "delivery_notes";
CREATE POLICY "tenant_isolation_delivery_notes" ON "delivery_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeliveryTimeSlot (delivery_time_slots)
ALTER TABLE "delivery_time_slots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_time_slots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_time_slots" ON "delivery_time_slots";
CREATE POLICY "tenant_isolation_delivery_time_slots" ON "delivery_time_slots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeliveryZone (delivery_zones)
ALTER TABLE "delivery_zones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "delivery_zones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_delivery_zones" ON "delivery_zones";
CREATE POLICY "tenant_isolation_delivery_zones" ON "delivery_zones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemandForecastLine (demand_forecast_lines)
ALTER TABLE "demand_forecast_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demand_forecast_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demand_forecast_lines" ON "demand_forecast_lines";
CREATE POLICY "tenant_isolation_demand_forecast_lines" ON "demand_forecast_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemandForecastRun (demand_forecast_runs)
ALTER TABLE "demand_forecast_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demand_forecast_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demand_forecast_runs" ON "demand_forecast_runs";
CREATE POLICY "tenant_isolation_demand_forecast_runs" ON "demand_forecast_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemandForecast (demand_forecasts)
ALTER TABLE "demand_forecasts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demand_forecasts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demand_forecasts" ON "demand_forecasts";
CREATE POLICY "tenant_isolation_demand_forecasts" ON "demand_forecasts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemandSenseResult (demand_sense_results)
ALTER TABLE "demand_sense_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demand_sense_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demand_sense_results" ON "demand_sense_results";
CREATE POLICY "tenant_isolation_demand_sense_results" ON "demand_sense_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemandSenseRun (demand_sense_runs)
ALTER TABLE "demand_sense_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demand_sense_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demand_sense_runs" ON "demand_sense_runs";
CREATE POLICY "tenant_isolation_demand_sense_runs" ON "demand_sense_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DemoDataRecord (demo_data_records)
ALTER TABLE "demo_data_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "demo_data_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_demo_data_records" ON "demo_data_records";
CREATE POLICY "tenant_isolation_demo_data_records" ON "demo_data_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeniedPartyEntry (denied_party_entries)
ALTER TABLE "denied_party_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "denied_party_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_denied_party_entries" ON "denied_party_entries";
CREATE POLICY "tenant_isolation_denied_party_entries" ON "denied_party_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Department (departments)
ALTER TABLE "departments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "departments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_departments" ON "departments";
CREATE POLICY "tenant_isolation_departments" ON "departments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeploymentAnalytics (deployment_analytics)
ALTER TABLE "deployment_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deployment_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deployment_analytics" ON "deployment_analytics";
CREATE POLICY "tenant_isolation_deployment_analytics" ON "deployment_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeploymentStage (deployment_stages)
ALTER TABLE "deployment_stages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deployment_stages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deployment_stages" ON "deployment_stages";
CREATE POLICY "tenant_isolation_deployment_stages" ON "deployment_stages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Deployment (deployments)
ALTER TABLE "deployments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deployments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deployments" ON "deployments";
CREATE POLICY "tenant_isolation_deployments" ON "deployments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DesignToken (design_tokens)
ALTER TABLE "design_tokens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "design_tokens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_design_tokens" ON "design_tokens";
CREATE POLICY "tenant_isolation_design_tokens" ON "design_tokens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DeviationRecord (deviation_records)
ALTER TABLE "deviation_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "deviation_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_deviation_records" ON "deviation_records";
CREATE POLICY "tenant_isolation_deviation_records" ON "deviation_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DiscountApprovalMatrix (discount_approval_matrix)
ALTER TABLE "discount_approval_matrix" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "discount_approval_matrix" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_discount_approval_matrix" ON "discount_approval_matrix";
CREATE POLICY "tenant_isolation_discount_approval_matrix" ON "discount_approval_matrix"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DiscussionReply (discussion_replies)
ALTER TABLE "discussion_replies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "discussion_replies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_discussion_replies" ON "discussion_replies";
CREATE POLICY "tenant_isolation_discussion_replies" ON "discussion_replies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DisputeResolution (dispute_resolutions)
ALTER TABLE "dispute_resolutions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dispute_resolutions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dispute_resolutions" ON "dispute_resolutions";
CREATE POLICY "tenant_isolation_dispute_resolutions" ON "dispute_resolutions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DistributionPlanRun (distribution_plan_runs)
ALTER TABLE "distribution_plan_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "distribution_plan_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_distribution_plan_runs" ON "distribution_plan_runs";
CREATE POLICY "tenant_isolation_distribution_plan_runs" ON "distribution_plan_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DistributionPlan (distribution_plans)
ALTER TABLE "distribution_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "distribution_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_distribution_plans" ON "distribution_plans";
CREATE POLICY "tenant_isolation_distribution_plans" ON "distribution_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DockAppointment (dock_appointments)
ALTER TABLE "dock_appointments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dock_appointments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dock_appointments" ON "dock_appointments";
CREATE POLICY "tenant_isolation_dock_appointments" ON "dock_appointments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DockDoor (dock_doors)
ALTER TABLE "dock_doors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dock_doors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dock_doors" ON "dock_doors";
CREATE POLICY "tenant_isolation_dock_doors" ON "dock_doors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentAnnotation (document_annotations)
ALTER TABLE "document_annotations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_annotations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_annotations" ON "document_annotations";
CREATE POLICY "tenant_isolation_document_annotations" ON "document_annotations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentApproval (document_approvals)
ALTER TABLE "document_approvals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_approvals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_approvals" ON "document_approvals";
CREATE POLICY "tenant_isolation_document_approvals" ON "document_approvals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentAuditLog (document_audit_logs)
ALTER TABLE "document_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_audit_logs" ON "document_audit_logs";
CREATE POLICY "tenant_isolation_document_audit_logs" ON "document_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentCategory (document_categories)
ALTER TABLE "document_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_categories" ON "document_categories";
CREATE POLICY "tenant_isolation_document_categories" ON "document_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentComment (document_comments)
ALTER TABLE "document_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_comments" ON "document_comments";
CREATE POLICY "tenant_isolation_document_comments" ON "document_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentExport (document_exports)
ALTER TABLE "document_exports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_exports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_exports" ON "document_exports";
CREATE POLICY "tenant_isolation_document_exports" ON "document_exports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentFavorite (document_favorites)
ALTER TABLE "document_favorites" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_favorites" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_favorites" ON "document_favorites";
CREATE POLICY "tenant_isolation_document_favorites" ON "document_favorites"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentLock (document_locks)
ALTER TABLE "document_locks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_locks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_locks" ON "document_locks";
CREATE POLICY "tenant_isolation_document_locks" ON "document_locks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentRecentItem (document_recent_items)
ALTER TABLE "document_recent_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_recent_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_recent_items" ON "document_recent_items";
CREATE POLICY "tenant_isolation_document_recent_items" ON "document_recent_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentReview (document_reviews)
ALTER TABLE "document_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_reviews" ON "document_reviews";
CREATE POLICY "tenant_isolation_document_reviews" ON "document_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentSequence (document_sequences)
ALTER TABLE "document_sequences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_sequences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_sequences" ON "document_sequences";
CREATE POLICY "tenant_isolation_document_sequences" ON "document_sequences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentShare (document_shares)
ALTER TABLE "document_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_shares" ON "document_shares";
CREATE POLICY "tenant_isolation_document_shares" ON "document_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentSmartCollection (document_smart_collections)
ALTER TABLE "document_smart_collections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_smart_collections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_smart_collections" ON "document_smart_collections";
CREATE POLICY "tenant_isolation_document_smart_collections" ON "document_smart_collections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentTagAssignment (document_tag_assignments)
ALTER TABLE "document_tag_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_tag_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_tag_assignments" ON "document_tag_assignments";
CREATE POLICY "tenant_isolation_document_tag_assignments" ON "document_tag_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentTag (document_tags)
ALTER TABLE "document_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_tags" ON "document_tags";
CREATE POLICY "tenant_isolation_document_tags" ON "document_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentTemplate (document_templates)
ALTER TABLE "document_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_templates" ON "document_templates";
CREATE POLICY "tenant_isolation_document_templates" ON "document_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentVersion (document_versions)
ALTER TABLE "document_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_versions" ON "document_versions";
CREATE POLICY "tenant_isolation_document_versions" ON "document_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentWatermark (document_watermarks)
ALTER TABLE "document_watermarks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_watermarks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_watermarks" ON "document_watermarks";
CREATE POLICY "tenant_isolation_document_watermarks" ON "document_watermarks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DocumentWorkflow (document_workflows)
ALTER TABLE "document_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "document_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_document_workflows" ON "document_workflows";
CREATE POLICY "tenant_isolation_document_workflows" ON "document_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Document (documents)
ALTER TABLE "documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_documents" ON "documents";
CREATE POLICY "tenant_isolation_documents" ON "documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveActivity (drive_activities)
ALTER TABLE "drive_activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_activities" ON "drive_activities";
CREATE POLICY "tenant_isolation_drive_activities" ON "drive_activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFileComment (drive_file_comments)
ALTER TABLE "drive_file_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_file_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_file_comments" ON "drive_file_comments";
CREATE POLICY "tenant_isolation_drive_file_comments" ON "drive_file_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFileTag (drive_file_tags)
ALTER TABLE "drive_file_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_file_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_file_tags" ON "drive_file_tags";
CREATE POLICY "tenant_isolation_drive_file_tags" ON "drive_file_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFileVersion (drive_file_versions)
ALTER TABLE "drive_file_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_file_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_file_versions" ON "drive_file_versions";
CREATE POLICY "tenant_isolation_drive_file_versions" ON "drive_file_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFile (drive_files)
ALTER TABLE "drive_files" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_files" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_files" ON "drive_files";
CREATE POLICY "tenant_isolation_drive_files" ON "drive_files"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFolderPermission (drive_folder_permissions)
ALTER TABLE "drive_folder_permissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_folder_permissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_folder_permissions" ON "drive_folder_permissions";
CREATE POLICY "tenant_isolation_drive_folder_permissions" ON "drive_folder_permissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFolderShare (drive_folder_shares)
ALTER TABLE "drive_folder_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_folder_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_folder_shares" ON "drive_folder_shares";
CREATE POLICY "tenant_isolation_drive_folder_shares" ON "drive_folder_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveFolder (drive_folders)
ALTER TABLE "drive_folders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_folders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_folders" ON "drive_folders";
CREATE POLICY "tenant_isolation_drive_folders" ON "drive_folders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveShareLink (drive_share_links)
ALTER TABLE "drive_share_links" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_share_links" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_share_links" ON "drive_share_links";
CREATE POLICY "tenant_isolation_drive_share_links" ON "drive_share_links"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveStorageQuota (drive_storage_quotas)
ALTER TABLE "drive_storage_quotas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_storage_quotas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_storage_quotas" ON "drive_storage_quotas";
CREATE POLICY "tenant_isolation_drive_storage_quotas" ON "drive_storage_quotas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DriveTrashItem (drive_trash_items)
ALTER TABLE "drive_trash_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drive_trash_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drive_trash_items" ON "drive_trash_items";
CREATE POLICY "tenant_isolation_drive_trash_items" ON "drive_trash_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DropShipOrderItem (drop_ship_order_items)
ALTER TABLE "drop_ship_order_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drop_ship_order_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drop_ship_order_items" ON "drop_ship_order_items";
CREATE POLICY "tenant_isolation_drop_ship_order_items" ON "drop_ship_order_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DropShipOrder (drop_ship_orders)
ALTER TABLE "drop_ship_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drop_ship_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drop_ship_orders" ON "drop_ship_orders";
CREATE POLICY "tenant_isolation_drop_ship_orders" ON "drop_ship_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DropShipProvider (drop_ship_providers)
ALTER TABLE "drop_ship_providers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "drop_ship_providers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_drop_ship_providers" ON "drop_ship_providers";
CREATE POLICY "tenant_isolation_drop_ship_providers" ON "drop_ship_providers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DunningLevel (dunning_levels)
ALTER TABLE "dunning_levels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dunning_levels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dunning_levels" ON "dunning_levels";
CREATE POLICY "tenant_isolation_dunning_levels" ON "dunning_levels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DunningRun (dunning_runs)
ALTER TABLE "dunning_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dunning_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dunning_runs" ON "dunning_runs";
CREATE POLICY "tenant_isolation_dunning_runs" ON "dunning_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DuplicateSet (duplicate_sets)
ALTER TABLE "duplicate_sets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "duplicate_sets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_duplicate_sets" ON "duplicate_sets";
CREATE POLICY "tenant_isolation_duplicate_sets" ON "duplicate_sets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DynamicDiscountOffer (dynamic_discount_offers)
ALTER TABLE "dynamic_discount_offers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dynamic_discount_offers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dynamic_discount_offers" ON "dynamic_discount_offers";
CREATE POLICY "tenant_isolation_dynamic_discount_offers" ON "dynamic_discount_offers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for DynamicDiscountRequest (dynamic_discount_requests)
ALTER TABLE "dynamic_discount_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "dynamic_discount_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_dynamic_discount_requests" ON "dynamic_discount_requests";
CREATE POLICY "tenant_isolation_dynamic_discount_requests" ON "dynamic_discount_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EInvoice (e_invoices)
ALTER TABLE "e_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "e_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_e_invoices" ON "e_invoices";
CREATE POLICY "tenant_isolation_e_invoices" ON "e_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceAbandonedCart (ecommerce_abandoned_carts)
ALTER TABLE "ecommerce_abandoned_carts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_abandoned_carts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_abandoned_carts" ON "ecommerce_abandoned_carts";
CREATE POLICY "tenant_isolation_ecommerce_abandoned_carts" ON "ecommerce_abandoned_carts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceCartItem (ecommerce_cart_items)
ALTER TABLE "ecommerce_cart_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_cart_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_cart_items" ON "ecommerce_cart_items";
CREATE POLICY "tenant_isolation_ecommerce_cart_items" ON "ecommerce_cart_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceCart (ecommerce_carts)
ALTER TABLE "ecommerce_carts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_carts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_carts" ON "ecommerce_carts";
CREATE POLICY "tenant_isolation_ecommerce_carts" ON "ecommerce_carts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceCategory (ecommerce_categories)
ALTER TABLE "ecommerce_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_categories" ON "ecommerce_categories";
CREATE POLICY "tenant_isolation_ecommerce_categories" ON "ecommerce_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceCouponUsage (ecommerce_coupon_usage)
ALTER TABLE "ecommerce_coupon_usage" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_coupon_usage" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_coupon_usage" ON "ecommerce_coupon_usage";
CREATE POLICY "tenant_isolation_ecommerce_coupon_usage" ON "ecommerce_coupon_usage"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceCoupon (ecommerce_coupons)
ALTER TABLE "ecommerce_coupons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_coupons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_coupons" ON "ecommerce_coupons";
CREATE POLICY "tenant_isolation_ecommerce_coupons" ON "ecommerce_coupons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceInventory (ecommerce_inventory)
ALTER TABLE "ecommerce_inventory" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_inventory" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_inventory" ON "ecommerce_inventory";
CREATE POLICY "tenant_isolation_ecommerce_inventory" ON "ecommerce_inventory"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceOrderItem (ecommerce_order_items)
ALTER TABLE "ecommerce_order_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_order_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_order_items" ON "ecommerce_order_items";
CREATE POLICY "tenant_isolation_ecommerce_order_items" ON "ecommerce_order_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceOrder (ecommerce_orders)
ALTER TABLE "ecommerce_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_orders" ON "ecommerce_orders";
CREATE POLICY "tenant_isolation_ecommerce_orders" ON "ecommerce_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommercePayment (ecommerce_payments)
ALTER TABLE "ecommerce_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_payments" ON "ecommerce_payments";
CREATE POLICY "tenant_isolation_ecommerce_payments" ON "ecommerce_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceProductListing (ecommerce_product_listings)
ALTER TABLE "ecommerce_product_listings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_product_listings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_product_listings" ON "ecommerce_product_listings";
CREATE POLICY "tenant_isolation_ecommerce_product_listings" ON "ecommerce_product_listings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceProductVariant (ecommerce_product_variants)
ALTER TABLE "ecommerce_product_variants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_product_variants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_product_variants" ON "ecommerce_product_variants";
CREATE POLICY "tenant_isolation_ecommerce_product_variants" ON "ecommerce_product_variants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceReturn (ecommerce_returns)
ALTER TABLE "ecommerce_returns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_returns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_returns" ON "ecommerce_returns";
CREATE POLICY "tenant_isolation_ecommerce_returns" ON "ecommerce_returns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceReviewMedia (ecommerce_review_media)
ALTER TABLE "ecommerce_review_media" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_review_media" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_review_media" ON "ecommerce_review_media";
CREATE POLICY "tenant_isolation_ecommerce_review_media" ON "ecommerce_review_media"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceReview (ecommerce_reviews)
ALTER TABLE "ecommerce_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_reviews" ON "ecommerce_reviews";
CREATE POLICY "tenant_isolation_ecommerce_reviews" ON "ecommerce_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceShipment (ecommerce_shipments)
ALTER TABLE "ecommerce_shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_shipments" ON "ecommerce_shipments";
CREATE POLICY "tenant_isolation_ecommerce_shipments" ON "ecommerce_shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceShippingRate (ecommerce_shipping_rates)
ALTER TABLE "ecommerce_shipping_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_shipping_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_shipping_rates" ON "ecommerce_shipping_rates";
CREATE POLICY "tenant_isolation_ecommerce_shipping_rates" ON "ecommerce_shipping_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceShippingZone (ecommerce_shipping_zones)
ALTER TABLE "ecommerce_shipping_zones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_shipping_zones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_shipping_zones" ON "ecommerce_shipping_zones";
CREATE POLICY "tenant_isolation_ecommerce_shipping_zones" ON "ecommerce_shipping_zones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceStoreSetting (ecommerce_store_settings)
ALTER TABLE "ecommerce_store_settings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_store_settings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_store_settings" ON "ecommerce_store_settings";
CREATE POLICY "tenant_isolation_ecommerce_store_settings" ON "ecommerce_store_settings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceStoreTheme (ecommerce_store_themes)
ALTER TABLE "ecommerce_store_themes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_store_themes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_store_themes" ON "ecommerce_store_themes";
CREATE POLICY "tenant_isolation_ecommerce_store_themes" ON "ecommerce_store_themes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceStore (ecommerce_stores)
ALTER TABLE "ecommerce_stores" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_stores" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_stores" ON "ecommerce_stores";
CREATE POLICY "tenant_isolation_ecommerce_stores" ON "ecommerce_stores"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceTaxClass (ecommerce_tax_classes)
ALTER TABLE "ecommerce_tax_classes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_tax_classes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_tax_classes" ON "ecommerce_tax_classes";
CREATE POLICY "tenant_isolation_ecommerce_tax_classes" ON "ecommerce_tax_classes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceTaxRate (ecommerce_tax_rates)
ALTER TABLE "ecommerce_tax_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_tax_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_tax_rates" ON "ecommerce_tax_rates";
CREATE POLICY "tenant_isolation_ecommerce_tax_rates" ON "ecommerce_tax_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceWishlistItem (ecommerce_wishlist_items)
ALTER TABLE "ecommerce_wishlist_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_wishlist_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_wishlist_items" ON "ecommerce_wishlist_items";
CREATE POLICY "tenant_isolation_ecommerce_wishlist_items" ON "ecommerce_wishlist_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EcommerceWishlist (ecommerce_wishlists)
ALTER TABLE "ecommerce_wishlists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ecommerce_wishlists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ecommerce_wishlists" ON "ecommerce_wishlists";
CREATE POLICY "tenant_isolation_ecommerce_wishlists" ON "ecommerce_wishlists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EconomicNexusThreshold (economic_nexus_thresholds)
ALTER TABLE "economic_nexus_thresholds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "economic_nexus_thresholds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_economic_nexus_thresholds" ON "economic_nexus_thresholds";
CREATE POLICY "tenant_isolation_economic_nexus_thresholds" ON "economic_nexus_thresholds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EdiInventoryTransaction (edi_inventory_transactions)
ALTER TABLE "edi_inventory_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "edi_inventory_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_edi_inventory_transactions" ON "edi_inventory_transactions";
CREATE POLICY "tenant_isolation_edi_inventory_transactions" ON "edi_inventory_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationAssignmentSubmission (education_assignment_submissions)
ALTER TABLE "education_assignment_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_assignment_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_assignment_submissions" ON "education_assignment_submissions";
CREATE POLICY "tenant_isolation_education_assignment_submissions" ON "education_assignment_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationAttendanceRecord (education_attendance_records)
ALTER TABLE "education_attendance_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_attendance_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_attendance_records" ON "education_attendance_records";
CREATE POLICY "tenant_isolation_education_attendance_records" ON "education_attendance_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationAttendance (education_attendances)
ALTER TABLE "education_attendances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_attendances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_attendances" ON "education_attendances";
CREATE POLICY "tenant_isolation_education_attendances" ON "education_attendances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationBook (education_books)
ALTER TABLE "education_books" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_books" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_books" ON "education_books";
CREATE POLICY "tenant_isolation_education_books" ON "education_books"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationCourseModule (education_course_modules)
ALTER TABLE "education_course_modules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_course_modules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_course_modules" ON "education_course_modules";
CREATE POLICY "tenant_isolation_education_course_modules" ON "education_course_modules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationCourse (education_courses)
ALTER TABLE "education_courses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_courses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_courses" ON "education_courses";
CREATE POLICY "tenant_isolation_education_courses" ON "education_courses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationEnrollment (education_enrollments)
ALTER TABLE "education_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_enrollments" ON "education_enrollments";
CREATE POLICY "tenant_isolation_education_enrollments" ON "education_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationExamResult (education_exam_results)
ALTER TABLE "education_exam_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_exam_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_exam_results" ON "education_exam_results";
CREATE POLICY "tenant_isolation_education_exam_results" ON "education_exam_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationExamSchedule (education_exam_schedules)
ALTER TABLE "education_exam_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_exam_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_exam_schedules" ON "education_exam_schedules";
CREATE POLICY "tenant_isolation_education_exam_schedules" ON "education_exam_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationFeeInvoice (education_fee_invoices)
ALTER TABLE "education_fee_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_fee_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_fee_invoices" ON "education_fee_invoices";
CREATE POLICY "tenant_isolation_education_fee_invoices" ON "education_fee_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationFeePayment (education_fee_payments)
ALTER TABLE "education_fee_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_fee_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_fee_payments" ON "education_fee_payments";
CREATE POLICY "tenant_isolation_education_fee_payments" ON "education_fee_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationFeeStructure (education_fee_structures)
ALTER TABLE "education_fee_structures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_fee_structures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_fee_structures" ON "education_fee_structures";
CREATE POLICY "tenant_isolation_education_fee_structures" ON "education_fee_structures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationGradeEntry (education_grade_entries)
ALTER TABLE "education_grade_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_grade_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_grade_entries" ON "education_grade_entries";
CREATE POLICY "tenant_isolation_education_grade_entries" ON "education_grade_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationGradebook (education_gradebooks)
ALTER TABLE "education_gradebooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_gradebooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_gradebooks" ON "education_gradebooks";
CREATE POLICY "tenant_isolation_education_gradebooks" ON "education_gradebooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Grade (education_grades)
ALTER TABLE "education_grades" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_grades" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_grades" ON "education_grades";
CREATE POLICY "tenant_isolation_education_grades" ON "education_grades"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationLibraryFine (education_library_fines)
ALTER TABLE "education_library_fines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_library_fines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_library_fines" ON "education_library_fines";
CREATE POLICY "tenant_isolation_education_library_fines" ON "education_library_fines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationParent (education_parents)
ALTER TABLE "education_parents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_parents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_parents" ON "education_parents";
CREATE POLICY "tenant_isolation_education_parents" ON "education_parents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationReportCard (education_report_cards)
ALTER TABLE "education_report_cards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_report_cards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_report_cards" ON "education_report_cards";
CREATE POLICY "tenant_isolation_education_report_cards" ON "education_report_cards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationScholarship (education_scholarships)
ALTER TABLE "education_scholarships" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_scholarships" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_scholarships" ON "education_scholarships";
CREATE POLICY "tenant_isolation_education_scholarships" ON "education_scholarships"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationStudentParent (education_student_parents)
ALTER TABLE "education_student_parents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_student_parents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_student_parents" ON "education_student_parents";
CREATE POLICY "tenant_isolation_education_student_parents" ON "education_student_parents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationStudent (education_students)
ALTER TABLE "education_students" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_students" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_students" ON "education_students";
CREATE POLICY "tenant_isolation_education_students" ON "education_students"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EducationTimetable (education_timetables)
ALTER TABLE "education_timetables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "education_timetables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_education_timetables" ON "education_timetables";
CREATE POLICY "tenant_isolation_education_timetables" ON "education_timetables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EliminationRule (elimination_rules)
ALTER TABLE "elimination_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "elimination_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_elimination_rules" ON "elimination_rules";
CREATE POLICY "tenant_isolation_elimination_rules" ON "elimination_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EliminationRun (elimination_runs)
ALTER TABLE "elimination_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "elimination_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_elimination_runs" ON "elimination_runs";
CREATE POLICY "tenant_isolation_elimination_runs" ON "elimination_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailInbox (email_inboxes)
ALTER TABLE "email_inboxes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_inboxes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_inboxes" ON "email_inboxes";
CREATE POLICY "tenant_isolation_email_inboxes" ON "email_inboxes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailMessage (email_messages)
ALTER TABLE "email_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_messages" ON "email_messages";
CREATE POLICY "tenant_isolation_email_messages" ON "email_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailRule (email_rules)
ALTER TABLE "email_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_rules" ON "email_rules";
CREATE POLICY "tenant_isolation_email_rules" ON "email_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailSequenceEnrollment (email_sequence_enrollments)
ALTER TABLE "email_sequence_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_sequence_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_sequence_enrollments" ON "email_sequence_enrollments";
CREATE POLICY "tenant_isolation_email_sequence_enrollments" ON "email_sequence_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailSequence (email_sequences)
ALTER TABLE "email_sequences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_sequences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_sequences" ON "email_sequences";
CREATE POLICY "tenant_isolation_email_sequences" ON "email_sequences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailTemplate (email_templates)
ALTER TABLE "email_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_templates" ON "email_templates";
CREATE POLICY "tenant_isolation_email_templates" ON "email_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmailVerificationToken (email_verification_tokens)
ALTER TABLE "email_verification_tokens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "email_verification_tokens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_email_verification_tokens" ON "email_verification_tokens";
CREATE POLICY "tenant_isolation_email_verification_tokens" ON "email_verification_tokens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmissionOffsetCredit (emission_offset_credits)
ALTER TABLE "emission_offset_credits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "emission_offset_credits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_emission_offset_credits" ON "emission_offset_credits";
CREATE POLICY "tenant_isolation_emission_offset_credits" ON "emission_offset_credits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmissionSourceRecord (emission_source_records)
ALTER TABLE "emission_source_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "emission_source_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_emission_source_records" ON "emission_source_records";
CREATE POLICY "tenant_isolation_emission_source_records" ON "emission_source_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeAchievement (employee_achievements)
ALTER TABLE "employee_achievements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_achievements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_achievements" ON "employee_achievements";
CREATE POLICY "tenant_isolation_employee_achievements" ON "employee_achievements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeBenefit (employee_benefits)
ALTER TABLE "employee_benefits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_benefits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_benefits" ON "employee_benefits";
CREATE POLICY "tenant_isolation_employee_benefits" ON "employee_benefits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeDependent (employee_dependents)
ALTER TABLE "employee_dependents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_dependents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_dependents" ON "employee_dependents";
CREATE POLICY "tenant_isolation_employee_dependents" ON "employee_dependents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeDocument (employee_documents)
ALTER TABLE "employee_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_documents" ON "employee_documents";
CREATE POLICY "tenant_isolation_employee_documents" ON "employee_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeEducation (employee_education)
ALTER TABLE "employee_education" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_education" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_education" ON "employee_education";
CREATE POLICY "tenant_isolation_employee_education" ON "employee_education"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeEmergencyContact (employee_emergency_contacts)
ALTER TABLE "employee_emergency_contacts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_emergency_contacts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_emergency_contacts" ON "employee_emergency_contacts";
CREATE POLICY "tenant_isolation_employee_emergency_contacts" ON "employee_emergency_contacts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeGrievance (employee_grievances)
ALTER TABLE "employee_grievances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_grievances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_grievances" ON "employee_grievances";
CREATE POLICY "tenant_isolation_employee_grievances" ON "employee_grievances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeJourneyMilestone (employee_journey_milestones)
ALTER TABLE "employee_journey_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_journey_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_journey_milestones" ON "employee_journey_milestones";
CREATE POLICY "tenant_isolation_employee_journey_milestones" ON "employee_journey_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeePromotion (employee_promotions)
ALTER TABLE "employee_promotions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_promotions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_promotions" ON "employee_promotions";
CREATE POLICY "tenant_isolation_employee_promotions" ON "employee_promotions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeRecognitionAward (employee_recognition_awards)
ALTER TABLE "employee_recognition_awards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_recognition_awards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_recognition_awards" ON "employee_recognition_awards";
CREATE POLICY "tenant_isolation_employee_recognition_awards" ON "employee_recognition_awards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeRecognition (employee_recognitions)
ALTER TABLE "employee_recognitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_recognitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_recognitions" ON "employee_recognitions";
CREATE POLICY "tenant_isolation_employee_recognitions" ON "employee_recognitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeReferral (employee_referrals)
ALTER TABLE "employee_referrals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_referrals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_referrals" ON "employee_referrals";
CREATE POLICY "tenant_isolation_employee_referrals" ON "employee_referrals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeSeparation (employee_separations)
ALTER TABLE "employee_separations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_separations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_separations" ON "employee_separations";
CREATE POLICY "tenant_isolation_employee_separations" ON "employee_separations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeSkill (employee_skills)
ALTER TABLE "employee_skills" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_skills" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_skills" ON "employee_skills";
CREATE POLICY "tenant_isolation_employee_skills" ON "employee_skills"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeWarning (employee_warnings)
ALTER TABLE "employee_warnings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_warnings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_warnings" ON "employee_warnings";
CREATE POLICY "tenant_isolation_employee_warnings" ON "employee_warnings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EmployeeWellnessProgram (employee_wellness_programs)
ALTER TABLE "employee_wellness_programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employee_wellness_programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employee_wellness_programs" ON "employee_wellness_programs";
CREATE POLICY "tenant_isolation_employee_wellness_programs" ON "employee_wellness_programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Employee (employees)
ALTER TABLE "employees" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "employees" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_employees" ON "employees";
CREATE POLICY "tenant_isolation_employees" ON "employees"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EndpointRegistry (endpoint_registries)
ALTER TABLE "endpoint_registries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "endpoint_registries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_endpoint_registries" ON "endpoint_registries";
CREATE POLICY "tenant_isolation_endpoint_registries" ON "endpoint_registries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnergyCostAllocation (energy_cost_allocations)
ALTER TABLE "energy_cost_allocations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "energy_cost_allocations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_energy_cost_allocations" ON "energy_cost_allocations";
CREATE POLICY "tenant_isolation_energy_cost_allocations" ON "energy_cost_allocations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnergyKpiTarget (energy_kpi_targets)
ALTER TABLE "energy_kpi_targets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "energy_kpi_targets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_energy_kpi_targets" ON "energy_kpi_targets";
CREATE POLICY "tenant_isolation_energy_kpi_targets" ON "energy_kpi_targets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnergyMeter (energy_meters)
ALTER TABLE "energy_meters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "energy_meters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_energy_meters" ON "energy_meters";
CREATE POLICY "tenant_isolation_energy_meters" ON "energy_meters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnergyReading (energy_readings)
ALTER TABLE "energy_readings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "energy_readings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_energy_readings" ON "energy_readings";
CREATE POLICY "tenant_isolation_energy_readings" ON "energy_readings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EngagementSurvey (engagement_surveys)
ALTER TABLE "engagement_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "engagement_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_engagement_surveys" ON "engagement_surveys";
CREATE POLICY "tenant_isolation_engagement_surveys" ON "engagement_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EngineeringChangeOrder (engineering_change_orders)
ALTER TABLE "engineering_change_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "engineering_change_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_engineering_change_orders" ON "engineering_change_orders";
CREATE POLICY "tenant_isolation_engineering_change_orders" ON "engineering_change_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for eNPSurvey (enp_surveys)
ALTER TABLE "enp_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "enp_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_enp_surveys" ON "enp_surveys";
CREATE POLICY "tenant_isolation_enp_surveys" ON "enp_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnvVariable (env_variables)
ALTER TABLE "env_variables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "env_variables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_env_variables" ON "env_variables";
CREATE POLICY "tenant_isolation_env_variables" ON "env_variables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EnvironmentConfig (environment_configs)
ALTER TABLE "environment_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "environment_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_environment_configs" ON "environment_configs";
CREATE POLICY "tenant_isolation_environment_configs" ON "environment_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Environment (environments)
ALTER TABLE "environments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "environments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_environments" ON "environments";
CREATE POLICY "tenant_isolation_environments" ON "environments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EquipmentTool (equipment_tools)
ALTER TABLE "equipment_tools" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "equipment_tools" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_equipment_tools" ON "equipment_tools";
CREATE POLICY "tenant_isolation_equipment_tools" ON "equipment_tools"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EquityGrant (equity_grants)
ALTER TABLE "equity_grants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "equity_grants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_equity_grants" ON "equity_grants";
CREATE POLICY "tenant_isolation_equity_grants" ON "equity_grants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EquityVestingSchedule (equity_vesting_schedules)
ALTER TABLE "equity_vesting_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "equity_vesting_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_equity_vesting_schedules" ON "equity_vesting_schedules";
CREATE POLICY "tenant_isolation_equity_vesting_schedules" ON "equity_vesting_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ErrorLog (error_logs)
ALTER TABLE "error_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "error_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_error_logs" ON "error_logs";
CREATE POLICY "tenant_isolation_error_logs" ON "error_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EsgDisclosureMapping (esg_disclosure_mappings)
ALTER TABLE "esg_disclosure_mappings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "esg_disclosure_mappings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_esg_disclosure_mappings" ON "esg_disclosure_mappings";
CREATE POLICY "tenant_isolation_esg_disclosure_mappings" ON "esg_disclosure_mappings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EsgKpiActualValue (esg_kpi_actual_values)
ALTER TABLE "esg_kpi_actual_values" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "esg_kpi_actual_values" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_esg_kpi_actual_values" ON "esg_kpi_actual_values";
CREATE POLICY "tenant_isolation_esg_kpi_actual_values" ON "esg_kpi_actual_values"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EsgKpiDefinition (esg_kpi_definitions)
ALTER TABLE "esg_kpi_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "esg_kpi_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_esg_kpi_definitions" ON "esg_kpi_definitions";
CREATE POLICY "tenant_isolation_esg_kpi_definitions" ON "esg_kpi_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EsgReportTemplate (esg_report_templates)
ALTER TABLE "esg_report_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "esg_report_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_esg_report_templates" ON "esg_report_templates";
CREATE POLICY "tenant_isolation_esg_report_templates" ON "esg_report_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EstateGrant (estate_grants)
ALTER TABLE "estate_grants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "estate_grants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_estate_grants" ON "estate_grants";
CREATE POLICY "tenant_isolation_estate_grants" ON "estate_grants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EtlDataSource (etl_data_sources)
ALTER TABLE "etl_data_sources" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "etl_data_sources" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_etl_data_sources" ON "etl_data_sources";
CREATE POLICY "tenant_isolation_etl_data_sources" ON "etl_data_sources"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EtlJobRun (etl_job_runs)
ALTER TABLE "etl_job_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "etl_job_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_etl_job_runs" ON "etl_job_runs";
CREATE POLICY "tenant_isolation_etl_job_runs" ON "etl_job_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EtlMapping (etl_mappings)
ALTER TABLE "etl_mappings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "etl_mappings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_etl_mappings" ON "etl_mappings";
CREATE POLICY "tenant_isolation_etl_mappings" ON "etl_mappings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EtlPipeline (etl_pipelines)
ALTER TABLE "etl_pipelines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "etl_pipelines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_etl_pipelines" ON "etl_pipelines";
CREATE POLICY "tenant_isolation_etl_pipelines" ON "etl_pipelines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EventDefinition (event_definitions)
ALTER TABLE "event_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "event_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_event_definitions" ON "event_definitions";
CREATE POLICY "tenant_isolation_event_definitions" ON "event_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EventRsvp (event_rsvps)
ALTER TABLE "event_rsvps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "event_rsvps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_event_rsvps" ON "event_rsvps";
CREATE POLICY "tenant_isolation_event_rsvps" ON "event_rsvps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EventTrigger (event_triggers)
ALTER TABLE "event_triggers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "event_triggers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_event_triggers" ON "event_triggers";
CREATE POLICY "tenant_isolation_event_triggers" ON "event_triggers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EvmBaseline (evm_baselines)
ALTER TABLE "evm_baselines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "evm_baselines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_evm_baselines" ON "evm_baselines";
CREATE POLICY "tenant_isolation_evm_baselines" ON "evm_baselines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EvmForecast (evm_forecasts)
ALTER TABLE "evm_forecasts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "evm_forecasts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_evm_forecasts" ON "evm_forecasts";
CREATE POLICY "tenant_isolation_evm_forecasts" ON "evm_forecasts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EvmKpiTarget (evm_kpi_targets)
ALTER TABLE "evm_kpi_targets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "evm_kpi_targets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_evm_kpi_targets" ON "evm_kpi_targets";
CREATE POLICY "tenant_isolation_evm_kpi_targets" ON "evm_kpi_targets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EvmMeasurement (evm_measurements)
ALTER TABLE "evm_measurements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "evm_measurements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_evm_measurements" ON "evm_measurements";
CREATE POLICY "tenant_isolation_evm_measurements" ON "evm_measurements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for EvmSnapshot (evm_snapshots)
ALTER TABLE "evm_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "evm_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_evm_snapshots" ON "evm_snapshots";
CREATE POLICY "tenant_isolation_evm_snapshots" ON "evm_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExchangeRate (exchange_rates)
ALTER TABLE "exchange_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "exchange_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_exchange_rates" ON "exchange_rates";
CREATE POLICY "tenant_isolation_exchange_rates" ON "exchange_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExitInterview (exit_interviews)
ALTER TABLE "exit_interviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "exit_interviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_exit_interviews" ON "exit_interviews";
CREATE POLICY "tenant_isolation_exit_interviews" ON "exit_interviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpansionRevenue (expansion_revenues)
ALTER TABLE "expansion_revenues" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expansion_revenues" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expansion_revenues" ON "expansion_revenues";
CREATE POLICY "tenant_isolation_expansion_revenues" ON "expansion_revenues"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpectedCreditLossProvision (expected_credit_loss_provisions)
ALTER TABLE "expected_credit_loss_provisions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expected_credit_loss_provisions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expected_credit_loss_provisions" ON "expected_credit_loss_provisions";
CREATE POLICY "tenant_isolation_expected_credit_loss_provisions" ON "expected_credit_loss_provisions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpenseCategoryPolicy (expense_category_policies)
ALTER TABLE "expense_category_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expense_category_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expense_category_policies" ON "expense_category_policies";
CREATE POLICY "tenant_isolation_expense_category_policies" ON "expense_category_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpenseReportItem (expense_report_items)
ALTER TABLE "expense_report_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expense_report_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expense_report_items" ON "expense_report_items";
CREATE POLICY "tenant_isolation_expense_report_items" ON "expense_report_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpenseReport (expense_reports)
ALTER TABLE "expense_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expense_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expense_reports" ON "expense_reports";
CREATE POLICY "tenant_isolation_expense_reports" ON "expense_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExpiryAlert (expiry_alerts)
ALTER TABLE "expiry_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "expiry_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_expiry_alerts" ON "expiry_alerts";
CREATE POLICY "tenant_isolation_expiry_alerts" ON "expiry_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExportDeclarationLine (export_declaration_lines)
ALTER TABLE "export_declaration_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "export_declaration_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_export_declaration_lines" ON "export_declaration_lines";
CREATE POLICY "tenant_isolation_export_declaration_lines" ON "export_declaration_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExportDeclaration (export_declarations)
ALTER TABLE "export_declarations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "export_declarations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_export_declarations" ON "export_declarations";
CREATE POLICY "tenant_isolation_export_declarations" ON "export_declarations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExportLicense (export_licenses)
ALTER TABLE "export_licenses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "export_licenses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_export_licenses" ON "export_licenses";
CREATE POLICY "tenant_isolation_export_licenses" ON "export_licenses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtConnectionLog (ext_connection_logs)
ALTER TABLE "ext_connection_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_connection_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_connection_logs" ON "ext_connection_logs";
CREATE POLICY "tenant_isolation_ext_connection_logs" ON "ext_connection_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtConnection (ext_connections)
ALTER TABLE "ext_connections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_connections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_connections" ON "ext_connections";
CREATE POLICY "tenant_isolation_ext_connections" ON "ext_connections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtIntegrationTemplate (ext_integration_templates)
ALTER TABLE "ext_integration_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_integration_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_integration_templates" ON "ext_integration_templates";
CREATE POLICY "tenant_isolation_ext_integration_templates" ON "ext_integration_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtRateLimitConfig (ext_rate_limit_configs)
ALTER TABLE "ext_rate_limit_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_rate_limit_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_rate_limit_configs" ON "ext_rate_limit_configs";
CREATE POLICY "tenant_isolation_ext_rate_limit_configs" ON "ext_rate_limit_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtRateLimitUsage (ext_rate_limit_usages)
ALTER TABLE "ext_rate_limit_usages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_rate_limit_usages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_rate_limit_usages" ON "ext_rate_limit_usages";
CREATE POLICY "tenant_isolation_ext_rate_limit_usages" ON "ext_rate_limit_usages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtWebhookConfig (ext_webhook_configs)
ALTER TABLE "ext_webhook_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_webhook_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_webhook_configs" ON "ext_webhook_configs";
CREATE POLICY "tenant_isolation_ext_webhook_configs" ON "ext_webhook_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtWebhookDelivery (ext_webhook_deliveries)
ALTER TABLE "ext_webhook_deliveries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ext_webhook_deliveries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ext_webhook_deliveries" ON "ext_webhook_deliveries";
CREATE POLICY "tenant_isolation_ext_webhook_deliveries" ON "ext_webhook_deliveries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ExtensionInvocationUsage (extension_invocation_usage)
ALTER TABLE "extension_invocation_usage" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "extension_invocation_usage" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_extension_invocation_usage" ON "extension_invocation_usage";
CREATE POLICY "tenant_isolation_extension_invocation_usage" ON "extension_invocation_usage"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FairValueMeasurement (fair_value_measurements)
ALTER TABLE "fair_value_measurements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fair_value_measurements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fair_value_measurements" ON "fair_value_measurements";
CREATE POLICY "tenant_isolation_fair_value_measurements" ON "fair_value_measurements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Feedback360 (feedback_360)
ALTER TABLE "feedback_360" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "feedback_360" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_feedback_360" ON "feedback_360";
CREATE POLICY "tenant_isolation_feedback_360" ON "feedback_360"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FeedbackResponse (feedback_responses)
ALTER TABLE "feedback_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "feedback_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_feedback_responses" ON "feedback_responses";
CREATE POLICY "tenant_isolation_feedback_responses" ON "feedback_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldSalesCheckin (field_sales_checkins)
ALTER TABLE "field_sales_checkins" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_sales_checkins" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_sales_checkins" ON "field_sales_checkins";
CREATE POLICY "tenant_isolation_field_sales_checkins" ON "field_sales_checkins"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldSalesExpense (field_sales_expenses)
ALTER TABLE "field_sales_expenses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_sales_expenses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_sales_expenses" ON "field_sales_expenses";
CREATE POLICY "tenant_isolation_field_sales_expenses" ON "field_sales_expenses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldSalesMeetingReport (field_sales_meeting_reports)
ALTER TABLE "field_sales_meeting_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_sales_meeting_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_sales_meeting_reports" ON "field_sales_meeting_reports";
CREATE POLICY "tenant_isolation_field_sales_meeting_reports" ON "field_sales_meeting_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldSalesRouteStop (field_sales_route_stops)
ALTER TABLE "field_sales_route_stops" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_sales_route_stops" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_sales_route_stops" ON "field_sales_route_stops";
CREATE POLICY "tenant_isolation_field_sales_route_stops" ON "field_sales_route_stops"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldSalesRoute (field_sales_routes)
ALTER TABLE "field_sales_routes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_sales_routes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_sales_routes" ON "field_sales_routes";
CREATE POLICY "tenant_isolation_field_sales_routes" ON "field_sales_routes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceAppointment (field_service_appointments)
ALTER TABLE "field_service_appointments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_appointments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_appointments" ON "field_service_appointments";
CREATE POLICY "tenant_isolation_field_service_appointments" ON "field_service_appointments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceCalendarEvent (field_service_calendar_events)
ALTER TABLE "field_service_calendar_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_calendar_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_calendar_events" ON "field_service_calendar_events";
CREATE POLICY "tenant_isolation_field_service_calendar_events" ON "field_service_calendar_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceChecklist (field_service_checklists)
ALTER TABLE "field_service_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_checklists" ON "field_service_checklists";
CREATE POLICY "tenant_isolation_field_service_checklists" ON "field_service_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceContract (field_service_contracts)
ALTER TABLE "field_service_contracts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_contracts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_contracts" ON "field_service_contracts";
CREATE POLICY "tenant_isolation_field_service_contracts" ON "field_service_contracts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceDispatch (field_service_dispatches)
ALTER TABLE "field_service_dispatches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_dispatches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_dispatches" ON "field_service_dispatches";
CREATE POLICY "tenant_isolation_field_service_dispatches" ON "field_service_dispatches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceInspectionChecklist (field_service_inspection_checklists)
ALTER TABLE "field_service_inspection_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_inspection_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_inspection_checklists" ON "field_service_inspection_checklists";
CREATE POLICY "tenant_isolation_field_service_inspection_checklists" ON "field_service_inspection_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceInventoryItem (field_service_inventory_items)
ALTER TABLE "field_service_inventory_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_inventory_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_inventory_items" ON "field_service_inventory_items";
CREATE POLICY "tenant_isolation_field_service_inventory_items" ON "field_service_inventory_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServicePartRequest (field_service_part_requests)
ALTER TABLE "field_service_part_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_part_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_part_requests" ON "field_service_part_requests";
CREATE POLICY "tenant_isolation_field_service_part_requests" ON "field_service_part_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServicePartsUsage (field_service_parts_usage)
ALTER TABLE "field_service_parts_usage" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_parts_usage" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_parts_usage" ON "field_service_parts_usage";
CREATE POLICY "tenant_isolation_field_service_parts_usage" ON "field_service_parts_usage"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceSchedule (field_service_schedules)
ALTER TABLE "field_service_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_schedules" ON "field_service_schedules";
CREATE POLICY "tenant_isolation_field_service_schedules" ON "field_service_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceSla (field_service_slas)
ALTER TABLE "field_service_slas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_slas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_slas" ON "field_service_slas";
CREATE POLICY "tenant_isolation_field_service_slas" ON "field_service_slas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceTechnicianDashboard (field_service_technician_dashboards)
ALTER TABLE "field_service_technician_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_technician_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_technician_dashboards" ON "field_service_technician_dashboards";
CREATE POLICY "tenant_isolation_field_service_technician_dashboards" ON "field_service_technician_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceTechnician (field_service_technicians)
ALTER TABLE "field_service_technicians" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_technicians" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_technicians" ON "field_service_technicians";
CREATE POLICY "tenant_isolation_field_service_technicians" ON "field_service_technicians"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceTicket (field_service_tickets)
ALTER TABLE "field_service_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_tickets" ON "field_service_tickets";
CREATE POLICY "tenant_isolation_field_service_tickets" ON "field_service_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceTimesheet (field_service_timesheets)
ALTER TABLE "field_service_timesheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_timesheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_timesheets" ON "field_service_timesheets";
CREATE POLICY "tenant_isolation_field_service_timesheets" ON "field_service_timesheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceVanStock (field_service_van_stock)
ALTER TABLE "field_service_van_stock" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_van_stock" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_van_stock" ON "field_service_van_stock";
CREATE POLICY "tenant_isolation_field_service_van_stock" ON "field_service_van_stock"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceWarranty (field_service_warranties)
ALTER TABLE "field_service_warranties" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_warranties" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_warranties" ON "field_service_warranties";
CREATE POLICY "tenant_isolation_field_service_warranties" ON "field_service_warranties"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FieldServiceWorkOrderExpense (field_service_work_order_expenses)
ALTER TABLE "field_service_work_order_expenses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "field_service_work_order_expenses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_field_service_work_order_expenses" ON "field_service_work_order_expenses";
CREATE POLICY "tenant_isolation_field_service_work_order_expenses" ON "field_service_work_order_expenses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FinanceAuditLog (finance_audit_logs)
ALTER TABLE "finance_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "finance_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_finance_audit_logs" ON "finance_audit_logs";
CREATE POLICY "tenant_isolation_finance_audit_logs" ON "finance_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FinanceLease (finance_leases)
ALTER TABLE "finance_leases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "finance_leases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_finance_leases" ON "finance_leases";
CREATE POLICY "tenant_isolation_finance_leases" ON "finance_leases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FinancialControl (financial_controls)
ALTER TABLE "financial_controls" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "financial_controls" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_financial_controls" ON "financial_controls";
CREATE POLICY "tenant_isolation_financial_controls" ON "financial_controls"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FinancialNlpQueryLog (financial_nlp_query_logs)
ALTER TABLE "financial_nlp_query_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "financial_nlp_query_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_financial_nlp_query_logs" ON "financial_nlp_query_logs";
CREATE POLICY "tenant_isolation_financial_nlp_query_logs" ON "financial_nlp_query_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FinancialPeriod (financial_periods)
ALTER TABLE "financial_periods" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "financial_periods" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_financial_periods" ON "financial_periods";
CREATE POLICY "tenant_isolation_financial_periods" ON "financial_periods"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetAuditLog (fixed_asset_audit_logs)
ALTER TABLE "fixed_asset_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_audit_logs" ON "fixed_asset_audit_logs";
CREATE POLICY "tenant_isolation_fixed_asset_audit_logs" ON "fixed_asset_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetBudgetAllocation (fixed_asset_budget_allocations)
ALTER TABLE "fixed_asset_budget_allocations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_budget_allocations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_budget_allocations" ON "fixed_asset_budget_allocations";
CREATE POLICY "tenant_isolation_fixed_asset_budget_allocations" ON "fixed_asset_budget_allocations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetCategory (fixed_asset_categories)
ALTER TABLE "fixed_asset_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_categories" ON "fixed_asset_categories";
CREATE POLICY "tenant_isolation_fixed_asset_categories" ON "fixed_asset_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetComponentReplacement (fixed_asset_component_replacements)
ALTER TABLE "fixed_asset_component_replacements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_component_replacements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_component_replacements" ON "fixed_asset_component_replacements";
CREATE POLICY "tenant_isolation_fixed_asset_component_replacements" ON "fixed_asset_component_replacements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetComponent (fixed_asset_components)
ALTER TABLE "fixed_asset_components" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_components" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_components" ON "fixed_asset_components";
CREATE POLICY "tenant_isolation_fixed_asset_components" ON "fixed_asset_components"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetConditionAssessment (fixed_asset_condition_assessments)
ALTER TABLE "fixed_asset_condition_assessments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_condition_assessments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_condition_assessments" ON "fixed_asset_condition_assessments";
CREATE POLICY "tenant_isolation_fixed_asset_condition_assessments" ON "fixed_asset_condition_assessments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetDisposal (fixed_asset_disposals)
ALTER TABLE "fixed_asset_disposals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_disposals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_disposals" ON "fixed_asset_disposals";
CREATE POLICY "tenant_isolation_fixed_asset_disposals" ON "fixed_asset_disposals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetDocument (fixed_asset_documents)
ALTER TABLE "fixed_asset_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_documents" ON "fixed_asset_documents";
CREATE POLICY "tenant_isolation_fixed_asset_documents" ON "fixed_asset_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetGroupMember (fixed_asset_group_members)
ALTER TABLE "fixed_asset_group_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_group_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_group_members" ON "fixed_asset_group_members";
CREATE POLICY "tenant_isolation_fixed_asset_group_members" ON "fixed_asset_group_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetGroup (fixed_asset_groups)
ALTER TABLE "fixed_asset_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_groups" ON "fixed_asset_groups";
CREATE POLICY "tenant_isolation_fixed_asset_groups" ON "fixed_asset_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetImpairment (fixed_asset_impairments)
ALTER TABLE "fixed_asset_impairments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_impairments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_impairments" ON "fixed_asset_impairments";
CREATE POLICY "tenant_isolation_fixed_asset_impairments" ON "fixed_asset_impairments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetInsurancePolicy (fixed_asset_insurance_policies)
ALTER TABLE "fixed_asset_insurance_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_insurance_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_insurance_policies" ON "fixed_asset_insurance_policies";
CREATE POLICY "tenant_isolation_fixed_asset_insurance_policies" ON "fixed_asset_insurance_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetPhysicalAudit (fixed_asset_physical_audits)
ALTER TABLE "fixed_asset_physical_audits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_physical_audits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_physical_audits" ON "fixed_asset_physical_audits";
CREATE POLICY "tenant_isolation_fixed_asset_physical_audits" ON "fixed_asset_physical_audits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetRevaluation (fixed_asset_revaluations)
ALTER TABLE "fixed_asset_revaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_revaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_revaluations" ON "fixed_asset_revaluations";
CREATE POLICY "tenant_isolation_fixed_asset_revaluations" ON "fixed_asset_revaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetUtilizationMetric (fixed_asset_utilization_metrics)
ALTER TABLE "fixed_asset_utilization_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_utilization_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_utilization_metrics" ON "fixed_asset_utilization_metrics";
CREATE POLICY "tenant_isolation_fixed_asset_utilization_metrics" ON "fixed_asset_utilization_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetWarranty (fixed_asset_warranties)
ALTER TABLE "fixed_asset_warranties" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_warranties" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_warranties" ON "fixed_asset_warranties";
CREATE POLICY "tenant_isolation_fixed_asset_warranties" ON "fixed_asset_warranties"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAssetWarrantyClaim (fixed_asset_warranty_claims)
ALTER TABLE "fixed_asset_warranty_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_asset_warranty_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_asset_warranty_claims" ON "fixed_asset_warranty_claims";
CREATE POLICY "tenant_isolation_fixed_asset_warranty_claims" ON "fixed_asset_warranty_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FixedAsset (fixed_assets)
ALTER TABLE "fixed_assets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fixed_assets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fixed_assets" ON "fixed_assets";
CREATE POLICY "tenant_isolation_fixed_assets" ON "fixed_assets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FlexibleBenefitCredit (flexible_benefit_credits)
ALTER TABLE "flexible_benefit_credits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "flexible_benefit_credits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_flexible_benefit_credits" ON "flexible_benefit_credits";
CREATE POLICY "tenant_isolation_flexible_benefit_credits" ON "flexible_benefit_credits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FloorPriceOverride (floor_price_overrides)
ALTER TABLE "floor_price_overrides" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "floor_price_overrides" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_floor_price_overrides" ON "floor_price_overrides";
CREATE POLICY "tenant_isolation_floor_price_overrides" ON "floor_price_overrides"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FmeaItem (fmea_items)
ALTER TABLE "fmea_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fmea_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fmea_items" ON "fmea_items";
CREATE POLICY "tenant_isolation_fmea_items" ON "fmea_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FmeaMode (fmea_modes)
ALTER TABLE "fmea_modes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fmea_modes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fmea_modes" ON "fmea_modes";
CREATE POLICY "tenant_isolation_fmea_modes" ON "fmea_modes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FmeaRecord (fmea_records)
ALTER TABLE "fmea_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fmea_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fmea_records" ON "fmea_records";
CREATE POLICY "tenant_isolation_fmea_records" ON "fmea_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FmeaWorksheet (fmea_worksheets)
ALTER TABLE "fmea_worksheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fmea_worksheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fmea_worksheets" ON "fmea_worksheets";
CREATE POLICY "tenant_isolation_fmea_worksheets" ON "fmea_worksheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FolderShare (folder_shares)
ALTER TABLE "folder_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "folder_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_folder_shares" ON "folder_shares";
CREATE POLICY "tenant_isolation_folder_shares" ON "folder_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Folder (folders)
ALTER TABLE "folders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "folders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_folders" ON "folders";
CREATE POLICY "tenant_isolation_folders" ON "folders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ForecastAccuracyAudit (forecast_accuracy_audits)
ALTER TABLE "forecast_accuracy_audits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "forecast_accuracy_audits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_forecast_accuracy_audits" ON "forecast_accuracy_audits";
CREATE POLICY "tenant_isolation_forecast_accuracy_audits" ON "forecast_accuracy_audits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ForecastScenario (forecast_scenarios)
ALTER TABLE "forecast_scenarios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "forecast_scenarios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_forecast_scenarios" ON "forecast_scenarios";
CREATE POLICY "tenant_isolation_forecast_scenarios" ON "forecast_scenarios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ForecastSnapshot (forecast_snapshots)
ALTER TABLE "forecast_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "forecast_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_forecast_snapshots" ON "forecast_snapshots";
CREATE POLICY "tenant_isolation_forecast_snapshots" ON "forecast_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ForecastWeek (forecast_weeks)
ALTER TABLE "forecast_weeks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "forecast_weeks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_forecast_weeks" ON "forecast_weeks";
CREATE POLICY "tenant_isolation_forecast_weeks" ON "forecast_weeks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Form1099Batch (form_1099_batches)
ALTER TABLE "form_1099_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_1099_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_1099_batches" ON "form_1099_batches";
CREATE POLICY "tenant_isolation_form_1099_batches" ON "form_1099_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Form1099 (form_1099s)
ALTER TABLE "form_1099s" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_1099s" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_1099s" ON "form_1099s";
CREATE POLICY "tenant_isolation_form_1099s" ON "form_1099s"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormAnalytic (form_analytic)
ALTER TABLE "form_analytic" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_analytic" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_analytic" ON "form_analytic";
CREATE POLICY "tenant_isolation_form_analytic" ON "form_analytic"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormAnalytics (form_analytics)
ALTER TABLE "form_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_analytics" ON "form_analytics";
CREATE POLICY "tenant_isolation_form_analytics" ON "form_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormCalculatedField (form_calculated_fields)
ALTER TABLE "form_calculated_fields" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_calculated_fields" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_calculated_fields" ON "form_calculated_fields";
CREATE POLICY "tenant_isolation_form_calculated_fields" ON "form_calculated_fields"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormCondition (form_conditions)
ALTER TABLE "form_conditions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_conditions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_conditions" ON "form_conditions";
CREATE POLICY "tenant_isolation_form_conditions" ON "form_conditions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormField (form_fields)
ALTER TABLE "form_fields" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_fields" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_fields" ON "form_fields";
CREATE POLICY "tenant_isolation_form_fields" ON "form_fields"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormPage (form_pages)
ALTER TABLE "form_pages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_pages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_pages" ON "form_pages";
CREATE POLICY "tenant_isolation_form_pages" ON "form_pages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormSubmission (form_submissions)
ALTER TABLE "form_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_submissions" ON "form_submissions";
CREATE POLICY "tenant_isolation_form_submissions" ON "form_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormTemplate (form_templates)
ALTER TABLE "form_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_templates" ON "form_templates";
CREATE POLICY "tenant_isolation_form_templates" ON "form_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormVersion (form_versions)
ALTER TABLE "form_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "form_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_form_versions" ON "form_versions";
CREATE POLICY "tenant_isolation_form_versions" ON "form_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FormulaIngredient (formula_ingredients)
ALTER TABLE "formula_ingredients" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "formula_ingredients" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_formula_ingredients" ON "formula_ingredients";
CREATE POLICY "tenant_isolation_formula_ingredients" ON "formula_ingredients"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FreightClaimEvent (freight_claim_events)
ALTER TABLE "freight_claim_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "freight_claim_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_freight_claim_events" ON "freight_claim_events";
CREATE POLICY "tenant_isolation_freight_claim_events" ON "freight_claim_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FreightClaim (freight_claims)
ALTER TABLE "freight_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "freight_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_freight_claims" ON "freight_claims";
CREATE POLICY "tenant_isolation_freight_claims" ON "freight_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for FxRevaluationRun (fx_revaluation_runs)
ALTER TABLE "fx_revaluation_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "fx_revaluation_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_fx_revaluation_runs" ON "fx_revaluation_runs";
CREATE POLICY "tenant_isolation_fx_revaluation_runs" ON "fx_revaluation_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GageRrSample (gage_rr_samples)
ALTER TABLE "gage_rr_samples" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gage_rr_samples" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gage_rr_samples" ON "gage_rr_samples";
CREATE POLICY "tenant_isolation_gage_rr_samples" ON "gage_rr_samples"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GageRrStudy (gage_rr_studies)
ALTER TABLE "gage_rr_studies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gage_rr_studies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gage_rr_studies" ON "gage_rr_studies";
CREATE POLICY "tenant_isolation_gage_rr_studies" ON "gage_rr_studies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GamificationBadgeAward (gamification_badge_awards)
ALTER TABLE "gamification_badge_awards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gamification_badge_awards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gamification_badge_awards" ON "gamification_badge_awards";
CREATE POLICY "tenant_isolation_gamification_badge_awards" ON "gamification_badge_awards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GamificationBadge (gamification_badges)
ALTER TABLE "gamification_badges" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gamification_badges" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gamification_badges" ON "gamification_badges";
CREATE POLICY "tenant_isolation_gamification_badges" ON "gamification_badges"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GateChecklist (gate_checklists)
ALTER TABLE "gate_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gate_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gate_checklists" ON "gate_checklists";
CREATE POLICY "tenant_isolation_gate_checklists" ON "gate_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GatePass (gate_passes)
ALTER TABLE "gate_passes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gate_passes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gate_passes" ON "gate_passes";
CREATE POLICY "tenant_isolation_gate_passes" ON "gate_passes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GeneratedDocument (generated_documents)
ALTER TABLE "generated_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "generated_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_generated_documents" ON "generated_documents";
CREATE POLICY "tenant_isolation_generated_documents" ON "generated_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GeneratedInvoice (generated_invoices)
ALTER TABLE "generated_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "generated_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_generated_invoices" ON "generated_invoices";
CREATE POLICY "tenant_isolation_generated_invoices" ON "generated_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GlobalInventoryDetail (global_inventory_details)
ALTER TABLE "global_inventory_details" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "global_inventory_details" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_global_inventory_details" ON "global_inventory_details";
CREATE POLICY "tenant_isolation_global_inventory_details" ON "global_inventory_details"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GlobalInventoryView (global_inventory_views)
ALTER TABLE "global_inventory_views" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "global_inventory_views" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_global_inventory_views" ON "global_inventory_views";
CREATE POLICY "tenant_isolation_global_inventory_views" ON "global_inventory_views"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GmpBatchRecord (gmp_batch_records)
ALTER TABLE "gmp_batch_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gmp_batch_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gmp_batch_records" ON "gmp_batch_records";
CREATE POLICY "tenant_isolation_gmp_batch_records" ON "gmp_batch_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GoalComment (goal_comments)
ALTER TABLE "goal_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "goal_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_goal_comments" ON "goal_comments";
CREATE POLICY "tenant_isolation_goal_comments" ON "goal_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Goal (goals)
ALTER TABLE "goals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "goals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_goals" ON "goals";
CREATE POLICY "tenant_isolation_goals" ON "goals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GoodsReceiptNote (goods_receipt_notes)
ALTER TABLE "goods_receipt_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "goods_receipt_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_goods_receipt_notes" ON "goods_receipt_notes";
CREATE POLICY "tenant_isolation_goods_receipt_notes" ON "goods_receipt_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GrnLineItem (grn_line_items)
ALTER TABLE "grn_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "grn_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_grn_line_items" ON "grn_line_items";
CREATE POLICY "tenant_isolation_grn_line_items" ON "grn_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for GrniRecord (grni_records)
ALTER TABLE "grni_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "grni_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_grni_records" ON "grni_records";
CREATE POLICY "tenant_isolation_grni_records" ON "grni_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Gs1ApplicationIdentifier (gs1_application_identifiers)
ALTER TABLE "gs1_application_identifiers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "gs1_application_identifiers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_gs1_application_identifiers" ON "gs1_application_identifiers";
CREATE POLICY "tenant_isolation_gs1_application_identifiers" ON "gs1_application_identifiers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HacppPlan (haccp_plans)
ALTER TABLE "haccp_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "haccp_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_haccp_plans" ON "haccp_plans";
CREATE POLICY "tenant_isolation_haccp_plans" ON "haccp_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HazmatClassification (hazmat_classifications)
ALTER TABLE "hazmat_classifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hazmat_classifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hazmat_classifications" ON "hazmat_classifications";
CREATE POLICY "tenant_isolation_hazmat_classifications" ON "hazmat_classifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HazmatIncident (hazmat_incidents)
ALTER TABLE "hazmat_incidents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hazmat_incidents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hazmat_incidents" ON "hazmat_incidents";
CREATE POLICY "tenant_isolation_hazmat_incidents" ON "hazmat_incidents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HazmatManifestLine (hazmat_manifest_lines)
ALTER TABLE "hazmat_manifest_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hazmat_manifest_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hazmat_manifest_lines" ON "hazmat_manifest_lines";
CREATE POLICY "tenant_isolation_hazmat_manifest_lines" ON "hazmat_manifest_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HazmatManifest (hazmat_manifests)
ALTER TABLE "hazmat_manifests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hazmat_manifests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hazmat_manifests" ON "hazmat_manifests";
CREATE POLICY "tenant_isolation_hazmat_manifests" ON "hazmat_manifests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HazmatStorageRule (hazmat_storage_rules)
ALTER TABLE "hazmat_storage_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hazmat_storage_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hazmat_storage_rules" ON "hazmat_storage_rules";
CREATE POLICY "tenant_isolation_hazmat_storage_rules" ON "hazmat_storage_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HeadcountPlan (headcount_plans)
ALTER TABLE "headcount_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "headcount_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_headcount_plans" ON "headcount_plans";
CREATE POLICY "tenant_isolation_headcount_plans" ON "headcount_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthScoreConfig (health_score_configs)
ALTER TABLE "health_score_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "health_score_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_health_score_configs" ON "health_score_configs";
CREATE POLICY "tenant_isolation_health_score_configs" ON "health_score_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareAppointmentSchedule (healthcare_appointment_schedules)
ALTER TABLE "healthcare_appointment_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_appointment_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_appointment_schedules" ON "healthcare_appointment_schedules";
CREATE POLICY "tenant_isolation_healthcare_appointment_schedules" ON "healthcare_appointment_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareAppointment (healthcare_appointments)
ALTER TABLE "healthcare_appointments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_appointments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_appointments" ON "healthcare_appointments";
CREATE POLICY "tenant_isolation_healthcare_appointments" ON "healthcare_appointments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareClinicalNote (healthcare_clinical_notes)
ALTER TABLE "healthcare_clinical_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_clinical_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_clinical_notes" ON "healthcare_clinical_notes";
CREATE POLICY "tenant_isolation_healthcare_clinical_notes" ON "healthcare_clinical_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareControlledSubstanceLog (healthcare_controlled_substance_logs)
ALTER TABLE "healthcare_controlled_substance_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_controlled_substance_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_controlled_substance_logs" ON "healthcare_controlled_substance_logs";
CREATE POLICY "tenant_isolation_healthcare_controlled_substance_logs" ON "healthcare_controlled_substance_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareDoctorSchedule (healthcare_doctor_schedules)
ALTER TABLE "healthcare_doctor_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_doctor_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_doctor_schedules" ON "healthcare_doctor_schedules";
CREATE POLICY "tenant_isolation_healthcare_doctor_schedules" ON "healthcare_doctor_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareDrug (healthcare_drugs)
ALTER TABLE "healthcare_drugs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_drugs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_drugs" ON "healthcare_drugs";
CREATE POLICY "tenant_isolation_healthcare_drugs" ON "healthcare_drugs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareEncounter (healthcare_encounters)
ALTER TABLE "healthcare_encounters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_encounters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_encounters" ON "healthcare_encounters";
CREATE POLICY "tenant_isolation_healthcare_encounters" ON "healthcare_encounters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareFhirResource (healthcare_fhir_resources)
ALTER TABLE "healthcare_fhir_resources" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_fhir_resources" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_fhir_resources" ON "healthcare_fhir_resources";
CREATE POLICY "tenant_isolation_healthcare_fhir_resources" ON "healthcare_fhir_resources"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareInsuranceClaim (healthcare_insurance_claims)
ALTER TABLE "healthcare_insurance_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_insurance_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_insurance_claims" ON "healthcare_insurance_claims";
CREATE POLICY "tenant_isolation_healthcare_insurance_claims" ON "healthcare_insurance_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareInsurancePolicy (healthcare_insurance_policies)
ALTER TABLE "healthcare_insurance_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_insurance_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_insurance_policies" ON "healthcare_insurance_policies";
CREATE POLICY "tenant_isolation_healthcare_insurance_policies" ON "healthcare_insurance_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareLabOrder (healthcare_lab_orders)
ALTER TABLE "healthcare_lab_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_lab_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_lab_orders" ON "healthcare_lab_orders";
CREATE POLICY "tenant_isolation_healthcare_lab_orders" ON "healthcare_lab_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareLabResult (healthcare_lab_results)
ALTER TABLE "healthcare_lab_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_lab_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_lab_results" ON "healthcare_lab_results";
CREATE POLICY "tenant_isolation_healthcare_lab_results" ON "healthcare_lab_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareMedicalBill (healthcare_medical_bills)
ALTER TABLE "healthcare_medical_bills" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_medical_bills" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_medical_bills" ON "healthcare_medical_bills";
CREATE POLICY "tenant_isolation_healthcare_medical_bills" ON "healthcare_medical_bills"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareMedicalRecord (healthcare_medical_records)
ALTER TABLE "healthcare_medical_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_medical_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_medical_records" ON "healthcare_medical_records";
CREATE POLICY "tenant_isolation_healthcare_medical_records" ON "healthcare_medical_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePatientAllergy (healthcare_patient_allergies)
ALTER TABLE "healthcare_patient_allergies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_patient_allergies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_patient_allergies" ON "healthcare_patient_allergies";
CREATE POLICY "tenant_isolation_healthcare_patient_allergies" ON "healthcare_patient_allergies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePatient (healthcare_patients)
ALTER TABLE "healthcare_patients" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_patients" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_patients" ON "healthcare_patients";
CREATE POLICY "tenant_isolation_healthcare_patients" ON "healthcare_patients"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePharmacyBatch (healthcare_pharmacy_batches)
ALTER TABLE "healthcare_pharmacy_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_pharmacy_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_pharmacy_batches" ON "healthcare_pharmacy_batches";
CREATE POLICY "tenant_isolation_healthcare_pharmacy_batches" ON "healthcare_pharmacy_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePractitioner (healthcare_practitioners)
ALTER TABLE "healthcare_practitioners" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_practitioners" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_practitioners" ON "healthcare_practitioners";
CREATE POLICY "tenant_isolation_healthcare_practitioners" ON "healthcare_practitioners"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePrescriptionItem (healthcare_prescription_items)
ALTER TABLE "healthcare_prescription_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_prescription_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_prescription_items" ON "healthcare_prescription_items";
CREATE POLICY "tenant_isolation_healthcare_prescription_items" ON "healthcare_prescription_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcarePrescription (healthcare_prescriptions)
ALTER TABLE "healthcare_prescriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_prescriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_prescriptions" ON "healthcare_prescriptions";
CREATE POLICY "tenant_isolation_healthcare_prescriptions" ON "healthcare_prescriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareTelemedicineSession (healthcare_telemedicine_sessions)
ALTER TABLE "healthcare_telemedicine_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_telemedicine_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_telemedicine_sessions" ON "healthcare_telemedicine_sessions";
CREATE POLICY "tenant_isolation_healthcare_telemedicine_sessions" ON "healthcare_telemedicine_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HealthcareVital (healthcare_vitals)
ALTER TABLE "healthcare_vitals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "healthcare_vitals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_healthcare_vitals" ON "healthcare_vitals";
CREATE POLICY "tenant_isolation_healthcare_vitals" ON "healthcare_vitals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HedgeInstrument (hedge_instruments)
ALTER TABLE "hedge_instruments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hedge_instruments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hedge_instruments" ON "hedge_instruments";
CREATE POLICY "tenant_isolation_hedge_instruments" ON "hedge_instruments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HelpdeskTicket (helpdesk_tickets)
ALTER TABLE "helpdesk_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "helpdesk_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_helpdesk_tickets" ON "helpdesk_tickets";
CREATE POLICY "tenant_isolation_helpdesk_tickets" ON "helpdesk_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HolidayCalendar (holiday_calendars)
ALTER TABLE "holiday_calendars" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "holiday_calendars" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_holiday_calendars" ON "holiday_calendars";
CREATE POLICY "tenant_isolation_holiday_calendars" ON "holiday_calendars"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrTicket (hr_advanced_tickets)
ALTER TABLE "hr_advanced_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_advanced_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_advanced_tickets" ON "hr_advanced_tickets";
CREATE POLICY "tenant_isolation_hr_advanced_tickets" ON "hr_advanced_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrAnnouncement (hr_announcements)
ALTER TABLE "hr_announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_announcements" ON "hr_announcements";
CREATE POLICY "tenant_isolation_hr_announcements" ON "hr_announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HRComplianceReport (hr_compliance_reports)
ALTER TABLE "hr_compliance_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_compliance_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_compliance_reports" ON "hr_compliance_reports";
CREATE POLICY "tenant_isolation_hr_compliance_reports" ON "hr_compliance_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrExpenseClaimItem (hr_expense_claim_items)
ALTER TABLE "hr_expense_claim_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_expense_claim_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_expense_claim_items" ON "hr_expense_claim_items";
CREATE POLICY "tenant_isolation_hr_expense_claim_items" ON "hr_expense_claim_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrExpenseClaim (hr_expense_claims)
ALTER TABLE "hr_expense_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_expense_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_expense_claims" ON "hr_expense_claims";
CREATE POLICY "tenant_isolation_hr_expense_claims" ON "hr_expense_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrHeadcountPlanLine (hr_headcount_plan_lines)
ALTER TABLE "hr_headcount_plan_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_headcount_plan_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_headcount_plan_lines" ON "hr_headcount_plan_lines";
CREATE POLICY "tenant_isolation_hr_headcount_plan_lines" ON "hr_headcount_plan_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrHeadcountPlan (hr_headcount_plans)
ALTER TABLE "hr_headcount_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_headcount_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_headcount_plans" ON "hr_headcount_plans";
CREATE POLICY "tenant_isolation_hr_headcount_plans" ON "hr_headcount_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrPolicy (hr_policies)
ALTER TABLE "hr_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_policies" ON "hr_policies";
CREATE POLICY "tenant_isolation_hr_policies" ON "hr_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrPolicyAcknowledgment (hr_policy_acknowledgments)
ALTER TABLE "hr_policy_acknowledgments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_policy_acknowledgments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_policy_acknowledgments" ON "hr_policy_acknowledgments";
CREATE POLICY "tenant_isolation_hr_policy_acknowledgments" ON "hr_policy_acknowledgments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrSuccessionCandidate (hr_succession_candidates)
ALTER TABLE "hr_succession_candidates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_succession_candidates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_succession_candidates" ON "hr_succession_candidates";
CREATE POLICY "tenant_isolation_hr_succession_candidates" ON "hr_succession_candidates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrSuccessionPlan (hr_succession_plans)
ALTER TABLE "hr_succession_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_succession_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_succession_plans" ON "hr_succession_plans";
CREATE POLICY "tenant_isolation_hr_succession_plans" ON "hr_succession_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrSurveyResponse (hr_survey_responses)
ALTER TABLE "hr_survey_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_survey_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_survey_responses" ON "hr_survey_responses";
CREATE POLICY "tenant_isolation_hr_survey_responses" ON "hr_survey_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrTicketAssignment (hr_ticket_assignments)
ALTER TABLE "hr_ticket_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_ticket_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_ticket_assignments" ON "hr_ticket_assignments";
CREATE POLICY "tenant_isolation_hr_ticket_assignments" ON "hr_ticket_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HrTicketCategory (hr_ticket_categories)
ALTER TABLE "hr_ticket_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_ticket_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_ticket_categories" ON "hr_ticket_categories";
CREATE POLICY "tenant_isolation_hr_ticket_categories" ON "hr_ticket_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HRTicket (hr_tickets)
ALTER TABLE "hr_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hr_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hr_tickets" ON "hr_tickets";
CREATE POLICY "tenant_isolation_hr_tickets" ON "hr_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HsCodeClassification (hs_code_classifications)
ALTER TABLE "hs_code_classifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hs_code_classifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hs_code_classifications" ON "hs_code_classifications";
CREATE POLICY "tenant_isolation_hs_code_classifications" ON "hs_code_classifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for HsCode (hs_codes)
ALTER TABLE "hs_codes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "hs_codes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_hs_codes" ON "hs_codes";
CREATE POLICY "tenant_isolation_hs_codes" ON "hs_codes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ImmigrationDocument (immigration_documents)
ALTER TABLE "immigration_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "immigration_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_immigration_documents" ON "immigration_documents";
CREATE POLICY "tenant_isolation_immigration_documents" ON "immigration_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ImpersonationSession (impersonation_sessions)
ALTER TABLE "impersonation_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "impersonation_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_impersonation_sessions" ON "impersonation_sessions";
CREATE POLICY "tenant_isolation_impersonation_sessions" ON "impersonation_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ImportDeclarationLine (import_declaration_lines)
ALTER TABLE "import_declaration_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "import_declaration_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_import_declaration_lines" ON "import_declaration_lines";
CREATE POLICY "tenant_isolation_import_declaration_lines" ON "import_declaration_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ImportDeclaration (import_declarations)
ALTER TABLE "import_declarations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "import_declarations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_import_declarations" ON "import_declarations";
CREATE POLICY "tenant_isolation_import_declarations" ON "import_declarations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InboundShipment (inbound_shipments)
ALTER TABLE "inbound_shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inbound_shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inbound_shipments" ON "inbound_shipments";
CREATE POLICY "tenant_isolation_inbound_shipments" ON "inbound_shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Incident (incidents)
ALTER TABLE "incidents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "incidents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_incidents" ON "incidents";
CREATE POLICY "tenant_isolation_incidents" ON "incidents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InstalledApp (installed_apps)
ALTER TABLE "installed_apps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "installed_apps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_installed_apps" ON "installed_apps";
CREATE POLICY "tenant_isolation_installed_apps" ON "installed_apps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntegrationConnector (integration_connectors)
ALTER TABLE "integration_connectors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "integration_connectors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_integration_connectors" ON "integration_connectors";
CREATE POLICY "tenant_isolation_integration_connectors" ON "integration_connectors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntegrationLog (integration_logs)
ALTER TABLE "integration_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "integration_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_integration_logs" ON "integration_logs";
CREATE POLICY "tenant_isolation_integration_logs" ON "integration_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Integration (integrations)
ALTER TABLE "integrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "integrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_integrations" ON "integrations";
CREATE POLICY "tenant_isolation_integrations" ON "integrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InterCompanyTransfer (inter_company_transfers)
ALTER TABLE "inter_company_transfers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inter_company_transfers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inter_company_transfers" ON "inter_company_transfers";
CREATE POLICY "tenant_isolation_inter_company_transfers" ON "inter_company_transfers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntercompanyLoan (intercompany_loans)
ALTER TABLE "intercompany_loans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "intercompany_loans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_intercompany_loans" ON "intercompany_loans";
CREATE POLICY "tenant_isolation_intercompany_loans" ON "intercompany_loans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InterCompanyTransaction (intercompany_transactions)
ALTER TABLE "intercompany_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "intercompany_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_intercompany_transactions" ON "intercompany_transactions";
CREATE POLICY "tenant_isolation_intercompany_transactions" ON "intercompany_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InternalSurveyAnswer (internal_survey_answers)
ALTER TABLE "internal_survey_answers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "internal_survey_answers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_internal_survey_answers" ON "internal_survey_answers";
CREATE POLICY "tenant_isolation_internal_survey_answers" ON "internal_survey_answers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InternalSurvey (internal_surveys)
ALTER TABLE "internal_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "internal_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_internal_surveys" ON "internal_surveys";
CREATE POLICY "tenant_isolation_internal_surveys" ON "internal_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Interview (interviews)
ALTER TABLE "interviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "interviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_interviews" ON "interviews";
CREATE POLICY "tenant_isolation_interviews" ON "interviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntranetComment (intranet_comments)
ALTER TABLE "intranet_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "intranet_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_intranet_comments" ON "intranet_comments";
CREATE POLICY "tenant_isolation_intranet_comments" ON "intranet_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntranetPost (intranet_posts)
ALTER TABLE "intranet_posts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "intranet_posts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_intranet_posts" ON "intranet_posts";
CREATE POLICY "tenant_isolation_intranet_posts" ON "intranet_posts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IntranetReaction (intranet_reactions)
ALTER TABLE "intranet_reactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "intranet_reactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_intranet_reactions" ON "intranet_reactions";
CREATE POLICY "tenant_isolation_intranet_reactions" ON "intranet_reactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InventoryCostAdjustment (inventory_cost_adjustments)
ALTER TABLE "inventory_cost_adjustments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_cost_adjustments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_cost_adjustments" ON "inventory_cost_adjustments";
CREATE POLICY "tenant_isolation_inventory_cost_adjustments" ON "inventory_cost_adjustments"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for InventoryCostLayer (inventory_cost_layers)
ALTER TABLE "inventory_cost_layers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_cost_layers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_cost_layers" ON "inventory_cost_layers";
CREATE POLICY "tenant_isolation_inventory_cost_layers" ON "inventory_cost_layers"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for InventoryCostProfile (inventory_cost_profiles)
ALTER TABLE "inventory_cost_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_cost_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_cost_profiles" ON "inventory_cost_profiles";
CREATE POLICY "tenant_isolation_inventory_cost_profiles" ON "inventory_cost_profiles"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for InventoryHold (inventory_holds)
ALTER TABLE "inventory_holds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_holds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_holds" ON "inventory_holds";
CREATE POLICY "tenant_isolation_inventory_holds" ON "inventory_holds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InventoryItemBin (inventory_item_bins)
ALTER TABLE "inventory_item_bins" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_item_bins" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_item_bins" ON "inventory_item_bins";
CREATE POLICY "tenant_isolation_inventory_item_bins" ON "inventory_item_bins"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InventoryItem (inventory_items)
ALTER TABLE "inventory_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_items" ON "inventory_items";
CREATE POLICY "tenant_isolation_inventory_items" ON "inventory_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InventoryValuation (inventory_valuations)
ALTER TABLE "inventory_valuations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "inventory_valuations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_inventory_valuations" ON "inventory_valuations";
CREATE POLICY "tenant_isolation_inventory_valuations" ON "inventory_valuations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvestmentHolding (investment_holdings)
ALTER TABLE "investment_holdings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "investment_holdings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_investment_holdings" ON "investment_holdings";
CREATE POLICY "tenant_isolation_investment_holdings" ON "investment_holdings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvestmentPortfolio (investment_portfolios)
ALTER TABLE "investment_portfolios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "investment_portfolios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_investment_portfolios" ON "investment_portfolios";
CREATE POLICY "tenant_isolation_investment_portfolios" ON "investment_portfolios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceCaptureBatch (invoice_capture_batches)
ALTER TABLE "invoice_capture_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_capture_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_capture_batches" ON "invoice_capture_batches";
CREATE POLICY "tenant_isolation_invoice_capture_batches" ON "invoice_capture_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceCaptureResult (invoice_capture_results)
ALTER TABLE "invoice_capture_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_capture_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_capture_results" ON "invoice_capture_results";
CREATE POLICY "tenant_isolation_invoice_capture_results" ON "invoice_capture_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceDunningLog (invoice_dunning_logs)
ALTER TABLE "invoice_dunning_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_dunning_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_dunning_logs" ON "invoice_dunning_logs";
CREATE POLICY "tenant_isolation_invoice_dunning_logs" ON "invoice_dunning_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceFactoringAdvance (invoice_factoring_advances)
ALTER TABLE "invoice_factoring_advances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_factoring_advances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_factoring_advances" ON "invoice_factoring_advances";
CREATE POLICY "tenant_isolation_invoice_factoring_advances" ON "invoice_factoring_advances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceFactoringFacility (invoice_factoring_facilities)
ALTER TABLE "invoice_factoring_facilities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_factoring_facilities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_factoring_facilities" ON "invoice_factoring_facilities";
CREATE POLICY "tenant_isolation_invoice_factoring_facilities" ON "invoice_factoring_facilities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceLineItem (invoice_line_items)
ALTER TABLE "invoice_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_line_items" ON "invoice_line_items";
CREATE POLICY "tenant_isolation_invoice_line_items" ON "invoice_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for InvoiceMatchRule (invoice_match_rules)
ALTER TABLE "invoice_match_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoice_match_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoice_match_rules" ON "invoice_match_rules";
CREATE POLICY "tenant_isolation_invoice_match_rules" ON "invoice_match_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Invoice (invoices)
ALTER TABLE "invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_invoices" ON "invoices";
CREATE POLICY "tenant_isolation_invoices" ON "invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IpRestriction (ip_restrictions)
ALTER TABLE "ip_restrictions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ip_restrictions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ip_restrictions" ON "ip_restrictions";
CREATE POLICY "tenant_isolation_ip_restrictions" ON "ip_restrictions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ItemBarcode (item_barcodes)
ALTER TABLE "item_barcodes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "item_barcodes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_item_barcodes" ON "item_barcodes";
CREATE POLICY "tenant_isolation_item_barcodes" ON "item_barcodes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IvrMenu (ivr_menus)
ALTER TABLE "ivr_menus" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ivr_menus" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ivr_menus" ON "ivr_menus";
CREATE POLICY "tenant_isolation_ivr_menus" ON "ivr_menus"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for IvrOption (ivr_options)
ALTER TABLE "ivr_options" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ivr_options" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ivr_options" ON "ivr_options";
CREATE POLICY "tenant_isolation_ivr_options" ON "ivr_options"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for JobCostSheet (job_cost_sheets)
ALTER TABLE "job_cost_sheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "job_cost_sheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_job_cost_sheets" ON "job_cost_sheets";
CREATE POLICY "tenant_isolation_job_cost_sheets" ON "job_cost_sheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for JobPosting (job_postings)
ALTER TABLE "job_postings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "job_postings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_job_postings" ON "job_postings";
CREATE POLICY "tenant_isolation_job_postings" ON "job_postings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for JournalEntry (journal_entries)
ALTER TABLE "journal_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "journal_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_journal_entries" ON "journal_entries";
CREATE POLICY "tenant_isolation_journal_entries" ON "journal_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Journal (journals)
ALTER TABLE "journals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "journals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_journals" ON "journals";
CREATE POLICY "tenant_isolation_journals" ON "journals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KanbanBoard (kanban_boards)
ALTER TABLE "kanban_boards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kanban_boards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kanban_boards" ON "kanban_boards";
CREATE POLICY "tenant_isolation_kanban_boards" ON "kanban_boards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KanbanCard (kanban_cards)
ALTER TABLE "kanban_cards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kanban_cards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kanban_cards" ON "kanban_cards";
CREATE POLICY "tenant_isolation_kanban_cards" ON "kanban_cards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KeyResult (key_results)
ALTER TABLE "key_results" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "key_results" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_key_results" ON "key_results";
CREATE POLICY "tenant_isolation_key_results" ON "key_results"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KitVersion (kit_versions)
ALTER TABLE "kit_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kit_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kit_versions" ON "kit_versions";
CREATE POLICY "tenant_isolation_kit_versions" ON "kit_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeArticleRating (knowledge_article_ratings)
ALTER TABLE "knowledge_article_ratings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_article_ratings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_article_ratings" ON "knowledge_article_ratings";
CREATE POLICY "tenant_isolation_knowledge_article_ratings" ON "knowledge_article_ratings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeArticleVersion (knowledge_article_versions)
ALTER TABLE "knowledge_article_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_article_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_article_versions" ON "knowledge_article_versions";
CREATE POLICY "tenant_isolation_knowledge_article_versions" ON "knowledge_article_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeArticle (knowledge_articles)
ALTER TABLE "knowledge_articles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_articles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_articles" ON "knowledge_articles";
CREATE POLICY "tenant_isolation_knowledge_articles" ON "knowledge_articles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeBaseArticleVersion (knowledge_base_article_versions)
ALTER TABLE "knowledge_base_article_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_base_article_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_base_article_versions" ON "knowledge_base_article_versions";
CREATE POLICY "tenant_isolation_knowledge_base_article_versions" ON "knowledge_base_article_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeBaseArticle (knowledge_base_articles)
ALTER TABLE "knowledge_base_articles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_base_articles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_base_articles" ON "knowledge_base_articles";
CREATE POLICY "tenant_isolation_knowledge_base_articles" ON "knowledge_base_articles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeBaseCategory (knowledge_base_categories)
ALTER TABLE "knowledge_base_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_base_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_base_categories" ON "knowledge_base_categories";
CREATE POLICY "tenant_isolation_knowledge_base_categories" ON "knowledge_base_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KnowledgeCategory (knowledge_categories)
ALTER TABLE "knowledge_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "knowledge_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_knowledge_categories" ON "knowledge_categories";
CREATE POLICY "tenant_isolation_knowledge_categories" ON "knowledge_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KpiEvaluation (kpi_evaluations)
ALTER TABLE "kpi_evaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kpi_evaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kpi_evaluations" ON "kpi_evaluations";
CREATE POLICY "tenant_isolation_kpi_evaluations" ON "kpi_evaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KpiTemplate (kpi_templates)
ALTER TABLE "kpi_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kpi_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kpi_templates" ON "kpi_templates";
CREATE POLICY "tenant_isolation_kpi_templates" ON "kpi_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for KPI (kpis)
ALTER TABLE "kpis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "kpis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_kpis" ON "kpis";
CREATE POLICY "tenant_isolation_kpis" ON "kpis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LabelAssignment (label_assignments)
ALTER TABLE "label_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "label_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_label_assignments" ON "label_assignments";
CREATE POLICY "tenant_isolation_label_assignments" ON "label_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LabelTemplate (label_templates)
ALTER TABLE "label_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "label_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_label_templates" ON "label_templates";
CREATE POLICY "tenant_isolation_label_templates" ON "label_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LaborStandard (labor_standards)
ALTER TABLE "labor_standards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "labor_standards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_labor_standards" ON "labor_standards";
CREATE POLICY "tenant_isolation_labor_standards" ON "labor_standards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LandedCostAllocation (landed_cost_allocations)
ALTER TABLE "landed_cost_allocations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "landed_cost_allocations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_landed_cost_allocations" ON "landed_cost_allocations";
CREATE POLICY "tenant_isolation_landed_cost_allocations" ON "landed_cost_allocations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LandedCostChargeLine (landed_cost_charge_lines)
ALTER TABLE "landed_cost_charge_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "landed_cost_charge_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_landed_cost_charge_lines" ON "landed_cost_charge_lines";
CREATE POLICY "tenant_isolation_landed_cost_charge_lines" ON "landed_cost_charge_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LandedCostReceiptLink (landed_cost_receipt_links)
ALTER TABLE "landed_cost_receipt_links" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "landed_cost_receipt_links" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_landed_cost_receipt_links" ON "landed_cost_receipt_links";
CREATE POLICY "tenant_isolation_landed_cost_receipt_links" ON "landed_cost_receipt_links"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LandedCostVoucher (landed_cost_vouchers)
ALTER TABLE "landed_cost_vouchers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "landed_cost_vouchers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_landed_cost_vouchers" ON "landed_cost_vouchers";
CREATE POLICY "tenant_isolation_landed_cost_vouchers" ON "landed_cost_vouchers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LaneRate (lane_rates)
ALTER TABLE "lane_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lane_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lane_rates" ON "lane_rates";
CREATE POLICY "tenant_isolation_lane_rates" ON "lane_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LanguageOverride (language_overrides)
ALTER TABLE "language_overrides" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "language_overrides" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_language_overrides" ON "language_overrides";
CREATE POLICY "tenant_isolation_language_overrides" ON "language_overrides"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LastMileDelivery (last_mile_deliveries)
ALTER TABLE "last_mile_deliveries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "last_mile_deliveries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_last_mile_deliveries" ON "last_mile_deliveries";
CREATE POLICY "tenant_isolation_last_mile_deliveries" ON "last_mile_deliveries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LcAmendment (lc_amendments)
ALTER TABLE "lc_amendments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lc_amendments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lc_amendments" ON "lc_amendments";
CREATE POLICY "tenant_isolation_lc_amendments" ON "lc_amendments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LcDocument (lc_documents)
ALTER TABLE "lc_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lc_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lc_documents" ON "lc_documents";
CREATE POLICY "tenant_isolation_lc_documents" ON "lc_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LcPresentation (lc_presentations)
ALTER TABLE "lc_presentations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lc_presentations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lc_presentations" ON "lc_presentations";
CREATE POLICY "tenant_isolation_lc_presentations" ON "lc_presentations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeadSource (lead_sources)
ALTER TABLE "lead_sources" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lead_sources" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lead_sources" ON "lead_sources";
CREATE POLICY "tenant_isolation_lead_sources" ON "lead_sources"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeaderboardSnapshot (leaderboard_snapshots)
ALTER TABLE "leaderboard_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "leaderboard_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_leaderboard_snapshots" ON "leaderboard_snapshots";
CREATE POLICY "tenant_isolation_leaderboard_snapshots" ON "leaderboard_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Lead (leads)
ALTER TABLE "leads" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "leads" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_leads" ON "leads";
CREATE POLICY "tenant_isolation_leads" ON "leads"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeanImprovement (lean_improvements)
ALTER TABLE "lean_improvements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lean_improvements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lean_improvements" ON "lean_improvements";
CREATE POLICY "tenant_isolation_lean_improvements" ON "lean_improvements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LearningCourse (learning_courses)
ALTER TABLE "learning_courses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "learning_courses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_learning_courses" ON "learning_courses";
CREATE POLICY "tenant_isolation_learning_courses" ON "learning_courses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LearningEnrollment (learning_enrollments)
ALTER TABLE "learning_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "learning_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_learning_enrollments" ON "learning_enrollments";
CREATE POLICY "tenant_isolation_learning_enrollments" ON "learning_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LearningModule (learning_modules)
ALTER TABLE "learning_modules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "learning_modules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_learning_modules" ON "learning_modules";
CREATE POLICY "tenant_isolation_learning_modules" ON "learning_modules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeaseSchedule (lease_schedules)
ALTER TABLE "lease_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lease_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lease_schedules" ON "lease_schedules";
CREATE POLICY "tenant_isolation_lease_schedules" ON "lease_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeavePolicy (leave_policies)
ALTER TABLE "leave_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "leave_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_leave_policies" ON "leave_policies";
CREATE POLICY "tenant_isolation_leave_policies" ON "leave_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LeaveRequest (leave_requests)
ALTER TABLE "leave_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "leave_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_leave_requests" ON "leave_requests";
CREATE POLICY "tenant_isolation_leave_requests" ON "leave_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LegalHold (legal_holds)
ALTER TABLE "legal_holds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "legal_holds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_legal_holds" ON "legal_holds";
CREATE POLICY "tenant_isolation_legal_holds" ON "legal_holds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LetterOfCredit (letters_of_credit)
ALTER TABLE "letters_of_credit" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "letters_of_credit" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_letters_of_credit" ON "letters_of_credit";
CREATE POLICY "tenant_isolation_letters_of_credit" ON "letters_of_credit"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LicensePlateItem (license_plate_items)
ALTER TABLE "license_plate_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "license_plate_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_license_plate_items" ON "license_plate_items";
CREATE POLICY "tenant_isolation_license_plate_items" ON "license_plate_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LicensePlate (license_plates)
ALTER TABLE "license_plates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "license_plates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_license_plates" ON "license_plates";
CREATE POLICY "tenant_isolation_license_plates" ON "license_plates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadBuildItem (load_build_items)
ALTER TABLE "load_build_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_build_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_build_items" ON "load_build_items";
CREATE POLICY "tenant_isolation_load_build_items" ON "load_build_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadBuildStop (load_build_stops)
ALTER TABLE "load_build_stops" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_build_stops" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_build_stops" ON "load_build_stops";
CREATE POLICY "tenant_isolation_load_build_stops" ON "load_build_stops"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadBuild (load_builds)
ALTER TABLE "load_builds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_builds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_builds" ON "load_builds";
CREATE POLICY "tenant_isolation_load_builds" ON "load_builds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadCartonItem (load_carton_items)
ALTER TABLE "load_carton_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_carton_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_carton_items" ON "load_carton_items";
CREATE POLICY "tenant_isolation_load_carton_items" ON "load_carton_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadCarton (load_cartons)
ALTER TABLE "load_cartons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_cartons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_cartons" ON "load_cartons";
CREATE POLICY "tenant_isolation_load_cartons" ON "load_cartons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadPlanItem (load_plan_items)
ALTER TABLE "load_plan_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_plan_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_plan_items" ON "load_plan_items";
CREATE POLICY "tenant_isolation_load_plan_items" ON "load_plan_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadPlanPallet (load_plan_pallets)
ALTER TABLE "load_plan_pallets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_plan_pallets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_plan_pallets" ON "load_plan_pallets";
CREATE POLICY "tenant_isolation_load_plan_pallets" ON "load_plan_pallets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadPlan (load_plans)
ALTER TABLE "load_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_plans" ON "load_plans";
CREATE POLICY "tenant_isolation_load_plans" ON "load_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoadTenderRequest (load_tender_requests)
ALTER TABLE "load_tender_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "load_tender_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_load_tender_requests" ON "load_tender_requests";
CREATE POLICY "tenant_isolation_load_tender_requests" ON "load_tender_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoanDrawdown (loan_drawdowns)
ALTER TABLE "loan_drawdowns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "loan_drawdowns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_loan_drawdowns" ON "loan_drawdowns";
CREATE POLICY "tenant_isolation_loan_drawdowns" ON "loan_drawdowns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoanRepayment (loan_repayments)
ALTER TABLE "loan_repayments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "loan_repayments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_loan_repayments" ON "loan_repayments";
CREATE POLICY "tenant_isolation_loan_repayments" ON "loan_repayments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleApprovalWorkflow (locale_approval_workflows)
ALTER TABLE "locale_approval_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_approval_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_approval_workflows" ON "locale_approval_workflows";
CREATE POLICY "tenant_isolation_locale_approval_workflows" ON "locale_approval_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleContentSchedule (locale_content_schedules)
ALTER TABLE "locale_content_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_content_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_content_schedules" ON "locale_content_schedules";
CREATE POLICY "tenant_isolation_locale_content_schedules" ON "locale_content_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleFallbackChain (locale_fallback_chains)
ALTER TABLE "locale_fallback_chains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_fallback_chains" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_fallback_chains" ON "locale_fallback_chains";
CREATE POLICY "tenant_isolation_locale_fallback_chains" ON "locale_fallback_chains"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleFormattingRule (locale_formatting_rules)
ALTER TABLE "locale_formatting_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_formatting_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_formatting_rules" ON "locale_formatting_rules";
CREATE POLICY "tenant_isolation_locale_formatting_rules" ON "locale_formatting_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleGlossaryEntry (locale_glossary_entries)
ALTER TABLE "locale_glossary_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_glossary_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_glossary_entries" ON "locale_glossary_entries";
CREATE POLICY "tenant_isolation_locale_glossary_entries" ON "locale_glossary_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleMachineTranslationConfig (locale_machine_translation_configs)
ALTER TABLE "locale_machine_translation_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_machine_translation_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_machine_translation_configs" ON "locale_machine_translation_configs";
CREATE POLICY "tenant_isolation_locale_machine_translation_configs" ON "locale_machine_translation_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleTranslationContext (locale_translation_contexts)
ALTER TABLE "locale_translation_contexts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_translation_contexts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_translation_contexts" ON "locale_translation_contexts";
CREATE POLICY "tenant_isolation_locale_translation_contexts" ON "locale_translation_contexts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleTranslationMemoryEntry (locale_translation_memory_entries)
ALTER TABLE "locale_translation_memory_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_translation_memory_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_translation_memory_entries" ON "locale_translation_memory_entries";
CREATE POLICY "tenant_isolation_locale_translation_memory_entries" ON "locale_translation_memory_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LocaleTranslationReview (locale_translation_reviews)
ALTER TABLE "locale_translation_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locale_translation_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locale_translation_reviews" ON "locale_translation_reviews";
CREATE POLICY "tenant_isolation_locale_translation_reviews" ON "locale_translation_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Locale (locales)
ALTER TABLE "locales" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "locales" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_locales" ON "locales";
CREATE POLICY "tenant_isolation_locales" ON "locales"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LogicScript (logic_scripts)
ALTER TABLE "logic_scripts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "logic_scripts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_logic_scripts" ON "logic_scripts";
CREATE POLICY "tenant_isolation_logic_scripts" ON "logic_scripts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LoginHistory (login_histories)
ALTER TABLE "login_histories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "login_histories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_login_histories" ON "login_histories";
CREATE POLICY "tenant_isolation_login_histories" ON "login_histories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LogisticsProviderInvoice (logistics_provider_invoices)
ALTER TABLE "logistics_provider_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "logistics_provider_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_logistics_provider_invoices" ON "logistics_provider_invoices";
CREATE POLICY "tenant_isolation_logistics_provider_invoices" ON "logistics_provider_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LogisticsProviderPerformance (logistics_provider_performance)
ALTER TABLE "logistics_provider_performance" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "logistics_provider_performance" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_logistics_provider_performance" ON "logistics_provider_performance";
CREATE POLICY "tenant_isolation_logistics_provider_performance" ON "logistics_provider_performance"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LogisticsProvider (logistics_providers)
ALTER TABLE "logistics_providers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "logistics_providers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_logistics_providers" ON "logistics_providers";
CREATE POLICY "tenant_isolation_logistics_providers" ON "logistics_providers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for LotDisposalRecord (lot_disposal_records)
ALTER TABLE "lot_disposal_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lot_disposal_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lot_disposal_records" ON "lot_disposal_records";
CREATE POLICY "tenant_isolation_lot_disposal_records" ON "lot_disposal_records"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for LotExpiryAlert (lot_expiry_alerts)
ALTER TABLE "lot_expiry_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lot_expiry_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lot_expiry_alerts" ON "lot_expiry_alerts";
CREATE POLICY "tenant_isolation_lot_expiry_alerts" ON "lot_expiry_alerts"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for LotExpiryRecord (lot_expiry_records)
ALTER TABLE "lot_expiry_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lot_expiry_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lot_expiry_records" ON "lot_expiry_records";
CREATE POLICY "tenant_isolation_lot_expiry_records" ON "lot_expiry_records"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for LotMovement (lot_movements)
ALTER TABLE "lot_movements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "lot_movements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_lot_movements" ON "lot_movements";
CREATE POLICY "tenant_isolation_lot_movements" ON "lot_movements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MachineDowntime (machine_downtime)
ALTER TABLE "machine_downtime" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "machine_downtime" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_machine_downtime" ON "machine_downtime";
CREATE POLICY "tenant_isolation_machine_downtime" ON "machine_downtime"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MachineDowntimeLog (machine_downtime_logs)
ALTER TABLE "machine_downtime_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "machine_downtime_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_machine_downtime_logs" ON "machine_downtime_logs";
CREATE POLICY "tenant_isolation_machine_downtime_logs" ON "machine_downtime_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MachineMaintenanceLog (machine_maintenance_logs)
ALTER TABLE "machine_maintenance_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "machine_maintenance_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_machine_maintenance_logs" ON "machine_maintenance_logs";
CREATE POLICY "tenant_isolation_machine_maintenance_logs" ON "machine_maintenance_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MachineOeeRecord (machine_oee_records)
ALTER TABLE "machine_oee_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "machine_oee_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_machine_oee_records" ON "machine_oee_records";
CREATE POLICY "tenant_isolation_machine_oee_records" ON "machine_oee_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MaintenanceRequest (maintenance_requests)
ALTER TABLE "maintenance_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "maintenance_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_maintenance_requests" ON "maintenance_requests";
CREATE POLICY "tenant_isolation_maintenance_requests" ON "maintenance_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MaintenanceSchedule (maintenance_schedules)
ALTER TABLE "maintenance_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "maintenance_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_maintenance_schedules" ON "maintenance_schedules";
CREATE POLICY "tenant_isolation_maintenance_schedules" ON "maintenance_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManagementReport (management_reports)
ALTER TABLE "management_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "management_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_management_reports" ON "management_reports";
CREATE POLICY "tenant_isolation_management_reports" ON "management_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingMachine (manufacturing_machines)
ALTER TABLE "manufacturing_machines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_machines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_machines" ON "manufacturing_machines";
CREATE POLICY "tenant_isolation_manufacturing_machines" ON "manufacturing_machines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingQualityCheckTemplate (manufacturing_quality_check_templates)
ALTER TABLE "manufacturing_quality_check_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_quality_check_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_quality_check_templates" ON "manufacturing_quality_check_templates";
CREATE POLICY "tenant_isolation_manufacturing_quality_check_templates" ON "manufacturing_quality_check_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingQualityCheck (manufacturing_quality_checks)
ALTER TABLE "manufacturing_quality_checks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_quality_checks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_quality_checks" ON "manufacturing_quality_checks";
CREATE POLICY "tenant_isolation_manufacturing_quality_checks" ON "manufacturing_quality_checks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingRouteOperation (manufacturing_route_operations)
ALTER TABLE "manufacturing_route_operations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_route_operations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_route_operations" ON "manufacturing_route_operations";
CREATE POLICY "tenant_isolation_manufacturing_route_operations" ON "manufacturing_route_operations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingRoute (manufacturing_routes)
ALTER TABLE "manufacturing_routes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_routes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_routes" ON "manufacturing_routes";
CREATE POLICY "tenant_isolation_manufacturing_routes" ON "manufacturing_routes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingScrapRecord (manufacturing_scrap_records)
ALTER TABLE "manufacturing_scrap_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_scrap_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_scrap_records" ON "manufacturing_scrap_records";
CREATE POLICY "tenant_isolation_manufacturing_scrap_records" ON "manufacturing_scrap_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ManufacturingTimeEntry (manufacturing_time_entries)
ALTER TABLE "manufacturing_time_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "manufacturing_time_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_manufacturing_time_entries" ON "manufacturing_time_entries";
CREATE POLICY "tenant_isolation_manufacturing_time_entries" ON "manufacturing_time_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MarketRiskExposure (market_risk_exposures)
ALTER TABLE "market_risk_exposures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "market_risk_exposures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_market_risk_exposures" ON "market_risk_exposures";
CREATE POLICY "tenant_isolation_market_risk_exposures" ON "market_risk_exposures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MarketplaceDeveloperSubmission (marketplace_developer_submissions)
ALTER TABLE "marketplace_developer_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "marketplace_developer_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_marketplace_developer_submissions" ON "marketplace_developer_submissions";
CREATE POLICY "tenant_isolation_marketplace_developer_submissions" ON "marketplace_developer_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MarketplacePackage (marketplace_packages)
ALTER TABLE "marketplace_packages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "marketplace_packages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_marketplace_packages" ON "marketplace_packages";
CREATE POLICY "tenant_isolation_marketplace_packages" ON "marketplace_packages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MasterProductionSchedule (master_production_schedules)
ALTER TABLE "master_production_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "master_production_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_master_production_schedules" ON "master_production_schedules";
CREATE POLICY "tenant_isolation_master_production_schedules" ON "master_production_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MdfClaim (mdf_claims)
ALTER TABLE "mdf_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mdf_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mdf_claims" ON "mdf_claims";
CREATE POLICY "tenant_isolation_mdf_claims" ON "mdf_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MdfProgram (mdf_programs)
ALTER TABLE "mdf_programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mdf_programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mdf_programs" ON "mdf_programs";
CREATE POLICY "tenant_isolation_mdf_programs" ON "mdf_programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeetingAnalytics (meeting_analytics)
ALTER TABLE "meeting_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "meeting_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_meeting_analytics" ON "meeting_analytics";
CREATE POLICY "tenant_isolation_meeting_analytics" ON "meeting_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeetingChatMessage (meeting_chat_messages)
ALTER TABLE "meeting_chat_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "meeting_chat_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_meeting_chat_messages" ON "meeting_chat_messages";
CREATE POLICY "tenant_isolation_meeting_chat_messages" ON "meeting_chat_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeetingParticipant (meeting_participants)
ALTER TABLE "meeting_participants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "meeting_participants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_meeting_participants" ON "meeting_participants";
CREATE POLICY "tenant_isolation_meeting_participants" ON "meeting_participants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeetingRecording (meeting_recordings)
ALTER TABLE "meeting_recordings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "meeting_recordings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_meeting_recordings" ON "meeting_recordings";
CREATE POLICY "tenant_isolation_meeting_recordings" ON "meeting_recordings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeetingSummary (meeting_summaries)
ALTER TABLE "meeting_summaries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "meeting_summaries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_meeting_summaries" ON "meeting_summaries";
CREATE POLICY "tenant_isolation_meeting_summaries" ON "meeting_summaries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MentoringProgram (mentoring_programs)
ALTER TABLE "mentoring_programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mentoring_programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mentoring_programs" ON "mentoring_programs";
CREATE POLICY "tenant_isolation_mentoring_programs" ON "mentoring_programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MentoringSession (mentoring_sessions)
ALTER TABLE "mentoring_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mentoring_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mentoring_sessions" ON "mentoring_sessions";
CREATE POLICY "tenant_isolation_mentoring_sessions" ON "mentoring_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MessageBookmark (message_bookmarks)
ALTER TABLE "message_bookmarks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "message_bookmarks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_message_bookmarks" ON "message_bookmarks";
CREATE POLICY "tenant_isolation_message_bookmarks" ON "message_bookmarks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MessageEdit (message_edits)
ALTER TABLE "message_edits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "message_edits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_message_edits" ON "message_edits";
CREATE POLICY "tenant_isolation_message_edits" ON "message_edits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MessageForward (message_forwards)
ALTER TABLE "message_forwards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "message_forwards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_message_forwards" ON "message_forwards";
CREATE POLICY "tenant_isolation_message_forwards" ON "message_forwards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MessageReaction (message_reactions)
ALTER TABLE "message_reactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "message_reactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_message_reactions" ON "message_reactions";
CREATE POLICY "tenant_isolation_message_reactions" ON "message_reactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MessageReadReceipt (message_read_receipts)
ALTER TABLE "message_read_receipts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "message_read_receipts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_message_read_receipts" ON "message_read_receipts";
CREATE POLICY "tenant_isolation_message_read_receipts" ON "message_read_receipts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Message (messages)
ALTER TABLE "messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_messages" ON "messages";
CREATE POLICY "tenant_isolation_messages" ON "messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MeteringEvent (metering_events)
ALTER TABLE "metering_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "metering_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_metering_events" ON "metering_events";
CREATE POLICY "tenant_isolation_metering_events" ON "metering_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfaPushChallenge (mfa_push_challenges)
ALTER TABLE "mfa_push_challenges" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfa_push_challenges" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfa_push_challenges" ON "mfa_push_challenges";
CREATE POLICY "tenant_isolation_mfa_push_challenges" ON "mfa_push_challenges"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgCostEntry (mfg_cost_entries)
ALTER TABLE "mfg_cost_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_cost_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_cost_entries" ON "mfg_cost_entries";
CREATE POLICY "tenant_isolation_mfg_cost_entries" ON "mfg_cost_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgDocumentControl (mfg_document_controls)
ALTER TABLE "mfg_document_controls" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_document_controls" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_document_controls" ON "mfg_document_controls";
CREATE POLICY "tenant_isolation_mfg_document_controls" ON "mfg_document_controls"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgDocumentVersion (mfg_document_versions)
ALTER TABLE "mfg_document_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_document_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_document_versions" ON "mfg_document_versions";
CREATE POLICY "tenant_isolation_mfg_document_versions" ON "mfg_document_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgMaintenanceWorkOrder (mfg_maintenance_work_orders)
ALTER TABLE "mfg_maintenance_work_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_maintenance_work_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_maintenance_work_orders" ON "mfg_maintenance_work_orders";
CREATE POLICY "tenant_isolation_mfg_maintenance_work_orders" ON "mfg_maintenance_work_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgSpcChart (mfg_spc_charts)
ALTER TABLE "mfg_spc_charts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_spc_charts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_spc_charts" ON "mfg_spc_charts";
CREATE POLICY "tenant_isolation_mfg_spc_charts" ON "mfg_spc_charts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MfgSpcDataPoint (mfg_spc_data_points)
ALTER TABLE "mfg_spc_data_points" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mfg_spc_data_points" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mfg_spc_data_points" ON "mfg_spc_data_points";
CREATE POLICY "tenant_isolation_mfg_spc_data_points" ON "mfg_spc_data_points"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MileageRate (mileage_rates)
ALTER TABLE "mileage_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mileage_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mileage_rates" ON "mileage_rates";
CREATE POLICY "tenant_isolation_mileage_rates" ON "mileage_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Milestone (milestones)
ALTER TABLE "milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_milestones" ON "milestones";
CREATE POLICY "tenant_isolation_milestones" ON "milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MinMaxLevel (min_max_levels)
ALTER TABLE "min_max_levels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "min_max_levels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_min_max_levels" ON "min_max_levels";
CREATE POLICY "tenant_isolation_min_max_levels" ON "min_max_levels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MinorityInterestSchedule (minority_interest_schedules)
ALTER TABLE "minority_interest_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "minority_interest_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_minority_interest_schedules" ON "minority_interest_schedules";
CREATE POLICY "tenant_isolation_minority_interest_schedules" ON "minority_interest_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MobileApp (mobile_apps)
ALTER TABLE "mobile_apps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mobile_apps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mobile_apps" ON "mobile_apps";
CREATE POLICY "tenant_isolation_mobile_apps" ON "mobile_apps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MobileBuild (mobile_builds)
ALTER TABLE "mobile_builds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mobile_builds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mobile_builds" ON "mobile_builds";
CREATE POLICY "tenant_isolation_mobile_builds" ON "mobile_builds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MobileNotificationConfig (mobile_notification_configs)
ALTER TABLE "mobile_notification_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mobile_notification_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mobile_notification_configs" ON "mobile_notification_configs";
CREATE POLICY "tenant_isolation_mobile_notification_configs" ON "mobile_notification_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MobileScreen (mobile_screens)
ALTER TABLE "mobile_screens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mobile_screens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mobile_screens" ON "mobile_screens";
CREATE POLICY "tenant_isolation_mobile_screens" ON "mobile_screens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MpsEntry (mps_entries)
ALTER TABLE "mps_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mps_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mps_entries" ON "mps_entries";
CREATE POLICY "tenant_isolation_mps_entries" ON "mps_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MRPPlannedItem (mrp_planned_items)
ALTER TABLE "mrp_planned_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mrp_planned_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mrp_planned_items" ON "mrp_planned_items";
CREATE POLICY "tenant_isolation_mrp_planned_items" ON "mrp_planned_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MRPRun (mrp_runs)
ALTER TABLE "mrp_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "mrp_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_mrp_runs" ON "mrp_runs";
CREATE POLICY "tenant_isolation_mrp_runs" ON "mrp_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MultiModalTransportEvent (multimodal_transport_events)
ALTER TABLE "multimodal_transport_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "multimodal_transport_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_multimodal_transport_events" ON "multimodal_transport_events";
CREATE POLICY "tenant_isolation_multimodal_transport_events" ON "multimodal_transport_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MultiModalTransportLeg (multimodal_transport_legs)
ALTER TABLE "multimodal_transport_legs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "multimodal_transport_legs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_multimodal_transport_legs" ON "multimodal_transport_legs";
CREATE POLICY "tenant_isolation_multimodal_transport_legs" ON "multimodal_transport_legs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for MultiModalTransportOrder (multimodal_transport_orders)
ALTER TABLE "multimodal_transport_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "multimodal_transport_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_multimodal_transport_orders" ON "multimodal_transport_orders";
CREATE POLICY "tenant_isolation_multimodal_transport_orders" ON "multimodal_transport_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NamedAccount (named_accounts)
ALTER TABLE "named_accounts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "named_accounts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_named_accounts" ON "named_accounts";
CREATE POLICY "tenant_isolation_named_accounts" ON "named_accounts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NettingGroupMember (netting_group_members)
ALTER TABLE "netting_group_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "netting_group_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_netting_group_members" ON "netting_group_members";
CREATE POLICY "tenant_isolation_netting_group_members" ON "netting_group_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NettingGroup (netting_groups)
ALTER TABLE "netting_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "netting_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_netting_groups" ON "netting_groups";
CREATE POLICY "tenant_isolation_netting_groups" ON "netting_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NettingRunDetail (netting_run_details)
ALTER TABLE "netting_run_details" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "netting_run_details" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_netting_run_details" ON "netting_run_details";
CREATE POLICY "tenant_isolation_netting_run_details" ON "netting_run_details"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NettingRun (netting_runs)
ALTER TABLE "netting_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "netting_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_netting_runs" ON "netting_runs";
CREATE POLICY "tenant_isolation_netting_runs" ON "netting_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NexusMonitoringSnapshot (nexus_monitoring_snapshots)
ALTER TABLE "nexus_monitoring_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "nexus_monitoring_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_nexus_monitoring_snapshots" ON "nexus_monitoring_snapshots";
CREATE POLICY "tenant_isolation_nexus_monitoring_snapshots" ON "nexus_monitoring_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NexusRegistration (nexus_registrations)
ALTER TABLE "nexus_registrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "nexus_registrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_nexus_registrations" ON "nexus_registrations";
CREATE POLICY "tenant_isolation_nexus_registrations" ON "nexus_registrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NonConformanceReport (non_conformance_reports)
ALTER TABLE "non_conformance_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "non_conformance_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_non_conformance_reports" ON "non_conformance_reports";
CREATE POLICY "tenant_isolation_non_conformance_reports" ON "non_conformance_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationBatchItem (notification_batch_items)
ALTER TABLE "notification_batch_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_batch_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_batch_items" ON "notification_batch_items";
CREATE POLICY "tenant_isolation_notification_batch_items" ON "notification_batch_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationBatch (notification_batches)
ALTER TABLE "notification_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_batches" ON "notification_batches";
CREATE POLICY "tenant_isolation_notification_batches" ON "notification_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationChannel (notification_channels)
ALTER TABLE "notification_channels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_channels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_channels" ON "notification_channels";
CREATE POLICY "tenant_isolation_notification_channels" ON "notification_channels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationDeliveryLog (notification_delivery_logs)
ALTER TABLE "notification_delivery_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_delivery_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_delivery_logs" ON "notification_delivery_logs";
CREATE POLICY "tenant_isolation_notification_delivery_logs" ON "notification_delivery_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationDigest (notification_digests)
ALTER TABLE "notification_digests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_digests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_digests" ON "notification_digests";
CREATE POLICY "tenant_isolation_notification_digests" ON "notification_digests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationPreference (notification_preferences)
ALTER TABLE "notification_preferences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_preferences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_preferences" ON "notification_preferences";
CREATE POLICY "tenant_isolation_notification_preferences" ON "notification_preferences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NotificationTemplate (notification_templates)
ALTER TABLE "notification_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notification_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notification_templates" ON "notification_templates";
CREATE POLICY "tenant_isolation_notification_templates" ON "notification_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Notification (notifications)
ALTER TABLE "notifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "notifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_notifications" ON "notifications";
CREATE POLICY "tenant_isolation_notifications" ON "notifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NpsAnalytic (nps_analytics)
ALTER TABLE "nps_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "nps_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_nps_analytics" ON "nps_analytics";
CREATE POLICY "tenant_isolation_nps_analytics" ON "nps_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NpsResponse (nps_responses)
ALTER TABLE "nps_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "nps_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_nps_responses" ON "nps_responses";
CREATE POLICY "tenant_isolation_nps_responses" ON "nps_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for NpsSurvey (nps_surveys)
ALTER TABLE "nps_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "nps_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_nps_surveys" ON "nps_surveys";
CREATE POLICY "tenant_isolation_nps_surveys" ON "nps_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OffboardingChecklist (offboarding_checklists)
ALTER TABLE "offboarding_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "offboarding_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_offboarding_checklists" ON "offboarding_checklists";
CREATE POLICY "tenant_isolation_offboarding_checklists" ON "offboarding_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OffboardingItem (offboarding_items)
ALTER TABLE "offboarding_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "offboarding_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_offboarding_items" ON "offboarding_items";
CREATE POLICY "tenant_isolation_offboarding_items" ON "offboarding_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OfferLetter (offer_letters)
ALTER TABLE "offer_letters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "offer_letters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_offer_letters" ON "offer_letters";
CREATE POLICY "tenant_isolation_offer_letters" ON "offer_letters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OfferTemplate (offer_templates)
ALTER TABLE "offer_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "offer_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_offer_templates" ON "offer_templates";
CREATE POLICY "tenant_isolation_offer_templates" ON "offer_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OfflineSyncQueue (offline_sync_queues)
ALTER TABLE "offline_sync_queues" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "offline_sync_queues" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_offline_sync_queues" ON "offline_sync_queues";
CREATE POLICY "tenant_isolation_offline_sync_queues" ON "offline_sync_queues"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OmnichannelConversation (omnichannel_conversations)
ALTER TABLE "omnichannel_conversations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "omnichannel_conversations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_omnichannel_conversations" ON "omnichannel_conversations";
CREATE POLICY "tenant_isolation_omnichannel_conversations" ON "omnichannel_conversations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OnboardingChecklist (onboarding_checklists)
ALTER TABLE "onboarding_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "onboarding_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_onboarding_checklists" ON "onboarding_checklists";
CREATE POLICY "tenant_isolation_onboarding_checklists" ON "onboarding_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OnboardingItem (onboarding_items)
ALTER TABLE "onboarding_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "onboarding_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_onboarding_items" ON "onboarding_items";
CREATE POLICY "tenant_isolation_onboarding_items" ON "onboarding_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OperationalRiskEvent (operational_risk_events)
ALTER TABLE "operational_risk_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "operational_risk_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_operational_risk_events" ON "operational_risk_events";
CREATE POLICY "tenant_isolation_operational_risk_events" ON "operational_risk_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Opportunity (opportunities)
ALTER TABLE "opportunities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "opportunities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_opportunities" ON "opportunities";
CREATE POLICY "tenant_isolation_opportunities" ON "opportunities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OpportunityChecklist (opportunity_checklists)
ALTER TABLE "opportunity_checklists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "opportunity_checklists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_opportunity_checklists" ON "opportunity_checklists";
CREATE POLICY "tenant_isolation_opportunity_checklists" ON "opportunity_checklists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OpportunityLineItem (opportunity_line_items)
ALTER TABLE "opportunity_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "opportunity_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_opportunity_line_items" ON "opportunity_line_items";
CREATE POLICY "tenant_isolation_opportunity_line_items" ON "opportunity_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrderApprovalAction (order_approval_actions)
ALTER TABLE "order_approval_actions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "order_approval_actions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_order_approval_actions" ON "order_approval_actions";
CREATE POLICY "tenant_isolation_order_approval_actions" ON "order_approval_actions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrderApprovalRequest (order_approval_requests)
ALTER TABLE "order_approval_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "order_approval_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_order_approval_requests" ON "order_approval_requests";
CREATE POLICY "tenant_isolation_order_approval_requests" ON "order_approval_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrderApprovalWorkflowStep (order_approval_workflow_steps)
ALTER TABLE "order_approval_workflow_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "order_approval_workflow_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_order_approval_workflow_steps" ON "order_approval_workflow_steps";
CREATE POLICY "tenant_isolation_order_approval_workflow_steps" ON "order_approval_workflow_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrderApprovalWorkflow (order_approval_workflows)
ALTER TABLE "order_approval_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "order_approval_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_order_approval_workflows" ON "order_approval_workflows";
CREATE POLICY "tenant_isolation_order_approval_workflows" ON "order_approval_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrgPosition (org_positions)
ALTER TABLE "org_positions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "org_positions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_org_positions" ON "org_positions";
CREATE POLICY "tenant_isolation_org_positions" ON "org_positions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OrgUnit (org_units)
ALTER TABLE "org_units" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "org_units" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_org_units" ON "org_units";
CREATE POLICY "tenant_isolation_org_units" ON "org_units"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Organization (organizations)
ALTER TABLE "organizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "organizations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_organizations" ON "organizations";
CREATE POLICY "tenant_isolation_organizations" ON "organizations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboundShipment (outbound_shipments)
ALTER TABLE "outbound_shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbound_shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbound_shipments" ON "outbound_shipments";
CREATE POLICY "tenant_isolation_outbound_shipments" ON "outbound_shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxConsumerReceipt (outbox_consumer_receipts)
ALTER TABLE "outbox_consumer_receipts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_consumer_receipts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_consumer_receipts" ON "outbox_consumer_receipts";
CREATE POLICY "tenant_isolation_outbox_consumer_receipts" ON "outbox_consumer_receipts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxDeadLetterMessage (outbox_dead_letter_messages)
ALTER TABLE "outbox_dead_letter_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_dead_letter_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_dead_letter_messages" ON "outbox_dead_letter_messages";
CREATE POLICY "tenant_isolation_outbox_dead_letter_messages" ON "outbox_dead_letter_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxDelivery (outbox_deliveries)
ALTER TABLE "outbox_deliveries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_deliveries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_deliveries" ON "outbox_deliveries";
CREATE POLICY "tenant_isolation_outbox_deliveries" ON "outbox_deliveries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxDispatcherState (outbox_dispatcher_states)
ALTER TABLE "outbox_dispatcher_states" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_dispatcher_states" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_dispatcher_states" ON "outbox_dispatcher_states";
CREATE POLICY "tenant_isolation_outbox_dispatcher_states" ON "outbox_dispatcher_states"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxDLQ (outbox_dlqs)
ALTER TABLE "outbox_dlqs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_dlqs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_dlqs" ON "outbox_dlqs";
CREATE POLICY "tenant_isolation_outbox_dlqs" ON "outbox_dlqs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxEvent (outbox_events)
ALTER TABLE "outbox_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_events" ON "outbox_events";
CREATE POLICY "tenant_isolation_outbox_events" ON "outbox_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutboxRetryLog (outbox_retry_logs)
ALTER TABLE "outbox_retry_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outbox_retry_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outbox_retry_logs" ON "outbox_retry_logs";
CREATE POLICY "tenant_isolation_outbox_retry_logs" ON "outbox_retry_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutsourcingPoItem (outsourcing_po_items)
ALTER TABLE "outsourcing_po_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outsourcing_po_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outsourcing_po_items" ON "outsourcing_po_items";
CREATE POLICY "tenant_isolation_outsourcing_po_items" ON "outsourcing_po_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OutsourcingPurchaseOrder (outsourcing_purchase_orders)
ALTER TABLE "outsourcing_purchase_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "outsourcing_purchase_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_outsourcing_purchase_orders" ON "outsourcing_purchase_orders";
CREATE POLICY "tenant_isolation_outsourcing_purchase_orders" ON "outsourcing_purchase_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for OvertimeRequest (overtime_requests)
ALTER TABLE "overtime_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "overtime_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_overtime_requests" ON "overtime_requests";
CREATE POLICY "tenant_isolation_overtime_requests" ON "overtime_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PackagingSpec (packaging_specs)
ALTER TABLE "packaging_specs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "packaging_specs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_packaging_specs" ON "packaging_specs";
CREATE POLICY "tenant_isolation_packaging_specs" ON "packaging_specs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PackingCarton (packing_cartons)
ALTER TABLE "packing_cartons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "packing_cartons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_packing_cartons" ON "packing_cartons";
CREATE POLICY "tenant_isolation_packing_cartons" ON "packing_cartons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PackingPlan (packing_plans)
ALTER TABLE "packing_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "packing_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_packing_plans" ON "packing_plans";
CREATE POLICY "tenant_isolation_packing_plans" ON "packing_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PackingSession (packing_sessions)
ALTER TABLE "packing_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "packing_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_packing_sessions" ON "packing_sessions";
CREATE POLICY "tenant_isolation_packing_sessions" ON "packing_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PageRegistry (page_registries)
ALTER TABLE "page_registries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "page_registries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_page_registries" ON "page_registries";
CREATE POLICY "tenant_isolation_page_registries" ON "page_registries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PageSection (page_sections)
ALTER TABLE "page_sections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "page_sections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_page_sections" ON "page_sections";
CREATE POLICY "tenant_isolation_page_sections" ON "page_sections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PageTemplate (page_templates)
ALTER TABLE "page_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "page_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_page_templates" ON "page_templates";
CREATE POLICY "tenant_isolation_page_templates" ON "page_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PalletType (pallet_types)
ALTER TABLE "pallet_types" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pallet_types" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pallet_types" ON "pallet_types";
CREATE POLICY "tenant_isolation_pallet_types" ON "pallet_types"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PartnerDealRegistration (partner_deal_registrations)
ALTER TABLE "partner_deal_registrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "partner_deal_registrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_partner_deal_registrations" ON "partner_deal_registrations";
CREATE POLICY "tenant_isolation_partner_deal_registrations" ON "partner_deal_registrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PartnerPerformanceMetric (partner_performance_metrics)
ALTER TABLE "partner_performance_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "partner_performance_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_partner_performance_metrics" ON "partner_performance_metrics";
CREATE POLICY "tenant_isolation_partner_performance_metrics" ON "partner_performance_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PasswordResetToken (password_reset_tokens)
ALTER TABLE "password_reset_tokens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "password_reset_tokens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_password_reset_tokens" ON "password_reset_tokens";
CREATE POLICY "tenant_isolation_password_reset_tokens" ON "password_reset_tokens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentBatchLine (payment_batch_lines)
ALTER TABLE "payment_batch_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_batch_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_batch_lines" ON "payment_batch_lines";
CREATE POLICY "tenant_isolation_payment_batch_lines" ON "payment_batch_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentBatch (payment_batches)
ALTER TABLE "payment_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_batches" ON "payment_batches";
CREATE POLICY "tenant_isolation_payment_batches" ON "payment_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentMethod (payment_methods)
ALTER TABLE "payment_methods" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_methods" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_methods" ON "payment_methods";
CREATE POLICY "tenant_isolation_payment_methods" ON "payment_methods"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentRailOptimization (payment_rail_optimizations)
ALTER TABLE "payment_rail_optimizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_rail_optimizations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_rail_optimizations" ON "payment_rail_optimizations";
CREATE POLICY "tenant_isolation_payment_rail_optimizations" ON "payment_rail_optimizations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentRun (payment_runs)
ALTER TABLE "payment_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_runs" ON "payment_runs";
CREATE POLICY "tenant_isolation_payment_runs" ON "payment_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentSchedule (payment_schedules)
ALTER TABLE "payment_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_schedules" ON "payment_schedules";
CREATE POLICY "tenant_isolation_payment_schedules" ON "payment_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentTermTemplate (payment_term_templates)
ALTER TABLE "payment_term_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_term_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_term_templates" ON "payment_term_templates";
CREATE POLICY "tenant_isolation_payment_term_templates" ON "payment_term_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PaymentTransaction (payment_transactions)
ALTER TABLE "payment_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payment_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payment_transactions" ON "payment_transactions";
CREATE POLICY "tenant_isolation_payment_transactions" ON "payment_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Payment (payments)
ALTER TABLE "payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payments" ON "payments";
CREATE POLICY "tenant_isolation_payments" ON "payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PayrollContribution (payroll_contributions)
ALTER TABLE "payroll_contributions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payroll_contributions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payroll_contributions" ON "payroll_contributions";
CREATE POLICY "tenant_isolation_payroll_contributions" ON "payroll_contributions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PayrollRun (payroll_runs)
ALTER TABLE "payroll_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payroll_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payroll_runs" ON "payroll_runs";
CREATE POLICY "tenant_isolation_payroll_runs" ON "payroll_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PayrollSlip (payroll_slips)
ALTER TABLE "payroll_slips" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payroll_slips" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payroll_slips" ON "payroll_slips";
CREATE POLICY "tenant_isolation_payroll_slips" ON "payroll_slips"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PayrollTaxEntry (payroll_tax_entries)
ALTER TABLE "payroll_tax_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "payroll_tax_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_payroll_tax_entries" ON "payroll_tax_entries";
CREATE POLICY "tenant_isolation_payroll_tax_entries" ON "payroll_tax_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeopleCompetency (people_competencies)
ALTER TABLE "people_competencies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_competencies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_competencies" ON "people_competencies";
CREATE POLICY "tenant_isolation_people_competencies" ON "people_competencies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeopleOnboardingTask (people_onboarding_tasks)
ALTER TABLE "people_onboarding_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_onboarding_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_onboarding_tasks" ON "people_onboarding_tasks";
CREATE POLICY "tenant_isolation_people_onboarding_tasks" ON "people_onboarding_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeoplePeerRecognition (people_peer_recognitions)
ALTER TABLE "people_peer_recognitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_peer_recognitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_peer_recognitions" ON "people_peer_recognitions";
CREATE POLICY "tenant_isolation_people_peer_recognitions" ON "people_peer_recognitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeoplePerformanceMetric (people_performance_metrics)
ALTER TABLE "people_performance_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_performance_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_performance_metrics" ON "people_performance_metrics";
CREATE POLICY "tenant_isolation_people_performance_metrics" ON "people_performance_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeopleSuccessionPlan (people_succession_plans)
ALTER TABLE "people_succession_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_succession_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_succession_plans" ON "people_succession_plans";
CREATE POLICY "tenant_isolation_people_succession_plans" ON "people_succession_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeopleTimeOffRequest (people_time_off_requests)
ALTER TABLE "people_time_off_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "people_time_off_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_people_time_off_requests" ON "people_time_off_requests";
CREATE POLICY "tenant_isolation_people_time_off_requests" ON "people_time_off_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PerDiemRate (per_diem_rates)
ALTER TABLE "per_diem_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "per_diem_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_per_diem_rates" ON "per_diem_rates";
CREATE POLICY "tenant_isolation_per_diem_rates" ON "per_diem_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PerformanceObligation (performance_obligations)
ALTER TABLE "performance_obligations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "performance_obligations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_performance_obligations" ON "performance_obligations";
CREATE POLICY "tenant_isolation_performance_obligations" ON "performance_obligations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PeriodCertification (period_certifications)
ALTER TABLE "period_certifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "period_certifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_period_certifications" ON "period_certifications";
CREATE POLICY "tenant_isolation_period_certifications" ON "period_certifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PersonalizationRule (personalization_rules)
ALTER TABLE "personalization_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "personalization_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_personalization_rules" ON "personalization_rules";
CREATE POLICY "tenant_isolation_personalization_rules" ON "personalization_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PhoneCallLog (phone_call_logs)
ALTER TABLE "phone_call_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "phone_call_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_phone_call_logs" ON "phone_call_logs";
CREATE POLICY "tenant_isolation_phone_call_logs" ON "phone_call_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PhoneExtension (phone_extensions)
ALTER TABLE "phone_extensions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "phone_extensions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_phone_extensions" ON "phone_extensions";
CREATE POLICY "tenant_isolation_phone_extensions" ON "phone_extensions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PickSuggestion (pick_suggestions)
ALTER TABLE "pick_suggestions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pick_suggestions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pick_suggestions" ON "pick_suggestions";
CREATE POLICY "tenant_isolation_pick_suggestions" ON "pick_suggestions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PickTask (pick_tasks)
ALTER TABLE "pick_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pick_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pick_tasks" ON "pick_tasks";
CREATE POLICY "tenant_isolation_pick_tasks" ON "pick_tasks"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for PickWaveItem (pick_wave_items)
ALTER TABLE "pick_wave_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pick_wave_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pick_wave_items" ON "pick_wave_items";
CREATE POLICY "tenant_isolation_pick_wave_items" ON "pick_wave_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PickWaveOrder (pick_wave_orders)
ALTER TABLE "pick_wave_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pick_wave_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pick_wave_orders" ON "pick_wave_orders";
CREATE POLICY "tenant_isolation_pick_wave_orders" ON "pick_wave_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PickWave (pick_waves)
ALTER TABLE "pick_waves" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pick_waves" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pick_waves" ON "pick_waves";
CREATE POLICY "tenant_isolation_pick_waves" ON "pick_waves"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PipelineRiskAlert (pipeline_risk_alerts)
ALTER TABLE "pipeline_risk_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pipeline_risk_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pipeline_risk_alerts" ON "pipeline_risk_alerts";
CREATE POLICY "tenant_isolation_pipeline_risk_alerts" ON "pipeline_risk_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PipelineVelocity (pipeline_velocities)
ALTER TABLE "pipeline_velocities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pipeline_velocities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pipeline_velocities" ON "pipeline_velocities";
CREATE POLICY "tenant_isolation_pipeline_velocities" ON "pipeline_velocities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PlaybookStage (playbook_stages)
ALTER TABLE "playbook_stages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "playbook_stages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_playbook_stages" ON "playbook_stages";
CREATE POLICY "tenant_isolation_playbook_stages" ON "playbook_stages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PmoScorecardDimension (pmo_scorecard_dimensions)
ALTER TABLE "pmo_scorecard_dimensions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pmo_scorecard_dimensions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pmo_scorecard_dimensions" ON "pmo_scorecard_dimensions";
CREATE POLICY "tenant_isolation_pmo_scorecard_dimensions" ON "pmo_scorecard_dimensions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PmoScorecard (pmo_scorecards)
ALTER TABLE "pmo_scorecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pmo_scorecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pmo_scorecards" ON "pmo_scorecards";
CREATE POLICY "tenant_isolation_pmo_scorecards" ON "pmo_scorecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PoCollaboration (po_collaborations)
ALTER TABLE "po_collaborations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "po_collaborations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_po_collaborations" ON "po_collaborations";
CREATE POLICY "tenant_isolation_po_collaborations" ON "po_collaborations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PortTerminal (port_terminals)
ALTER TABLE "port_terminals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "port_terminals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_port_terminals" ON "port_terminals";
CREATE POLICY "tenant_isolation_port_terminals" ON "port_terminals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PortalActivityLog (portal_activity_logs)
ALTER TABLE "portal_activity_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "portal_activity_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_portal_activity_logs" ON "portal_activity_logs";
CREATE POLICY "tenant_isolation_portal_activity_logs" ON "portal_activity_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PortalDocumentAccess (portal_document_access)
ALTER TABLE "portal_document_access" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "portal_document_access" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_portal_document_access" ON "portal_document_access";
CREATE POLICY "tenant_isolation_portal_document_access" ON "portal_document_access"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PortalPaymentIntent (portal_payment_intents)
ALTER TABLE "portal_payment_intents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "portal_payment_intents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_portal_payment_intents" ON "portal_payment_intents";
CREATE POLICY "tenant_isolation_portal_payment_intents" ON "portal_payment_intents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSCoupon (pos_coupons)
ALTER TABLE "pos_coupons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_coupons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_coupons" ON "pos_coupons";
CREATE POLICY "tenant_isolation_pos_coupons" ON "pos_coupons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosCustomerDisplay (pos_customer_displays)
ALTER TABLE "pos_customer_displays" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_customer_displays" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_customer_displays" ON "pos_customer_displays";
CREATE POLICY "tenant_isolation_pos_customer_displays" ON "pos_customer_displays"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosDiscountRule (pos_discount_rules)
ALTER TABLE "pos_discount_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_discount_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_discount_rules" ON "pos_discount_rules";
CREATE POLICY "tenant_isolation_pos_discount_rules" ON "pos_discount_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSDiscount (pos_discounts)
ALTER TABLE "pos_discounts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_discounts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_discounts" ON "pos_discounts";
CREATE POLICY "tenant_isolation_pos_discounts" ON "pos_discounts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSGiftCardTransaction (pos_gift_card_transactions)
ALTER TABLE "pos_gift_card_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_gift_card_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_gift_card_transactions" ON "pos_gift_card_transactions";
CREATE POLICY "tenant_isolation_pos_gift_card_transactions" ON "pos_gift_card_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosGiftCardTransaction2 (pos_gift_card_transactions_v2)
ALTER TABLE "pos_gift_card_transactions_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_gift_card_transactions_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_gift_card_transactions_v2" ON "pos_gift_card_transactions_v2";
CREATE POLICY "tenant_isolation_pos_gift_card_transactions_v2" ON "pos_gift_card_transactions_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSGiftCard (pos_gift_cards)
ALTER TABLE "pos_gift_cards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_gift_cards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_gift_cards" ON "pos_gift_cards";
CREATE POLICY "tenant_isolation_pos_gift_cards" ON "pos_gift_cards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosGiftCard2 (pos_gift_cards_v2)
ALTER TABLE "pos_gift_cards_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_gift_cards_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_gift_cards_v2" ON "pos_gift_cards_v2";
CREATE POLICY "tenant_isolation_pos_gift_cards_v2" ON "pos_gift_cards_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSHeldOrder (pos_held_orders)
ALTER TABLE "pos_held_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_held_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_held_orders" ON "pos_held_orders";
CREATE POLICY "tenant_isolation_pos_held_orders" ON "pos_held_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosKitchenDisplay (pos_kitchen_displays)
ALTER TABLE "pos_kitchen_displays" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_kitchen_displays" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_kitchen_displays" ON "pos_kitchen_displays";
CREATE POLICY "tenant_isolation_pos_kitchen_displays" ON "pos_kitchen_displays"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosKitchenOrder (pos_kitchen_orders)
ALTER TABLE "pos_kitchen_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_kitchen_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_kitchen_orders" ON "pos_kitchen_orders";
CREATE POLICY "tenant_isolation_pos_kitchen_orders" ON "pos_kitchen_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSLayawayPayment (pos_layaway_payments)
ALTER TABLE "pos_layaway_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_layaway_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_layaway_payments" ON "pos_layaway_payments";
CREATE POLICY "tenant_isolation_pos_layaway_payments" ON "pos_layaway_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSLayaway (pos_layaways)
ALTER TABLE "pos_layaways" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_layaways" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_layaways" ON "pos_layaways";
CREATE POLICY "tenant_isolation_pos_layaways" ON "pos_layaways"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSLoyaltyMember (pos_loyalty_members)
ALTER TABLE "pos_loyalty_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_loyalty_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_loyalty_members" ON "pos_loyalty_members";
CREATE POLICY "tenant_isolation_pos_loyalty_members" ON "pos_loyalty_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSLoyaltyProgram (pos_loyalty_programs)
ALTER TABLE "pos_loyalty_programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_loyalty_programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_loyalty_programs" ON "pos_loyalty_programs";
CREATE POLICY "tenant_isolation_pos_loyalty_programs" ON "pos_loyalty_programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSLoyaltyTransaction (pos_loyalty_transactions)
ALTER TABLE "pos_loyalty_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_loyalty_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_loyalty_transactions" ON "pos_loyalty_transactions";
CREATE POLICY "tenant_isolation_pos_loyalty_transactions" ON "pos_loyalty_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSOpenTab (pos_open_tabs)
ALTER TABLE "pos_open_tabs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_open_tabs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_open_tabs" ON "pos_open_tabs";
CREATE POLICY "tenant_isolation_pos_open_tabs" ON "pos_open_tabs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSOrderItem (pos_order_items)
ALTER TABLE "pos_order_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_order_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_order_items" ON "pos_order_items";
CREATE POLICY "tenant_isolation_pos_order_items" ON "pos_order_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosOrderType (pos_order_types)
ALTER TABLE "pos_order_types" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_order_types" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_order_types" ON "pos_order_types";
CREATE POLICY "tenant_isolation_pos_order_types" ON "pos_order_types"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSOrder (pos_orders)
ALTER TABLE "pos_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_orders" ON "pos_orders";
CREATE POLICY "tenant_isolation_pos_orders" ON "pos_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosPaymentMethod (pos_payment_methods)
ALTER TABLE "pos_payment_methods" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_payment_methods" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_payment_methods" ON "pos_payment_methods";
CREATE POLICY "tenant_isolation_pos_payment_methods" ON "pos_payment_methods"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSPayment (pos_payments)
ALTER TABLE "pos_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_payments" ON "pos_payments";
CREATE POLICY "tenant_isolation_pos_payments" ON "pos_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSPriceListItem (pos_price_list_items)
ALTER TABLE "pos_price_list_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_price_list_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_price_list_items" ON "pos_price_list_items";
CREATE POLICY "tenant_isolation_pos_price_list_items" ON "pos_price_list_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSPriceList (pos_price_lists)
ALTER TABLE "pos_price_lists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_price_lists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_price_lists" ON "pos_price_lists";
CREATE POLICY "tenant_isolation_pos_price_lists" ON "pos_price_lists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSPromotion (pos_promotions)
ALTER TABLE "pos_promotions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_promotions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_promotions" ON "pos_promotions";
CREATE POLICY "tenant_isolation_pos_promotions" ON "pos_promotions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSQuickKey (pos_quick_keys)
ALTER TABLE "pos_quick_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_quick_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_quick_keys" ON "pos_quick_keys";
CREATE POLICY "tenant_isolation_pos_quick_keys" ON "pos_quick_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosRefundItem (pos_refund_items)
ALTER TABLE "pos_refund_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_refund_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_refund_items" ON "pos_refund_items";
CREATE POLICY "tenant_isolation_pos_refund_items" ON "pos_refund_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosRefund (pos_refunds)
ALTER TABLE "pos_refunds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_refunds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_refunds" ON "pos_refunds";
CREATE POLICY "tenant_isolation_pos_refunds" ON "pos_refunds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSRegister (pos_registers)
ALTER TABLE "pos_registers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_registers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_registers" ON "pos_registers";
CREATE POLICY "tenant_isolation_pos_registers" ON "pos_registers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosRegister2 (pos_registers_v2)
ALTER TABLE "pos_registers_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_registers_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_registers_v2" ON "pos_registers_v2";
CREATE POLICY "tenant_isolation_pos_registers_v2" ON "pos_registers_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSReturnItem (pos_return_items)
ALTER TABLE "pos_return_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_return_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_return_items" ON "pos_return_items";
CREATE POLICY "tenant_isolation_pos_return_items" ON "pos_return_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSReturn (pos_returns)
ALTER TABLE "pos_returns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_returns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_returns" ON "pos_returns";
CREATE POLICY "tenant_isolation_pos_returns" ON "pos_returns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosShiftCashDrawer (pos_shift_cash_drawers)
ALTER TABLE "pos_shift_cash_drawers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_shift_cash_drawers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_shift_cash_drawers" ON "pos_shift_cash_drawers";
CREATE POLICY "tenant_isolation_pos_shift_cash_drawers" ON "pos_shift_cash_drawers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosShiftTransaction (pos_shift_transactions)
ALTER TABLE "pos_shift_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_shift_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_shift_transactions" ON "pos_shift_transactions";
CREATE POLICY "tenant_isolation_pos_shift_transactions" ON "pos_shift_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSShift (pos_shifts)
ALTER TABLE "pos_shifts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_shifts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_shifts" ON "pos_shifts";
CREATE POLICY "tenant_isolation_pos_shifts" ON "pos_shifts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosSplitPayment (pos_split_payments)
ALTER TABLE "pos_split_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_split_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_split_payments" ON "pos_split_payments";
CREATE POLICY "tenant_isolation_pos_split_payments" ON "pos_split_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSStoreCredit (pos_store_credits)
ALTER TABLE "pos_store_credits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_store_credits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_store_credits" ON "pos_store_credits";
CREATE POLICY "tenant_isolation_pos_store_credits" ON "pos_store_credits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSTaxProfile (pos_tax_profiles)
ALTER TABLE "pos_tax_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_tax_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_tax_profiles" ON "pos_tax_profiles";
CREATE POLICY "tenant_isolation_pos_tax_profiles" ON "pos_tax_profiles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PosTaxRule (pos_tax_rules)
ALTER TABLE "pos_tax_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_tax_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_tax_rules" ON "pos_tax_rules";
CREATE POLICY "tenant_isolation_pos_tax_rules" ON "pos_tax_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for POSTerminal (pos_terminals)
ALTER TABLE "pos_terminals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pos_terminals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pos_terminals" ON "pos_terminals";
CREATE POLICY "tenant_isolation_pos_terminals" ON "pos_terminals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Position (positions)
ALTER TABLE "positions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "positions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_positions" ON "positions";
CREATE POLICY "tenant_isolation_positions" ON "positions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpapSubmission (ppap_submissions)
ALTER TABLE "ppap_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppap_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppap_submissions" ON "ppap_submissions";
CREATE POLICY "tenant_isolation_ppap_submissions" ON "ppap_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmChangeRequest (ppm_change_requests)
ALTER TABLE "ppm_change_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_change_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_change_requests" ON "ppm_change_requests";
CREATE POLICY "tenant_isolation_ppm_change_requests" ON "ppm_change_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmClientApproval (ppm_client_approvals)
ALTER TABLE "ppm_client_approvals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_client_approvals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_client_approvals" ON "ppm_client_approvals";
CREATE POLICY "tenant_isolation_ppm_client_approvals" ON "ppm_client_approvals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmClientPortal (ppm_client_portals)
ALTER TABLE "ppm_client_portals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_client_portals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_client_portals" ON "ppm_client_portals";
CREATE POLICY "tenant_isolation_ppm_client_portals" ON "ppm_client_portals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmDocumentVersion (ppm_document_versions)
ALTER TABLE "ppm_document_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_document_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_document_versions" ON "ppm_document_versions";
CREATE POLICY "tenant_isolation_ppm_document_versions" ON "ppm_document_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmDocument (ppm_documents)
ALTER TABLE "ppm_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_documents" ON "ppm_documents";
CREATE POLICY "tenant_isolation_ppm_documents" ON "ppm_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmKanbanBoard (ppm_kanban_boards)
ALTER TABLE "ppm_kanban_boards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_kanban_boards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_kanban_boards" ON "ppm_kanban_boards";
CREATE POLICY "tenant_isolation_ppm_kanban_boards" ON "ppm_kanban_boards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmKanbanCard (ppm_kanban_cards)
ALTER TABLE "ppm_kanban_cards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_kanban_cards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_kanban_cards" ON "ppm_kanban_cards";
CREATE POLICY "tenant_isolation_ppm_kanban_cards" ON "ppm_kanban_cards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmKanbanColumn (ppm_kanban_columns)
ALTER TABLE "ppm_kanban_columns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_kanban_columns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_kanban_columns" ON "ppm_kanban_columns";
CREATE POLICY "tenant_isolation_ppm_kanban_columns" ON "ppm_kanban_columns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmPortfolioProject (ppm_portfolio_projects)
ALTER TABLE "ppm_portfolio_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_portfolio_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_portfolio_projects" ON "ppm_portfolio_projects";
CREATE POLICY "tenant_isolation_ppm_portfolio_projects" ON "ppm_portfolio_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmPortfolio (ppm_portfolios)
ALTER TABLE "ppm_portfolios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_portfolios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_portfolios" ON "ppm_portfolios";
CREATE POLICY "tenant_isolation_ppm_portfolios" ON "ppm_portfolios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmProcurementPlan (ppm_procurement_plans)
ALTER TABLE "ppm_procurement_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_procurement_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_procurement_plans" ON "ppm_procurement_plans";
CREATE POLICY "tenant_isolation_ppm_procurement_plans" ON "ppm_procurement_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmProcurementRequisition (ppm_procurement_requisitions)
ALTER TABLE "ppm_procurement_requisitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_procurement_requisitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_procurement_requisitions" ON "ppm_procurement_requisitions";
CREATE POLICY "tenant_isolation_ppm_procurement_requisitions" ON "ppm_procurement_requisitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmQualityInspection (ppm_quality_inspections)
ALTER TABLE "ppm_quality_inspections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_quality_inspections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_quality_inspections" ON "ppm_quality_inspections";
CREATE POLICY "tenant_isolation_ppm_quality_inspections" ON "ppm_quality_inspections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmQualityPlan (ppm_quality_plans)
ALTER TABLE "ppm_quality_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_quality_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_quality_plans" ON "ppm_quality_plans";
CREATE POLICY "tenant_isolation_ppm_quality_plans" ON "ppm_quality_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmRaidLog (ppm_raid_logs)
ALTER TABLE "ppm_raid_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_raid_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_raid_logs" ON "ppm_raid_logs";
CREATE POLICY "tenant_isolation_ppm_raid_logs" ON "ppm_raid_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmRiskRegister (ppm_risk_registers)
ALTER TABLE "ppm_risk_registers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_risk_registers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_risk_registers" ON "ppm_risk_registers";
CREATE POLICY "tenant_isolation_ppm_risk_registers" ON "ppm_risk_registers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmTimesheetEntry (ppm_timesheet_entries)
ALTER TABLE "ppm_timesheet_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_timesheet_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_timesheet_entries" ON "ppm_timesheet_entries";
CREATE POLICY "tenant_isolation_ppm_timesheet_entries" ON "ppm_timesheet_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PpmTimesheet (ppm_timesheets)
ALTER TABLE "ppm_timesheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ppm_timesheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ppm_timesheets" ON "ppm_timesheets";
CREATE POLICY "tenant_isolation_ppm_timesheets" ON "ppm_timesheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PredictiveLeadScoreModel (predictive_lead_score_models)
ALTER TABLE "predictive_lead_score_models" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "predictive_lead_score_models" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_predictive_lead_score_models" ON "predictive_lead_score_models";
CREATE POLICY "tenant_isolation_predictive_lead_score_models" ON "predictive_lead_score_models"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PriceBookEntry (price_book_entries)
ALTER TABLE "price_book_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "price_book_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_price_book_entries" ON "price_book_entries";
CREATE POLICY "tenant_isolation_price_book_entries" ON "price_book_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PriceBook (price_books)
ALTER TABLE "price_books" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "price_books" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_price_books" ON "price_books";
CREATE POLICY "tenant_isolation_price_books" ON "price_books"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PricingRule (pricing_rules)
ALTER TABLE "pricing_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pricing_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pricing_rules" ON "pricing_rules";
CREATE POLICY "tenant_isolation_pricing_rules" ON "pricing_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProcurementContractPriceSchedule (procurement_contract_price_schedules)
ALTER TABLE "procurement_contract_price_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "procurement_contract_price_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_procurement_contract_price_schedules" ON "procurement_contract_price_schedules";
CREATE POLICY "tenant_isolation_procurement_contract_price_schedules" ON "procurement_contract_price_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProcurementContractSlaClause (procurement_contract_sla_clauses)
ALTER TABLE "procurement_contract_sla_clauses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "procurement_contract_sla_clauses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_procurement_contract_sla_clauses" ON "procurement_contract_sla_clauses";
CREATE POLICY "tenant_isolation_procurement_contract_sla_clauses" ON "procurement_contract_sla_clauses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProcurementContractVolumeCommitment (procurement_contract_volume_commitments)
ALTER TABLE "procurement_contract_volume_commitments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "procurement_contract_volume_commitments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_procurement_contract_volume_commitments" ON "procurement_contract_volume_commitments";
CREATE POLICY "tenant_isolation_procurement_contract_volume_commitments" ON "procurement_contract_volume_commitments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProcurementContract (procurement_contracts)
ALTER TABLE "procurement_contracts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "procurement_contracts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_procurement_contracts" ON "procurement_contracts";
CREATE POLICY "tenant_isolation_procurement_contracts" ON "procurement_contracts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProcurementIntelligence (procurement_intelligence)
ALTER TABLE "procurement_intelligence" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "procurement_intelligence" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_procurement_intelligence" ON "procurement_intelligence";
CREATE POLICY "tenant_isolation_procurement_intelligence" ON "procurement_intelligence"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductBundleItem (product_bundle_items)
ALTER TABLE "product_bundle_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_bundle_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_bundle_items" ON "product_bundle_items";
CREATE POLICY "tenant_isolation_product_bundle_items" ON "product_bundle_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductBundle (product_bundles)
ALTER TABLE "product_bundles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_bundles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_bundles" ON "product_bundles";
CREATE POLICY "tenant_isolation_product_bundles" ON "product_bundles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductCategory (product_categories)
ALTER TABLE "product_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_categories" ON "product_categories";
CREATE POLICY "tenant_isolation_product_categories" ON "product_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductConfigRule (product_config_rules)
ALTER TABLE "product_config_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_config_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_config_rules" ON "product_config_rules";
CREATE POLICY "tenant_isolation_product_config_rules" ON "product_config_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductKitItem (product_kit_items)
ALTER TABLE "product_kit_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_kit_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_kit_items" ON "product_kit_items";
CREATE POLICY "tenant_isolation_product_kit_items" ON "product_kit_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductKit (product_kits)
ALTER TABLE "product_kits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_kits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_kits" ON "product_kits";
CREATE POLICY "tenant_isolation_product_kits" ON "product_kits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductListing (product_listings)
ALTER TABLE "product_listings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_listings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_listings" ON "product_listings";
CREATE POLICY "tenant_isolation_product_listings" ON "product_listings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductRecall (product_recalls)
ALTER TABLE "product_recalls" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_recalls" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_recalls" ON "product_recalls";
CREATE POLICY "tenant_isolation_product_recalls" ON "product_recalls"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductVariant (product_variants)
ALTER TABLE "product_variants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_variants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_variants" ON "product_variants";
CREATE POLICY "tenant_isolation_product_variants" ON "product_variants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductVelocitySnapshot (product_velocity_snapshots)
ALTER TABLE "product_velocity_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "product_velocity_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_product_velocity_snapshots" ON "product_velocity_snapshots";
CREATE POLICY "tenant_isolation_product_velocity_snapshots" ON "product_velocity_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductionAnalyticsSnapshot (production_analytics_snapshots)
ALTER TABLE "production_analytics_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "production_analytics_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_production_analytics_snapshots" ON "production_analytics_snapshots";
CREATE POLICY "tenant_isolation_production_analytics_snapshots" ON "production_analytics_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductionBatch (production_batches)
ALTER TABLE "production_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "production_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_production_batches" ON "production_batches";
CREATE POLICY "tenant_isolation_production_batches" ON "production_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductionFormula (production_formulas)
ALTER TABLE "production_formulas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "production_formulas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_production_formulas" ON "production_formulas";
CREATE POLICY "tenant_isolation_production_formulas" ON "production_formulas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProductionShift (production_shifts)
ALTER TABLE "production_shifts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "production_shifts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_production_shifts" ON "production_shifts";
CREATE POLICY "tenant_isolation_production_shifts" ON "production_shifts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Product (products)
ALTER TABLE "products" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "products" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_products" ON "products";
CREATE POLICY "tenant_isolation_products" ON "products"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProgramBenefit (program_benefits)
ALTER TABLE "program_benefits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "program_benefits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_program_benefits" ON "program_benefits";
CREATE POLICY "tenant_isolation_program_benefits" ON "program_benefits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProgramFinancial (program_financials)
ALTER TABLE "program_financials" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "program_financials" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_program_financials" ON "program_financials";
CREATE POLICY "tenant_isolation_program_financials" ON "program_financials"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProgramProject (program_projects)
ALTER TABLE "program_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "program_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_program_projects" ON "program_projects";
CREATE POLICY "tenant_isolation_program_projects" ON "program_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Program (programs)
ALTER TABLE "programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_programs" ON "programs";
CREATE POLICY "tenant_isolation_programs" ON "programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectActivity (project_activities)
ALTER TABLE "project_activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_activities" ON "project_activities";
CREATE POLICY "tenant_isolation_project_activities" ON "project_activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectBenefit (project_benefits)
ALTER TABLE "project_benefits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_benefits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_benefits" ON "project_benefits";
CREATE POLICY "tenant_isolation_project_benefits" ON "project_benefits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectBudget (project_budgets)
ALTER TABLE "project_budgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_budgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_budgets" ON "project_budgets";
CREATE POLICY "tenant_isolation_project_budgets" ON "project_budgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectClaim (project_claims)
ALTER TABLE "project_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_claims" ON "project_claims";
CREATE POLICY "tenant_isolation_project_claims" ON "project_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectCostEntry (project_cost_entries)
ALTER TABLE "project_cost_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_cost_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_cost_entries" ON "project_cost_entries";
CREATE POLICY "tenant_isolation_project_cost_entries" ON "project_cost_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectDiscussion (project_discussions)
ALTER TABLE "project_discussions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_discussions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_discussions" ON "project_discussions";
CREATE POLICY "tenant_isolation_project_discussions" ON "project_discussions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectDocument (project_documents)
ALTER TABLE "project_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_documents" ON "project_documents";
CREATE POLICY "tenant_isolation_project_documents" ON "project_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectFeedEvent (project_feed_events)
ALTER TABLE "project_feed_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_feed_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_feed_events" ON "project_feed_events";
CREATE POLICY "tenant_isolation_project_feed_events" ON "project_feed_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectIssueLog (project_issue_logs)
ALTER TABLE "project_issue_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_issue_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_issue_logs" ON "project_issue_logs";
CREATE POLICY "tenant_isolation_project_issue_logs" ON "project_issue_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectMeeting (project_meetings)
ALTER TABLE "project_meetings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_meetings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_meetings" ON "project_meetings";
CREATE POLICY "tenant_isolation_project_meetings" ON "project_meetings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectPortfolioMember (project_portfolio_members)
ALTER TABLE "project_portfolio_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_portfolio_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_portfolio_members" ON "project_portfolio_members";
CREATE POLICY "tenant_isolation_project_portfolio_members" ON "project_portfolio_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectPortfolio (project_portfolios)
ALTER TABLE "project_portfolios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_portfolios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_portfolios" ON "project_portfolios";
CREATE POLICY "tenant_isolation_project_portfolios" ON "project_portfolios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectResourceAllocation (project_resource_allocations)
ALTER TABLE "project_resource_allocations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_resource_allocations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_resource_allocations" ON "project_resource_allocations";
CREATE POLICY "tenant_isolation_project_resource_allocations" ON "project_resource_allocations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectRiskMitigation (project_risk_mitigations)
ALTER TABLE "project_risk_mitigations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_risk_mitigations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_risk_mitigations" ON "project_risk_mitigations";
CREATE POLICY "tenant_isolation_project_risk_mitigations" ON "project_risk_mitigations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectRisk (project_risks)
ALTER TABLE "project_risks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_risks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_risks" ON "project_risks";
CREATE POLICY "tenant_isolation_project_risks" ON "project_risks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectStakeholder (project_stakeholders)
ALTER TABLE "project_stakeholders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_stakeholders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_stakeholders" ON "project_stakeholders";
CREATE POLICY "tenant_isolation_project_stakeholders" ON "project_stakeholders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectSubcontractor (project_subcontractors)
ALTER TABLE "project_subcontractors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_subcontractors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_subcontractors" ON "project_subcontractors";
CREATE POLICY "tenant_isolation_project_subcontractors" ON "project_subcontractors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectTemplate (project_templates)
ALTER TABLE "project_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_templates" ON "project_templates";
CREATE POLICY "tenant_isolation_project_templates" ON "project_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProjectWikiPage (project_wiki_pages)
ALTER TABLE "project_wiki_pages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "project_wiki_pages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_project_wiki_pages" ON "project_wiki_pages";
CREATE POLICY "tenant_isolation_project_wiki_pages" ON "project_wiki_pages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Project (projects)
ALTER TABLE "projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_projects" ON "projects";
CREATE POLICY "tenant_isolation_projects" ON "projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProposalDocument (proposal_documents)
ALTER TABLE "proposal_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "proposal_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_proposal_documents" ON "proposal_documents";
CREATE POLICY "tenant_isolation_proposal_documents" ON "proposal_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ProviderConsumptionReport (provider_consumption_reports)
ALTER TABLE "provider_consumption_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "provider_consumption_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_provider_consumption_reports" ON "provider_consumption_reports";
CREATE POLICY "tenant_isolation_provider_consumption_reports" ON "provider_consumption_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PulseSurvey (pulse_surveys)
ALTER TABLE "pulse_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pulse_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pulse_surveys" ON "pulse_surveys";
CREATE POLICY "tenant_isolation_pulse_surveys" ON "pulse_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseOrderItem (purchase_order_items)
ALTER TABLE "purchase_order_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_order_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_order_items" ON "purchase_order_items";
CREATE POLICY "tenant_isolation_purchase_order_items" ON "purchase_order_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseOrder (purchase_orders)
ALTER TABLE "purchase_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_orders" ON "purchase_orders";
CREATE POLICY "tenant_isolation_purchase_orders" ON "purchase_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseReceiptItem (purchase_receipt_items)
ALTER TABLE "purchase_receipt_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_receipt_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_receipt_items" ON "purchase_receipt_items";
CREATE POLICY "tenant_isolation_purchase_receipt_items" ON "purchase_receipt_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseReceipt (purchase_receipts)
ALTER TABLE "purchase_receipts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_receipts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_receipts" ON "purchase_receipts";
CREATE POLICY "tenant_isolation_purchase_receipts" ON "purchase_receipts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseRequisitionItem (purchase_requisition_items)
ALTER TABLE "purchase_requisition_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_requisition_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_requisition_items" ON "purchase_requisition_items";
CREATE POLICY "tenant_isolation_purchase_requisition_items" ON "purchase_requisition_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseRequisition (purchase_requisitions)
ALTER TABLE "purchase_requisitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_requisitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_requisitions" ON "purchase_requisitions";
CREATE POLICY "tenant_isolation_purchase_requisitions" ON "purchase_requisitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseReturnItem (purchase_return_items)
ALTER TABLE "purchase_return_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_return_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_return_items" ON "purchase_return_items";
CREATE POLICY "tenant_isolation_purchase_return_items" ON "purchase_return_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PurchaseReturn (purchase_returns)
ALTER TABLE "purchase_returns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "purchase_returns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_purchase_returns" ON "purchase_returns";
CREATE POLICY "tenant_isolation_purchase_returns" ON "purchase_returns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PushDeviceToken (push_device_tokens)
ALTER TABLE "push_device_tokens" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "push_device_tokens" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_push_device_tokens" ON "push_device_tokens";
CREATE POLICY "tenant_isolation_push_device_tokens" ON "push_device_tokens"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PushSubscription (push_subscriptions)
ALTER TABLE "push_subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "push_subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_push_subscriptions" ON "push_subscriptions";
CREATE POLICY "tenant_isolation_push_subscriptions" ON "push_subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PutawayTask (putaway_tasks)
ALTER TABLE "putaway_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "putaway_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_putaway_tasks" ON "putaway_tasks";
CREATE POLICY "tenant_isolation_putaway_tasks" ON "putaway_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaInstallPrompt (pwa_install_prompts)
ALTER TABLE "pwa_install_prompts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_install_prompts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_install_prompts" ON "pwa_install_prompts";
CREATE POLICY "tenant_isolation_pwa_install_prompts" ON "pwa_install_prompts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaManifestConfig (pwa_manifest_configs)
ALTER TABLE "pwa_manifest_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_manifest_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_manifest_configs" ON "pwa_manifest_configs";
CREATE POLICY "tenant_isolation_pwa_manifest_configs" ON "pwa_manifest_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaManifest (pwa_manifests)
ALTER TABLE "pwa_manifests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_manifests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_manifests" ON "pwa_manifests";
CREATE POLICY "tenant_isolation_pwa_manifests" ON "pwa_manifests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaOfflineCacheRule (pwa_offline_cache_rules)
ALTER TABLE "pwa_offline_cache_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_offline_cache_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_offline_cache_rules" ON "pwa_offline_cache_rules";
CREATE POLICY "tenant_isolation_pwa_offline_cache_rules" ON "pwa_offline_cache_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaOfflineSyncQueue (pwa_offline_sync_queues)
ALTER TABLE "pwa_offline_sync_queues" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_offline_sync_queues" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_offline_sync_queues" ON "pwa_offline_sync_queues";
CREATE POLICY "tenant_isolation_pwa_offline_sync_queues" ON "pwa_offline_sync_queues"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaPushSubscription (pwa_push_subscriptions)
ALTER TABLE "pwa_push_subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_push_subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_push_subscriptions" ON "pwa_push_subscriptions";
CREATE POLICY "tenant_isolation_pwa_push_subscriptions" ON "pwa_push_subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaServiceWorker (pwa_service_workers)
ALTER TABLE "pwa_service_workers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_service_workers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_service_workers" ON "pwa_service_workers";
CREATE POLICY "tenant_isolation_pwa_service_workers" ON "pwa_service_workers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for PwaSyncQueue (pwa_sync_queues)
ALTER TABLE "pwa_sync_queues" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "pwa_sync_queues" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_pwa_sync_queues" ON "pwa_sync_queues";
CREATE POLICY "tenant_isolation_pwa_sync_queues" ON "pwa_sync_queues"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QAInspectionCheckpoint (qa_inspection_checkpoints)
ALTER TABLE "qa_inspection_checkpoints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "qa_inspection_checkpoints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_qa_inspection_checkpoints" ON "qa_inspection_checkpoints";
CREATE POLICY "tenant_isolation_qa_inspection_checkpoints" ON "qa_inspection_checkpoints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QAInspectionTemplate (qa_inspection_templates)
ALTER TABLE "qa_inspection_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "qa_inspection_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_qa_inspection_templates" ON "qa_inspection_templates";
CREATE POLICY "tenant_isolation_qa_inspection_templates" ON "qa_inspection_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QualityInspectionPlan (quality_inspection_plans)
ALTER TABLE "quality_inspection_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quality_inspection_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quality_inspection_plans" ON "quality_inspection_plans";
CREATE POLICY "tenant_isolation_quality_inspection_plans" ON "quality_inspection_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QualityInspection (quality_inspections)
ALTER TABLE "quality_inspections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quality_inspections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quality_inspections" ON "quality_inspections";
CREATE POLICY "tenant_isolation_quality_inspections" ON "quality_inspections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QualityStandard (quality_standards)
ALTER TABLE "quality_standards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quality_standards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quality_standards" ON "quality_standards";
CREATE POLICY "tenant_isolation_quality_standards" ON "quality_standards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuarantineOrder (quarantine_orders)
ALTER TABLE "quarantine_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quarantine_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quarantine_orders" ON "quarantine_orders";
CREATE POLICY "tenant_isolation_quarantine_orders" ON "quarantine_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Quota (quotas)
ALTER TABLE "quotas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotas" ON "quotas";
CREATE POLICY "tenant_isolation_quotas" ON "quotas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationItem (quotation_items)
ALTER TABLE "quotation_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_items" ON "quotation_items";
CREATE POLICY "tenant_isolation_quotation_items" ON "quotation_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationSection (quotation_sections)
ALTER TABLE "quotation_sections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_sections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_sections" ON "quotation_sections";
CREATE POLICY "tenant_isolation_quotation_sections" ON "quotation_sections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationSignatureCertificate (quotation_signature_certificates)
ALTER TABLE "quotation_signature_certificates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_signature_certificates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_signature_certificates" ON "quotation_signature_certificates";
CREATE POLICY "tenant_isolation_quotation_signature_certificates" ON "quotation_signature_certificates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationSignature (quotation_signatures)
ALTER TABLE "quotation_signatures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_signatures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_signatures" ON "quotation_signatures";
CREATE POLICY "tenant_isolation_quotation_signatures" ON "quotation_signatures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationTemplate (quotation_templates)
ALTER TABLE "quotation_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_templates" ON "quotation_templates";
CREATE POLICY "tenant_isolation_quotation_templates" ON "quotation_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuotationVersion (quotation_versions)
ALTER TABLE "quotation_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotation_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotation_versions" ON "quotation_versions";
CREATE POLICY "tenant_isolation_quotation_versions" ON "quotation_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Quotation (quotations)
ALTER TABLE "quotations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quotations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quotations" ON "quotations";
CREATE POLICY "tenant_isolation_quotations" ON "quotations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuoteComparison (quote_comparisons)
ALTER TABLE "quote_comparisons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quote_comparisons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quote_comparisons" ON "quote_comparisons";
CREATE POLICY "tenant_isolation_quote_comparisons" ON "quote_comparisons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuoteMargin (quote_margins)
ALTER TABLE "quote_margins" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quote_margins" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quote_margins" ON "quote_margins";
CREATE POLICY "tenant_isolation_quote_margins" ON "quote_margins"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuoteMarkupApproval (quote_markup_approvals)
ALTER TABLE "quote_markup_approvals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quote_markup_approvals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quote_markup_approvals" ON "quote_markup_approvals";
CREATE POLICY "tenant_isolation_quote_markup_approvals" ON "quote_markup_approvals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for QuoteVersion (quote_versions)
ALTER TABLE "quote_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "quote_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_quote_versions" ON "quote_versions";
CREATE POLICY "tenant_isolation_quote_versions" ON "quote_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyBuilding (real_estate_buildings)
ALTER TABLE "real_estate_buildings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_buildings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_buildings" ON "real_estate_buildings";
CREATE POLICY "tenant_isolation_real_estate_buildings" ON "real_estate_buildings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateCommissionPayout (real_estate_commission_payouts)
ALTER TABLE "real_estate_commission_payouts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_commission_payouts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_commission_payouts" ON "real_estate_commission_payouts";
CREATE POLICY "tenant_isolation_real_estate_commission_payouts" ON "real_estate_commission_payouts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateCommissionPlan (real_estate_commission_plans)
ALTER TABLE "real_estate_commission_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_commission_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_commission_plans" ON "real_estate_commission_plans";
CREATE POLICY "tenant_isolation_real_estate_commission_plans" ON "real_estate_commission_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateExpenseCategory (real_estate_expense_categories)
ALTER TABLE "real_estate_expense_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_expense_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_expense_categories" ON "real_estate_expense_categories";
CREATE POLICY "tenant_isolation_real_estate_expense_categories" ON "real_estate_expense_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateLeasePayment (real_estate_lease_payments)
ALTER TABLE "real_estate_lease_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_lease_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_lease_payments" ON "real_estate_lease_payments";
CREATE POLICY "tenant_isolation_real_estate_lease_payments" ON "real_estate_lease_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateLeaseRenewal (real_estate_lease_renewals)
ALTER TABLE "real_estate_lease_renewals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_lease_renewals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_lease_renewals" ON "real_estate_lease_renewals";
CREATE POLICY "tenant_isolation_real_estate_lease_renewals" ON "real_estate_lease_renewals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateLease (real_estate_leases)
ALTER TABLE "real_estate_leases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_leases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_leases" ON "real_estate_leases";
CREATE POLICY "tenant_isolation_real_estate_leases" ON "real_estate_leases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateListingSyndicate (real_estate_listing_syndicates)
ALTER TABLE "real_estate_listing_syndicates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_listing_syndicates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_listing_syndicates" ON "real_estate_listing_syndicates";
CREATE POLICY "tenant_isolation_real_estate_listing_syndicates" ON "real_estate_listing_syndicates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateMaintenanceRequest (real_estate_maintenance_requests)
ALTER TABLE "real_estate_maintenance_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_maintenance_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_maintenance_requests" ON "real_estate_maintenance_requests";
CREATE POLICY "tenant_isolation_real_estate_maintenance_requests" ON "real_estate_maintenance_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateMaintenanceVendor (real_estate_maintenance_vendors)
ALTER TABLE "real_estate_maintenance_vendors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_maintenance_vendors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_maintenance_vendors" ON "real_estate_maintenance_vendors";
CREATE POLICY "tenant_isolation_real_estate_maintenance_vendors" ON "real_estate_maintenance_vendors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateMaintenanceWorkOrder (real_estate_maintenance_work_orders)
ALTER TABLE "real_estate_maintenance_work_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_maintenance_work_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_maintenance_work_orders" ON "real_estate_maintenance_work_orders";
CREATE POLICY "tenant_isolation_real_estate_maintenance_work_orders" ON "real_estate_maintenance_work_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyPortfolio (real_estate_portfolios)
ALTER TABLE "real_estate_portfolios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_portfolios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_portfolios" ON "real_estate_portfolios";
CREATE POLICY "tenant_isolation_real_estate_portfolios" ON "real_estate_portfolios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateProperty (real_estate_properties)
ALTER TABLE "real_estate_properties" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_properties" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_properties" ON "real_estate_properties";
CREATE POLICY "tenant_isolation_real_estate_properties" ON "real_estate_properties"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyFinancial (real_estate_property_financials)
ALTER TABLE "real_estate_property_financials" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_property_financials" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_property_financials" ON "real_estate_property_financials";
CREATE POLICY "tenant_isolation_real_estate_property_financials" ON "real_estate_property_financials"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyInspection (real_estate_property_inspections)
ALTER TABLE "real_estate_property_inspections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_property_inspections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_property_inspections" ON "real_estate_property_inspections";
CREATE POLICY "tenant_isolation_real_estate_property_inspections" ON "real_estate_property_inspections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateRentCollectionLog (real_estate_rent_collection_logs)
ALTER TABLE "real_estate_rent_collection_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_rent_collection_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_rent_collection_logs" ON "real_estate_rent_collection_logs";
CREATE POLICY "tenant_isolation_real_estate_rent_collection_logs" ON "real_estate_rent_collection_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateRentEscalation (real_estate_rent_escalations)
ALTER TABLE "real_estate_rent_escalations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_rent_escalations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_rent_escalations" ON "real_estate_rent_escalations";
CREATE POLICY "tenant_isolation_real_estate_rent_escalations" ON "real_estate_rent_escalations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstateTenant (real_estate_tenants)
ALTER TABLE "real_estate_tenants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_tenants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_tenants" ON "real_estate_tenants";
CREATE POLICY "tenant_isolation_real_estate_tenants" ON "real_estate_tenants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyUnit (real_estate_units)
ALTER TABLE "real_estate_units" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_units" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_units" ON "real_estate_units";
CREATE POLICY "tenant_isolation_real_estate_units" ON "real_estate_units"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RealEstatePropertyValuation (real_estate_valuations)
ALTER TABLE "real_estate_valuations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "real_estate_valuations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_real_estate_valuations" ON "real_estate_valuations";
CREATE POLICY "tenant_isolation_real_estate_valuations" ON "real_estate_valuations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RebateAccrual (rebate_accruals)
ALTER TABLE "rebate_accruals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rebate_accruals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rebate_accruals" ON "rebate_accruals";
CREATE POLICY "tenant_isolation_rebate_accruals" ON "rebate_accruals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RebateAgreement (rebate_agreements)
ALTER TABLE "rebate_agreements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rebate_agreements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rebate_agreements" ON "rebate_agreements";
CREATE POLICY "tenant_isolation_rebate_agreements" ON "rebate_agreements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RebateClaim (rebate_claims)
ALTER TABLE "rebate_claims" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rebate_claims" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rebate_claims" ON "rebate_claims";
CREATE POLICY "tenant_isolation_rebate_claims" ON "rebate_claims"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecallAffectedStock (recall_affected_stocks)
ALTER TABLE "recall_affected_stocks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recall_affected_stocks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recall_affected_stocks" ON "recall_affected_stocks";
CREATE POLICY "tenant_isolation_recall_affected_stocks" ON "recall_affected_stocks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecallCustomerNotice (recall_customer_notices)
ALTER TABLE "recall_customer_notices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recall_customer_notices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recall_customer_notices" ON "recall_customer_notices";
CREATE POLICY "tenant_isolation_recall_customer_notices" ON "recall_customer_notices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecallDisposalRecord (recall_disposal_records)
ALTER TABLE "recall_disposal_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recall_disposal_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recall_disposal_records" ON "recall_disposal_records";
CREATE POLICY "tenant_isolation_recall_disposal_records" ON "recall_disposal_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecordLegalHold (record_legal_holds)
ALTER TABLE "record_legal_holds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "record_legal_holds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_record_legal_holds" ON "record_legal_holds";
CREATE POLICY "tenant_isolation_record_legal_holds" ON "record_legal_holds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecruitmentAgency (recruitment_agencies)
ALTER TABLE "recruitment_agencies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recruitment_agencies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recruitment_agencies" ON "recruitment_agencies";
CREATE POLICY "tenant_isolation_recruitment_agencies" ON "recruitment_agencies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecurringInvoiceTemplate (recurring_invoice_templates)
ALTER TABLE "recurring_invoice_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recurring_invoice_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recurring_invoice_templates" ON "recurring_invoice_templates";
CREATE POLICY "tenant_isolation_recurring_invoice_templates" ON "recurring_invoice_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecurringJournal (recurring_journals)
ALTER TABLE "recurring_journals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recurring_journals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recurring_journals" ON "recurring_journals";
CREATE POLICY "tenant_isolation_recurring_journals" ON "recurring_journals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecurringOrderTemplateItem (recurring_order_template_items)
ALTER TABLE "recurring_order_template_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recurring_order_template_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recurring_order_template_items" ON "recurring_order_template_items";
CREATE POLICY "tenant_isolation_recurring_order_template_items" ON "recurring_order_template_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecurringOrderTemplate (recurring_order_templates)
ALTER TABLE "recurring_order_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recurring_order_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recurring_order_templates" ON "recurring_order_templates";
CREATE POLICY "tenant_isolation_recurring_order_templates" ON "recurring_order_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RecycleBinItem (recycle_bin)
ALTER TABLE "recycle_bin" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "recycle_bin" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_recycle_bin" ON "recycle_bin";
CREATE POLICY "tenant_isolation_recycle_bin" ON "recycle_bin"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RegionValidationRule (region_validation_rules)
ALTER TABLE "region_validation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "region_validation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_region_validation_rules" ON "region_validation_rules";
CREATE POLICY "tenant_isolation_region_validation_rules" ON "region_validation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReleaseArtifact (release_artifacts)
ALTER TABLE "release_artifacts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "release_artifacts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_release_artifacts" ON "release_artifacts";
CREATE POLICY "tenant_isolation_release_artifacts" ON "release_artifacts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Release (releases)
ALTER TABLE "releases" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "releases" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_releases" ON "releases";
CREATE POLICY "tenant_isolation_releases" ON "releases"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Reminder (reminders)
ALTER TABLE "reminders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reminders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reminders" ON "reminders";
CREATE POLICY "tenant_isolation_reminders" ON "reminders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RenewalRiskPrediction (renewal_risk_predictions)
ALTER TABLE "renewal_risk_predictions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "renewal_risk_predictions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_renewal_risk_predictions" ON "renewal_risk_predictions";
CREATE POLICY "tenant_isolation_renewal_risk_predictions" ON "renewal_risk_predictions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReorderPoint (reorder_points)
ALTER TABLE "reorder_points" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reorder_points" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reorder_points" ON "reorder_points";
CREATE POLICY "tenant_isolation_reorder_points" ON "reorder_points"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReorderRule (reorder_rules)
ALTER TABLE "reorder_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reorder_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reorder_rules" ON "reorder_rules";
CREATE POLICY "tenant_isolation_reorder_rules" ON "reorder_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReorderSuggestion (reorder_suggestions)
ALTER TABLE "reorder_suggestions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reorder_suggestions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reorder_suggestions" ON "reorder_suggestions";
CREATE POLICY "tenant_isolation_reorder_suggestions" ON "reorder_suggestions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReplenRunLog (replen_run_logs)
ALTER TABLE "replen_run_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "replen_run_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_replen_run_logs" ON "replen_run_logs";
CREATE POLICY "tenant_isolation_replen_run_logs" ON "replen_run_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReplenSuggestion (replen_suggestions)
ALTER TABLE "replen_suggestions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "replen_suggestions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_replen_suggestions" ON "replen_suggestions";
CREATE POLICY "tenant_isolation_replen_suggestions" ON "replen_suggestions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReplenishmentOrder (replenishment_orders)
ALTER TABLE "replenishment_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "replenishment_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_replenishment_orders" ON "replenishment_orders";
CREATE POLICY "tenant_isolation_replenishment_orders" ON "replenishment_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportAlertRule (report_alert_rules)
ALTER TABLE "report_alert_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_alert_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_alert_rules" ON "report_alert_rules";
CREATE POLICY "tenant_isolation_report_alert_rules" ON "report_alert_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportAuditLog (report_audit_logs)
ALTER TABLE "report_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_audit_logs" ON "report_audit_logs";
CREATE POLICY "tenant_isolation_report_audit_logs" ON "report_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportBookmark (report_bookmarks)
ALTER TABLE "report_bookmarks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_bookmarks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_bookmarks" ON "report_bookmarks";
CREATE POLICY "tenant_isolation_report_bookmarks" ON "report_bookmarks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportCacheConfig (report_cache_configs)
ALTER TABLE "report_cache_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_cache_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_cache_configs" ON "report_cache_configs";
CREATE POLICY "tenant_isolation_report_cache_configs" ON "report_cache_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportCategory (report_categories)
ALTER TABLE "report_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_categories" ON "report_categories";
CREATE POLICY "tenant_isolation_report_categories" ON "report_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportColumnPreference (report_column_preferences)
ALTER TABLE "report_column_preferences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_column_preferences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_column_preferences" ON "report_column_preferences";
CREATE POLICY "tenant_isolation_report_column_preferences" ON "report_column_preferences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportDataSource (report_data_sources)
ALTER TABLE "report_data_sources" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_data_sources" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_data_sources" ON "report_data_sources";
CREATE POLICY "tenant_isolation_report_data_sources" ON "report_data_sources"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportDefinition (report_definitions)
ALTER TABLE "report_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_definitions" ON "report_definitions";
CREATE POLICY "tenant_isolation_report_definitions" ON "report_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportDrillPathConfig (report_drill_path_configs)
ALTER TABLE "report_drill_path_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_drill_path_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_drill_path_configs" ON "report_drill_path_configs";
CREATE POLICY "tenant_isolation_report_drill_path_configs" ON "report_drill_path_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportExecutionLog (report_execution_logs)
ALTER TABLE "report_execution_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_execution_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_execution_logs" ON "report_execution_logs";
CREATE POLICY "tenant_isolation_report_execution_logs" ON "report_execution_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportFilterPreset (report_filter_presets)
ALTER TABLE "report_filter_presets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_filter_presets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_filter_presets" ON "report_filter_presets";
CREATE POLICY "tenant_isolation_report_filter_presets" ON "report_filter_presets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportRun (report_runs)
ALTER TABLE "report_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_runs" ON "report_runs";
CREATE POLICY "tenant_isolation_report_runs" ON "report_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportScheduleInstance (report_schedule_instances)
ALTER TABLE "report_schedule_instances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_schedule_instances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_schedule_instances" ON "report_schedule_instances";
CREATE POLICY "tenant_isolation_report_schedule_instances" ON "report_schedule_instances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportShare (report_shares)
ALTER TABLE "report_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_shares" ON "report_shares";
CREATE POLICY "tenant_isolation_report_shares" ON "report_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportVersion (report_versions)
ALTER TABLE "report_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_versions" ON "report_versions";
CREATE POLICY "tenant_isolation_report_versions" ON "report_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportView (report_views)
ALTER TABLE "report_views" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_views" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_views" ON "report_views";
CREATE POLICY "tenant_isolation_report_views" ON "report_views"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportWidget (report_widgets)
ALTER TABLE "report_widgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "report_widgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_report_widgets" ON "report_widgets";
CREATE POLICY "tenant_isolation_report_widgets" ON "report_widgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingComplianceAudit (reporting_compliance_audits)
ALTER TABLE "reporting_compliance_audits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_compliance_audits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_compliance_audits" ON "reporting_compliance_audits";
CREATE POLICY "tenant_isolation_reporting_compliance_audits" ON "reporting_compliance_audits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingDistributionList (reporting_distribution_lists)
ALTER TABLE "reporting_distribution_lists" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_distribution_lists" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_distribution_lists" ON "reporting_distribution_lists";
CREATE POLICY "tenant_isolation_reporting_distribution_lists" ON "reporting_distribution_lists"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingExecutionLog (reporting_execution_logs)
ALTER TABLE "reporting_execution_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_execution_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_execution_logs" ON "reporting_execution_logs";
CREATE POLICY "tenant_isolation_reporting_execution_logs" ON "reporting_execution_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingExportJob (reporting_export_jobs)
ALTER TABLE "reporting_export_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_export_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_export_jobs" ON "reporting_export_jobs";
CREATE POLICY "tenant_isolation_reporting_export_jobs" ON "reporting_export_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingScheduledJobDeep (reporting_scheduled_jobs_deep)
ALTER TABLE "reporting_scheduled_jobs_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_scheduled_jobs_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_scheduled_jobs_deep" ON "reporting_scheduled_jobs_deep";
CREATE POLICY "tenant_isolation_reporting_scheduled_jobs_deep" ON "reporting_scheduled_jobs_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReportingTemplateDeep (reporting_templates_deep)
ALTER TABLE "reporting_templates_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reporting_templates_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reporting_templates_deep" ON "reporting_templates_deep";
CREATE POLICY "tenant_isolation_reporting_templates_deep" ON "reporting_templates_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Report (reports)
ALTER TABLE "reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reports" ON "reports";
CREATE POLICY "tenant_isolation_reports" ON "reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ResourceAttribution (resource_attributions)
ALTER TABLE "resource_attributions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "resource_attributions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_resource_attributions" ON "resource_attributions";
CREATE POLICY "tenant_isolation_resource_attributions" ON "resource_attributions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReturnCredit (return_credits)
ALTER TABLE "return_credits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "return_credits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_return_credits" ON "return_credits";
CREATE POLICY "tenant_isolation_return_credits" ON "return_credits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReturnMerchandiseAuthorization (return_merchandise_authorizations)
ALTER TABLE "return_merchandise_authorizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "return_merchandise_authorizations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_return_merchandise_authorizations" ON "return_merchandise_authorizations";
CREATE POLICY "tenant_isolation_return_merchandise_authorizations" ON "return_merchandise_authorizations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReturnReasonCode (return_reason_codes)
ALTER TABLE "return_reason_codes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "return_reason_codes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_return_reason_codes" ON "return_reason_codes";
CREATE POLICY "tenant_isolation_return_reason_codes" ON "return_reason_codes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReturnRestock (return_restocks)
ALTER TABLE "return_restocks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "return_restocks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_return_restocks" ON "return_restocks";
CREATE POLICY "tenant_isolation_return_restocks" ON "return_restocks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RevenueSchedule (revenue_schedules)
ALTER TABLE "revenue_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "revenue_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_revenue_schedules" ON "revenue_schedules";
CREATE POLICY "tenant_isolation_revenue_schedules" ON "revenue_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReverseLogisticsItem (reverse_logistics_items)
ALTER TABLE "reverse_logistics_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reverse_logistics_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reverse_logistics_items" ON "reverse_logistics_items";
CREATE POLICY "tenant_isolation_reverse_logistics_items" ON "reverse_logistics_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ReverseLogisticsOrder (reverse_logistics_orders)
ALTER TABLE "reverse_logistics_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "reverse_logistics_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_reverse_logistics_orders" ON "reverse_logistics_orders";
CREATE POLICY "tenant_isolation_reverse_logistics_orders" ON "reverse_logistics_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RfidReadEvent (rfid_read_events)
ALTER TABLE "rfid_read_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rfid_read_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rfid_read_events" ON "rfid_read_events";
CREATE POLICY "tenant_isolation_rfid_read_events" ON "rfid_read_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RfidTag (rfid_tags)
ALTER TABLE "rfid_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rfid_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rfid_tags" ON "rfid_tags";
CREATE POLICY "tenant_isolation_rfid_tags" ON "rfid_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RFQAuctionBid (rfq_auction_bids)
ALTER TABLE "rfq_auction_bids" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rfq_auction_bids" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rfq_auction_bids" ON "rfq_auction_bids";
CREATE POLICY "tenant_isolation_rfq_auction_bids" ON "rfq_auction_bids"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RFQItem (rfq_items)
ALTER TABLE "rfq_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rfq_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rfq_items" ON "rfq_items";
CREATE POLICY "tenant_isolation_rfq_items" ON "rfq_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RFQ (rfqs)
ALTER TABLE "rfqs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rfqs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rfqs" ON "rfqs";
CREATE POLICY "tenant_isolation_rfqs" ON "rfqs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RiskControlMeasure (risk_control_measures)
ALTER TABLE "risk_control_measures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "risk_control_measures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_risk_control_measures" ON "risk_control_measures";
CREATE POLICY "tenant_isolation_risk_control_measures" ON "risk_control_measures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RMAInspection (rma_inspections)
ALTER TABLE "rma_inspections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rma_inspections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rma_inspections" ON "rma_inspections";
CREATE POLICY "tenant_isolation_rma_inspections" ON "rma_inspections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RMALine (rma_lines)
ALTER TABLE "rma_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rma_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rma_lines" ON "rma_lines";
CREATE POLICY "tenant_isolation_rma_lines" ON "rma_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Role (roles)
ALTER TABLE "roles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "roles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_roles" ON "roles";
CREATE POLICY "tenant_isolation_roles" ON "roles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RollingForecast (rolling_forecasts)
ALTER TABLE "rolling_forecasts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rolling_forecasts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rolling_forecasts" ON "rolling_forecasts";
CREATE POLICY "tenant_isolation_rolling_forecasts" ON "rolling_forecasts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RoutingRule (routing_rules)
ALTER TABLE "routing_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "routing_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_routing_rules" ON "routing_rules";
CREATE POLICY "tenant_isolation_routing_rules" ON "routing_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RuleDefinition (rule_definitions)
ALTER TABLE "rule_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rule_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rule_definitions" ON "rule_definitions";
CREATE POLICY "tenant_isolation_rule_definitions" ON "rule_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RuleEvaluationLog (rule_evaluation_logs)
ALTER TABLE "rule_evaluation_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rule_evaluation_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rule_evaluation_logs" ON "rule_evaluation_logs";
CREATE POLICY "tenant_isolation_rule_evaluation_logs" ON "rule_evaluation_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RuleSet (rule_sets)
ALTER TABLE "rule_sets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "rule_sets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_rule_sets" ON "rule_sets";
CREATE POLICY "tenant_isolation_rule_sets" ON "rule_sets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for RunLog (run_logs)
ALTER TABLE "run_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "run_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_run_logs" ON "run_logs";
CREATE POLICY "tenant_isolation_run_logs" ON "run_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasAnnouncement (saas_announcements)
ALTER TABLE "saas_announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_announcements" ON "saas_announcements";
CREATE POLICY "tenant_isolation_saas_announcements" ON "saas_announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasApiKeyScope (saas_api_key_scopes)
ALTER TABLE "saas_api_key_scopes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_api_key_scopes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_api_key_scopes" ON "saas_api_key_scopes";
CREATE POLICY "tenant_isolation_saas_api_key_scopes" ON "saas_api_key_scopes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasApiKey (saas_api_keys)
ALTER TABLE "saas_api_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_api_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_api_keys" ON "saas_api_keys";
CREATE POLICY "tenant_isolation_saas_api_keys" ON "saas_api_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasAppInstallation (saas_app_installations)
ALTER TABLE "saas_app_installations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_app_installations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_app_installations" ON "saas_app_installations";
CREATE POLICY "tenant_isolation_saas_app_installations" ON "saas_app_installations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasAppPermission (saas_app_permissions)
ALTER TABLE "saas_app_permissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_app_permissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_app_permissions" ON "saas_app_permissions";
CREATE POLICY "tenant_isolation_saas_app_permissions" ON "saas_app_permissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasAppVersion (saas_app_versions)
ALTER TABLE "saas_app_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_app_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_app_versions" ON "saas_app_versions";
CREATE POLICY "tenant_isolation_saas_app_versions" ON "saas_app_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasApp (saas_apps)
ALTER TABLE "saas_apps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_apps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_apps" ON "saas_apps";
CREATE POLICY "tenant_isolation_saas_apps" ON "saas_apps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasAuditLog (saas_audit_logs)
ALTER TABLE "saas_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_audit_logs" ON "saas_audit_logs";
CREATE POLICY "tenant_isolation_saas_audit_logs" ON "saas_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasCoupon2Redemption (saas_coupon_redemptions)
ALTER TABLE "saas_coupon_redemptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_coupon_redemptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_coupon_redemptions" ON "saas_coupon_redemptions";
CREATE POLICY "tenant_isolation_saas_coupon_redemptions" ON "saas_coupon_redemptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasCoupon2 (saas_coupons_v2)
ALTER TABLE "saas_coupons_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_coupons_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_coupons_v2" ON "saas_coupons_v2";
CREATE POLICY "tenant_isolation_saas_coupons_v2" ON "saas_coupons_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasFeatureFlag (saas_feature_flags)
ALTER TABLE "saas_feature_flags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_feature_flags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_feature_flags" ON "saas_feature_flags";
CREATE POLICY "tenant_isolation_saas_feature_flags" ON "saas_feature_flags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasInvoice2LineItem (saas_invoice_line_items_v2)
ALTER TABLE "saas_invoice_line_items_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_invoice_line_items_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_invoice_line_items_v2" ON "saas_invoice_line_items_v2";
CREATE POLICY "tenant_isolation_saas_invoice_line_items_v2" ON "saas_invoice_line_items_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaaSInvoice (saas_invoices)
ALTER TABLE "saas_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_invoices" ON "saas_invoices";
CREATE POLICY "tenant_isolation_saas_invoices" ON "saas_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasInvoice2 (saas_invoices_v2)
ALTER TABLE "saas_invoices_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_invoices_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_invoices_v2" ON "saas_invoices_v2";
CREATE POLICY "tenant_isolation_saas_invoices_v2" ON "saas_invoices_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasMaintenanceWindow (saas_maintenance_windows)
ALTER TABLE "saas_maintenance_windows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_maintenance_windows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_maintenance_windows" ON "saas_maintenance_windows";
CREATE POLICY "tenant_isolation_saas_maintenance_windows" ON "saas_maintenance_windows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasMeteringRule (saas_metering_rules)
ALTER TABLE "saas_metering_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_metering_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_metering_rules" ON "saas_metering_rules";
CREATE POLICY "tenant_isolation_saas_metering_rules" ON "saas_metering_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPaymentMethod2 (saas_payment_methods_v2)
ALTER TABLE "saas_payment_methods_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_payment_methods_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_payment_methods_v2" ON "saas_payment_methods_v2";
CREATE POLICY "tenant_isolation_saas_payment_methods_v2" ON "saas_payment_methods_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPayment2 (saas_payments_v2)
ALTER TABLE "saas_payments_v2" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_payments_v2" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_payments_v2" ON "saas_payments_v2";
CREATE POLICY "tenant_isolation_saas_payments_v2" ON "saas_payments_v2"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalAccountProfile (saas_portal_account_profiles)
ALTER TABLE "saas_portal_account_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_account_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_account_profiles" ON "saas_portal_account_profiles";
CREATE POLICY "tenant_isolation_saas_portal_account_profiles" ON "saas_portal_account_profiles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalFeatureRequest (saas_portal_feature_requests)
ALTER TABLE "saas_portal_feature_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_feature_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_feature_requests" ON "saas_portal_feature_requests";
CREATE POLICY "tenant_isolation_saas_portal_feature_requests" ON "saas_portal_feature_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalFeatureVote (saas_portal_feature_votes)
ALTER TABLE "saas_portal_feature_votes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_feature_votes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_feature_votes" ON "saas_portal_feature_votes";
CREATE POLICY "tenant_isolation_saas_portal_feature_votes" ON "saas_portal_feature_votes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalInvoiceDownloadLog (saas_portal_invoice_download_logs)
ALTER TABLE "saas_portal_invoice_download_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_invoice_download_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_invoice_download_logs" ON "saas_portal_invoice_download_logs";
CREATE POLICY "tenant_isolation_saas_portal_invoice_download_logs" ON "saas_portal_invoice_download_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalPaymentMethod (saas_portal_payment_methods)
ALTER TABLE "saas_portal_payment_methods" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_payment_methods" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_payment_methods" ON "saas_portal_payment_methods";
CREATE POLICY "tenant_isolation_saas_portal_payment_methods" ON "saas_portal_payment_methods"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalPlanDowngradeReason (saas_portal_plan_downgrade_reasons)
ALTER TABLE "saas_portal_plan_downgrade_reasons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_plan_downgrade_reasons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_plan_downgrade_reasons" ON "saas_portal_plan_downgrade_reasons";
CREATE POLICY "tenant_isolation_saas_portal_plan_downgrade_reasons" ON "saas_portal_plan_downgrade_reasons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalSubscriptionUpgrade (saas_portal_subscription_upgrades)
ALTER TABLE "saas_portal_subscription_upgrades" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_subscription_upgrades" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_subscription_upgrades" ON "saas_portal_subscription_upgrades";
CREATE POLICY "tenant_isolation_saas_portal_subscription_upgrades" ON "saas_portal_subscription_upgrades"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalSupportTicketDeep (saas_portal_support_tickets_deep)
ALTER TABLE "saas_portal_support_tickets_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_support_tickets_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_support_tickets_deep" ON "saas_portal_support_tickets_deep";
CREATE POLICY "tenant_isolation_saas_portal_support_tickets_deep" ON "saas_portal_support_tickets_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalTicketMessage (saas_portal_ticket_messages)
ALTER TABLE "saas_portal_ticket_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_ticket_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_ticket_messages" ON "saas_portal_ticket_messages";
CREATE POLICY "tenant_isolation_saas_portal_ticket_messages" ON "saas_portal_ticket_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasPortalUsageDashboard (saas_portal_usage_dashboards)
ALTER TABLE "saas_portal_usage_dashboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_portal_usage_dashboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_portal_usage_dashboards" ON "saas_portal_usage_dashboards";
CREATE POLICY "tenant_isolation_saas_portal_usage_dashboards" ON "saas_portal_usage_dashboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasResellerCommission (saas_reseller_commissions)
ALTER TABLE "saas_reseller_commissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_reseller_commissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_reseller_commissions" ON "saas_reseller_commissions";
CREATE POLICY "tenant_isolation_saas_reseller_commissions" ON "saas_reseller_commissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSslCertificate (saas_ssl_certificates)
ALTER TABLE "saas_ssl_certificates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_ssl_certificates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_ssl_certificates" ON "saas_ssl_certificates";
CREATE POLICY "tenant_isolation_saas_ssl_certificates" ON "saas_ssl_certificates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSubscriptionLineItem (saas_subscription_line_items)
ALTER TABLE "saas_subscription_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_subscription_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_subscription_line_items" ON "saas_subscription_line_items";
CREATE POLICY "tenant_isolation_saas_subscription_line_items" ON "saas_subscription_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSubscriptionPlan (saas_subscription_plans)
ALTER TABLE "saas_subscription_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_subscription_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_subscription_plans" ON "saas_subscription_plans";
CREATE POLICY "tenant_isolation_saas_subscription_plans" ON "saas_subscription_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSubscription (saas_subscriptions)
ALTER TABLE "saas_subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_subscriptions" ON "saas_subscriptions";
CREATE POLICY "tenant_isolation_saas_subscriptions" ON "saas_subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSupportTicketAttachment (saas_support_ticket_attachments)
ALTER TABLE "saas_support_ticket_attachments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_support_ticket_attachments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_support_ticket_attachments" ON "saas_support_ticket_attachments";
CREATE POLICY "tenant_isolation_saas_support_ticket_attachments" ON "saas_support_ticket_attachments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSupportTicketMessage (saas_support_ticket_messages)
ALTER TABLE "saas_support_ticket_messages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_support_ticket_messages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_support_ticket_messages" ON "saas_support_ticket_messages";
CREATE POLICY "tenant_isolation_saas_support_ticket_messages" ON "saas_support_ticket_messages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasSupportTicket (saas_support_tickets)
ALTER TABLE "saas_support_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_support_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_support_tickets" ON "saas_support_tickets";
CREATE POLICY "tenant_isolation_saas_support_tickets" ON "saas_support_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasTenantCustomQuota (saas_tenant_custom_quotas)
ALTER TABLE "saas_tenant_custom_quotas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_tenant_custom_quotas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_tenant_custom_quotas" ON "saas_tenant_custom_quotas";
CREATE POLICY "tenant_isolation_saas_tenant_custom_quotas" ON "saas_tenant_custom_quotas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasTenantDomain (saas_tenant_domains)
ALTER TABLE "saas_tenant_domains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_tenant_domains" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_tenant_domains" ON "saas_tenant_domains";
CREATE POLICY "tenant_isolation_saas_tenant_domains" ON "saas_tenant_domains"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasTenantNodeRouting (saas_tenant_node_routings)
ALTER TABLE "saas_tenant_node_routings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_tenant_node_routings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_tenant_node_routings" ON "saas_tenant_node_routings";
CREATE POLICY "tenant_isolation_saas_tenant_node_routings" ON "saas_tenant_node_routings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasTenantSetting (saas_tenant_settings)
ALTER TABLE "saas_tenant_settings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_tenant_settings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_tenant_settings" ON "saas_tenant_settings";
CREATE POLICY "tenant_isolation_saas_tenant_settings" ON "saas_tenant_settings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasTenantTierConfig (saas_tenant_tier_configs)
ALTER TABLE "saas_tenant_tier_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_tenant_tier_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_tenant_tier_configs" ON "saas_tenant_tier_configs";
CREATE POLICY "tenant_isolation_saas_tenant_tier_configs" ON "saas_tenant_tier_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasUsageEventBatch (saas_usage_event_batches)
ALTER TABLE "saas_usage_event_batches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_usage_event_batches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_usage_event_batches" ON "saas_usage_event_batches";
CREATE POLICY "tenant_isolation_saas_usage_event_batches" ON "saas_usage_event_batches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasUsageMeter (saas_usage_meters)
ALTER TABLE "saas_usage_meters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_usage_meters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_usage_meters" ON "saas_usage_meters";
CREATE POLICY "tenant_isolation_saas_usage_meters" ON "saas_usage_meters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasUsageRecord (saas_usage_records)
ALTER TABLE "saas_usage_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_usage_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_usage_records" ON "saas_usage_records";
CREATE POLICY "tenant_isolation_saas_usage_records" ON "saas_usage_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasWebhookDelivery (saas_webhook_deliveries)
ALTER TABLE "saas_webhook_deliveries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_webhook_deliveries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_webhook_deliveries" ON "saas_webhook_deliveries";
CREATE POLICY "tenant_isolation_saas_webhook_deliveries" ON "saas_webhook_deliveries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasWebhookEndpoint (saas_webhook_endpoints)
ALTER TABLE "saas_webhook_endpoints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_webhook_endpoints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_webhook_endpoints" ON "saas_webhook_endpoints";
CREATE POLICY "tenant_isolation_saas_webhook_endpoints" ON "saas_webhook_endpoints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SaasWhiteLabelDomain (saas_white_label_domains)
ALTER TABLE "saas_white_label_domains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saas_white_label_domains" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saas_white_label_domains" ON "saas_white_label_domains";
CREATE POLICY "tenant_isolation_saas_white_label_domains" ON "saas_white_label_domains"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SafetyDataSheet (safety_data_sheets)
ALTER TABLE "safety_data_sheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "safety_data_sheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_safety_data_sheets" ON "safety_data_sheets";
CREATE POLICY "tenant_isolation_safety_data_sheets" ON "safety_data_sheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SafetyStockConfig (safety_stock_configs)
ALTER TABLE "safety_stock_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "safety_stock_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_safety_stock_configs" ON "safety_stock_configs";
CREATE POLICY "tenant_isolation_safety_stock_configs" ON "safety_stock_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SafetyStockOptimization (safety_stock_optimizations)
ALTER TABLE "safety_stock_optimizations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "safety_stock_optimizations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_safety_stock_optimizations" ON "safety_stock_optimizations";
CREATE POLICY "tenant_isolation_safety_stock_optimizations" ON "safety_stock_optimizations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalaryComponent (salary_components)
ALTER TABLE "salary_components" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "salary_components" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_salary_components" ON "salary_components";
CREATE POLICY "tenant_isolation_salary_components" ON "salary_components"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalaryRevision (salary_revisions)
ALTER TABLE "salary_revisions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "salary_revisions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_salary_revisions" ON "salary_revisions";
CREATE POLICY "tenant_isolation_salary_revisions" ON "salary_revisions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalaryStructure (salary_structures)
ALTER TABLE "salary_structures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "salary_structures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_salary_structures" ON "salary_structures";
CREATE POLICY "tenant_isolation_salary_structures" ON "salary_structures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesChannel (sales_channels)
ALTER TABLE "sales_channels" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_channels" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_channels" ON "sales_channels";
CREATE POLICY "tenant_isolation_sales_channels" ON "sales_channels"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesCoupon (sales_coupons)
ALTER TABLE "sales_coupons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_coupons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_coupons" ON "sales_coupons";
CREATE POLICY "tenant_isolation_sales_coupons" ON "sales_coupons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesCycleAnalytic (sales_cycle_analytics)
ALTER TABLE "sales_cycle_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_cycle_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_cycle_analytics" ON "sales_cycle_analytics";
CREATE POLICY "tenant_isolation_sales_cycle_analytics" ON "sales_cycle_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesDocumentGeneration (sales_document_generations)
ALTER TABLE "sales_document_generations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_document_generations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_document_generations" ON "sales_document_generations";
CREATE POLICY "tenant_isolation_sales_document_generations" ON "sales_document_generations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesDocumentTemplate (sales_document_templates)
ALTER TABLE "sales_document_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_document_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_document_templates" ON "sales_document_templates";
CREATE POLICY "tenant_isolation_sales_document_templates" ON "sales_document_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesGamificationDeep (sales_gamification_deep)
ALTER TABLE "sales_gamification_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_gamification_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_gamification_deep" ON "sales_gamification_deep";
CREATE POLICY "tenant_isolation_sales_gamification_deep" ON "sales_gamification_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesIntelligenceSignal (sales_intelligence_signals)
ALTER TABLE "sales_intelligence_signals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_intelligence_signals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_intelligence_signals" ON "sales_intelligence_signals";
CREATE POLICY "tenant_isolation_sales_intelligence_signals" ON "sales_intelligence_signals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesNote (sales_notes)
ALTER TABLE "sales_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_notes" ON "sales_notes";
CREATE POLICY "tenant_isolation_sales_notes" ON "sales_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesOrderItem (sales_order_items)
ALTER TABLE "sales_order_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_order_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_order_items" ON "sales_order_items";
CREATE POLICY "tenant_isolation_sales_order_items" ON "sales_order_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesOrder (sales_orders)
ALTER TABLE "sales_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_orders" ON "sales_orders";
CREATE POLICY "tenant_isolation_sales_orders" ON "sales_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPartnerDealRegistration (sales_partner_deal_registrations)
ALTER TABLE "sales_partner_deal_registrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_partner_deal_registrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_partner_deal_registrations" ON "sales_partner_deal_registrations";
CREATE POLICY "tenant_isolation_sales_partner_deal_registrations" ON "sales_partner_deal_registrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPartnerMdfFund (sales_partner_mdf_funds)
ALTER TABLE "sales_partner_mdf_funds" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_partner_mdf_funds" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_partner_mdf_funds" ON "sales_partner_mdf_funds";
CREATE POLICY "tenant_isolation_sales_partner_mdf_funds" ON "sales_partner_mdf_funds"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPartnerTier (sales_partner_tiers)
ALTER TABLE "sales_partner_tiers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_partner_tiers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_partner_tiers" ON "sales_partner_tiers";
CREATE POLICY "tenant_isolation_sales_partner_tiers" ON "sales_partner_tiers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPartner (sales_partners)
ALTER TABLE "sales_partners" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_partners" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_partners" ON "sales_partners";
CREATE POLICY "tenant_isolation_sales_partners" ON "sales_partners"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPipeline (sales_pipelines)
ALTER TABLE "sales_pipelines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_pipelines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_pipelines" ON "sales_pipelines";
CREATE POLICY "tenant_isolation_sales_pipelines" ON "sales_pipelines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPlaybookStepDeep (sales_playbook_steps_deep)
ALTER TABLE "sales_playbook_steps_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_playbook_steps_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_playbook_steps_deep" ON "sales_playbook_steps_deep";
CREATE POLICY "tenant_isolation_sales_playbook_steps_deep" ON "sales_playbook_steps_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPlaybook (sales_playbooks)
ALTER TABLE "sales_playbooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_playbooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_playbooks" ON "sales_playbooks";
CREATE POLICY "tenant_isolation_sales_playbooks" ON "sales_playbooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPlaybookDeep (sales_playbooks_deep)
ALTER TABLE "sales_playbooks_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_playbooks_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_playbooks_deep" ON "sales_playbooks_deep";
CREATE POLICY "tenant_isolation_sales_playbooks_deep" ON "sales_playbooks_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesPromotion (sales_promotions)
ALTER TABLE "sales_promotions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_promotions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_promotions" ON "sales_promotions";
CREATE POLICY "tenant_isolation_sales_promotions" ON "sales_promotions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesQuotaAttainment (sales_quota_attainments)
ALTER TABLE "sales_quota_attainments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_quota_attainments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_quota_attainments" ON "sales_quota_attainments";
CREATE POLICY "tenant_isolation_sales_quota_attainments" ON "sales_quota_attainments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesReturnItem (sales_return_items)
ALTER TABLE "sales_return_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_return_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_return_items" ON "sales_return_items";
CREATE POLICY "tenant_isolation_sales_return_items" ON "sales_return_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesReturnOrderDeep (sales_return_orders_deep)
ALTER TABLE "sales_return_orders_deep" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_return_orders_deep" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_return_orders_deep" ON "sales_return_orders_deep";
CREATE POLICY "tenant_isolation_sales_return_orders_deep" ON "sales_return_orders_deep"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesReturn (sales_returns)
ALTER TABLE "sales_returns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_returns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_returns" ON "sales_returns";
CREATE POLICY "tenant_isolation_sales_returns" ON "sales_returns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesStreak (sales_streaks)
ALTER TABLE "sales_streaks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_streaks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_streaks" ON "sales_streaks";
CREATE POLICY "tenant_isolation_sales_streaks" ON "sales_streaks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesTarget (sales_targets)
ALTER TABLE "sales_targets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_targets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_targets" ON "sales_targets";
CREATE POLICY "tenant_isolation_sales_targets" ON "sales_targets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesTeamMember (sales_team_members)
ALTER TABLE "sales_team_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_team_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_team_members" ON "sales_team_members";
CREATE POLICY "tenant_isolation_sales_team_members" ON "sales_team_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesTerritory (sales_territories)
ALTER TABLE "sales_territories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_territories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_territories" ON "sales_territories";
CREATE POLICY "tenant_isolation_sales_territories" ON "sales_territories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesTerritoryForecast (sales_territory_forecasts)
ALTER TABLE "sales_territory_forecasts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_territory_forecasts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_territory_forecasts" ON "sales_territory_forecasts";
CREATE POLICY "tenant_isolation_sales_territory_forecasts" ON "sales_territory_forecasts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SalesTerritoryRealignment (sales_territory_realignments)
ALTER TABLE "sales_territory_realignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sales_territory_realignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sales_territory_realignments" ON "sales_territory_realignments";
CREATE POLICY "tenant_isolation_sales_territory_realignments" ON "sales_territory_realignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedReport (saved_reports)
ALTER TABLE "saved_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_reports" ON "saved_reports";
CREATE POLICY "tenant_isolation_saved_reports" ON "saved_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedSearch (saved_searches)
ALTER TABLE "saved_searches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_searches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_searches" ON "saved_searches";
CREATE POLICY "tenant_isolation_saved_searches" ON "saved_searches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewColumnConfig (saved_view_column_configs)
ALTER TABLE "saved_view_column_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_column_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_column_configs" ON "saved_view_column_configs";
CREATE POLICY "tenant_isolation_saved_view_column_configs" ON "saved_view_column_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewFilterRule (saved_view_filter_rules)
ALTER TABLE "saved_view_filter_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_filter_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_filter_rules" ON "saved_view_filter_rules";
CREATE POLICY "tenant_isolation_saved_view_filter_rules" ON "saved_view_filter_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewFilter (saved_view_filters)
ALTER TABLE "saved_view_filters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_filters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_filters" ON "saved_view_filters";
CREATE POLICY "tenant_isolation_saved_view_filters" ON "saved_view_filters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewLayout (saved_view_layouts)
ALTER TABLE "saved_view_layouts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_layouts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_layouts" ON "saved_view_layouts";
CREATE POLICY "tenant_isolation_saved_view_layouts" ON "saved_view_layouts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewPreference (saved_view_preferences)
ALTER TABLE "saved_view_preferences" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_preferences" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_preferences" ON "saved_view_preferences";
CREATE POLICY "tenant_isolation_saved_view_preferences" ON "saved_view_preferences"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewShare (saved_view_shares)
ALTER TABLE "saved_view_shares" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_shares" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_shares" ON "saved_view_shares";
CREATE POLICY "tenant_isolation_saved_view_shares" ON "saved_view_shares"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedViewSharing (saved_view_sharings)
ALTER TABLE "saved_view_sharings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_view_sharings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_view_sharings" ON "saved_view_sharings";
CREATE POLICY "tenant_isolation_saved_view_sharings" ON "saved_view_sharings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SavedView (saved_views)
ALTER TABLE "saved_views" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "saved_views" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_saved_views" ON "saved_views";
CREATE POLICY "tenant_isolation_saved_views" ON "saved_views"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScemAlertRule (scem_alert_rules)
ALTER TABLE "scem_alert_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scem_alert_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scem_alert_rules" ON "scem_alert_rules";
CREATE POLICY "tenant_isolation_scem_alert_rules" ON "scem_alert_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScemAlert (scem_alerts)
ALTER TABLE "scem_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scem_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scem_alerts" ON "scem_alerts";
CREATE POLICY "tenant_isolation_scem_alerts" ON "scem_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScheduledJob (scheduled_jobs)
ALTER TABLE "scheduled_jobs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scheduled_jobs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scheduled_jobs" ON "scheduled_jobs";
CREATE POLICY "tenant_isolation_scheduled_jobs" ON "scheduled_jobs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScheduledReport (scheduled_reports)
ALTER TABLE "scheduled_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scheduled_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scheduled_reports" ON "scheduled_reports";
CREATE POLICY "tenant_isolation_scheduled_reports" ON "scheduled_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScheduledTask (scheduled_tasks)
ALTER TABLE "scheduled_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scheduled_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scheduled_tasks" ON "scheduled_tasks";
CREATE POLICY "tenant_isolation_scheduled_tasks" ON "scheduled_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SchemaRegistry (schema_registries)
ALTER TABLE "schema_registries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "schema_registries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_schema_registries" ON "schema_registries";
CREATE POLICY "tenant_isolation_schema_registries" ON "schema_registries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmFinancingDrawdown (scm_financing_drawdowns)
ALTER TABLE "scm_financing_drawdowns" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_financing_drawdowns" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_financing_drawdowns" ON "scm_financing_drawdowns";
CREATE POLICY "tenant_isolation_scm_financing_drawdowns" ON "scm_financing_drawdowns"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmFinancingFacility (scm_financing_facilities)
ALTER TABLE "scm_financing_facilities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_financing_facilities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_financing_facilities" ON "scm_financing_facilities";
CREATE POLICY "tenant_isolation_scm_financing_facilities" ON "scm_financing_facilities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmIotDevice (scm_iot_devices)
ALTER TABLE "scm_iot_devices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_iot_devices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_iot_devices" ON "scm_iot_devices";
CREATE POLICY "tenant_isolation_scm_iot_devices" ON "scm_iot_devices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmIotReading (scm_iot_readings)
ALTER TABLE "scm_iot_readings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_iot_readings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_iot_readings" ON "scm_iot_readings";
CREATE POLICY "tenant_isolation_scm_iot_readings" ON "scm_iot_readings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmKpiSnapshot (scm_kpi_snapshots)
ALTER TABLE "scm_kpi_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_kpi_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_kpi_snapshots" ON "scm_kpi_snapshots";
CREATE POLICY "tenant_isolation_scm_kpi_snapshots" ON "scm_kpi_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ScmRiskMitigation (scm_risk_mitigations)
ALTER TABLE "scm_risk_mitigations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "scm_risk_mitigations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_scm_risk_mitigations" ON "scm_risk_mitigations";
CREATE POLICY "tenant_isolation_scm_risk_mitigations" ON "scm_risk_mitigations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchAnalytics (search_analytics)
ALTER TABLE "search_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_analytics" ON "search_analytics";
CREATE POLICY "tenant_isolation_search_analytics" ON "search_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchHistory (search_history)
ALTER TABLE "search_history" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_history" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_history" ON "search_history";
CREATE POLICY "tenant_isolation_search_history" ON "search_history"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchIndexConfig (search_index_configs)
ALTER TABLE "search_index_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_index_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_index_configs" ON "search_index_configs";
CREATE POLICY "tenant_isolation_search_index_configs" ON "search_index_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchIndexRule (search_index_rules)
ALTER TABLE "search_index_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_index_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_index_rules" ON "search_index_rules";
CREATE POLICY "tenant_isolation_search_index_rules" ON "search_index_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchIndex (search_indexes)
ALTER TABLE "search_indexes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_indexes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_indexes" ON "search_indexes";
CREATE POLICY "tenant_isolation_search_indexes" ON "search_indexes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchQueryLog (search_query_logs)
ALTER TABLE "search_query_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_query_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_query_logs" ON "search_query_logs";
CREATE POLICY "tenant_isolation_search_query_logs" ON "search_query_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SearchSynonymGroup (search_synonym_groups)
ALTER TABLE "search_synonym_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "search_synonym_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_search_synonym_groups" ON "search_synonym_groups";
CREATE POLICY "tenant_isolation_search_synonym_groups" ON "search_synonym_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SegmentRule (segment_rules)
ALTER TABLE "segment_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "segment_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_segment_rules" ON "segment_rules";
CREATE POLICY "tenant_isolation_segment_rules" ON "segment_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SerialNumberHistory (serial_number_history)
ALTER TABLE "serial_number_history" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "serial_number_history" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_serial_number_history" ON "serial_number_history";
CREATE POLICY "tenant_isolation_serial_number_history" ON "serial_number_history"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SerialNumber (serial_numbers)
ALTER TABLE "serial_numbers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "serial_numbers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_serial_numbers" ON "serial_numbers";
CREATE POLICY "tenant_isolation_serial_numbers" ON "serial_numbers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SettingChangeApproval (setting_change_approvals)
ALTER TABLE "setting_change_approvals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "setting_change_approvals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_setting_change_approvals" ON "setting_change_approvals";
CREATE POLICY "tenant_isolation_setting_change_approvals" ON "setting_change_approvals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Setting (settings)
ALTER TABLE "settings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "settings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_settings" ON "settings";
CREATE POLICY "tenant_isolation_settings" ON "settings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SettlementInstruction (settlement_instructions)
ALTER TABLE "settlement_instructions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "settlement_instructions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_settlement_instructions" ON "settlement_instructions";
CREATE POLICY "tenant_isolation_settlement_instructions" ON "settlement_instructions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ShiftSchedule (shift_schedules)
ALTER TABLE "shift_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shift_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shift_schedules" ON "shift_schedules";
CREATE POLICY "tenant_isolation_shift_schedules" ON "shift_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ShipmentEmissions (shipment_emissions)
ALTER TABLE "shipment_emissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shipment_emissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shipment_emissions" ON "shipment_emissions";
CREATE POLICY "tenant_isolation_shipment_emissions" ON "shipment_emissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ShipmentException (shipment_exceptions)
ALTER TABLE "shipment_exceptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shipment_exceptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shipment_exceptions" ON "shipment_exceptions";
CREATE POLICY "tenant_isolation_shipment_exceptions" ON "shipment_exceptions"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for ShipmentTrackingEvent (shipment_tracking_events)
ALTER TABLE "shipment_tracking_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shipment_tracking_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shipment_tracking_events" ON "shipment_tracking_events";
CREATE POLICY "tenant_isolation_shipment_tracking_events" ON "shipment_tracking_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Shipment (shipments)
ALTER TABLE "shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shipments" ON "shipments";
CREATE POLICY "tenant_isolation_shipments" ON "shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ShippingCarrier (shipping_carriers)
ALTER TABLE "shipping_carriers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shipping_carriers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shipping_carriers" ON "shipping_carriers";
CREATE POLICY "tenant_isolation_shipping_carriers" ON "shipping_carriers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ShopFloorTransaction (shop_floor_transactions)
ALTER TABLE "shop_floor_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "shop_floor_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_shop_floor_transactions" ON "shop_floor_transactions";
CREATE POLICY "tenant_isolation_shop_floor_transactions" ON "shop_floor_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Signature (signatures)
ALTER TABLE "signatures" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "signatures" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_signatures" ON "signatures";
CREATE POLICY "tenant_isolation_signatures" ON "signatures"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SixSigmaMetric (six_sigma_metrics)
ALTER TABLE "six_sigma_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "six_sigma_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_six_sigma_metrics" ON "six_sigma_metrics";
CREATE POLICY "tenant_isolation_six_sigma_metrics" ON "six_sigma_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SixSigmaProject (six_sigma_projects)
ALTER TABLE "six_sigma_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "six_sigma_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_six_sigma_projects" ON "six_sigma_projects";
CREATE POLICY "tenant_isolation_six_sigma_projects" ON "six_sigma_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SixSigmaTool (six_sigma_tools)
ALTER TABLE "six_sigma_tools" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "six_sigma_tools" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_six_sigma_tools" ON "six_sigma_tools";
CREATE POLICY "tenant_isolation_six_sigma_tools" ON "six_sigma_tools"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SkillCatalog (skill_catalog)
ALTER TABLE "skill_catalog" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "skill_catalog" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_skill_catalog" ON "skill_catalog";
CREATE POLICY "tenant_isolation_skill_catalog" ON "skill_catalog"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SkillGapAnalysis (skill_gap_analyses)
ALTER TABLE "skill_gap_analyses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "skill_gap_analyses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_skill_gap_analyses" ON "skill_gap_analyses";
CREATE POLICY "tenant_isolation_skill_gap_analyses" ON "skill_gap_analyses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SkillMatrix (skill_matrices)
ALTER TABLE "skill_matrices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "skill_matrices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_skill_matrices" ON "skill_matrices";
CREATE POLICY "tenant_isolation_skill_matrices" ON "skill_matrices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SkillRequirement (skill_requirements)
ALTER TABLE "skill_requirements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "skill_requirements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_skill_requirements" ON "skill_requirements";
CREATE POLICY "tenant_isolation_skill_requirements" ON "skill_requirements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SloDefinition (slo_definitions)
ALTER TABLE "slo_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "slo_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_slo_definitions" ON "slo_definitions";
CREATE POLICY "tenant_isolation_slo_definitions" ON "slo_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceKnowledgeArticle (sm_knowledge_articles)
ALTER TABLE "sm_knowledge_articles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_knowledge_articles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_knowledge_articles" ON "sm_knowledge_articles";
CREATE POLICY "tenant_isolation_sm_knowledge_articles" ON "sm_knowledge_articles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicket (sm_service_tickets)
ALTER TABLE "sm_service_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_service_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_service_tickets" ON "sm_service_tickets";
CREATE POLICY "tenant_isolation_sm_service_tickets" ON "sm_service_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceSurveyResponse (sm_survey_responses)
ALTER TABLE "sm_survey_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_survey_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_survey_responses" ON "sm_survey_responses";
CREATE POLICY "tenant_isolation_sm_survey_responses" ON "sm_survey_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicketActivity (sm_ticket_activities)
ALTER TABLE "sm_ticket_activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_ticket_activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_ticket_activities" ON "sm_ticket_activities";
CREATE POLICY "tenant_isolation_sm_ticket_activities" ON "sm_ticket_activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicketCategory (sm_ticket_categories)
ALTER TABLE "sm_ticket_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_ticket_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_ticket_categories" ON "sm_ticket_categories";
CREATE POLICY "tenant_isolation_sm_ticket_categories" ON "sm_ticket_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicketComment (sm_ticket_comments)
ALTER TABLE "sm_ticket_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_ticket_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_ticket_comments" ON "sm_ticket_comments";
CREATE POLICY "tenant_isolation_sm_ticket_comments" ON "sm_ticket_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicketSLABreach (sm_ticket_sla_breaches)
ALTER TABLE "sm_ticket_sla_breaches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_ticket_sla_breaches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_ticket_sla_breaches" ON "sm_ticket_sla_breaches";
CREATE POLICY "tenant_isolation_sm_ticket_sla_breaches" ON "sm_ticket_sla_breaches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ServiceTicketSLAPolicy (sm_ticket_sla_policies)
ALTER TABLE "sm_ticket_sla_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sm_ticket_sla_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sm_ticket_sla_policies" ON "sm_ticket_sla_policies";
CREATE POLICY "tenant_isolation_sm_ticket_sla_policies" ON "sm_ticket_sla_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SmartGlCodingSuggestion (smart_gl_coding_suggestions)
ALTER TABLE "smart_gl_coding_suggestions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "smart_gl_coding_suggestions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_smart_gl_coding_suggestions" ON "smart_gl_coding_suggestions";
CREATE POLICY "tenant_isolation_smart_gl_coding_suggestions" ON "smart_gl_coding_suggestions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SmartReplenishmentOrder (smart_replenishment_orders)
ALTER TABLE "smart_replenishment_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "smart_replenishment_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_smart_replenishment_orders" ON "smart_replenishment_orders";
CREATE POLICY "tenant_isolation_smart_replenishment_orders" ON "smart_replenishment_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SocialMediaPost (social_media_posts)
ALTER TABLE "social_media_posts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "social_media_posts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_social_media_posts" ON "social_media_posts";
CREATE POLICY "tenant_isolation_social_media_posts" ON "social_media_posts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SodConflict (sod_conflicts)
ALTER TABLE "sod_conflicts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sod_conflicts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sod_conflicts" ON "sod_conflicts";
CREATE POLICY "tenant_isolation_sod_conflicts" ON "sod_conflicts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SodRuleDefinition (sod_rule_definitions)
ALTER TABLE "sod_rule_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sod_rule_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sod_rule_definitions" ON "sod_rule_definitions";
CREATE POLICY "tenant_isolation_sod_rule_definitions" ON "sod_rule_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopConsensusPlan (sop_consensus_plans)
ALTER TABLE "sop_consensus_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_consensus_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_consensus_plans" ON "sop_consensus_plans";
CREATE POLICY "tenant_isolation_sop_consensus_plans" ON "sop_consensus_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopCycle (sop_cycles)
ALTER TABLE "sop_cycles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_cycles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_cycles" ON "sop_cycles";
CREATE POLICY "tenant_isolation_sop_cycles" ON "sop_cycles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopDemandPlan (sop_demand_plans)
ALTER TABLE "sop_demand_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_demand_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_demand_plans" ON "sop_demand_plans";
CREATE POLICY "tenant_isolation_sop_demand_plans" ON "sop_demand_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopDocument (sop_documents)
ALTER TABLE "sop_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_documents" ON "sop_documents";
CREATE POLICY "tenant_isolation_sop_documents" ON "sop_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopPlanMetric (sop_plan_metrics)
ALTER TABLE "sop_plan_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_plan_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_plan_metrics" ON "sop_plan_metrics";
CREATE POLICY "tenant_isolation_sop_plan_metrics" ON "sop_plan_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopPlanReview (sop_plan_reviews)
ALTER TABLE "sop_plan_reviews" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_plan_reviews" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_plan_reviews" ON "sop_plan_reviews";
CREATE POLICY "tenant_isolation_sop_plan_reviews" ON "sop_plan_reviews"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopPlan (sop_plans)
ALTER TABLE "sop_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_plans" ON "sop_plans";
CREATE POLICY "tenant_isolation_sop_plans" ON "sop_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopRevision (sop_revisions)
ALTER TABLE "sop_revisions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_revisions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_revisions" ON "sop_revisions";
CREATE POLICY "tenant_isolation_sop_revisions" ON "sop_revisions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SopSupplyPlan (sop_supply_plans)
ALTER TABLE "sop_supply_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sop_supply_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sop_supply_plans" ON "sop_supply_plans";
CREATE POLICY "tenant_isolation_sop_supply_plans" ON "sop_supply_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SourcingParticipant (sourcing_participants)
ALTER TABLE "sourcing_participants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sourcing_participants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sourcing_participants" ON "sourcing_participants";
CREATE POLICY "tenant_isolation_sourcing_participants" ON "sourcing_participants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SourcingProject (sourcing_projects)
ALTER TABLE "sourcing_projects" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sourcing_projects" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sourcing_projects" ON "sourcing_projects";
CREATE POLICY "tenant_isolation_sourcing_projects" ON "sourcing_projects"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SparePart (spare_parts)
ALTER TABLE "spare_parts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "spare_parts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_spare_parts" ON "spare_parts";
CREATE POLICY "tenant_isolation_spare_parts" ON "spare_parts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SpcChart (spc_charts)
ALTER TABLE "spc_charts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "spc_charts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_spc_charts" ON "spc_charts";
CREATE POLICY "tenant_isolation_spc_charts" ON "spc_charts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SpcSample (spc_samples)
ALTER TABLE "spc_samples" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "spc_samples" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_spc_samples" ON "spc_samples";
CREATE POLICY "tenant_isolation_spc_samples" ON "spc_samples"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SsccRecord (sscc_records)
ALTER TABLE "sscc_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sscc_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sscc_records" ON "sscc_records";
CREATE POLICY "tenant_isolation_sscc_records" ON "sscc_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SsoConfig (sso_configs)
ALTER TABLE "sso_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sso_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sso_configs" ON "sso_configs";
CREATE POLICY "tenant_isolation_sso_configs" ON "sso_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StageGate (stage_gates)
ALTER TABLE "stage_gates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stage_gates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stage_gates" ON "stage_gates";
CREATE POLICY "tenant_isolation_stage_gates" ON "stage_gates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StandardCost (standard_costs)
ALTER TABLE "standard_costs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "standard_costs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_standard_costs" ON "standard_costs";
CREATE POLICY "tenant_isolation_standard_costs" ON "standard_costs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StatementTemplate (statement_templates)
ALTER TABLE "statement_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "statement_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_statement_templates" ON "statement_templates";
CREATE POLICY "tenant_isolation_statement_templates" ON "statement_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StickyRouteAssignment (sticky_route_assignments)
ALTER TABLE "sticky_route_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sticky_route_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sticky_route_assignments" ON "sticky_route_assignments";
CREATE POLICY "tenant_isolation_sticky_route_assignments" ON "sticky_route_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockAlert (stock_alerts)
ALTER TABLE "stock_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_alerts" ON "stock_alerts";
CREATE POLICY "tenant_isolation_stock_alerts" ON "stock_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockEntry (stock_entries)
ALTER TABLE "stock_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_entries" ON "stock_entries";
CREATE POLICY "tenant_isolation_stock_entries" ON "stock_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockEntryItem (stock_entry_items)
ALTER TABLE "stock_entry_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_entry_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_entry_items" ON "stock_entry_items";
CREATE POLICY "tenant_isolation_stock_entry_items" ON "stock_entry_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockLedgerEntry (stock_ledger_entries)
ALTER TABLE "stock_ledger_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_ledger_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_ledger_entries" ON "stock_ledger_entries";
CREATE POLICY "tenant_isolation_stock_ledger_entries" ON "stock_ledger_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockReservation (stock_reservations)
ALTER TABLE "stock_reservations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_reservations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_reservations" ON "stock_reservations";
CREATE POLICY "tenant_isolation_stock_reservations" ON "stock_reservations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockRevaluationLine (stock_revaluation_lines)
ALTER TABLE "stock_revaluation_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_revaluation_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_revaluation_lines" ON "stock_revaluation_lines";
CREATE POLICY "tenant_isolation_stock_revaluation_lines" ON "stock_revaluation_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockRevaluation (stock_revaluations)
ALTER TABLE "stock_revaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_revaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_revaluations" ON "stock_revaluations";
CREATE POLICY "tenant_isolation_stock_revaluations" ON "stock_revaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockTakeVariance (stock_take_variances)
ALTER TABLE "stock_take_variances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_take_variances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_take_variances" ON "stock_take_variances";
CREATE POLICY "tenant_isolation_stock_take_variances" ON "stock_take_variances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockTake (stock_takes)
ALTER TABLE "stock_takes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_takes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_takes" ON "stock_takes";
CREATE POLICY "tenant_isolation_stock_takes" ON "stock_takes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockTransferApproval (stock_transfer_approvals)
ALTER TABLE "stock_transfer_approvals" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_transfer_approvals" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_transfer_approvals" ON "stock_transfer_approvals";
CREATE POLICY "tenant_isolation_stock_transfer_approvals" ON "stock_transfer_approvals"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockValuationLedger (stock_valuation_ledger)
ALTER TABLE "stock_valuation_ledger" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_valuation_ledger" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_valuation_ledger" ON "stock_valuation_ledger";
CREATE POLICY "tenant_isolation_stock_valuation_ledger" ON "stock_valuation_ledger"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockValuationPolicy (stock_valuation_policies)
ALTER TABLE "stock_valuation_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_valuation_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_valuation_policies" ON "stock_valuation_policies";
CREATE POLICY "tenant_isolation_stock_valuation_policies" ON "stock_valuation_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockWriteDownRequest (stock_write_down_requests)
ALTER TABLE "stock_write_down_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_write_down_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_write_down_requests" ON "stock_write_down_requests";
CREATE POLICY "tenant_isolation_stock_write_down_requests" ON "stock_write_down_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockWriteOffRecord (stock_write_off_records)
ALTER TABLE "stock_write_off_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stock_write_off_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stock_write_off_records" ON "stock_write_off_records";
CREATE POLICY "tenant_isolation_stock_write_off_records" ON "stock_write_off_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StockoutPrediction (stockout_predictions)
ALTER TABLE "stockout_predictions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stockout_predictions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stockout_predictions" ON "stockout_predictions";
CREATE POLICY "tenant_isolation_stockout_predictions" ON "stockout_predictions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageAccessPolicy (storage_access_policies)
ALTER TABLE "storage_access_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_access_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_access_policies" ON "storage_access_policies";
CREATE POLICY "tenant_isolation_storage_access_policies" ON "storage_access_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageAlert (storage_alerts)
ALTER TABLE "storage_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_alerts" ON "storage_alerts";
CREATE POLICY "tenant_isolation_storage_alerts" ON "storage_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageAnalytic (storage_analytics)
ALTER TABLE "storage_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_analytics" ON "storage_analytics";
CREATE POLICY "tenant_isolation_storage_analytics" ON "storage_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageBackup (storage_backups)
ALTER TABLE "storage_backups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_backups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_backups" ON "storage_backups";
CREATE POLICY "tenant_isolation_storage_backups" ON "storage_backups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageBucketConfig (storage_bucket_configs)
ALTER TABLE "storage_bucket_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_bucket_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_bucket_configs" ON "storage_bucket_configs";
CREATE POLICY "tenant_isolation_storage_bucket_configs" ON "storage_bucket_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageCache (storage_caches)
ALTER TABLE "storage_caches" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_caches" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_caches" ON "storage_caches";
CREATE POLICY "tenant_isolation_storage_caches" ON "storage_caches"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageComplianceLog (storage_compliance_logs)
ALTER TABLE "storage_compliance_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_compliance_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_compliance_logs" ON "storage_compliance_logs";
CREATE POLICY "tenant_isolation_storage_compliance_logs" ON "storage_compliance_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageCompression (storage_compressions)
ALTER TABLE "storage_compressions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_compressions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_compressions" ON "storage_compressions";
CREATE POLICY "tenant_isolation_storage_compressions" ON "storage_compressions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageDeduplication (storage_deduplications)
ALTER TABLE "storage_deduplications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_deduplications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_deduplications" ON "storage_deduplications";
CREATE POLICY "tenant_isolation_storage_deduplications" ON "storage_deduplications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageEncryption (storage_encryptions)
ALTER TABLE "storage_encryptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_encryptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_encryptions" ON "storage_encryptions";
CREATE POLICY "tenant_isolation_storage_encryptions" ON "storage_encryptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageFileVersion (storage_file_versions)
ALTER TABLE "storage_file_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_file_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_file_versions" ON "storage_file_versions";
CREATE POLICY "tenant_isolation_storage_file_versions" ON "storage_file_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageFolder (storage_folders)
ALTER TABLE "storage_folders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_folders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_folders" ON "storage_folders";
CREATE POLICY "tenant_isolation_storage_folders" ON "storage_folders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageLifecycleRule (storage_lifecycle_rules)
ALTER TABLE "storage_lifecycle_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_lifecycle_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_lifecycle_rules" ON "storage_lifecycle_rules";
CREATE POLICY "tenant_isolation_storage_lifecycle_rules" ON "storage_lifecycle_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageMigration (storage_migrations)
ALTER TABLE "storage_migrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_migrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_migrations" ON "storage_migrations";
CREATE POLICY "tenant_isolation_storage_migrations" ON "storage_migrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageQuota (storage_quotas)
ALTER TABLE "storage_quotas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_quotas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_quotas" ON "storage_quotas";
CREATE POLICY "tenant_isolation_storage_quotas" ON "storage_quotas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageReplication (storage_replications)
ALTER TABLE "storage_replications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_replications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_replications" ON "storage_replications";
CREATE POLICY "tenant_isolation_storage_replications" ON "storage_replications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageRetentionPolicy (storage_retention_policies)
ALTER TABLE "storage_retention_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_retention_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_retention_policies" ON "storage_retention_policies";
CREATE POLICY "tenant_isolation_storage_retention_policies" ON "storage_retention_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageShareLink (storage_share_links)
ALTER TABLE "storage_share_links" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_share_links" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_share_links" ON "storage_share_links";
CREATE POLICY "tenant_isolation_storage_share_links" ON "storage_share_links"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageSnapshot (storage_snapshots)
ALTER TABLE "storage_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_snapshots" ON "storage_snapshots";
CREATE POLICY "tenant_isolation_storage_snapshots" ON "storage_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorageSync (storage_syncs)
ALTER TABLE "storage_syncs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storage_syncs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storage_syncs" ON "storage_syncs";
CREATE POLICY "tenant_isolation_storage_syncs" ON "storage_syncs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StoredFile (stored_files)
ALTER TABLE "stored_files" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "stored_files" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_stored_files" ON "stored_files";
CREATE POLICY "tenant_isolation_stored_files" ON "stored_files"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorefrontCategory (storefront_categories)
ALTER TABLE "storefront_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storefront_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storefront_categories" ON "storefront_categories";
CREATE POLICY "tenant_isolation_storefront_categories" ON "storefront_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorefrontCheckoutState (storefront_checkout_states)
ALTER TABLE "storefront_checkout_states" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storefront_checkout_states" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storefront_checkout_states" ON "storefront_checkout_states";
CREATE POLICY "tenant_isolation_storefront_checkout_states" ON "storefront_checkout_states"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorefrontConfig (storefront_configs)
ALTER TABLE "storefront_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storefront_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storefront_configs" ON "storefront_configs";
CREATE POLICY "tenant_isolation_storefront_configs" ON "storefront_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StorefrontOrderPayment (storefront_order_payments)
ALTER TABLE "storefront_order_payments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "storefront_order_payments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_storefront_order_payments" ON "storefront_order_payments";
CREATE POLICY "tenant_isolation_storefront_order_payments" ON "storefront_order_payments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StudentFee (student_fees)
ALTER TABLE "student_fees" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "student_fees" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_student_fees" ON "student_fees";
CREATE POLICY "tenant_isolation_student_fees" ON "student_fees"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for StudioPermission (studio_permissions)
ALTER TABLE "studio_permissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "studio_permissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_studio_permissions" ON "studio_permissions";
CREATE POLICY "tenant_isolation_studio_permissions" ON "studio_permissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubcontractedReceipt (subcontracted_receipts)
ALTER TABLE "subcontracted_receipts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subcontracted_receipts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subcontracted_receipts" ON "subcontracted_receipts";
CREATE POLICY "tenant_isolation_subcontracted_receipts" ON "subcontracted_receipts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubcontractingMaterial (subcontracting_materials)
ALTER TABLE "subcontracting_materials" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subcontracting_materials" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subcontracting_materials" ON "subcontracting_materials";
CREATE POLICY "tenant_isolation_subcontracting_materials" ON "subcontracting_materials"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubcontractingOrder (subcontracting_orders)
ALTER TABLE "subcontracting_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subcontracting_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subcontracting_orders" ON "subcontracting_orders";
CREATE POLICY "tenant_isolation_subcontracting_orders" ON "subcontracting_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubcontractorDeliverable (subcontractor_deliverables)
ALTER TABLE "subcontractor_deliverables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subcontractor_deliverables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subcontractor_deliverables" ON "subcontractor_deliverables";
CREATE POLICY "tenant_isolation_subcontractor_deliverables" ON "subcontractor_deliverables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubcontractorPaymentMilestone (subcontractor_payment_milestones)
ALTER TABLE "subcontractor_payment_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subcontractor_payment_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subcontractor_payment_milestones" ON "subcontractor_payment_milestones";
CREATE POLICY "tenant_isolation_subcontractor_payment_milestones" ON "subcontractor_payment_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Subinventory (subinventories)
ALTER TABLE "subinventories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subinventories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subinventories" ON "subinventories";
CREATE POLICY "tenant_isolation_subinventories" ON "subinventories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubjectErasureKey (subject_erasure_keys)
ALTER TABLE "subject_erasure_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subject_erasure_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subject_erasure_keys" ON "subject_erasure_keys";
CREATE POLICY "tenant_isolation_subject_erasure_keys" ON "subject_erasure_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionAnalyticsSnapshot (subscription_analytics_snapshots)
ALTER TABLE "subscription_analytics_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_analytics_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_analytics_snapshots" ON "subscription_analytics_snapshots";
CREATE POLICY "tenant_isolation_subscription_analytics_snapshots" ON "subscription_analytics_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionAutoScaleRule (subscription_auto_scale_rules)
ALTER TABLE "subscription_auto_scale_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_auto_scale_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_auto_scale_rules" ON "subscription_auto_scale_rules";
CREATE POLICY "tenant_isolation_subscription_auto_scale_rules" ON "subscription_auto_scale_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionBillingRunLine (subscription_billing_run_lines)
ALTER TABLE "subscription_billing_run_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_billing_run_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_billing_run_lines" ON "subscription_billing_run_lines";
CREATE POLICY "tenant_isolation_subscription_billing_run_lines" ON "subscription_billing_run_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionBillingRun (subscription_billing_runs)
ALTER TABLE "subscription_billing_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_billing_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_billing_runs" ON "subscription_billing_runs";
CREATE POLICY "tenant_isolation_subscription_billing_runs" ON "subscription_billing_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionChurnSurvey (subscription_churn_surveys)
ALTER TABLE "subscription_churn_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_churn_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_churn_surveys" ON "subscription_churn_surveys";
CREATE POLICY "tenant_isolation_subscription_churn_surveys" ON "subscription_churn_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionCouponRedemption (subscription_coupon_redemptions)
ALTER TABLE "subscription_coupon_redemptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_coupon_redemptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_coupon_redemptions" ON "subscription_coupon_redemptions";
CREATE POLICY "tenant_isolation_subscription_coupon_redemptions" ON "subscription_coupon_redemptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionCoupon (subscription_coupons)
ALTER TABLE "subscription_coupons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_coupons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_coupons" ON "subscription_coupons";
CREATE POLICY "tenant_isolation_subscription_coupons" ON "subscription_coupons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionCreditNote (subscription_credit_notes)
ALTER TABLE "subscription_credit_notes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_credit_notes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_credit_notes" ON "subscription_credit_notes";
CREATE POLICY "tenant_isolation_subscription_credit_notes" ON "subscription_credit_notes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionDunningRule (subscription_dunning_rules)
ALTER TABLE "subscription_dunning_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_dunning_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_dunning_rules" ON "subscription_dunning_rules";
CREATE POLICY "tenant_isolation_subscription_dunning_rules" ON "subscription_dunning_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionInvoice (subscription_invoices)
ALTER TABLE "subscription_invoices" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_invoices" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_invoices" ON "subscription_invoices";
CREATE POLICY "tenant_isolation_subscription_invoices" ON "subscription_invoices"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionLine (subscription_lines)
ALTER TABLE "subscription_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_lines" ON "subscription_lines";
CREATE POLICY "tenant_isolation_subscription_lines" ON "subscription_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionMigration (subscription_migrations)
ALTER TABLE "subscription_migrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_migrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_migrations" ON "subscription_migrations";
CREATE POLICY "tenant_isolation_subscription_migrations" ON "subscription_migrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionPlanGroup (subscription_plan_groups)
ALTER TABLE "subscription_plan_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_plan_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_plan_groups" ON "subscription_plan_groups";
CREATE POLICY "tenant_isolation_subscription_plan_groups" ON "subscription_plan_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionPlanTier (subscription_plan_tiers)
ALTER TABLE "subscription_plan_tiers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_plan_tiers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_plan_tiers" ON "subscription_plan_tiers";
CREATE POLICY "tenant_isolation_subscription_plan_tiers" ON "subscription_plan_tiers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionUsage (subscription_usage)
ALTER TABLE "subscription_usage" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_usage" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_usage" ON "subscription_usage";
CREATE POLICY "tenant_isolation_subscription_usage" ON "subscription_usage"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SubscriptionUsageBilling (subscription_usage_billings)
ALTER TABLE "subscription_usage_billings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscription_usage_billings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscription_usage_billings" ON "subscription_usage_billings";
CREATE POLICY "tenant_isolation_subscription_usage_billings" ON "subscription_usage_billings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Subscription (subscriptions)
ALTER TABLE "subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_subscriptions" ON "subscriptions";
CREATE POLICY "tenant_isolation_subscriptions" ON "subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SuccessionPlan (succession_plans)
ALTER TABLE "succession_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "succession_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_succession_plans" ON "succession_plans";
CREATE POLICY "tenant_isolation_succession_plans" ON "succession_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierAnnouncement (supplier_announcements)
ALTER TABLE "supplier_announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_announcements" ON "supplier_announcements";
CREATE POLICY "tenant_isolation_supplier_announcements" ON "supplier_announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierAssessment (supplier_assessments)
ALTER TABLE "supplier_assessments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_assessments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_assessments" ON "supplier_assessments";
CREATE POLICY "tenant_isolation_supplier_assessments" ON "supplier_assessments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierCarRequest (supplier_car_requests)
ALTER TABLE "supplier_car_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_car_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_car_requests" ON "supplier_car_requests";
CREATE POLICY "tenant_isolation_supplier_car_requests" ON "supplier_car_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierCertification (supplier_certifications)
ALTER TABLE "supplier_certifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_certifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_certifications" ON "supplier_certifications";
CREATE POLICY "tenant_isolation_supplier_certifications" ON "supplier_certifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierContractLineItem (supplier_contract_line_items)
ALTER TABLE "supplier_contract_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_contract_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_contract_line_items" ON "supplier_contract_line_items";
CREATE POLICY "tenant_isolation_supplier_contract_line_items" ON "supplier_contract_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierContract (supplier_contracts)
ALTER TABLE "supplier_contracts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_contracts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_contracts" ON "supplier_contracts";
CREATE POLICY "tenant_isolation_supplier_contracts" ON "supplier_contracts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierDevMilestone (supplier_dev_milestones)
ALTER TABLE "supplier_dev_milestones" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_dev_milestones" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_dev_milestones" ON "supplier_dev_milestones";
CREATE POLICY "tenant_isolation_supplier_dev_milestones" ON "supplier_dev_milestones"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierDevSurvey (supplier_dev_surveys)
ALTER TABLE "supplier_dev_surveys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_dev_surveys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_dev_surveys" ON "supplier_dev_surveys";
CREATE POLICY "tenant_isolation_supplier_dev_surveys" ON "supplier_dev_surveys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierDevelopmentPlan (supplier_development_plans)
ALTER TABLE "supplier_development_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_development_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_development_plans" ON "supplier_development_plans";
CREATE POLICY "tenant_isolation_supplier_development_plans" ON "supplier_development_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierDiversity (supplier_diversity_records)
ALTER TABLE "supplier_diversity_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_diversity_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_diversity_records" ON "supplier_diversity_records";
CREATE POLICY "tenant_isolation_supplier_diversity_records" ON "supplier_diversity_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierDocument (supplier_documents)
ALTER TABLE "supplier_documents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_documents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_documents" ON "supplier_documents";
CREATE POLICY "tenant_isolation_supplier_documents" ON "supplier_documents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierEvaluationCriterion (supplier_evaluation_criteria)
ALTER TABLE "supplier_evaluation_criteria" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_evaluation_criteria" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_evaluation_criteria" ON "supplier_evaluation_criteria";
CREATE POLICY "tenant_isolation_supplier_evaluation_criteria" ON "supplier_evaluation_criteria"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierEvaluation (supplier_evaluations)
ALTER TABLE "supplier_evaluations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_evaluations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_evaluations" ON "supplier_evaluations";
CREATE POLICY "tenant_isolation_supplier_evaluations" ON "supplier_evaluations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierNcr (supplier_ncrs)
ALTER TABLE "supplier_ncrs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_ncrs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_ncrs" ON "supplier_ncrs";
CREATE POLICY "tenant_isolation_supplier_ncrs" ON "supplier_ncrs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierNonConformance (supplier_non_conformances)
ALTER TABLE "supplier_non_conformances" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_non_conformances" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_non_conformances" ON "supplier_non_conformances";
CREATE POLICY "tenant_isolation_supplier_non_conformances" ON "supplier_non_conformances"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierOnboardingWorkflow (supplier_onboarding_workflows)
ALTER TABLE "supplier_onboarding_workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_onboarding_workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_onboarding_workflows" ON "supplier_onboarding_workflows";
CREATE POLICY "tenant_isolation_supplier_onboarding_workflows" ON "supplier_onboarding_workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierPerformanceKpi (supplier_performance_kpis)
ALTER TABLE "supplier_performance_kpis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_performance_kpis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_performance_kpis" ON "supplier_performance_kpis";
CREATE POLICY "tenant_isolation_supplier_performance_kpis" ON "supplier_performance_kpis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierPortalSession (supplier_portal_sessions)
ALTER TABLE "supplier_portal_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_portal_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_portal_sessions" ON "supplier_portal_sessions";
CREATE POLICY "tenant_isolation_supplier_portal_sessions" ON "supplier_portal_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierPriceTier (supplier_price_tiers)
ALTER TABLE "supplier_price_tiers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_price_tiers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_price_tiers" ON "supplier_price_tiers";
CREATE POLICY "tenant_isolation_supplier_price_tiers" ON "supplier_price_tiers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierQuotationItem (supplier_quotation_items)
ALTER TABLE "supplier_quotation_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_quotation_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_quotation_items" ON "supplier_quotation_items";
CREATE POLICY "tenant_isolation_supplier_quotation_items" ON "supplier_quotation_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierQuotation (supplier_quotations)
ALTER TABLE "supplier_quotations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_quotations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_quotations" ON "supplier_quotations";
CREATE POLICY "tenant_isolation_supplier_quotations" ON "supplier_quotations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierRiskAlert (supplier_risk_alerts)
ALTER TABLE "supplier_risk_alerts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_risk_alerts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_risk_alerts" ON "supplier_risk_alerts";
CREATE POLICY "tenant_isolation_supplier_risk_alerts" ON "supplier_risk_alerts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierRiskFactor (supplier_risk_factors)
ALTER TABLE "supplier_risk_factors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_risk_factors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_risk_factors" ON "supplier_risk_factors";
CREATE POLICY "tenant_isolation_supplier_risk_factors" ON "supplier_risk_factors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierRiskProfile (supplier_risk_profiles)
ALTER TABLE "supplier_risk_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_risk_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_risk_profiles" ON "supplier_risk_profiles";
CREATE POLICY "tenant_isolation_supplier_risk_profiles" ON "supplier_risk_profiles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplierScorecard (supplier_scorecards)
ALTER TABLE "supplier_scorecards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supplier_scorecards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supplier_scorecards" ON "supplier_scorecards";
CREATE POLICY "tenant_isolation_supplier_scorecards" ON "supplier_scorecards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyChainBudgetLine (supply_chain_budget_lines)
ALTER TABLE "supply_chain_budget_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_chain_budget_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_chain_budget_lines" ON "supply_chain_budget_lines";
CREATE POLICY "tenant_isolation_supply_chain_budget_lines" ON "supply_chain_budget_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyChainBudget (supply_chain_budgets)
ALTER TABLE "supply_chain_budgets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_chain_budgets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_chain_budgets" ON "supply_chain_budgets";
CREATE POLICY "tenant_isolation_supply_chain_budgets" ON "supply_chain_budgets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyChainFinanceProgram (supply_chain_finance_programs)
ALTER TABLE "supply_chain_finance_programs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_chain_finance_programs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_chain_finance_programs" ON "supply_chain_finance_programs";
CREATE POLICY "tenant_isolation_supply_chain_finance_programs" ON "supply_chain_finance_programs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyChainRiskEvent (supply_chain_risk_events)
ALTER TABLE "supply_chain_risk_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_chain_risk_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_chain_risk_events" ON "supply_chain_risk_events";
CREATE POLICY "tenant_isolation_supply_chain_risk_events" ON "supply_chain_risk_events"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyPlanLine (supply_plan_lines)
ALTER TABLE "supply_plan_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_plan_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_plan_lines" ON "supply_plan_lines";
CREATE POLICY "tenant_isolation_supply_plan_lines" ON "supply_plan_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyPlanScenarioLine (supply_plan_scenario_lines)
ALTER TABLE "supply_plan_scenario_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_plan_scenario_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_plan_scenario_lines" ON "supply_plan_scenario_lines";
CREATE POLICY "tenant_isolation_supply_plan_scenario_lines" ON "supply_plan_scenario_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyPlanScenario (supply_plan_scenarios)
ALTER TABLE "supply_plan_scenarios" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_plan_scenarios" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_plan_scenarios" ON "supply_plan_scenarios";
CREATE POLICY "tenant_isolation_supply_plan_scenarios" ON "supply_plan_scenarios"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SupplyPlan (supply_plans)
ALTER TABLE "supply_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "supply_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_supply_plans" ON "supply_plans";
CREATE POLICY "tenant_isolation_supply_plans" ON "supply_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SurveyQuestion (survey_questions)
ALTER TABLE "survey_questions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "survey_questions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_survey_questions" ON "survey_questions";
CREATE POLICY "tenant_isolation_survey_questions" ON "survey_questions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SurveyResponse (survey_responses)
ALTER TABLE "survey_responses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "survey_responses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_survey_responses" ON "survey_responses";
CREATE POLICY "tenant_isolation_survey_responses" ON "survey_responses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SustainabilityTarget (sustainability_targets)
ALTER TABLE "sustainability_targets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "sustainability_targets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_sustainability_targets" ON "sustainability_targets";
CREATE POLICY "tenant_isolation_sustainability_targets" ON "sustainability_targets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SynonymDictionary (synonym_dictionaries)
ALTER TABLE "synonym_dictionaries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "synonym_dictionaries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_synonym_dictionaries" ON "synonym_dictionaries";
CREATE POLICY "tenant_isolation_synonym_dictionaries" ON "synonym_dictionaries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SystemAnnouncement (system_announcements)
ALTER TABLE "system_announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "system_announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_system_announcements" ON "system_announcements";
CREATE POLICY "tenant_isolation_system_announcements" ON "system_announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for SystemReport (system_reports)
ALTER TABLE "system_reports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "system_reports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_system_reports" ON "system_reports";
CREATE POLICY "tenant_isolation_system_reports" ON "system_reports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Task (tasks)
ALTER TABLE "tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tasks" ON "tasks";
CREATE POLICY "tenant_isolation_tasks" ON "tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxComponent (tax_components)
ALTER TABLE "tax_components" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_components" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_components" ON "tax_components";
CREATE POLICY "tenant_isolation_tax_components" ON "tax_components"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxExemptionCertificate (tax_exemption_certificates)
ALTER TABLE "tax_exemption_certificates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_exemption_certificates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_exemption_certificates" ON "tax_exemption_certificates";
CREATE POLICY "tenant_isolation_tax_exemption_certificates" ON "tax_exemption_certificates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxFiling (tax_filings)
ALTER TABLE "tax_filings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_filings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_filings" ON "tax_filings";
CREATE POLICY "tenant_isolation_tax_filings" ON "tax_filings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxJurisdiction (tax_jurisdictions)
ALTER TABLE "tax_jurisdictions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_jurisdictions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_jurisdictions" ON "tax_jurisdictions";
CREATE POLICY "tenant_isolation_tax_jurisdictions" ON "tax_jurisdictions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxProvisionDetail (tax_provision_details)
ALTER TABLE "tax_provision_details" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_provision_details" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_provision_details" ON "tax_provision_details";
CREATE POLICY "tenant_isolation_tax_provision_details" ON "tax_provision_details"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxProvisionRun (tax_provision_runs)
ALTER TABLE "tax_provision_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_provision_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_provision_runs" ON "tax_provision_runs";
CREATE POLICY "tenant_isolation_tax_provision_runs" ON "tax_provision_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxRate (tax_rates)
ALTER TABLE "tax_rates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_rates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_rates" ON "tax_rates";
CREATE POLICY "tenant_isolation_tax_rates" ON "tax_rates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxReconciliation (tax_reconciliations)
ALTER TABLE "tax_reconciliations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_reconciliations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_reconciliations" ON "tax_reconciliations";
CREATE POLICY "tenant_isolation_tax_reconciliations" ON "tax_reconciliations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxRule (tax_rules)
ALTER TABLE "tax_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_rules" ON "tax_rules";
CREATE POLICY "tenant_isolation_tax_rules" ON "tax_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TaxTable (tax_tables)
ALTER TABLE "tax_tables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tax_tables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tax_tables" ON "tax_tables";
CREATE POLICY "tenant_isolation_tax_tables" ON "tax_tables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TeamSplitMember (team_split_members)
ALTER TABLE "team_split_members" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "team_split_members" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_team_split_members" ON "team_split_members";
CREATE POLICY "tenant_isolation_team_split_members" ON "team_split_members"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TeamSplit (team_splits)
ALTER TABLE "team_splits" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "team_splits" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_team_splits" ON "team_splits";
CREATE POLICY "tenant_isolation_team_splits" ON "team_splits"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TemperatureExcursion (temperature_excursions)
ALTER TABLE "temperature_excursions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "temperature_excursions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_temperature_excursions" ON "temperature_excursions";
CREATE POLICY "tenant_isolation_temperature_excursions" ON "temperature_excursions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantAddOn (tenant_addons)
ALTER TABLE "tenant_addons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_addons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_addons" ON "tenant_addons";
CREATE POLICY "tenant_isolation_tenant_addons" ON "tenant_addons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantAnnouncement (tenant_announcements)
ALTER TABLE "tenant_announcements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_announcements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_announcements" ON "tenant_announcements";
CREATE POLICY "tenant_isolation_tenant_announcements" ON "tenant_announcements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantApiKey (tenant_api_keys)
ALTER TABLE "tenant_api_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_api_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_api_keys" ON "tenant_api_keys";
CREATE POLICY "tenant_isolation_tenant_api_keys" ON "tenant_api_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantAuditLog (tenant_audit_logs)
ALTER TABLE "tenant_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_audit_logs" ON "tenant_audit_logs";
CREATE POLICY "tenant_isolation_tenant_audit_logs" ON "tenant_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantBranding (tenant_branding)
ALTER TABLE "tenant_branding" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_branding" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_branding" ON "tenant_branding";
CREATE POLICY "tenant_isolation_tenant_branding" ON "tenant_branding"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantConsent (tenant_consents)
ALTER TABLE "tenant_consents" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_consents" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_consents" ON "tenant_consents";
CREATE POLICY "tenant_isolation_tenant_consents" ON "tenant_consents"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantDomain (tenant_domains)
ALTER TABLE "tenant_domains" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_domains" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_domains" ON "tenant_domains";
CREATE POLICY "tenant_isolation_tenant_domains" ON "tenant_domains"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantExtensionInstallation (tenant_extension_installations)
ALTER TABLE "tenant_extension_installations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_extension_installations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_extension_installations" ON "tenant_extension_installations";
CREATE POLICY "tenant_isolation_tenant_extension_installations" ON "tenant_extension_installations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantFeatureOverride (tenant_feature_overrides)
ALTER TABLE "tenant_feature_overrides" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_feature_overrides" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_feature_overrides" ON "tenant_feature_overrides";
CREATE POLICY "tenant_isolation_tenant_feature_overrides" ON "tenant_feature_overrides"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantLifecycleEvent (tenant_lifecycle_events)
ALTER TABLE "tenant_lifecycle_events" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_lifecycle_events" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_lifecycle_events" ON "tenant_lifecycle_events";
CREATE POLICY "tenant_isolation_tenant_lifecycle_events" ON "tenant_lifecycle_events"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for TenantProviderOverride (tenant_provider_overrides)
ALTER TABLE "tenant_provider_overrides" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_provider_overrides" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_provider_overrides" ON "tenant_provider_overrides";
CREATE POLICY "tenant_isolation_tenant_provider_overrides" ON "tenant_provider_overrides"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantSsoConfig (tenant_sso_configs)
ALTER TABLE "tenant_sso_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_sso_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_sso_configs" ON "tenant_sso_configs";
CREATE POLICY "tenant_isolation_tenant_sso_configs" ON "tenant_sso_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantSubscription (tenant_subscriptions)
ALTER TABLE "tenant_subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_subscriptions" ON "tenant_subscriptions";
CREATE POLICY "tenant_isolation_tenant_subscriptions" ON "tenant_subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantSupportTicket (tenant_support_tickets)
ALTER TABLE "tenant_support_tickets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_support_tickets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_support_tickets" ON "tenant_support_tickets";
CREATE POLICY "tenant_isolation_tenant_support_tickets" ON "tenant_support_tickets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantWebhookDelivery (tenant_webhook_deliveries)
ALTER TABLE "tenant_webhook_deliveries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_webhook_deliveries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_webhook_deliveries" ON "tenant_webhook_deliveries";
CREATE POLICY "tenant_isolation_tenant_webhook_deliveries" ON "tenant_webhook_deliveries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TenantWebhookEndpoint (tenant_webhook_endpoints)
ALTER TABLE "tenant_webhook_endpoints" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tenant_webhook_endpoints" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tenant_webhook_endpoints" ON "tenant_webhook_endpoints";
CREATE POLICY "tenant_isolation_tenant_webhook_endpoints" ON "tenant_webhook_endpoints"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryAssignmentLog (territory_assignment_logs)
ALTER TABLE "territory_assignment_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_assignment_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_assignment_logs" ON "territory_assignment_logs";
CREATE POLICY "tenant_isolation_territory_assignment_logs" ON "territory_assignment_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryAssignmentRule (territory_assignment_rules)
ALTER TABLE "territory_assignment_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_assignment_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_assignment_rules" ON "territory_assignment_rules";
CREATE POLICY "tenant_isolation_territory_assignment_rules" ON "territory_assignment_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryPlanAssignment (territory_plan_assignments)
ALTER TABLE "territory_plan_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_plan_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_plan_assignments" ON "territory_plan_assignments";
CREATE POLICY "tenant_isolation_territory_plan_assignments" ON "territory_plan_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryPlan (territory_plans)
ALTER TABLE "territory_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_plans" ON "territory_plans";
CREATE POLICY "tenant_isolation_territory_plans" ON "territory_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryRebalanceLog (territory_rebalance_logs)
ALTER TABLE "territory_rebalance_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_rebalance_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_rebalance_logs" ON "territory_rebalance_logs";
CREATE POLICY "tenant_isolation_territory_rebalance_logs" ON "territory_rebalance_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TerritoryRoundRobinState (territory_round_robin_states)
ALTER TABLE "territory_round_robin_states" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "territory_round_robin_states" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_territory_round_robin_states" ON "territory_round_robin_states";
CREATE POLICY "tenant_isolation_territory_round_robin_states" ON "territory_round_robin_states"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ThemeConfig (theme_configs)
ALTER TABLE "theme_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "theme_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_theme_configs" ON "theme_configs";
CREATE POLICY "tenant_isolation_theme_configs" ON "theme_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ThemeSnapshot (theme_snapshots)
ALTER TABLE "theme_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "theme_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_theme_snapshots" ON "theme_snapshots";
CREATE POLICY "tenant_isolation_theme_snapshots" ON "theme_snapshots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ThirdPartyConnector (third_party_connectors)
ALTER TABLE "third_party_connectors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "third_party_connectors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_third_party_connectors" ON "third_party_connectors";
CREATE POLICY "tenant_isolation_third_party_connectors" ON "third_party_connectors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TicketComment (ticket_comments)
ALTER TABLE "ticket_comments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ticket_comments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ticket_comments" ON "ticket_comments";
CREATE POLICY "tenant_isolation_ticket_comments" ON "ticket_comments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TicketSla (ticket_slas)
ALTER TABLE "ticket_slas" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ticket_slas" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_ticket_slas" ON "ticket_slas";
CREATE POLICY "tenant_isolation_ticket_slas" ON "ticket_slas"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TieredPricingTable (tiered_pricing_tables)
ALTER TABLE "tiered_pricing_tables" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tiered_pricing_tables" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tiered_pricing_tables" ON "tiered_pricing_tables";
CREATE POLICY "tenant_isolation_tiered_pricing_tables" ON "tiered_pricing_tables"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Timesheet (timesheets)
ALTER TABLE "timesheets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "timesheets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_timesheets" ON "timesheets";
CREATE POLICY "tenant_isolation_timesheets" ON "timesheets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TokenValue (token_values)
ALTER TABLE "token_values" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "token_values" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_token_values" ON "token_values";
CREATE POLICY "tenant_isolation_token_values" ON "token_values"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ToolingCalibration (tooling_calibrations)
ALTER TABLE "tooling_calibrations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tooling_calibrations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tooling_calibrations" ON "tooling_calibrations";
CREATE POLICY "tenant_isolation_tooling_calibrations" ON "tooling_calibrations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ToolingMaster (tooling_masters)
ALTER TABLE "tooling_masters" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tooling_masters" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tooling_masters" ON "tooling_masters";
CREATE POLICY "tenant_isolation_tooling_masters" ON "tooling_masters"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ToolingUsageLog (tooling_usage_logs)
ALTER TABLE "tooling_usage_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tooling_usage_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tooling_usage_logs" ON "tooling_usage_logs";
CREATE POLICY "tenant_isolation_tooling_usage_logs" ON "tooling_usage_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TotalRewardsStatement (total_rewards_statements)
ALTER TABLE "total_rewards_statements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "total_rewards_statements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_total_rewards_statements" ON "total_rewards_statements";
CREATE POLICY "tenant_isolation_total_rewards_statements" ON "total_rewards_statements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TpmAudit5S (tpm_audit_5s)
ALTER TABLE "tpm_audit_5s" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tpm_audit_5s" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tpm_audit_5s" ON "tpm_audit_5s";
CREATE POLICY "tenant_isolation_tpm_audit_5s" ON "tpm_audit_5s"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TpmKpi (tpm_kpis)
ALTER TABLE "tpm_kpis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tpm_kpis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tpm_kpis" ON "tpm_kpis";
CREATE POLICY "tenant_isolation_tpm_kpis" ON "tpm_kpis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TpmPillarActivity (tpm_pillar_activities)
ALTER TABLE "tpm_pillar_activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tpm_pillar_activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tpm_pillar_activities" ON "tpm_pillar_activities";
CREATE POLICY "tenant_isolation_tpm_pillar_activities" ON "tpm_pillar_activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TpmPillar (tpm_pillars)
ALTER TABLE "tpm_pillars" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "tpm_pillars" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_tpm_pillars" ON "tpm_pillars";
CREATE POLICY "tenant_isolation_tpm_pillars" ON "tpm_pillars"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TradeComplianceCheck (trade_compliance_checks)
ALTER TABLE "trade_compliance_checks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "trade_compliance_checks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_trade_compliance_checks" ON "trade_compliance_checks";
CREATE POLICY "tenant_isolation_trade_compliance_checks" ON "trade_compliance_checks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TradeComplianceScreening (trade_compliance_screenings)
ALTER TABLE "trade_compliance_screenings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "trade_compliance_screenings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_trade_compliance_screenings" ON "trade_compliance_screenings";
CREATE POLICY "tenant_isolation_trade_compliance_screenings" ON "trade_compliance_screenings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TrainingEnrollment (training_enrollments)
ALTER TABLE "training_enrollments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "training_enrollments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_training_enrollments" ON "training_enrollments";
CREATE POLICY "tenant_isolation_training_enrollments" ON "training_enrollments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Training (trainings)
ALTER TABLE "trainings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "trainings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_trainings" ON "trainings";
CREATE POLICY "tenant_isolation_trainings" ON "trainings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferApprovalRule (transfer_approval_rules)
ALTER TABLE "transfer_approval_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_approval_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_approval_rules" ON "transfer_approval_rules";
CREATE POLICY "tenant_isolation_transfer_approval_rules" ON "transfer_approval_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferOrderLine (transfer_order_lines)
ALTER TABLE "transfer_order_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_order_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_order_lines" ON "transfer_order_lines";
CREATE POLICY "tenant_isolation_transfer_order_lines" ON "transfer_order_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferOrderReceiptLine (transfer_order_receipt_lines)
ALTER TABLE "transfer_order_receipt_lines" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_order_receipt_lines" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_order_receipt_lines" ON "transfer_order_receipt_lines";
CREATE POLICY "tenant_isolation_transfer_order_receipt_lines" ON "transfer_order_receipt_lines"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferOrderReceipt (transfer_order_receipts)
ALTER TABLE "transfer_order_receipts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_order_receipts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_order_receipts" ON "transfer_order_receipts";
CREATE POLICY "tenant_isolation_transfer_order_receipts" ON "transfer_order_receipts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferOrder (transfer_orders)
ALTER TABLE "transfer_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_orders" ON "transfer_orders";
CREATE POLICY "tenant_isolation_transfer_orders" ON "transfer_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferPricingAdjustment (transfer_pricing_adjustments)
ALTER TABLE "transfer_pricing_adjustments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_pricing_adjustments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_pricing_adjustments" ON "transfer_pricing_adjustments";
CREATE POLICY "tenant_isolation_transfer_pricing_adjustments" ON "transfer_pricing_adjustments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransferPricingPolicy (transfer_pricing_policies)
ALTER TABLE "transfer_pricing_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transfer_pricing_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transfer_pricing_policies" ON "transfer_pricing_policies";
CREATE POLICY "tenant_isolation_transfer_pricing_policies" ON "transfer_pricing_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TranslationEntry (translation_entries)
ALTER TABLE "translation_entries" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "translation_entries" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_translation_entries" ON "translation_entries";
CREATE POLICY "tenant_isolation_translation_entries" ON "translation_entries"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TranslationImport (translation_imports)
ALTER TABLE "translation_imports" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "translation_imports" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_translation_imports" ON "translation_imports";
CREATE POLICY "tenant_isolation_translation_imports" ON "translation_imports"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TranslationKey (translation_keys)
ALTER TABLE "translation_keys" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "translation_keys" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_translation_keys" ON "translation_keys";
CREATE POLICY "tenant_isolation_translation_keys" ON "translation_keys"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TransportMode (transport_modes)
ALTER TABLE "transport_modes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "transport_modes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_transport_modes" ON "transport_modes";
CREATE POLICY "tenant_isolation_transport_modes" ON "transport_modes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TreasuryPosition (treasury_positions)
ALTER TABLE "treasury_positions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "treasury_positions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_treasury_positions" ON "treasury_positions";
CREATE POLICY "tenant_isolation_treasury_positions" ON "treasury_positions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TreasuryTransaction (treasury_transactions)
ALTER TABLE "treasury_transactions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "treasury_transactions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_treasury_transactions" ON "treasury_transactions";
CREATE POLICY "tenant_isolation_treasury_transactions" ON "treasury_transactions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for TurnoverPrediction (turnover_predictions)
ALTER TABLE "turnover_predictions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "turnover_predictions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_turnover_predictions" ON "turnover_predictions";
CREATE POLICY "tenant_isolation_turnover_predictions" ON "turnover_predictions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UncertainTaxPosition (uncertain_tax_positions)
ALTER TABLE "uncertain_tax_positions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "uncertain_tax_positions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_uncertain_tax_positions" ON "uncertain_tax_positions";
CREATE POLICY "tenant_isolation_uncertain_tax_positions" ON "uncertain_tax_positions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UnitOfMeasure (units_of_measure)
ALTER TABLE "units_of_measure" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "units_of_measure" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_units_of_measure" ON "units_of_measure";
CREATE POLICY "tenant_isolation_units_of_measure" ON "units_of_measure"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UoMConversion (uom_conversions)
ALTER TABLE "uom_conversions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "uom_conversions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_uom_conversions" ON "uom_conversions";
CREATE POLICY "tenant_isolation_uom_conversions" ON "uom_conversions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UpsellRule (upsell_rules)
ALTER TABLE "upsell_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "upsell_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_upsell_rules" ON "upsell_rules";
CREATE POLICY "tenant_isolation_upsell_rules" ON "upsell_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UsageAlertLog (usage_alert_logs)
ALTER TABLE "usage_alert_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "usage_alert_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_usage_alert_logs" ON "usage_alert_logs";
CREATE POLICY "tenant_isolation_usage_alert_logs" ON "usage_alert_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UsageAlertRule (usage_alert_rules)
ALTER TABLE "usage_alert_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "usage_alert_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_usage_alert_rules" ON "usage_alert_rules";
CREATE POLICY "tenant_isolation_usage_alert_rules" ON "usage_alert_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UsageRecord (usage_records)
ALTER TABLE "usage_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "usage_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_usage_records" ON "usage_records";
CREATE POLICY "tenant_isolation_usage_records" ON "usage_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserGroup (user_groups)
ALTER TABLE "user_groups" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_groups" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_groups" ON "user_groups";
CREATE POLICY "tenant_isolation_user_groups" ON "user_groups"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserIdentity (user_identities)
ALTER TABLE "user_identities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_identities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_identities" ON "user_identities";
CREATE POLICY "tenant_isolation_user_identities" ON "user_identities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserPresence (user_presence)
ALTER TABLE "user_presence" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_presence" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_presence" ON "user_presence";
CREATE POLICY "tenant_isolation_user_presence" ON "user_presence"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserProfile (user_profiles)
ALTER TABLE "user_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_profiles" ON "user_profiles";
CREATE POLICY "tenant_isolation_user_profiles" ON "user_profiles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserSession (user_sessions)
ALTER TABLE "user_sessions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_sessions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_sessions" ON "user_sessions";
CREATE POLICY "tenant_isolation_user_sessions" ON "user_sessions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for UserStatusSchedule (user_status_schedules)
ALTER TABLE "user_status_schedules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "user_status_schedules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_user_status_schedules" ON "user_status_schedules";
CREATE POLICY "tenant_isolation_user_status_schedules" ON "user_status_schedules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for User (users)
ALTER TABLE "users" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "users" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_users" ON "users";
CREATE POLICY "tenant_isolation_users" ON "users"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ValuationAllowanceAssessment (valuation_allowance_assessments)
ALTER TABLE "valuation_allowance_assessments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "valuation_allowance_assessments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_valuation_allowance_assessments" ON "valuation_allowance_assessments";
CREATE POLICY "tenant_isolation_valuation_allowance_assessments" ON "valuation_allowance_assessments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for ValueStreamMapItem (value_stream_map_items)
ALTER TABLE "value_stream_map_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "value_stream_map_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_value_stream_map_items" ON "value_stream_map_items";
CREATE POLICY "tenant_isolation_value_stream_map_items" ON "value_stream_map_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VarianceAlertConfig (variance_alert_configs)
ALTER TABLE "variance_alert_configs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "variance_alert_configs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_variance_alert_configs" ON "variance_alert_configs";
CREATE POLICY "tenant_isolation_variance_alert_configs" ON "variance_alert_configs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VarianceFlag (variance_flags)
ALTER TABLE "variance_flags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "variance_flags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_variance_flags" ON "variance_flags";
CREATE POLICY "tenant_isolation_variance_flags" ON "variance_flags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VariationOrder (variation_orders)
ALTER TABLE "variation_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "variation_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_variation_orders" ON "variation_orders";
CREATE POLICY "tenant_isolation_variation_orders" ON "variation_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VelocityClassificationItem (velocity_classification_items)
ALTER TABLE "velocity_classification_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "velocity_classification_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_velocity_classification_items" ON "velocity_classification_items";
CREATE POLICY "tenant_isolation_velocity_classification_items" ON "velocity_classification_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VelocityClassificationRun (velocity_classification_runs)
ALTER TABLE "velocity_classification_runs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "velocity_classification_runs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_velocity_classification_runs" ON "velocity_classification_runs";
CREATE POLICY "tenant_isolation_velocity_classification_runs" ON "velocity_classification_runs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VelocitySlottingPolicy (velocity_slotting_policies)
ALTER TABLE "velocity_slotting_policies" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "velocity_slotting_policies" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_velocity_slotting_policies" ON "velocity_slotting_policies";
CREATE POLICY "tenant_isolation_velocity_slotting_policies" ON "velocity_slotting_policies"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Vendor1099Profile (vendor_1099_profiles)
ALTER TABLE "vendor_1099_profiles" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_1099_profiles" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_1099_profiles" ON "vendor_1099_profiles";
CREATE POLICY "tenant_isolation_vendor_1099_profiles" ON "vendor_1099_profiles"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorBillLineItem (vendor_bill_line_items)
ALTER TABLE "vendor_bill_line_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_bill_line_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_bill_line_items" ON "vendor_bill_line_items";
CREATE POLICY "tenant_isolation_vendor_bill_line_items" ON "vendor_bill_line_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorBill (vendor_bills)
ALTER TABLE "vendor_bills" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_bills" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_bills" ON "vendor_bills";
CREATE POLICY "tenant_isolation_vendor_bills" ON "vendor_bills"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorItemAttribute (vendor_item_attributes)
ALTER TABLE "vendor_item_attributes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_item_attributes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_item_attributes" ON "vendor_item_attributes";
CREATE POLICY "tenant_isolation_vendor_item_attributes" ON "vendor_item_attributes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorPortalUser (vendor_portal_users)
ALTER TABLE "vendor_portal_users" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_portal_users" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_portal_users" ON "vendor_portal_users";
CREATE POLICY "tenant_isolation_vendor_portal_users" ON "vendor_portal_users"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorReturnShipment (vendor_return_shipments)
ALTER TABLE "vendor_return_shipments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_return_shipments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_return_shipments" ON "vendor_return_shipments";
CREATE POLICY "tenant_isolation_vendor_return_shipments" ON "vendor_return_shipments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorRiskAssessment (vendor_risk_assessments)
ALTER TABLE "vendor_risk_assessments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_risk_assessments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_risk_assessments" ON "vendor_risk_assessments";
CREATE POLICY "tenant_isolation_vendor_risk_assessments" ON "vendor_risk_assessments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorRmaRequest (vendor_rma_requests)
ALTER TABLE "vendor_rma_requests" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_rma_requests" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_rma_requests" ON "vendor_rma_requests";
CREATE POLICY "tenant_isolation_vendor_rma_requests" ON "vendor_rma_requests"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VendorStatement (vendor_statements)
ALTER TABLE "vendor_statements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendor_statements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendor_statements" ON "vendor_statements";
CREATE POLICY "tenant_isolation_vendor_statements" ON "vendor_statements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Vendor (vendors)
ALTER TABLE "vendors" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vendors" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vendors" ON "vendors";
CREATE POLICY "tenant_isolation_vendors" ON "vendors"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VideoCallParticipant (video_call_participants)
ALTER TABLE "video_call_participants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "video_call_participants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_video_call_participants" ON "video_call_participants";
CREATE POLICY "tenant_isolation_video_call_participants" ON "video_call_participants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VideoCallRoom (video_call_rooms)
ALTER TABLE "video_call_rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "video_call_rooms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_video_call_rooms" ON "video_call_rooms";
CREATE POLICY "tenant_isolation_video_call_rooms" ON "video_call_rooms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VideoRecording (video_recordings)
ALTER TABLE "video_recordings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "video_recordings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_video_recordings" ON "video_recordings";
CREATE POLICY "tenant_isolation_video_recordings" ON "video_recordings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VideoRoomParticipant (video_room_participants)
ALTER TABLE "video_room_participants" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "video_room_participants" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_video_room_participants" ON "video_room_participants";
CREATE POLICY "tenant_isolation_video_room_participants" ON "video_room_participants"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VideoRoom (video_rooms)
ALTER TABLE "video_rooms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "video_rooms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_video_rooms" ON "video_rooms";
CREATE POLICY "tenant_isolation_video_rooms" ON "video_rooms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VisaRecord (visa_records)
ALTER TABLE "visa_records" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "visa_records" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_visa_records" ON "visa_records";
CREATE POLICY "tenant_isolation_visa_records" ON "visa_records"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VmiAgreement (vmi_agreements)
ALTER TABLE "vmi_agreements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vmi_agreements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vmi_agreements" ON "vmi_agreements";
CREATE POLICY "tenant_isolation_vmi_agreements" ON "vmi_agreements"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for VmiOrder (vmi_orders)
ALTER TABLE "vmi_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vmi_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vmi_orders" ON "vmi_orders";
CREATE POLICY "tenant_isolation_vmi_orders" ON "vmi_orders"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for VmiStockSnapshot (vmi_stock_snapshots)
ALTER TABLE "vmi_stock_snapshots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "vmi_stock_snapshots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_vmi_stock_snapshots" ON "vmi_stock_snapshots";
CREATE POLICY "tenant_isolation_vmi_stock_snapshots" ON "vmi_stock_snapshots"
  FOR ALL
  USING ("tenantId" = current_tenant_id())
  WITH CHECK ("tenantId" = current_tenant_id());

-- RLS Policy for Voicemail (voicemails)
ALTER TABLE "voicemails" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "voicemails" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_voicemails" ON "voicemails";
CREATE POLICY "tenant_isolation_voicemails" ON "voicemails"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VoipCallAnalytics (voip_call_analytics)
ALTER TABLE "voip_call_analytics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "voip_call_analytics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_voip_call_analytics" ON "voip_call_analytics";
CREATE POLICY "tenant_isolation_voip_call_analytics" ON "voip_call_analytics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for VoipCall (voip_calls)
ALTER TABLE "voip_calls" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "voip_calls" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_voip_calls" ON "voip_calls";
CREATE POLICY "tenant_isolation_voip_calls" ON "voip_calls"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WarehouseKpi (warehouse_kpis)
ALTER TABLE "warehouse_kpis" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouse_kpis" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouse_kpis" ON "warehouse_kpis";
CREATE POLICY "tenant_isolation_warehouse_kpis" ON "warehouse_kpis"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WarehouseNetworkDesign (warehouse_network_designs)
ALTER TABLE "warehouse_network_designs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouse_network_designs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouse_network_designs" ON "warehouse_network_designs";
CREATE POLICY "tenant_isolation_warehouse_network_designs" ON "warehouse_network_designs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WarehouseNetworkNode (warehouse_network_nodes)
ALTER TABLE "warehouse_network_nodes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouse_network_nodes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouse_network_nodes" ON "warehouse_network_nodes";
CREATE POLICY "tenant_isolation_warehouse_network_nodes" ON "warehouse_network_nodes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WarehouseShiftTemplate (warehouse_shift_templates)
ALTER TABLE "warehouse_shift_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouse_shift_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouse_shift_templates" ON "warehouse_shift_templates";
CREATE POLICY "tenant_isolation_warehouse_shift_templates" ON "warehouse_shift_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WarehouseTask (warehouse_tasks)
ALTER TABLE "warehouse_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouse_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouse_tasks" ON "warehouse_tasks";
CREATE POLICY "tenant_isolation_warehouse_tasks" ON "warehouse_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Warehouse (warehouses)
ALTER TABLE "warehouses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "warehouses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_warehouses" ON "warehouses";
CREATE POLICY "tenant_isolation_warehouses" ON "warehouses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WasteLog (waste_logs)
ALTER TABLE "waste_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "waste_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_waste_logs" ON "waste_logs";
CREATE POLICY "tenant_isolation_waste_logs" ON "waste_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WavePlanTask (wave_plan_tasks)
ALTER TABLE "wave_plan_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wave_plan_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wave_plan_tasks" ON "wave_plan_tasks";
CREATE POLICY "tenant_isolation_wave_plan_tasks" ON "wave_plan_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WavePlan (wave_plans)
ALTER TABLE "wave_plans" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wave_plans" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wave_plans" ON "wave_plans";
CREATE POLICY "tenant_isolation_wave_plans" ON "wave_plans"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebAsset (web_assets)
ALTER TABLE "web_assets" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_assets" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_assets" ON "web_assets";
CREATE POLICY "tenant_isolation_web_assets" ON "web_assets"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebChatbot (web_chatbots)
ALTER TABLE "web_chatbots" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_chatbots" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_chatbots" ON "web_chatbots";
CREATE POLICY "tenant_isolation_web_chatbots" ON "web_chatbots"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebCollectionItem (web_collection_items)
ALTER TABLE "web_collection_items" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_collection_items" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_collection_items" ON "web_collection_items";
CREATE POLICY "tenant_isolation_web_collection_items" ON "web_collection_items"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebCollection (web_collections)
ALTER TABLE "web_collections" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_collections" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_collections" ON "web_collections";
CREATE POLICY "tenant_isolation_web_collections" ON "web_collections"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebFormSubmission (web_form_submissions)
ALTER TABLE "web_form_submissions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_form_submissions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_form_submissions" ON "web_form_submissions";
CREATE POLICY "tenant_isolation_web_form_submissions" ON "web_form_submissions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebMenu (web_menus)
ALTER TABLE "web_menus" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_menus" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_menus" ON "web_menus";
CREATE POLICY "tenant_isolation_web_menus" ON "web_menus"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebOrder (web_orders)
ALTER TABLE "web_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_orders" ON "web_orders";
CREATE POLICY "tenant_isolation_web_orders" ON "web_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebPage (web_pages)
ALTER TABLE "web_pages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_pages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_pages" ON "web_pages";
CREATE POLICY "tenant_isolation_web_pages" ON "web_pages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebSeo (web_seo)
ALTER TABLE "web_seo" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_seo" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_seo" ON "web_seo";
CREATE POLICY "tenant_isolation_web_seo" ON "web_seo"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebSettings (web_settings)
ALTER TABLE "web_settings" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_settings" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_settings" ON "web_settings";
CREATE POLICY "tenant_isolation_web_settings" ON "web_settings"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebSitePage (web_site_pages)
ALTER TABLE "web_site_pages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_site_pages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_site_pages" ON "web_site_pages";
CREATE POLICY "tenant_isolation_web_site_pages" ON "web_site_pages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebSite (web_sites)
ALTER TABLE "web_sites" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_sites" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_sites" ON "web_sites";
CREATE POLICY "tenant_isolation_web_sites" ON "web_sites"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebTemplate (web_templates)
ALTER TABLE "web_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_templates" ON "web_templates";
CREATE POLICY "tenant_isolation_web_templates" ON "web_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebToLeadForm (web_to_lead_forms)
ALTER TABLE "web_to_lead_forms" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "web_to_lead_forms" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_web_to_lead_forms" ON "web_to_lead_forms";
CREATE POLICY "tenant_isolation_web_to_lead_forms" ON "web_to_lead_forms"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebhookDeliveryLog (webhook_delivery_logs)
ALTER TABLE "webhook_delivery_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "webhook_delivery_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_webhook_delivery_logs" ON "webhook_delivery_logs";
CREATE POLICY "tenant_isolation_webhook_delivery_logs" ON "webhook_delivery_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WebhookSubscription (webhook_subscriptions)
ALTER TABLE "webhook_subscriptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "webhook_subscriptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_webhook_subscriptions" ON "webhook_subscriptions";
CREATE POLICY "tenant_isolation_webhook_subscriptions" ON "webhook_subscriptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WellnessActivity (wellness_activities)
ALTER TABLE "wellness_activities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wellness_activities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wellness_activities" ON "wellness_activities";
CREATE POLICY "tenant_isolation_wellness_activities" ON "wellness_activities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WellnessChallenge (wellness_challenges)
ALTER TABLE "wellness_challenges" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wellness_challenges" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wellness_challenges" ON "wellness_challenges";
CREATE POLICY "tenant_isolation_wellness_challenges" ON "wellness_challenges"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WellnessLeaderboard (wellness_leaderboards)
ALTER TABLE "wellness_leaderboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wellness_leaderboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wellness_leaderboards" ON "wellness_leaderboards";
CREATE POLICY "tenant_isolation_wellness_leaderboards" ON "wellness_leaderboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WhiteboardElement (whiteboard_elements)
ALTER TABLE "whiteboard_elements" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "whiteboard_elements" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_whiteboard_elements" ON "whiteboard_elements";
CREATE POLICY "tenant_isolation_whiteboard_elements" ON "whiteboard_elements"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Whiteboard (whiteboards)
ALTER TABLE "whiteboards" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "whiteboards" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_whiteboards" ON "whiteboards";
CREATE POLICY "tenant_isolation_whiteboards" ON "whiteboards"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WikiPageVersion (wiki_page_versions)
ALTER TABLE "wiki_page_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wiki_page_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wiki_page_versions" ON "wiki_page_versions";
CREATE POLICY "tenant_isolation_wiki_page_versions" ON "wiki_page_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WikiPage (wiki_pages)
ALTER TABLE "wiki_pages" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wiki_pages" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wiki_pages" ON "wiki_pages";
CREATE POLICY "tenant_isolation_wiki_pages" ON "wiki_pages"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WikiSpace (wiki_spaces)
ALTER TABLE "wiki_spaces" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "wiki_spaces" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_wiki_spaces" ON "wiki_spaces";
CREATE POLICY "tenant_isolation_wiki_spaces" ON "wiki_spaces"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WinLossReason (win_loss_reasons)
ALTER TABLE "win_loss_reasons" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "win_loss_reasons" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_win_loss_reasons" ON "win_loss_reasons";
CREATE POLICY "tenant_isolation_win_loss_reasons" ON "win_loss_reasons"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WithholdingCertificate (withholding_certificates)
ALTER TABLE "withholding_certificates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "withholding_certificates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_withholding_certificates" ON "withholding_certificates";
CREATE POLICY "tenant_isolation_withholding_certificates" ON "withholding_certificates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WithholdingTax (withholding_taxes)
ALTER TABLE "withholding_taxes" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "withholding_taxes" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_withholding_taxes" ON "withholding_taxes";
CREATE POLICY "tenant_isolation_withholding_taxes" ON "withholding_taxes"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkCenterCapacity (work_center_capacities)
ALTER TABLE "work_center_capacities" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "work_center_capacities" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_work_center_capacities" ON "work_center_capacities";
CREATE POLICY "tenant_isolation_work_center_capacities" ON "work_center_capacities"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkOrderComponentConsumption (work_order_component_consumptions)
ALTER TABLE "work_order_component_consumptions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "work_order_component_consumptions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_work_order_component_consumptions" ON "work_order_component_consumptions";
CREATE POLICY "tenant_isolation_work_order_component_consumptions" ON "work_order_component_consumptions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkOrderOperation (work_order_operations)
ALTER TABLE "work_order_operations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "work_order_operations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_work_order_operations" ON "work_order_operations";
CREATE POLICY "tenant_isolation_work_order_operations" ON "work_order_operations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkOrder (work_orders)
ALTER TABLE "work_orders" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "work_orders" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_work_orders" ON "work_orders";
CREATE POLICY "tenant_isolation_work_orders" ON "work_orders"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkerTaskLog (worker_task_logs)
ALTER TABLE "worker_task_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "worker_task_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_worker_task_logs" ON "worker_task_logs";
CREATE POLICY "tenant_isolation_worker_task_logs" ON "worker_task_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowAuditLog (workflow_audit_logs)
ALTER TABLE "workflow_audit_logs" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_audit_logs" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_audit_logs" ON "workflow_audit_logs";
CREATE POLICY "tenant_isolation_workflow_audit_logs" ON "workflow_audit_logs"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowCategory (workflow_categories)
ALTER TABLE "workflow_categories" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_categories" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_categories" ON "workflow_categories";
CREATE POLICY "tenant_isolation_workflow_categories" ON "workflow_categories"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowCondition (workflow_conditions)
ALTER TABLE "workflow_conditions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_conditions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_conditions" ON "workflow_conditions";
CREATE POLICY "tenant_isolation_workflow_conditions" ON "workflow_conditions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowDefinitionStep (workflow_definition_steps)
ALTER TABLE "workflow_definition_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_definition_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_definition_steps" ON "workflow_definition_steps";
CREATE POLICY "tenant_isolation_workflow_definition_steps" ON "workflow_definition_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowDefinition (workflow_definitions)
ALTER TABLE "workflow_definitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_definitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_definitions" ON "workflow_definitions";
CREATE POLICY "tenant_isolation_workflow_definitions" ON "workflow_definitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowErrorHandler (workflow_error_handlers)
ALTER TABLE "workflow_error_handlers" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_error_handlers" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_error_handlers" ON "workflow_error_handlers";
CREATE POLICY "tenant_isolation_workflow_error_handlers" ON "workflow_error_handlers"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowEscalationRule (workflow_escalation_rules)
ALTER TABLE "workflow_escalation_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_escalation_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_escalation_rules" ON "workflow_escalation_rules";
CREATE POLICY "tenant_isolation_workflow_escalation_rules" ON "workflow_escalation_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowExecution (workflow_executions)
ALTER TABLE "workflow_executions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_executions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_executions" ON "workflow_executions";
CREATE POLICY "tenant_isolation_workflow_executions" ON "workflow_executions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowLoop (workflow_loops)
ALTER TABLE "workflow_loops" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_loops" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_loops" ON "workflow_loops";
CREATE POLICY "tenant_isolation_workflow_loops" ON "workflow_loops"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowMetric (workflow_metrics)
ALTER TABLE "workflow_metrics" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_metrics" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_metrics" ON "workflow_metrics";
CREATE POLICY "tenant_isolation_workflow_metrics" ON "workflow_metrics"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowNotification (workflow_notifications)
ALTER TABLE "workflow_notifications" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_notifications" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_notifications" ON "workflow_notifications";
CREATE POLICY "tenant_isolation_workflow_notifications" ON "workflow_notifications"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowSlaRule (workflow_sla_rules)
ALTER TABLE "workflow_sla_rules" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_sla_rules" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_sla_rules" ON "workflow_sla_rules";
CREATE POLICY "tenant_isolation_workflow_sla_rules" ON "workflow_sla_rules"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowStep (workflow_steps)
ALTER TABLE "workflow_steps" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_steps" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_steps" ON "workflow_steps";
CREATE POLICY "tenant_isolation_workflow_steps" ON "workflow_steps"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowSubprocess (workflow_subprocesses)
ALTER TABLE "workflow_subprocesses" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_subprocesses" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_subprocesses" ON "workflow_subprocesses";
CREATE POLICY "tenant_isolation_workflow_subprocesses" ON "workflow_subprocesses"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowTagAssignment (workflow_tag_assignments)
ALTER TABLE "workflow_tag_assignments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_tag_assignments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_tag_assignments" ON "workflow_tag_assignments";
CREATE POLICY "tenant_isolation_workflow_tag_assignments" ON "workflow_tag_assignments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowTag (workflow_tags)
ALTER TABLE "workflow_tags" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_tags" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_tags" ON "workflow_tags";
CREATE POLICY "tenant_isolation_workflow_tags" ON "workflow_tags"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowTask (workflow_tasks)
ALTER TABLE "workflow_tasks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_tasks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_tasks" ON "workflow_tasks";
CREATE POLICY "tenant_isolation_workflow_tasks" ON "workflow_tasks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowTemplate (workflow_templates)
ALTER TABLE "workflow_templates" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_templates" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_templates" ON "workflow_templates";
CREATE POLICY "tenant_isolation_workflow_templates" ON "workflow_templates"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowTransition (workflow_transitions)
ALTER TABLE "workflow_transitions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_transitions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_transitions" ON "workflow_transitions";
CREATE POLICY "tenant_isolation_workflow_transitions" ON "workflow_transitions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowVersion (workflow_versions)
ALTER TABLE "workflow_versions" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_versions" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_versions" ON "workflow_versions";
CREATE POLICY "tenant_isolation_workflow_versions" ON "workflow_versions"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkflowWebhook (workflow_webhooks)
ALTER TABLE "workflow_webhooks" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflow_webhooks" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflow_webhooks" ON "workflow_webhooks";
CREATE POLICY "tenant_isolation_workflow_webhooks" ON "workflow_webhooks"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Workflow (workflows)
ALTER TABLE "workflows" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workflows" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workflows" ON "workflows";
CREATE POLICY "tenant_isolation_workflows" ON "workflows"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for WorkstationShift (workstation_shifts)
ALTER TABLE "workstation_shifts" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workstation_shifts" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workstation_shifts" ON "workstation_shifts";
CREATE POLICY "tenant_isolation_workstation_shifts" ON "workstation_shifts"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for Workstation (workstations)
ALTER TABLE "workstations" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "workstations" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_workstations" ON "workstations";
CREATE POLICY "tenant_isolation_workstations" ON "workstations"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for YardAppointment (yard_appointments)
ALTER TABLE "yard_appointments" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "yard_appointments" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_yard_appointments" ON "yard_appointments";
CREATE POLICY "tenant_isolation_yard_appointments" ON "yard_appointments"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for YardInventory (yard_inventory)
ALTER TABLE "yard_inventory" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "yard_inventory" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_yard_inventory" ON "yard_inventory";
CREATE POLICY "tenant_isolation_yard_inventory" ON "yard_inventory"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());

-- RLS Policy for YardMove (yard_moves)
ALTER TABLE "yard_moves" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "yard_moves" FORCE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "tenant_isolation_yard_moves" ON "yard_moves";
CREATE POLICY "tenant_isolation_yard_moves" ON "yard_moves"
  FOR ALL
  USING ("tenant_id" = current_tenant_id())
  WITH CHECK ("tenant_id" = current_tenant_id());
