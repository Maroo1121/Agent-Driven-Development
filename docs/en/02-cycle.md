# The ADD Cycle

## Overview

The ADD Cycle is a six-phase process for every agent-assisted task. It is the core of the methodology — the equivalent of Red → Green → Refactor in TDD.

```
SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY → CONSOLIDATE
```

Each phase has:
- A **purpose** — what it achieves
- An **input** — what you need before entering
- An **output** — the artifact it produces
- A **gate condition** — the criterion for moving to the next phase

The cycle is **atomic**: one task, one cycle. Complex work is decomposed into multiple cycles, never crammed into one.

---

## Phase 1: SCOPE

> *Define what the agent must do — and what it must not do.*

### Purpose

Establish a clear, bounded intent for the task. Scoping is the single most impactful phase: a well-scoped task succeeds even with mediocre prompting; a poorly-scoped task fails even with a perfect prompt.

### Input

- A need, feature request, bug report, or improvement idea.

### Activities

1. Write a **one-sentence intent statement**: "The agent must [verb] [object] [constraint]."
2. Define **non-goals** explicitly: what is out of scope for this cycle.
3. Estimate **complexity**: is this a single-shot task or a multi-step workflow?
4. Decide the **output format**: code, documentation, analysis, config, etc.

### Output

→ **Agent Brief** (artifact)

### Gate Condition

The scope is valid when:
- [ ] The intent can be stated in one sentence.
- [ ] Non-goals are explicitly listed.
- [ ] The expected output format is defined.
- [ ] A human can verify the output without ambiguity.

### Anti-Pattern

*"Just refactor this module and also add tests and update the docs."*
→ That's three cycles, not one.

---

## Phase 2: FRAME

> *Package the context the agent needs to succeed.*

### Purpose

Assemble all knowledge, files, rules, and constraints that the agent requires. Context quality is the primary determinant of output quality. This phase ensures the agent operates with complete, relevant, non-contradictory information.

### Input

- Agent Brief from SCOPE phase.

### Activities

1. Identify **relevant files**: code, configs, schemas, docs.
2. Identify **domain rules**: business logic, naming conventions, architectural patterns.
3. Identify **prior decisions**: what was already tried, what was rejected, and why.
4. Identify **dependencies**: other systems, APIs, libraries, version constraints.
5. Package everything into a structured format the agent can consume.

### Output

→ **Context Pack** (artifact)

### Gate Condition

The context is valid when:
- [ ] All files referenced in the brief are included or accessible.
- [ ] Domain rules are explicit, not implicit.
- [ ] No contradictory information is present.
- [ ] The context is scoped to the task — no irrelevant noise.

### Anti-Pattern

*Dumping an entire codebase into context and hoping the agent finds what it needs.*
→ Noise destroys precision. Curate ruthlessly.

---

## Phase 3: CONSTRAIN

> *Encode the rules the agent must follow and the criteria for acceptance.*

### Purpose

Define explicit boundaries for the agent's output. Constraints transform a vague task into a verifiable specification. This is where engineering discipline is most visible: the more precise the constraints, the more reliable the output.

### Input

- Agent Brief + Context Pack.

### Activities

1. Define **format constraints**: file structure, naming conventions, code style.
2. Define **behavioral constraints**: what the code must do, what it must not do.
3. Define **quality constraints**: performance targets, error handling, edge cases.
4. Write **acceptance criteria**: specific, testable conditions for pass/fail.
5. Define **forbidden actions**: things the agent must never do (e.g., delete files, modify unrelated code, invent dependencies).

### Output

→ **Constraint Sheet** (artifact)

### Gate Condition

The constraints are valid when:
- [ ] Every constraint is testable (can be verified as true/false).
- [ ] Acceptance criteria are specific enough for a third party to evaluate.
- [ ] Forbidden actions are explicitly listed.
- [ ] No constraint contradicts another.

### Anti-Pattern

*"Make it clean and well-structured."*
→ Unmeasurable. Instead: "Functions must be under 30 lines. No nested callbacks. Error handling via try/catch with typed errors."

---

## Phase 4: EXECUTE

> *The agent performs the task under the defined constraints.*

### Purpose

This is the only phase where the agent acts. Everything before this phase is human preparation; everything after is human verification. The execution phase is deliberately bounded — the agent operates within the scope, context, and constraints defined in phases 1–3.

### Input

- Agent Brief + Context Pack + Constraint Sheet.

### Activities

1. Compose the **prompt** from the brief, context, and constraints.
2. Select the **execution mode**: single-shot, multi-step, conversational, or autonomous.
3. **Execute** the agent task.
4. Capture the **raw output** before any modification.

### Output

→ Agent output (code, text, analysis, etc.)
→ **Execution Log** entry (artifact — started automatically)

### Gate Condition

Execution is complete when:
- [ ] The agent has produced output.
- [ ] The raw output is captured in the execution log.
- [ ] The prompt used is recorded.
- [ ] The model, version, and timestamp are logged.

### Note

This phase is intentionally minimal. ADD front-loads effort into SCOPE, FRAME, and CONSTRAIN so that EXECUTE can be as clean and simple as possible. A well-prepared execution rarely requires extensive prompt engineering.

---

## Phase 5: VERIFY

> *Validate the output against every constraint and acceptance criterion.*

### Purpose

Systematic verification against the Constraint Sheet. This is the quality gate — no output passes into production without explicit validation. Verification is binary: pass or fail. Partial passes are fails.

### Input

- Agent output + Constraint Sheet + Validation Checklist.

### Activities

1. **Check each acceptance criterion** against the output. Mark pass/fail.
2. **Check for hallucinations**: did the agent invent information not in the context?
3. **Check for scope violations**: did the agent do more or less than requested?
4. **Check for silent failures**: does the output look correct but contain subtle errors?
5. **Run automated checks** where possible: linting, type-checking, tests, builds.
6. Record all findings in the Validation Checklist.

### Output

→ Completed **Validation Checklist** (artifact)

### Gate Condition

Verification passes when:
- [ ] Every acceptance criterion is marked PASS.
- [ ] No hallucinated assumptions are detected.
- [ ] No scope violations are found.
- [ ] Automated checks pass.

### On Failure

If any criterion fails → **do not proceed to CONSOLIDATE**. Instead:

1. Identify **which phase failed**: Was the scope too broad? Context incomplete? Constraints ambiguous? Or did the agent genuinely underperform?
2. Create a **Failure Review** artifact.
3. Return to the appropriate phase (SCOPE, FRAME, or CONSTRAIN) with specific corrections.
4. Re-execute. This is **structured iteration**, not random retry.

---

## Phase 6: CONSOLIDATE

> *Commit, log, and extract learnings.*

### Purpose

Close the cycle. Ensure the output is integrated, the process is documented, and any learnings are captured for future cycles.

### Input

- Verified output + Completed Validation Checklist + Execution Log.

### Activities

1. **Integrate** the output: commit code, update docs, merge changes.
2. **Complete the Execution Log**: add final status, duration, iteration count.
3. **Extract patterns**: Did this cycle reveal a reusable template? A new constraint? A better context structure?
4. **Update templates** if the cycle produced generalizable improvements.
5. **Archive** all artifacts for traceability.

### Output

→ Integrated output (committed code, merged docs, etc.)
→ Completed **Execution Log** (artifact)
→ Updated templates (if applicable)

### Gate Condition

Consolidation is complete when:
- [ ] Output is integrated into the codebase/project.
- [ ] Execution Log is complete and archived.
- [ ] Any reusable patterns are captured in templates.

---

## Cycle Properties

### Atomicity

One cycle = one task. If you need to decompose, create multiple cycles with explicit dependencies.

### Traceability

Every cycle produces a complete artifact chain: Brief → Context → Constraints → Log → Checklist. This chain is the audit trail.

### Iteration

Cycles can loop, but only through structured re-entry. The loop always passes through a Failure Review that identifies the specific phase to revisit.

```
SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY ──PASS──→ CONSOLIDATE
                                         │
                                        FAIL
                                         │
                                         ▼
                                   FAILURE REVIEW
                                         │
                                    ┌────┼────┐
                                    ▼    ▼    ▼
                                 SCOPE FRAME CONSTRAIN
```

### Nesting

Complex tasks are decomposed into multiple cycles. A parent cycle's EXECUTE phase can contain child cycles, each following the full SCOPE → CONSOLIDATE sequence.

---

→ Next: [Artifacts](03-artifacts.md)
