# Journal — kannan19302@MSI/unierp-workspace

> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.
> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:
> `node scripts/start.mjs --who`

### A14 · FINISH · 2026-08-07T14:15:04Z · kannan19302@MSI/unierp-workspace

```
verify.mjs: not run to completion — Branch policy gate blocks on any branch check
in this environment and the DB-backed gates need Postgres. The phase's own exit
criterion was run directly and is recorded below, including its failure modes.

PHASE A14 — Repo hygiene sweep (closes R5, D006, D007)

--- 1. GAP PROVEN BEFORE ANY CHANGE ---
$ git -C unierp-mobile ls-files | grep -cE '^(fix_|auto_fix|revert_|specific_|restore|gen_batch|generate\.ps1|full_analyze|remaining_errors|missing_controllers)'
15
  (the plan said 14 — it undercounted, missing fix_pos_routes.py)

$ git -C unierp-storybook ls-files | grep '\.storybook/\.storybook'
.storybook/.storybook/main.ts
.storybook/.storybook/preview.ts

--- 2. VERIFIED SAFE TO DELETE (CODE_STANDARDS § 2.2) ---
Only .git/index references any of the 15 files; nothing in the codebase does.
fix_router_5.py hardcodes  ERPSys\apps\mobile\lib\app\router\app_router.dart
auto_fix_router.py hardcodes a Gemini IDE task log under .gemini/antigravity-ide/
ERPSys is retired and absent locally, so these scripts cannot execute.

Information preserved before deleting remaining_errors.txt (331 errors, 64 files):
  all 64 implicated files still exist
  spot-check of 4 "undefined" symbols: each now has 1 definition in lib/
  COULD NOT VERIFY FULLY — no Flutter toolchain here. Recorded for phase I02.

--- 3. EXIT CRITERION NOW PASSES ---
$ node scripts/ci/check-repo-hygiene.mjs
OK    30 repositories; no scratch files or self-nested config at any root.

--- 4. THE GATE IS PROVEN ABLE TO FAIL (two deliberate breaks) ---
$ echo "import os" > unierp-mobile/fix_router_6.py; git add -f; node scripts/ci/check-repo-hygiene.mjs
check-repo-hygiene: 1 violation(s)
FAIL  unierp-mobile/fix_router_6.py
        `.py` file at a repository root
  NOTE: fix_router_6.py is a name no denylist would have contained. The gate is an
  allowlist of shapes, which is why it caught it.

$ mkdir -p unierp-storybook/.storybook/.storybook; node scripts/ci/check-repo-hygiene.mjs
check-repo-hygiene: 1 violation(s)
FAIL  unierp-storybook/.storybook/.storybook/
        config directory nested inside itself

$ (both reverted) node scripts/ci/check-repo-hygiene.mjs
OK    30 repositories; no scratch files or self-nested config at any root.

--- 5. PROPAGATION AUDIT (the phase's third requirement) ---
Changelog-recorded fixes checked against the extracted repos:
  mobile fixers deleted in monorepo   REGRESSED through extraction -> re-fixed + gated
  @ts-nocheck 0                        holds (0 files)
  ESM .js specifiers in extension-api  holds (3 in index.ts)
  gitleaks in all repos                STILL ABSENT (0 configs, 0 in CI) -> A10, not a regression
  workflow_call reusable workflows      0 of 30 -> NEW DEFECT D019, new phase A29

--- 6. GATE WIRED BOTH SIDES ---
.github/workflows/ci.yml  guard job, step "Repository hygiene", no if: hashFiles guard
scripts/ci/verify.mjs      gate "Repo hygiene"
  Both, deliberately — ROADMAP's verify/CI divergence item exists because CI ran gates
  verify did not.

--- 7. OUT OF SCOPE, FILED NOT FIXED ---
unierp-storybook/.storybook/main.ts (the surviving outer config) globs
'../../ui-*/src/**/*.stories.*' and preview.ts imports '../../ui-tokens/src/index.css' —
monorepo paths that do not exist in the polyrepo, so Storybook cannot build. That is
phase B13's deliverable, not A14's. Filed rather than scope-crept.
```

### A01 · CLAIMED · 2026-08-07T14:41:03Z · kannan19302@MSI/unierp-workspace

```
wave      0
branch    feat/development-programme
selected  explicitly requested
Work has NOT started. This block exists so no other agent takes this phase.
```

### A01 · PROGRESS · 2026-08-07T14:42:52Z · kannan19302@MSI/unierp-workspace

```
BLOCKED ON A DECISION — the chosen registry cannot host this scope.

GitHub Packages requires the npm scope to equal the GitHub account or org that owns
the repository. Verified against GitHub's own docs:
  "the name of the personal account or organization account to which the package
   will be scoped"

Measured:
  packages are scoped        @unerp/*        (20 packages)
  repositories are owned by  kannan19302     (a User account, not an org)
  GitHub org "unerp"         404 — does not exist
  GitHub org "unierp"        EXISTS — but the scope is @unerp, no 'i', so it does
                             not match either
  npm scope @unerp           FREE (404 on registry.npmjs.org)

So `npm publish @unerp/kernel` to npm.pkg.github.com under kannan19302 cannot work.

ROADMAP.md's "GitHub Packages is the obvious candidate, since the OIDC-federated
publish tokens already exist there" is wrong for this reason, and A01's own
deliverable text repeats it. Both need amending whichever way this goes.

Three ways out, costed:
  A  create GitHub org "unerp", transfer all 30 repos    → scope matches natively,
     but 30 transfers, 30 remote URLs, and every published doc link breaks
  B  npmjs.com with scope @unerp                          → scope is free, free for
     public packages, installable with NO auth (best for the AGPL/open-source goal),
     zero transfers, zero renames. npm now supports OIDC trusted publishing from
     GitHub Actions, so the OIDC advantage is no longer exclusive to GH Packages
  C  rename the scope to @kannan19302/* or @unierp/*      → every package.json and
     every import across ~660k lines

Recommending B. Awaiting the decision before touching any .npmrc — a published
package name is permanent, so this is worth getting right rather than fast.

Nothing changed in the tree for A01 yet.
```

