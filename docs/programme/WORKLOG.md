# WORKLOG — the autonomous development protocol's session journal

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
>
> **This file documents the protocol. The journal itself lives in
> [`worklog/`](worklog/README.md) — one file per agent, written by `scripts/start.mjs`.
> Do not hand-edit either.**
>
> This file is the answer to *"what is in flight, who has it, and how far did they get?"* It exists
> because the programme's own rules said `WIP` is a lock and conflicts block rather than merge, and
> nothing enforced either. Two agents running `phase-brief.mjs --ready` at the same moment both
> received the same phase.

---

## 1. What this file is for

Three questions no other document in this programme could answer:

1. **Is someone already working on this?** The claim block below, plus the `WIP` status, plus the
   fact that both were pushed before work began.
2. **An agent stopped mid-phase — how far did it get?** Its `PROGRESS` blocks. The next agent
   resumes instead of restarting, which is the difference between a lock and a graveyard.
3. **Was this phase's exit criterion actually observed?** The `FINISH` block records the command
   and its output, including the output when broken. `--set-status DONE` on its own asserts
   nothing, which made status the one unverified claim in a programme built on verified claims.

## 2. How the lock works, and its one honest limitation

There is no lock server. **The claim is a git commit**, using ordinary optimistic concurrency:

```
1  fetch, and refuse to proceed on a dirty or stale tree
2  choose a phase that is READY and unclaimed
3  write status=WIP + a CLAIMED block here
4  commit and PUSH IMMEDIATELY, before any work starts
5  if the push is rejected, someone else claimed first —
   pull, re-evaluate against their now-visible claim, and choose again
```

### What ADP does and does not guarantee

Measured, not assumed. Each row below was tested with real clones and real pushes.

| Guarantee | Status |
| :-------- | :----- |
| Two agents never claim the same phase, **on the same branch** | ✅ Verified — three clones, three phases |
| Two sessions on one machine are distinguished | ✅ Verified — identity is per **working tree**, not per git user. This failed originally: session 2 was handed session 1's phase as a "resume" |
| Concurrent journal writes do not conflict | ✅ Verified — one file per agent in `worklog/`. This failed originally, leaving the tree mid-rebase |
| A claim that cannot be seen is refused, not made | ✅ Verified — a branch with no upstream is rejected before any state is written |
| Journal events reach the remote | ✅ Verified — `--progress`/`--finish`/`--release` commit, push, and rebase-retry once |
| **Two agents on different branches see each other** | ❌ **NO.** See below — this is A27 |
| **Two agents do not collide in the same code** | ⚠️ Warned only, by heuristic over a prose column — A28 |
| A `DONE` phase's evidence is true | ⚠️ Auditable, not verified. `--finish` records a transcript and refuses over a red `verify.mjs`; it cannot tell a real transcript from a fabricated one |

### The structural limitation — A27

**A claim is only visible where it is pushed.** So the lock works between agents sharing one
branch, and not otherwise. Two agents on `feat/a` and `feat/b` never see each other and will
happily claim the same phase.

The only branch every agent shares is `main` — and `scripts/ci/verify.mjs`'s own Branch policy gate
fails on `main`: *"Work lands on main through the pipeline, never by a direct push."*
**ADP's lock and the project's branch policy are therefore currently mutually exclusive.** That is
not a bug in either; it is a design gap, and pretending otherwise would be the exact
claim-without-a-mechanism this programme exists to prevent.

**Until A27 lands, ADP is correct for: one agent per working tree, all on one shared branch.**
`node scripts/worktree.mjs new <slug>` gives each agent its own tree. Running agents on separate
feature branches is *not* covered.

**And the smaller one:** an agent that claims and never pushes is invisible. `start.mjs` pushes the
claim as its first action to keep that window minimal, but offline the window is unbounded. If you
work offline, you are the lock.

## 2a. Why the journal is a directory

It was this file, with every block appended at one marker. Two agents journalling
concurrently therefore edited the same line, and the second one's `git pull --rebase`
stopped with `UU docs/programme/WORKLOG.md`, leaving the tree mid-rebase — worse than a
clean failure, and it happened on nearly every concurrent write.

`ARCHITECTURE_REVIEW § F4` names the identical shape in `model Tenant`: *"a permanent
merge-conflict hotspot: every new module must edit the same block."* A shared append point
is that, for agents.

**Each agent writes only `worklog/<agent-slug>.md`.** Two agents never touch the same bytes.
The aggregate view is `node scripts/start.mjs --who`; never read the files directly.

## 3. Block format

Written mechanically. Each is one `###` heading and a fenced body.

```
### <PHASE_ID> · <EVENT> · <ISO timestamp> · <agent>

CLAIMED    wave, why this phase was selected, the commit that claimed it
PROGRESS   what is done, what is next, anything discovered — write one before you stop
FINISH     the exit-criterion command, its output, and its output when deliberately broken
RELEASED   why the phase was put back (blocked, abandoned, superseded), and its new status
RESET      a stale claim reclaimed by another agent, with the age that justified it
```

---

## 4. Journal

The journal is in [`worklog/`](worklog/README.md), one file per agent. Read it through:

```bash
node scripts/start.mjs --who
```

Blocks written before the split to per-agent files remain below, and the tooling still
reads them.

<!-- Append new blocks above this line. Written by scripts/start.mjs — do not hand-edit. -->
