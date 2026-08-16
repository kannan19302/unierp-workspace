# 09 — Database Schema, Prisma Models & Tenant Isolation Catalogue

## 🗄️ Repository: `data` (`@kannan19302/data`)
- **Total Schema Files**: **43 multi-file Prisma schemas**
- **Total Prisma Models**: **1910 database models**
- **Total Enums**: **65 enums**
- **Database Engine**: PostgreSQL 16+ with Row-Level Security (RLS).
- **Core Isolation Rule**: 100% of tenant-scoped tables carry `tenantId` + PostgreSQL RLS policies applied via `setup-rls.sql` during migrations.

---

## 📑 43 Schema Files Directory

| Schema File | Models Count | Enums Count | Sample Models Included |
| :--- | :--- | :--- | :--- |
| [`core-part-13.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-13.prisma) | 130 models | 0 enums | `EmailInbox`, `EmailMessage`, `EmailRule`... |
| [`core-part-3.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-3.prisma) | 118 models | 0 enums | `OnboardingChecklist`, `OnboardingItem`, `OffboardingChecklist`... |
| [`core-part-12.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-12.prisma) | 113 models | 0 enums | `AnomalyDetectionResult`, `SmartGlCodingSuggestion`, `PricingRule`... |
| [`core-part-5.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-5.prisma) | 113 models | 0 enums | `CustomerTag`, `CustomerTagLink`, `SalesTarget`... |
| [`core-part-14.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-14.prisma) | 112 models | 0 enums | `DeploymentStage`, `Environment`, `EnvironmentConfig`... |
| [`core-part-11.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-11.prisma) | 108 models | 0 enums | `ValueStreamMapItem`, `TpmPillar`, `TpmPillarActivity`... |
| [`core-part-4.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-4.prisma) | 107 models | 0 enums | `TenantWebhookEndpoint`, `TenantWebhookDelivery`, `TenantAnnouncement`... |
| [`core-part-10.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-10.prisma) | 106 models | 0 enums | `EcommerceProductVariant`, `EcommerceInventory`, `EcommerceCart`... |
| [`core-part-2.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-2.prisma) | 104 models | 0 enums | `TicketComment`, `CannedResponse`, `TicketSla`... |
| [`core-part-6.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-6.prisma) | 104 models | 0 enums | `FixedAssetAuditLog`, `DuplicateRule`, `PipelineStage`... |
| [`core-part-1.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-1.prisma) | 97 models | 0 enums | `Tenant`, `TenantLifecycleEvent`, `SavedView`... |
| [`core-part-8.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-8.prisma) | 89 models | 16 enums | `VmiAgreement`, `VmiStockSnapshot`, `VmiOrder`... |
| [`core-part-9.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-9.prisma) | 82 models | 0 enums | `NpsSurvey`, `NpsResponse`, `NpsAnalytic`... |
| [`core-part-7.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-7.prisma) | 79 models | 46 enums | `CapaAction`, `CalibrationRecord`, `DeviationRecord`... |
| [`crm.prisma`](file:///d:/UniERP/data/prisma/schema/crm.prisma) | 66 models | 0 enums | `LeadSource`, `Lead`, `Opportunity`... |
| [`projects.prisma`](file:///d:/UniERP/data/prisma/schema/projects.prisma) | 46 models | 0 enums | `Product`, `Project`, `ProjectPortfolio`... |
| [`hr.prisma`](file:///d:/UniERP/data/prisma/schema/hr.prisma) | 36 models | 0 enums | `Employee`, `EmployeeDocument`, `EmployeeSkill`... |
| [`inventory.prisma`](file:///d:/UniERP/data/prisma/schema/inventory.prisma) | 31 models | 2 enums | `Warehouse`, `InventoryItem`, `InventoryItemBin`... |
| [`finance.prisma`](file:///d:/UniERP/data/prisma/schema/finance.prisma) | 29 models | 0 enums | `AccountPlan`, `Invoice`, `InvoiceLineItem`... |
| [`core-part-15.prisma`](file:///d:/UniERP/data/prisma/schema/core-part-15.prisma) | 27 models | 0 enums | `DocumentRecentItem`, `DocumentWatermark`, `StorageEncryption`... |
| [`field-service.prisma`](file:///d:/UniERP/data/prisma/schema/field-service.prisma) | 26 models | 0 enums | `WorkOrder`, `WorkOrderOperation`, `WorkOrderComponentConsumption`... |
| [`healthcare.prisma`](file:///d:/UniERP/data/prisma/schema/healthcare.prisma) | 24 models | 1 enums | `HealthScoreConfig`, `AppointmentSchedule`, `HealthcarePatient`... |
| [`real-estate.prisma`](file:///d:/UniERP/data/prisma/schema/real-estate.prisma) | 23 models | 0 enums | `LeaseSchedule`, `UnitOfMeasure`, `ProposalDocument`... |
| [`education.prisma`](file:///d:/UniERP/data/prisma/schema/education.prisma) | 22 models | 0 enums | `EducationStudent`, `EducationCourse`, `EducationFeeStructure`... |
| [`provider-registry.prisma`](file:///d:/UniERP/data/prisma/schema/provider-registry.prisma) | 20 models | 0 enums | `Provider`, `ProviderBinding`, `ProviderCredential`... |
| [`web.prisma`](file:///d:/UniERP/data/prisma/schema/web.prisma) | 17 models | 0 enums | `WebhookSubscription`, `WebhookDeliveryLog`, `WebPage`... |
| [`pos.prisma`](file:///d:/UniERP/data/prisma/schema/pos.prisma) | 16 models | 0 enums | `Position`, `PosShiftCashDrawer`, `PosShiftTransaction`... |
| [`resource-model.prisma`](file:///d:/UniERP/data/prisma/schema/resource-model.prisma) | 15 models | 0 enums | `ResourceKind`, `Resource`, `DesiredState`... |
| [`ai-governance.prisma`](file:///d:/UniERP/data/prisma/schema/ai-governance.prisma) | 10 models | 0 enums | `AiProviderModel`, `AiPromptVersion`, `AiMcpServer`... |
| [`manufacturing.prisma`](file:///d:/UniERP/data/prisma/schema/manufacturing.prisma) | 8 models | 0 enums | `RoutingRule`, `WorkCenterCapacity`, `MfgSpcChart`... |
| [`operation-pipeline.prisma`](file:///d:/UniERP/data/prisma/schema/operation-pipeline.prisma) | 7 models | 0 enums | `BlackoutPeriod`, `Job`, `PlatformBulkOperation`... |
| [`catalogue.prisma`](file:///d:/UniERP/data/prisma/schema/catalogue.prisma) | 4 models | 0 enums | `CatalogueProduct`, `CatalogueSuite`, `CatalogueSuiteItem`... |
| [`compliance.prisma`](file:///d:/UniERP/data/prisma/schema/compliance.prisma) | 3 models | 0 enums | `ComplianceControl`, `ComplianceControlEvaluation`, `ComplianceEvidence` |
| [`org-structure.prisma`](file:///d:/UniERP/data/prisma/schema/org-structure.prisma) | 3 models | 0 enums | `OrgUnit`, `OrgPosition`, `ApprovalRouting` |
| [`custom-objects.prisma`](file:///d:/UniERP/data/prisma/schema/custom-objects.prisma) | 2 models | 0 enums | `CustomObjectDefinition`, `CustomObjectFieldDefinition` |
| [`extensions.prisma`](file:///d:/UniERP/data/prisma/schema/extensions.prisma) | 2 models | 0 enums | `TenantExtensionInstallation`, `ExtensionInvocationUsage` |
| [`marketplace-payouts.prisma`](file:///d:/UniERP/data/prisma/schema/marketplace-payouts.prisma) | 2 models | 0 enums | `MarketplaceEarning`, `MarketplacePayoutBatch` |
| [`policy-engine.prisma`](file:///d:/UniERP/data/prisma/schema/policy-engine.prisma) | 2 models | 0 enums | `Policy`, `PolicyOverride` |
| [`runbooks.prisma`](file:///d:/UniERP/data/prisma/schema/runbooks.prisma) | 2 models | 0 enums | `Runbook`, `RunbookExecution` |
| [`saas-portal.prisma`](file:///d:/UniERP/data/prisma/schema/saas-portal.prisma) | 2 models | 0 enums | `DataBreach`, `DataBreachTimeline` |
| [`workflow-runtime.prisma`](file:///d:/UniERP/data/prisma/schema/workflow-runtime.prisma) | 2 models | 0 enums | `BuilderWorkflowRun`, `BuilderWorkflowRunStep` |
| [`reconciler.prisma`](file:///d:/UniERP/data/prisma/schema/reconciler.prisma) | 1 models | 0 enums | `ReconciliationHold` |
| [`config.prisma`](file:///d:/UniERP/data/prisma/schema/config.prisma) | 0 models | 0 enums |  |

---

## 🔍 Granular Model Inventory by Schema File

### 📄 Schema: `core-part-13.prisma` (130 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`EmailInbox`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, emailAddress, provider, config, userId, isShared` |
| **`EmailMessage`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, inboxId, messageId, threadId, subject, fromAddress, fromName` |
| **`EmailRule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, inboxId, name, conditions, actions, isActive, priority` |
| **`VideoRoom`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomCode, title, hostId, scheduledAt, duration, maxParticipants` |
| **`VideoRoomParticipant`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomId, userId, displayName, role, joinedAt, leftAt` |
| **`VideoRecording`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomId, fileName, fileSize, duration, format, status` |
| **`WikiSpace`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, icon, isPublic, ownerId` |
| **`WikiPage`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, spaceId, parentId, title, slug, content, contentFormat` |
| **`WikiPageVersion`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, pageId, version, title, content, editedBy, changeSummary` |
| **`ChatChannel`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, channelType, teamId, projectId` |
| **`ChatChannelMember`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, userId, role, isMuted, lastReadAt, joinedAt` |
| **`IntranetPost`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, authorId, content, mediaUrls, linkPreview, visibility, tags` |
| **`IntranetComment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, postId, parentId, authorId, content, mentions, likeCount` |
| **`IntranetReaction`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, postId, userId, emoji, createdAt, post` |
| **`InternalSurvey`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, surveyType, questions, settings, targetAudience` |
| **`InternalSurveyAnswer`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, userId, answers, completedAt, score, survey` |
| **`CompanyEvent`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, eventType, organizer, location, virtualLink` |
| **`EventRsvp`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventId, userId, status, attendees, notes, respondedAt` |
| **`CommRetentionPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, scope, retentionDays, deleteAfter, legalBasis` |
| **`LegalHold`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, matter, custodians, startDate, endDate` |
| **`PhoneExtension`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, extension, userId, displayName, phoneNumber, pbxServer, isActive` |
| **`PhoneCallLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, extensionId, direction, fromNumber, toNumber, duration, status` |
| **`CommWebhook`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, url, events, secret, isActive, failCount` |
| **`CommAnalyticsReport`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportType, period, metrics, insights, createdAt` |
| **`BuilderDataModel`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, displayName, description, tableName, module, icon` |
| **`BuilderDataField`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelId, name, displayName, fieldType, isRequired, isUnique` |
| **`BuilderRelationship`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromModelId, toModelId, relationshipType, fieldName, foreignKey, throughModel` |
| **`BuilderDataView`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelId, name, viewType, columns, filters, sortBy` |
| **`BusinessRule`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, ruleType, entityType, triggerEvent, conditions` |
| **`BusinessRuleExecution`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleId, entityId, status, result, error, duration` |
| **`BuilderScript`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, scriptType, language, code, isActive` |
| **`CalculatedField`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelId, formId, name, displayName, formula, returnType` |
| **`IntegrationConnector`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, connectorType, baseUrl, authType, credentials` |
| **`Integration`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, connectorId, name, description, direction, sourceEntity, targetEndpoint` |
| **`IntegrationLog`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, integrationId, status, recordsProcessed, recordsFailed, duration, error` |
| **`BuilderTemplate`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, industry, templateType, content` |
| **`BuilderPermissionRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, ruleType, scope, targetField, condition` |
| **`BuilderDocumentTemplate`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, templateType, content, variables, settings` |
| **`BuilderDocumentRender`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, variables, outputFormat, fileUrl, status, renderedAt` |
| **`BuilderApi`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, method, path, authentication, authorization` |
| **`BuilderTheme`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, isDefault, primaryColor, secondaryColor, accentColor, backgroundColor` |
| **`BuilderEnvironment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, envType, description, settings, isActive, createdAt` |
| **`BuilderDeployment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, environmentId, version, changeSummary, artifacts, status, deployedBy` |
| **`MarketplacePackage`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, displayName, description, category, tags, version` |
| **`BuilderAnalyticsEvent`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, sessionId, userId, eventType, entityType, entityId, properties` |
| **`BuilderUsageMetric`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, metricType, value, period, recordedAt` |
| **`ChatbotDefinition`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, avatarUrl, greeting, nluProvider, language` |
| **`ChatbotIntent`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, botId, name, trainingPhrases, responses, action, entities` |
| **`ChatbotConversation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, botId, sessionId, userId, messages, resolved, handedOff` |
| **`EventDefinition`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, eventCode, description, entityType, payload, isSystemEvent` |
| **`EventTrigger`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventDefinitionId, name, triggerType, conditions, actions, isActive` |
| **`ScheduledJob`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, cronExpression, action, isActive, lastRunAt` |
| **`ReportDefinition`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, reportType, dataSource, query, columns` |
| **`ReportRun`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, status, rowCount, fileUrl, format, duration` |
| **`DashboardDefinition`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, layout, filters, autoRefresh, isPublic` |
| **`DashboardWidget`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, dashboardId, widgetType, title, dataSource, query, chartType` |
| **`CustomerSuccessPlan`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, name, status, healthScore, arr, nrrTarget` |
| **`CustomerSuccessMilestone`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, title, description, status, dueDate, completionDate` |
| **`SalesPlaybookDeep`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, stage, targetRole, isTemplate, isActive` |
| **`SalesPlaybookStepDeep`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, playbookId, stepOrder, title, instruction, requiredArtifactType, checklist` |
| **`SalesIntelligenceSignal`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, opportunityId, signalType, severity, source, headline` |
| **`SalesDocumentTemplate`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, content, variables, isDefault, isActive` |
| **`SalesDocumentGeneration`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, customerId, opportunityId, title, status, documentUrl` |
| **`SalesReturnOrderDeep`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, returnNumber, orderId, customerId, status, reason, totalRefundAmount` |
| **`SalesGamificationDeep`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, metric, leaderboards, streakData, badgeAwards, createdAt` |
| **`SalesQuotaAttainment`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, salesRepId, period, quotaAmount, achievedAmount, attainmentPct, commissionEarned` |
| **`SaasTenantTierConfig`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, tierName, maxUsers, maxStorageGb, maxApiReqPerMin, slaTier, features` |
| **`SaasTenantCustomQuota`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, resourceKey, quotaLimit, warningThresholdBigInt, softEnforce, effectiveFrom, effectiveTo` |
| **`SaasMeteringRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, metricCode, unitPrice, currency, aggregationType, freeTierAllowance, createdAt` |
| **`SaasUsageEventBatch`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchRef, eventCount, processedCount, status, payload, processedAt` |
| **`SaasMultiTenantCluster`** | 10 fields | 🌐 Global / Reference | `id, clusterName, region, provider, status, maxTenants, activeTenants, endpoint` |
| **`SaasTenantNodeRouting`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, clusterId, nodeGroup, databaseHost, redisHost, isDedicated, weight` |
| **`SaasWhiteLabelDomain`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, customDomain, cnameTarget, verificationToken, isVerified, status, brandingConfig` |
| **`SaasSslCertificate`** | 12 fields | ✅ Yes (`tenantId`) | `id, domainId, tenantId, provider, status, secretRef, issuedAt, expiresAt` |
| **`SaasPartnerResellerChannel`** | 10 fields | 🌐 Global / Reference | `id, partnerId, partnerName, tier, commissionPct, managedTenants, status, contractDate` |
| **`SaasResellerCommission`** | 11 fields | ✅ Yes (`tenantId`) | `id, resellerId, tenantId, period, invoiceAmount, commissionPct, earnedAmount, payoutStatus` |
| **`SaasPortalAccountProfile`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, companyName, taxId, billingEmail, technicalEmail, address, country` |
| **`SaasPortalPaymentMethod`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, brand, last4, expMonth, expYear, isDefault, stripePaymentMethodId` |
| **`SaasPortalSubscriptionUpgrade`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromTier, toTier, proratedCharge, status, effectiveDate, createdAt` |
| **`SaasPortalPlanDowngradeReason`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, reasonCategory, feedback, submittedAt` |
| **`SaasPortalUsageDashboard`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, metricName, currentUsage, quotaLimit, percentUsed, period, updatedAt` |
| **`SaasPortalInvoiceDownloadLog`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, downloadedBy, downloadedAt` |
| **`SaasPortalSupportTicketDeep`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketNumber, subject, category, priority, status, creatorId` |
| **`SaasPortalTicketMessage`** | 8 fields | ✅ Yes (`tenantId`) | `id, ticketId, tenantId, senderId, senderRole, message, attachments, createdAt` |
| **`SaasPortalFeatureRequest`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, category, upvotesCount, status, createdAt` |
| **`SaasPortalFeatureVote`** | 5 fields | ✅ Yes (`tenantId`) | `id, requestId, tenantId, voterId, createdAt` |
| **`AnalyticsCustomDashboard`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, isPublic, creatorId, createdAt, updatedAt` |
| **`AnalyticsDashboardWidgetDeep`** | 7 fields | 🌐 Global / Reference | `id, dashboardId, title, widgetType, queryConfig, layoutGrid, createdAt` |
| **`AnalyticsDataDataset`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, sourceType, schemaJson, refreshInterval, createdAt` |
| **`AnalyticsDataPipeline`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, pipelineName, sourceDatasetId, targetDatasetId, transformationSql, status, lastRunAt` |
| **`AnalyticsPredictiveModel`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelName, algorithm, targetMetric, accuracyScore, status, trainedAt` |
| **`AnalyticsForecastRun`** | 6 fields | ✅ Yes (`tenantId`) | `id, modelId, tenantId, forecastHorizon, resultMetrics, executedAt` |
| **`AnalyticsCohortAnalysis`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, cohortName, groupingRule, timeGranularity, createdAt` |
| **`AnalyticsCohortGroup`** | 6 fields | ✅ Yes (`tenantId`) | `id, analysisId, tenantId, cohortDate, initialUsers, retentionRates` |
| **`AnalyticsFunnelStep`** | 6 fields | ✅ Yes (`tenantId`) | `id, funnelName, tenantId, stepOrder, eventName, createdAt` |
| **`AnalyticsFunnelConversion`** | 7 fields | ✅ Yes (`tenantId`) | `id, funnelName, tenantId, period, stepConversions, overallDropoff, calculatedAt` |
| **`ReportingTemplateDeep`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, category, layoutHtml, headerFooter, isSystem, createdAt` |
| **`ReportingTemplateSection`** | 7 fields | 🌐 Global / Reference | `id, templateId, sectionName, sectionOrder, dataSourceSql, chartConfig, createdAt` |
| **`ReportingScheduledJobDeep`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, jobName, templateId, cronSchedule, outputFormat, recipients, isEnabled` |
| **`ReportingExecutionLog`** | 8 fields | ✅ Yes (`tenantId`) | `id, jobId, tenantId, status, executionMs, fileSizeKb, errorMessage, executedAt` |
| **`ReportingExportJob`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestedBy, reportType, exportFormat, filterParams, status, downloadUrl` |
| **`ReportingExportFile`** | 6 fields | 🌐 Global / Reference | `id, exportJobId, fileName, fileSizeBytes, mimeType, expiresAt` |
| **`ReportingComplianceAudit`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportName, complianceType, signoffStatus, auditorId, signedAt, createdAt` |
| **`ReportingSignoffHistory`** | 6 fields | 🌐 Global / Reference | `id, auditId, signerUserId, signatureHash, comments, signedAt` |
| **`ReportingDistributionList`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, listName, description, createdAt` |
| **`ReportingDistributionRecipient`** | 5 fields | 🌐 Global / Reference | `id, listId, recipientEmail, recipientName, createdAt` |
| **`AdvancedHrLearningPathDeep`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, pathName, category, estimatedHours, isPublished, createdAt` |
| **`AdvancedHrLearningEnrollment`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, pathId, employeeId, progressPercent, completedAt, enrolledAt` |
| **`AdvancedHrSuccessionPlan`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, planName, targetRoleId, urgencyLevel, createdAt` |
| **`AdvancedHrSuccessionCandidate`** | 7 fields | ✅ Yes (`tenantId`) | `id, planId, tenantId, employeeId, readinessScore, readinessLevel, nominatedAt` |
| **`AdvancedHrWorkforceAnalyticsDeep`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportingPeriod, headcount, attritionRate, avgTenureYears, engagementScore, calculatedAt` |
| **`AdvancedHrCompensationBandDeep`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, bandName, jobLevel, minSalary, midSalary, maxSalary, currency` |
| **`AdvancedHrBenefitsPlanDeep`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, planName, planType, providerName, employeeCost, employerCost, enrollmentOpen` |
| **`AdvancedHrBenefitsEnrollment`** | 6 fields | ✅ Yes (`tenantId`) | `id, planId, tenantId, employeeId, enrolledAt, status` |
| **`AdvancedHrOrgChartNodeDeep`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, parentNodeId, jobTitle, department, reportingLevel, headcount` |
| **`AdvancedHrExitInterviewDeep`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, exitDate, exitReason, satisfactionScore, wouldRehire, comments` |
| **`SearchIndex`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, title, content, keywords, module` |
| **`SearchIndexRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, module, fields, weight, isActive, createdAt` |
| **`SearchQueryLog`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, query, filters` |
| **`SearchAnalytics`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, date, totalQueries, uniqueUsers, avgResponseMs, topQueries, topEntities` |
| **`SavedViewLayout`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, viewId, layoutType, columns, groupBy, sortBy` |
| **`SavedViewFilter`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, viewId, field, operator, value, logic` |
| **`SavedViewColumnConfig`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, viewId, field, label, width, sortable` |
| **`SavedViewSharing`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, viewId, sharedWithUserId, sharedByUserId, permission, createdAt, updatedAt` |
| **`NotificationTemplate`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, subject, body, channel, variables` |
| **`NotificationBatch`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, channel, status, totalItems, sentItems, failedItems` |
| **`NotificationBatchItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, userId, recipient, subject, body, status` |
| **`NotificationDigest`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, frequency, channel, lastSentAt, nextScheduledAt, isEnabled` |
| **`NotificationDeliveryLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, notificationId, templateId, userId, channel, status, errorMsg` |
| **`Deployment`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, application, version, environmentId, status` |

### 📄 Schema: `core-part-3.prisma` (118 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`OnboardingChecklist`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, templateName, status, createdAt, updatedAt, items` |
| **`OnboardingItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, checklistId, task, category, isCompleted, completedAt, sortOrder` |
| **`OffboardingChecklist`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, status, exitDate, exitReason, createdAt, updatedAt` |
| **`OffboardingItem`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, checklistId, task, isCompleted, completedAt, sortOrder, status` |
| **`JobPosting`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, title, departmentId, description, requirements, location` |
| **`Applicant`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, jobPostingId, firstName, lastName, email, phone, resumeUrl` |
| **`Interview`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, applicantId, jobPostingId, interviewerId, scheduledAt, durationMin, round` |
| **`Goal`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, title, description, category, type, startDate` |
| **`GoalComment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, goalId, comment, authorName, fileUrl, fileName, createdAt` |
| **`KeyResult`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, goalId, title, target, current, unit, status` |
| **`Feedback360`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, reviewerId, relationship, period, overallRating, strengths` |
| **`FeedbackResponse`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, feedbackId, question, rating, comment, category, feedback` |
| **`SuccessionPlan`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, position, currentHolderId, riskLevel, readinessLevel, successorId, developmentPlan` |
| **`HRTicket`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, category, title, description, priority, status` |
| **`EngagementSurvey`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, startDate, endDate, status, createdAt` |
| **`SurveyQuestion`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, question, category, sortOrder, survey, responses` |
| **`SurveyResponse`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, questionId, employeeId, rating, comment, createdAt, question` |
| **`ShiftSchedule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, startTime, endTime, note, createdAt, updatedAt` |
| **`Appraisal`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, reviewerId, appraisalPeriod, score, feedback, status` |
| **`Training`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, instructor, startDate, endDate, capacity` |
| **`TrainingEnrollment`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, trainingId, employeeId, enrolledAt, status, training, employee` |
| **`OfferLetter`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, applicantId, salaryOffered, status, sentAt, expiresAt, signedAt` |
| **`BenefitScheme`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, provider, description, employeeCostShare, employerCostShare` |
| **`SkillRequirement`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, designation, skillName, requiredLevel, createdAt, updatedAt` |
| **`ComplianceCheck`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, checkType, status, message, checkedAt` |
| **`TaxTable`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, country, state, incomeBracketMin, incomeBracketMax, taxRate, allowanceAmount` |
| **`HolidayCalendar`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, date, region, createdAt` |
| **`ExitInterview`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, separationId, interviewDate, interviewer, reasonForLeaving, feedback` |
| **`RecruitmentAgency`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, contactPerson, email, phone, commissionRate, agreementUrl` |
| **`OfferTemplate`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, content, variables, createdAt` |
| **`SalaryRevision`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, previousSalary, newSalary, revisionType, effectiveDate, reason` |
| **`OvertimeRequest`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, date, startTime, endTime, totalHours, rate` |
| **`AttendanceAdjustment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, attendanceId, date, previousCheckIn, previousCheckOut, newCheckIn` |
| **`KpiTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, metricType, targetValue, unit` |
| **`KpiEvaluation`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, kpiTemplateId, period, targetValue, actualValue, weightage` |
| **`LearningCourse`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, code, description, category, durationHours, provider` |
| **`LearningModule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, title, description, orderIndex, contentType, contentUrl` |
| **`LearningEnrollment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, employeeId, status, progressPct, score, completedAt` |
| **`Certification`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, name, issuingBody, credentialId, issueDate, expiryDate` |
| **`SkillMatrix`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, description, isActive, createdAt, updatedAt` |
| **`SkillGapAnalysis`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, skillId, currentLevel, requiredLevel, gapScore, priority` |
| **`CareerPath`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, fromPosition, toPosition, typicalDurationMonths, isActive` |
| **`CareerPathRequirement`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, careerPathId, skillId, minimumLevel, isRequired, createdAt, careerPath` |
| **`MentoringProgram`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, objectives, startDate, endDate, maxPairs` |
| **`MentoringSession`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, mentorId, menteeId, status, startDate, endDate` |
| **`BonusPlan`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, planType, eligibilityRule, calculationBasis, targetAmount, maxAmount` |
| **`BonusPayout`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, employeeId, payoutDate, amount, percentage, reason` |
| **`EquityGrant`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, grantType, totalShares, sharePrice, grantDate, cliffMonths` |
| **`EquityVestingSchedule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, grantId, vestingDate, sharesVesting, cumulativeVested, isCliff, status` |
| **`BenefitsEligibilityRule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, benefitType, employmentType, minTenureMonths, minHoursPerWeek, jobGrade` |
| **`FlexibleBenefitCredit`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, fiscalYear, totalCredit, usedCredit, remainingCredit, allocations` |
| **`CompensationReview`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, reviewCycle, currentSalary, recommendedSalary, increasePct, effectiveDate` |
| **`CompensationBenchmark`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, positionTitle, marketSource, p10, p25, p50, p75` |
| **`TotalRewardsStatement`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, statementDate, baseSalary, bonusTotal, benefitsTotal, equityTotal` |
| **`DisputeResolution`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, disputeType, subject, description, initiatingParty, respondentId, mediatorId` |
| **`BackgroundCheckRequest`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, candidateId, employeeId, checkType, status, vendorName, requestedBy` |
| **`VisaRecord`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, visaType, visaNumber, issuingCountry, issuedDate, expiryDate` |
| **`ImmigrationDocument`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, documentType, documentNumber, issuingAuthority, issuedDate, expiryDate` |
| **`WellnessActivity`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, employeeId, activityType, activityDate, durationMin, metricValue` |
| **`DEIMetric`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, metricName, category, dimension, value, unit, period` |
| **`DEIReport`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportName, reportType, fiscalYear, reportData` |
| **`TurnoverPrediction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, predictionScore, riskLevel, topFactors, predictedDate, modelVersion` |
| **`ComplianceRequirement`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, regulation, description, jurisdiction, frequency, isActive` |
| **`HRComplianceReport`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, requirementId, reportName, reportType, fiscalYear, dueDate, submittedDate` |
| **`WellnessChallenge`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, challengeType, startDate, endDate, goalMetric` |
| **`WellnessLeaderboard`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, challengeId, employeeId, teamName, metricValue, rank, updatedAt` |
| **`eNPSurvey`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, surveyType, startDate, endDate, isActive` |
| **`PulseSurvey`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, frequency, questions, departmentId, isActive` |
| **`AlumniRecord`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, lastPosition, lastDepartment, employmentStart, employmentEnd, email` |
| **`AlumniEvent`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, organizerId, name, description, eventDate, location, eventType` |
| **`AlumniEventAttendee`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventId, alumniId, rsvpStatus, attended, createdAt, event` |
| **`Workflow`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, triggerType, status, createdAt, updatedAt, steps` |
| **`WorkflowStep`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, stepOrder, actionType, assigneeRole, slaLimitHours, backupAssigneeRole` |
| **`ApprovalChain`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, stepId, status, actionBy, actionAt` |
| **`NotificationChannel`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, isEnabled, createdAt, updatedAt` |
| **`NotificationPreference`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, channelName, eventType, isEnabled, createdAt, updatedAt` |
| **`GeneratedDocument`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, templateId, format, fileUrl, createdAt` |
| **`StorageFolder`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, parentId, path, createdBy, createdAt, updatedAt` |
| **`StorageFileVersion`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, version, fileKey, size, mimeType, createdBy` |
| **`StorageShareLink`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, token, permission, expiresAt, maxDownloads, downloadCount` |
| **`StorageQuota`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, storageUsed, storageLimit, fileCount, folderCount, tenant` |
| **`StoredFile`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, bucket, fileKey, size, mimeType, folderId` |
| **`ReportWidget`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, dashboardId, title, chartType, queryConfig, position, createdAt` |
| **`ReportView`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, queryConfig, isScheduled, scheduleCron, recipientEmails, lastRunAt` |
| **`ApiKeyScope`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, apiKeyId, resource, action, createdAt, tenant` |
| **`ApiUsageMetric`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, apiKeyId, endpoint, method, statusCode, responseMs, createdAt` |
| **`EndpointRegistry`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, path, method, module, description, authRequired, rateLimit` |
| **`LanguageOverride`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, locale, key, translation, createdAt, updatedAt` |
| **`Locale`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, direction, isActive, isDefault, sortOrder` |
| **`TranslationKey`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, key, module, description, isDynamic, createdAt, updatedAt` |
| **`TranslationEntry`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, localeId, keyId, value, isOverride, createdAt, updatedAt` |
| **`TranslationImport`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, localeCode, fileName, totalEntries, importedCount, skippedCount, status` |
| **`LocaleFormattingRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, localeId, dateFormat, timeFormat, numberFormat, currencyCode, currencySymbol` |
| **`OfflineSyncQueue`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, clientId, operation, entityType, payload, status, errorMessage` |
| **`SaaSPlan`** | 19 fields | 🌐 Global / Reference | `id, name, stripePriceId, maxUsers, maxStorage, maxApiCalls, features, description` |
| **`TenantSubscription`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, status, billingPeriod, currency, startDate, endDate` |
| **`UsageRecord`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, metric, currentValue, limitValue, updatedAt` |
| **`MeteringEvent`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, metric, quantity, idempotencyKey, source, timestamp` |
| **`SaaSCoupon`** | 9 fields | 🌐 Global / Reference | `id, code, discountType, discountValue, expiresAt, maxRedemptions, timesRedeemed, status` |
| **`SaaSAddOn`** | 10 fields | 🌐 Global / Reference | `id, name, slug, price, billingPeriod, description, status, createdAt` |
| **`TenantAddOn`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, addonId, quantity, status, createdAt, updatedAt` |
| **`QuotaRule`** | 10 fields | 🌐 Global / Reference | `id, planId, addonId, metric, limitValue, pricePerUnit, billingThreshold, createdAt` |
| **`InstalledApp`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, appSlug, appName, installedAt, installedBy, status` |
| **`AppStorageUsage`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, appSlug, rowCount, estimatedBytes, updatedAt` |
| **`SaaSPlanPrice`** | 10 fields | 🌐 Global / Reference | `id, planId, currency, region, monthly, yearly, stripePriceId, isActive` |
| **`SaaSPlanFeature`** | 10 fields | 🌐 Global / Reference | `id, planId, featureKey, name, description, type, limitValue, isActive` |
| **`SaaSInvoice`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, invoiceNumber, status, currency, subtotal, discountAmount` |
| **`SaaSInvoiceLineItem`** | 8 fields | 🌐 Global / Reference | `id, invoiceId, description, type, quantity, unitPrice, totalPrice, metadata` |
| **`UsageAlertRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, metric, thresholdPct, notifyEmail, notifyWebhook, notifyInApp, webhookUrl` |
| **`UsageAlertLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleId, metric, level, message, currentValue, limitValue` |
| **`TenantApiKey`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, keyPrefix, keyHash, lastUsedAt, expiresAt, permissions` |
| **`TenantAuditLog`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, action, resource, resourceId, details` |
| **`TenantSupportTicket`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, subject, description, category, priority, status` |
| **`TicketMessage`** | 8 fields | 🌐 Global / Reference | `id, ticketId, userId, message, attachments, isStaff, createdAt, ticket` |
| **`TenantDomain`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, domain, isPrimary, verificationKey, verifiedAt, sslStatus, sslExpiresAt` |
| **`TenantSsoConfig`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, provider, issuerUrl, clientId, clientSecret, authorizationUrl, tokenUrl` |
| **`TenantBranding`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, logoUrl, faviconUrl, primaryColor, accentColor, companyName, supportEmail` |
| **`DataExportJob`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, type, format, scope` |

### 📄 Schema: `core-part-12.prisma` (113 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`AnomalyDetectionResult`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, entityType, entityId, anomalyType, anomalyScore, description` |
| **`SmartGlCodingSuggestion`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sourceType, sourceId, description, suggestedAccountId, suggestedCostCenter, confidenceScore` |
| **`PricingRule`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, ruleType, priority, conditions` |
| **`QuoteVersion`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, quotationId, versionNumber, content, subtotal, totalDiscount` |
| **`QuoteMargin`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, quotationId, totalCost, totalPrice, marginAmount, marginPct, costBreakdown` |
| **`DiscountApprovalMatrix`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, minDiscount, maxDiscount, minAmount, maxAmount, approverRole` |
| **`TerritoryPlan`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, fiscalYear, status, metadata` |
| **`TerritoryPlanAssignment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, territoryId, userId, allocation, startDate, endDate` |
| **`TerritoryRebalanceLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, previousJson, newJson, strategy, summary, createdBy` |
| **`NamedAccount`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, name, tier, status, targetRevenue, strategy` |
| **`ReportCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, icon, sortOrder, isSystem, createdAt` |
| **`SystemReport`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, module, description, category, type, config` |
| **`ContractTemplateCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, sortOrder, createdAt, updatedAt, deletedAt` |
| **`ContractVersion`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, versionNumber, snapshot, changeSummary, createdBy, createdAt` |
| **`ContractObligation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, description, owner, dueDate, status, priority` |
| **`ContractComplianceStatus`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, overallCompliance, slaMet, slaMissed, lastAuditDate, findings` |
| **`SocialMediaPost`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, platform, content, mediaUrl, scheduledAt, publishedAt, status` |
| **`CommunicationOptOut`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, channel, reason, optedOutAt` |
| **`CommunicationPreference`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, email, sms, whatsapp, push` |
| **`ShipmentEmissions`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentId, transportMode, distanceKm, weightKg, emissionFactor, emissionsKg` |
| **`CarbonOffset`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, offsetType, quantityTons, cost, supplierName, projectName, certification` |
| **`SupplierDocument`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierId, documentType, title, description, fileUrl, fileSize` |
| **`PoCollaboration`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, purchaseOrderId, supplierId, message, proposedChanges, attachmentUrl, createdBy` |
| **`LetterOfCredit`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, lcNumber, lcType, issuingBank, beneficiaryId, applicantId, currency` |
| **`LcDocument`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, lcId, documentType, documentTitle, required, copies, originalCopies` |
| **`LcAmendment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, lcId, amendmentNo, description, changes, requestedBy, approvedBy` |
| **`LcPresentation`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, lcId, presentedDate, documentaryCredit, discrepancies, status, acceptedAt` |
| **`BankGuarantee`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, guaranteeNumber, guaranteeType, issuingBank, beneficiaryId, currency, amount` |
| **`SopCycle`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, period, startDate, endDate, status, facilitator` |
| **`SopDemandPlan`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, sopCycleId, productId, productGroup, region, channel, forecastUnits` |
| **`SopSupplyPlan`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, sopCycleId, productId, productGroup, plantId, plannedProduction, availableCapacity` |
| **`SopConsensusPlan`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sopCycleId, productId, productGroup, consensusForecast, revenuePlan, marginPlan` |
| **`LogisticsProvider`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, providerCode, name, providerType, contactName, contactEmail, contactPhone` |
| **`LogisticsProviderInvoice`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, providerId, invoiceNo, periodStart, periodEnd, amount, currency` |
| **`LogisticsProviderPerformance`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, providerId, period, otifRate, onTimeRate, inFullRate, damageRate` |
| **`ColdChainShipment`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentRef, productId, origin, destination, requiredTempMin, requiredTempMax` |
| **`ColdChainTemperatureLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentId, temperature, humidity, location, deviceId, recordedAt` |
| **`ColdChainExcursion`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentId, excursionType, detectedAt, resolvedAt, duration, severity` |
| **`ScemAlert`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, alertType, severity, title, description, entityType, entityId` |
| **`ScemAlertRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, entityType, triggerField, condition, threshold` |
| **`SupplyChainRiskEvent`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, riskType, severity, title, description, affectedRegions, affectedProducts` |
| **`ScmRiskMitigation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, riskEventId, actionType, description, assignedTo, dueDate, completedAt` |
| **`TradeComplianceCheck`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, entityName, checkType, listType, result` |
| **`DeniedPartyEntry`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, listName, listSource, entityName, entityType, country, aliases` |
| **`ExportLicense`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, licenseNumber, licenseType, issuingAuthority, applicantId, destinationCountry, productCategory` |
| **`HsCodeClassification`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, productName, hsCode, description, country, tariffRate` |
| **`MultiModalTransportOrder`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, orderType, origin, destination, primaryMode, cargoType` |
| **`MultiModalTransportLeg`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, transportOrderId, legNumber, mode, origin, destination, carrierName` |
| **`MultiModalTransportEvent`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, transportOrderId, eventType, location, timestamp, description, source` |
| **`ReverseLogisticsOrder`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, returnNumber, returnType, customerId, supplierId, originalOrderId, reason` |
| **`ReverseLogisticsItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, returnOrderId, productId, productName, quantity, returnedQty, unitCost` |
| **`DeliveryZone`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, geoBoundary, postalCodes, isActive, maxWeight` |
| **`DeliveryTimeSlot`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, zoneId, date, startTime, endTime, capacity, booked` |
| **`LastMileDelivery`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, deliveryNumber, orderId, customerId, zoneId, slotId, deliveryAddress` |
| **`ScmIotDevice`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, deviceId, deviceType, name, location, warehouseId, productId` |
| **`ScmIotReading`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, deviceId, readingType, value, unit, timestamp, device` |
| **`SmartReplenishmentOrder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, triggeredBy, currentStock, reorderPoint, suggestedQty` |
| **`DynamicDiscountRequest`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierId, invoiceId, originalAmount, dueDate, paymentDate, discountRate` |
| **`ScmFinancingFacility`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, facilityName, facilityType, financier, creditLimit, availableLimit, currency` |
| **`ScmFinancingDrawdown`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, facilityId, amount, purpose, referenceId, drawnAt, dueDate` |
| **`SupplierDevelopmentPlan`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierId, planName, objectives, startDate, endDate, budget` |
| **`SupplierDevMilestone`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, title, description, dueDate, completedAt, status` |
| **`SupplierDevSurvey`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierId, planId, surveyTitle, surveyType, questions, responses` |
| **`PortTerminal`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalCode, name, country, city, portType, berths` |
| **`BerthSlot`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalId, berthNumber, vesselName, voyageNumber, arrivalPlan, departurePlan` |
| **`ScmKpiSnapshot`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, otifRate, onTimeDelivery, inFullDelivery, fillRate, orderCycleTime` |
| **`SupplierPortalSession`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierId, token, expiresAt, lastActiveAt, ipAddress, createdAt` |
| **`SupplierAnnouncement`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, priority, targetSuppliers, publishedAt, expiresAt` |
| **`MasterProductionSchedule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, planningHorizon, planningUnit, status, frozenPeriod, demandSource` |
| **`MpsEntry`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, mpsId, productId, period, forecastDemand, actualDemand, openOrders` |
| **`FmeaRecord`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, fmeaType, productId, processId, title, scope, version` |
| **`FmeaMode`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, fmeaId, processStep, failureMode, failureEffect, failureCause, severity` |
| **`AqlSamplingPlan`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, standard, aqlLevel, inspectionLevel, lotSizeMin, lotSizeMax` |
| **`JobCostSheet`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, productId, plannedMaterialCost, plannedLaborCost, plannedOverheadCost, actualMaterialCost` |
| **`StandardCost`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, effectiveFrom, effectiveTo, materialCost, laborCost, overheadCost` |
| **`FormulaIngredient`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, formulaId, productId, ingredientType, quantity, unit, scrapFactor` |
| **`CoProduct`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, formulaId, productId, productType, quantity, unit, valueFactor` |
| **`ManufacturingMachine`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, machineCode, name, machineType, manufacturer, model, serialNumber` |
| **`MachineOeeRecord`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, machineId, shift, recordDate, plannedRunTime, actualRunTime, downtime` |
| **`MachineMaintenanceLog`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, machineId, maintenanceType, description, technician, startTime, endTime` |
| **`MachineDowntime`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, machineId, downtimeCode, category, cause, startTime, endTime` |
| **`MaintenanceSchedule`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, machineId, maintenanceType, frequency, intervalDays, lastDone` |
| **`SparePart`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, partCode, name, description, machineTypes, location, quantity` |
| **`SixSigmaProject`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectCode, title, phase, belt, champion, blackBelt` |
| **`SixSigmaMetric`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, metricName, baseline, target, actual, unit` |
| **`SixSigmaTool`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, toolType, phase, data, findings, completedAt` |
| **`ShopFloorTransaction`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, transactionType, workOrderId, machineId, operatorId, quantity, unit` |
| **`QualityStandard`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, standardCode, name, version, issuer, scope, requirements` |
| **`ComplianceAudit`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, standardId, auditType, scope, auditDate, auditorName, auditorOrg` |
| **`GmpBatchRecord`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, productCode, formulaVersion, batchSize, processSteps, inProcessTests` |
| **`HacppPlan`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productLine, version, status, scope, hazardAnalysis, criticalControlPoints` |
| **`PpmPortfolio`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, owner, strategicGoal, budget, currency` |
| **`PpmPortfolioProject`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, portfolioId, projectId, priority, strategicAlignment, riskScore, portfolio` |
| **`PpmRiskRegister`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, riskCode, title, description, category, probability` |
| **`PpmRaidLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, entryType, title, description, status, owner` |
| **`EvmBaseline`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, baselineType, budgetAtCompletion, scheduleBaselineStart, scheduleBaselineEnd, approvedBy` |
| **`EvmMeasurement`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, baselineId, measurementDate, plannedValue, earnedValue, actualCost, scheduleVariance` |
| **`PpmKanbanBoard`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, description, wipLimit, createdAt, updatedAt` |
| **`PpmKanbanColumn`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, boardId, name, order, columnType, wipLimit, color` |
| **`PpmKanbanCard`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, columnId, taskId, title, description, order, assignees` |
| **`PpmChangeRequest`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, changeCode, title, description, changeType, requestedBy` |
| **`PpmProcurementPlan`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, description, makeOrBuy, totalBudget, status, approvedBy` |
| **`PpmProcurementRequisition`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, projectId, title, description, quantity, estimatedCost` |
| **`PpmClientPortal`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, clientId, accessToken, accessLevel, expiresAt, lastAccessedAt` |
| **`PpmClientApproval`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, deliverableId, title, description, submittedTo, submittedAt` |
| **`PpmTimesheet`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, weekStart, weekEnd, status, submittedAt, approvedBy` |
| **`PpmTimesheetEntry`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, timesheetId, projectId, taskId, date, hours, isBillable` |
| **`PpmQualityPlan`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, qualityObjectives, standards, reviewSchedule, acceptanceCriteria, status` |
| **`PpmQualityInspection`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, projectId, inspectionType, scheduledDate, conductedDate, inspectedBy` |
| **`PpmDocument`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, docType, category, version, fileUrl` |
| **`PpmDocumentVersion`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, version, fileUrl, changeNotes, uploadedBy, uploadedAt` |
| **`SubcontractorDeliverable`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, subcontractorId, title, description, dueDate, deliveredDate, status` |
| **`SubcontractorPaymentMilestone`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, subcontractorId, milestoneTitle, amount, dueDate, trigger, status` |

### 📄 Schema: `core-part-5.prisma` (113 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`CustomerTag`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, color, createdAt, customers` |
| **`CustomerTagLink`** | 5 fields | 🌐 Global / Reference | `id, customerId, tagId, customer, tag` |
| **`SalesTarget`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, period, targetType, target, achieved` |
| **`SavedReport`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, filters` |
| **`EmailSequence`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, isActive, createdBy, createdAt` |
| **`EmailSequenceStep`** | 10 fields | 🌐 Global / Reference | `id, sequenceId, templateId, channel, subject, instructions, delayDays, sortOrder` |
| **`EmailSequenceEnrollment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, sequenceId, contactId, leadId, currentStep, status, nextSendAt` |
| **`CadenceAutoEnrollRule`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, sequenceId, name, entityType, conditions` |
| **`CadenceStepTask`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, enrollmentId, stepId, channel, status, dueAt, completedAt` |
| **`SalesTerritory`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, criteria` |
| **`SalesTeamMember`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, territoryId, userId, role, createdAt, territory` |
| **`TerritoryAssignmentRule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, territoryId, name, ruleType, priority, conditions` |
| **`TerritoryAssignmentLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, territoryId, ruleId, assignedToId, reason` |
| **`TerritoryRoundRobinState`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, territoryId, lastMemberIndex, updatedAt` |
| **`CommissionRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, type, rate, tiers, appliesToAll` |
| **`CommissionEntry`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, opportunityId, ruleId, amount, status, periodStart` |
| **`ApprovalProcess`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, entity, triggerConditions, steps, isActive` |
| **`ApprovalRequest`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, processId, entityType, entityId, status, currentStep, submittedBy` |
| **`ApprovalAction`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestId, step, action, userId, comments, actedAt` |
| **`QuotationSection`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, quotationId, title, description, sortOrder, isOptional, quotation` |
| **`QuotationVersion`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, quotationId, versionNumber, snapshot, changedBy, changeNote, createdAt` |
| **`QuotationTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, headerHtml, footerHtml, termsTemplate` |
| **`QuotationSignature`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, quotationId, signerName, signerEmail, status, signedAt, ipAddress` |
| **`QuotationSignatureCertificate`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, signatureId, certificateNumber, documentHash, signerName, signerEmail, ipAddress` |
| **`SalesPlaybook`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, pipelineId, isActive, createdBy` |
| **`PlaybookStage`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, playbookId, stageName, guidanceNotes, checklist, requiredFields, talkingPoints` |
| **`Battlecard`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, playbookId, competitor, strengths, weaknesses, objections, winStrategy` |
| **`UoMConversion`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromUoMId, toUoMId, factor, createdAt, fromUoM, toUoM` |
| **`ReorderRule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, minQty, maxQty, reorderQty, leadTimeDays` |
| **`DemandForecastRun`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, method, parameters` |
| **`DemandForecastLine`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, productId, warehouseId, period, historicalAvgQty, forecastedQuantity` |
| **`ReorderSuggestion`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, productId, warehouseId, reorderPoint, suggestedQuantity, currentStockQty` |
| **`KitVersion`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, kitId, versionNo, componentsSnapshot, isActive, notes, createdBy` |
| **`PurchaseRequisition`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, requisitionNumber, title, description, status, requestedById` |
| **`PurchaseRequisitionItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, requisitionId, productId, description, quantity, estimatedPrice, totalAmount` |
| **`BlanketPurchaseAgreement`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, agreementNumber, title, status, startDate` |
| **`BlanketPurchaseAgreementItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, agreementId, productId, description, quantity, releasedQty, unitPrice` |
| **`ChangeHistory`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, userName, entityType, entityId, action, fieldChanges` |
| **`DemoDataRecord`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, module, createdAt, tenant` |
| **`Permission`** | 7 fields | 🌐 Global / Reference | `id, code, module, resource, action, level, description` |
| **`AccessPackage`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, permissions, fieldAccess` |
| **`RoleAccessPackage`** | 3 fields | 🌐 Global / Reference | `roleId, accessPackageId, accessPackage` |
| **`SystemAnnouncement`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, message, type, priority, isActive, expiresAt` |
| **`ScheduledReport`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, reportType, schedule, recipients, filters` |
| **`DataRetentionPolicy`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, retentionDays, action, isActive, lastRunAt, createdAt` |
| **`DataErasureRequest`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestedBy, subjectEmail, subjectName, status, entityTypes, erasedAt` |
| **`SubjectErasureKey`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, subjectEmailHash, encryptionKey, createdAt` |
| **`RecordLegalHold`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, reason, heldBy, heldAt, releasedBy` |
| **`SettingChangeApproval`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, key, newValue, requestedBy, reason, status, approvedBy` |
| **`SsoConfig`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, providerType, name, clientId, clientSecret, issuerUrl, authorizationUrl` |
| **`LoginHistory`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, status, ipAddress, device, browser, location` |
| **`IpRestriction`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, ipRange, description, ruleType, isActive, createdAt, updatedAt` |
| **`BackgroundJob`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, queueName, jobType, bullJobId, payload` |
| **`ScheduledTask`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, expression, handler, config` |
| **`ErrorLog`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, level, source, message, stack, metadata` |
| **`MarketplaceApp`** | 18 fields | 🌐 Global / Reference | `id, slug, name, description, longDescription, category, icon, publisher` |
| **`AppVendorSigningKey`** | 9 fields | 🌐 Global / Reference | `id, vendorId, keyId, publicKey, algorithm, revoked, revokedReason, createdAt` |
| **`AppVendor`** | 15 fields | 🌐 Global / Reference | `id, name, slug, contactEmail, websiteUrl, logoUrl, description, verified` |
| **`AppPackage`** | 18 fields | 🌐 Global / Reference | `id, vendorId, slug, name, description, longDescription, category, icon` |
| **`AppBundle`** | 5 fields | 🌐 Global / Reference | `id, packageId, version, channel, manifest` |
| **`MarketplaceAppVersion`** | 9 fields | 🌐 Global / Reference | `id, appId, version, changelog, fileUrl, status, publishedAt, createdAt` |
| **`MarketplaceDeveloperSubmission`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, developerId, appId, name, slug, description, category` |
| **`MarketplaceAnalytics`** | 9 fields | 🌐 Global / Reference | `id, appId, date, installs, uninstalls, activeUsers, revenue, createdAt` |
| **`AppReview`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, userName, appId, rating, title, body` |
| **`AppChangelog`** | 6 fields | 🌐 Global / Reference | `id, appId, version, changes, publishedAt, app` |
| **`AppCollection`** | 12 fields | 🌐 Global / Reference | `id, slug, name, description, icon, coverImage, featured, sortOrder` |
| **`AppCollectionItem`** | 6 fields | 🌐 Global / Reference | `id, collectionId, appId, sortOrder, collection, app` |
| **`AppFavorite`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, appId, createdAt, app` |
| **`AppSubmission`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, submittedBy, submitterName, name, slug, description, longDescription` |
| **`CustomFieldDefinition`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, fieldName, label, fieldType, description, isRequired` |
| **`CustomFieldValue`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, fieldId, entityType, entityId, value, createdAt, updatedAt` |
| **`AutomationRuleExecution`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleId, status, triggerData` |
| **`RecycleBinItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, entityName, entityData, deletedBy, deletedAt` |
| **`AdminAlert`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, type, severity, title, message, metadata` |
| **`AlertThreshold`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, metric, operator, value, severity, isActive, notifyEmail` |
| **`BulkOperation`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, operationType, entityType, totalRecords, processed, failed, status` |
| **`Delegation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, delegatorId, delegateId, type, workflowId, reason, startDate` |
| **`DuplicateSet`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, recordIds, matchScore, matchFields, status, mergedIntoId` |
| **`BillingEvent`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, type, amount, currency, description, metadata` |
| **`CustomWorkflow`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, targetModel, steps, rules, status, createdAt` |
| **`CustomDashboard`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, widgets, styleConfig` |
| **`LogicScript`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, triggerType, script, isActive, createdAt, updatedAt` |
| **`EnvVariable`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, envName, key, value, createdAt, updatedAt` |
| **`RunLog`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, level, message, stackTrace, payload, timestamp` |
| **`StudioPermission`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, roleId, moduleSlug, canRead, canWrite, createdAt, updatedAt` |
| **`ThirdPartyConnector`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, config` |
| **`CustomWidget`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, tag, source, manifest` |
| **`GitConfig`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, repoUrl, branch, accessToken, status, lastSync, createdAt` |
| **`NativeBuild`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, version, platform, status, downloadUrl, logSummary, createdAt` |
| **`Case`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, caseNumber, subject, description, customerId, contactId` |
| **`CaseComment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, caseId, authorId, authorType, body, isInternal, createdAt` |
| **`CustomerPortalUser`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, contactId, email, passwordHash, status, lastLoginAt` |
| **`Contract`** | 56 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, contractNumber, title, customerId, vendorId, type` |
| **`ContractBillingMilestone`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, title, percentage, amount, dueDate, status` |
| **`MailboxConnection`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, provider, emailAddress, accessTokenEnc, refreshTokenEnc` |
| **`VendorPortalUser`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, email, passwordHash, status, lastLoginAt, createdAt` |
| **`RFQAuctionBid`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, rfqId, vendorId, bidAmount, notes, status, submittedAt` |
| **`SalesChannel`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, type, isActive, createdAt, updatedAt` |
| **`ChannelInventory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, productId, allocatedQty, reservedQty, updatedAt, channel` |
| **`SalesPromotion`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, value, minOrderAmount` |
| **`SalesCoupon`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, promotionId, code, usageLimit, usedCount, isActive, maxRedemptionsPerCustomer` |
| **`SalesPartnerTier`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, commissionRate, minRevenue, benefits` |
| **`SalesPartner`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, tierId, name, email, phone, website` |
| **`StorefrontConfig`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeName, storeSlug, isEnabled, currency, contactEmail, logoUrl` |
| **`StorefrontCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, sortOrder, createdAt, updatedAt` |
| **`Cart`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, sessionToken, status, currency, expiresAt, createdAt, updatedAt` |
| **`CartItem`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, cartId, productListingId, quantity, unitPriceSnapshot, createdAt, updatedAt` |
| **`StorefrontOrderPayment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, salesOrderId, provider, providerIntentId, status, amount, currency` |
| **`StorefrontCheckoutState`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, storefrontSlug, cartId, status, salesOrderId, errorMessage, createdAt` |
| **`FixedAssetCategory`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, depreciationMethod, expectedLifeMonths, depreciationRate, assetAccountId` |
| **`AssetTransferLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, transferDate, fromLocationId, toLocationId, fromCustodianId, toCustodianId` |
| **`AssetMaintenanceLog`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, maintenanceDate, type, description, cost, performedBy` |
| **`FixedAssetDisposal`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, disposalDate, disposalType, salePrice, bookValueAtDisposal, gainLoss` |

### 📄 Schema: `core-part-14.prisma` (112 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`DeploymentStage`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, deploymentId, name, status, sequence, startedAt, completedAt` |
| **`Environment`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, type, application, baseUrl, healthUrl` |
| **`EnvironmentConfig`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, environmentId, key, value, valueType, isSecret, description` |
| **`Release`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, version, application, description, releaseType, environmentId` |
| **`ReleaseArtifact`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, releaseId, deploymentId, name, fileType, fileUrl, fileHash` |
| **`BuildLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, deploymentId, stage, level, message, source, lineNumber` |
| **`DeploymentAnalytics`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, periodStart, periodEnd, totalDeployments, successfulDeployments, failedDeployments` |
| **`PwaManifest`** | 30 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, shortName, description, startUrl, display, orientation` |
| **`PwaServiceWorker`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, script, version, cacheStrategy, precacheUrls, runtimeCacheRules` |
| **`PwaOfflineCacheRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, urlPattern, cacheStrategy, maxAgeSeconds, maxEntries, compression` |
| **`PwaInstallPrompt`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, enabled, promptStyle, title, description, appName, iconUrl` |
| **`PwaSyncQueue`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, clientId, entityType, entityId, operation, payload, status` |
| **`PwaPushSubscription`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, endpoint, p256dhKey, authKey, userAgent, deviceType` |
| **`OutboxDLQ`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, outboxEventId, outboxDeliveryId, destination, eventName, payload, failureReason` |
| **`OutboxDeadLetterMessage`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, outboxDLQId, outboxEventId, outboxDeliveryId, destination, eventName, payload` |
| **`OutboxRetryLog`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, outboxDeliveryId, attemptNumber, status, responseCode, responseBody, durationMs` |
| **`OutboxDispatcherState`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, dispatcherName, status, lastRunAt, nextRunAt, itemsProcessed, itemsFailed` |
| **`ExtConnection`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, provider, type, baseUrl, apiKey` |
| **`ExtConnectionLog`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, connectionId, direction, method, url, statusCode, requestBody` |
| **`ExtWebhookConfig`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, connectionId, name, url, eventTypes, secret, format` |
| **`ExtWebhookDelivery`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, webhookConfigId, eventType, payload, headers` |
| **`ExtRateLimitConfig`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, connectionId, name, strategy, maxRequests, windowMs, maxBurst` |
| **`ExtRateLimitUsage`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, rateLimitConfigId, windowStart, windowEnd, requestCount, blockedCount, remaining` |
| **`ExtIntegrationTemplate`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, provider, description, icon, category` |
| **`PeopleCompetency`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, description, proficiencyLevels, isActive, createdAt` |
| **`PeopleSuccessionPlan`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, positionTitle, currentIncumbentId, readinessRating, successors, riskOfLoss, impactOfLoss` |
| **`PeoplePerformanceMetric`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, period, kpiScore, goalsCompleted, goalsTotal, feedbackRating` |
| **`SearchIndexConfig`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, searchableFields, boostFields` |
| **`SearchSynonymGroup`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, synonyms, isOneWay, isActive, createdAt, updatedAt` |
| **`AssetDepreciationSchedule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, period, startingBookValue, depreciationAmount, endingBookValue, accumulatedDepreciation` |
| **`AssetMaintenanceSchedule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, title, maintenanceType, scheduledDate, completedDate, assignedTo` |
| **`AssetDisposalLog`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, disposalDate, disposalType, salePrice, bookValueAtDisposal, gainOrLoss` |
| **`ApiRateLimitRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, endpointPath, limitPerMinute, burstLimit, clientTier, isActive` |
| **`ApiQuotaPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, clientAppId, dailyCallQuota, monthlyCallQuota, callsToday, callsThisMonth, resetDate` |
| **`ApiUsageAnalytics`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, clientAppId, endpoint, httpMethod, statusCode, responseTimeMs, requestSize` |
| **`SubscriptionPlanTier`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, monthlyPrice, annualPrice, includedUnits, overageRate` |
| **`SubscriptionUsageBilling`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, metricName, unitsConsumed, billingPeriod, totalCharge, isBilled` |
| **`SubscriptionChurnSurvey`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, reasonCategory, feedbackNotes, competitorName, wouldRecommend, createdAt` |
| **`StorageBucketConfig`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, bucketName, provider, region, maxQuotaGb, currentSizeGb, isPublic` |
| **`StorageLifecycleRule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, bucketName, ruleName, prefix, transitionDays, storageClass, expirationDays` |
| **`StorageAccessPolicy`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, bucketName, roleOrUser, permission, allowedIpSubnet, createdAt, updatedAt` |
| **`PwaOfflineSyncQueue`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, actionType, payload, status, errorMessage, retryCount` |
| **`PwaManifestConfig`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, appName, shortName, themeColor, backgroundColor, displayMode, startUrl` |
| **`SavedViewShare`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, viewId, sharedWith, permission, createdAt` |
| **`SavedViewFilterRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, viewId, field, operator, value, logicalOp, sortOrder` |
| **`SavedViewPreference`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, moduleName, defaultViewId, pinnedViews, createdAt, updatedAt` |
| **`PeopleOnboardingTask`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, title, description, assigneeId, dueDate, status` |
| **`PeopleTimeOffRequest`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, leaveType, startDate, endDate, days, reason` |
| **`PeoplePeerRecognition`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, giverId, receiverId, badge, message, points, createdAt` |
| **`FixedAssetInsurancePolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, policyNo, insurer, coverageAmount, premiumAmount, startDate` |
| **`FixedAssetRevaluation`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, oldValue, newValue, revaluedBy, revaluedAt, reason` |
| **`FixedAssetPhysicalAudit`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, auditName, assetId, expectedLocation, foundLocation, condition, auditedBy` |
| **`ServiceTicket`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, number, title, description, type, priority, status` |
| **`ServiceTicketCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, parentId, isActive, parent, children` |
| **`ServiceTicketSLAPolicy`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, targets, isActive, createdAt, updatedAt` |
| **`ServiceTicketSLABreach`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, policyId, breachType, targetTime, breachedAt, ticket` |
| **`ServiceTicketComment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, authorId, content, isInternal, createdAt, updatedAt` |
| **`ServiceTicketActivity`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, actorId, action, details` |
| **`ServiceKnowledgeArticle`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, status, authorId, viewCount, createdAt` |
| **`ServiceSurveyResponse`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, rating, feedback, submittedAt, ticket` |
| **`FixedAssetComponent`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, name, serialNo, partNo, quantity, unitCost` |
| **`FixedAssetComponentReplacement`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, componentId, replacedAt, oldSerialNo, newSerialNo, cost, reason` |
| **`FixedAssetWarranty`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, warrantyProvider, warrantyType, startDate, endDate, coverageDetails` |
| **`FixedAssetWarrantyClaim`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, warrantyId, claimDate, description, claimAmount, approvedAmount, status` |
| **`FixedAssetImpairment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, impairmentDate, carryingAmount, recoverableAmount, impairmentLoss, impairmentType` |
| **`FixedAssetConditionAssessment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, assessmentDate, conditionScore, conditionRating, assessedBy, notes` |
| **`FixedAssetDocument`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, documentType, title, fileName, fileUrl, fileSize` |
| **`FixedAssetUtilizationMetric`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, metricDate, metricType, value, unit, recordedBy` |
| **`FixedAssetGroup`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, parentId, sortOrder, createdAt, updatedAt` |
| **`FixedAssetGroupMember`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, assetId, group` |
| **`FixedAssetBudgetAllocation`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, fiscalYear, categoryId, allocatedAmount, spentAmount, notes` |
| **`SubscriptionCoupon`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, description, discountType, discountValue, maxRedemptions, currentRedemptions` |
| **`SubscriptionCouponRedemption`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, couponId, subscriptionId, discountAmount, redeemedAt, coupon, subscription` |
| **`SubscriptionPlanGroup`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, sortOrder, isActive, createdAt, updatedAt` |
| **`SubscriptionMigration`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, fromPlanTierId, toPlanTierId, migrationType, effectiveDate, proratedCredit` |
| **`SubscriptionBillingRun`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, runDate, periodLabel, totalSubsProcessed, totalBilled, totalAmount, totalFailed` |
| **`SubscriptionBillingRunLine`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, billingRunId, subscriptionId, invoiceNumber, amount, status, errorMessage` |
| **`SubscriptionDunningRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, invoiceStatus, daysOverdue, action, lateFeeType, lateFeeValue` |
| **`SubscriptionCreditNote`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, invoiceId, creditNoteNo, amount, reason, reasonCategory` |
| **`SubscriptionAutoScaleRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, subscriptionId, metricName, thresholdType, thresholdValue, scaleAction` |
| **`SubscriptionAnalyticsSnapshot`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, snapshotDate, totalActive, totalTrialing, totalPaused, totalCanceled, totalExpired` |
| **`LocaleTranslationContext`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, isActive, createdAt, updatedAt` |
| **`LocaleGlossaryEntry`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, term, contextId, definition, translation, usage, status` |
| **`LocaleTranslationMemoryEntry`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, sourceText, sourceLocale, targetLocale, translatedText, contextId, matchType` |
| **`LocaleMachineTranslationConfig`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, provider, apiKey, fromLocale, toLocales, modelName, maxCharsPerMonth` |
| **`LocaleApprovalWorkflow`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, rules` |
| **`LocaleTranslationReview`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, translationId, reviewerId, status, comment, reviewedAt, createdAt` |
| **`LocaleFallbackChain`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, localeCode, fallbackOrder, createdAt, updatedAt` |
| **`LocaleContentSchedule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, contentKey, sourceLocale, targetLocales, cronExpression, lastRunAt` |
| **`RegionValidationRule`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, regionCode, entityType, validationRules` |
| **`ReportBookmark`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, reportId, label, filterState` |
| **`ReportShare`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, sharedById, sharedWithUserId, role, shareLink, expiresAt` |
| **`ReportVersion`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, version, queryConfig` |
| **`ReportExecutionLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, executedBy, executionType, status, rowCount, executionTimeMs` |
| **`ReportDrillPathConfig`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, fieldName, targetReportId, drillType, customUrl, paramMapping` |
| **`ReportDataSource`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, moduleName, tableName, connectionString, credentials` |
| **`ReportCacheConfig`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, ttlMinutes, invalidateOnUpdate, lastCachedAt, cacheSizeBytes, createdAt` |
| **`ReportAlertRule`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, name, condition` |
| **`ReportScheduleInstance`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, scheduleJobId, scheduledAt, startedAt, completedAt, status, rowCount` |
| **`ReportAuditLog`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, userId, action, details, ipAddress, createdAt` |
| **`ReportFilterPreset`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, name, filterState` |
| **`ReportColumnPreference`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, reportId, columnConfig` |
| **`DocumentAnnotation`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, versionId, pageNumber, x, y, width` |
| **`DocumentComment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, parentId, content, createdBy, createdAt, updatedAt` |
| **`DocumentTag`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, color, createdBy, createdAt, tagAssignments` |
| **`DocumentTagAssignment`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, tagId, documentId, createdAt, tag, document` |
| **`DocumentLock`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, lockedBy, lockedAt, reason, document` |
| **`DocumentWorkflow`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, workflowId, status, initiatedBy, initiatedAt, completedAt` |
| **`DocumentExport`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, format, status, fileUrl, fileSize, requestedBy` |
| **`DocumentAuditLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, action, actorId, details, ipAddress, userAgent` |
| **`DocumentSmartCollection`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, query` |
| **`DocumentFavorite`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, userId, createdAt, document` |

### 📄 Schema: `core-part-11.prisma` (108 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`ValueStreamMapItem`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, mapName, stepNo, stepName, stepType, cycleTimeMin` |
| **`TpmPillar`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, pillarType, description, score, targetScore` |
| **`TpmPillarActivity`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, pillarId, title, description, activityType, stepNo, score` |
| **`TpmAudit5S`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, auditorId, sortScore, setInOrderScore, shineScore, standardizeScore` |
| **`TpmKpi`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, pillarId, workstationId, kpiType, value, target, period` |
| **`ContractManufacturer`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, vendorId, contactPerson, email, phone` |
| **`OutsourcingPurchaseOrder`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNo, contractMfgId, status, orderDate, expectedDate, receivedDate` |
| **`OutsourcingPoItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, poId, productId, quantity, unitPrice, totalPrice, receivedQty` |
| **`SubcontractedReceipt`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, receiptNo, poId, contractMfgId, receivedAt, receivedBy, status` |
| **`DdmrpPart`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, leadTimeDays, demandTimeFenceDays, ddmrpType, zone, createdAt` |
| **`DdmrpBuffer`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, partId, greenZone, yellowZone, redZone, topOfGreen, topOfYellow` |
| **`DdmrpNetFlowStatus`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, partId, netFlow, onHand, onOrder, qualifiedDemand, dailyDemandRate` |
| **`DdmrpRecommendation`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, partId, recommendation, priority, quantity, reason, actionType` |
| **`AnalyticsReportFilter`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, field, operator, value, createdAt, report` |
| **`AnalyticsDashboardWidget`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, dashboardId, widgetType, title, config` |
| **`AnalyticsKpiValue`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiId, value, periodStart, periodEnd, metadata, createdAt` |
| **`AnalyticsScheduledExport`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, dataset, format, schedule, recipients` |
| **`FormTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, category, icon, status` |
| **`FormField`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, name, label, fieldType, required, placeholder` |
| **`FormSubmission`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, data, metadata, status, submittedBy, submittedAt` |
| **`FormAnalytic`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, totalViews, totalSubmissions, completionRate, avgTimeToComplete, fieldStats` |
| **`PageTemplate`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, category, layout, sections` |
| **`PageSection`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, name, type, content, settings, sortOrder` |
| **`WorkflowDefinition`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, category, trigger, nodes` |
| **`WorkflowDefinitionStep`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, name, type, config, sortOrder, createdAt` |
| **`WorkflowExecution`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, trigger, input, output, status, startedAt` |
| **`WorkflowTransition`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromNodeId, toNodeId, condition, label, createdAt, tenant` |
| **`WorkflowTask`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, instanceId, nodeId, assigneeId, assigneeRole, status, dueAt` |
| **`WorkflowSlaRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, nodeId, slaLimitHours, severity, notifyRoles, createdAt` |
| **`WorkflowEscalationRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, slaRuleId, escalateAfterMinutes, escalateToRole, escalateToUser, notifyChannel, createdAt` |
| **`WorkflowAuditLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, instanceId, taskId, action, actorId, details, createdAt` |
| **`AiModel`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, provider, modelId, version, description, capabilities` |
| **`AiModelDeployment`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelId, endpoint, apiKey, config, status, createdAt` |
| **`AiPrompt`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, category, prompt, variables` |
| **`AiConversation`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, title, context, metadata, status, createdAt` |
| **`AiConversationMessage`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, conversationId, role, content, metadata, tokensUsed, modelUsed` |
| **`AiDocument`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, contentType, content, source, metadata, status` |
| **`AiDocumentChunk`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, content, chunkIndex, tokenCount, metadata, createdAt` |
| **`AiEmbedding`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, chunkId, vector, model, metadata, createdAt` |
| **`AiAgent`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, systemPrompt, modelId, config` |
| **`AiAgentTool`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, agentId, name, type, config, enabled, createdAt` |
| **`AiTrainingJob`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, modelId, dataset, config, status` |
| **`AiTrainingRun`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, jobId, epoch, metrics, loss, accuracy, status` |
| **`AiIntentTrainingExample`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, intent, text, language, confidence, metadata, createdAt` |
| **`AiNluEntity`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, trainingExampleId, entity, value, startPos, endPos, createdAt` |
| **`AiModelAccuracyMetric`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, modelId, metric, value, recordedAt, metadata, createdAt` |
| **`AnalyticsKpiDefinition`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, formula, target, unit` |
| **`AnalyticsTrendResult`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiDefinitionId, period, periodStart, periodEnd, value, previousValue` |
| **`AnalyticsCrossFilterDashboard`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, layout, filters, widgets, isActive` |
| **`AnalyticsBiMetricDefinition`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, sourceTable, sourceColumn, aggregation` |
| **`ChatRoom`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, description, topic, isArchived, isPrivate` |
| **`ChatRoomMember`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomId, userId, role, joinedAt, createdAt, room` |
| **`ChatMessage`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomId, senderId, content, contentType, metadata, isEdited` |
| **`ChatMessageReaction`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, userId, emoji, createdAt, message` |
| **`MessageReadReceipt`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, userId, readAt, message` |
| **`VideoCallRoom`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, roomId, type, status, settings, createdBy` |
| **`VideoCallParticipant`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, callId, userId, role, status, joinedAt, leftAt` |
| **`CommunicationFileShare`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, roomId, messageId, uploadedBy, name, mimeType, size` |
| **`Announcement`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, priority, status, createdBy, scheduledAt` |
| **`AnnouncementTarget`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, announcementId, targetType, targetId, createdAt, announcement` |
| **`DriveFolder`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, parentId, ownerId, description, color, icon` |
| **`DriveFolderPermission`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, folderId, userId, role, createdAt, updatedAt, folder` |
| **`DriveFile`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, folderId, name, mimeType, extension, size, storagePath` |
| **`DriveFileVersion`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, version, size, storagePath, checksum, metadata` |
| **`DriveFileComment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, userId, content, parentId, resolved, createdAt` |
| **`DriveShareLink`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, token, permission, password, expiresAt, maxDownloads` |
| **`DriveStorageQuota`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, storageUsed, storageLimit, fileCount, folderCount, trashedSize, createdAt` |
| **`DriveActivity`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, action, entityType, entityId, entityName, details` |
| **`DriveFolderShare`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, folderId, sharedWithUserId, permission, createdAt, folder` |
| **`DriveFileTag`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, color, files` |
| **`DriveFileTagMapping`** | 5 fields | 🌐 Global / Reference | `id, fileId, tagId, file, tag` |
| **`DriveTrashItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, deletedAt, originalPath, deletedBy, file` |
| **`DynamicDiscountOffer`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, customerId, discountPercent, discountDays, offerAmount, status` |
| **`SupplyChainFinanceProgram`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, programType, fundingLimit, utilizedAmount, interestRate, feeStructure` |
| **`CloseTaskDependency`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, taskId, dependsOnTaskId, dependencyType, lagDays, isCritical, createdAt` |
| **`CloseTaskSla`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, taskId, deadlineAt, slaMinutes, priority, escalateAfter, escalationLevel` |
| **`CloseCalendarEvent`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, periodId, eventType, title, description, dueAt, completedAt` |
| **`CloseEscalationRule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, conditionField, conditionOperator, conditionValue, escalateToRole, escalateToUser` |
| **`CloseAnalyticsSnapshot`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, periodId, totalTasks, completedTasks, overdueTasks, breachedSlas, avgCompletion` |
| **`ConsolidationGroup`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, groupType, baseCurrency, consolidationMethod, ownershipThreshold, isActive` |
| **`ConsolidationGroupMember`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, entityId, ownershipPercent, consolidationMethod, functionalCurrency, isDirectSubsidiary` |
| **`ConsolidationExecution`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, periodId, status, totalEliminations, minorityInterest, translationAdjustment` |
| **`ConsolidationEliminationRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, name, ruleType, sourceEntityId, targetEntityId, matchCriteria` |
| **`ConsolidationEliminationEntry`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, ruleId, sourceEntityId, targetEntityId, accountId, amount` |
| **`ConsolidationTranslationAdjustment`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, entityId, accountId, originalAmount, translatedAmount, exchangeRate` |
| **`MinorityInterestSchedule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, entityId, nciPercentage, netIncomeShare, equityShare, dividendShare` |
| **`CustomerCreditScorecard`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, scoreRangeMin, scoreRangeMax, weightPaymentHistory, weightCreditUtilization, weightInvoiceAging` |
| **`CustomerCreditScore`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, scorecardId, overallScore, riskRating, paymentScore, utilizationScore` |
| **`VendorRiskAssessment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, assessmentType, riskScore, riskRating, assessmentData, assessorId` |
| **`MarketRiskExposure`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, riskType, exposureAmount, currency, instrumentType, counterparty, maturityDate` |
| **`OperationalRiskEvent`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventType, severity, description, lossAmount, recoveryAmount, rootCause` |
| **`RiskControlMeasure`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, controlType, riskCategory, description, controlOwner, testFrequency` |
| **`EmissionSourceRecord`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, sourceName, scope, category, fuelType, quantity, unit` |
| **`EmissionOffsetCredit`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, creditType, quantityTonnes, creditPrice, totalCost, vintageYear, registryId` |
| **`EsgKpiDefinition`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiCode, kpiName, category, subCategory, unit, description` |
| **`EsgKpiActualValue`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiId, fiscalYear, period, actualValue, targetValue, variance` |
| **`EsgReportTemplate`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateName, reportingFramework, templateConfig, isDefault, lastGeneratedAt, createdAt` |
| **`EsgDisclosureMapping`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, framework, standardCode, disclosureName, mappedKpiId, mappedField, notes` |
| **`SustainabilityTarget`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, targetName, targetType, baselineYear, baselineValue, targetValue, targetYear` |
| **`TaxProvisionRun`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, fiscalYear, period, status, effectiveTaxRate, currentTaxExpense, deferredTaxExpense` |
| **`TaxProvisionDetail`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, jurisdiction, taxableIncome, taxRate, currentTaxAmount, credits` |
| **`DeferredTaxSchedule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, accountId, temporaryDifference, deferredTaxAsset, deferredTaxLiability, taxRate` |
| **`UncertainTaxPosition`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, positionName, jurisdiction, description, taxAmountAtRisk, probabilityOfLoss` |
| **`ValuationAllowanceAssessment`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, jurisdiction, deferredTaxAssetId, allowanceAmount, assessmentType, positiveEvidence` |
| **`ApprovalRoutingRule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, triggerEvent, conditionField, conditionOperator, conditionValue, approverId` |
| **`AiForecastScenario`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, scenarioName, scenarioType, forecastHorizon, baseCurrency, assumptions, confidenceLevel` |
| **`AiForecastScenarioLine`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, scenarioId, periodDate, category, subCategory, projectedAmount, actualAmount` |
| **`AnomalyDetectionRun`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, runName, detectionScope, algorithmType, dateRangeStart, dateRangeEnd, totalScanned` |

### 📄 Schema: `core-part-4.prisma` (107 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`TenantWebhookEndpoint`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, url, secret, events, isActive, lastSuccessAt` |
| **`TenantWebhookDelivery`** | 15 fields | ✅ Yes (`tenantId`) | `id, endpointId, tenantId, event, payload, status, httpStatus, responseBody` |
| **`TenantAnnouncement`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, body, level, isDismissible, startsAt, expiresAt` |
| **`ExpenseReport`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, employeeId, reportNumber, title, description, totalAmount` |
| **`ExpenseReportItem`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, expenseReportId, category, description, merchant, amount, taxAmount` |
| **`ExpenseCategoryPolicy`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, category, description, maxAmountPerItem, receiptRequiredAbove, isActive, createdAt` |
| **`MileageRate`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, ratePerMile, effectiveDate, endDate, notes, createdAt` |
| **`PerDiemRate`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, location, dailyRate, currency, isActive, createdAt, updatedAt` |
| **`CorporateCard`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, provider, last4, nickname, isActive, isFrozen` |
| **`CardSpendLimit`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, cardId, scopeType, scopeId, period, amountCap, currentSpend` |
| **`CardCategoryLimit`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, cardId, mccCategory, amountCap, currentSpend, period, periodStart` |
| **`CardLimitAuditLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, limitId, limitType, changedByUserId, oldValue, newValue, action` |
| **`CardLimitIncreaseRequest`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, limitId, requestedByUserId, currentCap, requestedCap, reason, status` |
| **`CorporateCardTransaction`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, cardId, transactionDate, merchant, amount, status, createdAt` |
| **`RevenueSchedule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, invoiceId, description, totalAmount, deferredAmount, recognizedAmount` |
| **`Subscription`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, customerId, productId, currency` |
| **`SubscriptionLine`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, productId, description, unitAmount, quantity, taxRate` |
| **`SubscriptionInvoice`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, invoiceId, periodStart, periodEnd, sequenceNumber, status` |
| **`SubscriptionUsage`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, usageDate, metricName, quantity, unitAmount, totalAmount` |
| **`ConsolidationRun`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, runDate, periodStart, periodEnd, period, targetCurrency, ctaAmount` |
| **`ConsolidationElimination`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, consolidationId, fromOrgId, toOrgId, amount, accountType, description` |
| **`RecurringJournal`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, entryTemplate, frequency, nextRunDate, lastRunDate, status` |
| **`FixedAsset`** | 32 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, assetCode, name, description, categoryId, purchaseDate` |
| **`AssetDepreciation`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, date, amount, periodName, accumulatedDepreciation, bookValue` |
| **`BankAccount`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, accountId, bankName, accountNumber, currency, status` |
| **`CreditNote`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, invoiceId, noteNumber, amount, lineItems` |
| **`DebitNote`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, purchaseOrderId, billId, noteNumber, amount` |
| **`DunningLevel`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, levelName, levelNumber, daysOverdue, maxOverdueDays, feeAmount` |
| **`DunningRun`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, title, runDate, levelIds, customerIds, minOverdueDays` |
| **`TaxRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, isDefault, status, createdAt` |
| **`TaxComponent`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, taxRuleId, name, rate, accountId, taxRule, account` |
| **`WithholdingTax`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, rate, threshold, accountId, organization` |
| **`TaxFiling`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, filingType, periodStart, periodEnd, status, payload` |
| **`TreasuryTransaction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, type, amount, currency, description, date` |
| **`InterCompanyTransfer`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromOrgId, toOrgId, amount, currency, date, status` |
| **`QualityInspection`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, inspectionNumber, referenceType, referenceId, referenceDoc, productId` |
| **`QAInspectionCheckpoint`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, inspectionId, parameter, criteria, result, observedValue, remarks` |
| **`QAInspectionTemplate`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, productId, checklist, isActive, createdAt, updatedAt` |
| **`Campaign`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, status, type, budget, actualCost` |
| **`SalesReturn`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, salesOrderId, deliveryNoteId, returnNumber, status` |
| **`SalesReturnItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, salesReturnId, productId, description, quantity, unitPrice, taxRate` |
| **`PurchaseReturn`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, purchaseOrderId, purchaseReceiptId, returnNumber, status` |
| **`PurchaseReturnItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, purchaseReturnId, productId, description, quantity, unitPrice, taxRate` |
| **`Workstation`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, capacityHours, hourlyOverheadRate, createdAt` |
| **`MRPRun`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, runDate, status, runBy, plannedItems` |
| **`MRPPlannedItem`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, mrpRunId, productId, bomId, demandSource, demandSourceId, quantityNeeded` |
| **`QualityInspectionPlan`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, name, code, status, checks, createdAt` |
| **`NonConformanceReport`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, qualityInspectionId, workOrderId, productId, title, description, disposition` |
| **`MachineDowntimeLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, downtimeCode, startTime, endTime, durationMinutes, notes` |
| **`MaintenanceRequest`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, type, priority, title, description, status` |
| **`SubcontractingOrder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, productId, bomId, quantity, unitCost, totalCost` |
| **`WorkstationShift`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, name, startTime, endTime, daysOfWeek, workstation` |
| **`SubcontractingMaterial`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, subcontractingOrderId, productId, requiredQty, issuedQty, consumedQty, subcontractingOrder` |
| **`EquipmentTool`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, name, code, maxCycles, currentCycles, lastCalibrationDate` |
| **`EngineeringChangeOrder`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, bomId, changeDescription, requestedBy, approvedBy, status, createdAt` |
| **`BuilderForm`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, icon, status, module` |
| **`BuilderWorkflow`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, docType, status, trigger, nodes` |
| **`BuilderDashboard`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, icon, status, widgets` |
| **`BuilderModule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, icon, color, status` |
| **`AppRelease`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, moduleId, version, channel, changelog, snapshot` |
| **`AutomationRule`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, trigger, triggerConfig` |
| **`DataImportJob`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, targetModel, fileName, fileSize, totalRows, importedRows` |
| **`AdvancedForm`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, status, formType, fields` |
| **`FormCondition`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, formId, fieldId, operator, value, action, targetFieldId` |
| **`FormCalculatedField`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, formId, name, label, formula` |
| **`FormPage`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, formId, title, order, fieldIds, settings` |
| **`FormAnalytics`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, formId, views, starts, submissions, completions, avgTimeSec` |
| **`FormVersion`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, formId, version, fields, settings` |
| **`BpmnProcessDefinition`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, key, description, version, status, bpmnXml` |
| **`BpmnProcessInstance`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, status, variables` |
| **`BpmnActivityInstance`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, instanceId, elementId, elementType, label, status, assignedTo` |
| **`BpmnTimerDefinition`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, elementId, timerType, timerValue, settings` |
| **`ApiEndpoint`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, path, method, description, status, source` |
| **`ApiEndpointMapping`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, endpointId, sourceField, targetField, transform, defaultValue, required` |
| **`ApiTestRun`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, endpointId, status, request` |
| **`ApiTestResult`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, testName, passed, actual` |
| **`DecisionTable`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, status, priority, hitPolicy, inputs` |
| **`DecisionTableRule`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, tableId, priority, inputValues` |
| **`RuleSet`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, status, version, settings` |
| **`RuleDefinition`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleSetId, name, description, priority, condition, actions` |
| **`RuleEvaluationLog`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleSetId, ruleId, input` |
| **`EtlDataSource`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, config` |
| **`EtlPipeline`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, sourceId, status, schedule, mappings` |
| **`EtlMapping`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, pipelineId, sourceField, targetField, transform, defaultValue, required` |
| **`EtlJobRun`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, pipelineId, status, inputRows, outputRows, errorRows, durationMs` |
| **`MobileApp`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, icon, status, platform` |
| **`MobileScreen`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, name, type, components` |
| **`MobileNotificationConfig`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, provider, credentials` |
| **`MobileBuild`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, platform, version, buildNumber, status, artifactUrl` |
| **`ThemeConfig`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, status, isDefault, tokens` |
| **`DesignToken`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, themeId, category, name, type, value, description` |
| **`TokenValue`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, tokenId, mode, value, createdAt, updatedAt` |
| **`ThemeSnapshot`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, themeId, version, tokens` |
| **`AbTest`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, status, type, pageId, pagePath` |
| **`AbTestVariant`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, testId, name, type, changes` |
| **`AudienceSegment`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, status, rules` |
| **`SegmentRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, segmentId, field, operator, value, logic, order` |
| **`PersonalizationRule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, status, segmentId, priority, actions` |
| **`BlogPost`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, slug, content, excerpt, category, tags` |
| **`SchemaRegistry`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, module, name, slug, description, isCustom, fields` |
| **`PageRegistry`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, schemaId, module, slug, title, type, layout` |
| **`CustomRecord`** | 4 fields | ✅ Yes (`tenantId`) | `id, tenantId, schemaId, data` |
| **`AppNavOverlay`** | 4 fields | ✅ Yes (`tenantId`) | `id, tenantId, moduleId, config` |
| **`PriceBook`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, currency, isDefault, validFrom` |
| **`PriceBookEntry`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, priceBookId, productId, listPrice, minQuantity, createdAt, updatedAt` |
| **`ContactTag`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, color, createdAt, contacts` |
| **`ContactTagLink`** | 5 fields | 🌐 Global / Reference | `id, contactId, tagId, contact, tag` |

### 📄 Schema: `core-part-10.prisma` (106 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`EcommerceProductVariant`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, listingId, sku, title, attributes` |
| **`EcommerceInventory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, variantId, quantity, reserved, location, createdAt, updatedAt` |
| **`EcommerceCart`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, sessionId, customerId, couponCode, subtotal, discount` |
| **`EcommerceCartItem`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, cartId, variantId, quantity, unitPrice, lineTotal, createdAt` |
| **`EcommerceOrder`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, orderNumber, customerId, customerEmail, customerName, customerPhone` |
| **`EcommerceOrderItem`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, variantId, productName, sku, quantity, unitPrice` |
| **`EcommercePayment`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, method, amount, reference, status, gateway` |
| **`EcommerceShipment`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, trackingNumber, carrier, method, status, shippedAt` |
| **`EcommerceReturn`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, returnNumber, status, reason, resolution, refundAmount` |
| **`EcommerceReview`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, listingId, orderId, customerId, customerName, rating, title` |
| **`EcommerceReviewMedia`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, reviewId, url, type, createdAt, review` |
| **`EcommerceCoupon`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, code, description, type, value, minOrderAmount` |
| **`EcommerceCouponUsage`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, couponId, orderId, customerId, discountAmount, createdAt, coupon` |
| **`EcommerceShippingZone`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, name, description, countries, regions, zipCodes` |
| **`EcommerceShippingRate`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, zoneId, name, type, baseRate, perUnitRate, minWeight` |
| **`EcommerceTaxClass`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, name, description, isDefault, createdAt, updatedAt` |
| **`EcommerceTaxRate`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, classId, name, rate, country, region, zipCode` |
| **`EcommerceStoreSetting`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, key, value, createdAt, updatedAt, store` |
| **`EcommerceStoreTheme`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, name, isActive, config` |
| **`EcommerceAbandonedCart`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, sessionId, customerId, email, items, subtotal` |
| **`EcommerceWishlist`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, customerId, name, isPublic, createdAt, updatedAt` |
| **`EcommerceWishlistItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, wishlistId, variantId, createdAt, wishlist, variant` |
| **`SaasApp`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, shortDescription, icon, banner` |
| **`SaasAppVersion`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, version, changelog, minApiVersion, maxApiVersion, isPublished` |
| **`SaasAppInstallation`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, installingTenantId, versionId, status, permissions, settings` |
| **`SaasAppPermission`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, appId, permission, description, isRequired, createdAt, app` |
| **`SaasSubscriptionPlan`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, billingInterval, price, currency` |
| **`SaasSubscription`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscribingTenantId, planId, status, quantity, unitPrice, totalPrice` |
| **`SaasSubscriptionLineItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, description, type, quantity, unitPrice, totalPrice` |
| **`SaasUsageRecord`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, meterId, usage, metadata` |
| **`SaasUsageMeter`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, unit, aggregationType, resetPeriod, isActive` |
| **`SaasInvoice2`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, invoiceNumber, billingTenantId, status, subtotal, discountAmount` |
| **`SaasInvoice2LineItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, description, type, quantity, unitPrice, totalPrice` |
| **`SaasPayment2`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, subscriptionId, amount, currency, method, status` |
| **`SaasPaymentMethod2`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, tenantUserId, type, isDefault, last4, brand, expiryMonth` |
| **`SaasCoupon2`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, description, type, value, maxRedemptions, currentRedemptions` |
| **`SaasCoupon2Redemption`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, couponId, subscriptionId, discountAmount, createdAt, coupon, subscription` |
| **`SaasFeatureFlag`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, isEnabled, isGlobal, conditions` |
| **`TenantFeatureOverride`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, featureKey, overrideType, isEnabled, limitValue, reason, expiresAt` |
| **`SaasTenantSetting`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, category, key, value, createdAt, updatedAt` |
| **`SaasTenantDomain`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, domain, isPrimary, isVerified, verificationToken, verifiedAt, sslEnabled` |
| **`SaasAuditLog`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, actorId, actorType, action, resource, resourceId, details` |
| **`ControlPlaneAuditLog`** | 6 fields | 🌐 Global / Reference | `id, actorId, actorRole, targetId, action, details` |
| **`ControlPlaneApproval`** | 9 fields | 🌐 Global / Reference | `id, requestedBy, approvedBy, requestedAction, targetId, status, expiresAt, createdAt` |
| **`ControlPlaneReviewTask`** | 10 fields | 🌐 Global / Reference | `id, actorId, action, targetId, reason, status, reviewedBy, notes` |
| **`TenantConsent`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, grantedBy, status, expiresAt, createdAt, updatedAt` |
| **`ImpersonationSession`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, impersonatorId, targetUserId, consentId, status, expiresAt, createdAt` |
| **`SaasWebhookEndpoint`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, url, description, events, isActive, secret, retryCount` |
| **`SaasWebhookDelivery`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, endpointId, event, payload, responseStatus, responseBody, status` |
| **`SaasApiKey`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, key, prefix, hash, lastChars, createdBy` |
| **`SaasApiKeyScope`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, apiKeyId, scope, apiKey` |
| **`SaasSupportTicket`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, subject, description, category, priority, status, assignedTo` |
| **`SaasSupportTicketMessage`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, authorId, authorType, body, isInternal, createdAt` |
| **`SaasSupportTicketAttachment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, fileName, fileUrl, fileSize, mimeType, createdAt` |
| **`SaasAnnouncement`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, body, type, severity, isActive, startsAt` |
| **`SaasMaintenanceWindow`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, status, scheduledStart, scheduledEnd, actualStart` |
| **`AgileSprint`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, goal, startDate, endDate, status` |
| **`AgileBacklogItem`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, type, title, description, priority, status` |
| **`AgileSprintItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, sprintId, backlogItemId, status, completedAt, createdAt, sprint` |
| **`AgileRetrospective`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, sprintId, wentWell, toImprove, actionItems, teamMood, createdAt` |
| **`SkillCatalog`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, description, isActive, createdAt, updatedAt` |
| **`EvmForecast`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, forecastDate, eac, etc, vac, tcpi` |
| **`EvmKpiTarget`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, kpi, targetMin, targetMax, threshold, isActive` |
| **`EvmSnapshot`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, snapshotDate, pv, ev, ac, sv` |
| **`CapexProject`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, projectId, name, code, description, justification` |
| **`CapexBudgetLine`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, capexId, category, description, requested, approved, spent` |
| **`CapexGateReview`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, capexId, gateName, gateNumber, status, reviewDate, reviewerId` |
| **`CapexCapitalization`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, capexId, assetName, assetClass, capitalAmount, capitalizationDate, usefulLifeYears` |
| **`VariationOrder`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, claimId, variationNumber, title, description, changeType` |
| **`ClaimDocument`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, claimId, name, type, fileUrl, mimeType, fileSize` |
| **`PmoScorecard`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, scorecardDate, overallScore, healthColor, assessedBy, notes` |
| **`PmoScorecardDimension`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, scorecardId, dimension, score, weight, status, comments` |
| **`StageGate`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, gateName, gateNumber, status, reviewDate, reviewerId` |
| **`GateChecklist`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, gateId, item, isRequired, isCompleted, completedBy, completedAt` |
| **`DiscussionReply`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, discussionId, content, authorId, isSolution, parentReplyId, createdAt` |
| **`DocumentReview`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, documentId, title, description, status, reviewerId` |
| **`ManufacturingRoute`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, isActive, totalLeadTimeMin, createdAt` |
| **`ManufacturingRouteOperation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, routeId, sequence, name, workstationCode, durationMinutes, setupMinutes` |
| **`ManufacturingQualityCheckTemplate`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, category, checks, isActive` |
| **`ManufacturingQualityCheck`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, workOrderId, productId, inspectorId, status, checkedQty` |
| **`ManufacturingScrapRecord`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, productId, scrappedQty, reason, reasonDetail, costImpact` |
| **`ManufacturingTimeEntry`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, operationId, employeeId, startTime, endTime, durationMin` |
| **`SpcChart`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, productId, product, chartType, subgroupId` |
| **`SpcSample`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, chartId, sampleNo, values, mean, range, stdDev` |
| **`FmeaWorksheet`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, code, title, type, status, createdAt` |
| **`FmeaItem`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, worksheetId, processStep, failureMode, effect, cause, currentControl` |
| **`ApqpProject`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, code, name, status, startDate, targetDate` |
| **`ApqpPhase`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, phaseNo, name, status, dueDate, completedAt` |
| **`PpapSubmission`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, apqpProjectId, level, status, product, submissionDate` |
| **`ToolingMaster`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, description, type, status, location` |
| **`ToolingCalibration`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, toolId, calibrationNo, calibratedBy, calibrationDate, nextDueDate, result` |
| **`ToolingUsageLog`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, toolId, workOrderId, operationId, startTime, endTime, cyclesUsed` |
| **`GageRrStudy`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, partNo, characteristic, appraisers, trials` |
| **`GageRrSample`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, studyId, appraiser, trial, partNo, value, createdAt` |
| **`ApsSchedule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, algorithm, status, horizonDays, scheduleJson, startedAt` |
| **`ApsJob`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, scheduleId, workOrderId, workstationId, sequence, durationMin, setupMin` |
| **`ApsConstraint`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, resourceId, resourceType, maxLoad, priority` |
| **`ApsSimulationScenario`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, baseScheduleId, whatIfJson` |
| **`EnergyMeter`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, meterType, location, workstationId, multiplier` |
| **`EnergyReading`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, meterId, reading, unit, cost, recordedAt, recordedBy` |
| **`EnergyKpiTarget`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, meterId, kpiType, targetValue, unit, period, startDate` |
| **`EnergyCostAllocation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, meterId, costCenterId, workOrderId, amount, allocationPct, periodStart` |
| **`KanbanBoard`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, boardType, status, columns, wipLimits` |
| **`KanbanCard`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, boardId, cardNo, title, description, columnName, cardType` |
| **`LeanImprovement`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, category, ideaType, benefit, estimatedSavings` |
| **`WasteLog`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, wasteType, description, quantity, impactCost, rootCause` |

### 📄 Schema: `core-part-2.prisma` (104 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`TicketComment`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, authorId, authorName, content, isInternal, attachments` |
| **`CannedResponse`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, category, shortcut, createdBy, createdAt` |
| **`TicketSla`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, priority, responseMins, resolutionMins, respondedAt, resolvedAt` |
| **`CustomerSatisfaction`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, rating, feedback, category, createdAt, ticket` |
| **`OmnichannelConversation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, contactId, contactName, contactEmail, contactPhone, platform` |
| **`ConversationMessage`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, conversationId, direction, content, contentType, attachments, metadata` |
| **`ChannelIntegration`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, platform, name, config` |
| **`BreakoutRoom`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, name, hostId, participantIds, isActive, createdAt` |
| **`MeetingAnalytics`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, totalParticipants, peakParticipants, avgDurationMins, totalScreenShares, totalMessages` |
| **`VoipCall`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, callerId, callerName, callerNumber, calleeNumber, direction, status` |
| **`VoipCallAnalytics`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, callId, totalCalls, answeredCalls, missedCalls, avgDuration, maxDuration` |
| **`Voicemail`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, callId, callerNumber, callerName, durationSecs, fileUrl, transcript` |
| **`IvrMenu`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, greeting, timeoutSecs, isActive, createdAt, updatedAt` |
| **`IvrOption`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, menuId, digit, action, actionValue, label, sortOrder` |
| **`SavedSearch`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, name, query, filters` |
| **`SearchHistory`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, query, scope, resultCount, createdAt` |
| **`SynonymDictionary`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, term, synonyms, createdAt, updatedAt` |
| **`CollabDocument`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, contentHtml, ownerId, isLocked, lockedBy` |
| **`CollabDocumentVersion`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, version, content, summary, authorId, createdAt` |
| **`Whiteboard`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, width, height, background, ownerId, collaborators` |
| **`WhiteboardElement`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, whiteboardId, type, properties` |
| **`CommSurvey`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, status, surveyType, settings` |
| **`CommSurveyQuestion`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, type, title, description, required, options` |
| **`CommSurveyResponse`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, respondentId, respondentEmail, metadata` |
| **`CommSurveyAnswer`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, responseId, questionId, value, createdAt, response, question` |
| **`CommSurveyTemplate`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, questions, settings` |
| **`POSTerminal`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, warehouseId, status, receiptTemplate` |
| **`POSRegister`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalId, openedById, openedAt, closedAt, startingCash, endingCash` |
| **`POSShift`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, registerId, employeeId, startTime, endTime, totalSales, totalReturns` |
| **`CashEntry`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, registerId, type, amount, reason, createdBy, createdAt` |
| **`POSOrder`** | 37 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, orderNumber, type, status, customerId, customerName` |
| **`POSOrderItem`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, productId, productName, sku, barcode, qty` |
| **`POSPayment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, method, amount, reference, cardLast4, authCode` |
| **`POSDiscount`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, value, appliesTo` |
| **`POSCoupon`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, discountId, maxUses, usedCount, validFrom, validTo` |
| **`POSTaxProfile`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, rates` |
| **`POSQuickKey`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalId, productId, label, color, position, categoryGroup` |
| **`POSLoyaltyProgram`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, pointsPerUnit, redeemRate, minRedeemPoints` |
| **`POSLoyaltyMember`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, customerId, name, email, phone, points` |
| **`POSLoyaltyTransaction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, memberId, orderId, type, points, balance` |
| **`POSGiftCard`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, code, initialBalance, currentBalance, currency, issuedTo` |
| **`POSGiftCardTransaction`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, giftCardId, orderId, type, amount, balance, notes` |
| **`POSStoreCredit`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, memberId, customerId, customerEmail, balance, currency, reason` |
| **`POSReturn`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, returnNumber, originalOrderId, type, status, reason` |
| **`POSReturnItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, returnId, orderItemId, productId, productName, qty, unitPrice` |
| **`POSHeldOrder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, terminalId, customerId, customerName, cashierId, label` |
| **`POSPriceList`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, currency, isDefault, validFrom` |
| **`POSPriceListItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, priceListId, productId, price, minQty, priceList` |
| **`POSPromotion`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, conditions` |
| **`POSOpenTab`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, terminalId, tabNumber, customerId, customerName, cashierId` |
| **`POSLayaway`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, layawayNumber, customerId, customerName, customerEmail, customerPhone` |
| **`POSLayawayPayment`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, layawayId, amount, method, reference, notes, createdAt` |
| **`SerialNumber`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, serialNo, serialNumber, status, purchaseDate` |
| **`SerialNumberHistory`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, serialNumberId, action, fromStatus, toStatus, reference, notes` |
| **`Batch`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, batchNo, batchNumber, lotNo, quantity, usedQty` |
| **`BinLocation`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, zone, aisle, rack, bin, code` |
| **`CycleCount`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, status, countedBy, countedAt, completedAt, approvedAt` |
| **`CycleCountItem`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, cycleCountId, productId, binLocationId, expectedQty, countedQty, varianceQty` |
| **`CycleCountSchedule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, zone, binScope, frequency, blindCount, nextDueDate` |
| **`LicensePlate`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, warehouseId, binId, status, closedAt, createdAt` |
| **`LicensePlateItem`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, licensePlateId, inventoryItemId, quantity, lotBatchId, serialNumberId, createdAt` |
| **`PutawayTask`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockEntryId, inventoryItemId, quantity, suggestedBinId, status, completedAt` |
| **`BatchQuarantineLog`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, action, reason, performedBy, createdAt, batch` |
| **`TransferApprovalRule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, thresholdValue, isActive, createdAt, updatedAt, warehouse` |
| **`PickWave`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, waveNumber, warehouseId, status, notes, createdBy` |
| **`PickWaveOrder`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, pickWaveId, salesOrderId, createdAt, pickWave` |
| **`PickWaveItem`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, pickWaveId, productId, binLocationId, quantity, pickedQty, status` |
| **`ConsignmentStock`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, supplierName, productId, warehouseId, quantityOnHand, unitCost` |
| **`ConsignmentConsumption`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, consignmentStockId, quantity, totalCost, billed, billedAt, reference` |
| **`DropShipProvider`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, vendorId, isActive, shipMethods, carrier` |
| **`DropShipOrder`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, providerId, vendorId, salesOrderId, customerId, shipToAddress` |
| **`DropShipOrderItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, productId, quantity, shippedQty, unitPrice, totalPrice` |
| **`AvailableToPromise`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, onHand, onOrder, allocated, available` |
| **`AtpReservation`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, atpId, referenceId, referenceType, quantity, committedUntil, status` |
| **`RfidTag`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, epc, tagType, productId, licensePlateId, status, lastLocation` |
| **`RfidReadEvent`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, tagId, antenna, reader, location, rssi, readAt` |
| **`Subinventory`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, code, name, type, isActive, description` |
| **`CustomerConsignmentStock`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, productId, warehouseId, quantityOnHand, unitPrice, totalValue` |
| **`CustomerConsignmentConsumption`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, consignmentId, quantity, totalValue, reference, consumedAt, createdAt` |
| **`DistributionPlanRun`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, runNumber, status, horizonDays, startDate, endDate, includeWarehouses` |
| **`DistributionPlan`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, productId, sourceWarehouseId, destWarehouseId, forecastDemand, projectedStock` |
| **`EdiInventoryTransaction`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, transactionId, ediType, direction, senderId, receiverId, status` |
| **`DockAppointment`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, warehouseId, dockDoor, type, carrierName, referenceType` |
| **`RecurringInvoiceTemplate`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, templateName, frequency, intervalCount, startDate` |
| **`GeneratedInvoice`** | 7 fields | ✅ Yes (`tenantId`) | `id, templateId, tenantId, invoiceId, invoiceNumber, totalAmount, generatedAt` |
| **`CustomerStatement`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, periodStart, periodEnd, openingBalance, closingBalance` |
| **`StatementTemplate`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, templateName, headerText, footerText, includePaymentHistory, includeAgingBreakdown` |
| **`Currency`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, symbol, isBase, decimalPlaces, createdAt` |
| **`VendorBill`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, billNumber, billDate, dueDate, purchaseOrderId` |
| **`VendorBillLineItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, vendorBillId, tenantId, description, quantity, unitPrice, subtotal, taxRate` |
| **`ExchangeRate`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromCurrency, toCurrency, rate, date, createdAt, updatedAt` |
| **`CurrencyRevaluation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, runNumber, asOfDate, baseCurrency, status, totalGain` |
| **`EInvoice`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, invoiceId, format, status, irn, qrPayload` |
| **`CostCenter`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, code, name, parentId, isActive, createdAt` |
| **`Journal`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, entryNumber, date, status, notes, createdBy` |
| **`JournalEntry`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, journalId, accountId, departmentId, costCenterId, projectId, debit` |
| **`Budget`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, accountId, costCenterId, projectId, forecastScenarioId, amount` |
| **`ForecastScenario`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, inflowFactor, outflowFactor, status` |
| **`TaxRate`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, rate, isSystem, createdAt, updatedAt` |
| **`BankReconciliation`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, accountId, statementDate, statementBalance, status, createdAt, updatedAt` |
| **`SalaryComponent`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, isPercent, value, isSystem, createdAt` |
| **`SalaryStructure`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, baseSalary, allowances` |
| **`AttendanceRecord`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, date, checkIn, checkOut, status, overtime` |
| **`AssetAssignment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, assetType, assetName, serialNumber, assignedDate, returnDueDate` |

### 📄 Schema: `core-part-6.prisma` (104 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`FixedAssetAuditLog`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, action, fieldName, oldValue, newValue, changedBy` |
| **`DuplicateRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, entity, matchFields, threshold, action, active` |
| **`PipelineStage`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, pipelineId, name, order, probability, isWon, isLost` |
| **`Segment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, entity, criteria, isDynamic, createdAt, updatedAt` |
| **`SegmentMember`** | 5 fields | 🌐 Global / Reference | `id, segmentId, entityId, addedAt, segment` |
| **`SlaPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, entity, priority, firstResponseMins, resolutionMins, businessHoursId` |
| **`SlaBreach`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, entity, entityId, policyId, breachType, breachedAt, createdAt` |
| **`ContractLineItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, productId, quantity, unitPrice, discount, createdAt` |
| **`BankConnection`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, bankName, accountNumber, accountType, credentialsHash, status` |
| **`BankTransaction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, connectionId, date, description, amount, status, matchedEntityId` |
| **`ForecastWeek`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, weekStart, projectedInflow, projectedOutflow, adjustments, net, comments` |
| **`InterCompanyTransaction`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, fromOrgId, toOrgId, date, description, amount, currency` |
| **`FxRevaluationRun`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, runDate, targetCurrency, status, notes, journalId` |
| **`FxRevaluationDetail`** | 12 fields | 🌐 Global / Reference | `id, runId, accountId, entityType, entityId, balanceInForeign, originalAmountBase, revaluedAmountBase` |
| **`APMatchRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, quantityTolerancePercent, priceTolerancePercent, effectiveDate, status, createdAt` |
| **`APMatchException`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, poLineId, varianceType, varianceAmount, variancePercent, expectedValue` |
| **`CloseTask`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, financialPeriodId, name, description, category, assigneeId, dueDate` |
| **`VarianceFlag`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, financialPeriodId, accountId, currentAmount, priorAmount, varianceAmount, variancePercent` |
| **`BudgetScenario`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, fiscalYear, isLocked` |
| **`BudgetScenarioLine`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, scenarioId, accountId, costCenterId, month, amount, driverType` |
| **`APInvoiceCapture`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileName, vendorName, invoiceNumber, invoiceDate, dueDate, totalAmount` |
| **`APInvoiceCaptureLine`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, captureId, description, quantity, unitPrice, amount, suggestedAccountId` |
| **`AllocationRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, isActive, allocationType, basisType, sourceAccountId` |
| **`AllocationRun`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleId, runDate, periodStart, periodEnd, allocatedAmount, journalId` |
| **`EliminationRule`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, isActive, sourceOrgId, destinationOrgId, matchingCriteria` |
| **`EliminationRun`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, periodStart, periodEnd, runDate, status, totalEliminated, rulesAppliedCount` |
| **`EliminationRunDetail`** | 10 fields | 🌐 Global / Reference | `id, runId, ruleId, transactionId, amount, currency, createdAt, run` |
| **`BudgetPeriodAmount`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, budgetId, period, amount, createdAt, updatedAt, budget` |
| **`BudgetControlConfig`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, enforcementAction, checkInvoices, checkJournals, checkExpenses, tolerancePercentage, createdAt` |
| **`BudgetReallocation`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, number, description, status, requestedBy, approvedBy` |
| **`BudgetReallocationLine`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, budgetReallocationId, budgetId, type, amount, createdAt, updatedAt` |
| **`TaxJurisdiction`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, country, state, county, taxType` |
| **`TaxExemptionCertificate`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, jurisdictionId, certificateNumber, exemptionType, exemptionPct` |
| **`TaxReconciliation`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, periodStart, periodEnd, taxType, outputTax, inputTax, netLiability` |
| **`WithholdingCertificate`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, year, withholdingTaxId, grossAmount, taxWithheld, certificateNumber` |
| **`AmendedTaxFiling`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, originalFilingId, amendedReason, changes` |
| **`TreasuryPosition`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, positionDate, currency, bookBalance, availableBalance, floatAmount` |
| **`HedgeInstrument`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, instrumentType, name, counterparty, notionalAmount, currency` |
| **`DebtFacility`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, facilityType, lender, currency, facilityLimit` |
| **`VendorStatement`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, periodStart, periodEnd, openingBalance, closingBalance, lineItems` |
| **`APDuplicateFlag`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, duplicateInvoiceId, matchScore, matchCriteria` |
| **`APApprovalPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, thresholdMin, thresholdMax, approverRoles, requiresTwo, departmentCode` |
| **`GrniRecord`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, purchaseOrderId, receiptId, vendorId, productId, receivedQty` |
| **`ARPromiseToPay`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, invoiceId, promisedDate, promisedAmount, receivedAmount, status` |
| **`ARDispute`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, customerId, reason, disputedAmount, resolvedAmount, openedBy` |
| **`BadDebtProvision`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, method, provisionPct, provisionAmount, details` |
| **`AssetInsurance`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, policyNumber, insurer, coverageType, coverageAmount, premium` |
| **`AssetImpairment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, testDate, carryingAmount, recoverableAmount, impairmentLoss, reason` |
| **`CapitalProject`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, code, name, description, budgetAmount, actualSpend` |
| **`CapitalProjectCost`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, capitalProjectId, costDate, description, costType, amount, vendorId` |
| **`RollingForecast`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, accountId, costCenterId, amount, source` |
| **`HeadcountPlan`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, departmentId, roleName, period, plannedHc, loadedCostRate` |
| **`BudgetComment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, budgetId, accountId, period, authorId, text, parentId` |
| **`ManagementReport`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, period, sections` |
| **`BillingRule`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, ruleType, customerId, projectId, contractId, currency` |
| **`BillingMilestone`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, billingRuleId, name, description, dueDate, amount, completionPct` |
| **`ContractModification`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, modificationDate, modType, originalValue, newValue, cumulativeAdjustment` |
| **`DeferredRevenueRollForward`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, openingBalance, addedAmount, recognizedAmount, adjustments` |
| **`TieredPricingTable`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, currency, unit, tiers` |
| **`ControlTest`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, controlId, testDate, testerId, result, findingNotes, remediationPlan` |
| **`SodConflict`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, roleId, permission1, permission2, riskLevel, detectedAt` |
| **`AuditConfirmation`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, confirmationType, entityType, entityId, entityName, requestDate, responseDate` |
| **`PeriodCertification`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, certifierRole, certifierId, certifierName, status` |
| **`SodRuleDefinition`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, permission1, permission2, riskLevel, description, isActive` |
| **`IntercompanyLoan`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, lenderOrgId, borrowerOrgId, loanNumber, principalAmount, interestRate, startDate` |
| **`LoanDrawdown`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, loanId, amount, drawdownDate, reference, createdAt, loan` |
| **`LoanRepayment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, loanId, principal, interest, repaymentDate, reference, createdAt` |
| **`AssetRevaluation`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, revaluationDate, carryingValueBefore, revaluedValue, gainLoss, glJournalId` |
| **`AssetDisposal`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, disposalDate, disposalType, salePrice, gainLoss, glJournalId` |
| **`CashPool`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, poolType, headerAccountId, participantAccountIds, targetBalance` |
| **`CashPoolRun`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, cashPoolId, runDate, runType, totalSwept, details, glJournalId` |
| **`VarianceAlertConfig`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, accountId, thresholdPct, ownerId, isActive, createdAt, updatedAt` |
| **`ConsolidationRate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, fromCurrency, toCurrency, averageRate, closingRate, historicalRate` |
| **`Vendor1099Profile`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, is1099Vendor, formType, defaultBox, taxIdType, taxIdMasked` |
| **`Form1099`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, taxYear, formType, boxAmounts` |
| **`Form1099Batch`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, taxYear, name, status, formCount, totalAmount, submittedAt` |
| **`EconomicNexusThreshold`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, country, state, revenueThreshold, transactionThreshold, measurementPeriod, includesExemptSales` |
| **`NexusMonitoringSnapshot`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, country, state, periodStart, periodEnd, totalRevenue, transactionCount` |
| **`NexusRegistration`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, country, state, status, registrationNumber, registeredAt, effectiveDate` |
| **`GamificationBadge`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, icon, criteriaType, criteriaValue` |
| **`GamificationBadgeAward`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, badgeId, userId, context` |
| **`SalesStreak`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, streakType, currentStreak, bestStreak, lastCountedDate` |
| **`CommissionPlan`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, effectiveStart, effectiveEnd, isActive` |
| **`CommissionPlanTier`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, minAttainmentPct, maxAttainmentPct, commissionRate, sortOrder, createdAt` |
| **`CommissionSpiff`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, planId, name, criteriaType, criteriaValue` |
| **`CommissionPayout`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, planId, userId, period, quotaAmount, attainedAmount` |
| **`CommissionPayoutSpiffLine`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, payoutId, spiffId, amount, reason, createdAt, payout` |
| **`ReturnReasonCode`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, description, isActive, createdAt, updatedAt` |
| **`VendorRmaRequest`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, rmaNumber, purchaseReturnId, vendorId, reasonCodeId, status` |
| **`VendorReturnShipment`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaRequestId, warehouseId, shipmentNumber, carrier, trackingNumber, status` |
| **`LaborStandard`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, taskType, description, standardMins, warehouseId, isActive, createdAt` |
| **`WorkerTaskLog`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, workerId, workerName, warehouseId, taskType, referenceId, referenceType` |
| **`SupplierScorecard`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, periodStart, periodEnd, qualityScore, deliveryScore, fillRateScore` |
| **`SupplierNcr`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, ncrNumber, vendorId, productId, warehouseId, referenceId, referenceType` |
| **`SupplierCarRequest`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, carNumber, ncrId, vendorId, rootCause, correctiveAction, dueDate` |
| **`BinReplenishmentRule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, productId, activeBinCode, reserveBinCode, triggerQty, replenishQty` |
| **`ShippingCarrier`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, trackingUrl` |
| **`CarrierServiceLevel`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, carrierId, code, name, transitDays, isActive, createdAt` |
| **`AdvanceShippingNotice`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, asnNumber, vendorId, purchaseOrderId, warehouseId, shipDate, expectedArrival` |
| **`ASNLineItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, asnId, productId, expectedQty, receivedQty, uom, lotNumber` |
| **`InboundShipment`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentNumber, asnId, carrierId, warehouseId, trackingNumber, status` |
| **`OutboundShipment`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, shipmentNumber, salesOrderId, carrierId, serviceLevelId, warehouseId, trackingNumber` |
| **`ShipmentTrackingEvent`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, inboundShipmentId, outboundShipmentId, eventCode, description, location, occurredAt` |
| **`CapaRecord`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, capaNumber, title, type, source, sourceRefId, priority` |

### 📄 Schema: `core-part-1.prisma` (97 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Tenant`** | 7 fields | 🌐 Global / Reference | `id, name, slug, plan, residencyRegion, status, settings` |
| **`TenantLifecycleEvent`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventType, status, initiatedBy, retentionDays, payload, errorMessage` |
| **`SavedView`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, resourceName, name, state` |
| **`Passkey`** | 7 fields | 🌐 Global / Reference | `id, userId, credentialID, publicKey, counter, transports, createdAt` |
| **`Organization`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, legalName, taxId, email, phone, website` |
| **`Department`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, parentId, managerId, createdAt` |
| **`Customer`** | 50 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, type, name, email, phone, taxId` |
| **`Vendor`** | 42 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, type, name, email, phone, taxId` |
| **`Contact`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, salutation, firstName, lastName, email` |
| **`SalesPipeline`** | 4 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, stages` |
| **`ForecastSnapshot`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, periodStart, periodEnd, quotaAmount, pipelineAmount` |
| **`Quota`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, period, amount, createdAt, updatedAt` |
| **`DealTag`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, tag, createdAt, opportunity` |
| **`DealTeamMember`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, userId, role, accessLevel, createdAt, opportunity` |
| **`PipelineRiskAlert`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, opportunityId, alertType, riskLevel, daysInStage, message` |
| **`PortalPaymentIntent`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, customerId, portalUserId, amount, currency, provider` |
| **`ContactRole`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, contactId, role, createdAt, opportunity, contact` |
| **`CustomerHealthLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, score, status, reason, loggedBy, createdAt` |
| **`Activity`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, type, subject, description, leadId, opportunityId` |
| **`CoachingRubric`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, criteria` |
| **`CallScorecard`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, activityId, rubricId, reviewerId, criteriaScores` |
| **`CoachingLibraryItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, title, category, sourceActivityId, notes, tags` |
| **`DealRoom`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, opportunityId, name, status, buyerAccessToken, createdAt` |
| **`DealRoomMilestone`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, dealRoomId, title, description, ownerType, dueDate, status` |
| **`DealRoomStakeholder`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, dealRoomId, contactId, name, role, side, sentiment` |
| **`DealRoomDocument`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, dealRoomId, title, url, category, uploadedById, viewedByBuyerAt` |
| **`DealRiskDigestRun`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, recipientUserId, scope, periodStart, periodEnd, newAlertCount` |
| **`EmailTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, subject, body, variables, isActive` |
| **`AuditLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, action, entityType, entityId, changes, ipAddress` |
| **`Setting`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, key, value, category, createdAt, updatedAt` |
| **`AppSettings`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, appSlug, key, value, scope, roleId, createdAt` |
| **`PlatformCredential`** | 8 fields | 🌐 Global / Reference | `id, provider, key, value, isSensitive, updatedAt, updatedBy, createdAt` |
| **`PurchaseOrder`** | 40 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, poNumber, status, orderDate, expectedDate` |
| **`PurchaseOrderItem`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, purchaseOrderId, productId, description, quantity, receivedQty, unitPrice` |
| **`PurchaseReceipt`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, purchaseOrderId, receiptNumber, receivedDate, warehouseId, notes, createdBy` |
| **`PurchaseReceiptItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, purchaseReceiptId, productId, description, receivedQty, acceptedQty, rejectedQty` |
| **`RFQ`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, rfqNumber, status, expectedDate, notes, isAuction` |
| **`RFQItem`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, rfqId, productId, description, quantity, rfq, product` |
| **`SupplierQuotation`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, rfqId, vendorId, quotationNumber, status, validUntil` |
| **`SupplierQuotationItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, supplierQuotationId, productId, description, quantity, unitPrice, taxRate` |
| **`Quotation`** | 29 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, quotationNumber, status, issueDate, validUntil` |
| **`QuotationItem`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, quotationId, productId, description, quantity, unitPrice, taxRate` |
| **`SalesOrder`** | 35 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, orderNumber, status, orderDate, deliveryDate` |
| **`SalesOrderItem`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, salesOrderId, productId, description, quantity, deliveredQty, unitPrice` |
| **`DeliveryNote`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, salesOrderId, deliveryNumber, status, deliveredDate, warehouseId, carrierName` |
| **`DeliveryNoteItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, deliveryNoteId, productId, description, deliveredQty, deliveryNote` |
| **`Shipment`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, shipmentNumber, type, status, carrierName, trackingNumber` |
| **`ChangeRequest`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, description, requestedAmount, requestedScheduleDays, status` |
| **`Timesheet`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, taskId, employeeId, date, hours, notes, createdAt` |
| **`BOM`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, name, code, isActive, materialCost, overheadCost` |
| **`BOMItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, bomId, productId, quantity, type, bom` |
| **`Dashboard`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, isSystem, layout, createdBy` |
| **`Report`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, query` |
| **`KPI`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, value, unit, trend` |
| **`Folder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, parentId, createdBy, createdAt, updatedAt` |
| **`Document`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, folderId, templateId, signatureStatus, createdBy` |
| **`DocumentVersion`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, versionNumber, fileUrl, fileSize, changes, createdBy` |
| **`FolderShare`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, folderId, userId, role, password, expiresAt, createdAt` |
| **`DocumentShare`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, userId, role, password, expiresAt, createdAt` |
| **`DocumentTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, category, content, variables, createdBy` |
| **`DocumentCategory`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, parentId, sortOrder, createdAt, parent, children` |
| **`DocumentApproval`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, approverId, status, comment, createdAt, approvedAt` |
| **`Signature`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, signerEmail, status, signedAt, ipAddress, signatureData` |
| **`Channel`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, kind, spaceId` |
| **`Message`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, userId, content, kind, parentId, pinned` |
| **`ConnectSpace`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, emoji, createdBy, createdAt, updatedAt` |
| **`ChannelMember`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, userId, starred, muted, role, notifyLevel` |
| **`ChannelRead`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, userId, lastReadAt` |
| **`MessageReaction`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, userId, emoji, createdAt, message` |
| **`MessageBookmark`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, userId, createdAt, message` |
| **`UserPresence`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, presence, visibility, statusText, statusEmoji, clearAt` |
| **`ConnectMeeting`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, code, title, hostId, active, lobby` |
| **`CalendarEvent`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, date, time, durationMins, meetingCode, attendees` |
| **`Notification`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, title, content, type, status, link` |
| **`PushDeviceToken`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, deviceId, token, platform, appVersion, isActive` |
| **`ChannelTab`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, type, label, icon, url, entityType` |
| **`MessageEdit`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, userId, previousContent, newContent, createdAt, message` |
| **`MessageForward`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, messageId, fromChannelId, toChannelId, forwardedBy, comment, createdAt` |
| **`ChannelModeration`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, slowModeSecs, whoCanPost, onlyAdminsCanPin, createdAt, updatedAt` |
| **`MeetingParticipant`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, userId, joinedAt, leftAt, isHandRaised, isScreenSharing` |
| **`MeetingChatMessage`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, userId, content, createdAt, meeting` |
| **`MeetingRecording`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, startedAt, endedAt, fileUrl, fileSize, durationSecs` |
| **`ConnectBot`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, name, avatar, webhookUrl, token, isActive` |
| **`UserStatusSchedule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, presence, statusText, statusEmoji, startTime, endTime` |
| **`ChannelAnalytics`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, date, messageCount, activeUsers, reactions, threads` |
| **`ConnectPoll`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, channelId, messageId, userId, question, isClosed, createdAt` |
| **`ConnectPollOption`** | 6 fields | 🌐 Global / Reference | `id, pollId, label, emoji, poll, votes` |
| **`ConnectPollVote`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, pollId, optionId, userId, createdAt, option, poll` |
| **`CustomEmoji`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, fileUrl, fileSize, uploadedBy, category, createdAt` |
| **`Reminder`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, userId, text, remindAt, channelId, messageId, isSent` |
| **`ChannelTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, channelType, topic, emoji, tabs` |
| **`MeetingSummary`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, meetingId, summary, keyPoints, actionItems, generatedAt, meeting` |
| **`KnowledgeArticle`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, categoryId, title, slug, content, excerpt, status` |
| **`KnowledgeCategory`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, parentId, name, slug, description, icon, sortOrder` |
| **`KnowledgeArticleVersion`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, articleId, version, title, content, summary, authorId` |
| **`KnowledgeArticleRating`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, articleId, userId, rating, comment, createdAt, article` |
| **`HelpdeskTicket`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, subject, description, status, priority, source, category` |

### 📄 Schema: `core-part-8.prisma` (89 models, 16 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`VmiAgreement`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, agreementNumber, vendorId, warehouseId, productId, status, replenTrigger` |
| **`VmiStockSnapshot`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, agreementId, snapshotDate, onHandQty, onOrderQty, recordedById, notes` |
| **`VmiOrder`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, agreementId, vendorId, status, orderedQty, receivedQty` |
| **`LotExpiryRecord`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, lotNumber, productId, warehouseId, manufactureDate, expiryDate, qty` |
| **`LotExpiryAlert`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, lotId, alertLevel, daysToExpiry, alertedAt, dismissed, lot` |
| **`LotDisposalRecord`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, disposalNumber, lotId, disposalMethod, qtyDisposed, disposedById, disposedAt` |
| **`CrossDockStation`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, code, name, doorNumber, status, isInbound` |
| **`CrossDockOrder`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, type, status, warehouseId, stationId, productId` |
| **`CrossDockEvent`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, eventType, qty, notes, performedBy, createdAt` |
| **`PickTask`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, pickWaveId, pickItemId, assignedTo, status, binLocation, instructionNote` |
| **`AsnDiscrepancy`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, asnId, lineItemId, discrepancyType, productId, expectedQty, actualQty` |
| **`ShipmentException`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, direction, shipmentId, exceptionCode, description, severity, status` |
| **`SupplierContract`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractNumber, vendorId, title, description, contractType, status` |
| **`SupplierContractLineItem`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, productId, itemCode, description, unitPrice, quantity` |
| **`SupplierPerformanceKpi`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiCode, name, description, category, unit, weight` |
| **`SupplierAssessment`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, assessmentNumber, vendorId, assessmentType, status, score, maxScore` |
| **`SupplyChainBudget`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, budgetNumber, name, fiscalYear, period, totalAmount, spentAmount` |
| **`SupplyChainBudgetLine`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, budgetId, category, description, allocated, spent, currency` |
| **`ContainerTracking`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, containerNumber, containerType, size, status, carrierId, sealNumber` |
| **`ContainerTrackingEvent`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, containerId, eventCode, description, location, occurredAt, source` |
| **`CustomsDocument`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, docNumber, docType, direction, shipmentType, shipmentId, containerId` |
| **`SupplierNonConformance`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, ncrNumber, vendorId, productId, purchaseOrderId, receiptId, defectType` |
| **`LaneRate`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, carrierId, origin, destination, originRegion, destRegion, transportMode` |
| **`SupplierCertification`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, certificationType, certificationName, issuingBody, certificateNumber, issueDate` |
| **`BlockchainTransaction`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, channelName, chaincodeName, dataHash, status` |
| **`BlockchainVerification`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, result, localHash, onChainHash, verifiedAt` |
| **`BlockchainSyncCheckpoint`** | 5 fields | 🌐 Global / Reference | `id, channelName, chaincodeName, lastBlockNumber, updatedAt` |
| **`BlockchainSmartContract`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, address, abi, network, deployedAt, version` |
| **`BlockchainAuditTrail`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, action, transactionHash, performedBy, metadata` |
| **`BlockchainNetworkHealth`** | 7 fields | 🌐 Global / Reference | `id, network, blockHeight, peers, syncStatus, lastCheckedAt, createdAt` |
| **`BlockchainTransactionExplorer`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, transactionHash, blockNumber, fromAddress, toAddress, value, status` |
| **`OutboxEvent`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventName, eventVersion, aggregateType, aggregateId, sequence, occurredAt` |
| **`OutboxDelivery`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, outboxEventId, destination, status, attempts, leaseOwner, leaseExpiresAt` |
| **`OutboxConsumerReceipt`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, consumer, outboxEventId, processedAt, tenant` |
| **`DocumentSequence`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, organizationId, series, description, prefix, suffix, padding` |
| **`KnowledgeBaseCategory`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, slug, description, icon, color` |
| **`KnowledgeBaseArticle`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, categoryId, title, slug, content, excerpt` |
| **`KnowledgeBaseArticleVersion`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, articleId, version, title, content, changeLog, authorId` |
| **`WinLossReason`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, category, name, sortOrder, isActive, createdAt` |
| **`Competitor`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, website, description, strengths, weaknesses` |
| **`SalesPartnerDealRegistration`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, partnerId, opportunityId, companyName, contactName, contactEmail` |
| **`SalesPartnerMdfFund`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, partnerId, name, budgetAmount, spentAmount, currency` |
| **`CustomerPriceList`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, name, description, currency, validFrom` |
| **`CustomerPriceListItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, priceListId, productId, unitPrice, minQuantity, createdAt, updatedAt` |
| **`FloorPriceOverride`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, productId, customerId, floorPrice, currency, isActive` |
| **`CrossSellRule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, productId, recommendedProductId, strength, isActive, createdAt` |
| **`UpsellRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, productId, upgradeProductId, description, priceDelta, isActive` |
| **`TeamSplit`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, splitType, createdAt, updatedAt` |
| **`TeamSplitMember`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, splitId, userId, share, role, createdAt, split` |
| **`SalesTerritoryForecast`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, territoryId, period, pipelineValue, expectedValue, forecastValue` |
| **`SalesTerritoryRealignment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, territoryId, previousManagerId, newManagerId, previousParentId, newParentId` |
| **`CommunicationChannel`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, channelType, provider, config` |
| **`CommunicationTemplate`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, channelId, name, subject, body, variables` |
| **`CommunicationLog`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, channelId, templateId, recipient, subject, body` |
| **`ContractAmendment`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, amendmentNumber, title, description, amendmentType, changeSummary` |
| **`ContractPriceEscalationRule`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, name, escalationType, escalationValue, frequency, startDate` |
| **`ContractAutoRenewalLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, renewalNumber, previousEndDate, newEndDate, previousValue, newValue` |
| **`ContractExpirationPipelineItem`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, stage, riskLevel, daysToExpiry, actionRequired, assignedTo` |
| **`ContractTemplate`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, contractType, categoryId, template` |
| **`ContractClause`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, content, category, isStandard, tags, createdAt` |
| **`PerformanceObligation`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, contractRef, description, transactionPrice, allocatedAmount, ssp` |
| **`Asc606ContractModification`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, contractRef, modNumber, modificationDate, modType, originalConsideration` |
| **`Asc606DeferredRevenueRollForward`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, openingBalance, additions, recognized, writeOffs` |
| **`TransferPricingPolicy`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, policyName, policyType, method, description, effectiveFrom` |
| **`TransferPricingAdjustment`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, policyId, adjustmentDate, fiscalYear, relatedPartyId, transactionType` |
| **`ApportionmentFactor`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, fiscalYear, jurisdiction, factorType, numerator, denominator` |
| **`FairValueMeasurement`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, instrumentType, instrumentId, measurementDate, fairValue, costBasis` |
| **`ExpectedCreditLossProvision`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, provisionDate, period, portfolio, stage, grossCarryingAmount` |
| **`BudgetTemplate`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, fiscalYear, basedOn, adjustmentPct` |
| **`BudgetCommitment`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, budgetId, commitmentRef, commitmentType, description, amount` |
| **`BudgetCarryForwardRule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, accountType, carryForwardPct, maxCarryAmount, expirationMonths` |
| **`BudgetRevision`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, budgetId, revisionNumber, revisionType, previousAmount, revisedAmount` |
| **`NettingGroup`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, nettingMethod, baseCurrency, status` |
| **`NettingGroupMember`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, orgId, participantType, currency, isActive, joinedAt` |
| **`NettingRun`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, groupId, runNumber, nettingDate, period, totalReceivables, totalPayables` |
| **`NettingRunDetail`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, nettingRunId, fromOrgId, toOrgId, transactionId, originalAmount, nettedAmount` |
| **`SettlementInstruction`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, nettingRunId, fromOrgId, toOrgId, settlementAmount, currency, settlementMethod` |
| **`CustomerPortalMessage`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, portalUserId, subject, body, direction, status, readAt` |
| **`PortalDocumentAccess`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, portalUserId, documentId, grantType, grantedAt, expiresAt, revokedAt` |
| **`PortalActivityLog`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, portalUserId, action, details` |
| **`CampaignWorkflow`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, campaignId, name, description, triggerType, status` |
| **`CampaignWorkflowStep`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, stepOrder, actionType, config` |
| **`CampaignWorkflowStat`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, totalEntered, totalExited, converted, revenue, startedAt` |
| **`ABTestCampaign`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, variantA` |
| **`ABTestResult`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, testId, variant, sentCount, openCount, clickCount, bounceCount` |
| **`CampaignROI`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, campaignId, totalSpend, totalRevenue, leadsGenerated, opportunitiesWon, roi` |
| **`RenewalRiskPrediction`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, contractId, riskScore, riskLevel, predictedDate, confidenceScore` |
| **`ChurnAnalysis`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, churnScore, churnReason, churnDate, segment, signals` |
| **`ExpansionRevenue`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, type, amount, productId, description, source` |

### 📄 Schema: `core-part-9.prisma` (82 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`NpsSurvey`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, question, minRating, maxRating` |
| **`NpsResponse`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, customerId, contactId, rating, category, comment` |
| **`NpsAnalytic`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, totalSent, totalResponses, detractors, passives, promoters` |
| **`PredictiveLeadScoreModel`** | 4 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, weights` |
| **`PipelineVelocity`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, pipelineId, stage, avgDaysInStage, medianDays, minDays, maxDays` |
| **`SalesCycleAnalytic`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, segment, segmentValue, avgCycleDays, medianCycleDays, winRate, avgDealSize` |
| **`ForecastAccuracyAudit`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, forecastId, periodStart, periodEnd, predictedValue, actualValue, variance` |
| **`RebateAgreement`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, customerId, productId, type, basis` |
| **`RebateClaim`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, agreementId, claimNumber, periodStart, periodEnd, qualifiedValue, rebateAmount` |
| **`RebateAccrual`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, agreementId, customerId, periodName, accruedAmount, paidAmount, balance` |
| **`QuoteComparison`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, customerId, opportunityId, quoteIds, winnerId` |
| **`QuoteMarkupApproval`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, quotationId, quotationNumber, totalAmount, markupAmount, markupPct` |
| **`DealDeskRequest`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, opportunityId, requestType, description, discountRequest, justification` |
| **`SalesNote`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, content, visibility, pinned, createdBy` |
| **`CompetitiveIntelligence`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, competitor, product, strength, weakness, positioning` |
| **`DealAlert`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, alertType, severity, message, details` |
| **`PartnerDealRegistration`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, partnerId, opportunityId, registrationNumber, customerName, customerEmail, customerPhone` |
| **`MdfProgram`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, budget, spentAmount, currency` |
| **`MdfClaim`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, partnerId, claimNumber, amount, currency, description` |
| **`PartnerPerformanceMetric`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, partnerId, period, totalDeals, wonDeals, totalRevenue, mdfUsed` |
| **`CustomerCatalog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, name, description, isActive, validFrom` |
| **`CustomerCatalogItem`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, catalogId, productId, customPrice, customMinQty, customMaxQty, isActive` |
| **`BulkOrderUpload`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, fileName, fileUrl, totalLines, processedLines` |
| **`RecurringOrderTemplate`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, name, description, frequency, intervalCount` |
| **`RecurringOrderTemplateItem`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, templateId, productId, description, quantity, unitPrice, taxRate` |
| **`OrderApprovalWorkflow`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, triggerCriteria` |
| **`OrderApprovalWorkflowStep`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, stepOrder, approverRole, minAmount, maxAmount, createdAt` |
| **`OrderApprovalRequest`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, workflowId, currentStep, totalSteps, status, requestedBy` |
| **`OrderApprovalAction`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestId, stepOrder, approverId, action, comments, actionedAt` |
| **`ReturnMerchandiseAuthorization`** | 34 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaNumber, status, source, customerId, customerName, vendorId` |
| **`RMALine`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaId, productId, productSku, productName, expectedQty, receivedQty` |
| **`RMAInspection`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaId, inspectorId, inspectionDate, result, overallCondition, defects` |
| **`WavePlan`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, planNumber, warehouseId, planType, status, optimizationStrategy, totalOrders` |
| **`WavePlanTask`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, wavePlanId, taskType, status, assignee, priority, sourceLocation` |
| **`SafetyStockOptimization`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, productSku, productName, warehouseId, currentSafetyStock, recommendedSafetyStock` |
| **`GlobalInventoryView`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, productSku, productName, totalOnHand, totalReserved, totalAvailable` |
| **`GlobalInventoryDetail`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, globalViewId, warehouseId, warehouseName, onHand, reserved, available` |
| **`SourcingProject`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectNumber, projectName, description, status, projectType, category` |
| **`SourcingParticipant`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, vendorId, vendorName, status, invitedDate, respondedDate` |
| **`SupplierEvaluation`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, vendorId, vendorName, evaluatorId, evaluationDate, status` |
| **`SupplierEvaluationCriterion`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, evaluationId, criterionName, weight, score, weightedScore, comments` |
| **`BidAnalysis`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, analysisNumber, status, totalBids, lowestBid, highestBid` |
| **`ContractAward`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, awardNumber, projectId, vendorId, vendorName, status, awardAmount` |
| **`SupplierOnboardingWorkflow`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, vendorName, status, step, steps, documents` |
| **`HsCode`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, description, chapter, section, dutyRate, dutyUnit` |
| **`CountryOfOrigin`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, countryCode, countryName, region, tradeAgreement, preferentialRate, riskLevel` |
| **`ImportDeclaration`** | 35 fields | ✅ Yes (`tenantId`) | `id, tenantId, declarationNumber, entryNumber, status, portOfEntry, portOfLading, vessel` |
| **`ImportDeclarationLine`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, importDeclarationId, productId, productSku, productName, hsCodeId, hsCode` |
| **`ExportDeclaration`** | 29 fields | ✅ Yes (`tenantId`) | `id, tenantId, declarationNumber, status, portOfExport, destinationCountry, shipmentId, carrierName` |
| **`ExportDeclarationLine`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, exportDeclarationId, productId, productSku, productName, hsCodeId, hsCode` |
| **`TradeComplianceScreening`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, screenType, entityId, entityType, entityName, screenList, status` |
| **`DemandSenseRun`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, runType, status, startDate, endDate` |
| **`DemandSenseResult`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, productId, productSku, productName, forecastPeriod, forecastQty` |
| **`SupplyPlan`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, planName, description, status, planType, planningHorizon, startDate` |
| **`SupplyPlanLine`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, productId, productSku, productName, period, forecastedQty` |
| **`SupplyPlanScenario`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, name, description, scenarioType, assumptions, totalSupply` |
| **`SupplyPlanScenarioLine`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, scenarioId, productId, productSku, period, baseDemand, adjustedDemand` |
| **`SopPlan`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, planName, description, fiscalYear, period, status, planType` |
| **`SopPlanReview`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sopPlanId, reviewDate, reviewer, status, decisions, notes` |
| **`SopPlanMetric`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, sopPlanId, metricName, category, targetValue, actualValue, variance` |
| **`TransportMode`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, description, transitLeadTimeDays, costFactor, carbonFactor` |
| **`CarrierRate`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, carrierId, serviceLevelId, originZip, destZip, originRegion, destRegion` |
| **`LoadBuild`** | 44 fields | ✅ Yes (`tenantId`) | `id, tenantId, buildNumber, status, loadType, transportMode, carrierId, carrierName` |
| **`LoadBuildStop`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, loadId, stopSequence, stopType, locationId, locationName, address` |
| **`LoadBuildItem`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, loadId, productId, productSku, productName, quantity, uom` |
| **`LoadTenderRequest`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, loadId, tenderNumber, carrierId, carrierName, status, requestedRate` |
| **`DocumentDeliveryConfirmation`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, confirmationNumber, shipmentId, shipmentType, appointmentId, podNumber, receivedBy` |
| **`DeliveryConfirmationLine`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, confirmationId, productId, productSku, productName, expectedQty, deliveredQty` |
| **`SupplierRiskProfile`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, vendorId, vendorName, overallRiskScore, riskCategory, financialHealth, geopoliticalRisk` |
| **`SupplierRiskFactor`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, profileId, factorType, factorName, score, weight, description` |
| **`SupplierRiskAlert`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, profileId, alertType, severity, title, description, status` |
| **`SupplierDiversity`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, profileId, diversityType, certificationBody, certificationNumber, certificationDate, expirationDate` |
| **`AlternativeSourcing`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, productSku, productName, currentVendorId, currentVendorName, altVendorId` |
| **`ControlTowerEvent`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventNumber, eventType, severity, title, description, category` |
| **`ControlTowerAction`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, eventId, actionType, description, status, executedBy, executedAt` |
| **`ControlTowerKpi`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, kpiCode, kpiName, category, subcategory, unit, currentValue` |
| **`ControlTowerAlertConfig`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, alertName, description, eventType, kpiCode, condition, severity` |
| **`BookTransaction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, bookId, type, dueDate, returnedDate, createdAt` |
| **`Grade`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, courseId, assessment, score, createdAt, updatedAt` |
| **`EcommerceStore`** | 29 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, description, logo, banner, currency` |
| **`EcommerceCategory`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, parentId, name, slug, description, image` |
| **`EcommerceProductListing`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, storeId, productId, categoryId, title, slug, description` |

### 📄 Schema: `core-part-7.prisma` (79 models, 46 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`CapaAction`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, capaId, actionType, description, assignedTo, dueDate, completedAt` |
| **`CalibrationRecord`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, instrumentId, instrumentName, serialNumber, location, calibrationType, status` |
| **`DeviationRecord`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, deviationNumber, title, type, severity, status, description` |
| **`SopDocument`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, docNumber, title, category, department, status, version` |
| **`SopRevision`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, docId, version, changedBy, changeSummary, createdAt, document` |
| **`BinTransferRequest`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, transferNumber, productId, fromBin, toBin, qty, uom` |
| **`GoodsReceiptNote`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, grnNumber, purchaseOrderId, asnId, warehouseId, supplierId, receivedDate` |
| **`GrnLineItem`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, grnId, productId, orderedQty, receivedQty, acceptedQty, rejectedQty` |
| **`PackingSession`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sessionNumber, outboundShipmentId, pickWaveId, workerId, status, totalCartons` |
| **`PackingCarton`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, sessionId, cartonNumber, weight, length, width, height` |
| **`LotMovement`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, movementType, qty, uom, referenceType, referenceId` |
| **`PickSuggestion`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, strategy, referenceType, referenceId, batchId` |
| **`ExpiryAlert`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, productId, warehouseId, expiryDate, daysUntilExpiry, qty` |
| **`QuarantineOrder`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, batchId, serialId, productId, warehouseId, qty` |
| **`DemandForecast`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, forecastDate, horizon, method, forecastedQty` |
| **`ReorderPoint`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, reorderPoint, reorderQty, safetyStock, leadTimeDays` |
| **`SafetyStockConfig`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, method, fixedQty, coverageDays, serviceLevel` |
| **`ReplenishmentOrder`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderNumber, productId, warehouseId, suggestedQty, approvedQty, uom` |
| **`LandedCostVoucher`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, voucherNumber, description, status, allocationMethod, totalAmount, currency` |
| **`LandedCostChargeLine`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, voucherId, chargeType, description, amount, currency, accountCode` |
| **`LandedCostReceiptLink`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, voucherId, stockEntryId, totalQty, totalValue, totalWeight, totalVolume` |
| **`LandedCostAllocation`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, voucherId, chargeType, stockEntryId, stockEntryItemId, productId, allocationBasis` |
| **`CostAdjustment`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, adjustmentNumber, productId, warehouseId, oldUnitCost, newUnitCost, qty` |
| **`TransferOrder`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, transferNumber, fromWarehouseId, toWarehouseId, status, priority, requestedDate` |
| **`TransferOrderLine`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, transferOrderId, productId, requestedQty, shippedQty, receivedQty, uom` |
| **`TransferOrderReceipt`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, transferOrderId, receiptNumber, receivedDate, receivedBy, notes, createdAt` |
| **`TransferOrderReceiptLine`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, receiptId, transferLineId, productId, receivedQty, acceptedQty, rejectedQty` |
| **`DockDoor`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, doorNumber, doorType, status, notes, createdAt` |
| **`YardAppointment`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, appointmentNumber, dockDoorId, warehouseId, carrierId, carrierName, driverName` |
| **`GatePass`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, appointmentId, passNumber, gateInAt, gateOutAt, gateInBy, gateOutBy` |
| **`YardMove`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, appointmentId, warehouseId, trailerNumber, fromLocation, toLocation, status` |
| **`YardInventory`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, trailerNumber, location, productId, description, qty` |
| **`CountSheet`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockTakeId, sheetNumber, warehouseId, zone, assignedTo, status` |
| **`CountSheetItem`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, sheetId, productId, binLocationId, lotNumber, uom, systemQty` |
| **`HazmatClassification`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, unNumber, properShippingName, hazardClass, subsidiaryHazards, packingGroup` |
| **`SafetyDataSheet`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, classificationId, productId, sdsNumber, revision, issueDate, expiryDate` |
| **`HazmatStorageRule`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, hazardClassA, hazardClassB, result, condition, notes, createdAt` |
| **`HazmatManifest`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, manifestNumber, regulation, shipmentRef, carrierId, carrierName, originAddress` |
| **`HazmatManifestLine`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, manifestId, classificationId, productId, quantity, uom, grossWeight` |
| **`HazmatIncident`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, incidentNumber, productId, warehouseId, incidentDate, severity, description` |
| **`ApprovedSupplier`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, vendorId, vendorProductRef, vendorProductName, status, isPreferred` |
| **`SupplierPriceTier`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, approvedSupplierId, fromQty, toQty, unitPrice, effectiveFrom, effectiveTo` |
| **`AslChangeLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, approvedSupplierId, changeType, previousValue, newValue, reason, changedBy` |
| **`VendorItemAttribute`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, vendorId, attributeKey, attributeValue, createdAt` |
| **`AslComplianceRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, productCategory, minApprovedVendors, requiresQualification, qualificationValidityDays, requiresPreferred, notes` |
| **`PalletType`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, category, lengthMm, widthMm, heightMm` |
| **`ContainerType`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, code, name, category, isoCode, externalLengthMm, externalWidthMm` |
| **`LoadPlan`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, planNumber, containerTypeId, shipmentRef, originWarehouse, destAddress, plannedLoadDate` |
| **`LoadPlanPallet`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, loadPlanId, palletTypeId, palletSequence, positionX, positionY, positionZ` |
| **`LoadPlanItem`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, loadPlanId, productId, quantity, uom, grossWeightKg, volumeM3` |
| **`PackingPlan`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, planNumber, salesOrderRef, warehouseId, status, plannedDate, totalCartons` |
| **`LoadCarton`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, packingPlanId, cartonNumber, lengthMm, widthMm, heightMm, grossWeightKg` |
| **`LoadCartonItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, cartonId, productId, quantity, uom, carton` |
| **`CatchWeightConfig`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, nominalWeightKg, tolerancePctPlus, tolerancePctMinus, pricingBasis, tareWeightKg` |
| **`CatchWeightReading`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, configId, referenceType, referenceId, lotNumber, serialNumber, nominalQty` |
| **`CatchWeightTare`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, containerLabel, tareWeightKg, description, active` |
| **`RecallAffectedStock`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, recallId, warehouseId, locationBin, lotNumber, serialNumber, qtyAffected` |
| **`RecallCustomerNotice`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, recallId, customerId, customerName, contactEmail, qtyShipped, qtyReturned` |
| **`RecallDisposalRecord`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, recallId, actionType, qtyProcessed, disposalMethod, authorizedBy, processedAt` |
| **`PackagingSpec`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, level, unitsPerLevel, lengthMm, widthMm, heightMm` |
| **`Gs1ApplicationIdentifier`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, ai, title, dataFormat, fnc1Required, maxLength, description` |
| **`LabelTemplate`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, templateType, widthMm, heightMm, content, version` |
| **`LabelAssignment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, packagingSpecId, templateId, customerId, isDefault, createdAt, packagingSpec` |
| **`SsccRecord`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, sscc, extensionDigit, gs1CompanyPrefix, serialRef, allocatedAt, usedAt` |
| **`ColdChainRequirement`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, minTempCelsius, maxTempCelsius, minHumidityPct, maxHumidityPct, maxExcursionMins` |
| **`TemperatureExcursion`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, requirementId, warehouseId, batchId, recordedTempC, recordedHumidityPct, excursionStartAt` |
| **`VelocityClassificationRun`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, runNumber, warehouseId, periodStart, periodEnd, status, totalProducts` |
| **`VelocityClassificationItem`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, productId, warehouseId, totalRevenue, totalQuantitySold, revenueShare` |
| **`VelocitySlottingPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, combinedClass, description, reviewFrequency, reorderMethod, safetyStockMultiplier, preferredZone` |
| **`CustomerRma`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaNumber, customerId, salesOrderId, status, returnReason, customerNotes` |
| **`CustomerRmaLine`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaId, productId, lotNumber, serialNumber, quantityRequested, quantityReceived` |
| **`ReturnCredit`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, creditNumber, rmaId, customerId, creditAmount, currency, status` |
| **`ReturnRestock`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, rmaLineId, productId, warehouseId, binLocationId, quantityRestocked, restockedById` |
| **`MinMaxLevel`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, minQty, maxQty, reorderQty, method` |
| **`ReplenSuggestion`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, suggestionNumber, levelId, productId, warehouseId, currentStock, suggestedQty` |
| **`ReplenRunLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, runNumber, warehouseId, levelsScanned, suggestionsCreated, triggeredById, completedAt` |
| **`CargoDamageReport`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportNumber, shipmentId, purchaseOrderId, carrierId, warehouseId, reportedById` |
| **`FreightClaim`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, claimNumber, damageReportId, carrierId, claimType, status, claimedAmount` |
| **`FreightClaimEvent`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, claimId, eventType, description, recordedById, occurredAt, createdAt` |

### 📄 Schema: `crm.prisma` (66 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`LeadSource`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, createdAt, leads` |
| **`Lead`** | 32 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, salutation, firstName, lastName, company, title` |
| **`Opportunity`** | 38 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, customerId, leadId, pipelineId, stage` |
| **`CrmAiDraft`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, draftType, contextType, contextId, tone, subject` |
| **`OpportunityLineItem`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, productId, description, quantity, unitPrice, discount` |
| **`CrmWorkflowRule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, entity, trigger, conditions, actions` |
| **`CrmDocument`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, type, fileUrl, fileSize, mimeType` |
| **`CrmCustomField`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, entity, fieldName, label, fieldType, description` |
| **`CrmCustomFieldValue`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, fieldId, entityType, entityId, value, createdAt, updatedAt` |
| **`CrmRecordType`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, entity, name, description, fieldLayout, pipelineId` |
| **`CrmComment`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, parentId, body, mentions, isPinned` |
| **`CrmFollower`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, userId, createdAt` |
| **`CrmNote`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, title, body, noteType, isPinned` |
| **`OpportunityChecklist`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, stageChecklistId, isCompleted, completedBy, completedAt` |
| **`CrmDashboard`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, layout, isDefault, isShared` |
| **`CrmDashboardWidget`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, dashboardId, widgetType, title, dataSource, config` |
| **`LeadScoringRule`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, field, operator, value, points, active` |
| **`LeaderboardSnapshot`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, period, userId, rank, points, dealsWon` |
| **`CrmEnrichmentSource`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, provider, apiUrl, apiKeyEnc, config` |
| **`CrmEnrichmentRule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, sourceId, objectType, triggerType, conditions` |
| **`CrmEnrichmentFieldMapping`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sourceId, ruleId, sourceField, targetField, targetEntity, transform` |
| **`CrmEnrichmentLog`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, sourceId, ruleId, objectId, objectType, status, fieldsEnriched` |
| **`CrmLeadEnrichmentData`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, leadId, sourceId, ruleId, enrichedData` |
| **`CrmEnrichmentSchedule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, ruleId, frequency, dayOfWeek, dayOfMonth, time, objectType` |
| **`CrmLeadRoutingRule`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, isActive, priority, conditions` |
| **`CrmLeadRoutingHistory`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, leadId, ruleId, assignedToId, assignedBy, action, previousAssigneeId` |
| **`CrmLeadRoundRobinState`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, teamId, userId, position, lastAssignedAt, totalAssigned, createdAt` |
| **`CrmEnrichmentProvider`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, provider, apiUrl, apiKeyEnc, config` |
| **`CrmEnrichmentWorkflow`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, providerId, objectType, triggerType, conditions` |
| **`CrmEnrichmentJob`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, objectId, objectType, status, currentStep, totalSteps` |
| **`CrmEnrichmentJobStep`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, jobId, stepIndex, providerId, fieldMappings, status, inputData` |
| **`CrmEnrichmentCache`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, objectId, objectType, providerId, enrichedData, rawResponse, confidence` |
| **`CrmNextBestActionConfig`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, objectType, stageId, conditions` |
| **`CrmActionSuggestion`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, objectId, objectType, configId, actionType, title, description` |
| **`CrmGuidedSellingPlaybook`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, objectType, stageFrom, stageTo, content` |
| **`CrmDealReadinessScore`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, opportunityId, score, dimensions` |
| **`CrmSalesPlaybook`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, methodology, description, isActive, version` |
| **`CrmPlaybookStage`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, playbookId, stageName, sortOrder, requiredFields, exitCriteria, guidance` |
| **`CrmPlaybookAction`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, playbookId, stageId, actionName, actionType, isMandatory, sortOrder` |
| **`CrmDealGuidance`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, dealId, playbookId, currentStageId, healthScore, riskFactors, nextBestAction` |
| **`CrmCompetitorBattlecard`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, competitorName, category, strengths, weaknesses, landmines, pricingInfo` |
| **`CrmObjectionHandler`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, battlecardId, objection, category, suggestedResponse, successRate, tags` |
| **`CrmOmnichannelCampaign`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, campaignType, status, budget, spend` |
| **`CrmCampaignNode`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, campaignId, nodeType, name, config` |
| **`CrmAudienceSegmentRule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, segmentId, field, operator, value, logicalOp, createdAt` |
| **`CrmAttributionModel`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, dealId, campaignId, attributionType, attributedRevenue, weightPercentage, createdAt` |
| **`CrmMarketingAsset`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, assetType, fileUrl, downloadCount, leadGenCount, createdAt` |
| **`CrmEventWebinar`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, eventDate, durationMins, platform, joinUrl, registrantCount` |
| **`CrmAbmAccountGroup`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, tier, targetRevenue, dedicatedRepId, description, createdAt` |
| **`CrmIntentSignal`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, source, topic, score, signalDate, rawMetadata` |
| **`CrmBuyingCommitteeMember`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, contactId, role, influenceLevel, sentiment, createdAt` |
| **`CrmAccountEngagementLog`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, activityType, engagementPoints, details` |
| **`CrmHealthScoreConfig`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, metricName, weight, thresholdWarning, thresholdCritical, calculationLogic` |
| **`CrmAccountHealthRecord`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, overallHealth, usageScore, supportScore, npsScore, paymentScore` |
| **`CrmRenewalPipeline`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, customerId, renewalDate, arrAmount, expansionAmount, stage` |
| **`CrmCustomerFeedbackSurvey`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, surveyType, questions, isActive, responseCount, createdAt` |
| **`CrmNpsResponse`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, customerId, contactId, score, feedback, category` |
| **`CrmFieldVisitSchedule`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, repId, customerId, scheduledDate, purpose, status, checkInTime` |
| **`CrmSalesRoutePlan`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, repId, planDate, stops, totalDistanceKm, estimatedDurationMins, status` |
| **`CrmPartnerTierBenefit`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, tierName, mdfBudget, commissionRate, discountPercentage, requiredCertifications, perks` |
| **`CrmPartnerCertification`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, partnerId, contactId, certificationName, issuedDate, expiryDate, status` |
| **`CrmSavedReport`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, categoryId, name, description, module, type, isSystem` |
| **`CrmReportSchedule`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, name, frequency, cronExpr, recipients, format` |
| **`CrmReportShare`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, reportId, userId, canEdit, createdAt, report` |
| **`CrmDashboardTemplate`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, layout, widgets, isDefault` |
| **`CrmDashboardShare`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, dashboardId, userId, canEdit, createdAt, dashboard` |

### 📄 Schema: `projects.prisma` (46 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Product`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, categoryId, sku, barcode, name, description` |
| **`Project`** | 49 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, description, status, startDate` |
| **`ProjectPortfolio`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, riskScore, strategicAlignment, budget` |
| **`ProjectRisk`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, description, probability, impact, mitigationPlan` |
| **`Task`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, description, status, priority, dueDate` |
| **`Milestone`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, dueDate, isCompleted, project` |
| **`ProjectCostEntry`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, type, amount, date, description, createdAt` |
| **`ProductCategory`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, slug, description, parentId, imageUrl` |
| **`ProductVariant`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, parentSkuId, sku, name, attributes` |
| **`ProductKit`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, productId, name, description, sellPrice, discount` |
| **`ProductKitItem`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, kitId, productId, quantity, sortOrder, kit, product` |
| **`ProductListing`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, categoryId, isPublished, displayName, description, priceOverride` |
| **`ProductRecall`** | 26 fields | ✅ Yes (`tenantId`) | `id, tenantId, recallNumber, productId, recallClass, status, title, reason` |
| **`ProductVelocitySnapshot`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, snapshotMonth, quantitySold, revenue, transactionCount` |
| **`ProductBundle`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, bundlePrice, currency, savingsPct` |
| **`ProductBundleItem`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, bundleId, productId, quantity, sortOrder, createdAt, bundle` |
| **`ProductConfigRule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, ruleType, constraintType, targetProductId, configValue, description` |
| **`ProcurementContract`** | 38 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractNumber, contractName, contractType, status, vendorId, vendorName` |
| **`ProcurementContractPriceSchedule`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, productId, productSku, productName, negotiatedPrice, currency` |
| **`ProcurementContractVolumeCommitment`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, productId, productSku, productName, committedQty, fulfilledQty` |
| **`ProcurementContractSlaClause`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, contractId, slaType, targetValue, unit, threshold, penaltyPerUnit` |
| **`ProcurementIntelligence`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, category, reportName, reportPeriod, reportData, totalSpend, totalSavings` |
| **`ProjectPortfolioMember`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, portfolioId, userId, role, createdAt, portfolio` |
| **`ProjectRiskMitigation`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, riskId, action, ownerId, dueDate, status, notes` |
| **`ProjectResourceAllocation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, resourceId, resourceType, allocatedHours, startDate, endDate` |
| **`ProjectBudget`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, category, allocated, spent, committed, currency` |
| **`ProjectDocument`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, type, fileUrl, mimeType, fileSize` |
| **`ProjectActivity`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, userId, action, description, metadata, createdAt` |
| **`Program`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, description, status, startDate` |
| **`ProgramProject`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, projectId, createdAt, program, project` |
| **`ProgramBenefit`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, name, description, metric, targetValue, actualValue` |
| **`ProgramFinancial`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, programId, fiscalYear, category, amount, period, notes` |
| **`ProjectClaim`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, claimNumber, title, description, claimType, status` |
| **`ProjectDiscussion`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, content, authorId, isPinned, isResolved` |
| **`ProjectWikiPage`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, slug, content, authorId, version` |
| **`ProjectFeedEvent`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, userId, eventType, title, description, metadata` |
| **`ProductionBatch`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchNumber, workOrderId, productId, plannedQty, actualQty, scrapQty` |
| **`ProductionFormula`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, formulaCode, name, productId, outputQuantity, outputUnit, version` |
| **`ProductionShift`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, plantId, shiftName, shiftDate, startTime, endTime, supervisorId` |
| **`ProductionAnalyticsSnapshot`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, plantId, totalProduction, targetProduction, efficiency, oeeAvg` |
| **`ProjectIssueLog`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, issueCode, title, description, category, priority` |
| **`ProjectTemplate`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, industry, category, phases, tasks` |
| **`ProjectStakeholder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, organization, role, email, phone` |
| **`ProjectBenefit`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, name, description, benefitType, owner, measurementKpi` |
| **`ProjectMeeting`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, title, meetingType, scheduledAt, duration, location` |
| **`ProjectSubcontractor`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, projectId, vendorId, name, scope, contractValue, currency` |

### 📄 Schema: `hr.prisma` (36 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Employee`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, departmentId, employeeCode, firstName, lastName` |
| **`EmployeeDocument`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, name, docType, fileUrl, expiryDate, notes` |
| **`EmployeeSkill`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, skillName, proficiency, category, certified, certificationUrl` |
| **`PayrollRun`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, periodStart, periodEnd, status, totalGross, totalDeductions, totalNet` |
| **`PayrollSlip`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, payrollRunId, employeeId, grossSalary, deductions, netSalary, createdAt` |
| **`LeavePolicy`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, leaveType, annualAllocation, carryForwardLimit, createdAt, updatedAt` |
| **`LeaveRequest`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, policyId, startDate, endDate, reason, status` |
| **`EmployeeBenefit`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, schemeId, enrollmentDate, coverageAmount, status, terminatedAt` |
| **`EmployeeAchievement`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, title, description, awardDate, awardedBy, category` |
| **`EmployeeReferral`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, referringEmployeeId, candidateName, candidateEmail, candidatePhone, position, relationship` |
| **`EmployeeEducation`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, degree, institution, field, startYear, endYear` |
| **`EmployeeDependent`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, name, relationship, dateOfBirth, isNominee, nomineePercent` |
| **`EmployeeEmergencyContact`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, name, relationship, phone, email, address` |
| **`HrExpenseClaim`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, claimNumber, title, description, totalAmount, currency` |
| **`HrExpenseClaimItem`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, claimId, category, description, amount, expenseDate, receiptUrl` |
| **`EmployeePromotion`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, previousTitle, newTitle, previousGrade, newGrade, previousSalary` |
| **`EmployeeSeparation`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, separationType, lastWorkingDay, reason, isEligibleForRehire, noticePeriodDays` |
| **`EmployeeWarning`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, warningType, title, description, issuedBy, issuedDate` |
| **`HrPolicy`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, category, content, version, effectiveDate, createdBy` |
| **`HrPolicyAcknowledgment`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, policyId, employeeId, signature, acknowledgedAt, policy` |
| **`HrAnnouncement`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, body, category, priority, startsAt, expiresAt` |
| **`PayrollTaxEntry`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, payrollRunId, employeeId, taxType, taxableAmount, taxAmount, createdAt` |
| **`PayrollContribution`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, payrollRunId, employeeId, contributionType, employerAmount, employeeAmount, createdAt` |
| **`HrTicketCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, slaHours, isActive, createdAt, updatedAt` |
| **`HrTicket`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, categoryId, employeeId, subject, description, priority, status` |
| **`HrTicketAssignment`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, assigneeId, assignedBy, assignedAt, note, createdAt` |
| **`EmployeeGrievance`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, grievanceType, subject, description, severity, status` |
| **`EmployeeWellnessProgram`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, programType, startDate, endDate, isActive` |
| **`HrHeadcountPlan`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, fiscalYear, description, status, approvedBy, approvedAt` |
| **`HrHeadcountPlanLine`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, departmentId, positionTitle, headcountRequested, headcountApproved, headcountFilled` |
| **`HrSuccessionPlan`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, positionId, riskLevel, readiness, notes, status, createdAt` |
| **`HrSuccessionCandidate`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, employeeId, readinessLevel, readinessTimeline, strengths, developmentAreas` |
| **`EmployeeRecognition`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, awardId, recognizedBy, category, title, message` |
| **`EmployeeRecognitionAward`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, points, iconUrl, isActive` |
| **`HrSurveyResponse`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, surveyId, surveyType, employeeId, responses` |
| **`EmployeeJourneyMilestone`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, milestoneType, title, description, milestoneDate, isCompleted` |

### 📄 Schema: `inventory.prisma` (31 models, 2 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Warehouse`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, code, address, type, managerId` |
| **`InventoryItem`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, quantity, reservedQty, committedQty, inTransitQty` |
| **`InventoryItemBin`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, binLocationId, quantity, createdAt, updatedAt` |
| **`StockReservation`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, quantity, sourceType, sourceId, status` |
| **`StockTransferApproval`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockEntryId, thresholdValue, entryValue, status, requestedBy, approvedBy` |
| **`InvestmentPortfolio`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, assetClass, currentValue, yieldRate, accountId` |
| **`StockLedgerEntry`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, stockEntryId, quantity, valuationRate, voucherType` |
| **`StockEntry`** | 27 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, entryNumber, type, purpose, postingDate, status` |
| **`StockEntryItem`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockEntryId, productId, fromWarehouseId, toWarehouseId, fromBinId, toBinId` |
| **`InventoryValuation`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, costingMethod, valuationDate, quantity, valuationRate` |
| **`StockAlert`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, alertType, severity, message, threshold` |
| **`InvestmentHolding`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, securityName, ticker, assetClass, units, costBasis` |
| **`WarehouseShiftTemplate`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, shiftName, dayOfWeek, startTime, endTime, headcount` |
| **`InventoryHold`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, holdNumber, warehouseId, productId, batchId, serialId, holdType` |
| **`WarehouseTask`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, taskNumber, taskType, priority, status, warehouseId, zoneId` |
| **`StockoutPrediction`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, currentStock, avgDailyDemand, daysOfStock, predictedStockoutDate` |
| **`StockValuationPolicy`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, method, standardCost, currency, effectiveFrom` |
| **`StockValuationLedger`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, method, transactionType, transactionRef, qty` |
| **`StockRevaluation`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, revaluationNumber, description, revaluationDate, status, totalImpact, currency` |
| **`StockRevaluationLine`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, revaluationId, productId, warehouseId, currentQty, currentUnitCost, newUnitCost` |
| **`StockTake`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockTakeNumber, warehouseId, status, countType, countDate, frozenAt` |
| **`StockTakeVariance`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, stockTakeId, productId, warehouseId, binLocationId, systemQty, countedQty` |
| **`ItemBarcode`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, packagingSpecId, symbology, barcodeValue, gtin14, gs1CompanyPrefix, isPrimary` |
| **`StockWriteDownRequest`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestNumber, warehouseId, productId, batchId, quantity, originalValuePerUnit` |
| **`StockWriteOffRecord`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, writeOffNumber, warehouseId, productId, batchId, quantity, bookValuePerUnit` |
| **`InventoryCostProfile`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, productId, warehouseId, method, standardCost, currency, activeFrom` |
| **`InventoryCostLayer`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, profileId, receiptDate, receiptRef, unitCost, qtyReceived, qtyRemaining` |
| **`InventoryCostAdjustment`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, adjustmentNumber, profileId, adjustmentType, amount, currency, reason` |
| **`WarehouseKpi`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, warehouseId, kpiDate, linesPicked, linesPutaway, ordersShipped, ordersReceived` |
| **`WarehouseNetworkDesign`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, scenario, totalCost, transportCost, storageCost` |
| **`WarehouseNetworkNode`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, designId, nodeType, name, location, latitude, longitude` |

### 📄 Schema: `finance.prisma` (29 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`AccountPlan`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, name, objectives, status, createdAt` |
| **`Invoice`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, type, invoiceNumber, status, issueDate` |
| **`InvoiceLineItem`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, productId, description, quantity, unitPrice, taxRate` |
| **`Payment`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, amount, currency, method, reference, notes` |
| **`Account`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, code, name, type, parentId, isActive` |
| **`FinanceLease`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, leaseRef, description, startDate, endDate, leaseType` |
| **`PaymentMethod`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, provider, providerPaymentMethodId, cardBrand, cardLast4, isDefault, createdAt` |
| **`PaymentTransaction`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, paymentMethodId, provider, providerTxId, type, status` |
| **`FinanceAuditLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, entityType, entityId, action, changes, userId, ipAddress` |
| **`FinancialPeriod`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, startDate, endDate, status, createdAt` |
| **`InvoiceDunningLog`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, invoiceId, dunningLevelId, dunningRunId, sentAt, feeApplied` |
| **`PaymentSchedule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, vendorId, purchaseOrderId, dueDate, amount, status` |
| **`PaymentRun`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, runDate, bankAccountId, totalAmount, status, organization` |
| **`AccountingBook`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, standard, isPrimary, isActive, createdAt` |
| **`AccountingBookRule`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, sourceBookId, destinationBookId, sourceAccountId, destinationAccountId, ruleType` |
| **`PaymentTermTemplate`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, dueDays, discountDays, discountPct, isActive` |
| **`PaymentBatch`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchNumber, status, createdAt, createdBy, submittedAt, submittedBy` |
| **`PaymentBatchLine`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, invoiceId, amount, scheduledPaymentDate, status, settledAt` |
| **`FinancialControl`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, controlCode, name, description, riskLevel, controlType, category` |
| **`AccountTeam`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, name, description, isActive, createdAt, updatedAt` |
| **`AccountTeamMember`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, teamId, userId, role, isPrimary, createdAt, team` |
| **`InvoiceFactoringFacility`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, facilityName, facilityLimit, utilizedAmount, advanceRate, discountRate, minInvoiceAmount` |
| **`InvoiceFactoringAdvance`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, facilityId, invoiceId, invoiceAmount, advanceAmount, feeAmount, netAdvance` |
| **`InvoiceCaptureBatch`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchName, totalDocuments, processedCount, failedCount, status, startedAt` |
| **`InvoiceCaptureResult`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, fileName, filePath, confidenceScore, extractedData, validationStatus` |
| **`InvoiceMatchRule`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, matchType, tolerancePercent, toleranceAmount, autoApprove, autoReject` |
| **`PaymentRailOptimization`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, batchId, paymentId, recommendedRail, estimatedCost, estimatedSpeed, actualCost` |
| **`FinancialNlpQueryLog`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, queryText, parsedIntent, generatedSql, resultSummary, executionTimeMs, wasSuccessful` |
| **`AccountScore`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerId, score, factors` |

### 📄 Schema: `core-part-15.prisma` (27 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`DocumentRecentItem`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, userId, lastViewed, viewCount, document` |
| **`DocumentWatermark`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, documentId, text, opacity, position, rotation, fontSize` |
| **`StorageEncryption`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, algorithm, keyId, encryptedKey, status, createdBy` |
| **`StorageReplication`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, sourceBucket, targetBucket, targetRegion, status, lastReplicated` |
| **`StorageBackup`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, type, status, fileUrl, fileSize` |
| **`StorageAnalytic`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, date, totalFiles, totalSize, fileTypes` |
| **`StorageAlert`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, metric, condition, threshold, enabled, lastTriggered` |
| **`StorageMigration`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, sourceProvider, targetProvider, fileCount, totalSize, status` |
| **`StorageCompression`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, algorithm, originalSize, compressedSize, ratio, status` |
| **`StorageDeduplication`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileHash, fileCount, totalSize, savedSize, status, createdBy` |
| **`StorageSnapshot`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, type, status, fileCount, totalSize` |
| **`StorageRetentionPolicy`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, retentionDays, action, fileTypes, enabled` |
| **`StorageComplianceLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, policyId, fileId, action, details, checkedAt, createdBy` |
| **`StorageCache`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, fileId, cacheKey, cacheType, fileSize, expiresAt, createdAt` |
| **`StorageSync`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, sourceProvider, targetProvider, syncDirection, schedule, lastSyncedAt` |
| **`WorkflowTemplate`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, category, triggerType, nodes, edges` |
| **`WorkflowCategory`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, color, icon, sortOrder, createdBy` |
| **`WorkflowVersion`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, version, nodes, edges, settings` |
| **`WorkflowCondition`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, name, field, operator, value, logicGroup` |
| **`WorkflowLoop`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, name, loopField, maxIterations, breakOn, sortOrder` |
| **`WorkflowSubprocess`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, parentDefinitionId, childDefinitionId, name, inputMapping` |
| **`WorkflowErrorHandler`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, name, onError, retryCount, retryDelay, notifyRoles` |
| **`WorkflowNotification`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, event, channel, recipients, template, createdBy` |
| **`WorkflowWebhook`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, url, method, headers` |
| **`WorkflowMetric`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, definitionId, date, executions, avgDuration, successCount, failureCount` |
| **`WorkflowTag`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, color, createdBy, createdAt, tagAssignments` |
| **`WorkflowTagAssignment`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, tagId, definitionId, createdAt, tag, definition` |

### 📄 Schema: `field-service.prisma` (26 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`WorkOrder`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, bomId, workOrderNumber, status, quantity, startDate, endDate` |
| **`WorkOrderOperation`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, sequence, name, workstationCode, durationMinutes, status` |
| **`WorkOrderComponentConsumption`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, productId, lotNumber, quantityConsumed, workOrder, product` |
| **`FieldSalesRoute`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, assignedToId, date, startLocation` |
| **`FieldSalesRouteStop`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, routeId, customerId, contactId, name, address, location` |
| **`FieldSalesCheckin`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, routeId, stopId, userId, customerId, type, location` |
| **`FieldSalesExpense`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, userId, routeId, category, amount, currency` |
| **`FieldSalesMeetingReport`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, customerId, userId, title, meetingDate, attendees` |
| **`FieldServiceSla`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, priority, responseTimeMin, resolutionTimeMin, escalationRules` |
| **`FieldServiceTicket`** | 40 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, customerId, customerName, customerEmail, customerPhone, contactPerson` |
| **`FieldServiceTechnician`** | 29 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, name, email, phone, avatarUrl, skills` |
| **`FieldServiceDispatch`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, technicianId, scheduledStart, estimatedDuration, travelDistance, travelTime` |
| **`FieldServiceAppointment`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, technicianId, startTime, endTime, duration, checkInTime` |
| **`FieldServiceChecklist`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, category, items` |
| **`FieldServiceInventoryItem`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, sku, description, category, unitPrice, unitOfMeasure` |
| **`FieldServiceContract`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, customerName, customerEmail, customerPhone, customerAddress, startDate, endDate` |
| **`FieldServiceTimesheet`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, technicianId, dateWorked, hoursWorked, overtimeHours, travelTime` |
| **`FieldServicePartsUsage`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, itemId, itemName, partNumber, quantity, unitPrice` |
| **`FieldServiceTechnicianDashboard`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, technicianId, date, totalJobs, completedJobs, cancelledJobs, totalHours` |
| **`FieldServiceSchedule`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, technicianId, ticketId, title, description, scheduledDate, startTime` |
| **`FieldServiceCalendarEvent`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, technicianId, scheduleId, ticketId, title, description, eventType` |
| **`FieldServicePartRequest`** | 23 fields | ✅ Yes (`tenantId`) | `id, tenantId, ticketId, technicianId, itemId, itemName, partNumber, quantityRequested` |
| **`FieldServiceVanStock`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, technicianId, itemId, itemName, quantityOnVan, minStockLevel, maxStockLevel` |
| **`FieldServiceWarranty`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, assetId, warrantyNo, provider, startDate, endDate, coverageDetails` |
| **`FieldServiceWorkOrderExpense`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, techId, category, amount, receiptUrl, status` |
| **`FieldServiceInspectionChecklist`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, workOrderId, title, items, completedBy, completedAt, status` |

### 📄 Schema: `healthcare.prisma` (24 models, 1 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`HealthScoreConfig`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, weightNps, weightEngagement, weightProduct, weightSupport, weightRenewal` |
| **`AppointmentSchedule`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, appointmentNumber, appointmentType, status, carrierId, carrierName, carrierContact` |
| **`HealthcarePatient`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, firstName, lastName, dateOfBirth, gender, email, phone` |
| **`HealthcarePractitioner`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, employeeId, specialty, licenseNumber, status, isActive, createdAt` |
| **`HealthcareAppointment`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, practitionerId, startTime, endTime, status, notes` |
| **`HealthcarePrescription`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, practitionerId, details, status, isActive, createdAt` |
| **`HealthcareEncounter`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, practitionerId, diagnosis, treatmentCode, billingAmount, isActive` |
| **`HealthcareDrug`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, batchNumber, expiryDate, isControlled, quantity, isActive` |
| **`HealthcareVital`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, systolic, diastolic, heartRate, temperature, spo2` |
| **`HealthcareFhirResource`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, resourceType, resourceId, payload, isActive, createdAt, updatedAt` |
| **`HealthcarePatientAllergy`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, allergen, severity, reaction, isActive, createdAt` |
| **`HealthcareAppointmentSchedule`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, practitionerId, dayOfWeek, startTime, endTime, frequency` |
| **`HealthcarePrescriptionItem`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, prescriptionId, drugName, dosage, frequency, duration, route` |
| **`HealthcareLabOrder`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, practitionerId, testName, testCode, specimenType, priority` |
| **`HealthcareLabResult`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, parameter, value, unit, referenceRange, isAbnormal` |
| **`HealthcareInsurancePolicy`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, providerName, policyNumber, groupNumber, coverageType, startDate` |
| **`HealthcareInsuranceClaim`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, policyId, encounterId, claimNumber, serviceDate, billedAmount, paidAmount` |
| **`HealthcarePharmacyBatch`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, drugId, batchNumber, manufacturer, lotNumber, quantity, remainingQty` |
| **`HealthcareControlledSubstanceLog`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, drugId, batchId, action, quantity, patientId, administeredBy` |
| **`HealthcareDoctorSchedule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, practitionerId, dayOfWeek, startTime, endTime, slotDurationMin, isAvailable` |
| **`HealthcareMedicalRecord`** | 17 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, recordType, title, content, diagnosis, icdCode` |
| **`HealthcareClinicalNote`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, doctorId, subjective, objective, assessment, plan` |
| **`HealthcareTelemedicineSession`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, doctorId, meetingId, joinUrl, scheduledAt, durationMins` |
| **`HealthcareMedicalBill`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, patientId, billNumber, totalAmount, insurancePay, patientPay, status` |

### 📄 Schema: `real-estate.prisma` (23 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`LeaseSchedule`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, financeLeaseId, periodStart, periodEnd, paymentAmount, interestExpense, principalRepayment` |
| **`UnitOfMeasure`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, abbreviation, type, isBase, isActive, createdAt` |
| **`ProposalDocument`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, quotationId, title, templateId, content` |
| **`RealEstateProperty`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, type, portfolioId, buildingId, address, city` |
| **`RealEstatePropertyPortfolio`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, type, targetRoi, totalValue, status` |
| **`RealEstatePropertyBuilding`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, totalFloors, totalUnits, amenities, yearBuilt` |
| **`RealEstatePropertyUnit`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, unitNumber, floor, bedrooms, bathrooms, sqft` |
| **`RealEstateLease`** | 29 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, unitId, tenantName, tenantEmail, tenantPhone, startDate` |
| **`RealEstateLeasePayment`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, leaseId, amount, paidAmount, dueDate, paidDate, method` |
| **`RealEstateTenant`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, name, email, phone, unit, leaseStart` |
| **`RealEstateMaintenanceWorkOrder`** | 27 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, unitId, requestedBy, tenantName, title, description` |
| **`RealEstateMaintenanceVendor`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, contactName, email, phone, address, specialties` |
| **`RealEstateCommissionPlan`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, agentName, agentEmail, agentPhone, agentLicense` |
| **`RealEstateCommissionPayout`** | 21 fields | ✅ Yes (`tenantId`) | `id, tenantId, planId, agentName, dealName, dealValue, amount, commissionRate` |
| **`RealEstatePropertyValuation`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, valuationDate, appraisedValue, marketValue, assessedValue, method` |
| **`RealEstateMaintenanceRequest`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, unitId, leaseId, requestedBy, requestedName, requestedEmail` |
| **`RealEstateLeaseRenewal`** | 25 fields | ✅ Yes (`tenantId`) | `id, tenantId, leaseId, propertyId, unitId, tenantName, tenantEmail, currentRent` |
| **`RealEstateRentEscalation`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, leaseId, propertyId, unitId, scheduleName, escalationType, escalationRate` |
| **`RealEstatePropertyFinancial`** | 33 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, periodStart, periodEnd, grossRentIncome, otherIncome, totalIncome` |
| **`RealEstateExpenseCategory`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, type, isTaxDeductible, sortOrder` |
| **`RealEstatePropertyInspection`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, inspectorId, type, checklist, passed, notes` |
| **`RealEstateRentCollectionLog`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, leaseId, tenantUser, amountPaid, paymentMethod, transactionRef, paidAt` |
| **`RealEstateListingSyndicate`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, propertyId, platform, externalId, status, lastSyncedAt, createdAt` |

### 📄 Schema: `education.prisma` (22 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`EducationStudent`** | 22 fields | ✅ Yes (`tenantId`) | `id, tenantId, firstName, lastName, enrollmentNumber, dateOfBirth, parentContact, email` |
| **`EducationCourse`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, credits, description, status, isActive` |
| **`EducationFeeStructure`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, amount, dueDate, status, isActive` |
| **`StudentFee`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, feeStructureId, amount, paidAmount, status, createdAt` |
| **`EducationBook`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, isbn, author, quantity, available, isActive` |
| **`EducationAttendanceRecord`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, courseId, attendanceId, date, status, createdAt` |
| **`EducationTimetable`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, room, weekday, startTime, endTime, instructorId` |
| **`EducationParent`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, firstName, lastName, email, phone, address, relation` |
| **`EducationStudentParent`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, parentId, createdAt, student, parent` |
| **`EducationEnrollment`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, courseId, academicYear, semester, enrollmentDate, status` |
| **`EducationCourseModule`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, title, description, sortOrder, durationHrs, isActive` |
| **`EducationGradebook`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, name, weight, maxScore, isActive, createdAt` |
| **`EducationGradeEntry`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, gradebookId, studentId, score, comment, isActive, createdAt` |
| **`EducationAttendance`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, date, topic, startTime, endTime, isActive` |
| **`EducationFeeInvoice`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, invoiceNumber, totalAmount, paidAmount, dueDate, status` |
| **`EducationFeePayment`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, invoiceId, amount, method, reference, paidBy, paidAt` |
| **`EducationLibraryFine`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, transactionId, amount, reason, status, paidAt` |
| **`EducationExamSchedule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, courseId, title, examDate, startTime, endTime, room` |
| **`EducationExamResult`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, examId, studentId, score, grade, comments, isPassed` |
| **`EducationReportCard`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, academicYear, term, gpa, comments, publishedAt` |
| **`EducationScholarship`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, studentId, name, provider, amount, academicYear, status` |
| **`EducationAssignmentSubmission`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, assignmentId, studentId, submissionUrl, content, score, feedback` |

### 📄 Schema: `provider-registry.prisma` (20 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Provider`** | 12 fields | 🌐 Global / Reference | `id, name, description, status, createdAt, updatedAt, bindings, credentials` |
| **`ProviderBinding`** | 6 fields | 🌐 Global / Reference | `id, providerId, capabilityId, priority, createdAt, provider` |
| **`ProviderCredential`** | 8 fields | 🌐 Global / Reference | `id, providerId, secretRef, label, rotatedAt, expiresAt, createdAt, provider` |
| **`ProviderCapability`** | 6 fields | 🌐 Global / Reference | `id, providerId, capabilityId, discoveredAt, discoveryDetail, provider` |
| **`ProviderHealthConfig`** | 3 fields | 🌐 Global / Reference | `id, providerId, intervalSeconds` |
| **`ProviderHealthCheck`** | 7 fields | 🌐 Global / Reference | `id, providerId, checkedAt, healthy, latencyMs, error, provider` |
| **`ProviderQuota`** | 7 fields | 🌐 Global / Reference | `id, providerId, capabilityId, limitValue, windowSeconds, observedAt, provider` |
| **`TenantProviderOverride`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, capabilityId, providerId, reason, createdAt` |
| **`StickyRouteAssignment`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, capabilityId, stickyKey, providerId, assignedAt` |
| **`ProviderCircuitState`** | 4 fields | 🌐 Global / Reference | `id, providerId, consecutiveFailures, openedAt` |
| **`ProviderPriceSheetEntry`** | 9 fields | 🌐 Global / Reference | `id, providerId, capabilityId, operation, unit, pricePerUnit, currency, observedAt` |
| **`CostIngestionBatch`** | 8 fields | 🌐 Global / Reference | `id, providerId, period, currency, invoiceTotal, lineItemCount, ingestedAt, lineItems` |
| **`CostLineItem`** | 8 fields | 🌐 Global / Reference | `id, batchId, sourceLineId, description, amount, resourceId, sharedResourceIds, batch` |
| **`BudgetPolicy`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, period, thresholdAmount, enforcementResourceId, enforcementDesiredState, createdAt` |
| **`ProviderConsumptionReport`** | 7 fields | ✅ Yes (`tenantId`) | `id, providerId, tenantId, metric, period, reportedQuantity, reportedAt` |
| **`FinOpsRecommendation`** | 12 fields | 🌐 Global / Reference | `id, resourceId, kind, costBefore, predictedSaving, recommendedDesiredState, status, executedAt` |
| **`StepUpMfaVerification`** | 6 fields | 🌐 Global / Reference | `id, userId, token, verifiedAt, expiresAt, usedAt` |
| **`PrivilegeElevation`** | 7 fields | 🌐 Global / Reference | `id, userId, privilege, grantedBy, grantedAt, expiresAt, expiredAuditedAt` |
| **`SloDefinition`** | 7 fields | ✅ Yes (`tenantId`) | `id, service, tenantId, targetPercent, monthlyFee, createdAt, incidents` |
| **`Incident`** | 11 fields | ✅ Yes (`tenantId`) | `id, sloDefinitionId, tenantId, severity, status, actualPercent, creditAmount, invoiceAdjustmentId` |

### 📄 Schema: `web.prisma` (17 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`WebhookSubscription`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, targetUrl, events, secret, status, createdAt` |
| **`WebhookDeliveryLog`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, subscriptionId, event, payload, responseStatus, responseBody, attempts` |
| **`WebPage`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, status, sections` |
| **`WebAsset`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, url, type, sizeBytes, uploadedBy, createdAt` |
| **`WebTemplate`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, thumbnail, htmlContent, cssContent, designTokens` |
| **`WebMenu`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, location, items` |
| **`WebSeo`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, path, title, description, keywords, ogImage, status` |
| **`WebSettings`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, activeTemplateId, globalCss, themeTokens` |
| **`WebCollection`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, siteId, name, slug, singular, description, icon` |
| **`WebCollectionItem`** | 5 fields | ✅ Yes (`tenantId`) | `id, tenantId, collectionId, slug, data` |
| **`WebFormSubmission`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, siteId, formName, pageSlug, data` |
| **`WebOrder`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, siteId, orderNumber, status, customer` |
| **`WebSite`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, slug, status, theme` |
| **`WebDomain`** | 7 fields | 🌐 Global / Reference | `id, siteId, host, verified, isPrimary, createdAt, site` |
| **`WebSitePage`** | 8 fields | ✅ Yes (`tenantId`) | `id, siteId, tenantId, path, title, type, blocks, seo` |
| **`WebChatbot`** | 6 fields | ✅ Yes (`tenantId`) | `id, siteId, tenantId, name, enabled, config` |
| **`WebToLeadForm`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, fields, settings` |

### 📄 Schema: `pos.prisma` (16 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Position`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, departmentId, title, code, budgetedSalary, status, employeeId` |
| **`PosShiftCashDrawer`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, shiftId, type, amount, reason, createdBy, createdAt` |
| **`PosShiftTransaction`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, shiftId, orderId, type, amount, createdAt, shift` |
| **`PosRegister2`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalId, openedById, closedById, openedAt, closedAt, status` |
| **`PosPaymentMethod`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, type, isActive, sortOrder, requiresRef` |
| **`PosRefund`** | 20 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, refundNumber, originalOrderId, type, status, reason` |
| **`PosRefundItem`** | 12 fields | ✅ Yes (`tenantId`) | `id, tenantId, refundId, orderItemId, productId, productName, qty, unitPrice` |
| **`PosGiftCard2`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, code, initialBalance, currentBalance, currency, issuedTo` |
| **`PosGiftCardTransaction2`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, giftCardId, orderId, type, amount, balance, notes` |
| **`PosCustomerDisplay`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, terminalId, enabled, template, showCart, showTotal, showPromo` |
| **`PosOrderType`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, description, isDefault, sortOrder, isActive` |
| **`PosDiscountRule`** | 24 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgId, name, description, type, value, appliesTo` |
| **`PosTaxRule`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, rate, type, appliesTo, categoryId, productId` |
| **`PosKitchenDisplay`** | 8 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, code, terminalIds, status, createdAt, updatedAt` |
| **`PosKitchenOrder`** | 15 fields | ✅ Yes (`tenantId`) | `id, tenantId, kitchenDisplayId, orderId, orderNumber, terminalName, items, status` |
| **`PosSplitPayment`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, orderId, method, amount, reference, cardLast4, authCode` |

### 📄 Schema: `resource-model.prisma` (15 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`ResourceKind`** | 4 fields | 🌐 Global / Reference | `id, name, description, resources` |
| **`Resource`** | 11 fields | 🌐 Global / Reference | `id, kindId, name, createdAt, updatedAt, kind, desiredState, observedState` |
| **`DesiredState`** | 6 fields | 🌐 Global / Reference | `id, resourceId, state, version, setAt, resource` |
| **`DesiredStateVersion`** | 5 fields | 🌐 Global / Reference | `id, resourceId, version, state, setAt` |
| **`ObservedState`** | 5 fields | 🌐 Global / Reference | `id, resourceId, state, observedAt, resource` |
| **`Dependency`** | 5 fields | 🌐 Global / Reference | `id, resourceId, dependsOnId, resource, dependsOn` |
| **`DriftRecord`** | 3 fields | 🌐 Global / Reference | `id, resourceId, detectedAt` |
| **`ResourceAttribution`** | 8 fields | ✅ Yes (`tenantId`) | `id, resourceId, tenantId, service, environment, owner, attributedAt, attributedBy` |
| **`CapacityObservation`** | 6 fields | 🌐 Global / Reference | `id, resourceId, metric, value, capacity, observedAt` |
| **`TelemetrySample`** | 5 fields | 🌐 Global / Reference | `id, resourceId, metric, value, observedAt` |
| **`EstateGrant`** | 9 fields | ✅ Yes (`tenantId`) | `id, subjectId, capability, resourceKind, region, environment, tenantId, accountId` |
| **`BackupPolicy`** | 5 fields | 🌐 Global / Reference | `id, resourceId, rpoObjectiveMinutes, rtoObjectiveMinutes, createdAt` |
| **`RestoreRehearsal`** | 9 fields | 🌐 Global / Reference | `id, resourceId, measuredRpoMinutes, measuredRtoMinutes, rpoObjectiveMinutes, rtoObjectiveMinutes, passed, reconciled` |
| **`FailoverRehearsal`** | 7 fields | 🌐 Global / Reference | `id, resourceId, fromRegion, toRegion, failedOverAt, failbackAt, failbackVerified` |
| **`RetentionCertificate`** | 6 fields | 🌐 Global / Reference | `id, dataClass, cutoff, candidateCount, deletedCount, executedAt` |

### 📄 Schema: `ai-governance.prisma` (10 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`AiProviderModel`** | 9 fields | 🌐 Global / Reference | `id, providerId, modelId, version, capabilities, config, status, createdAt` |
| **`AiPromptVersion`** | 8 fields | 🌐 Global / Reference | `id, name, slug, version, content, variables, isActive, createdAt` |
| **`AiMcpServer`** | 8 fields | 🌐 Global / Reference | `id, name, endpoint, authSecretRef, capabilities, status, createdAt, updatedAt` |
| **`AiRagIndex`** | 8 fields | 🌐 Global / Reference | `id, name, source, embeddingModel, chunkCount, status, createdAt, updatedAt` |
| **`AiAgentRegistration`** | 11 fields | 🌐 Global / Reference | `id, agentKey, name, description, modelId, providerId, mcpServerIds, ragIndexIds` |
| **`AiEvalSuite`** | 6 fields | 🌐 Global / Reference | `id, name, description, createdAt, cases, runs` |
| **`AiEvalCase`** | 7 fields | 🌐 Global / Reference | `id, suiteId, name, prompt, expected, createdAt, suite` |
| **`AiEvalRun`** | 7 fields | 🌐 Global / Reference | `id, suiteId, providerId, modelId, status, passedCount, failedCount` |
| **`AiGuardrailPolicy`** | 3 fields | 🌐 Global / Reference | `id, name, ruleType` |
| **`AiGuardrailEvent`** | 6 fields | 🌐 Global / Reference | `id, policyId, action, tenantRef, inputHash, detail` |

### 📄 Schema: `manufacturing.prisma` (8 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`RoutingRule`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, description, priority, conditions` |
| **`WorkCenterCapacity`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, workstationId, date, availableHours, utilizedHours, overtimeHours, notes` |
| **`MfgSpcChart`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, chartType, productId, processId, characteristic, measurementUnit` |
| **`MfgSpcDataPoint`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, chartId, sampleNo, value, mean, range, stdDev` |
| **`MfgCostEntry`** | 13 fields | ✅ Yes (`tenantId`) | `id, tenantId, costSheetId, costType, description, quantity, unitCost, amount` |
| **`MfgMaintenanceWorkOrder`** | 19 fields | ✅ Yes (`tenantId`) | `id, tenantId, scheduleId, machineId, workOrderNo, maintenanceType, priority, description` |
| **`MfgDocumentControl`** | 18 fields | ✅ Yes (`tenantId`) | `id, tenantId, docNumber, title, docType, revision, status, content` |
| **`MfgDocumentVersion`** | 9 fields | ✅ Yes (`tenantId`) | `id, tenantId, docId, revision, changes, fileUrl, createdBy, createdAt` |

### 📄 Schema: `operation-pipeline.prisma` (7 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`BlackoutPeriod`** | 5 fields | 🌐 Global / Reference | `id, reason, startTime, endTime, createdAt` |
| **`Job`** | 7 fields | 🌐 Global / Reference | `id, planId, resourceId, correlationId, status, stepIndex, steps` |
| **`PlatformBulkOperation`** | 5 fields | 🌐 Global / Reference | `id, kind, status, cursor, items` |
| **`ScheduledOperation`** | 8 fields | 🌐 Global / Reference | `id, planId, resourceId, scheduledFor, recurrence, approvalId, status, createdAt` |
| **`PlatformEventOutboxEntry`** | 5 fields | 🌐 Global / Reference | `id, sequence, eventType, payload, occurredAt` |
| **`WebhookEndpoint`** | 7 fields | 🌐 Global / Reference | `id, url, secret, eventTypes, healthy, lastDeliveredSequence, createdAt` |
| **`WebhookDeliveryAttempt`** | 6 fields | 🌐 Global / Reference | `id, endpointId, sequence, eventType, success, deliveredAt` |

### 📄 Schema: `catalogue.prisma` (4 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`CatalogueProduct`** | 6 fields | 🌐 Global / Reference | `id, name, capabilityId, priceCents, createdAt, items` |
| **`CatalogueSuite`** | 4 fields | 🌐 Global / Reference | `id, name, createdAt, items` |
| **`CatalogueSuiteItem`** | 5 fields | 🌐 Global / Reference | `id, suiteId, productId, suite, product` |
| **`CatalogueProvisioning`** | 6 fields | ✅ Yes (`tenantId`) | `id, suiteId, tenantId, resourceId, totalPriceCents, provisionedAt` |

### 📄 Schema: `compliance.prisma` (3 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`ComplianceControl`** | 5 fields | 🌐 Global / Reference | `id, code, frameworks, title, description` |
| **`ComplianceControlEvaluation`** | 6 fields | 🌐 Global / Reference | `id, controlId, status, observed, finding, evaluatedAt` |
| **`ComplianceEvidence`** | 7 fields | 🌐 Global / Reference | `id, controlCode, auditorQuestion, artefact, contentHash, generatedBy, generatedAt` |

### 📄 Schema: `org-structure.prisma` (3 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`OrgUnit`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, name, kind, parentId, createdAt` |
| **`OrgPosition`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, orgUnitId, title, managerPositionId, occupantUserId, createdAt` |
| **`ApprovalRouting`** | 7 fields | ✅ Yes (`tenantId`) | `id, tenantId, requestId, startPositionId, approverChain, finalApproverUserId, routedAt` |

### 📄 Schema: `custom-objects.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`CustomObjectDefinition`** | 11 fields | ✅ Yes (`tenantId`) | `id, tenantId, apiName, label, description, status, tableName, createdByUserId` |
| **`CustomObjectFieldDefinition`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, objectId, name, label, type, required, indexed` |

### 📄 Schema: `extensions.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`TenantExtensionInstallation`** | 14 fields | ✅ Yes (`tenantId`) | `id, tenantId, extensionId, version, publisher, status, grantedScopes, approvedHosts` |
| **`ExtensionInvocationUsage`** | 10 fields | ✅ Yes (`tenantId`) | `id, tenantId, extensionId, hook, cpuMs, queries, httpCalls, failed` |

### 📄 Schema: `marketplace-payouts.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`MarketplaceEarning`** | 14 fields | 🌐 Global / Reference | `id, vendorId, appSlug, payingTenantId, grossAmount, commissionAmount, netAmount, commissionRate` |
| **`MarketplacePayoutBatch`** | 16 fields | 🌐 Global / Reference | `id, vendorId, periodStart, periodEnd, totalAmount, currency, status, providerRef` |

### 📄 Schema: `policy-engine.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Policy`** | 6 fields | 🌐 Global / Reference | `id, name, description, version, createdAt, overrides` |
| **`PolicyOverride`** | 10 fields | 🌐 Global / Reference | `id, policyId, scopeType, scopeId, reason, grantedBy, expiresAt, revertedAt` |

### 📄 Schema: `runbooks.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`Runbook`** | 6 fields | 🌐 Global / Reference | `id, name, steps, version, status, createdAt` |
| **`RunbookExecution`** | 7 fields | 🌐 Global / Reference | `id, runbookId, incidentId, approvalId, jobId, planIds, executedAt` |

### 📄 Schema: `saas-portal.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`DataBreach`** | 28 fields | ✅ Yes (`tenantId`) | `id, tenantId, title, description, severity, status, detectedAt, assessedAt` |
| **`DataBreachTimeline`** | 7 fields | 🌐 Global / Reference | `id, breachId, timestamp, action, details, performedBy, breach` |

### 📄 Schema: `workflow-runtime.prisma` (2 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`BuilderWorkflowRun`** | 6 fields | ✅ Yes (`tenantId`) | `id, tenantId, workflowId, status, trigger, input` |
| **`BuilderWorkflowRunStep`** | 16 fields | ✅ Yes (`tenantId`) | `id, tenantId, runId, nodeId, nodeType, nodeLabel, status, sortOrder` |

### 📄 Schema: `reconciler.prisma` (1 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |
| **`ReconciliationHold`** | 5 fields | 🌐 Global / Reference | `id, reason, setBy, setAt, releasedAt` |

### 📄 Schema: `config.prisma` (0 models, 0 enums)

| Model Name | Field Count | Tenant Isolated (`tenantId`) | Sample Fields |
| :--- | :--- | :--- | :--- |


---

## 🔒 Row-Level Security (RLS) Enforcement Architecture
```sql
-- Standard RLS Policy Pattern in setup-rls.sql
ALTER TABLE "TableName" ENABLE ROW LEVEL SECURITY;
CREATE POLICY tenant_isolation_policy ON "TableName"
  FOR ALL
  USING ("tenantId" = current_setting('app.current_tenant_id', true)::uuid);
```
