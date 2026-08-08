const fs = require('fs');
const path = 'docs/programme/worklog/kannan19302-msi-unierp-workspace.md';
let content = fs.readFileSync(path, 'utf8');

const date = new Date().toISOString();
const id = 'kannan19302@MSI/unierp-workspace';

const notes = [
  ['B01', 'Exit criterion check: \'<table\' in unierp-web returns 191 hand-rolled tables, not 0. Phase is partly done (data-grid exists) but unierp-web still uses raw tables.'],
  ['B02', 'Exit criterion check: overlays do not use a portal layer, focus trap, or scroll-lock. They are basic inline components. Phase partly done.'],
  ['B03', 'Exit criterion check: toasts lack screen reader announcement, queueing, and deduping logic. Phase partly done.'],
  ['B04', 'Exit criterion check: command palette lacks global shortcut and route/record search integration. Tabs lack arrow navigation. Phase partly done.'],
  ['B05', 'Exit criterion check: inputs lack aria-describedby error association and Zod integration. CurrencyInput can produce floats. Phase partly done.'],
  ['B06', 'Exit criterion check: temporal controls lack timezone conversion and fiscal calendar integration. Phase partly done.'],
  ['B07', 'Exit criterion check: file upload lacks chunking/resuming. Rich text editor lacks sanitization. Phase partly done.'],
  ['B08', 'Exit criterion check: TreeView lacks virtualisation for 10k nodes and type-ahead. SplitView lacks persistence. Phase partly done.'],
  ['B09', 'Exit criterion check: Avatar fallbacks and status colors lack non-color cues for accessibility. Phase partly done.'],
  ['B10', 'Exit criterion check: charts lack data-table fallbacks and theme integration. Phase partly done.'],
  ['B11', 'Exit criterion check: enterprise patterns are basic stubs and not used to assemble module screens yet. Phase partly done.'],
  ['B13', 'Pinned @unerp/ui to 1.0.15 and @unerp/config to 1.0.2. D007 (.storybook/.storybook/) is genuinely fixed. B13 cannot close until A01 publishes.'],
  ['B15', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B16', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B17', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B21', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B22', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B23', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.'],
  ['B12', 'Phase asserts a CI gate but CI is red at npm install because A01 has never published. Blocked by A01.']
];

for (const [phase, note] of notes.reverse()) {
  content = `### ${phase} · PROGRESS · ${date} · ${id}\n\n\`\`\`\n${note}\n\`\`\`\n\n` + content;
}

fs.writeFileSync(path, content);
