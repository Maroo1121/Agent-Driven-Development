# ADD Anti-Patterns

## Overview

Anti-patterns are recurring mistakes that feel productive but consistently lead to poor outcomes. Recognizing them is as important as following the cycle.

Each anti-pattern below is described with its symptoms, root cause, and the ADD correction.

---

## AP-1: The Mega-Prompt

### Description

Cramming an entire feature — scope, context, constraints, and examples — into a single massive prompt, expecting the agent to handle everything at once.

### Symptoms

- Prompts exceed 2000 words.
- Output addresses some parts well and ignores or botches others.
- Verification reveals multiple unrelated failures.

### Root Cause

Failure to SCOPE. The task is too broad for a single cycle.

### ADD Correction

Decompose into multiple ADD cycles. Each cycle has one intent, one output, one verification. Chain them with explicit dependencies.

---

## AP-2: The Pray-and-Retry

### Description

Re-running the exact same prompt after a failure, hoping for a better result from the stochastic process.

### Symptoms

- Same prompt executed 3+ times.
- No changes between iterations.
- Occasional success reinforces the behavior.

### Root Cause

Violation of Rule 3: *Never iterate without formalized feedback.* No Failure Review was conducted.

### ADD Correction

After every failure: stop. Create a Failure Review. Identify the root cause phase. Change exactly one variable. Then re-execute.

---

## AP-3: The Context Dump

### Description

Providing the agent with an entire codebase, all documentation, and every possible reference — hoping it will find what it needs.

### Symptoms

- Context includes files unrelated to the task.
- Agent output references parts of the codebase it shouldn't touch.
- Execution is slow and expensive.
- Output quality degrades as context size increases.

### Root Cause

Failure to FRAME. Context was not curated.

### ADD Correction

Build a Context Pack with only relevant files, rules, and decisions. If in doubt, test: remove a piece of context and check if the agent's task is still achievable. If yes, it's noise — remove it.

---

## AP-4: The Trust Fall

### Description

Accepting agent output without verification because it "looks right" or because the agent expressed confidence.

### Symptoms

- No Validation Checklist completed.
- Bugs discovered after integration.
- Agent hallucinations found in production code.

### Root Cause

Violation of Rule 5: *Never trust without a verification gate.*

### ADD Correction

Complete the Validation Checklist for every output. Run automated checks. For high-stakes tasks, have a second person verify.

---

## AP-5: The Moving Goalposts

### Description

Changing the task requirements during execution — adding features, shifting scope, or modifying constraints mid-cycle without restarting the cycle.

### Symptoms

- Agent output partially matches old requirements and partially matches new ones.
- Verification criteria don't match the final output.
- Confusion about what "done" means.

### Root Cause

Failure to enforce scope control (Principle 8). Scope changed but artifacts were not updated.

### ADD Correction

If scope changes: stop the current cycle. Update the Agent Brief. Update the Constraint Sheet. Restart from SCOPE. Do not try to "patch" a running cycle.

---

## AP-6: The Vanishing Trail

### Description

Running agent tasks without recording what was done — no execution logs, no prompts saved, no validation records.

### Symptoms

- "How did we implement this?" — nobody knows.
- Cannot reproduce a successful approach for similar tasks.
- No data for process improvement.

### Root Cause

Violation of Rule 4: *Never ship without an execution log.*

### ADD Correction

Log every execution. Even brief logs are valuable. Make logging the default, not the exception.

---

## AP-7: The Infinite Loop

### Description

Iterating indefinitely on a failing task without stepping back to question the approach.

### Symptoms

- 5+ iterations on the same task with no convergence.
- Each fix introduces a new issue.
- Increasing frustration, decreasing output quality.

### Root Cause

The wrong phase is being corrected. Usually, the task needs re-scoping (SCOPE) or the context is fundamentally insufficient (FRAME), but corrections are being applied at the CONSTRAIN or EXECUTE level.

### ADD Correction

After 3 failed iterations: mandatory escalation. Step back to SCOPE. Ask: Is this task achievable as defined? Is the decomposition correct? Is the context sufficient? Often, the fix is to split the task, not to refine the prompt.

---

## AP-8: The Automation Illusion

### Description

Treating agent-assisted development as "press a button and get code" — removing the human from the loop entirely.

### Symptoms

- Agent runs autonomously for extended periods without checkpoints.
- Output is reviewed only at the end.
- Large amounts of code are committed with minimal human understanding.

### Root Cause

Violation of Principle 7: *Human gate over full autonomy.* Autonomy was granted without earned trust.

### ADD Correction

Insert verification gates at regular intervals. For multi-step tasks, verify after each step. Only increase autonomy after a track record of consistent first-pass success.

---

## AP-9: The Expert Bypass

### Description

Experienced engineers skipping ADD artifacts because they feel they "don't need them" — they can evaluate output quality intuitively.

### Symptoms

- Senior engineers using agents without briefs or constraints.
- Inconsistent output quality that correlates with task complexity.
- Junior team members cannot follow or reproduce the process.

### Root Cause

Confusing individual skill with process discipline. ADD is not about skill — it is about reproducibility and transferability.

### ADD Correction

ADD applies to everyone, regardless of skill level. The artifacts are not training wheels — they are engineering records. Experts benefit from the discipline; teams benefit from the artifacts.

---

## AP-10: The Template Zombie

### Description

Filling out ADD artifacts mechanically without actual thought — copying template boilerplate, writing vague criteria, ticking checkboxes without reading.

### Symptoms

- Briefs contain generic statements that could apply to any task.
- Constraint Sheets have acceptance criteria like "works correctly."
- Validation Checklists are all marked PASS with no detail.

### Root Cause

Treating ADD as bureaucracy rather than engineering. The artifacts are being produced for compliance, not for quality.

### ADD Correction

Artifacts should be reviewed for specificity. A good test: could a stranger evaluate the output using only the Constraint Sheet and Validation Checklist? If not, the artifacts are not specific enough.

---

## Quick Reference

| Anti-Pattern | Phase Violation | Core Rule Broken | Fix |
|---|---|---|---|
| Mega-Prompt | SCOPE | — | Decompose into multiple cycles |
| Pray-and-Retry | VERIFY | Rule 3 | Failure Review before retry |
| Context Dump | FRAME | Rule 2 | Curate context ruthlessly |
| Trust Fall | VERIFY | Rule 5 | Complete Validation Checklist |
| Moving Goalposts | SCOPE | Principle 8 | Restart cycle on scope change |
| Vanishing Trail | CONSOLIDATE | Rule 4 | Log every execution |
| Infinite Loop | SCOPE | Rule 3 | Escalate after 3 failures |
| Automation Illusion | VERIFY | Principle 7 | Insert verification gates |
| Expert Bypass | ALL | — | ADD applies to everyone |
| Template Zombie | ALL | — | Review for specificity |

---

→ Next: [Quick Start](09-quick-start.md)
