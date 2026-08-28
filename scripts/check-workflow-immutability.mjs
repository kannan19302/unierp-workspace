#!/usr/bin/env node
import { existsSync, mkdtempSync, mkdirSync, readdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";
import { dirname, join, relative, resolve } from "node:path";
import { tmpdir } from "node:os";
import { fileURLToPath } from "node:url";
import { activeRepositoryPath, assertNonEmptyDiscovery, loadActiveEstate } from "./lib/estate.mjs";

const SCRIPT_PATH = fileURLToPath(import.meta.url);
const DEFAULT_ROOT = resolve(dirname(SCRIPT_PATH), "..", "..");
const USES = /^\s*(?:-\s*)?uses:\s*([^\s#]+)\s*$/gm;
const SHA = /^[0-9a-f]{40}$/i;

function workflowFiles(directory) {
  if (!existsSync(directory)) return [];
  return readdirSync(directory, { withFileTypes: true })
    .filter((entry) => entry.isFile() && /\.ya?ml$/i.test(entry.name))
    .map((entry) => join(directory, entry.name));
}

function immutableUsesReference(reference) {
  if (reference.startsWith("./")) return true;
  if (reference.startsWith("docker://")) return /@sha256:[0-9a-f]{64}$/i.test(reference);
  const at = reference.lastIndexOf("@");
  return at > 0 && SHA.test(reference.slice(at + 1));
}

export function inspectWorkflowReferences(root = DEFAULT_ROOT) {
  const estate = loadActiveEstate({ workspaceRoot: root });
  const files = estate.names.flatMap((repository) => workflowFiles(join(activeRepositoryPath(estate, repository), ".github", "workflows")));
  assertNonEmptyDiscovery("active GitHub workflow files", files);
  const references = [];
  for (const file of files) {
    const source = readFileSync(file, "utf8");
    USES.lastIndex = 0;
    let match;
    while ((match = USES.exec(source)) !== null) {
      references.push({
        file: relative(root, file).replace(/\\/g, "/"),
        line: source.slice(0, match.index).split(/\r?\n/).length,
        reference: match[1],
      });
    }
  }
  assertNonEmptyDiscovery("active GitHub action/workflow references", references);
  return references;
}

export function evaluateWorkflowImmutability(references) {
  return references
    .filter(({ reference }) => !immutableUsesReference(reference))
    .map(({ file, line, reference }) => `${file}:${line} uses mutable action/workflow reference '${reference}'`);
}

function fixture({ uses }) {
  const root = mkdtempSync(join(tmpdir(), "unierp-workflow-"));
  const workflow = join(root, "api", ".github", "workflows");
  mkdirSync(workflow, { recursive: true });
  writeFileSync(join(root, "UniERP.code-workspace"), JSON.stringify({ folders: [{ path: "api" }] }));
  writeFileSync(join(workflow, "ci.yml"), `name: CI\njobs:\n  check:\n    steps:\n      - uses: ${uses}\n`);
  return root;
}

function test() {
  const good = fixture({ uses: "actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683" });
  const bad = fixture({ uses: "actions/checkout@v4" });
  try {
    if (evaluateWorkflowImmutability(inspectWorkflowReferences(good)).length) throw new Error("pinned workflow fixture failed");
    if (evaluateWorkflowImmutability(inspectWorkflowReferences(bad)).length !== 1) throw new Error("mutable workflow fixture escaped detection");
  } finally {
    rmSync(good, { recursive: true, force: true });
    rmSync(bad, { recursive: true, force: true });
  }
  console.log("Workflow immutability adversarial tests passed.");
}

if (process.argv.includes("--test")) test();
else {
  const violations = evaluateWorkflowImmutability(inspectWorkflowReferences());
  console.log(`Workflow immutability inventory: ${violations.length} mutable reference(s).`);
  for (const violation of violations) console.error(`  - ${violation}`);
  if (violations.length) process.exit(1);
}
