#!/usr/bin/env node
/**
 * The local gate — docs/ai/TRD.md § 8, Layer 2.
 *
 * Runs the SAME gate set as CI, so a green local run means a green pipeline. This is the
 * mechanism behind the deployment contract: "no code with a failing check reaches the remote
 * repository."
 *
 *   pnpm verify            # everything (what pre-push runs)
 *   pnpm verify --fast     # skip tests and builds — for a quick mid-work sanity check
 *   pnpm verify --fix      # auto-fix what is auto-fixable, then verify
 *
 * Gates run cheapest-first so you learn about a failure in seconds, not minutes.
 * A failure stops the run — fix it and re-run rather than wading through cascading noise.
 */
import { spawnSync } from "node:child_process";
import { join } from "node:path";
import { existsSync } from "node:fs";
import { fileURLToPath } from "node:url";

const ROOT = join(fileURLToPath(new URL(".", import.meta.url)), "..", "..");

/**
 * Does this repository actually contain application source and a package.json?
 *
 * Phase A30 / defect D025. This file is the monorepo's local gate, inherited whole. Nine of
 * its gates need `pnpm`, a Prisma schema, or a built `dist/` — and `unierp-workspace` has no
 * package.json and no application source, so they could never pass here. Running them anyway
 * meant `verify.mjs` was permanently red in this repo, which pushed every agent towards
 * `--despite-red-gate` on `scripts/start.mjs --finish`. A gate everyone routinely overrides
 * has stopped being a gate.
 *
 * They are not skipped silently. Each is named as delegated, with the phase that gives it a
 * home (A31), for the same reason check-policy.mjs names its delegations: a control that
 * quietly covers less than it claims is worse than no control.
 */
const HAS_APP_SOURCE =
  existsSync(join(ROOT, "package.json")) &&
  (existsSync(join(ROOT, "src")) ||
    existsSync(join(ROOT, "app")) ||
    existsSync(join(ROOT, "apps")) ||
    existsSync(join(ROOT, "prisma")));
const args = process.argv.slice(2);
const FAST = args.includes("--fast");
const FIX = args.includes("--fix");

const GATES = [
  {
    name: "Branch policy",
    why: "Work lands on main through the pipeline, never by a direct push.",
    run: () => {
      const branch = spawnSync("git", ["rev-parse", "--abbrev-ref", "HEAD"], {
        cwd: ROOT,
        encoding: "utf8",
      }).stdout?.trim();
      if (branch === "main" && process.env.ALLOW_MAIN_PUSH !== "1") {
        return {
          ok: false,
          out: `On branch "main". Work on a branch and open a PR.`,
        };
      }
      return { ok: true };
    },
  },
  {
    name: "Secret scan",
    why: "A credential in git must be rotated. Prevention is the only cure.",
    cmd: ["node", ["scripts/ci/check-secrets.mjs"]],
  },
  {
    name: "Suppression ratchet",
    why: "No new @ts-nocheck / @ts-ignore / eslint-disable / any. ARCHITECTURE_REVIEW § R1.",
    cmd: ["node", ["scripts/ci/check-suppressions.mjs"]],
  },
  {
    name: "Policy gate",
    why: "Raw SQL, Float money, gate bypasses, docs/ai file count, tokens, route guards.",
    cmd: ["node", ["scripts/ci/check-policy.mjs"]],
  },
  {
    name: "Workflow files",
    why: "A workflow with `true:` instead of `on:` never runs; a step behind `if: hashFiles(...)` passes by being absent.",
    cmd: ["node", ["scripts/ci/check-workflows.mjs"]],
  },
  {
    name: "Policy-gate coverage",
    why: "A delegated policy rule must actually run in the repo that owns its files. A30 / D024.",
    cmd: ["node", ["scripts/ci/check-policy-coverage.mjs"]],
  },
  {
    name: "Repo hygiene",
    why: "No scratch files or self-nested config at a repository root. R5 / phase A14.",
    cmd: ["node", ["scripts/ci/check-repo-hygiene.mjs"]],
  },
  {
    name: "Test taxonomy",
    why: "J01 — every spec file is classified; an unclassifiable test is reclassified or deleted with a reason.",
    cmd: ["node", ["scripts/ci/check-test-taxonomy.mjs"]],
  },
  {
    name: "Coverage ratchet",
    why: "J02 — deleting any test file fails CI in every repo; coverage floor recorded per repo and never lowered without a logged amendment (D002).",
    cmd: ["node", ["scripts/ci/check-coverage-ratchet.mjs"]],
  },
  {
    name: "Programme integrity",
    why: "Phase IDs are permanent; plan documents are amended, never regenerated. docs/programme/README.md § 0.",
    // Listed here as well as in ci.yml deliberately. ROADMAP.md's "close the
    // verify / CI divergence" item exists because CI runs gates verify does not,
    // so a contributor runs the documented pre-push command, is told the change
    // is clean, and fails CI on something they had no local way to check. A gate
    // added to only one of the two reproduces exactly that.
    cmd: ["node", ["scripts/check-plan-integrity.mjs"]],
  },
  {
    name: "Exit criteria can fail",
    why:
      "check-plan-integrity refuses an EMPTY exit criterion; that is not the same as one that " +
      "can fail. AGENTS.md § 1 is the rule — no claim without a mechanism that can fail — and a " +
      "criterion reading 'the module works well' satisfies the emptiness check while proving " +
      "nothing. This is a ratchet against a recorded baseline, so it fails on a NEW vacuous " +
      "criterion rather than on the 350 pre-existing ones, which would only train everyone to " +
      "ignore it.",
    cmd: ["node", ["scripts/check-exit-criteria.mjs"]],
  },
  {
    name: "Every repository has an owning programme",
    why:
      "21 of 29 repositories were claimed by no programme — including the identity provider " +
      "and the contracts every client is generated from. D001, D008 and D148 were filed " +
      "against code with no owner to fix them, which is why they sat. An unowned repository " +
      "accumulates defects nobody picks up.",
    cmd: ["node", ["scripts/check-programme-claim.mjs"]],
  },
  {
    name: "Unowned-code census",
    why: "P12-002: Every claimed repository measured: what it does, what is reachable, what is tested, what is dead, what other repositories import from it.",
    cmd: ["node", ["scripts/check-unowned-code-census.mjs", "--verify"]],
  },
  {
    name: "Breaking-change rule",
    why: "P12-003: Contract, type, event and auth changes classified, versioned, and consumer-checked before landing.",
    cmd: ["node", ["scripts/check-breaking-changes.mjs"]],
  },
  {
    name: "Orphaned-defect sweep",
    why: "P12-004: Every defect finding in a claimed repository routed to an owning phase with no orphans.",
    cmd: ["node", ["scripts/check-orphaned-defects.mjs"]],
  },
  {
    name: "Runtime precondition gate",
    why: "P12-005: Platform core toolchain, environment, and external capability preconditions verified with isolated graceful degradation.",
    cmd: ["node", ["scripts/check-runtime-preconditions.mjs"]],
  },
  {
    name: "Repository dependency graph",
    why: "P12-006: Repository dependency graph generated from source and verified strictly acyclic.",
    cmd: ["node", ["scripts/generate-dependency-graph.mjs", "--verify"]],
  },
  {
    name: "Consumer registry (EP-3)",
    why: "P12-007: Mechanical consumer index answering 'Who uses this?' for every symbol, contract, and event across 12 programmes.",
    cmd: ["node", ["scripts/check-consumer-registry.mjs", "--verify"]],
  },
  {
    name: "Standalone builds & workspace protocol gate",
    why: "P12-008 / D008: Every claimed repository verified for standalone build capability and zero workspace:* protocol leaks.",
    cmd: ["node", ["scripts/check-standalone-builds.mjs"]],
  },
  {
    name: "Cross-repository CI gate",
    why: "P12-009: Verified downstream dependent matrix and cross-repo compatibility checking across all published providers.",
    cmd: ["node", ["scripts/check-cross-repo-ci.mjs", "--verify"]],
  },
  {
    name: "Versioning policy gate",
    why: "P12-010: Semantic versioning policy across all published packages; breaking change published as minor refused with breaking symbol named.",
    cmd: ["node", ["scripts/check-versioning-policy.mjs", "--verify"]],
  },
  {
    name: "Release and changelog automation gate",
    why: "P12-011: Mechanical version bumps and changelogs derived from the change set across all published packages.",
    cmd: ["node", ["scripts/generate-release-changelog.mjs", "--verify"]],
  },
  {
    name: "Dependency governance gate",
    why: "P12-012: Allowlisted dependencies, licence checks, and banned vulnerable packages with advisories named across all repositories.",
    cmd: ["node", ["scripts/check-dependency-governance.mjs"]],
  },
  {
    name: "Supply-chain integrity gate",
    why: "P12-013: CycloneDX SBOM generation and OIDC provenance attestation enforced across all published libraries.",
    cmd: ["node", ["scripts/check-supply-chain.mjs", "--verify"]],
  },
  {
    name: "Structured logging standard gate",
    why: "P12-014: Structured logging standard and correlation propagation active across all service layers.",
    cmd: ["node", ["scripts/check-logging-standard.mjs", "--verify"]],
  },
  {
    name: "Configuration standard gate",
    why: "P12-016: Validated configuration schema with missing variables failing by name and 0 committed secrets across 21+ repos.",
    cmd: ["node", ["scripts/check-config-standard.mjs", "--verify"]],
  },
  {
    name: "Observability standard gate",
    why: "P12-017: Metric, trace and log conventions implemented identically across all service layers.",
    cmd: ["node", ["scripts/check-observability-standard.mjs", "--verify"]],
  },
  {
    name: "Health and readiness contract gate",
    why: "P12-018: Uniform health and readiness probes contract enforced across all backend services.",
    cmd: ["node", ["scripts/check-health-contract.mjs", "--verify"]],
  },
  {
    name: "Shipped library quality gate",
    why: "P12-020: Stricter quality gates, licensing and types declarations for published libraries (EP-7).",
    cmd: ["node", ["scripts/check-library-quality-gates.mjs", "--verify"]],
  },
  {
    name: "Generated public API documentation gate",
    why: "P12-023: Public API contracts documentation generated from source with zero drift.",
    cmd: ["node", ["scripts/generate-contracts-docs.mjs", "--verify"]],
  },
  {
    name: "Remediation backlog gate",
    why: "P12-024: Prioritised and tracked remediation backlog routing all measured defect classes.",
    cmd: ["node", ["scripts/check-remediation-backlog.mjs", "--verify"]],
  },
  {
    name: "Schema ownership gate",
    why: "P12-025: unierp-data as single source of truth for persistent schemas across estate.",
    cmd: ["node", ["scripts/ci/check-schema-ownership.mjs", "--verify"]],
  },
  {
    name: "Schema measurement gate",
    why: "P12-026: Whole-estate schema measurement reproducibility and drift verification.",
    cmd: ["node", ["scripts/measure-schema.mjs", "--verify"]],
  },
  {
    name: "Static tenant column and RLS universality gate",
    why: "P12-027: Tenant column and RLS policy universality across all data models.",
    cmd: ["node", ["scripts/check-rls-static-universality.mjs", "--verify"]],
  },
  {
    name: "RLS policy generation and divergence gate",
    why: "P12-028: Idempotent RLS policy generation and schema divergence verification.",
    cmd: ["node", ["scripts/generate-rls-policies.mjs", "--verify"]],
  },
  {
    name: "Runtime DDL RLS verification gate (D143)",
    why: "P12-029: RLS verification and tenant isolation for runtime DDL tables (co_* and ext_*).",
    cmd: ["node", ["scripts/check-runtime-ddl-rls.mjs", "--verify"]],
  },
  {
    name: "Money type discipline gate",
    why: "P12-030: Decimal(19,4) precision, exact string money values, and ISO 4217 currency pairing.",
    cmd: ["node", ["scripts/check-money-discipline.mjs", "--verify"]],
  },
  {
    name: "Schema naming and modelling conventions gate",
    why: "P12-031: Enforced PascalCase, camelCase, snake_case conventions across models, fields, enums, and mappings.",
    cmd: ["node", ["scripts/check-schema-naming-conventions.mjs", "--verify"]],
  },
  {
    name: "Foreign key index policy and coverage gate",
    why: "P12-032: Enforced indexing on foreign keys and compound query shapes with advisor proposals.",
    cmd: ["node", ["scripts/check-schema-indexes.mjs", "--verify"]],
  },
  {
    name: "Migration discipline and immutability gate",
    why: "P12-033: Forward-only migrations, immutable checksums, and strict production deployment discipline.",
    cmd: ["node", ["scripts/check-migration-discipline.mjs", "--verify"]],
  },
  {
    name: "Migration safety analysis gate",
    why: "P12-034: Lock risk classification, destructive operation detection, and online strategy enforcement.",
    cmd: ["node", ["scripts/check-migration-safety.mjs", "--verify"]],
  },
  {
    name: "Online schema change verification gate",
    why: "P12-035: Non-blocking schema alteration strategies and write SLA verification on large tables.",
    cmd: ["node", ["scripts/check-online-schema-change.mjs", "--verify"]],
  },
  {
    name: "Seed determinism and shared fixtures gate",
    why: "P12-036: Deterministic seed scripts, immutable test fixtures, and static snapshot reproducibility across estate.",
    cmd: ["node", ["scripts/check-seed-determinism.mjs", "--verify"]],
  },
  {
    name: "Prisma client generation and distribution gate",
    why: "P12-037: Identical packaging, distribution, and consumption of @kannan19302/database across backend services.",
    cmd: ["node", ["scripts/check-prisma-distribution.mjs", "--verify"]],
  },
  {
    name: "SQL query parameterization and injection safety gate",
    why: "P12-038: Enforced parameterization and forbidden string concatenation in raw database queries.",
    cmd: ["node", ["scripts/check-sql-injection-safety.mjs", "--verify"]],
  },
  {
    name: "Connection pool fairness and multi-tenant isolation gate",
    why: "P12-039: Per-tenant connection limits, timeouts, and adversarial load exhaustion prevention.",
    cmd: ["node", ["scripts/check-connection-fairness.mjs", "--verify"]],
  },
  {
    name: "Transaction and isolation standard gate",
    why: "P12-040: Transaction boundaries, isolation levels, and OCC conflict retry preventing lost updates.",
    cmd: ["node", ["scripts/check-transaction-isolation.mjs", "--verify"]],
  },
  {
    name: "Soft delete and archival primitives gate",
    why: "P12-041: Canonical soft-delete, archive, and restoration primitives across all platform data models.",
    cmd: ["node", ["scripts/check-soft-delete-primitives.mjs", "--verify"]],
  },
  {
    name: "Schema decomposition and 3000-line ceiling gate",
    why: "P12-042: Closing D001 — no .prisma schema file exceeds 3,000 lines.",
    cmd: ["node", ["scripts/check-schema-size.mjs"]],
  },
  {
    name: "Schema lint rules gate",
    why: "P12-043: Missing FK indexes, nullable foreign keys, unbounded strings, missing cascade-delete — each rule fires on a seeded violation and is silent on a clean schema.",
    cmd: ["node", ["scripts/check-schema-lints-p043.mjs"]],
  },
  {
    name: "Decimal arithmetic",
    why: "Money is Decimal(19,4) so it does not drift — summing it via Number() puts it back into float.",
    // The schema lint already forbids Float money columns, but exact storage is
    // worthless if the arithmetic is not: a Decimal read through Number(),
    // summed, and written back to a Decimal column is wrong on every
    // recalculation. This counts those sites against a baseline that may only
    // fall. Found 706 the first time it ran, including a GL journal balance
    // check whose 0.01 tolerance existed only to absorb its own float error.
    cmd: ["node", ["scripts/ci/check-decimal-arithmetic.mjs"]],
    needsAppSource: true,
  },
  {
    name: "PII registry",
    why: "P12-044 / Track H.1: Every model carrying personal data must declare an erasure treatment (check-pii-registry.mjs).",
    cmd: ["node", ["scripts/check-pii-registry.mjs"]],
  },
  {
    name: "Field-level encryption primitives gate",
    why: "P12-045: AES-256-GCM field-level encryption, key rotation, and DB dump confidentiality verification.",
    cmd: ["node", ["scripts/check-field-encryption.mjs", "--verify"]],
  },
  {
    name: "Retention architecture gate",
    why: "P12-046: Shared retention execution, legal hold verification and rogue module purge prevention.",
    cmd: ["node", ["scripts/check-retention-architecture.mjs", "--verify"]],
  },
  {
    name: "Architecture boundaries",
    why: "No cross-module imports, no dependency cycles.",
    cmd: ["pnpm", ["architecture:check"]],
    needsAppSource: true,
  },
  {
    name: "Consumer contracts (M2)",
    why: "A consumer must not expect a symbol its provider no longer exports. PLATFORM_ARCHITECTURE § 4.5.",
    // The compiler currently sees across every package boundary here, so this
    // gate looks redundant — and stops being redundant the moment Phase 3
    // extracts the first repository, because `unierp-web` will then compile
    // against a published `@kannan19302/ui` and a deleted export becomes a staging
    // runtime error instead of a build failure. § 14 forbids extracting
    // anything until this has caught a deliberately injected break; it has
    // caught three (a removed `@kannan19302/ui` export, a removed `@kannan19302/shared`
    // export reached through the .js re-export chain, and a stale published
    // expectation).
    cmd: ["node", ["scripts/ci/cdc-harness.mjs"]],
    needsAppSource: true,
  },
  {
    name: "Migration discipline",
    why: "No hand-edited migrations, no db:push, no schema drift.",
    cmd: ["pnpm", ["migration:discipline"]],
    needsAppSource: true,
  },
  {
    name: "RLS verification",
    why: "Every tenant table must carry a policy. BACKEND_SCHEMA § 4.4. A05 — the authoritative check lives in unierp-data (schema-derived, per-table, zero exemptions); this file's copy delegates to it rather than duplicating the logic (D019).",
    cmd: ["node", ["scripts/check-rls-verify.mjs"]],
    optional: true, // needs a live database; CI runs it as a hard gate
  },
  {
    name: "Lint",
    why: "Style and correctness rules.",
    cmd: FIX ? ["pnpm", ["lint", "--fix"]] : ["pnpm", ["lint"]],
    needsAppSource: true,
  },
  {
    name: "Typecheck",
    why: "The compiler is the cheapest test you will ever run.",
    cmd: ["pnpm", ["typecheck"]],
    needsAppSource: true,
  },
  {
    name: "Unit tests",
    why: "Business logic must be proven, not assumed.",
    cmd: ["pnpm", ["test"]],
    skipInFast: true,
    needsAppSource: true,
  },
  {
    name: "Build",
    why: "A change that does not build cannot deploy.",
    cmd: ["pnpm", ["build"]],
    skipInFast: true,
    needsAppSource: true,
  },
  {
    name: "Node resolution",
    why: "Every gate above resolves modules through a bundler. The runtime does not. § 14.1.",
    // Runs after Build because it reads the emitted dist/, which is the artifact
    // that actually loads. On 2026-08-06 the API exited during module load on an
    // extensionless re-export while all fourteen gates above were green — the
    // root tsconfig sets moduleResolution "bundler", so the compiler was told to
    // assume it resolved, and vitest resolves through Vite. Nothing in the
    // pipeline modelled Node's resolver until this. Proven able to fail.
    cmd: ["node", ["scripts/ci/check-node-resolution.mjs"]],
    skipInFast: true,
    needsAppSource: true,
  },
];

const C = {
  reset: "\x1b[0m",
  dim: "\x1b[2m",
  red: "\x1b[31m",
  green: "\x1b[32m",
  yellow: "\x1b[33m",
  bold: "\x1b[1m",
};

console.log(
  `\n${C.bold}UniERP verify${C.reset} ${C.dim}— the same gates CI runs${C.reset}`,
);
if (FAST)
  console.log(`${C.yellow}  --fast: skipping tests and builds${C.reset}`);
console.log("");

const started = Date.now();
const results = [];

const delegatedGates = [];

for (const gate of GATES) {
  if (gate.needsAppSource && !HAS_APP_SOURCE) {
    delegatedGates.push(gate.name);
    results.push({ name: gate.name, status: "delegated" });
    console.log(
      `${C.dim}  → ${gate.name} — delegated; this repo has no application source${C.reset}`,
    );
    continue;
  }
  if (FAST && gate.skipInFast) {
    results.push({ name: gate.name, status: "skipped" });
    console.log(`${C.dim}  ○ ${gate.name} (skipped)${C.reset}`);
    continue;
  }

  process.stdout.write(`  ⋯ ${gate.name}…`);
  const t0 = Date.now();

  let ok, out;
  if (gate.run) {
    const r = gate.run();
    ok = r.ok;
    out = r.out ?? "";
  } else {
    const [bin, cmdArgs] = gate.cmd;
    const r = spawnSync(bin, cmdArgs, {
      cwd: ROOT,
      encoding: "utf8",
      shell: process.platform === "win32",
    });
    ok = r.status === 0;
    out = `${r.stdout ?? ""}${r.stderr ?? ""}`;
  }

  const secs = ((Date.now() - t0) / 1000).toFixed(1);
  process.stdout.write("\r\x1b[K");

  if (ok) {
    console.log(
      `${C.green}  ✓${C.reset} ${gate.name} ${C.dim}(${secs}s)${C.reset}`,
    );
    results.push({ name: gate.name, status: "pass" });
  } else if (gate.optional) {
    console.log(
      `${C.yellow}  ⚠${C.reset} ${gate.name} ${C.dim}(skipped — ${secs}s)${C.reset}`,
    );
    console.log(
      `${C.dim}      not runnable locally; CI enforces this as a hard gate${C.reset}`,
    );
    results.push({ name: gate.name, status: "skipped" });
  } else {
    console.log(
      `${C.red}  ✗ ${gate.name}${C.reset} ${C.dim}(${secs}s)${C.reset}`,
    );
    console.log(`${C.dim}      ${gate.why}${C.reset}\n`);
    console.log(out.split("\n").slice(-60).join("\n"));
    console.log(`
${C.red}────────────────────────────────────────────────────────────────────${C.reset}
  ${C.bold}BLOCKED at: ${gate.name}${C.reset}

  Fix the cause. Do NOT:
    · add @ts-nocheck / @ts-ignore / eslint-disable
    · add continue-on-error or || true
    · push with --no-verify

  A failing check means the code is wrong, not the check.
  ${C.dim}docs/ai/IMPLEMENTATION_PLAN.md § 11${C.reset}
${C.red}────────────────────────────────────────────────────────────────────${C.reset}
`);
    process.exit(1);
  }
}

const total = ((Date.now() - started) / 1000).toFixed(1);
const passed = results.filter((r) => r.status === "pass").length;
const skipped = results.filter((r) => r.status === "skipped").length;
const delegatedCount = results.filter((r) => r.status === "delegated").length;

// The count of DELEGATED gates is stated in the summary, not just per-line. "All gates
// green — 9 passed" over nine gates that never ran is the same false reading the policy
// gate produced for months (D024): technically true, and read as "everything was checked".
console.log(`
${C.green}${C.bold}  ✓ All gates green${C.reset} ${C.dim}— ${passed} passed, ${skipped} skipped${
  delegatedCount
    ? `, ${C.reset}${C.yellow}${delegatedCount} DELEGATED${C.reset}${C.dim} (not run here)`
    : ""
}, ${total}s${C.reset}`);
if (delegatedCount) {
  console.log(
    `${C.yellow}  ${delegatedCount} gate(s) were NOT run: this repository has no application ` +
      `source.${C.reset}\n` +
      `${C.dim}  They must run in the repositories that do — phase A31, defect D025. Do not ` +
      `read${C.reset}\n${C.dim}  "all gates green" as "everything was checked".${C.reset}`,
  );
}
console.log(
  `${C.dim}  Remember: one line in docs/ai/CHANGELOG.md before you commit.${C.reset}\n`,
);
process.exit(0);
