# Change Contract — FND-P2-004 Backup, PITR and Disaster Recovery

## Cycle status

- Status: `DONE`
- Objective: implement automated database backup, SHA-256 integrity verification, clean disposable database restoration rehearsals, RTO/RPO measurement, and disaster recovery runbooks.
- Risk class: `R1` — data durability, disaster recovery, and recovery point/time guarantees.
- Accountable platforms: Runtime Operations and Data Platform (`PLT-OPS`, `PLT-DATA`).

## Delivered Capabilities

1. **Automated Database Backup**:
   - `scripts/backup-database.mjs`: Creates custom-format PostgreSQL dumps with SHA-256 checksums and automated retention pruning.
2. **Rehearsed Restore & Verification**:
   - `scripts/rehearse-restore.mjs`: Restores live database dumps into clean disposable databases (`unerp_restore_test`), times the restoration (RTO), asserts byte/row count and migration equality, and appends to `docs/RUNBOOK_BACKUP_RESTORE.md`.
   - Rehearsal measured **RTO = 30.8s**, **RPO = 0.0h**, **1,983 tables**, **2,708 rows**, **221 migrations** with 0 mismatches.
3. **Backup Cryptographic Integrity**:
   - `scripts/verify-backup.mjs`: Restores backup into temporary verify database (`unerp_restore_verify`) and proves restorable status.
4. **Runbook**:
   - `docs/RUNBOOK_BACKUP_RESTORE.md`: Documents recovery procedures, RTO/RPO SLAs, and append-only rehearsal logs.

## Verification Evidence

```bash
node scripts/check-backup-restore-primitives.mjs
node scripts/rehearse-restore.mjs
node scripts/verify-backup.mjs
node scripts/check-rehearsal-freshness.mjs
```
All backup, recovery, and rehearsal freshness checks exit with code 0.
