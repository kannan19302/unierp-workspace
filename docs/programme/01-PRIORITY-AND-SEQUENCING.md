# 01 · PRIORITY AND SEQUENCING

> Part of [the UniERP Development Programme](README.md). Read `README.md § 0` before editing.
> This document decides **what order the 310 phases happen in, and why**. The brief listed ten
> objectives; it did not rank them. This is the ranking, with the reasoning, so that a future
> agent can disagree with it deliberately instead of reordering it by accident.

---

## 1. The ranking principle

Three questions, applied in order, decide every priority in this programme:

```
① Does anything else become UNSAFE if this is late?      → do it first
② Does anything else become UNBUILDABLE if this is late? → do it second
③ Does anything else become UNSELLABLE if this is late?  → do it third
```

Everything else is fourth, however visible it is.

**This is deliberately not "customer value first".** The usual advice — ship the thing users see —
is right for a product with a working foundation. It is wrong here, and `00-BASELINE.md § 2` is
the argument: three of the platform's guarantees are currently asserted by mechanisms that do not
run. Building 310 phases of feature work on top of that means every one of them is unverified,
and the cost of discovering that later scales with how much was built in the meantime. A platform
that holds payroll and patient records does not get to defer this.

**The corollary, which matters just as much:** Track A is finite. It is 31 phases, not a
programme. It is not permission to spend a year on infrastructure. Its exit condition is
precisely "every claim the platform makes is checked by something that can fail", and then it
stops.

---

## 2. Priority ranking of the brief's ten objectives

The brief's numbering was a list, not an order. Here is the order, with the objective it came
from:

| Rank | Objective | Track | Why here |
| :--- | :-------- | :---- | :------- |
| **1** | *(not in the brief)* Foundation proof, packaging, release, tenancy correctness | **A** | ① Unsafe if late. Nothing below can be *believed* without it, and D013 means the topology itself is currently unverified. Also the only track that unblocks the others' CI. |
| **2** | ③ Design system to enterprise grade | **B** | ② Unbuildable if late. Every screen in C, D, E, F, G, H, I is built from it. Building 500 screens against 14 primitives means hand-rolling components 500 times and re-doing them once B lands. **Highest leverage in the programme.** |
| **3** | *(not in the brief)* Code quality, maintainability, standards enforcement | **L** | ② Unbuildable if late, in the literal sense: `CODE_STANDARDS § 4` argues that a file an agent cannot load alongside the code it must integrate with is a file it will modify blindly, and 86 files exceed that ceiling. L11–L13 additionally **block A06** — see § 4a. Cheap, mechanical, and it compounds over every remaining phase. |
| **4** | ⑩ Testing, all disciplines | **J** | ① Unsafe if late, and it must run *alongside* everything, not after. J01–J08 land early as gates; J09–J26 accumulate as each surface arrives. A test discipline retrofitted at the end tests what was built, not what was required. |
| **5** | ① SaaS platform admin console | **C** | ③ Unsellable if late — and it is the largest single gap (`00-BASELINE § 4①`). You cannot operate a multi-tenant platform without it: no provisioning, no impersonation, no billing correction, no incident response. Its backend already exists, so it is unusually cheap for its value. |
| **6** | ⑧ + ⑨ Tenant SaaS portal and per-app settings | **D** | ③ The first thing a paying tenant administrator touches. Also defines the settings contract that all 45 modules in E must conform to — so it precedes E for a structural reason, not just a commercial one. |
| **7** | ④ All apps to genuine depth | **E** | ③ The product itself, and the largest track (42 phases). Deliberately *not* first: 890 pages already exist, so this is a depth-and-audit problem, and auditing 45 modules against a rubric that B and D have not yet defined means auditing twice. |
| **8** | ⑥ + ⑦ Developer platform and console | **G** | ③ The differentiator versus Salesforce, and the platform's long-term moat. Gated on **A16** (sandbox hardening) for a hard safety reason: shipping a builder before the isolate is proven means shipping tenant-authored code with unknown reach. |
| **9** | ⑤ Tenant website templates and Studio | **F** | ③ Real revenue surface, near-greenfield (`00-BASELINE § 4⑤`). Depends on B for components and G for the builder runtime, so it cannot lead. |
| **10** | ② Marketing site and its admin | **H** | ③ Genuinely important — it is how anyone finds the product — but it is plane 0, isolated, already the most complete surface relative to its scope, and blocks nothing. Its admin depth (H09–H18) is the part that matters and can run in parallel throughout. |
| **11** | ③(part) Mobile and desktop parity | **I** | ④ Cannot meaningfully precede B's cross-client token work (**B18–B24**) or E's module depth. Parity with an incomplete thing is wasted twice. |
| **12** | *(not in the brief)* Billing, compliance, support, localisation, launch | **K** | ④ Last in *sequence*, but several phases are long-lead: legal review, SOC 2 evidence collection and a DPA template take calendar time regardless of engineering, so **K01–K04 start in Wave 1** and run in the background. |

---

## 3. The dependency graph

Solid arrows are hard blocks. A phase may not start until every upstream track's named phase is
`DONE`.

```
                          ┌──────────────────────────────────────────┐
                          │  A · FOUNDATION  (A01–A31)               │
                          │  registry · gates · release · sandbox    │
                          └───┬──────────┬──────────┬────────────┬───┘
                              │          │          │            │
              A01,A02 ────────┤          │          │            │
              (packages       │          │          │            │
               resolve)       ▼          │          │            │
                    ┌───────────────┐    │          │            │
                    │  B · DESIGN   │    │          │            │
                    │  (B01–B24)    │    │          │            │
                    └───┬───┬───┬───┘    │          │            │
                        │   │   │        │          │            │
        B01–B12 ────────┤   │   └────────┼──────┐   │            │
       (primitives)     │   │            │      │   │            │
                        ▼   ▼            ▼      │   ▼            ▼
                 ┌────────┐ ┌────────┐ ┌──────┐ │ ┌──────┐  ┌────────┐
                 │ C ·    │ │ D ·    │ │ H ·  │ │ │ K ·  │  │ J ·    │
                 │ CONSOLE│ │ TENANT │ │ MKTG │ │ │ OPS  │  │ QUALITY│
                 └────┬───┘ └───┬────┘ └──────┘ │ └──────┘  └────────┘
                      │         │               │      ▲          ▲
                      │    D13–D22 (settings    │      │          │
                      │     contract)           │      │      runs alongside
                      │         │               │      │      every track
                      │         ▼               │      │
                      │    ┌─────────┐          │      │
                      └───▶│ E · APPS│          │      │
                           │(E01–E47)│          │      │
                           └────┬────┘          │      │
                                │               │      │
              A16 (sandbox) ────┼───────────────┘      │
                                ▼                      │
                           ┌─────────┐                 │
                           │ G · DEV │─────────────────┘
                           │(G01–G30)│
                           └────┬────┘
                                │  G09–G18 (builder runtime)
                                ▼
                           ┌─────────┐        ┌─────────┐
                           │ F · SITE│        │ I ·     │
                           │(F01–F26)│        │ CLIENTS │
                           └─────────┘        └─────────┘
                                                   ▲
                                        B18–B24 ───┘  (cross-client tokens)
                                        E depth ──────┘
```

### The five hard blocks, stated plainly

| Block | Why it cannot be bypassed |
| :---- | :------------------------ |
| **A01–A02 → everything** | Until `@kannan19302/*` resolves from a registry CI can reach, no repo has a reproducible clean install and no container build is trustworthy. Work done before this is work built on an unverifiable dependency tree. |
| **B01–B12 → C, D, E, F, H screens** | 14 primitives cannot express an ERP. Every screen built before the primitives exist hand-rolls a table, a tab set and a toast, and every one of those is thrown away later. |
| **D13–D22 → E** | The per-app settings contract must exist before 45 modules each declare settings, or you get 45 settings dialects. |
| **A16 → G, and G09–G18 → F** | The sandbox is what stands between tenant-authored code and every other tenant's data (`00-BASELINE § 4⑥`, D009). Shipping builders first ships that risk. F's page runtime is G's runtime; building it twice is the only alternative. |
| **B18–B24 + E → I** | Client parity with an incomplete design system and incomplete modules must be redone. |
| **L11–L13 → A06** | A coverage threshold set over 194,494 lines of tests that cannot fail launders the corruption into an 80 % figure that gets believed. See § 4a. |
| **L01, L07–L10 → E** | `CODE_STANDARDS § 4`: an agent cannot safely change a file it cannot load alongside its dependencies. Auditing 45 modules against a rubric while an 8,282-line controller and 86 over-ceiling files remain means auditing code nothing can read. |

### What deliberately has no block

**H (marketing)** depends on nothing but B, and even that loosely — it has its own stack and its
own database by design. **K01–K04** (legal, DPA, SOC 2 scoping, licence audit) depend on nothing
technical and take calendar time, so they start immediately. **J** attaches to whatever exists.
These three are the parallelism in the plan; use them when a wave is blocked.

---

## 4. The wave plan

A wave is a coherent, shippable increment with a **single** headline claim. The claim is what you
would be able to say truthfully at the end, and nothing more.

### Wave 0 · "Every gate we claim can fail"

**Phases:** A01–A12 · J01–J04 · K01–K02 · L01–L06 · L11–L13
**Claim:** *Packages resolve from a real registry, containers build from their own repository,
and every gate the platform advertises has been observed failing on a deliberately broken commit.*
**Exit:** D001–D003 and D013–D014 closed. A red build is producible on demand for each gate.
**Why first:** it is the only wave that makes every later claim checkable. It is also the shortest.

### Wave 1 · "The foundation is proven, and the design system is real"

**Phases:** A13–A28 · B01–B12 · J05–J08 · K03–K04 · H01–H04 · L07–L10 · L14–L18
**Claim:** *Tenancy, isolation and the sandbox are proven by adversarial tests; the design system
covers the components an enterprise application actually needs.*
**Exit:** `check-rls-verify` green across all 1,029+ tenant tables; sandbox escape suite passing;
40+ primitives with stories, a11y tests and visual regression baselines.

### Wave 2 · "The platform is operable"

**Phases:** C01–C28 · D01–D12 · **M01–M20** · J09–J12 · K05–K08 · L19–L20
**Claim:** *A provider can provision, meter, bill, support, impersonate and offboard a tenant end
to end without a database client; a tenant administrator can run their own organisation.*
**Exit:** the full tenant lifecycle is executable from the console UI, audited, and rehearsed as a
runbook.
**Amended 2026-08-11 — M01–M20 added.** The C phases satisfied this claim for the *tenant* and
left it false for the *estate the tenant runs on*: the console can observe clusters, regions,
compute and AI providers and cannot change any of them (D044). "Operable" that excludes the
infrastructure is not the sentence this wave promises, so the OS kernel (M01–M08), the operation
pipeline (M09–M15) and the estate stages through M20 belong here. M21–M46 carry no Wave-2 claim
and fall to Wave 6.

### Wave 3 · "The applications are genuinely functional"

**Phases:** D13–D22 · E01–E42 · J13–J18
**Claim:** *Every one of the 45 modules passes the module completeness rubric — no module is a
list page with a create form.*
**Exit:** 45/45 modules scored against the E-rubric with evidence; zero pages under 20 lines that
are not intentional redirects.
**Note:** the largest wave by far. It subdivides by module tier (see `docs/module-tier-manifest.json`).

### Wave 4 · "Anyone can extend it"

**Phases:** G01–G30 · F01–F14 · J19–J22
**Claim:** *A developer can build, test, version, publish and monetise an application on UniERP
without our involvement, inside a sandbox proven to contain it.*
**Exit:** an app authored entirely in the developer portal reaches the marketplace and installs
into a second tenant.

### Wave 5 · "Anyone can publish on it"

**Phases:** F15–F26 · I01–I18 · H05–H18 · J23–J26
**Claim:** *A tenant can publish a production website — store, portfolio, marketing, portal —
from a template, edit it without code, and see it on every client.*

### Wave 6 · "Commercially launchable"

**Phases:** K09–K18 · **M21–M46** · residual from every track
**Claim:** *A stranger can sign up, pay, use, get support, export their data and leave — and we
can prove to an auditor that we did it correctly.*

### 4a. The one dependency this plan got wrong, and how

**A06 (coverage gate) depends on L11–L13.** It did not, as first written, and that was the most
consequential error found in the programme's first review.

```
A06 turns on an 80 % coverage threshold.

69 *.coverage.spec.ts files hold 194,494 of the platform's 278,066 lines of test
code — 70 % — and 1,083 of their 1,176 it() blocks are:

    try  { …; expect(result).toBeDefined() }
    catch (e) { expect(e).toBeDefined() }        ← passes whether it works or throws

Turn on the threshold first and it is satisfied by those. The gate then reports 80 %
and is BELIEVED, which is strictly worse than today's gate that reports nothing.

Correct order:  L11 (measure honestly) → L12 (delete the padding)
                → L13 (stop excluding tests from CI) → A06 (threshold against
                the real number) → L14 (gate the pattern so it cannot return)
```

`CODE_STANDARDS § 8` had already stated the principle — *"A 23,000-line test file that raises a
percentage without asserting behaviour is worse than no test"* — about a file that is 23,285 lines
and still present. **The lesson generalises: a gate turned on over a corrupt baseline launders the
corruption.** When adding any gate in this programme, establish the honest baseline first.

### Wave discipline

- **A wave's claim is a claim, not a summary.** If you cannot say the sentence truthfully, the
  wave is not done, regardless of phase statuses.
- **Re-measure `00-BASELINE § 7` at every wave boundary** and log it in `§ 8` of that file. This
  is how a regression gets caught in the wave it happened in.
- **No wave skips.** If Wave 2 is blocked, work the parallel tracks (H, K, J) — do not open Wave 3.

---

## 5. What to do when the plan and reality disagree

They will. The response is specified so it does not have to be invented under pressure:

| Situation | Action |
| :-------- | :----- |
| A phase turns out to be already done | Mark `DONE`, record the evidence command in the notes column. Do not delete it. |
| A phase turns out to be unnecessary | Mark `WITHDRAWN` with a one-line reason. Never delete, never renumber (`README § 0` rule 3). |
| A phase is too large for one session | Split into `X07a`, `X07b`… and add them to `plan-manifest.json`. Never renumber neighbours. |
| A phase is blocked by something not in its `depends-on` | Add the dependency, log it in the track's amendment log — the graph was wrong and the next agent needs to know. |
| You find an architecture defect | File it in `90-DEFECT-LOG.md`. Fix it inline **only** if it blocks the current phase; otherwise it becomes a phase. |
| An exit criterion cannot be met as written | **Stop.** Do not soften it. Log the conflict in the track's amendment log and either fix the criterion deliberately or escalate. This is the single most damaging edit available to an agent (`README § 0` rule 4). |
| You are tempted to reorder waves | Read § 1 again. If the argument there is genuinely wrong for your case, amend § 1 with the reasoning — do not silently reorder. |

---

## 6. Mapping to `IMPLEMENTATION_PLAN.md § 10`

The governance set's five coarse phases map onto this programme's waves as follows. Both remain
valid; this is the decomposition, not a replacement.

| `IMPLEMENTATION_PLAN` phase | Programme waves | Programme tracks |
| :-------------------------- | :-------------- | :--------------- |
| **Phase 0 — Foundation restoration** (R1–R8) | Waves 0–1 | A, plus J01–J08 |
| **Phase 1 — Depth** | Waves 2–3 | B, C, D, E, I |
| **Phase 2 — Intelligence** | Wave 3–4 | E (AI-bearing modules), G (AI builder assist) |
| **Phase 3 — Ecosystem** | Waves 4–5 | G, F, K (marketplace commerce) |
| **Phase 4 — Scale** | Wave 6 + ongoing | A (cell tenancy), J (load/chaos), K |

`IMPLEMENTATION_PLAN § 10` says *"Phase 0 — ⬅ WE ARE HERE. Nothing else starts until this is
done."* `00-BASELINE § 2` shows Phase 0 is roughly 60% closed with two items misreported. **The
"nothing else starts" rule is retained for Waves 0–1 and then relaxed deliberately**, because
holding 278 phases behind a fully closed Phase 0 is how a plan stops being followed. The relaxation
is bounded: Waves 0 and 1 are gates, and no wave after them may open while a Wave-0 or Wave-1
phase is `OPEN`.

---

## 7. Amendment log

| Date | Change | By |
| :--- | :----- | :- |
| 2026-08-07 | Established. Ten brief objectives ranked into twelve tracks; dependency graph and seven waves defined. | Claude Code |
| 2026-08-11 | **Track M placed: M01–M20 into Wave 2, M21–M46 into Wave 6.** Wave 2's claim was measurably false for the estate — see the amendment under § 4 Wave 2 and D044. No wave's claim text was altered; a wave whose claim needed weakening to stay true would be a § 0 rule 4 violation, and this is the opposite move: the phases were added so the existing sentence becomes true. | Claude Code |
