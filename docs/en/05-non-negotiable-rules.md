# Non-Negotiable Rules — The Five Nevers

## Overview

TDD has one absolute rule: *write the test before the code.*
ADD has five.

These rules are not guidelines. They are not recommendations. They are **non-negotiable invariants** — conditions that must hold for every ADD cycle, regardless of context, urgency, or perceived simplicity.

Breaking any of these rules invalidates the cycle.

---

## Rule 1: Never Execute Without Explicit Validation Criteria

> *If you can't verify it, you can't ship it.*

### What It Means

Before the agent produces any output, you must have written, specific criteria that define what "correct" looks like. These criteria must be testable — a third party should be able to evaluate the output using only the criteria, without needing additional context.

### Why It's Non-Negotiable

Without validation criteria, verification becomes subjective. Subjective verification is inconsistent, non-transferable, and biased toward accepting output that *looks* right. This is the primary mechanism by which bugs, hallucinations, and subtle errors enter production.

### In Practice

**Wrong**: "Make the function work correctly."
**Right**: "The function must accept a `string[]` input, return a `Map<string, number>`, throw `InvalidInputError` for empty arrays, and handle arrays up to 10,000 elements in under 50ms."

---

## Rule 2: Never Prompt Without Structured Context

> *Context is the single biggest lever on output quality.*

### What It Means

Every prompt must include structured context: relevant files, domain rules, technical constraints, and prior decisions. "Structured" means organized, curated, and non-contradictory — not a raw dump of everything you have.

### Why It's Non-Negotiable

Agents fill context gaps with plausible-sounding fabrications. The less context you provide, the more the agent invents. The more it invents, the more time you spend debugging invisible errors. Structured context is not extra work — it is the most efficient investment in output quality.

### In Practice

**Wrong**: "Refactor the auth module."
**Right**: [Provide the auth module file, the auth types file, the existing tests, the architectural decision record for auth, and the constraint that the public API must not change.]

---

## Rule 3: Never Iterate Without Formalized Feedback

> *Random retries are noise, not engineering.*

### What It Means

When agent output fails verification, the failure must be analyzed, documented (via Failure Review), and a specific correction plan must be created before re-executing. Every iteration must change exactly one variable: the scope, the context, the constraints, or the prompt.

### Why It's Non-Negotiable

Re-running the same prompt hoping for a different result is the agent-development equivalent of prayer. It occasionally works by chance, which makes it psychologically reinforcing, but it teaches nothing and improves nothing. Formalized feedback transforms failure into systematic improvement.

### In Practice

**Wrong**: [Output fails] → "Try again." → [Same prompt, same context] → "Try again."
**Right**: [Output fails] → Failure Review → Root cause: missing edge case in constraints → Add edge case → Re-execute with updated Constraint Sheet.

---

## Rule 4: Never Ship Without an Execution Log

> *Reproducibility requires traceability.*

### What It Means

Every agent execution that produces output integrated into the project must have a corresponding Execution Log recording: the prompt used, the model and version, the context provided, the raw output, the iteration count, and the final status.

### Why It's Non-Negotiable

Without execution logs, agent-assisted development is a black box. You cannot audit it, you cannot reproduce it, you cannot improve it, and you cannot transfer it to another engineer. Execution logs are the minimum unit of institutional memory for agent-assisted work.

### In Practice

This is not optional even for "trivial" tasks. The log can be brief for simple tasks, but it must exist. The habit of logging is more important than the detail of any individual log.

---

## Rule 5: Never Trust Without a Verification Gate

> *Agent confidence ≠ output correctness.*

### What It Means

Agent output must never be accepted based on the agent's own assertion that it is correct. Every output must pass through an independent verification gate — a human review, an automated test, a type check, a build, or a Validation Checklist. Preferably multiple.

### Why It's Non-Negotiable

Agents produce output with uniform confidence regardless of accuracy. A perfectly correct function and a subtly broken one are presented with the same level of certainty. Verification gates are the only mechanism that distinguishes correct output from confidently wrong output.

### In Practice

**Minimum verification gate**: A completed Validation Checklist with every acceptance criterion marked PASS/FAIL.

**Better**: Validation Checklist + automated checks (lint, type-check, tests, build).

**Best**: Validation Checklist + automated checks + human review by someone other than the person who wrote the brief.

---

## Summary Table

| # | Rule | Artifact | Phase |
|---|---|---|---|
| 1 | Never execute without explicit validation criteria | Constraint Sheet | CONSTRAIN |
| 2 | Never prompt without structured context | Context Pack | FRAME |
| 3 | Never iterate without formalized feedback | Failure Review | VERIFY |
| 4 | Never ship without an execution log | Execution Log | CONSOLIDATE |
| 5 | Never trust without a verification gate | Validation Checklist | VERIFY |

---

## The Contract

These five rules form the **ADD Contract**. Adopting ADD means committing to these rules for every agent-assisted task.

If you break a rule, you are not doing ADD. You are prompting.

There is nothing wrong with prompting. But don't call it engineering.

---

→ Next: [Comparison: TDD, DDD, BDD](06-comparison-tdd-ddd.md)
