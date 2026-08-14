# Journal — kannan19302@MSI/unierp-loop-a

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### G11 · CLAIMED · 2026-08-13T18:11:55Z · kannan19302@MSI/unierp-loop-a

```
wave      0
branch    autopilot/d01-plane2-boundary
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### G11 · FINISH · 2026-08-13T19:16:37Z · kannan19302@MSI/unierp-loop-a

```
verify.mjs: PASS

G11 exit criterion: "A flow with a failing external call compensates correctly and is
resumable. Every flow run is inspectable step by step."

PASS — runtime suite (the exit criterion itself):
> cd unierp-api
> $env:DATABASE_URL="postgresql://unerp:unerp_password@localhost:5432/unerp_dev?..."; pnpm exec vitest run src/developer/builder/tests/builder-workflow-runtime.service.spec.ts
  ✓ src/developer/builder/tests/builder-workflow-runtime.service.spec.ts (5 tests)
    ✓ BuilderWorkflowRuntimeService > records every step in order — the run is inspectable step by step
    ✓ BuilderWorkflowRuntimeService > compensates the previously-successful charge step when the external ship call fails, and is resumable
    ✓ BuilderWorkflowRuntimeService > resumes a failed run from the failing step and completes
    ✓ BuilderWorkflowRuntimeService > branches on a condition node: true and false paths are followed separately
    ✓ BuilderWorkflowRuntimeService > isolates runs between tenants at the database level (unerp_api, NOBYPASSRLS)
  Test Files  1 passed (1)
       Tests  5 passed (5)

  The run is inspectable step by step: each run has ordered BuilderWorkflowRunStep
  rows (sortOrder 0,1,2...) covering trigger → charge → ship. A failing external call
  (webhook ship returns HTTP 500) leaves the run FAILED with resumeFrom=n-ship, marks
  the previously-successful charge step COMPENSATED (refund webhook called, output
  {compensated:true, target:https://pay.example/refund}), and a resume re-runs from
  the failing step to COMPLETED. Condition branching takes true/false edges
  separately. Tenant isolation proven over the unerp_api (NOBYPASSRLS) role: tenant A
  sees only its own workflow_id in builder_workflow_runs.

BREAK — deliberately changed the compensation target assertion:
> expect((charge?.output as any)?.target).toBe("https://pay.example/REFUND-ON-PURPOSE-WRONG")
  ❯ src/developer/builder/tests/builder-workflow-runtime.service.spec.ts:112:45
  Test Files  1 failed (1)
       Tests  1 failed | 4 passed (5)
  (the mechanism fails when the compensation claim is wrong)

RESTORE — reverted the broken assertion:
> pnpm exec vitest run src/developer/builder/tests/builder-workflow-runtime.service.spec.ts
  Test Files  1 passed (1)
       Tests  5 passed (5)

BUILDER SUITE — all 20 files / 400 tests pass:
> pnpm exec vitest run src/developer/builder
  Test Files  20 passed (20)
       Tests  400 passed (400)

FULL API SUITE — all 557 test files pass:
> pnpm test
  Test Files  557 passed (557)

UI (unierp-developer) — the workflows/[id] stub is replaced by a visual editor:
loop node type (iterations + loop-target), error-path edges (label "error" +
data.errorPath, dashed red stroke), webhook compensation config
(config.compensate = {url,method}), and a run inspector in the History modal that
lists runs, shows the ordered step-by-step trail with per-step status, resumes FAILED
runs, and approves/rejects WAITING approval steps.
tsc --noEmit clean in unierp-developer (pre-existing unrelated recharts import errors
in 4 other pages excluded) and unierp-api.
```

### G12 · CLAIMED · 2026-08-14T00:47:20Z · kannan19302@MSI/unierp-loop-a

```
wave      0
branch    autopilot/d01-plane2-boundary
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

