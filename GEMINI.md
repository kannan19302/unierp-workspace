# GEMINI.md

See **[`AGENTS.md`](AGENTS.md)**. It is the single, vendor-neutral operating contract for every
coding agent on this platform, and it is kept in one place so the instructions cannot drift between
vendors.

The short version, if you read nothing else:

```bash
node scripts/phase-brief.mjs --ready     # what can be started right now
node scripts/phase-brief.mjs <PHASE_ID>  # a complete, self-contained work order
```

Do not read the 278-phase plan. Ask it for one phase. **No claim without a mechanism that can
fail** — show the command and its output, including its output when you break it on purpose.
