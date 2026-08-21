import fs from "node:fs";
import path from "node:path";
import process from "node:process";

const programmeRoot = process.cwd();
const estateRoot = path.resolve(programmeRoot, "..");
const inventoryPath = path.join(programmeRoot, "scripts", "ui-routes-inventory.json");
const baselinePath = path.join(programmeRoot, "scripts", "ci", "ui-audit-baseline.json");
const updateBaseline = process.argv.includes("--update-baseline");

const ignoredDirectories = new Set([
  ".git",
  ".next",
  ".dart_tool",
  "build",
  "coverage",
  "dist",
  "node_modules",
]);

const surfaces = [
  { repo: "infra/platform-wizard", anatomy: "launch-hero", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "marketing-site", anatomy: "editorial", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-apps", anatomy: "record", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-admin", anatomy: "settings", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "provider-admin-os", anatomy: "ops", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "marketplace", anatomy: "catalog", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "developer-platform", anatomy: "workspace-studio", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "web-studio", anatomy: "workspace-studio", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-sites", anatomy: "tenant-branded", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "unierp-mobile", anatomy: "mobile", route: /(?:_page|_screen)\.dart$/ },
  { repo: "desktop-app", anatomy: "desktop", route: /public(?:\\|\/)index\.html$/ },
];

const approvedShellFiles = new Set([
  "app_shell.dart",
  "auth-shell.tsx",
  "console-shell.tsx",
  "domain-shell.tsx",
  "workspace-shell-client.tsx",
]);
const sixStates = [
  "LoadingState",
  "EmptyState",
  "FilteredEmptyState",
  "ErrorState",
  "ForbiddenState",
  "PartialState",
];

function walk(directory) {
  if (!fs.existsSync(directory)) return [];
  const files = [];
  const stack = [directory];
  while (stack.length > 0) {
    const current = stack.pop();
    for (const entry of fs.readdirSync(current, { withFileTypes: true })) {
      if (ignoredDirectories.has(entry.name)) continue;
      const target = path.join(current, entry.name);
      if (entry.isDirectory()) stack.push(target);
      else files.push(target);
    }
  }
  return files;
}

function countMatches(content, expression) {
  return [...content.matchAll(expression)].length;
}

function relative(file) {
  return path.relative(estateRoot, file).replaceAll("\\", "/");
}

const routes = [];
const findings = {};

function record(category, file, count) {
  if (count <= 0) return;
  findings[category] ??= {};
  findings[category][file] = count;
}

for (const surface of surfaces) {
  const root = path.join(estateRoot, surface.repo);
  const files = walk(root);
  for (const file of files) {
    const fileRelativeToRepo = path.relative(root, file);
    if (!surface.route.test(fileRelativeToRepo)) continue;
    const content = fs.readFileSync(file, "utf8");
    const routeFile = relative(file);
    const stateCount = sixStates.filter((state) => content.includes(state)).length;
    const rawTables = countMatches(content, /<table(?:\s|>)/g);
    const inlineStyles = countMatches(content, /style\s*=\s*\{\{/g);
    const tokenLiterals = countMatches(
      content,
      /#[0-9a-fA-F]{3,8}\b|\b\d+(?:\.\d+)?px\b/g,
    );
    const sharedUi = /@kannan19302\/ui|tokens\.g\.dart|package:unerp_mobile/.test(content);
    const responsive = /@media|useMedia|breakpoint|LayoutBuilder|MediaQuery|\.module\.css/.test(content);
    const accessibility = /aria-|role=|<main|<nav|<header|Semantics\(/.test(content);

    routes.push({
      surface: surface.repo,
      file: routeFile,
      anatomy: surface.anatomy,
      sharedUi,
      stateCount,
      rawTables,
      inlineStyles,
      tokenLiterals,
      responsive,
      accessibility,
    });
    record("rawTable", routeFile, rawTables);
    record("inlineStyle", routeFile, inlineStyles);
    record("tokenLiteral", routeFile, tokenLiterals);
    record("missingStates", routeFile, stateCount < sixStates.length ? sixStates.length - stateCount : 0);
  }

  for (const file of files) {
    const name = path.basename(file).toLowerCase();
    if (!/(?:^|-|_)shell\.(?:tsx|ts|dart)$/.test(name)) continue;
    if (approvedShellFiles.has(name)) continue;
    record("unregisteredShell", relative(file), 1);
  }
}

routes.sort((a, b) => a.file.localeCompare(b.file));
const inventory = {
  generatedAt: new Date().toISOString(),
  routeCount: routes.length,
  surfaces: Object.fromEntries(
    surfaces.map(({ repo, anatomy }) => [
      repo,
      { anatomy, routes: routes.filter((route) => route.surface === repo).length },
    ]),
  ),
  routes,
};
fs.writeFileSync(inventoryPath, `${JSON.stringify(inventory, null, 2)}\n`, "utf8");

if (updateBaseline) {
  fs.writeFileSync(
    baselinePath,
    `${JSON.stringify({ version: 1, findings }, null, 2)}\n`,
    "utf8",
  );
  console.log(`UI audit baseline updated: ${baselinePath}`);
  console.log(`UI route inventory emitted: ${routes.length} active routes across ${surfaces.length} surfaces`);
  process.exit(0);
}

if (!fs.existsSync(baselinePath)) {
  console.error(`UI audit baseline missing: ${baselinePath}`);
  console.error("Review current findings, then run pnpm ui:audit -- --update-baseline once.");
  process.exit(1);
}

const baseline = JSON.parse(fs.readFileSync(baselinePath, "utf8"));
const regressions = [];
for (const [category, files] of Object.entries(findings)) {
  for (const [file, count] of Object.entries(files)) {
    const allowed = baseline.findings?.[category]?.[file] ?? 0;
    if (count > allowed) regressions.push(`${category}: ${file} (${count} > ${allowed})`);
  }
}

console.log(`UI route inventory emitted: ${routes.length} active routes across ${surfaces.length} surfaces`);
for (const [surface, summary] of Object.entries(inventory.surfaces)) {
  console.log(`  ${surface}: ${summary.routes} route(s) → ${summary.anatomy}`);
}

if (regressions.length > 0) {
  console.error(`UI audit failed with ${regressions.length} regression(s):`);
  for (const regression of regressions.slice(0, 50)) console.error(`  ${regression}`);
  if (regressions.length > 50) console.error(`  … ${regressions.length - 50} more`);
  process.exit(1);
}

console.log("UI audit passed: no shell, state, table, token, or styling regression.");
