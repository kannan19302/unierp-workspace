const fs = require('fs');
const p = 'docs/programme/worklog/kannan19302-msi-unierp-workspace.md';
let c = fs.readFileSync(p, 'utf8');
const badRegex = /### A01 · PROGRESS · [\s\S]*?(?=(### |$))/g;
c = c.replace(badRegex, '');
const badFinish = /### A01 · FINISH · [\s\S]*?(?=(### |$))/g;
c = c.replace(badFinish, '');
fs.writeFileSync(p, c);
