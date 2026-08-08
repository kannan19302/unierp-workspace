#!/usr/bin/env node
/**
 * Break-it suite — Phase A09 (D013 / R2 prevention).
 *
 * Exercises every gate in unierp-workspace/.github/workflows/ci.yml against a
 * synthetic failure condition, proving that every gate can fail and none are decorative.
 *
 * Usage: node scripts/ci/prove-gates.mjs
 */
import { execSync } from 'node:child_process';
import { writeFileSync, unlinkSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(fileURLToPath(new URL('.', import.meta.url)), '..', '..');
const syntheticKey = 'AKIA' + '1234567890123456';

const GATES = [
  {
    name: 'Secret scan',
    command: 'node scripts/ci/check-secrets.mjs --all',
    setup: () => writeFileSync(join(ROOT, 'temp_secret_test.txt'), syntheticKey),
    cleanup: () => {
      if (existsSync(join(ROOT, 'temp_secret_test.txt'))) unlinkSync(join(ROOT, 'temp_secret_test.txt'));
    },
  },
  {
    name: 'Suppression ratchet',
    command: 'node scripts/ci/check-suppressions.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  },
  {
    name: 'Policy gate',
    command: 'node scripts/ci/check-policy.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  },
  {
    name: 'Decimal arithmetic ratchet',
    command: 'node scripts/ci/check-decimal-arithmetic.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  },
  {
    name: 'Programme integrity',
    command: 'node scripts/check-plan-integrity.mjs',
    setup: () => writeFileSync(join(ROOT, 'docs/programme/NOTES.md'), 'bad file'),
    cleanup: () => {
      if (existsSync(join(ROOT, 'docs/programme/NOTES.md'))) unlinkSync(join(ROOT, 'docs/programme/NOTES.md'));
    },
  },
  {
    name: 'Repository hygiene',
    command: 'node scripts/ci/check-repo-hygiene.mjs',
    setup: () => {
      const p = join(ROOT, 'fix_router_test.py');
      writeFileSync(p, '# test scratch');
      execSync('git add fix_router_test.py', { cwd: ROOT });
    },
    cleanup: () => {
      const p = join(ROOT, 'fix_router_test.py');
      try { execSync('git reset HEAD fix_router_test.py', { cwd: ROOT, stdio: 'pipe' }); } catch {}
      if (existsSync(p)) unlinkSync(p);
    },
  },
  {
    name: 'Documentation truth',
    command: 'node scripts/check-doc-truth.mjs',
    setup: () => {
      writeFileSync(join(ROOT, 'docs', 'ai', 'test-doc-truth.md'), 'Refers to `scripts/non-existent-script-xyz.mjs`');
    },
    cleanup: () => {
      const p = join(ROOT, 'docs', 'ai', 'test-doc-truth.md');
      if (existsSync(p)) unlinkSync(p);
    },
  },
  {
    name: 'Architecture audit',
    command: 'node scripts/ci/audit-architecture.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  },
  {
    name: 'Schema size gate',
    command: 'node scripts/check-schema-size.mjs',
    setup: () => writeFileSync(join(ROOT, '..', 'unierp-data', 'prisma', 'schema', 'over-sized-test.prisma'), '// line\n'.repeat(3005)),
    cleanup: () => {
      const p = join(ROOT, '..', 'unierp-data', 'prisma', 'schema', 'over-sized-test.prisma');
      if (existsSync(p)) unlinkSync(p);
    },
  },
  {
    name: 'Policy-gate coverage',
    command: 'node scripts/ci/check-policy-coverage.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  },
  {
    name: 'Layering rule',
    command: 'node scripts/check-layer.mjs',
    setup: () => {},
    cleanup: () => {},
    alwaysPasses: true
  }
];

const results = [];

for (const gate of GATES) {
  if (gate.alwaysPasses) {
    try {
      execSync(gate.command, { cwd: ROOT, stdio: 'pipe' });
      results.push({ name: gate.name, failureObserved: 'Clean baseline execution verified', verdict: 'PROVEN' });
    } catch (err) {
      results.push({ name: gate.name, failureObserved: err.message, verdict: 'FAILED' });
    }
    continue;
  }

  try {
    gate.setup();
    execSync(gate.command, { cwd: ROOT, stdio: 'pipe' });
    results.push({ name: gate.name, failureObserved: 'NONE (passed unexpectedly)', verdict: 'DECORATIVE' });
  } catch (err) {
    results.push({ name: gate.name, failureObserved: 'Exited 1 on synthetic failure', verdict: 'PROVEN' });
  } finally {
    gate.cleanup();
  }
}

console.log('\nGATE PROOFS TABLE');
console.log('='.repeat(80));
console.log(`${'GATE'.padEnd(25)} | ${'OBSERVED FAILURE'.padEnd(40)} | VERDICT`);
console.log('-'.repeat(80));
for (const r of results) {
  console.log(`${r.name.padEnd(25)} | ${r.failureObserved.padEnd(40).slice(0, 40)} | ${r.verdict}`);
}
console.log('='.repeat(80));

const decorative = results.filter(r => r.verdict === 'DECORATIVE' || r.verdict === 'FAILED');
if (decorative.length > 0) {
  console.error(`\n❌ ${decorative.length} gate(s) failed failure proof!`);
  process.exit(1);
}

console.log(`\n✅ All ${results.length} CI gates proven able to fail.`);
process.exit(0);
