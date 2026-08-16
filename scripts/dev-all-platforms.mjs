import { spawn, execSync } from 'child_process';
import http from 'http';
import path from 'path';
import { fileURLToPath } from 'url';
import fs from 'fs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const WORKSPACE_DIR = path.resolve(__dirname, '..');
const ROOT_DIR = path.resolve(WORKSPACE_DIR, '..'); // d:\UniERP

const PROGRAMMES = [
  { id: 'P7', port: 3101, name: 'Marketing Site', repo: 'marketing-site', trackFile: '35-PROGRAMME-7-MARKETING-SITE.md' },
  { id: 'P8', port: 3102, name: 'Platform Admin OS', repo: 'provider-admin-os', trackFile: '36-PROGRAMME-8-PLATFORM-ADMIN-OS.md' },
  { id: 'P2', port: 3103, name: 'Developer Portal', repo: 'developer-platform', trackFile: '30-PROGRAMME-2-DEVELOPER-PORTAL.md' },
  { id: 'P3', port: 3104, name: 'Marketplace', repo: 'tenant-apps-proxy', trackFile: '31-PROGRAMME-3-MARKETPLACE.md' },
  { id: 'P4', port: 3105, name: 'Tenant apps (ERP)', repo: 'tenant-apps-proxy', trackFile: '32-PROGRAMME-4-TENANT-APPS.md' },
  { id: 'P5', port: 3106, name: 'Website builder', repo: 'tenant-apps-proxy', trackFile: '33-PROGRAMME-5-WEBSITE-BUILDER.md' },
  { id: 'P6', port: 3107, name: 'Tenant admin console', repo: 'tenant-apps-proxy', trackFile: '34-PROGRAMME-6-TENANT-ADMIN-CONSOLE.md' },
  { id: 'P9', port: 3108, name: 'Web client', repo: 'tenant-apps', trackFile: '37-PROGRAMME-9-WEB-CLIENT.md' },
  { id: 'P10', port: 3109, name: 'Mobile', repo: 'unierp-mobile', trackFile: '38-PROGRAMME-10-MOBILE.md' },
  { id: 'P11', port: 3110, name: 'Desktop', repo: 'desktop-app', trackFile: '39-PROGRAMME-11-DESKTOP.md' }
];

async function getProgrammeStatuses() {
  console.log('Fetching programme statuses...');
  const output = execSync('node scripts/phase-brief.mjs --status', { cwd: WORKSPACE_DIR, encoding: 'utf-8' });
  const statuses = {};
  
  for (const line of output.split('\n')) {
    const match = line.match(/^\s*(P\d+)\s+(.*?)\s+(\d+)\/(\d+)/);
    if (match) {
      statuses[match[1]] = {
        done: parseInt(match[3], 10),
        total: parseInt(match[4], 10)
      };
    }
  }
  return statuses;
}

function startPlaceholderServer(prog, status, extraNote) {
  const percent = status ? Math.round((status.done / status.total) * 100) : 0;
  const note = extraNote || 'No repository owns this programme yet, or nothing in it renders a UI.';

  const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(`
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${prog.name} (Placeholder)</title>
        <style>
          body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; background-color: #f3f4f6; color: #1f2937; }
          .container { text-align: center; background: white; padding: 3rem; border-radius: 0.5rem; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06); max-width: 32rem; }
          h1 { margin-top: 0; color: #111827; }
          .badge { display: inline-block; padding: 0.25rem 0.75rem; border-radius: 9999px; background-color: #e5e7eb; color: #374151; font-weight: 500; font-size: 0.875rem; margin-bottom: 1rem; }
          p { color: #4b5563; line-height: 1.5; margin-bottom: 1.5rem; }
          a { color: #2563eb; text-decoration: none; font-weight: 500; }
          a:hover { text-decoration: underline; }
          .footer { margin-top: 2rem; padding-top: 1rem; border-top: 1px solid #e5e7eb; font-size: 0.875rem; color: #9ca3af; }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="badge">${prog.id} &middot; ${percent}% DONE</div>
          <h1>${prog.name}</h1>
          <p>Not yet built &mdash; see <a href="file:///${WORKSPACE_DIR.replace(/\\/g, '/')}/docs/programme/${prog.trackFile}">docs/programme/${prog.trackFile}</a></p>
          <p style="font-size:0.85rem;color:#6b7280;">${note}</p>
          <div class="footer">
            Served by dev-all-platforms.mjs placeholder stub.
          </div>
        </div>
      </body>
      </html>
    `);
  });

  server.listen(prog.port, () => {
    console.log(`[${prog.id}] \x1b[33mPlaceholder server\x1b[0m listening on port \x1b[1m${prog.port}\x1b[0m`);
  });
}

function startProxyServer(prog, targetPort) {
  const server = http.createServer((req, res) => {
    const proxyReq = http.request({
      hostname: 'localhost',
      port: targetPort,
      path: req.url,
      method: req.method,
      headers: req.headers,
    }, proxyRes => {
      res.writeHead(proxyRes.statusCode, proxyRes.headers);
      proxyRes.pipe(res, { end: true });
    });
    
    proxyReq.on('error', err => {
      res.writeHead(502, { 'Content-Type': 'text/plain' });
      res.end('Proxy error: ' + err.message);
    });

    proxyReq.setTimeout(20000, () => {
      proxyReq.destroy(new Error(`upstream localhost:${targetPort} did not respond within 20s (still compiling?)`));
    });

    req.pipe(proxyReq, { end: true });
  });

  server.listen(prog.port, () => {
    console.log(`[${prog.id}] \x1b[36mProxy server\x1b[0m on port \x1b[1m${prog.port}\x1b[0m -> localhost:${targetPort}`);
  });
}

function commandExists(cmd) {
  try {
    execSync(process.platform === 'win32' ? `where ${cmd}` : `command -v ${cmd}`, { stdio: 'ignore' });
    return true;
  } catch {
    return false;
  }
}

function startRealServer(prog, status) {
  const repoPath = path.join(ROOT_DIR, prog.repo);

  if (!fs.existsSync(repoPath)) {
    console.log(`[${prog.id}] \x1b[31mRepo missing\x1b[0m: ${prog.repo} - falling back to placeholder`);
    return startPlaceholderServer(prog, status, `Repo not found at ${repoPath}.`);
  }

  let command = 'pnpm';
  let args = ['exec', 'next', 'dev', '-p', prog.port.toString()];

  if (prog.repo === 'unierp-mobile') {
    if (!commandExists('flutter')) {
      console.log(`[${prog.id}] \x1b[31mflutter not installed\x1b[0m - falling back to placeholder`);
      return startPlaceholderServer(prog, status, 'The Flutter SDK is not installed in this environment, so the mobile web preview cannot be booted here. Install Flutter and re-run to get a real preview.');
    }
    command = 'flutter';
    args = ['run', '-d', 'web', '--web-port', prog.port.toString()];
  }

  console.log(`[${prog.id}] Starting \x1b[32mreal dev server\x1b[0m on port \x1b[1m${prog.port}\x1b[0m...`);

  const cp = spawn(command, args, {
    cwd: repoPath,
    shell: true,
    stdio: ['ignore', 'pipe', 'pipe']
  });

  cp.stdout.on('data', data => {
    const lines = data.toString().split('\n').filter(l => l.trim().length > 0);
    lines.forEach(line => console.log(`[${prog.id}] ${line}`));
  });

  cp.stderr.on('data', data => {
    const lines = data.toString().split('\n').filter(l => l.trim().length > 0);
    lines.forEach(line => console.error(`\x1b[31m[${prog.id}] ${line}\x1b[0m`));
  });

  cp.on('error', err => {
    console.error(`\x1b[31m[${prog.id}] Failed to start: ${err.message}\x1b[0m - falling back to placeholder`);
    startPlaceholderServer(prog, status, `Failed to launch: ${err.message}`);
  });
}

function startHubServer(statuses) {
  const rows = PROGRAMMES.map(prog => {
    const status = statuses[prog.id];
    const percent = status ? Math.round((status.done / status.total) * 100) : 0;
    return `<tr>
      <td><code>${prog.id}</code></td>
      <td>${prog.name}</td>
      <td><a href="http://localhost:${prog.port}/" target="_blank">localhost:${prog.port}</a></td>
      <td>${prog.repo}</td>
      <td>${status ? `${status.done}/${status.total} (${percent}%)` : 'unknown'}</td>
    </tr>`;
  }).join('\n');

  const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/html' });
    res.end(`<!DOCTYPE html><html><head><meta charset="UTF-8"><title>UniERP — 10 Platform QA Hub</title>
    <style>
      body { font-family: system-ui, sans-serif; margin: 2rem; background:#0b0d12; color:#e6e8ec; }
      table { border-collapse: collapse; width: 100%; }
      th, td { text-align: left; padding: .5rem .75rem; border-bottom: 1px solid #262b36; }
      a { color: #7ab8ff; }
      code { background:#262b36; padding:.1rem .35rem; border-radius:4px; }
    </style></head><body>
    <h1>UniERP — 10 Platform QA Hub</h1>
    <p>Non-blocking visual walking-skeleton. Real dev-server ports where a repo exists, proxy ports
       for programmes sharing tenant-apps's codebase, honest placeholders where nothing is built yet.
       Does not alter phase status or 04-V1-RELEASE-DEFINITION.md §3 programme order.</p>
    <table><thead><tr><th>ID</th><th>Platform</th><th>Port</th><th>Repo</th><th>Phase progress</th></tr></thead>
    <tbody>${rows}</tbody></table>
    </body></html>`);
  });

  server.listen(3100, () => console.log('[hub] \x1b[32mDirectory\x1b[0m listening on http://localhost:3100'));
}

async function main() {
  const statuses = await getProgrammeStatuses();

  console.log('\\n--- Starting Unified Walking Skeleton ---\\n');

  startHubServer(statuses);

  for (const prog of PROGRAMMES) {
    const status = statuses[prog.id] || { done: 0, total: 100 };

    if (prog.repo === 'tenant-apps-proxy') {
      startProxyServer(prog, 3108); // Proxy to P9 (Web client)
    } else if (prog.repo) {
      startRealServer(prog, status);
    } else {
      startPlaceholderServer(prog, status);
    }
  }
}

main().catch(err => {
  console.error('Fatal error:', err);
  process.exit(1);
});
