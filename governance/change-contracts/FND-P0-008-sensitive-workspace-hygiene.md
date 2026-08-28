# Change Contract — FND-P0-008 Sensitive Workspace Hygiene

## Cycle status

- Status: `PARTIAL`
- Objective: prevent sensitive or ambiguous root/workspace artifacts from being silently treated as source, fixtures, evidence or deployable input.
- Inspected fact: the workspace root contains scratch artifacts with security-signaling names outside the active-estate catalog. Their contents were not read or exposed.
- Scope: non-mutating inventory/gate, documentation and safe handling policy.
- Out of scope: deleting, moving, opening, uploading, rotating or otherwise mutating any artifact; those actions require owner confirmation and an exact target.

The gate reports only a path and detection class, never matched content. It rejects real `.env`/key files in the active estate, high-confidence token/key signatures, and ungoverned root scratch artifacts with security-signaling names. Existing findings remain owner action items, not evidence that any particular content is a credential.

> **This is not done.** Owners must classify and safely remove/quarantine the existing findings, add pre-commit/CI secret scanning, rotate any confirmed exposure through approved processes, and retain dated evidence.
