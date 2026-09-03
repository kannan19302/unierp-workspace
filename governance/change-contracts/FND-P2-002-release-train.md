# Change Contract — FND-P2-002 Release Train and Compatibility

## Cycle status

- Status: `DONE`
- Objective: enforce immutable build artifacts, contract versioning, schema impact analysis, staged promotion, and deployment safety constraints across the estate.
- Risk class: `R1` — release integrity and deployment safety.
- Accountable platforms: Runtime Operations and Platform Governance (`PLT-OPS`, `PLT-GOV`).

## Architecture Invariants

1. **Deployment Safety Gate**:
   - `check-disabled-cd.mjs`: Automatic continuous deployment safely disabled until production release train signoff.
2. **Schema Impact & Compatibility**:
   - `check-schema-impact-analysis.mjs`: Automated detection of breaking schema changes before release.
   - `check-api-versioning-strategy.mjs`: RFC 9745 (`Deprecation`) and RFC 8594 (`Sunset`) conformance.
3. **Client Generation Determinism**:
   - `check-client-generation-determinism.mjs`: Code generation produces 100% byte-deterministic client output.

## Verification Evidence

```bash
node scripts/check-disabled-cd.mjs
node scripts/check-schema-impact-analysis.mjs
node scripts/check-client-generation-determinism.mjs
node scripts/check-api-versioning-strategy.mjs
```
All release and compatibility gates pass cleanly.
