# AGENTS.md — how to work on UniERP

> **You are working on a production enterprise platform intended to run real businesses for a
> decade. Not a prototype, not a demo.**
>
> This file is the entry point for **every** coding agent — Claude Code, Cursor, GitHub Copilot,
> Gemini, Google Antigravity, DeepSeek, Windsurf, Aider, Codex, and whatever ships next. It is
> vendor-neutral on purpose. `CLAUDE.md` and `GEMINI.md` in this repository are pointers here.

---

## 0. Start here, literally

```bash
node scripts/start.mjs
```

That is the whole entry point. It resolves where the project is, picks the next phase, **claims it
with a pushed commit so no other agent takes it**, and prints a complete work order.

The development programme is **310 phases across 20 documents**. Reading it is not how you use it,
and an agent that reads it *partially* is worse than one that has not read it at all — it produces
work that contradicts a phase it never opened.

```bash
node scripts/start.mjs                  # claim the next phase, print its brief
node scripts/start.mjs --dry-run        # decide and explain, claim nothing
node scripts/start.mjs --phase L11      # claim a specific phase (refused if not READY)
node scripts/start.mjs --who            # what is in flight, by whom, how stale
node scripts/start.mjs --progress "…"   # before you stop. Always.
node scripts/start.mjs --finish --evidence-file ev.txt
node scripts/start.mjs --release "why blocked"
```

### The three rules of the protocol

1. **The claim is a pushed commit.** There is no lock server. `start.mjs` sets `WIP`, journals it in
   `docs/programme/WORKLOG.md`, commits and pushes **before any work begins**. If the push is
   rejected, someone claimed first — it pulls and picks again. *Its one honest limitation: an agent
   that claims offline and never pushes is invisible, and a second agent will take the same phase.*
2. **Resume before you claim.** If you already hold an unfinished phase, `start.mjs` gives you that
   one back with your progress notes. Never hold two.
3. **Never leave without journaling.** `--progress`, `--finish` or `--release`. Leaving silently
   strands the phase as `WIP` for 72 hours with nobody knowing how far it got.

### What `--finish` will not let you do

- **Mark DONE without evidence.** It requires the exit-criterion command, its passing output, **and
  its output when you deliberately broke the change**. That third item is the point.
- **Mark DONE over a red `verify.mjs`.** Fix it, `--release` it, or pass
  `--despite-red-gate "<why>"` — recorded verbatim for review, so the DONE openly rests on your
  stated reason.

If you need finer control, `node scripts/phase-brief.mjs --ready` and `--status` still work. They
have no lock, so two agents using them at once collide. Prefer `start.mjs`.

---

## 1. The rule that matters more than any other

> **No claim without a mechanism that can fail.**

This project has been burned by the opposite three times, and every one was introduced for a good
local reason:

| What was claimed | What was true |
| :--------------- | :------------ |
| `pnpm typecheck` passes | All 3,241 source files began with `// @ts-nocheck`. Three enforcement layers checked nothing. |
| Coverage is measured | `all: false`, no thresholds. It reports; it cannot fail. Still true today. |
| "Each repo's CI runs `scripts/check-layer.mjs`" | 21 repos run it behind `if: hashFiles(...)`. The script exists in **zero**. It has never executed. |

So: **do not tell anyone something works. Show the command, its output, and its output when you
break it on purpose.** A check you have not seen fail is not a check.

Corollary, and it is not negotiable: **making a gate pass by weakening the gate is the worst thing
you can do here.** `@ts-nocheck`, `eslint-disable`, `continue-on-error`, `|| true`, `--no-verify`,
`if: hashFiles(...)` on a required step, lowering a coverage threshold, adding an RLS exemption, or
softening a phase's exit criterion — all the same act. It turns a failing build into a false claim
that outlives everyone's memory of why it was made.

If a gate blocks you and you think the gate is wrong: **say so**, in the affected track file's
amendment log, with your reasoning. That is a legitimate move. Defanging it quietly is not.

---

## 2. The five things that get work rejected on sight

1. **A table without `tenantId` and an RLS policy.** PostgreSQL row-level security is the tenant
   boundary. A new table without a policy is a cross-tenant data leak, shipped.
2. **An endpoint without `@Permissions(...)`.** Written in the same commit as the endpoint, never
   "added later". Unauthorised access returns **403** — not 404, not 500.
3. **`Float` anywhere near money.** `Decimal(19,4)`, and the arithmetic must stay in Decimal —
   reading a Decimal through `Number()`, summing, and writing back is wrong on every
   recalculation.
4. **A hardcoded hex colour or `px` value.** Design tokens only. There are 7 themes and an
   orthogonal density scale; a literal value breaks both for every user.
5. **A new document to hold your notes.** Findings go in `docs/programme/90-DEFECT-LOG.md`.
   Narrative goes in `docs/ai/CHANGELOG.md`. Nothing else. A stray `NOTES.md` or `PROGRESS.md`
   fails the build and is deleted without review — that is how the previous documentation set
   reached 30,000 unread lines.

---

## 3. Build order, always

```
① MODEL     What is this thing? Which context owns it? What events does it emit?
② DATABASE  Prisma model · tenantId · indexes · migration · RLS policy
③ API       Zod DTOs · service (all logic) · controller (routing only) · outbox events
④ AUTH      Permission registered · guard applied · record-level rule · two-tenant test
⑤ UI        Schema declaration → framework-rendered list/detail/form · tokens only
⑥ TEST      Unit · tenant isolation · integration · E2E · a11y
⑦ SHIP      Gates green → changelog → docs amended → push
```

**A layer does not start until the one above it passes its tests.** A React page written before
the migration exists is a mock, not a feature — regardless of how it looks.

---

## 4. Before you touch anything

```bash
node scripts/start.mjs                          # claims a phase and prints its brief
node scripts/start.mjs --who                    # what others are holding right now
tail -5 docs/ai/CHANGELOG.md                    # what recently landed; never duplicate work
```

**Search before you build.** This platform is larger than it looks: 45 API modules, 890 web route
pages, 1,836 data models, 34,636 lines of developer-portal code. Duplicate entities are the
documented number-one failure of multi-agent work here. Assume the thing exists and go look.

---

## 5. When you are done

```bash
node scripts/ci/verify.mjs                      # or: pnpm verify — the full local gate
node scripts/start.mjs --finish --evidence-file ev.txt
node scripts/check-plan-integrity.mjs
```

Then append **one line** to `docs/ai/CHANGELOG.md`. It is the only channel between you and the next
agent, who will have no memory of this session. Work with no changelog line is invisible and gets
redone by someone else.

**Never edit the plan's tables or `WORKLOG.md` by hand.** Both are written mechanically. Hand edits
reflow markdown columns and drop cells, and `check-plan-integrity.mjs` will reject the commit.

**Report exactly five things.** Not a narrative of what you tried:

```
PHASE   the ID
STATUS  DONE | BLOCKED | WIP   (if not DONE: on what, precisely)
PROVEN  the exit-criterion command, its output, and its output when broken
BUILT   files changed, grouped by repository
DoD     the definition-of-done checklist, each line ticked or N/A with a reason
FOUND   anything architectural you noticed — filed, NOT fixed inline
```

---

## 6. The document map

You will rarely need these directly — `phase-brief.mjs` quotes the relevant parts. They are listed
so you know what exists and do not recreate it.

| Where | What |
| :---- | :--- |
| `docs/programme/README.md` | **The law of the plan folder.** Read before editing anything there. |
| `docs/programme/00-BASELINE.md` | Verified state of all 30 repos, with the command proving each claim. |
| `docs/programme/01-PRIORITY-AND-SEQUENCING.md` | Why the order is the order. The wave plan. |
| `docs/programme/02-EXECUTION-GUIDELINES.md` | Phase anatomy, definition of done, the module rubric. |
| `docs/programme/03-GAP-ANALYSIS.md` | What the original brief missed and why it matters. |
| `docs/programme/10-…-21-TRACK-*.md` | The 310 phases, in 12 tracks. |
| `docs/programme/90-DEFECT-LOG.md` | **Append-only.** Where your findings go. |
| `docs/programme/WORKLOG.md` | **Written by `start.mjs`, never by hand.** Who holds what, how far they got, and the evidence a phase was finished on. |
| `docs/ai/README.md` | The law of the governance set. Exactly ten files, forever. |
| `docs/ai/PRD.md` · `TRD.md` · `APP_FLOW.md` · `UI_UX_BRIEF.md` · `BACKEND_SCHEMA.md` | What, with what, how it flows, how it looks, how it is stored. |
| `docs/ai/IMPLEMENTATION_PLAN.md` | The layer order in § 3. |
| `docs/ai/ARCHITECTURE_REVIEW.md` | The honest scored review. Read § 3 — the parts that are good and must be defended. |
| `docs/ai/CODE_STANDARDS.md` | The standing review checklist. |
| `docs/ai/CHANGELOG.md` | Append-only. One line per change, every change. |

**The governance set outranks the programme, and both outrank your judgement.** If code
contradicts `TRD.md`, either the code is wrong or the TRD needs a logged amendment — decide
deliberately and write it down. Never let them drift silently.

---

## 7. Repository layout — 30 repos, one rule

```
L7  OPERATIONS     workspace ── infra          (orchestrate; nothing depends on them)
L6  EXTENSIONS     extensions                  (public extension API only)
L5  CLIENTS        mobile
L4  PRESENTATION   web ── console ── developer ── corporate-website
L3  SERVICE        api ── idp
L2  RUNTIME        data ── framework ── extension-api ── sandbox
L1  FOUNDATION     kernel ── design-system ── sdk ── shared ── auth ── config
L0  CONTRACT       contracts                   (depends on nothing at all)
```

> **A repository may depend only on published artifacts of a strictly lower layer. Never
> sideways. Never upward.**

| I want to… | Repository |
| :--------- | :--------- |
| Change what an endpoint returns | **contracts** first, then **api** |
| Add a table or migration | **data** |
| Change how a component looks | **design-system** (never locally in a page) |
| Add a page to the customer app | **web** |
| Add a provider-only screen | **console** |
| Add business logic | **api** |
| Build a no-code builder surface | **developer** |
| Change login | **idp** |
| Change deployment or the dev stack | **infra** |
| Change a CI gate | **workspace** — gates are shared, never copied |

**The 45 modules stay in one backend.** A stock movement posts a ledger entry; an invoice reserves
inventory. Splitting those makes a distributed transaction out of the most correctness-critical
paths in the system. Extraction is earned, one module at a time, when it demonstrates an
independent scaling or release profile. None currently does. Do not propose microservices.

---

## 8. Publishing `@unerp/*` — who may, and how

Phase A01. **The public npm registry**, scope `@unerp`, 13 publishable libraries.

| | |
| :-- | :-- |
| Registry | `https://registry.npmjs.org/` — declared in every repo's committed `.npmrc` |
| Credentials | **None stored.** npm trusted publishing (OIDC) mints a short-lived token from the workflow's own identity |
| Mechanism | `unierp-workspace/.github/workflows/publish-library.yml`, called by each library's 13-line `publish.yml` |
| Trigger | pushing a `v*.*.*` tag in a library repo; `workflow_dispatch` for a dry run |
| Authority | whoever can push a tag to a library repo. There is no separate publish credential to hold or lose |

**Not GitHub Packages, and not for preference — it cannot host this scope.** GitHub Packages
requires the npm scope to equal the account or organisation owning the repository. These
repositories are owned by the user `kannan19302`; the packages are `@unerp/*`; no `unerp`
organisation exists and the `unierp` one that does would still not match. `ROADMAP.md` had
recommended it for its existing OIDC tokens, which was wrong.

**Rules:**

- **Never commit a registry token.** Fourteen were committed once, in fourteen public
  repositories at the same time. Trusted publishing exists so there is nothing to commit.
- **Never republish a version.** npm forbids it and the workflow checks first. Bump instead.
- **Never publish a package declaring `workspace:*`.** It cannot resolve outside a workspace;
  the workflow refuses. This is what made the extracted repos uninstallable.
- **Do not inline publish steps into a library's `publish.yml`.** It declares *which* gate
  applies; the logic lives once in the reusable workflow. Copying it is D019 all over again.

## 9. Licence

AGPL-3.0, every repository, no open-core carve-out. Tenant isolation, the sandbox and the audit
trail are the parts most worth paying for, and withholding them would make the self-hosting claim
hollow. Any dependency you add must be open source — `scripts/ci/check-licenses.mjs` is the gate.
