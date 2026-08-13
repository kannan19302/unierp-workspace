# Journal — kannan19302@MSI/unierp-loop-b

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### M38 · CLAIMED · 2026-08-13T18:12:01Z · kannan19302@MSI/unierp-loop-b

```
wave      0
branch    autopilot/d01-plane2-boundary
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### M38 · FINISH · 2026-08-13T18:43:35Z · kannan19302@MSI/unierp-loop-b

```
verify.mjs: PASS

M38 — Compliance controls and evidence
=======================================

Exit criterion
--------------
An auditor's question is answered with an exported evidence artefact generated
from real audit records, with no manual assembly step. A failing control is
failing in the console before it is failing in an audit.

Exit command
------------
npx vitest run src/platform/v1/compliance-control.service.spec.ts
(workdir: D:\UniERP\unierp-api)

FAIL before (mechanism absent)
------------------------------
> npx vitest run src/platform/v1/compliance-control.service.spec.ts
filter:  src/platform/v1/compliance-control.service.spec.ts
No test files found, exiting with code 1
(exit code 1 — the exit-criterion file did not exist before this phase)

PASS (mechanism built and green)
--------------------------------
> npx vitest run src/platform/v1/compliance-control.service.spec.ts
 ✓ src/platform/v1/compliance-control.service.spec.ts (8 tests) 10ms
 Test Files  1 passed (1)
      Tests  8 passed (8)
(exit code 0)

What the 8 tests prove
  - AUDIT-COMPLETE PASSes when real audit-spine rows exist (observed = 3)
  - a control whose evidence is missing FAILs, and that FAIL is what
    runMonitoring() hands the console — failing in the console before
    any audit has run
  - the catalogue is mapped to frameworks (SOC2/ISO27001)
  - exportEvidence() answers an auditor question with an artefact whose
    rows ARE the real audit records (ids audit-1/2/3, same contentHashes),
    with a SHA-256 contentHash over the packaged rows so an auditor can
    verify the artefact matches the spine — no manual assembly step
  - an auditor question and an exporting operator are both required
  - a control not in the catalogue is refused explicitly
  - previously exported evidence artefacts are listable per control

BREAK (deliberately weakened, then reverted)
--------------------------------------------
Deliberate break: replaced
  const observed = await delegate.count({ where: declaration.evidenceQuery.where });
with
  const observed = await delegate.count({ where: {} }); // DELIBERATE BREAK

> npx vitest run src/platform/v1/compliance-control.service.spec.ts
 ❯ src/platform/v1/compliance-control.service.spec.ts (8 tests | 1 failed)
   × M38 · compliance controls and evidence > renders the latest evaluation...
     → expected 'PASS' to be 'FAIL' // Object.is equality
 FAIL  src/platform/v1/compliance-control.service.spec.ts > M38 ...
AssertionError: expected 'PASS' to be 'FAIL' // Object.is equality
Expected: "FAIL"
Received: "PASS"
(exit code 1 — the criterion fails when the evidence query is ignored,
 because APPROVAL-TWO-PERSON would then falsely PASS with no evidence)

Restored the service; the criterion is green again (8 passed).

Supporting gates
----------------
- node scripts/check-platform-permissions.mjs (unierp-api):
  "47 mounted controllers, 230 endpoints. OK every mounted /platform/v1
  endpoint carries an explicit control-plane permission and a guard chain."
- npx vitest run src/platform/v1/plane1-403-sweep.spec.ts: 5 passed
  (the new ComplianceControlController routes are per-endpoint 403-guarded)
- npx vitest run src/platform/v1/control-plane-authz.spec.ts: 5 passed
- npx vitest run src/platform/v1/: 36 files, 162 passed
- npx tsc --noEmit (unierp-api): clean
- npx tsc --noEmit (unierp-console): clean
- npm run build (unierp-shared): clean; npm run db:generate (unierp-data): clean
- node scripts/ci/verify.mjs --fast (workspace): all gates green
```

### M39 · CLAIMED · 2026-08-13T18:49:00Z · kannan19302@MSI/unierp-loop-b

```
wave      0
branch    autopilot/d01-plane2-boundary
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

