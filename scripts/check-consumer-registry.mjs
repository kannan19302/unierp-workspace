#!/usr/bin/env node
/**
 * scripts/check-consumer-registry.mjs
 *
 * P12-007: The Consumer Registry (EP-3 mechanism).
 *
 * Provides a queryable, mechanical consumer discovery engine across all 12 programmes.
 * Answers "Who uses this?" for any exported symbol, contract, event, or repository.
 *
 * Usage:
 *   node scripts/check-consumer-registry.mjs                           # scans all symbols and verifies registry integrity
 *   node scripts/check-consumer-registry.mjs --who-uses <symbolOrRepo> # queries consumers of a specific symbol/repo
 *   node scripts/check-consumer-registry.mjs --generate                # generates docs/programme/P12-007-CONSUMER-REGISTRY.json and .md
 *   node scripts/check-consumer-registry.mjs --verify                  # CI verification gate
 */

import { readFileSync, writeFileSync, existsSync, readdirSync, statSync } from "node:fs";
import { resolve, dirname, join, extname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const ROOT = resolve(__dirname, "..");
const PARENT_DIR = resolve(ROOT, "..");
const CLAIMS_PATH = resolve(ROOT, "docs/programme/programme-claims.json");
const GRAPH_JSON_PATH = resolve(ROOT, "docs/programme/P12-006-DEPENDENCY-GRAPH.json");
const REGISTRY_JSON_PATH = resolve(ROOT, "docs/programme/P12-007-CONSUMER-REGISTRY.json");
const REGISTRY_MD_PATH = resolve(ROOT, "docs/programme/P12-007-CONSUMER-REGISTRY.md");

const args = process.argv.slice(2);
const isVerifyMode = args.includes("--verify");
const isGenerateMode = args.includes("--generate");
const whoUsesIndex = args.indexOf("--who-uses");
const queryTarget = whoUsesIndex !== -1 ? args[whoUsesIndex + 1] : null;

if (!existsSync(CLAIMS_PATH)) {
  console.error(`FAIL  Programme claims not found: ${CLAIMS_PATH}`);
  process.exit(1);
}

const claims = JSON.parse(readFileSync(CLAIMS_PATH, "utf8"));
const allRepos = Object.keys(claims.repos);

// Shipped published libraries that export symbols across the platform
const PUBLISHED_LIBRARIES = [
  "unierp-contracts",
  "unierp-auth",
  "unierp-shared",
  "unierp-kernel",
  "unierp-sdk",
  "unierp-data",
  "unierp-framework",
  "unierp-extension-api",
  "unierp-design-system",
  "unierp-service-kit",
  "unierp-config",
];

function extractSymbolsFromFile(filePath, visited = new Set()) {
  if (visited.has(filePath) || !existsSync(filePath)) return [];
  visited.add(filePath);

  const symbols = new Set();
  try {
    const content = readFileSync(filePath, "utf8");
    const dir = dirname(filePath);

    // export { a, b as c } from ...
    const namedExports = content.matchAll(/export\s*\{\s*([^}]+)\s*\}(?:\s*from\s*['"]([^'"]+)['"])?/g);
    for (const m of namedExports) {
      const list = m[1].split(",");
      for (const item of list) {
        const clean = item.trim().split(/\s+as\s+/).pop().trim();
        if (clean && !clean.startsWith("//")) symbols.add(clean);
      }
    }

    // export const/function/class/type/interface/enum X
    const declExports = content.matchAll(/export\s+(?:declare\s+)?(?:const|let|var|function|class|type|interface|enum)\s+([A-Za-z0-9_$]+)/g);
    for (const m of declExports) {
      if (m[1]) symbols.add(m[1]);
    }

    // export * from './path'
    const starExports = content.matchAll(/export\s*\*\s*from\s*['"]([^'"]+)['"]/g);
    for (const m of starExports) {
      let targetRel = m[1];
      if (targetRel.endsWith(".js")) targetRel = targetRel.replace(/\.js$/, "");
      const candidates = [
        resolve(dir, `${targetRel}.ts`),
        resolve(dir, `${targetRel}.tsx`),
        resolve(dir, `${targetRel}/index.ts`),
        resolve(dir, `${targetRel}/index.tsx`),
        resolve(dir, `${targetRel}.js`),
        resolve(dir, `${targetRel}/index.js`),
      ];
      for (const cand of candidates) {
        if (existsSync(cand)) {
          const subSymbols = extractSymbolsFromFile(cand, visited);
          for (const s of subSymbols) symbols.add(s);
          break;
        }
      }
    }
  } catch {}

  return Array.from(symbols);
}

function extractExportedSymbols(repoName) {
  const repoDir = repoName === "unierp-workspace" ? ROOT : resolve(PARENT_DIR, repoName);
  if (!existsSync(repoDir)) return [];

  const symbols = new Set();
  const entryPoints = [
    join(repoDir, "src/index.ts"),
    join(repoDir, "src/index.tsx"),
    join(repoDir, "src/index.js"),
    join(repoDir, "src/index.mjs"),
    join(repoDir, "index.ts"),
    join(repoDir, "index.js"),
  ];

  for (const entry of entryPoints) {
    if (existsSync(entry)) {
      const syms = extractSymbolsFromFile(entry);
      for (const s of syms) symbols.add(s);
    }
  }

  return Array.from(symbols).sort();
}

function collectConsumerFiles(dir, maxFiles = 3000) {
  const files = [];
  const validExts = new Set([".ts", ".tsx", ".js", ".jsx", ".mjs", ".cjs", ".dart", ".prisma"]);

  function walk(currentDir) {
    if (files.length >= maxFiles) return;
    let entries = [];
    try {
      entries = readdirSync(currentDir);
    } catch {
      return;
    }

    for (const entry of entries) {
      if (files.length >= maxFiles) break;
      if (entry === "node_modules" || entry === ".git" || entry === "dist" || entry === "build" || entry === ".next") {
        continue;
      }
      const fullPath = join(currentDir, entry);
      try {
        const st = statSync(fullPath);
        if (st.isDirectory()) {
          walk(fullPath);
        } else if (st.isFile() && validExts.has(extname(entry).toLowerCase())) {
          files.push(fullPath);
        }
      } catch {}
    }
  }

  walk(dir);
  return files;
}

export function buildConsumerRegistry() {
  const registry = {
    generatedAt: new Date().toISOString(),
    phase: "P12-007",
    providers: {},
    symbolsIndex: {},
  };

  // Map each provider and its exported symbols
  for (const lib of PUBLISHED_LIBRARIES) {
    const exportedSymbols = extractExportedSymbols(lib);
    registry.providers[lib] = {
      repository: lib,
      owner: claims.repos[lib]?.owner ?? 12,
      exportedSymbolsCount: exportedSymbols.length,
      symbols: exportedSymbols,
    };

    for (const sym of exportedSymbols) {
      registry.symbolsIndex[sym] = {
        provider: lib,
        providerOwner: claims.repos[lib]?.owner ?? 12,
        consumers: [],
        locationsCount: 0,
      };
    }
  }

  // Scan all repositories for consumption of each symbol
  for (const consumerRepo of allRepos) {
    const consumerDir = consumerRepo === "unierp-workspace" ? ROOT : resolve(PARENT_DIR, consumerRepo);
    if (!existsSync(consumerDir)) continue;

    const files = collectConsumerFiles(consumerDir);
    const foundInRepo = new Map(); // symbol -> count

    for (const file of files) {
      try {
        const code = readFileSync(file, "utf8");
        for (const sym of Object.keys(registry.symbolsIndex)) {
          if (code.includes(sym)) {
            // Regex match symbol as word boundary
            const re = new RegExp(`\\b${sym}\\b`, "g");
            const matches = (code.match(re) || []).length;
            if (matches > 0) {
              foundInRepo.set(sym, (foundInRepo.get(sym) || 0) + matches);
            }
          }
        }
      } catch {}
    }

    for (const [sym, count] of foundInRepo.entries()) {
      const entry = registry.symbolsIndex[sym];
      if (entry && entry.provider !== consumerRepo) {
        entry.consumers.push({
          repository: consumerRepo,
          programme: claims.repos[consumerRepo]?.owner ?? 12,
          occurrences: count,
        });
        entry.locationsCount += count;
      }
    }
  }

  return registry;
}

export function queryWhoUses(target, registry) {
  // Check if target is a repository
  if (claims.repos[target]) {
    const symbols = registry.providers[target]?.symbols || [];
    const consumers = new Set();
    for (const s of symbols) {
      for (const c of registry.symbolsIndex[s]?.consumers || []) {
        consumers.add(c.repository);
      }
    }
    return {
      type: "repository",
      target,
      owner: claims.repos[target]?.owner,
      exportedSymbolsCount: symbols.length,
      consumersCount: consumers.size,
      consumers: Array.from(consumers).sort(),
    };
  }

  // Check if target is a symbol
  const symEntry = registry.symbolsIndex[target];
  if (symEntry) {
    return {
      type: "symbol",
      target,
      provider: symEntry.provider,
      providerOwner: symEntry.providerOwner,
      consumersCount: symEntry.consumers.length,
      locationsCount: symEntry.locationsCount,
      consumers: symEntry.consumers,
    };
  }

  return null;
}

export function generateMarkdownReport(reg) {
  let md = `# Consumer Registry (P12-007 / EP-3)\n\n`;
  md += `> **Mechanical index answering "Who uses this?" across all 12 programmes.**\n`;
  md += `> Generated: ${reg.generatedAt} · Indexed Symbols: ${Object.keys(reg.symbolsIndex).length} · Published Libraries: ${Object.keys(reg.providers).length}\n\n`;

  md += `## 1. Provider Libraries & Exported Symbols\n\n`;
  md += `| Provider Library | Owner Programme | Exported Symbols | Actively Consumed Symbols |\n`;
  md += `| :--- | :--- | :--- | :--- |\n`;

  for (const [lib, data] of Object.entries(reg.providers)) {
    const consumedSymbols = data.symbols.filter((s) => reg.symbolsIndex[s]?.consumers.length > 0).length;
    md += `| \`${lib}\` | P${data.owner} | ${data.exportedSymbolsCount} | ${consumedSymbols} |\n`;
  }

  md += `\n## 2. Top Consumed Symbols Across Estate\n\n`;
  md += `| Symbol | Provider | Owner | Consuming Repositories | Reference Occurrences |\n`;
  md += `| :--- | :--- | :--- | :--- | :--- |\n`;

  const sortedSymbols = Object.entries(reg.symbolsIndex)
    .filter(([_, v]) => v.consumers.length > 0)
    .sort((a, b) => b[1].consumers.length - a[1].consumers.length || b[1].locationsCount - a[1].locationsCount)
    .slice(0, 50);

  for (const [sym, data] of sortedSymbols) {
    const consumerList = data.consumers.map((c) => `\`${c.repository}\` (P${c.programme})`).join(", ");
    md += `| \`${sym}\` | \`${data.provider}\` | P${data.providerOwner} | ${consumerList} | ${data.locationsCount} |\n`;
  }

  return md;
}

function getOrBuildRegistry() {
  if (existsSync(REGISTRY_JSON_PATH)) {
    try {
      return JSON.parse(readFileSync(REGISTRY_JSON_PATH, "utf8"));
    } catch {}
  }
  return buildConsumerRegistry();
}

if (queryTarget) {
  const targetRegistry = getOrBuildRegistry();
  const result = queryWhoUses(queryTarget, targetRegistry);
  if (!result) {
    console.error(`Not found: No symbol or repository matching '${queryTarget}'.`);
    process.exit(1);
  }
  console.log(`\n=== Consumer Registry Query: ${queryTarget} ===`);
  if (result.type === "repository") {
    console.log(`Repository: ${result.target} (Owned by Programme ${result.owner})`);
    console.log(`Exported Symbols: ${result.exportedSymbolsCount}`);
    console.log(`Consuming Repositories (${result.consumersCount}):`);
    for (const c of result.consumers) {
      console.log(`  - ${c}`);
    }
  } else {
    console.log(`Symbol: ${result.target} (Provided by ${result.provider}, P${result.providerOwner})`);
    console.log(`Total Occurrences: ${result.locationsCount}`);
    console.log(`Consuming Repositories (${result.consumersCount}):`);
    for (const c of result.consumers) {
      console.log(`  - ${c.repository} (Programme ${c.programme}, ${c.occurrences} references)`);
    }
  }
  process.exit(0);
}

if (isVerifyMode) {
  if (!existsSync(REGISTRY_JSON_PATH) || !existsSync(REGISTRY_MD_PATH)) {
    console.error(`FAIL  check-consumer-registry: Registry artifacts missing. Run with --generate first.`);
    process.exit(1);
  }

  const loadedReg = JSON.parse(readFileSync(REGISTRY_JSON_PATH, "utf8"));
  if (Object.keys(loadedReg.symbolsIndex || {}).length === 0) {
    console.error(`FAIL  check-consumer-registry: No symbols indexed in registry.`);
    process.exit(1);
  }

  console.log(`OK    Consumer registry verified: ${Object.keys(loadedReg.symbolsIndex).length} symbols indexed across ${Object.keys(loadedReg.providers).length} providers.`);
  process.exit(0);
}

// Generate artifacts by default or with --generate
const reg = buildConsumerRegistry();
writeFileSync(REGISTRY_JSON_PATH, JSON.stringify(reg, null, 2), "utf8");
writeFileSync(REGISTRY_MD_PATH, generateMarkdownReport(reg), "utf8");

console.log(`OK    Generated ${REGISTRY_JSON_PATH} and ${REGISTRY_MD_PATH}`);
console.log(`      Total Providers: ${Object.keys(reg.providers).length} | Total Symbols: ${Object.keys(reg.symbolsIndex).length}`);
