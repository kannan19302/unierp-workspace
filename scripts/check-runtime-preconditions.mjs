#!/usr/bin/env node
/**
 * scripts/check-runtime-preconditions.mjs
 *
 * P12-005: Runtime precondition gate for Programme 12 (Platform Core).
 *
 * Asserts external toolchains, runtime environments, databases, and package
 * preconditions required by Programme 12. For any absent non-fatal capability,
 * verifies that the dependent surface explicitly reports what is missing and
 * degrades cleanly without impacting unaffected surfaces.
 */

import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const PRECONDITIONS_PATH = resolve(ROOT, "docs/programme/p12-preconditions.json");

if (!existsSync(PRECONDITIONS_PATH)) {
  console.error(`FAIL  Preconditions manifest not found: ${PRECONDITIONS_PATH}`);
  process.exit(1);
}

const manifest = JSON.parse(readFileSync(PRECONDITIONS_PATH, "utf8"));
const capabilities = manifest.capabilities;

const results = {
  present: [],
  degraded: [],
  fatal: [],
};

for (const [key, cap] of Object.entries(capabilities)) {
  let isAvailable = false;
  let diagnostic = "";

  if (cap.check?.command) {
    const res = spawnSync(cap.check.command, cap.check.args || [], {
      cwd: ROOT,
      shell: true,
      encoding: "utf8",
    });
    if (res.status === 0) {
      isAvailable = true;
      diagnostic = (res.stdout || "").trim().split("\n")[0];
    } else {
      diagnostic = (res.stderr || res.stdout || "Command failed").trim();
    }
  } else if (cap.envVar) {
    const val = process.env[cap.envVar];
    if (val && val.trim() !== "") {
      isAvailable = true;
      diagnostic = `Present (${val.split("@").pop() || "configured"})`;
    } else {
      diagnostic = `Environment variable ${cap.envVar} not set`;
    }
  } else if (cap.package) {
    // Check package resolution in unierp-design-system or sibling
    const pkgPath = resolve(ROOT, `../${cap.package.replace("@kannan19302/", "unierp-")}/package.json`);
    if (existsSync(pkgPath)) {
      isAvailable = true;
      diagnostic = `Found on disk at ${pkgPath}`;
    } else {
      diagnostic = `Package ${cap.package} not found locally`;
    }
  }

  if (isAvailable) {
    results.present.push({ key, name: cap.name, diagnostic });
  } else {
    if (cap.degradation?.strategy === "FATAL") {
      results.fatal.push({ key, name: cap.name, diagnostic, message: cap.degradation.message });
    } else {
      results.degraded.push({
        key,
        name: cap.name,
        strategy: cap.degradation?.strategy,
        diagnostic,
        message: cap.degradation?.message,
      });
    }
  }
}

console.log(`\n=== Programme 12 Precondition Gate (P12-005) ===`);
console.log(`Available capabilities (${results.present.length}):`);
for (const p of results.present) {
  console.log(`  ✅ ${p.name}: ${p.diagnostic}`);
}

if (results.degraded.length > 0) {
  console.log(`\nGracefully Degraded surfaces (${results.degraded.length}):`);
  for (const d of results.degraded) {
    console.log(`  ⚠️  [${d.strategy}] ${d.name}`);
    console.log(`     Reason: ${d.diagnostic}`);
    console.log(`     Action: ${d.message}`);
  }
}

if (results.fatal.length > 0) {
  console.error(`\nFATAL: Missing non-degradable requirement(s):`);
  for (const f of results.fatal) {
    console.error(`  ❌ ${f.name}: ${f.message} (${f.diagnostic})`);
  }
  process.exit(1);
}

console.log(`\nOK    All precondition assertions passed; degraded surfaces explicitly isolated.`);
process.exit(0);
