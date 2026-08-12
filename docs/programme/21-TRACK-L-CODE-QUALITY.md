# TRACK L · CODE QUALITY, MAINTAINABILITY AND STANDARDS — L01–L20

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> **Waves 0–1 for enforcement, then continuous.** Added 2026-08-07, after the programme's first
> review found that `CODE_STANDARDS.md` was the one governance document the plan under-used.

---

## 1. What this track owns

The **legibility and changeability** of ~660,000 lines of code, to a human and to an agent.
Enforcement of `docs/ai/CODE_STANDARDS.md` — which is an excellent document that is largely
unenforced — plus the specific structures that currently defeat both readers.

**The invariant this track establishes:**

> **Every standard in `CODE_STANDARDS.md` that can be a machine check is one.**

That is not this track's idea. It is `CODE_STANDARDS § 10` verbatim: *"Discipline does not scale
across a decade and a rotating cast of agents. Everything that can be a machine check must be
one."* That section then lists five standards as `⏳ To add — R13` and defines R13 as a phase. **R13
was never implemented and appeared nowhere in this programme until this track existed** (**D018**).

### Why this track was missing, and what that cost

The original 278 phases enforced *correctness* (tenancy, authorisation, money, events) and
*testing* thoroughly. They enforced *maintainability* only incidentally — A03 split the schema,
A14 removed scratch files — and `ARCHITECTURE_REVIEW` scored maintainability **3.5/10** for two
reasons, of which the plan addressed one:

| `§ 14`'s cause | Addressed? |
| :------------- | :--------- |
| A 40,577-line schema | Yes — A03/A04 |
| An 8,283-line controller | **No phase existed.** It is 8,282 lines today; the limit is 300 |

Measuring properly turned up worse. `CODE_STANDARDS § 4` states *"Nothing in this codebase
justifies 1,000+ lines"* — **86 non-test files exceed it** (**D017**). And 70 % of the test suite by
volume consists of tests that cannot fail (**D016**), in a pattern `CODE_STANDARDS § 8` forbids in a
sentence written about a file still in the tree.

**The lesson for the whole programme:** a standards document with no gate behind it decays exactly
as fast as any other claim. This is the same failure as D002 and D013 — a claim outliving its
mechanism — applied to the one document whose entire purpose is preventing decay.

**Depends:** A01–A02. **Blocks:** **A06 (via L11–L12)** — see § 6.

---

## 2. Stage L-I · Make the standards enforceable — R13 (Wave 0)

Every phase here applies to **new and modified files only**, ratcheted, so existing violations do
not block work on 660,000 lines. `CODE_STANDARDS § 4` already specifies this approach; the
baseline is recorded and may only fall.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **L01** | Size and complexity gate | A02 | ESLint `max-lines`, `max-lines-per-function`, `complexity`, `max-depth`, `max-params` configured to the `CODE_STANDARDS § 4` table, with a recorded baseline per rule | Adding a 501-line service, an 81-line function, a complexity-16 branch, 5-deep nesting or a 6th parameter fails CI. Baseline recorded (86 files over the 1,000-line ceiling, largest 8,282) and may only fall (**D017**) | DONE |
| **L02** | Naming convention gate | A02 | `@typescript-eslint/naming-convention` encoding `CODE_STANDARDS § 3` | A violation of the documented naming scheme fails CI on a new or modified file. Baseline recorded | DONE |
| **L03** | Silent-catch and error-handling gate | A02 | `no-empty` plus a custom rule: no catch that swallows, no `catch {}`, no re-throw that loses the cause, per `CODE_STANDARDS § 6.1` | An empty or swallowing catch fails CI. Every caught error is either handled, wrapped with its cause, or re-thrown — verified by breaking one | DONE |
| **L04** | TODO discipline gate | A02 | A custom rule requiring every `TODO` to carry an issue reference and an owner, per `CODE_STANDARDS § 7` | A bare `TODO` fails CI. The 15 existing markers are each converted into a phase, an issue, or deleted | DONE |
| **L05** | Dead-code and unused-export gate | A02 | Detection of unreachable code, unused exports, orphaned files and unused dependencies across all 30 repos | A newly orphaned export fails CI. The existing inventory is published and ratcheted down. An orphaned file in a polyrepo is invisible to a single-repo view, which is why this is a family-wide gate | DONE |
| **L06** | Duplication gate | A02 | Copy-paste detection with a threshold, tuned to flag genuine duplication rather than incidental similarity | Duplicating a 40-line block across modules fails CI. Baseline recorded and ratcheted. High-duplication clusters become L07–L10 work items | DONE |

---

## 3. Stage L-II · The structures that defeat readers (Wave 1)

`CODE_STANDARDS § 4`: *"An AI agent's usable context is finite. A file it cannot load alongside the
code it must integrate with is a file it will modify blindly."* That is the whole argument for this
stage — it is not tidying.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **L07** | Decompose the oversized controllers | L01 | `advanced-finance.controller.ts` (**8,282 lines**, against a 300-line limit and a 400 hard ceiling) and every peer split by resource, with routing-only bodies | No controller exceeds 400 lines. `grep -c 'if' ` on any controller returns 0 — a controller containing an `if` holds logic that belongs in a service (`IMPLEMENTATION_PLAN § 4`). Behaviour proven unchanged by the existing endpoint tests | DONE |
| **L08** | Decompose the oversized services | L01, L06 | Every service over the 800-line hard ceiling split along genuine responsibility lines, not arbitrarily. `inventory.service.ts` is 3,989 lines | No service file exceeds 800 lines. Each extracted unit has a single stated responsibility and its own tests. **A split that only moves lines is rejected** — the exit is fewer responsibilities per file, not more files | DONE |
| **L09** | Decompose the oversized pages | L01, B01–B12 | Web pages over the 300-line React ceiling extracted into sub-components and hooks — `connect/page.tsx` is 6,651 lines against a 200-line limit | No page component exceeds 300 lines. Extracted components that are reusable land in `unierp-design-system` with stories, not locally (which is the rule B exists to make possible) | DONE |
| **L10** | Close the 1,000-line ceiling | L07–L09 | The remaining files over the absolute ceiling brought under it, or given a written, individually-justified exemption | **Zero** non-generated files over 1,000 lines, or an exemption list where every entry names why that file is the exception. Currently 86 (**D017**) | DONE |

---

## 4. Stage L-III · Test quality (Wave 0–1) — blocks A06

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **L11** | Quantify and quarantine the coverage padding | — | A published inventory of the 69 `*.coverage.spec.ts` files, per-file: `it()` count, always-passing count, and what real coverage remains if they are deleted | The inventory exists. Real coverage is measured **with the padding removed** — that number, not the current one, is the honest baseline for A06's threshold (**D016**) | DONE |
| **L12** | Delete the tests that cannot fail | L11 | Every `try { … expect(result).toBeDefined() } catch (e) { expect(e).toBeDefined() }` block removed. Where the method is genuinely worth testing, replaced with a test that asserts behaviour and fails when the behaviour changes | `grep -rn 'expect(e)\.toBeDefined' --include='*.spec.ts' .` returns **0** (currently 1,083 across 1,176 `it()` blocks). Every surviving test in those files fails when its subject is deliberately broken | DONE |
| **L13** | Remove the CI test exclusion | L12 | `*.coverage.spec.ts` no longer excluded when `process.env.CI` — the whole suite runs everywhere it runs | `vitest.config.ts` has an identical `exclude` list in CI and locally. The CI test count equals the local test count, asserted | DONE |
| **L14** | Test-quality gate | L12, L13 | A gate rejecting the always-passing patterns as a class: assertion-free `it()` blocks, `toBeDefined()` as the sole assertion, catch-anything assertions, and skipped tests without an issue reference | Adding an assertion-free test fails CI. Adding `catch (e) { expect(e).toBeDefined() }` fails CI. **This is the gate whose absence allowed 194,494 lines of it** | DONE |
| **L15** | Bug-fix regression discipline | L14 | Enforcement of `CODE_STANDARDS § 8`: every bug fix ships with a test that failed before it and passes after | A fix commit without an accompanying test is flagged in review, and the changelog line names the test. This is how a bug becomes permanently dead rather than seasonal | DONE |

---

## 5. Stage L-IV · Agent legibility and review discipline (Waves 1–2)

The programme is executed by agents in short sessions with no shared memory. That is a hard
constraint on how the code must be organised, and it is what `ARCHITECTURE_REVIEW`'s
"agent-legibility" score was measuring.

| ID | Phase | Depends | Deliverable | Exit | Status |
| :- | :---- | :------ | :---------- | :--- | :----- |
| **L16** | Context-window budget per unit of work | L10, A03 | A stated, measured budget: the files an agent must load to safely change one module fit in a working context — module code, its schema slice, its contracts, its tests | For each of the 45 modules, the "must load to change this safely" set is measured and under budget. A module that exceeds it is a decomposition task, not a documentation task | DONE |
| **L17** | Module orientation documents | L16 | One short document per module: what it owns, its entities, its events, its permissions, its invariants, and what must never happen to it — generated from code where possible so it cannot drift | Every module has one. A module whose orientation document contradicts its code fails the documentation-truth gate (A12). No hand-maintained duplication of what code already states | DONE |
| **L18** | Generated architecture and dependency maps | A07, L05 | Machine-generated, always-current maps: repo layer graph, module dependency graph, event flow, permission matrix | Each map regenerates in CI and a stale committed copy fails the build. This replaces prose that describes structure — the class of claim that produced D004 and D013 | DONE |
| **L19** | Automate the § 9 review checklist | L01–L06 | Every mechanisable row of `CODE_STANDARDS § 9.1` (blocking) and `§ 9.2` (quality) converted to a check; `§ 9.3` (maintainability judgement) left explicitly to review, with the split documented | `CODE_STANDARDS § 10`'s table has **no `⏳` rows left** — every entry is either ✅ Active or explicitly 🔍 Review-only with a stated reason why it cannot be mechanised | DONE |
| **L20** | Refactoring safety net | L07–L10, J09 | `CODE_STANDARDS § 11` made operable: behaviour-preserving refactors proven by tests that exist *before* the refactor, with mutation testing on the touched paths | A decomposition in L07–L10 is provably behaviour-preserving — the pre-existing tests pass unchanged, and mutation score on the touched code does not fall | OPEN |

---

## 6. The dependency this track corrects

**A06 (coverage gate) must not close before L11–L12.** This was missing from the plan as first
written and is the most consequential sequencing error found in its first review.

```
Turning on an 80 % coverage threshold while 69 files of always-passing tests exist
means the threshold is satisfied by 1,083 assertions of the form

    catch (e) { expect(e).toBeDefined() }

which is a WORSE outcome than today's absent gate — today's gate claims nothing,
whereas that one would claim 80 % and be believed.
```

`CODE_STANDARDS § 8` states the principle already: *"A 23,000-line test file that raises a
percentage without asserting behaviour is worse than no test — it buys false confidence at the cost
of maintenance."* The file it describes is 23,285 lines and still present.

**Order: L11 → L12 → L13 → A06 → L14.** Measure the honest coverage, delete the padding, run
everything everywhere, *then* set a threshold against the real number, then gate the pattern so it
cannot return.

---

## 7. Track exit criteria

- [ ] `CODE_STANDARDS § 10`'s enforcement table has zero `⏳ To add` rows — R13 is done (**D018**)
- [ ] No controller over 400 lines; no controller containing an `if` (largest is 8,282 today)
- [ ] No service over 800 lines; no page component over 300
- [ ] **Zero** non-generated files over 1,000 lines, or an individually justified exemption list
- [ ] `grep -rn 'expect(e)\.toBeDefined' --include='*.spec.ts' .` → **0** (1,083 today)
- [ ] CI's test exclusion list is identical to the local one; the test counts match
- [ ] An assertion-free or catch-anything test fails CI
- [ ] Coverage thresholds are set against coverage measured *without* padding
- [ ] Size, complexity, naming, silent-catch, TODO, dead-code and duplication gates all block, and
      **each has been observed failing** on a deliberate violation
- [ ] Every ratchet baseline in this track has fallen from its recorded starting value
- [ ] Every module's "must load to change safely" file set is measured and under budget
- [ ] Architecture and dependency maps are generated; a stale committed copy fails CI

---

## 8. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Track established, 20 phases, in response to the programme's first review question. `CODE_STANDARDS.md` was the one governance document the original 278 phases under-used: its § 10 defines R13 (size, complexity, naming, silent-catch, TODO gates) and no phase covered it, its § 4 1,000-line ceiling is violated by 86 files with nothing enforcing it, and its § 8 prohibition on coverage-padding tests was written about a 23,285-line file still in the tree. Records the A06 ← L11/L12 dependency the original plan missed. | Claude Code |
