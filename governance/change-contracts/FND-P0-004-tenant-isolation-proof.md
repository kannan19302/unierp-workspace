# Change Contract — FND-P0-004 Whole-Schema Tenant Isolation

## Cycle status

- Status: `PARTIAL`
- Cycle objective: remove a simulated multi-tenant isolation “proof” and require the authoritative database-backed RLS verifier for the real data estate.
- Completed this cycle: current data client, RLS verifier, application role migration, tenant integration suite and false-green workspace proof have been inspected.
- Incomplete this cycle: a production-shaped database run; generated positive/negative/no-context behavioral tests for every tenant-owned table; runtime role/environment assertion; service-path inventory; provider/tenant authority proof.
- Next required action: provide a disposable `DATABASE_APP_URL` for the NOBYPASSRLS application role and run the structural verifier plus behavioral suite.

| Claim | State | Evidence |
| --- | --- | --- |
| Designed | `YES` | FND-P0-004 and root tenant/RLS rules. |
| Implemented | `PARTIAL` | `data/src/index.ts` scopes Prisma operations and sets transaction-local tenant context; migrations create `unerp_api NOBYPASSRLS`; database verifier derives expected tables. |
| Tested | `PARTIAL` | `data/src/tenant-rls-integration.test.ts` has targeted two-tenant cases but may skip without a test DB; workspace proof was only an in-memory simulation. |
| Integrated | `PARTIAL` | API/IDP use database clients, but the exact runtime role and deployed RLS state are unverified. |
| Deployed | `NOT VERIFIED` | No database environment may be mutated or inspected by this work. |
| Released | `NOT APPLICABLE` | No release requested. |

## Design and proof boundary

The workspace isolation command is an orchestration entrypoint, not a simulation. It delegates to the data-owned verifier, which derives the required tenant table set from current schema sources and queries `pg_class`, `pg_policies`, `information_schema` and `pg_roles`. No `DATABASE_APP_URL`, missing verifier, unexpected verifier termination, privileged verifier connection, missing `unerp_api` role, `BYPASSRLS`, absent policy, absent FORCE RLS or zero context must fail the command.

This change does not claim that structural RLS evidence proves all application authorization paths. It removes a false proof so missing production-shaped evidence blocks the continuation gate rather than passing.

> **This is not done.** The complete FND-P0-004 exit requires real application-role positive, tenant-A/tenant-B/no-context tests for every tenant-owned persistence path and reviewed provider/tenant boundary evidence.
