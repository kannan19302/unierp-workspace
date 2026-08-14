#!/usr/bin/env node
/**
 * scripts/check-contract-documentation-generation.mjs
 *
 * Phase P12-073: Contract documentation generation.
 *
 * Exit criterion:
 *   "API reference generated from contracts for every consuming audience.
 *    Documentation regenerates from contracts; drift fails CI"
 *
 * This tool & CI gate:
 *   1. Asserts automated contract documentation generation for all consuming audiences.
 *   2. Validates that docs/programme/PUBLIC-API-CONTRACTS.md is in sync with contracts source.
 *   3. Enforces that any undocumented or drifting contract export fails CI mechanically.
 *
 * Usage:
 *   node scripts/check-contract-documentation-generation.mjs --verify
 */

import { generateContractsDocumentation } from "./generate-contracts-docs.mjs";
import { readFileSync, existsSync } from "node:fs";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const WORKSPACE_DIR = resolve(__dirname, "..");
const DOC_OUTPUT_PATH = resolve(WORKSPACE_DIR, "docs/programme/PUBLIC-API-CONTRACTS.md");

export function verifyContractDocumentation() {
  if (!existsSync(DOC_OUTPUT_PATH)) {
    return { valid: false, reason: "Documentation file missing at docs/programme/PUBLIC-API-CONTRACTS.md" };
  }

  const generatedContent = generateContractsDocumentation();
  const existingContent = readFileSync(DOC_OUTPUT_PATH, "utf8");

  if (existingContent !== generatedContent) {
    return {
      valid: false,
      reason: "Documentation drift detected! docs/programme/PUBLIC-API-CONTRACTS.md is out of sync with contracts source.",
    };
  }

  return { valid: true };
}

if (process.argv.includes("--verify") || process.argv.length <= 2) {
  try {
    const res = verifyContractDocumentation();
    if (!res.valid) {
      console.error(`\n❌ Contract documentation generation gate failed: ${res.reason}`);
      process.exit(1);
    }

    console.log(`\n✓ Contract documentation generation gate passed: Zero-drift API reference verified from contracts.`);
    process.exit(0);
  } catch (err) {
    console.error(`\n❌ Error during contract documentation generation verification:`, err);
    process.exit(1);
  }
}
