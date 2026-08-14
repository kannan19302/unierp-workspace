# 02 · EXECUTION GUIDELINES

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> This document is **how a phase is executed**. `IMPLEMENTATION_PLAN.md` is how a *feature* is
> built (Model → DB → API → Auth → UI → Test → Ship) and it is not superseded here — a phase
> usually contains several features, each of which follows that layer order.

---

## 1. Anatomy of a phase

Every phase in every track file has the same six fields. If a phase is missing one, the phase is
malformed and the integrity gate fails.

| Field | Meaning |
| :---- | :------ |
| **ID** | `<track letter><two digits>`, e.g. `C07`. Permanent, unique, never reused (`README § 0` rule 3). |
| **Phase** | What is being built, in one line, in the product's vocabulary. |
| **Repos** | Which repositories the phase touches. A phase touching more than three is probably two phases. |
| **Depends** | Phase IDs that must be `DONE` first. `—` means nothing blocks it. |
| **Deliverable** | The artefact that exists afterwards. A noun, not an activity. "Approval-chain engine", not "work on approvals". |
| **Exit** | **A command, a measurement, or an observable outcome whose failure is visible.** Not a state someone declares. |

Status is tracked in a `Status` column: `OPEN` → `READY` → `WIP` → `DONE`, plus `BLOCKED` and
`WITHDRAWN`. `READY` means every dependency is `DONE`.

### Why exit criteria are phrased as commands

`00-BASELINE § 1` is the argument, and it is worth restating because it is the discipline this
whole programme rests on. Three of the platform's guarantees became false without anyone lying:
`@ts-nocheck` made `typecheck` pass while checking nothing; `all: false` makes coverage report
while asserting nothing; `if: hashFiles(...)` makes the layer gate green while executing nothing.
In each case a *claim* outlived its *mechanism*.

An exit criterion of the form "tenant isolation is verified" is a claim. An exit criterion of the
form `node scripts/check-rls-verify.mjs exits 0, and exits 1 when a policy is dropped` is a
mechanism. **Write the second kind. Every time.**

---

## 2. Executing one phase

```
① ORIENT
   Read 00-BASELINE.md § 2 and § 7 — is the world still what the plan assumes?
   Read the phase's row, and the track file's § 1 (what the track owns).
   Read docs/ai/CHANGELOG.md tail — has someone touched this already?
   Confirm every `Depends` is DONE. If not, STOP and pick another phase.

② PROVE THE GAP
   Before building, run the exit criterion and watch it FAIL.
   A phase whose exit criterion already passes is DONE — mark it, record the
   command, move on. This step alone will close several phases in this plan.
   It also means you are never guessing whether your work mattered.

③ PLAN
   Break the phase into features. For each feature write the
   IMPLEMENTATION_PLAN § 2 layer-① answers (entity, context, lifecycle,
   events, permissions, does-it-exist, invariant) before typing code.
   Search first: duplicate entities are the top failure of multi-agent work.

④ BUILD
   Per feature, in order: ② database → ③ API → ④ auth → ⑤ UI → ⑥ test.
   No partial slices. A feature with a UI and no permission guard is not
   half done, it is a security defect that renders.

⑤ VERIFY
   Run the exit criterion. Watch it PASS.
   Run `node scripts/ci/verify.mjs` (or `pnpm verify`) — full local gate.
   Confirm the suppression ratchet went DOWN or stayed flat, never up.
   Re-run the phase's exit criterion after a deliberate break, to confirm it
   can still fail. A criterion that passes unconditionally is D013 again.

⑥ RECORD
   Flip the phase Status to DONE, with the evidence command in Notes.
   Append ONE line to docs/ai/CHANGELOG.md.
   Amend the relevant docs/ai/ master file if an interface, schema or flow changed.
   File anything architectural you noticed in 90-DEFECT-LOG.md.
   node scripts/check-plan-integrity.mjs

⑦ REPORT
   What was built · what is now PROVEN (with the command) · what is now unblocked.
   Not "what I worked on". Nobody can act on that.
```

### The one thing that is never acceptable

> **Making a gate pass by weakening the gate.**

Adding `@ts-nocheck`, `eslint-disable`, `continue-on-error`, `|| true`, `--no-verify`,
`if: hashFiles(...)` around a required step, lowering a coverage threshold, adding a table to an
RLS exemption list, or softening a phase's exit criterion — these are all the same act. It
converts a failing build into a false claim, and the false claim outlives everyone's memory of
why it was made. `00-BASELINE § 6` is a list of what that looks like eighteen months later.

If a gate blocks you and you believe the gate is wrong: say so, in the track's amendment log,
with the reasoning. That is a legitimate move. Silently defanging it is not.

---

## 3. Definition of Done — the universal checklist

A phase is `DONE` when **all** of the following hold. Not most.

> ### The exit criterion is a floor, never a ceiling
>
> A phase row's exit criterion states the **one thing specific to that phase** that must be proven.
> It is deliberately narrow, because a criterion that restated every universal rule would be
> unreadable and would rot. **This checklist is the rest of the criterion, and it applies to every
> phase in every programme without exception.**
>
> So: *"my phase's exit criterion says nothing about accessibility / tenant isolation / coverage /
> code standards"* is never a reason those do not apply. If your change touches a table, the RLS
> box applies. If it renders anything, the accessibility and token boxes apply. If it adds a file,
> the code-standards boxes apply. **The narrow criterion tells you what to prove; this list tells
> you what you may not break while proving it.**
>
> Three consequences worth stating plainly, because each has already cost this project a defect:
>
> 1. **"The exit criterion passes" is necessary and not sufficient.** `--finish` refuses over a red
>    `verify.mjs` for exactly this reason.
> 2. **A criterion you cannot make fail on purpose is not a criterion.** If you cannot construct
>    the deliberate break, say so in the evidence rather than omitting item three of the transcript.
> 3. **If the criterion is genuinely too weak to prove the phase is done, strengthen it** in the
>    track file's amendment log, with your reasoning, and say so in the evidence. Strengthening a
>    criterion is always welcome. Softening one is the single most damaging edit available here.

### Correctness
- [ ] The exit criterion command passes, and has been observed failing on a deliberate break.
- [ ] Every new table has `tenantId`, both indexes, and an RLS policy in a migration.
- [ ] `node scripts/check-rls-verify.mjs` and `check-pii-registry.mjs` pass.
- [ ] Money is `Decimal(19,4)`; no `Float` anywhere near a currency amount.
- [ ] Every endpoint carries `@Permissions(...)`; the permission is in the shared registry.
- [ ] A two-tenant test exists proving tenant B gets **zero** rows, not filtered rows.
- [ ] Unauthorised access returns **403**, not 404 and not 500.
- [ ] Cross-module effects go through the outbox, inside the same transaction. No direct
      cross-module service import.

### Completeness
- [ ] All six UI states handled: loading · empty · filtered-empty · error · forbidden · partial.
- [ ] Server-side pagination, filter and sort, `limit ≤ 100`.
- [ ] Errors are typed domain errors mapped to RFC 7807.
- [ ] The detail view shows change history; privileged controls are wrapped in
      `ProtectedComponent`.
- [ ] Breadcrumb registered; navigation descriptor updated.

### Quality
- [ ] Composed from `@kannan19302/design-system` only. A missing component is **added to the package
      with a story**, never built locally in a page.
- [ ] Design tokens only — a literal hex or `px` fails the build.
- [ ] Keyboard-complete; `axe` reports zero violations; usable at 320 px and at 200 % zoom.
- [ ] Unit coverage ≥ 80 % on touched code; **100 % on financial arithmetic**.
- [ ] Integration test covers the happy path *and every failure branch*.
- [ ] E2E test for each user-facing flow the phase introduces.
- [ ] No new `TODO`, `Coming soon`, or `not implemented` string ships. If the work is genuinely
      deferred, it is a phase, not a comment.

### Code standards — `docs/ai/CODE_STANDARDS.md`, enforced by gate

Each of these is a real script in `scripts/`, not a request. **Run them; do not assume the
umbrella `verify` covers your change** — `D013` is what assuming looks like: a gate wired into 21
repositories whose script existed in none, so it had never run once.

- [ ] `check-naming-convention.mjs` — § 3. Names say what the thing is, in the business's words.
- [ ] `check-1000-line-ceiling.mjs` — § 4. No non-generated file over 1,000 lines without an entry
      in `L10-EXEMPTION-LIST.md` justifying that specific file.
- [ ] `check-controller-decomposition.mjs` and `check-service-decomposition.mjs` — § 5.1.
      Controllers route; services hold logic; neither becomes a god object.
- [ ] `check-layer.mjs` and `check-module-boundaries.mjs` — § 5.2 and § 5.3. No upward import, no
      direct cross-module service import.
- [ ] `check-error-handling.mjs` — § 6.1. Typed domain errors with registry codes. A swallowed
      exception, a bare `catch {}`, or a raw constraint violation reaching a user is a failure.
- [ ] `check-duplication.mjs` — § 5.1. The third copy is a refactor, not a paste.
- [ ] `check-todo-discipline.mjs` — § 7. Deferred work is a phase, never a comment.
- [ ] `check-hardcoded-strings.mjs` — user-facing text is content or a message key, never a literal.
- [ ] `check-test-quality.mjs` and `check-bugfix-test-discipline.mjs` — § 8. A test asserts
      behaviour; a coverage-padding test is a defect (`D016`). Every bug fix ships its regression
      test in the same commit.
- [ ] `check-migration-discipline.mjs` and `check-schema-lints.mjs` — migrations forward-only and
      immutable once shipped; schema lints clean.
- [ ] `check-orphaned-exports.mjs` — nothing exported that nothing imports.
- [ ] § 2.4 **scope discipline**: this phase and nothing else. An adjacent defect you noticed is
      filed in `90-DEFECT-LOG.md`, not fixed here.

### Discipline
- [ ] `pnpm verify` green locally; CI green server-side.
- [ ] Suppression ratchet flat or down.
- [ ] One line appended to `docs/ai/CHANGELOG.md`.
- [ ] Master docs amended if an interface, schema or flow changed.
- [ ] `node scripts/check-plan-integrity.mjs` passes.
- [ ] Clean `git status` — no scratch scripts, no error dumps, no `*.log`. (D006 is what
      violating this looks like: eleven repair scripts still tracked at a repo root.)

---

## 4. Multi-agent operating rules

This programme assumes several agents, in separate sessions, with no shared memory. These rules
exist because that is the situation, not because process is virtuous.

1. **One agent, one track, one session.** Tracks are separable on purpose. Two agents in the same
   track file will conflict on the status table.
2. **Announce by commit, coordinate by CHANGELOG.** There is no other channel. Before starting,
   read the tail of `docs/ai/CHANGELOG.md`; it is the only way to know what is in flight.
3. **`WIP` is a lock.** Do not pick up a phase marked `WIP`. If it has been `WIP` across an
   obviously long gap and the tree shows no related work, flip it to `READY` and note the reset in
   the track's amendment log. Do not silently steal it.
4. **Never create a document to hold your findings.** Findings go in `90-DEFECT-LOG.md`; progress
   goes in the phase's Status; narrative goes in `docs/ai/CHANGELOG.md`. A new `NOTES.md` is
   deleted without review (`README § 0` rule 1). This is how the previous documentation set reached
   30,000 unread lines.
5. **Search before you build.** Every track file names its repos; `00-BASELINE § 4` says what
   already exists there. `unierp-developer` is 34,636 lines — assuming a builder does not exist is
   how you get a second one.
6. **Do not fix what you find, unless it blocks you.** An architecture defect discovered
   mid-phase is filed, not fixed. Opportunistic fixes scattered across a phase are unreviewable
   and unattributable, and they are how scope becomes unbounded.
7. **Prefer finishing to starting.** A wave with twelve `WIP` phases and no `DONE` ones is worse
   than one with three `DONE`. Depth is the product; breadth is already there (890 pages).

---

## 5. The module completeness rubric

Track E's 42 phases audit 45 modules. They audit against **this** rubric, scored 0–3 per row.
It is defined once, here, so that 45 audits are comparable and so that "next level" has a meaning
independent of whoever is judging.

| # | Dimension | 0 | 1 | 2 | 3 |
| :- | :-------- | :- | :- | :- | :- |
| 1 | **Data model** | Entities missing | Core entities exist | Full graph, correct relations | Graph + history + soft-delete + retention class |
| 2 | **Lifecycle** | No states | Status field | Enforced state machine | State machine + guards + reversal/correction path |
| 3 | **Authorisation** | No guard | Endpoint guards | Guards + record-level rules | + field-level masking + delegation |
| 4 | **Approvals** | None | Hardcoded approver | Configurable chain | Chain + delegation + escalation + SLA + audit |
| 5 | **CRUD depth** | List only | List + create | + edit, detail, delete | + bulk ops, duplicate, merge, import, export |
| 6 | **Validation** | Client only | Server Zod | Shared Zod, both sides | + cross-entity business rules + dry-run preview |
| 7 | **Events** | None | Emits | Outbox, transactional | + consumers, replay, dead-letter handling |
| 8 | **Reporting** | None | One list export | Standard report set | + ad-hoc builder, scheduled delivery, drill-through |
| 9 | **Documents** | None | HTML print | Templated PDF | + branded, localised, e-sign, attachment lifecycle |
| 10 | **Integrations** | None | Manual CSV | Documented API | + connectors, webhooks, idempotent replay |
| 11 | **Settings** | Hardcoded | Some config | Conforms to the D13–D22 contract | + scoped tenant→app→user→device, versioned, audited |
| 12 | **UI states** | Happy path | + loading, error | All six states | + optimistic updates, offline, conflict resolution |
| 13 | **Accessibility** | Untested | Keyboard mostly | axe-clean, keyboard-complete | + screen-reader script passed, 200 % zoom, 320 px |
| 14 | **Tests** | Some units | Units + isolation | + integration + E2E | + property/mutation tests on the domain invariants |
| 15 | **Performance** | Unmeasured | Indexed queries | p95 < 300 ms measured | + verified at 10× data volume, no N+1 |
| 16 | **Client parity** | Web only | Web + read-only mobile | Web + mobile + desktop | + offline-capable where the job requires it |

**A module is "next level" at ≥ 2 on every row and ≥ 3 on rows 1, 2, 3, 7 and 14.** Those five are
the ones where being wrong is unrecoverable: the data model, the lifecycle, who may act, what
was emitted, and whether any of it is proven.

Score with evidence, not impression. The score goes in the E-track phase's Notes column.

---

## 6. Working with the defect log

`90-DEFECT-LOG.md` is append-only and is the only sanctioned place for "I found something".

```
Severity  Meaning                                          Response
────────  ───────────────────────────────────────────────  ──────────────────────────────
Critical  Tenant data leak · auth bypass · RCE ·           Stop the current phase. Fix now.
          a gate that silently does not run                Becomes a Wave-0 phase.
High      Correctness or financial-integrity risk ·        Fix within the current wave.
          a stated exit criterion that is not met
Medium    Misleading documentation · maintainability ·     Becomes a phase in the owning track.
          hygiene · duplicated mechanism
Low       Cosmetic · stale prose · nice-to-have            Batched into a cleanup phase.
```

**A defect needs a reproduction.** The command, the file and line, and what you observed. `§ F5`
of the architecture review moved from "theoretical drift risk" to "364 unprotected tables" purely
because someone measured it — that is the difference between a finding and a worry.

---

## 7. Anti-patterns — automatic rejection

Inherited verbatim in spirit from `IMPLEMENTATION_PLAN § 11`, extended with what this audit found:

| Anti-pattern | Why it is rejected |
| :----------- | :----------------- |
| UI before API before database | Produces a mock, not a feature |
| `@ts-nocheck` / `@ts-ignore` / `eslint-disable` | Disables the guarantee the gate exists to provide |
| `--no-verify`, `continue-on-error`, `\|\| true` | Turns a blocking gate into a decoration |
| **`if: hashFiles('<gate>') != ''` on a required step** | **The gate passes by being absent. This is D013 — 21 repos, zero executions.** |
| **`all: false` or a missing `thresholds` block in a coverage config** | Coverage that reports but cannot fail is a number with no owner (D002) |
| **Softening a phase's exit criterion** | Converts a failing build into a false claim that outlives its author |
| Endpoint without `@Permissions` | Security defect, shipped |
| Table without `tenantId` + RLS | Tenant-isolation breach, shipped |
| Direct cross-module import | Destroys the module boundary permanently |
| Hardcoded hex or px | Breaks theming and density for every user |
| Hand-rolled `<table>` | Loses sorting, pagination, a11y and consistency — and is the symptom of B being incomplete |
| Building a component locally instead of in the design system | Guarantees 500 divergent variants |
| `Float` for money | Silent financial corruption |
| New file in `docs/ai/` or in `docs/programme/` | Fragments the source of truth |
| Rewriting or renumbering a plan document | Destroys the only institutional memory this project has |
| Work with no CHANGELOG entry | Invisible to every future agent; gets duplicated |
| A one-off repair script committed at a repo root | D006 — eleven of them, still tracked |
| Committing a secret | Immediate rotation + incident. It has happened once here, in 14 repos. |

---

## 8. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Established. Phase anatomy, execution loop, universal DoD, multi-agent rules, the 16-row module completeness rubric, defect severities, extended anti-pattern table. | Claude Code |
