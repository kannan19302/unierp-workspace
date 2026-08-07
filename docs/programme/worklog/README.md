# worklog/ — one journal file per agent

> Part of [the UniERP Development Programme](../README.md). **Written by
> `scripts/start.mjs`. Do not hand-edit, and do not add files here yourself.**

## Why this is a directory and not one file

It was one file. `WORKLOG.md` appended every block at a single marker, so two agents
journalling concurrently edited the same line, and the second one's `git pull --rebase`
stopped with `UU docs/programme/WORKLOG.md` — leaving the tree mid-rebase, which is worse
than a clean failure. Under any real parallelism that happened on almost every write.

It is the same defect the programme criticises elsewhere: `ARCHITECTURE_REVIEW § F4` calls
`model Tenant` *"a permanent merge-conflict hotspot: every new module must edit the same
block."* A shared append point is that, for agents.

**Each agent writes only `<agent-slug>.md` — its own file — so two agents never touch the
same bytes.** Git merges distinct files without a thought.

## Reading the journal

Do not read these files directly; the tooling aggregates them:

```bash
node scripts/start.mjs --who              # what is claimed, by whom, how stale
node scripts/phase-brief.mjs --status     # progress per track
```

Block format and the protocol itself are documented in [`../WORKLOG.md`](../WORKLOG.md).

## The one thing still shared

A phase's `Status` cell lives in its track file, and two agents claiming different phases
edit different *lines* of it — which git merges cleanly. Two agents claiming the **same**
phase is what the pushed-claim lock prevents. See `../WORKLOG.md § 2` for the limits.
