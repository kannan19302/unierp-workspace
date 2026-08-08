# Journal — kannan19302@MSI/ERPSys-a13-alerting

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### A13 · CLAIMED · 2026-08-08T03:16:45Z · kannan19302@MSI/ERPSys-a13-alerting

```
wave      0
branch    autopilot/a13-alerting
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### A13 · FINISH · 2026-08-08T03:40:57Z · kannan19302@MSI/ERPSys-a13-alerting

```
verify.mjs: PASS

A13 — Alert routing and on-call proof
Exit criterion (verbatim): "A synthetic SLO breach produces a delivered alert. A rehearsal is logged with time-to-detect."

Mechanism built in unierp-infra (L7 ops):
  - alerting/alert-routing.json   — SLO → receiver routing table (one route per SLO in SLO-DEFINITIONS.yaml;
                                     production destination documented as PagerDuty events API v2 + Slack #incidents).
  - scripts/webhook-receiver.mjs  — the rehearsal destination: a loopback webhook receiver enforcing the SAME
                                     delivery contract production routes depend on (slo_id, severity,
                                     error_budget_consumed_pct, fired_at, runbook; 200 ack or 400 reject).
  - scripts/rehearse-alert-routing.mjs — the harness: fires a synthetic SLO breach through the routing table,
                                     requires delivery, times it (time-to-detect), logs the rehearsal.
  - docs/runbooks/INCIDENT-RESPONSE.md — alert-routing section, per-SLO response playbooks (the anchors
                                     SLO-DEFINITIONS.yaml already pointed at but that did not exist), and the
                                     append-only "## Rehearsal log" table.
  - .github/workflows/alert-routing-rehearsal.yml — nightly 03:20 UTC + manual, fails loudly, no continue-on-error,
                                     no hashFiles guard.

PROOF 1 — exit criterion PASSES (delivered + logged):
  Command (from unierp-infra): node scripts/rehearse-alert-routing.mjs --slo slo-login --severity critical
  Output:
      firing synthetic breach: slo-login/critical, 90% error budget consumed → http://127.0.0.1:9199/webhook

    ✓ ALERT DELIVERED — synthetic slo-login/critical breach (90% budget consumed) reached http://127.0.0.1:9199/webhook
      time-to-detect 35 ms · trace b248ad4e-3882-46a2-98a9-5cf22341e521 · logged
  exit=0

  Second SLO (routing table covers all five SLOs):
  Command: node scripts/rehearse-alert-routing.mjs --slo slo-post-transaction --severity critical
  Output:
    ✓ ALERT DELIVERED — synthetic slo-post-transaction/critical breach (90% budget consumed) reached http://127.0.0.1:9199/webhook
      time-to-detect 34 ms · trace a8fab76a-3c38-4ac2-b173-874f5e0d50a1 · logged
  exit=0

  Rehearsal log row appended to docs/runbooks/INCIDENT-RESPONSE.md (committed):
    | 2026-08-08 03:37:57 | slo-login | critical | 90% | 35 ms | http://127.0.0.1:9199/webhook | PASS |
  (machine copy: var/alerting/rehearsal-log.jsonl, gitignored)

PROOF 2 — deliberately broken: dead destination (route points at a host nothing listens on) → NOT delivered:
  Command: node scripts/rehearse-alert-routing.mjs --slo slo-login --severity critical
             --config C:\Users\kanna\AppData\Local\Temp\opencode\broken.alert-routing.json --no-log
           (same routing table, but receiver URL changed to http://127.0.0.2:9199/webhook — no receiver running)
  Output:
      firing synthetic breach: slo-login/critical, 90% error budget consumed → http://127.0.0.2:9199/webhook
      delivery attempt failed after 27 ms: fetch failed

    ✗ REHEARSAL FAILED — alert NOT delivered to http://127.0.0.2:9199/webhook (fetch failed) — the route is broken
  exit=1

PROOF 3 — deliberately broken: defined SLO with no route in the routing table → would never be delivered:
  Command: node scripts/rehearse-alert-routing.mjs --slo slo-run-report --severity warning
             --config C:\Users\kanna\AppData\Local\Temp\opencode\unrouted.alert-routing.json --no-log
           (slo-run-report removed from the routes)
  Output:
    ✗ REHEARSAL FAILED — no route for slo-run-report/warning in .../unrouted.alert-routing.json —
      this alert would never be delivered
  exit=1

PROOF 4 — deliberately broken: SLO not defined in SLO-DEFINITIONS.yaml → refused:
  Command: node scripts/rehearse-alert-routing.mjs --slo slo-does-not-exist --severity critical --no-log
  Output:
    ✗ REHEARSAL FAILED — SLO "slo-does-not-exist" is not defined in docs/runbooks/SLO-DEFINITIONS.yaml
  exit=1
```

