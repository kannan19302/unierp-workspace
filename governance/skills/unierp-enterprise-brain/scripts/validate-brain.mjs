#!/usr/bin/env node

import { existsSync, readFileSync } from "node:fs";
import { dirname, isAbsolute, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const scriptDir = dirname(fileURLToPath(import.meta.url));
const skillRoot = resolve(scriptDir, "..");
const workspaceRootArgIndex = process.argv.indexOf("--workspace-root");
const workspaceRoot = workspaceRootArgIndex >= 0 && process.argv[workspaceRootArgIndex + 1]
  ? resolve(process.argv[workspaceRootArgIndex + 1])
  : resolve(skillRoot, "../../../..");
const failures = [];

function requireFile(relativePath, label = relativePath) {
  const absolutePath = resolve(workspaceRoot, relativePath);
  if (!existsSync(absolutePath)) failures.push(`${label}: missing ${absolutePath}`);
  return absolutePath;
}

function requireText(path, patterns) {
  if (!existsSync(path)) return;
  const source = readFileSync(path, "utf8");
  for (const pattern of patterns) {
    if (!pattern.test(source)) failures.push(`${path}: missing required marker ${pattern}`);
  }
}

function verifyMarkdownLinks(path) {
  const source = readFileSync(path, "utf8");
  const linkPattern = /\[[^\]]+\]\(([^)]+)\)/g;
  for (const match of source.matchAll(linkPattern)) {
    const rawTarget = match[1].trim().replace(/^<|>$/g, "");
    if (!rawTarget || rawTarget.startsWith("#") || /^[a-z][a-z0-9+.-]*:/i.test(rawTarget)) continue;
    const withoutAnchor = rawTarget.split("#", 1)[0];
    const target = isAbsolute(withoutAnchor)
      ? withoutAnchor
      : resolve(dirname(path), withoutAnchor);
    if (!existsSync(target)) failures.push(`${path}: broken local link ${rawTarget}`);
  }
}

const requiredSkillFiles = [
  "SKILL.md",
  "agents/openai.yaml",
  "references/authority-and-navigation.md",
  "references/enterprise-foundation.md",
  "references/knowledge-lifecycle.md",
  "scripts/validate-brain.mjs",
].map((path) => resolve(skillRoot, path));

for (const path of requiredSkillFiles) {
  if (!existsSync(path)) failures.push(`skill bundle: missing ${path}`);
}

const rootAgent = requireFile("AGENTS.md", "workspace agent entrypoint");
const protocol = requireFile(
  "unierp-platform/docs/standards/AI_AGENT_DEVELOPMENT_PROTOCOL.md",
  "canonical AI protocol",
);
const knowledgePolicy = requireFile(
  "unierp-platform/docs/standards/AI_KNOWLEDGE_LIFECYCLE.md",
  "knowledge lifecycle standard",
);
const documentationIndex = requireFile(
  "unierp-platform/docs/README.md",
  "product documentation index",
);
const standardsIndex = requireFile(
  "unierp-platform/docs/standards/README.md",
  "cross-platform standards index",
);
requireFile("unierp-platform/docs/PLATFORM_CATALOG.md", "platform catalog");
const plan = requireFile(
  "unierp-workspace/governance/UNIERP_FOUNDATION_REMEDIATION_PLAN.md",
  "foundation remediation plan",
);
const workspaceFile = requireFile("UniERP.code-workspace", "workspace repository inventory");

requireText(rootAgent, [
  /unierp-workspace\/governance\/skills\/unierp-enterprise-brain\/SKILL\.md/,
  /AI_KNOWLEDGE_LIFECYCLE\.md/,
]);
requireText(protocol, [/Protocol version:\s*\d+\.\d+\.\d+/]);
requireText(knowledgePolicy, [
  /STD-AIK-001/,
  /STD-AIK-006/,
  /STD-AIK-012/,
  /REQUIRED-BUT-INCOMPLETE/,
]);
requireText(documentationIndex, [/AI_KNOWLEDGE_LIFECYCLE\.md/, /unierp-enterprise-brain/]);
requireText(standardsIndex, [/AI_KNOWLEDGE_LIFECYCLE\.md/, /unierp-enterprise-brain/]);
requireText(plan, [
  /^## P0 — Critical foundation/m,
  /^## P1 — Required before feature expansion/m,
  /^## P2 — Production readiness/m,
  /^## P3 — Future scale/m,
  /^## Large-scale development continuation gate/m,
]);

if (existsSync(workspaceFile)) {
  let workspace;
  try {
    workspace = JSON.parse(readFileSync(workspaceFile, "utf8"));
  } catch (error) {
    failures.push(`${workspaceFile}: invalid JSON (${error.message})`);
  }

  const folders = workspace?.folders;
  if (!Array.isArray(folders) || folders.length === 0) {
    failures.push(`${workspaceFile}: zero repositories discovered`);
  } else {
    const seen = new Set();
    for (const entry of folders) {
      const repo = entry?.path;
      if (typeof repo !== "string" || repo.trim() === "") {
        failures.push(`${workspaceFile}: repository entry without a path`);
        continue;
      }
      if (seen.has(repo)) failures.push(`${workspaceFile}: duplicate repository ${repo}`);
      seen.add(repo);
      const repoRoot = resolve(workspaceRoot, repo);
      if (!existsSync(repoRoot)) {
        failures.push(`${workspaceFile}: missing repository directory ${repoRoot}`);
        continue;
      }
      const agentEntrypoint = resolve(repoRoot, "AGENTS.md");
      if (!existsSync(agentEntrypoint)) {
        failures.push(`${repo}: missing AGENTS.md`);
      } else {
        requireText(agentEntrypoint, [/\.\.\/AGENTS\.md/, /AI_AGENT_DEVELOPMENT_PROTOCOL\.md/]);
      }
    }
  }
}

for (const path of requiredSkillFiles.filter((path) => path.endsWith(".md"))) {
  if (existsSync(path)) verifyMarkdownLinks(path);
}
for (const path of [documentationIndex, standardsIndex, knowledgePolicy, plan]) {
  if (existsSync(path)) verifyMarkdownLinks(path);
}

if (failures.length > 0) {
  console.error(`UniERP enterprise brain validation failed (${failures.length} issue(s)):`);
  for (const failure of failures) console.error(`- ${failure}`);
  process.exit(1);
}

const repositoryCount = JSON.parse(readFileSync(workspaceFile, "utf8")).folders.length;
console.log(
  `UniERP enterprise brain is valid: ${requiredSkillFiles.length} skill artifacts, ${repositoryCount} repositories, mandatory authorities and P0-P3 plan discovered.`,
);
