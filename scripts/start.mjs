#!/usr/bin/env node
/**
 * start.mjs — the autonomous development protocol.
 *
 * One command decides what to work on, claims it so no other agent takes it, and prints
 * the work order. `start` and nothing else.
 *
 * The problem it solves: docs/programme/README.md § 0 rule 6 says conflicts block rather
 * than merge, and 02-EXECUTION-GUIDELINES § 4 says WIP is a lock. Neither was enforced by
 * anything, so two agents running `phase-brief.mjs --ready` at the same moment both
 * received the same phase and both started it. That is the exact failure this programme
 * was written to prevent, reproduced in the programme's own tooling.
 *
 * There is no lock server. The claim is a git commit, pushed before any work begins —
 * ordinary optimistic concurrency. A rejected push means someone claimed first, so we
 * pull, re-evaluate against their now-visible claim, and choose again.
 *
 *   node scripts/start.mjs                    claim the next phase and print its brief
 *   node scripts/start.mjs --dry-run          decide and explain, claim nothing
 *   node scripts/start.mjs --phase L11        claim a specific phase (must be READY)
 *   node scripts/start.mjs --progress "…"     journal progress; do this before you stop
 *   node scripts/start.mjs --finish  --evidence-file ev.txt
 *                                             record the proof and set DONE
 *   node scripts/start.mjs --release "reason" put the phase back, status BLOCKED
 *   node scripts/start.mjs --who              what is in flight, and how stale
 *
 * Deliberately NOT automated: running the exit criterion. Exit criteria are prose, often
 * multi-part ("the script exists in all 21 repos … verified by deliberately adding one"),
 * and a regex that guessed a command out of that would report success for the wrong
 * reason — which is the failure mode this whole programme exists to eliminate. So --finish
 * requires evidence you gathered and pasted, and records it verbatim for review. It cannot
 * tell a real transcript from a fabricated one. It makes the claim auditable, not true.
 */

import { readFileSync, writeFileSync, existsSync, readdirSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { spawnSync } from "node:child_process";

const HERE = dirname(fileURLToPath(import.meta.url));
const ROOT = join(HERE, "..");
const PROGRAMME = join(ROOT, "docs", "programme");
const WORKLOG = join(PROGRAMME, "WORKLOG.md");
const SEQ = join(PROGRAMME, "01-PRIORITY-AND-SEQUENCING.md");

/** Tracks whose phases may be worked while an earlier wave is still open.
 *  01-PRIORITY-AND-SEQUENCING § 3 designates these as the sanctioned parallel work:
 *  H has its own stack and blocks nothing, K01–K04 consume calendar time engineering
 *  cannot compress, and J attaches to whatever exists. */
const PARALLEL_TRACKS = new Set(["H", "K", "J"]);

/** A claim older than this is presumed abandoned and may be reset by another agent. */
const STALE_HOURS = 72;

const argv = process.argv.slice(2);
const flag = (n) => argv.includes(`--${n}`);
const opt = (n) => {
  const i = argv.indexOf(`--${n}`);
  return i === -1 ? null : argv[i + 1];
};

const say = (s = "") => console.log(s);
const die = (msg, hint) => {
  console.error(`\nstart: ${msg}\n`);
  if (hint) console.error(`${hint}\n`);
  process.exit(1);
};

const git = (args, { allowFail = false } = {}) => {
  const r = spawnSync("git", args, { cwd: ROOT, encoding: "utf8" });
  if (r.status !== 0 && !allowFail) {
    die(`git ${args.join(" ")} failed`, (r.stderr || r.stdout || "").trim());
  }
  return { ok: r.status === 0, out: (r.stdout ?? "").trim(), err: (r.stderr ?? "").trim() };
};

const node = (args) =>
  spawnSync(process.execPath, args, { cwd: ROOT, encoding: "utf8", stdio: "pipe" });

/**
 * Identity must be unique per *working tree*, not per person. Two sessions on one machine
 * share `git config user.name`, so the first revision of this script handed session 2 the
 * phase session 1 had claimed — as a "resume". Confirmed by test: both sessions got A01.
 *
 * The working-tree path is the discriminator, because one agent per tree is the only
 * arrangement in which two agents cannot overwrite each other's files regardless of what
 * ADP does. `scripts/worktree.mjs new <slug>` creates one; that is the supported way to
 * run parallel agents. ADP_SESSION overrides for anything unusual.
 */
const agent = (() => {
  const name = git(["config", "user.name"], { allowFail: true }).out || "unknown";
  const host = process.env.COMPUTERNAME || process.env.HOSTNAME || "host";
  if (process.env.ADP_SESSION) return `${name}@${host}/${process.env.ADP_SESSION}`;
  const tree = git(["rev-parse", "--show-toplevel"], { allowFail: true }).out || ROOT;
  const slug = tree.split(/[\\/]/).filter(Boolean).pop() || "tree";
  return `${name}@${host}/${slug}`;
})();

const now = () => new Date().toISOString().replace(/\.\d{3}Z$/, "Z");

// ── the plan, read through the existing tooling so there is one parser ────────
function phases() {
  const r = node([join(HERE, "phase-brief.mjs"), "--json"]);
  if (r.status !== 0) {
    die(
      "could not read the plan",
      (r.stderr || r.stdout || "").trim() ||
        "phase-brief.mjs --json failed; run it directly to see why.",
    );
  }
  return JSON.parse(r.stdout);
}

// ── worklog ──────────────────────────────────────────────────────────────────
/**
 * One file per agent, in docs/programme/worklog/. It was a single WORKLOG.md with a shared
 * append marker, and two agents journalling concurrently edited the same line — so the
 * second one's `git pull --rebase` stopped with `UU docs/programme/WORKLOG.md` and left the
 * tree mid-rebase. Under real parallelism that happened on nearly every write.
 *
 * ARCHITECTURE_REVIEW § F4 calls the same shape in `model Tenant` "a permanent
 * merge-conflict hotspot: every new module must edit the same block." A shared append point
 * is exactly that, for agents. An agent now only ever writes its own file, so two agents
 * never touch the same bytes and git merges them without a thought.
 */
const WORKLOG_DIR = join(PROGRAMME, "worklog");
const slugify = (a) => a.replace(/[^a-zA-Z0-9._-]+/g, "-").toLowerCase();
const myLog = () => join(WORKLOG_DIR, `${slugify(agent)}.md`);

function appendLog(id, event, body) {
  const path = myLog();
  const block =
    `### ${id} · ${event} · ${now()} · ${agent}\n\n` +
    "```\n" +
    body.trimEnd() +
    "\n```\n\n";
  const header =
    `# Journal — ${agent}\n\n` +
    "> Written by `scripts/start.mjs`. Do not hand-edit. Newest block last.\n" +
    "> Protocol: [`../WORKLOG.md`](../WORKLOG.md). Aggregate view:\n" +
    "> `node scripts/start.mjs --who`\n\n";
  const existing = existsSync(path) ? readFileSync(path, "utf8") : header;
  writeFileSync(path, existing.trimEnd() + "\n\n" + block);
}

/**
 * Every block from every agent, newest first. Reads the per-agent files, and for backwards
 * compatibility any blocks still living in the original single WORKLOG.md.
 */
function logBlocks() {
  const texts = [];
  if (existsSync(WORKLOG)) texts.push(readFileSync(WORKLOG, "utf8"));
  if (existsSync(WORKLOG_DIR)) {
    for (const f of readdirSync(WORKLOG_DIR)) {
      if (f.endsWith(".md") && f !== "README.md") {
        texts.push(readFileSync(join(WORKLOG_DIR, f), "utf8"));
      }
    }
  }
  const out = [];
  for (const text of texts) {
    const re = /^### ([A-L]\d{2}[a-z]?) · (\w+) · (\S+) · (.+)$/gm;
    let m;
    while ((m = re.exec(text)) !== null) {
      const bodyStart = text.indexOf("```", m.index);
      const bodyEnd = text.indexOf("```", bodyStart + 3);
      out.push({
        id: m[1],
        event: m[2],
        at: m[3],
        agent: m[4],
        body: bodyStart === -1 ? "" : text.slice(bodyStart + 3, bodyEnd).trim(),
      });
    }
  }
  // Newest first across every agent's file — claimOf() depends on this ordering.
  return out.sort((a, b) => (a.at < b.at ? 1 : a.at > b.at ? -1 : 0));
}

const hoursSince = (iso) => (Date.now() - new Date(iso).getTime()) / 36e5;

/** The live claim on a phase: its most recent CLAIMED/RESET, unless later released or finished. */
function claimOf(id, blocks) {
  const mine = blocks.filter((b) => b.id === id);
  const last = mine[0]; // blocks are newest-first
  if (!last) return null;
  if (["RELEASED", "FINISH"].includes(last.event)) return null;
  const claim = mine.find((b) => ["CLAIMED", "RESET"].includes(b.event));
  if (!claim) return null;
  const progress = mine.filter((b) => b.event === "PROGRESS");
  const touched = progress[0]?.at ?? claim.at;
  return { ...claim, progress, touched, staleHours: hoursSince(touched) };
}

// ── wave resolution ──────────────────────────────────────────────────────────
function waves() {
  const text = readFileSync(SEQ, "utf8");
  const out = [];
  const re = /^### Wave (\d+) · "(.+?)"$/gm;
  let m;
  while ((m = re.exec(text)) !== null) {
    const seg = text.slice(m.index, text.indexOf("\n### ", m.index + 1) + 1 || undefined);
    const line = seg.split("\n").find((l) => l.startsWith("**Phases:**")) ?? "";
    const ids = new Set();
    const rangeRe = /([A-L])(\d{2})\s*[–-]\s*(?:[A-L])?(\d{2})/g;
    let r;
    let residue = line;
    while ((r = rangeRe.exec(line)) !== null) {
      for (let n = Number(r[2]); n <= Number(r[3]); n++) {
        ids.add(`${r[1]}${String(n).padStart(2, "0")}`);
      }
      residue = residue.replace(r[0], " ");
    }
    for (const id of residue.match(/\b[A-L]\d{2}[a-z]?\b/g) ?? []) ids.add(id);
    out.push({ n: Number(m[1]), claim: m[2], ids });
  }
  return out.sort((a, b) => a.n - b.n);
}

/** The lowest wave that still has unfinished work. That is "where we are". */
function currentWave(plan, ws) {
  const open = (id) => plan[id] && !["DONE", "WITHDRAWN"].includes(plan[id].status);
  for (const w of ws) if ([...w.ids].some(open)) return w;
  return null;
}

// ── selection ────────────────────────────────────────────────────────────────
function ready(plan, blocks) {
  const out = [];
  for (const [id, p] of Object.entries(plan)) {
    // BLOCKED is excluded, and that was a bug when it was not: releasing A01 as BLOCKED
    // with a reason, then running start, handed A01 straight back — which defeats the
    // entire purpose of --release and would have had an agent re-derive the same blocker
    // indefinitely. A BLOCKED phase is reachable only by naming it: `--phase A01`, which
    // is the deliberate "the blocker is cleared, try again" path.
    if (["DONE", "WITHDRAWN", "WIP", "BLOCKED"].includes(p.status)) continue;
    const unmet = p.deps.filter((d) => plan[d] && plan[d].status !== "DONE");
    if (unmet.length) continue;
    const claim = claimOf(id, blocks);
    if (claim && claim.staleHours < STALE_HOURS) continue; // someone has it
    out.push({ id, ...p, staleClaim: claim ?? null });
  }
  return out.sort((a, b) => a.id.localeCompare(b.id));
}

function select(plan, blocks, ws) {
  const wave = currentWave(plan, ws);
  const all = ready(plan, blocks);
  if (!all.length) return { wave, pick: null, all, reason: "nothing is ready" };

  const inWave = wave ? all.filter((c) => wave.ids.has(c.id)) : [];
  if (inWave.length) {
    return { wave, pick: inWave[0], all, reason: `lowest READY phase in Wave ${wave.n}` };
  }
  // Scope the fallback to waves at or before the current one. Unscoped, this handed out a
  // Wave-4 quality phase while Wave 0 was still open — breaking the wave discipline the
  // same function claims to enforce.
  const reachable = new Set(
    ws.filter((w) => w.n <= (wave?.n ?? 0)).flatMap((w) => [...w.ids]),
  );
  const parallel = all.filter(
    (c) => PARALLEL_TRACKS.has(c.id[0]) && reachable.has(c.id),
  );
  if (parallel.length) {
    return {
      wave,
      pick: parallel[0],
      all,
      reason:
        `Wave ${wave?.n} has nothing startable, so this is sanctioned parallel work ` +
        `(track ${parallel[0].id[0]} — 01-PRIORITY-AND-SEQUENCING § 3)`,
    };
  }
  return {
    wave,
    pick: null,
    all,
    reason:
      `Wave ${wave?.n} is fully blocked and no parallel-track phase is ready. ` +
      `Finish a dependency — do NOT open a later wave (README § 4).`,
  };
}

// ── preflight ────────────────────────────────────────────────────────────────
function preflight({ needClean = true } = {}) {
  const integrity = node([join(HERE, "check-plan-integrity.mjs")]);
  if (integrity.status !== 0) {
    die(
      "the plan itself is not intact — fix this before doing any work",
      (integrity.stdout + integrity.stderr).trim(),
    );
  }
  const dirty = git(["status", "--porcelain"]).out;
  if (needClean && dirty) {
    die(
      "the working tree is dirty",
      "A claim is a commit, so it cannot be made on top of unrelated changes.\n" +
        "Commit or stash first, then run start again.\n\n" +
        dirty,
    );
  }
  const fetched = git(["fetch", "--quiet"], { allowFail: true });
  if (!fetched.ok) {
    say("  ⚠ could not fetch — claims made now may collide with work you cannot see");
  }
  const branch = git(["rev-parse", "--abbrev-ref", "HEAD"]).out;

  // A claim is only a lock if other agents can SEE it. Without an upstream, the claim
  // commits locally and is invisible — the first revision of this script did exactly that
  // and then misreported the failed push as "another agent claimed first". Two agents on
  // different feature branches never saw each other at all.
  const upstream = git(["rev-parse", "--abbrev-ref", "@{upstream}"], { allowFail: true });
  if (!upstream.ok) {
    die(
      `branch "${branch}" has no upstream — a claim made here would be invisible`,
      `ADP's lock is a pushed commit. With no upstream there is nothing to push to, so
` +
        `another agent would take the same phase and neither would know.

` +
        `Either:
` +
        `  git push -u origin ${branch}      # give this branch an upstream, then start again
` +
        `  node scripts/worktree.mjs new <slug>   # the supported way to run a parallel agent

` +
        `NOTE: claims are only mutually visible between agents sharing one claim branch.
` +
        `See docs/programme/WORKLOG.md § 2 — this is ADP's known structural limit, and
` +
        `phase A27 is the fix.`,
    );
  }

  const behind = git(["rev-list", "--count", `HEAD..@{upstream}`], { allowFail: true });
  if (behind.ok && Number(behind.out) > 0) {
    say(`  pulling ${behind.out} commit(s) — never claim against a stale tree`);
    const pulled = git(["pull", "--rebase", "--quiet"], { allowFail: true });
    if (!pulled.ok) die("git pull --rebase failed", pulled.err);
  }
  return branch;
}

function commitAndPush(message, files) {
  git(["add", ...files]);
  git(["commit", "--quiet", "-m", message]);
  const sha = git(["rev-parse", "--short", "HEAD"], { allowFail: true }).out;
  const pushed = git(["push", "--quiet"], { allowFail: true });
  return { ok: pushed.ok, sha, err: pushed.err };
}

/**
 * Journal events (progress, finish, release) must reach the remote for the same reason a
 * claim must: an unpushed release leaves the phase looking claimed, and an unpushed
 * progress note is invisible to the agent that resumes. The first revision only told the
 * user to commit, which is a documented rule rather than a mechanism.
 */
function publish(id, event, files) {
  let r = commitAndPush(`chore(programme): ${event.toLowerCase()} ${id}`, files);
  if (!r.ok && /non-fast-forward|fetch first|rejected|behind/i.test(r.err)) {
    // Under any real concurrency this is the common case, not the exception: another agent
    // pushed between your last pull and now. Rebase and retry once rather than telling the
    // user to do it — a journal step that routinely fails is a journal step that stops
    // being used, and then the WORKLOG stops being true.
    say(`  another agent pushed first; rebasing and retrying…`);
    const pulled = git(["pull", "--rebase", "--quiet"], { allowFail: true });
    if (pulled.ok) {
      const pushed = git(["push", "--quiet"], { allowFail: true });
      r = { ...r, ok: pushed.ok, err: pushed.err };
    } else {
      r = { ...r, err: `rebase failed: ${pulled.err}` };
    }
  }
  if (r.ok) {
    say(`  pushed ${r.sha} — visible to every other agent.`);
  } else {
    say("");
    say(`  ⚠ commit ${r.sha} was made but the PUSH FAILED:`);
    say(`      ${(r.err || "").split(/\r?\n/)[0]}`);
    say(`    Until this is pushed, other agents cannot see it, and ${id} still reads as`);
    say(`    claimed by you. Resolve and push before you stop.`);
  }
  return r;
}

// ── --who ────────────────────────────────────────────────────────────────────
if (flag("who")) {
  const plan = phases();
  const blocks = logBlocks();
  const live = Object.keys(plan)
    .map((id) => ({ id, claim: claimOf(id, blocks), status: plan[id].status }))
    .filter((r) => r.claim);
  say(`\nIn flight (${live.length})\n`);
  if (!live.length) say("  nothing claimed.");
  for (const { id, claim, status } of live) {
    const age = claim.staleHours;
    const mark = age > STALE_HOURS ? "  ← STALE, reclaimable" : "";
    say(
      `  ${id}  ${status.padEnd(8)} ${claim.agent.padEnd(24)} ` +
        `${age.toFixed(1)}h since last note, ${claim.progress.length} progress note(s)${mark}`,
    );
  }
  say("");
  process.exit(0);
}

// ── --progress ───────────────────────────────────────────────────────────────
if (flag("progress")) {
  const note = opt("progress");
  if (!note) die("--progress needs a note: what is done, what is next");
  const plan = phases();
  const blocks = logBlocks();
  const mine = Object.keys(plan).filter((id) => {
    const c = claimOf(id, blocks);
    return c && c.agent === agent && plan[id].status === "WIP";
  });
  const id = opt("phase") ?? mine[0];
  if (!id) die("no phase claimed by you is WIP", "Run: node scripts/start.mjs");
  appendLog(id, "PROGRESS", note);
  say(`\n${id}  progress recorded.`);
  publish(id, "PROGRESS", [join("docs", "programme", "worklog")]);
  say("");
  process.exit(0);
}

// ── --release ────────────────────────────────────────────────────────────────
if (flag("release")) {
  const reason = opt("release");
  if (!reason) die("--release needs a reason — the next agent has to know why");
  const plan = phases();
  const blocks = logBlocks();
  const id =
    opt("phase") ??
    Object.keys(plan).find((k) => {
      const c = claimOf(k, blocks);
      return c && c.agent === agent && plan[k].status === "WIP";
    });
  if (!id) die("no phase to release");
  const status = opt("status") ?? "BLOCKED";
  node([join(HERE, "phase-brief.mjs"), id, "--set-status", status]);
  appendLog(id, "RELEASED", `status → ${status}\n\n${reason}`);
  say(`\n${id}  released as ${status}.`);
  publish(id, "RELEASED", [
    join("docs", "programme", "worklog"),
    join("docs", "programme", plan[id].file),
  ]);
  say("");
  process.exit(0);
}

// ── --finish ─────────────────────────────────────────────────────────────────
if (flag("finish")) {
  const plan = phases();
  const blocks = logBlocks();
  const id =
    opt("phase") ??
    Object.keys(plan).find((k) => {
      const c = claimOf(k, blocks);
      return c && c.agent === agent && plan[k].status === "WIP";
    });
  if (!id) die("no WIP phase claimed by you", "Pass --phase <ID> if you are finishing another's.");

  const file = opt("evidence-file");
  const inline = opt("evidence");
  let evidence = inline ?? "";
  if (file) {
    if (!existsSync(file)) die(`evidence file not found: ${file}`);
    evidence = readFileSync(file, "utf8");
  }
  if (!evidence.trim()) {
    die(
      "--finish requires evidence",
      "Pass --evidence-file <path> (preferred) or --evidence \"…\" containing:\n" +
        "  1. the exit-criterion command\n" +
        "  2. its output, passing\n" +
        "  3. its output when you deliberately broke the change\n\n" +
        "Item 3 is not optional. A check nobody has seen fail is not a check —\n" +
        "that is D002, D013 and D016 in docs/programme/90-DEFECT-LOG.md.",
    );
  }
  if (evidence.length < 80) {
    die(
      "that evidence is too short to be a transcript",
      "Paste the actual commands and their actual output. This is recorded verbatim\n" +
        "and reviewed; a one-liner is an assertion, not proof.",
    );
  }

  const v = node([join(HERE, "ci", "verify.mjs")]);
  const override = opt("despite-red-gate");
  let verifyNote = v.status === 0 ? "verify.mjs: PASS" : `verify.mjs: FAIL (exit ${v.status})`;

  if (v.status !== 0 && !override) {
    // Refusing, not warning. An earlier revision of this script printed "a phase is not
    // DONE over a red gate" and then set DONE anyway — a claim contradicted by the very
    // mechanism meant to enforce it, which is the defect class this programme exists to
    // eliminate. If the message says it, the code has to do it.
    die(
      "verify.mjs is red — refusing to mark this phase DONE",
      (v.stdout + v.stderr)
        .split("\n")
        .filter((l) => /✗|FAIL|error/i.test(l))
        .slice(0, 8)
        .join("\n") +
        "\n\nThree honest options:\n" +
        "  1. Fix the gate failure, then --finish again.\n" +
        '  2. node scripts/start.mjs --release "blocked on <what>"\n' +
        '  3. --despite-red-gate "<why this is legitimate>" — recorded verbatim in the\n' +
        "     WORKLOG for review. Use this only when the failure is provably unrelated\n" +
        "     (e.g. a branch-policy check on a local sandbox), never to get past a\n" +
        "     failure your own change caused.",
    );
  }
  if (v.status !== 0) {
    verifyNote +=
      `\nOVERRIDDEN with --despite-red-gate. Stated reason:\n  ${override}\n` +
      `This phase's DONE status rests on that reason being true. It is recorded here\n` +
      `so a reviewer can disagree.`;
    say(`\n  ⚠ verify.mjs is red; proceeding on the stated override. Recorded for review.\n`);
  }

  node([join(HERE, "phase-brief.mjs"), id, "--set-status", "DONE"]);
  appendLog(id, "FINISH", `${verifyNote}\n\n${evidence.trim()}`);
  say(`\n${id}  → DONE, evidence recorded in WORKLOG.md.`);
  publish(id, "FINISH", [
    join("docs", "programme", "worklog"),
    join("docs", "programme", plan[id].file),
  ]);
  say("\nRemaining, and not optional — ADP cannot do these for you:");
  say("  1. one line in docs/ai/CHANGELOG.md");
  say("  2. anything architectural you found → docs/programme/90-DEFECT-LOG.md");
  say("  3. commit your actual CODE changes — ADP pushed only the plan state, and in a");
  say("     30-repo polyrepo your code lives in repositories ADP does not touch\n");
  process.exit(0);
}

// ── default: claim and brief ─────────────────────────────────────────────────
say("\nUniERP · autonomous development protocol\n");

const DRY = flag("dry-run");
const branch = preflight({ needClean: !DRY });

let plan = phases();
let blocks = logBlocks();

// Resume before claiming. An agent that returns to an unfinished phase must not start a
// second one, and the phase it left is the phase that most needs finishing.
const resumable = Object.keys(plan).filter((id) => {
  const c = claimOf(id, blocks);
  return c && c.agent === agent && plan[id].status === "WIP";
});
if (resumable.length) {
  const id = resumable[0];
  const c = claimOf(id, blocks);
  say(`  RESUMING ${id} — you claimed it ${c.staleHours.toFixed(1)}h ago and it is still WIP.`);
  say(`  Do not start a second phase.\n`);
  if (c.progress.length) {
    say(`  ${c.progress.length} progress note(s), most recent first:\n`);
    for (const p of c.progress.slice(0, 3)) {
      say(`    [${p.at}]`);
      for (const l of p.body.split("\n")) say(`      ${l}`);
      say("");
    }
  } else {
    say("  No progress notes. Nothing is known about how far it got — re-establish state");
    say("  by running the exit criterion before assuming anything is done.\n");
  }
  say("─".repeat(78) + "\n");
  const brief = node([join(HERE, "phase-brief.mjs"), id]);
  say(brief.stdout);
  process.exit(0);
}

const ws = waves();
if (!ws.length) die("no waves found in 01-PRIORITY-AND-SEQUENCING § 4");

let chosen = null;
const forced = opt("phase");

for (let attempt = 1; attempt <= 3; attempt++) {
  const sel = select(plan, blocks, ws);

  if (forced) {
    let cand = sel.all.find((c) => c.id === forced);
    const p = plan[forced];
    if (!p) die(`no phase ${forced}`);

    // Naming a BLOCKED phase explicitly is the sanctioned "the blocker is cleared, try
    // again" path — that is the whole reason --release records WHY it was blocked. It is
    // excluded from automatic selection (see ready()), not from deliberate retry.
    if (!cand && p.status === "BLOCKED") {
      const unmet = p.deps.filter((d) => plan[d] && plan[d].status !== "DONE");
      if (!unmet.length) {
        const prior = logBlocks().find((b) => b.id === forced && b.event === "RELEASED");
        say(`  ${forced} is BLOCKED. Retrying it deliberately because you named it.`);
        if (prior) {
          say(`  It was released ${hoursSince(prior.at).toFixed(1)}h ago for this reason:\n`);
          for (const l of prior.body.split("\n").slice(0, 6)) say(`      ${l}`);
          say(`\n  If that is still true, stop now — nothing has changed.\n`);
        }
        cand = { id: forced, ...p, staleClaim: null };
      }
    }

    if (!cand) {
      const unmet = p.deps.filter((d) => plan[d] && plan[d].status !== "DONE");
      const claim = claimOf(forced, blocks);
      die(
        `${forced} is not available`,
        p.status === "DONE"
          ? "It is already DONE."
          : unmet.length
            ? `Unmet dependencies: ${unmet.join(", ")}`
            : claim
              ? `Claimed by ${claim.agent} ${claim.staleHours.toFixed(1)}h ago.`
              : `Status is ${p.status}.`,
      );
    }
    chosen = cand;
  } else {
    if (!sel.pick) {
      say(`  Wave ${sel.wave?.n ?? "?"} — "${sel.wave?.claim ?? ""}"\n`);
      die("nothing to start", sel.reason);
    }
    chosen = sel.pick;
    say(`  Wave ${sel.wave.n} — "${sel.wave.claim}"`);
    say(`  Selected ${chosen.id}: ${sel.reason}`);
    // Scope the alternatives to the current wave. Listing globally-ready phases here
    // invites an agent to pick one from a later wave, which README § 4 forbids.
    const alts = sel.all.filter((c) => c.id !== chosen.id && sel.wave.ids.has(c.id));
    if (alts.length) {
      say(
        `  Also ready in Wave ${sel.wave.n}, not taken: ` +
          alts.slice(0, 6).map((c) => c.id).join(", ") +
          (alts.length > 6 ? `, +${alts.length - 6} more` : ""),
      );
      say(`  Parallel agents: run start again — each claim is pushed, so no two collide.`);
    }
  }

  // Dependency order is not the same thing as a disjoint file set. A01 and A02 both touch
  // every repository's package.json; B01 and B02 both live in the design system's
  // components directory. ADP's lock guarantees no two agents take the same PHASE — it
  // cannot guarantee they will not collide in the same CODE. Warn, do not block: sometimes
  // the overlap is fine, and only the agent can tell.
  {
    // The Repos column is prose written for humans — "workspace, infra, all 18 with
    // `.npmrc`", "api, web, all with tests". This is a HEURISTIC over that prose, not a
    // manifest, and it is deliberately noisy rather than silent: a missed warning costs an
    // agent a merge conflict, a spurious one costs a moment's thought.
    const parse = (raw) => {
      const text = (raw ?? "").toLowerCase();
      const wide = /\ball\b/.test(text);
      const names = (text.match(/\b[a-z][a-z-]{2,}\b/g) ?? []).filter(
        (w) => !["all", "with", "and", "the", "tests", "repos", "every"].includes(w),
      );
      return { wide, names: new Set(names) };
    };
    const mine = parse(plan[chosen.id]?.repos);
    const clashes = Object.entries(plan)
      .filter(([id, p]) => id !== chosen.id && p.status === "WIP")
      .map(([id, p]) => {
        const theirs = parse(p.repos);
        const shared = [...mine.names].filter((n) => theirs.names.has(n));
        return { id, shared, wide: mine.wide || theirs.wide };
      })
      .filter((c) => c.shared.length || c.wide);
    if (clashes.length) {
      say("");
      say(`  ⚠ likely code-level overlap. The phase lock does NOT cover this — it stops two`);
      say(`    agents taking the same phase, not two phases touching the same files:`);
      for (const c of clashes) {
        say(
          `      ${c.id} is WIP and touches ` +
            (c.shared.length ? c.shared.join(", ") : "") +
            (c.wide ? `${c.shared.length ? " — and " : ""}one of you spans every repo` : ""),
        );
      }
      say(`    Coordinate, or isolate: node scripts/worktree.mjs new <slug>`);
    }
  }

  if (chosen.staleClaim) {
    say(
      `\n  ⚠ ${chosen.id} was claimed by ${chosen.staleClaim.agent} ` +
        `${chosen.staleClaim.staleHours.toFixed(0)}h ago with no note since.`,
    );
    say(`    Past the ${STALE_HOURS}h threshold, so reclaiming it and recording the reset.`);
  }

  if (DRY) {
    say(`\n  --dry-run: would claim ${chosen.id}. Nothing written.\n`);
    process.exit(0);
  }

  // The claim: status + journal + commit + push, before any work.
  node([join(HERE, "phase-brief.mjs"), chosen.id, "--set-status", "WIP"]);
  appendLog(
    chosen.id,
    chosen.staleClaim ? "RESET" : "CLAIMED",
    [
      `wave      ${sel.wave?.n ?? "n/a"}`,
      `branch    ${branch}`,
      `selected  ${forced ? "explicitly requested" : sel.reason}`,
      chosen.staleClaim
        ? `reset     previous claim by ${chosen.staleClaim.agent}, ` +
          `stale ${chosen.staleClaim.staleHours.toFixed(0)}h (threshold ${STALE_HOURS}h)`
        : null,
      "",
      "Work has NOT started. This block exists so no other agent takes this phase.",
    ]
      .filter(Boolean)
      .join("\n"),
  );

  const claimed = commitAndPush(
    `chore(programme): claim ${chosen.id}\n\n` +
      `Claimed before work begins so no other agent selects it.\n` +
      `See docs/programme/WORKLOG.md.`,
    [
      join("docs", "programme", "worklog"),
      join("docs", "programme", `${chosen.file}`),
    ],
  );

  if (claimed.ok) break;

  // Distinguish contention from a broken remote. The first revision reported every push
  // failure as "another agent claimed first", which sent an agent looking for a rival that
  // did not exist while the real cause was a missing upstream — and left a claim commit
  // sitting locally, invisible, with the phase marked WIP.
  if (!/non-fast-forward|fetch first|rejected|behind/i.test(claimed.err)) {
    die(
      "the claim could not be pushed, and not because of contention",
      `${claimed.err}\n\nClaim commit ${claimed.sha} exists LOCALLY and no other agent can\n` +
        `see it, while ${chosen.id} now reads as WIP in your tree. Resolve before working:\n` +
        `  git push                 # if the remote is reachable\n` +
        `  git reset --hard HEAD~1  # to abandon the claim`,
    );
  }
  say(`\n  Push rejected as non-fast-forward — another agent claimed first.`);
  say(`  Re-evaluating against their claim (attempt ${attempt}/3).`);
  const pulled = git(["pull", "--rebase", "--quiet"], { allowFail: true });
  if (!pulled.ok) {
    die(
      "could not rebase onto the other agent's claim",
      "Resolve manually, then run start again. Do NOT force-push a claim.\n" + pulled.err,
    );
  }
  plan = phases();
  blocks = logBlocks();
  chosen = null;
  if (attempt === 3) {
    die(
      "three agents claimed ahead of you",
      "That is contention, not a bug. Wait, or use --phase <ID> for something specific.",
    );
  }
}

say(`\n  ✓ ${chosen.id} claimed and pushed. It is yours; nobody else will take it.\n`);
say("─".repeat(78) + "\n");
const brief = node([join(HERE, "phase-brief.mjs"), chosen.id]);
say(brief.stdout);
say("─".repeat(78));
say("\nWhen you stop — whether finished or not:\n");
say(`  node scripts/start.mjs --progress "what is done, what is next"`);
say(`  node scripts/start.mjs --finish --evidence-file evidence.txt`);
say(`  node scripts/start.mjs --release "why this is blocked"`);
say("\nLeaving without one of these strands the phase: WIP forever, and the next agent");
say(`cannot tell whether anything was done. It becomes reclaimable after ${STALE_HOURS}h.\n`);
