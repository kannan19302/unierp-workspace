#!/usr/bin/env node
/**
 * check-repo-hygiene.mjs — no scratch files at a repository root. Phase A14, closing R5.
 *
 * IMPLEMENTATION_PLAN § 10 R5's exit criterion is "Clean `git status`, no scratch files
 * tracked." It was not met: `unierp-mobile` tracked fifteen files at its root — twelve
 * Python/PowerShell fixers, three of which hardcode paths into the retired ERPSys monorepo
 * and one into a Gemini IDE task log, plus three UTF-16 `flutter analyze` dumps.
 *
 * The reason this is a gate and not a cleanup: three of those files had ALREADY been deleted
 * once, in the monorepo, and are recorded as deleted in docs/ai/CHANGELOG.md. They came back
 * through the polyrepo extraction. A fix that does not survive extraction needs a mechanism,
 * not a second cleanup.
 *
 *   node scripts/ci/check-repo-hygiene.mjs            check every sibling repo
 *   node scripts/ci/check-repo-hygiene.mjs --repo X   check one
 *   node scripts/ci/check-repo-hygiene.mjs --list     show what each repo tracks at its root
 *
 * Deliberately an ALLOWLIST of shapes rather than a denylist of names. A denylist catches
 * `fix_router_5.py` and misses `fix_router_6.py`; the whole point is that this class recurs.
 */

import { readdirSync, statSync, existsSync } from "node:fs";
import { join, dirname, basename } from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

const HERE = dirname(fileURLToPath(import.meta.url));
const FAMILY = join(HERE, "..", "..", "..");
const SELF = basename(join(HERE, "..", ".."));

/** Root-level filenames and extensions a repository may legitimately track. */
const ALLOWED_EXACT = new Set([
  // Governance and community
  "README.md", "LICENSE", "LICENSE.md", "CONTRIBUTING.md", "SECURITY.md",
  "CODE_OF_CONDUCT.md", "GOVERNANCE.md", "SUPPORT.md", "CHANGELOG.md",
  "ROADMAP.md", "ARCHITECTURE.md", "CITATION.cff",
  // Agent entrypoints
  "AGENTS.md", "CLAUDE.md", "GEMINI.md",
  // Node / JS
  "package.json", "package-lock.json", "pnpm-lock.yaml", "pnpm-workspace.yaml",
  "tsconfig.json", "tsconfig.base.json", "tsconfig.build.json", "next-env.d.ts",
  "vitest.config.ts", "vitest.integration.config.ts", "playwright.config.ts",
  "postcss.config.mjs", "next.config.mjs", "middleware.ts", "prisma.config.ts",
  "eslint.config.mjs", ".eslintrc.json", ".prettierrc", "turbo.json",
  // Dart / Flutter
  "pubspec.yaml", "pubspec.lock", "analysis_options.yaml",
  // Containers and CI
  "Dockerfile", "Dockerfile.dev", ".dockerignore", "docker-compose.yml",
  "docker-compose.dev.yml", "docker-compose.platform.yml",
  // Repo config
  ".gitignore", ".gitattributes", ".npmrc", ".nvmrc", ".editorconfig",
  ".lycheeignore", "renovate.json",
]);

/** Extensions that are never acceptable at a repository root. */
const FORBIDDEN_EXT = new Set([
  ".py", ".ps1", ".sh", ".bat", ".cmd", ".txt", ".log", ".bak", ".orig",
  ".tmp", ".swp", ".patch", ".diff", ".zip", ".tar", ".gz", ".csv", ".out",
]);

/** Root files a repo may keep despite a forbidden extension, with a stated reason. */
const EXEMPT = {
  "unierp-mobile": { "exemptions.md": "Tier-4 client-parity exemptions, referenced by the parity gate" },
};

/**
 * Repositories archived on GitHub. They cannot be pushed to (403), so a finding in one is
 * unactionable — and scanning them inflates the repo count this gate reports, which is how
 * 00-BASELINE came to describe a 30-repo family when 26 are live.
 *
 * These four were superseded by unierp-extensions/<vertical>. That supersession is incomplete
 * and is filed as D023: the archived repos hold 410-881 source lines each; their replacements
 * hold 26-39. Do not work in them — the code has to move forward, not be edited in place.
 */
const ARCHIVED = new Set([
  "unierp-app-education",
  "unierp-app-fieldservice",
  "unierp-app-healthcare",
  "unierp-app-realestate",
]);

const argv = process.argv.slice(2);
const only = (() => {
  const i = argv.indexOf("--repo");
  return i === -1 ? null : argv[i + 1];
})();
const LIST = argv.includes("--list");

const trackedRoot = (dir) => {
  const r = spawnSync("git", ["ls-files"], { cwd: dir, encoding: "utf8" });
  if (r.status !== 0) return null;
  return r.stdout.split("\n").map((l) => l.trim()).filter((l) => l && !l.includes("/"));
};

const repos = readdirSync(FAMILY)
  .filter((d) => d.startsWith("unierp-"))
  .filter((d) => {
    try {
      return statSync(join(FAMILY, d)).isDirectory() && existsSync(join(FAMILY, d, ".git"));
    } catch {
      return false;
    }
  })
  .filter((d) => (only ? d === only : true))
  .filter((d) => only === d || !ARCHIVED.has(d));

if (!repos.length) {
  console.error(`check-repo-hygiene: no git repositories found under ${FAMILY}`);
  process.exit(1);
}

const findings = [];

for (const repo of repos) {
  const files = trackedRoot(join(FAMILY, repo));
  if (files === null) continue;
  if (LIST) {
    console.log(`\n${repo}`);
    for (const f of files.sort()) console.log(`    ${f}`);
    continue;
  }
  for (const f of files) {
    if (ALLOWED_EXACT.has(f)) continue;
    if (EXEMPT[repo]?.[f]) continue;
    const ext = f.includes(".") ? f.slice(f.lastIndexOf(".")).toLowerCase() : "";
    if (FORBIDDEN_EXT.has(ext)) {
      findings.push({ repo, file: f, why: `\`${ext}\` file at a repository root` });
    }
  }
}

if (LIST) process.exit(0);

// A nested config directory named after its parent is always a mistake, and `ls` without
// -a does not reveal it — which is how unierp-storybook/.storybook/.storybook/ survived
// with two divergent copies of main.ts and preview.ts (D007).
for (const repo of repos) {
  const dir = join(FAMILY, repo);
  for (const d of [".storybook", ".github", ".vscode", ".husky"]) {
    if (existsSync(join(dir, d, d))) {
      findings.push({ repo, file: `${d}/${d}/`, why: "config directory nested inside itself" });
    }
  }
}

if (findings.length) {
  console.error(`\ncheck-repo-hygiene: ${findings.length} violation(s)\n`);
  for (const f of findings) {
    console.error(`FAIL  ${f.repo}/${f.file}\n        ${f.why}`);
  }
  console.error(
    `\nA repository root is read by every contributor and every agent before anything\n` +
      `else. R5's exit criterion is "no scratch files tracked" — see phase A14 in\n` +
      `docs/programme/10-TRACK-A-FOUNDATION.md.\n\n` +
      `If a file genuinely belongs at a root, add it to ALLOWED_EXACT or to EXEMPT with a\n` +
      `stated reason. Do not widen FORBIDDEN_EXT.\n`,
  );
  process.exit(1);
}

console.log(
  `OK    ${repos.length} live repositories; no scratch files or self-nested config at any root.` +
    ` (${ARCHIVED.size} archived, skipped — see D023.)`,
);
