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
  { repo: "infra/platform-wizard", anatomy: "launch-hero", shell: "LaunchShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "marketing-site", anatomy: "editorial", shell: "EditorialShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-apps", anatomy: "record", shell: "RecordShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-admin", anatomy: "settings", shell: "SettingsShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "provider-admin-os", anatomy: "ops", shell: "OpsShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "marketplace", anatomy: "catalog", shell: "CatalogShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "developer-platform", anatomy: "workspace-studio", shell: "PlatformShell|WorkspaceShell|StudioShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "web-studio", anatomy: "workspace-studio", shell: "PlatformShell|WorkspaceShell|StudioShell", route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "tenant-sites", anatomy: "tenant-branded", noShell: true, route: /(?:^|\\|\/)page\.tsx$/ },
  { repo: "unierp-mobile", anatomy: "mobile", shell: "AppShell", route: /(?:_page|_screen)\.dart$/ },
  { repo: "desktop-app", anatomy: "desktop", shell: "data-ui-root=\"desktop-adapter\"", route: /public(?:\\|\/)index\.html$/ },
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

function nearestRootContract(file, root, surface) {
  if (surface.noShell) return "tenant-site-no-shell";
  const marker = new RegExp(`(?:${surface.shell})`);
  let current = path.dirname(file);
  while (current.startsWith(root)) {
    for (const candidate of ["layout.tsx", "layout.ts", "app_shell.dart", "index.html", "page.tsx"]) {
      const contract = path.join(current, candidate);
      if (fs.existsSync(contract) && marker.test(fs.readFileSync(contract, "utf8"))) {
        return surface.anatomy;
      }
    }
    if (current === root) break;
    current = path.dirname(current);
  }
  return null;
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
    const rootAnatomy = nearestRootContract(file, root, surface);
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
      rootAnatomy,
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
    if (!rootAnatomy) record("missingRootContract", routeFile, 1);
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

console.log("UI audit passed: every active route resolves an approved root anatomy; no shell, state, table, token, or styling regression.");
