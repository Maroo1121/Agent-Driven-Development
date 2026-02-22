# ADD Maturity Model

## Overview

The ADD Maturity Model defines four levels of agent-assisted development practice. It provides a clear progression path from ad-hoc prompting to engineering-grade agent integration.

Each level builds on the previous one. You cannot skip levels — the habits and artifacts from lower levels are prerequisites for higher ones.

---

## Level 1: Ad-hoc Prompting

> *"I talk to the agent and hope for the best."*

### Characteristics

- Prompts are conversational and unstructured.
- No artifacts are produced.
- No verification process — output is accepted or rejected by gut feeling.
- No traceability — past interactions are not recorded.
- Results are non-reproducible.
- Success depends on the skill of the individual, not on a process.

### Typical Behaviors

- Copy-pasting code from agent output without review.
- Re-running the same prompt multiple times hoping for better output.
- Blaming the agent when output is poor.
- No distinction between agent tasks — everything is treated the same way.

### Risk Profile

High variability, low reliability. Acceptable for personal experimentation, unacceptable for production work.

---

## Level 2: Structured Agent Usage

> *"I prepare before I execute, and I verify after."*

### Characteristics

- Agent Briefs are written before execution.
- Constraints are defined before prompting.
- Validation Checklists are used after execution.
- Basic execution logging is in place.
- Output quality is measurably more consistent.

### Required Practices

| Practice | Status |
|---|---|
| Write an Agent Brief before every task | Required |
| Define acceptance criteria before execution | Required |
| Complete a Validation Checklist after execution | Required |
| Log execution metadata (model, prompt, timestamp) | Required |
| Structure context before prompting | Recommended |
| Use constraint sheets | Recommended |

### Transition Criteria (L2 → L3)

- [ ] Agent Briefs are written for 100% of agent tasks.
- [ ] Validation Checklists are completed for 100% of outputs.
- [ ] At least 5 Execution Logs are archived.
- [ ] At least 2 Failure Reviews have been conducted.

---

## Level 3: Systematic Orchestration

> *"Every agent interaction follows the full ADD cycle with complete artifacts."*

### Characteristics

- The full ADD cycle (SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY → CONSOLIDATE) is followed for every task.
- All six artifacts are produced and archived.
- Context Packs are structured and curated.
- Failure Reviews drive systematic process improvement.
- Templates are maintained and evolved based on learnings.
- The process is transferable — a new team member can follow it.

### Required Practices

| Practice | Status |
|---|---|
| Full ADD cycle for every agent task | Required |
| All six artifacts produced per cycle | Required |
| Context Packs curated (no noise) | Required |
| Failure Reviews conducted for every failure | Required |
| Templates maintained and versioned | Required |
| Execution Logs include iteration count and duration | Required |
| Pattern extraction after consolidation | Recommended |
| Team-shared template library | Recommended |

### Transition Criteria (L3 → L4)

- [ ] Full ADD cycle followed for 100% of agent tasks over 30 days.
- [ ] Template library contains at least 10 domain-specific templates.
- [ ] Average iteration count per task is tracked and trending downward.
- [ ] Failure Review patterns have led to at least 3 template updates.
- [ ] The process can be explained to and followed by a new team member.

---

## Level 4: Agent-Native Engineering

> *"ADD is embedded in our engineering culture, tooling, and CI/CD."*

### Characteristics

- ADD artifacts are part of the CI/CD pipeline (e.g., PRs require an Execution Log).
- Metrics are tracked: iteration count, first-pass success rate, time per cycle.
- Agent tasks are categorized by type and optimized with type-specific templates.
- Quality gates are automated where possible.
- The team has a shared, evolving Prompt Template Library.
- ADD practices are part of onboarding and code review standards.
- Failure patterns are aggregated and drive organizational learning.

### Required Practices

| Practice | Status |
|---|---|
| ADD artifacts required in PR/MR process | Required |
| Metrics tracked per cycle (iteration count, duration, pass rate) | Required |
| Automated quality gates (linting, type-check, tests) | Required |
| Team-shared, versioned template library | Required |
| Task-type-specific templates | Required |
| Onboarding includes ADD training | Required |
| Aggregated failure pattern analysis (monthly) | Required |
| ADD audit checklist in code review | Recommended |
| Agent selection criteria documented per task type | Recommended |

---

## Maturity Assessment

### Quick Self-Assessment

Answer each question honestly:

| # | Question | L1 | L2 | L3 | L4 |
|---|---|---|---|---|---|
| 1 | Do you write a brief before every agent task? | ✗ | ✓ | ✓ | ✓ |
| 2 | Do you define acceptance criteria before execution? | ✗ | ✓ | ✓ | ✓ |
| 3 | Do you verify output against a checklist? | ✗ | ✓ | ✓ | ✓ |
| 4 | Do you log executions? | ✗ | ✓ | ✓ | ✓ |
| 5 | Do you curate context packs? | ✗ | ✗ | ✓ | ✓ |
| 6 | Do you conduct failure reviews? | ✗ | ✗ | ✓ | ✓ |
| 7 | Do you maintain a template library? | ✗ | ✗ | ✓ | ✓ |
| 8 | Do you follow the full 6-phase cycle? | ✗ | ✗ | ✓ | ✓ |
| 9 | Are ADD artifacts part of your CI/CD? | ✗ | ✗ | ✗ | ✓ |
| 10 | Do you track metrics per cycle? | ✗ | ✗ | ✗ | ✓ |

**Your level = the highest level where ALL checkmarks are present.**

---

## Progression Timeline

For a solo developer or small team:

| Transition | Typical Duration | Key Action |
|---|---|---|
| L1 → L2 | 1–2 weeks | Start writing briefs and validation checklists |
| L2 → L3 | 2–4 weeks | Adopt full cycle, all artifacts, failure reviews |
| L3 → L4 | 1–3 months | Integrate into CI/CD, track metrics, formalize standards |

The goal is not to rush to L4. The goal is to **never fall back to L1**.

---

→ Next: [Non-Negotiable Rules](05-non-negotiable-rules.md)
