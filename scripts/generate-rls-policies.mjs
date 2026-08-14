#!/usr/bin/env node
/**
 * scripts/generate-rls-policies.mjs
 *
 * P12-028: RLS policy generation and divergence detection.
 *
 * Exit criterion:
 *   "Policies generated from the model rather than hand-written per table.
 *    A hand-written policy diverging from its model is detected. Generation is idempotent."
 *
 * Capabilities:
 *   1. Derives all expected tenant models and table names from Prisma schemas.
 *   2. Generates standard PostgreSQL Row Level Security (RLS) SQL policies:
 *        ALTER TABLE "<table_name>" ENABLE ROW LEVEL SECURITY;
 *        ALTER TABLE "<table_name>" FORCE ROW LEVEL SECURITY;
 *        CREATE POLICY "tenant_isolation_<table_name>" ON "<table_name>"
 *          FOR ALL
 *          USING ("<tenant_col>" = current_tenant_id())
 *          WITH CHECK ("<tenant_col>" = current_tenant_id());
 *   3. Emits generated SQL migration artifact to docs/programme/P12-028-RLS-POLICIES.sql.
 *   4. Asserts generation idempotency and detects any policy diverging from model schema definition.
 *
 * Usage:
 *   node scripts/generate-rls-policies.mjs --generate
 *   node scripts/generate-rls-policies.mjs --verify
 */

import { readFileSync, writeFileSync, existsSync, readdirSync } from "node:fs";
import { resolve, dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const WORKSPACE_DIR = resolve(__dirname, "..");
const PARENT_DIR = resolve(WORKSPACE_DIR, "..");
const DATA_REPO = resolve(PARENT_DIR, "unierp-data");
const SCHEMA_DIR = join(DATA_REPO, "prisma/schema");
const IDP_SCHEMA = join(DATA_REPO, "prisma/idp-schema.prisma");
const SQL_OUT = resolve(WORKSPACE_DIR, "docs/programme/P12-028-RLS-POLICIES.sql");

function toSnake(s) {
  return s
    .replace(/([A-Z]+)([A-Z][a-z])/g, "$1_$2")
    .replace(/([a-z\d])([A-Z])/g, "$1_$2")
    .toLowerCase();
}

export function deriveTenantPolicies() {
  const policies = [];
  const files = readdirSync(SCHEMA_DIR)
    .filter((f) => f.endsWith(".prisma"))
    .map((f) => join(SCHEMA_DIR, f));

  if (existsSync(IDP_SCHEMA)) files.push(IDP_SCHEMA);

  for (const file of files) {
    const lines = readFileSync(file, "utf8").split("\n");
    let model = null;
    let tenantField = null;
    let tableName = null;

    for (const raw of lines) {
      const line = raw.trim();
      if (!line || line.startsWith("//")) continue;
      const m = line.match(/^model\s+(\w+)\s*\{/);
      if (m) {
        model = m[1];
        tenantField = null;
        tableName = null;
        continue;
      }
      if (line === "}") {
        if (model && tenantField) {
          const table = tableName ?? toSnake(model);
          policies.push({
            model,
            table,
            column: tenantField.column,
            sql: [
              `-- RLS Policy for ${model} (${table})`,
              `ALTER TABLE "${table}" ENABLE ROW LEVEL SECURITY;`,
              `ALTER TABLE "${table}" FORCE ROW LEVEL SECURITY;`,
              `DROP POLICY IF EXISTS "tenant_isolation_${table}" ON "${table}";`,
              `CREATE POLICY "tenant_isolation_${table}" ON "${table}"`,
              `  FOR ALL`,
              `  USING ("${tenantField.column}" = current_tenant_id())`,
              `  WITH CHECK ("${tenantField.column}" = current_tenant_id());`,
              ``,
            ].join("\n"),
          });
        }
        model = null;
        continue;
      }
      if (!model) continue;

      const tMatch = line.match(/^(tenant_?id|tenantId)\s+String/i);
      if (tMatch) {
        const colMatch = line.match(/@map\("([^"]+)"\)/);
        tenantField = { name: tMatch[1], column: colMatch ? colMatch[1] : tMatch[1] };
      }
      const mapMatch = line.match(/@@map\("([^"]+)"\)/);
      if (mapMatch) tableName = mapMatch[1];
    }
  }

  // Sort deterministically by table name
  policies.sort((a, b) => a.table.localeCompare(b.table));
  return policies;
}

export function generateSql(policies) {
  const header = [
    `-- P12-028: Mechanically Generated Row Level Security (RLS) Policies`,
    `-- Generated from unierp-data Prisma schema definitions`,
    `-- Total Tenant Tables: ${policies.length}`,
    `-- IDEMPOTENT EXECUTION`,
    ``,
    `CREATE OR REPLACE FUNCTION current_tenant_id() RETURNS text AS $$`,
    `  SELECT NULLIF(current_setting('app.current_tenant_id', true), '');`,
    `$$ LANGUAGE sql STABLE;`,
    ``,
  ].join("\n");

  return header + policies.map((p) => p.sql).join("\n");
}

const isGenerate = process.argv.includes("--generate");
const isVerify = process.argv.includes("--verify") || (!isGenerate && Boolean(process.argv[1]));

const policies = deriveTenantPolicies();
const generatedSql = generateSql(policies);

if (isGenerate) {
  writeFileSync(SQL_OUT, generatedSql, "utf8");
  console.log(`OK    Generated ${policies.length} RLS policies at docs/programme/P12-028-RLS-POLICIES.sql`);
  process.exit(0);
}

if (isVerify) {
  if (!existsSync(SQL_OUT)) {
    console.error(`FAIL  generate-rls-policies: Artifact missing at ${SQL_OUT}. Run --generate.`);
    process.exit(1);
  }

  const existingSql = readFileSync(SQL_OUT, "utf8");
  if (existingSql !== generatedSql) {
    console.error(`FAIL  generate-rls-policies: RLS policy drift or divergence detected! Run \`node scripts/generate-rls-policies.mjs --generate\`.`);
    process.exit(1);
  }

  // Verify idempotency
  const secondPass = generateSql(deriveTenantPolicies());
  if (secondPass !== generatedSql) {
    console.error(`FAIL  generate-rls-policies: Policy generation is not idempotent.`);
    process.exit(1);
  }

  console.log(`OK    RLS policy generation verified: ${policies.length} policies derived, zero drift, 100% idempotent.`);
  process.exit(0);
}
