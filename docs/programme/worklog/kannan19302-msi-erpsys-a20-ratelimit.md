# Journal — kannan19302@MSI/ERPSys-a20-ratelimit

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### A20 · CLAIMED · 2026-08-08T00:38:52Z · kannan19302@MSI/ERPSys-a20-ratelimit

```
wave      0
branch    autopilot/a20-ratelimit
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### A20 · FINISH · 2026-08-08T02:26:13Z · kannan19302@MSI/ERPSys-a20-ratelimit

```
verify.mjs: PASS

A20 — Per-tenant rate limiting, quotas, noisy-neighbour isolation

DEFECT
Global TenantThrottlerGuard (app.module.ts) reads identity from req.user, but every
guard — global or per-route — runs before every interceptor in NestJS. Controller-level
JwtAuthGuard therefore runs AFTER the throttler, so req.user was always absent and
getTracker collapsed every tenant into one shared `ip:` bucket. One tenant's runaway
report load throttled every other tenant on the same IP.

FIX (unierp-api)
- tenant-throttler.guard.ts: guard resolves identity itself from the session token
  (cookie auth_token or Authorization: Bearer) via verifyTypedToken(TOKEN_TYPE.SESSION),
  memoized on req.__throttleIdentity; tracker = apikey:tenant:user | tenant:tenant | ip.
- tenant-plan.service.ts: TenantPlanService reads plan from tenants table (RLS-free),
  60s cache, free fallback; query-budget resolver.
- tenant-plan-limits.ts: per-plan short/medium/report/concurrency buckets.
- tenant-query-budget.interceptor.ts: per-tenant in-flight concurrency budget (429 on
  overrun, Observable-preserving finalize) on reporting-engine POST query/export.
- common.module.ts: TenantPlanService registered/exported.

VERIFICATION — unit
  vitest src/common/guards ...tenant-throttler.guard.spec.ts (25) / tenant-plan.service.spec.ts (5)
  / tenant-query-budget.interceptor.spec.ts (5)  -> 35 passed, 0 failed
  vitest src/common/guards src/modules/reporting                              -> 90 passed, 0 failed
  tsc --noEmit                                                                -> clean
  (eslint not installed in this environment — pre-existing)

VERIFICATION — HTTP probe (throttle-probe.mjs, victim requests spaced 350ms)
  FIXED:      A burst 300x -> A 290x429 (own report budget 10/min); B after burst 4x200/0x429   PASS
  BROKEN:     getTracker forced to ip:  B after A burst 4x429                                  FAIL
  RESTORED:   B 4x200/0x429                                                                     PASS

VERIFICATION — k6 exit criterion (scenarios/noisy-neighbour.js)
  noisy tenant: 8 VUs constant 110s hammering POST /reporting/engine/query
  victim tenant: 1 VU, 10 report queries at 10s spacing
  thresholds: http_req_duration{tenant:victim} p(95)<5000, http_req_failed{tenant:victim} rate<0.01
  k6 must reach host via host.docker.internal:3001 (localhost unreachable from container).

  BROKEN (ip: fallback): victim 10/10 HTTP 429  -> rate=100%  THRESHOLD FAILED (rate<0.01 crossed)
  FIXED:                 victim 10/10 HTTP 201  -> p(95)=1.02s (<5s), rate=0.00%  THRESHOLDS PASS
  Noisy tenant exhausted its own budget (20,030 req, 99.89% its own 429s) without affecting victim.

  (k6 config fix: load-tests/config/options.js summaryTrendStats was an object, k6 requires an
   array — fixed so all load-test scenarios load.)

OUT OF SCOPE (pre-existing, logged, not A20)
  Prisma groupBy aggregation against invoices fails validation
  ("Every field used for orderBy must be included in the by-arguments. Missing fields: id")
  -> DB_VALIDATION_ERROR 400. findMany report queries work; seeded 40,000 invoices for load tests.
```

