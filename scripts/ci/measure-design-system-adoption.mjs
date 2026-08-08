import fs from "fs";
import path from "path";

/**
 * CI Gate: Measure design system (@unerp/ui) adoption across unierp-web screens.
 */
const WORKSPACE_ROOT = path.resolve(process.cwd(), "..");
const WEB_APP_DIR = path.join(WORKSPACE_ROOT, "unierp-web", "app");

let totalScreens = 0;
let designSystemScreens = 0;

function analyzeDir(dirPath) {
  if (!fs.existsSync(dirPath)) return;
  const entries = fs.readdirSync(dirPath, { withFileTypes: true });

  for (const entry of entries) {
    const fullPath = path.join(dirPath, entry.name);
    if (entry.isDirectory()) {
      if (entry.name !== "node_modules" && entry.name !== ".next") {
        analyzeDir(fullPath);
      }
    } else if (entry.name === "page.tsx" || entry.name === "page.jsx") {
      totalScreens++;
      const content = fs.readFileSync(fullPath, "utf-8");
      if (content.includes("@unerp/ui") || content.includes("DataTable") || content.includes("PageHeader")) {
        designSystemScreens++;
      }
    }
  }
}

analyzeDir(WEB_APP_DIR);

const coveragePercent = totalScreens > 0 ? ((designSystemScreens / totalScreens) * 100).toFixed(1) : "100.0";
console.log(`[Design System Adoption Report]`);
console.log(`Total web screens: ${totalScreens}`);
console.log(`Screens using @unerp/ui: ${designSystemScreens}`);
console.log(`Coverage Floor: ${coveragePercent}%`);

const REPORT_FILE = path.join(process.cwd(), "scripts", "ci", "design-system-adoption.json");
fs.writeFileSync(
  REPORT_FILE,
  JSON.stringify({ totalScreens, designSystemScreens, coveragePercent: Number(coveragePercent), timestamp: new Date().toISOString() }, null, 2)
);

console.log(`✅ Adoption report published to scripts/ci/design-system-adoption.json`);
