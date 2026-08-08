#!/usr/bin/env node
/**
 * Documentation Truth Gate — Phase A12 / D013 prevention.
 *
 * Verifies that script paths and gates cited in governance documentation
 * (docs/PLATFORM_ARCHITECTURE.md, docs/ai/*.md, README.md) exist on disk.
 *
 * Prevents claims from outliving their mechanisms.
 */
import { readFileSync, existsSync, readdirSync } from "node:fs";
import { join, relative } from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = join(fileURLToPath(new URL(".", import.meta.url)), "..", "..");
const WORKSPACE = join(ROOT, "unierp-workspace");

const GOV_DOCS = [
  join(WORKSPACE, "docs/PLATFORM_ARCHITECTURE.md"),
  join(WORKSPACE, "README.md"),
  join(WORKSPACE, "AGENTS.md"),
  ...readdirSync(join(WORKSPACE, "docs/ai")).map((f) => join(WORKSPACE, "docs/ai", f)),
];

const scriptRefRegex = /`?(scripts\/[a-zA-Z0-9_\-\.\/]+\.mjs)`?/g;

const findings = [];
let totalRefs = 0;

for (const docFile of GOV_DOCS) {
  if (!existsSync(docFile)) continue;
  const content = readFileSync(docFile, "utf8");
  const relDoc = relative(WORKSPACE, docFile).replace(/\\/g, "/");

  let match;
  while ((match = scriptRefRegex.exec(content)) !== null) {
    totalRefs++;
    const scriptPath = match[1];

    if (relDoc.includes("CHANGELOG.md") || relDoc.includes("DEFECT-LOG")) continue;

    const fullWorkspacePath = join(WORKSPACE, scriptPath);
    const fullRootPath = join(ROOT, scriptPath);

    if (!existsSync(fullWorkspacePath) && !existsSync(fullRootPath)) {
      findings.push({
        doc: relDoc,
        script: scriptPath,
      });
    }
  }
}

if (findings.length === 0) {
  console.log(`  ✅ Documentation truth verified (${totalRefs} script references checked across ${GOV_DOCS.length} governance docs).`);
  process.exit(0);
}

console.error(`
────────────────────────────────────────────────────────────────────────
  ❌ DOCUMENTATION TRUTH VIOLATION — ${findings.length} unresolvable claim(s)
────────────────────────────────────────────────────────────────────────`);
for (const f of findings) {
  console.error(`   - ${f.doc} references \`${f.script}\` which DOES NOT EXIST on disk.`);
}
console.error(`
  Governance documentation must not assert mechanisms that do not exist.
  Either implement the script or amend the governance claim.
────────────────────────────────────────────────────────────────────────
`);
process.exit(1);
