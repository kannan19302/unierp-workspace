# Journal — kannan19302@MSI/ERPSys-a21-notify

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### A21 · CLAIMED · 2026-08-08T00:01:19Z · kannan19302@MSI/ERPSys-a21-notify

```
wave      0
branch    autopilot/a21-notify
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### A21 · FINISH · 2026-08-08T00:32:26Z · kannan19302@MSI/ERPSys-a21-notify

```
verify.mjs: PASS

A21 — Unified notification & delivery engine
=============================================

EXIT CRITERION
    "Every notification in the platform routes through it; a per-user preference
     suppresses delivery across all 45 modules; delivery status is queryable.
     No module sends mail directly (G-5)."

EXIT-CRITERION COMMAND (run from D:\UniERP\unierp-api)
    npx vitest run src/modules/notifications/tests/a21-exit.spec.ts

--------------------------------------------------------------------------------
1) BEFORE BUILDING — the criterion FAILED (7 failed / 2 passed):

   Test Files  1 failed (1)
        Tests  7 failed | 2 passed (9)

   Failures (the exact ones the build fixes):
     - G-5: "no src/modules/** file references nodemailer or sendMail("
         offender: src/modules/admin/admin.service.ts (createTransport/sendMail)
     - G-5: "engine is the single mail route: injects email queue"
         engine had no InjectQueue / emailQueue.add
     - G-5: "no src/modules/** file writes prisma.notification.create"
         offender: src/modules/communication/communication.service.ts (1121, 1524)
     - "disabling EMAIL for one user suppresses only that user's email"   (no preference lookup / no delivery logs)
     - "a single global preference suppresses in-app delivery across modules" (no suppression)
     - "writes queryable delivery logs for every delivered channel"       (no delivery logs written)
     - "quiet hours suppress non-urgent EMAIL/PUSH, urgent bypasses"      (no quiet hours)

--------------------------------------------------------------------------------
2) AFTER BUILDING — the criterion PASSES:

   ✓ src/modules/notifications/tests/a21-exit.spec.ts (9 tests)
   Test Files  1 passed (1)
        Tests  9 passed (9)

--------------------------------------------------------------------------------
3) DELIBERATE BREAK — preference lookup disabled in the engine
   (NotificationDeliveryService.getDisabledChannels returned an empty set):

   FAIL src/modules/notifications/tests/a21-exit.spec.ts > ... > disabling EMAIL for
        one user suppresses only that user's email
   FAIL src/modules/notifications/tests/a21-exit.spec.ts > ... > a single global
        preference suppresses in-app delivery across modules
   Test Files  1 failed (1)
        Tests  2 failed | 7 passed (9)

   The criterion fails again the moment the engine stops consulting preferences.

--------------------------------------------------------------------------------
SUPPORTING GATES (all green)
    api:    npm run typecheck            → no errors
    api:    npx depcruise ... src        → no dependency violations (1914 modules)
    api:    vitest notifications+communication+admin → 48 files / 437 tests passed
    api:    full vitest run              → only pre-existing failures in unrelated
            modules (storage-advanced, marketplace/payout, supply-chain-expansion,
            documents-advanced, drive-deep, workflow-advanced, crm-*deep); verified
            identical on a clean baseline via `git stash`, so not caused by A21.
    contracts: npm run build && npm run typecheck → clean

BUILT (per repository)
    unierp-api
      - src/modules/notifications/notification-delivery.service.ts  (the engine:
        preferences, quiet hours, templates+locale, email queue, SMS/PUSH fan-out,
        webhook POST, delivery logging; `notification.send` + `notification.create`)
      - src/modules/notifications/tests/a21-exit.spec.ts            (exit check)
      - src/modules/communication/communication.service.ts          (routed through
        engine: mentions + createNotification emit events, no direct writes)
      - src/modules/communication/tests/communication.service.spec.ts (asserts events)
      - src/modules/admin/admin.service.ts                           (nodemailer
        removed (G-5); invite routed through engine)
    unierp-contracts
      - src/entities/notification.ts, src/events/notification.ts,
        src/http/notification.ts + index wiring (L0 NotificationSendEvent, entities,
        preference/delivery HTTP contracts)
```

