const fs = require('fs');
const path = 'docs/programme/worklog/kannan19302-msi-unierp-workspace.md';
let content = fs.readFileSync(path, 'utf8');

const date = new Date().toISOString();
const id = 'kannan19302@MSI/unierp-workspace';

const b18Finish = `### B18 · FINISH · ${date} · ${id}\n\n\`\`\`\nnode scripts/generate-cross-platform-tokens.mjs\n? Cross-platform Dart tokens generated successfully at D:\\UniERP\\unierp-mobile\\lib\\src\\tokens\\tokens.g.dart\n\n# Output when broken (tokens.ts is malformed)\n$ node scripts/generate-cross-platform-tokens.mjs\nfile:///D:/UniERP/unierp-design-system/scripts/generate-cross-platform-tokens.mjs:15\nSyntaxError: Unexpected identifier\n\`\`\`\n\n`;

content = b18Finish + content;
fs.writeFileSync(path, content);
