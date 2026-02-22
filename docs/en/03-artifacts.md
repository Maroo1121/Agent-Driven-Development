# ADD Artifacts

## Overview

ADD defines six standard artifacts. Each artifact serves a specific purpose in the cycle, ensures traceability, and enables reproducibility.

Artifacts are not bureaucracy — they are the **engineering memory** of agent-assisted work. Without them, every interaction is a one-off that cannot be audited, reproduced, or improved.

---

## 1. Agent Brief

**Created in**: SCOPE phase
**Purpose**: Define what the agent must do, for whom, and within what boundaries.

### Contents

| Field | Description |
|---|---|
| **Task ID** | Unique identifier (e.g., `ADD-2024-0042`) |
| **Intent** | One-sentence statement of what the agent must produce |
| **Non-Goals** | Explicit list of what is out of scope |
| **Output Format** | Expected deliverable format (code file, markdown, JSON, etc.) |
| **Success Criteria** | How a human will know the task succeeded |
| **Complexity** | Single-shot / Multi-step / Multi-cycle |
| **Dependencies** | Other tasks, files, or systems this depends on |

### Quality Signals

A good Agent Brief is:
- **Verifiable**: A third party could evaluate success from the brief alone.
- **Bounded**: Non-goals are as clear as goals.
- **Atomic**: It describes one task, not a project.

→ Template: [`templates/agent-brief.md`](../../templates/agent-brief.md)

---

## 2. Context Pack

**Created in**: FRAME phase
**Purpose**: Package all knowledge the agent needs to perform the task.

### Contents

| Field | Description |
|---|---|
| **Relevant Files** | List of files with paths and brief descriptions of their role |
| **Domain Rules** | Business logic, naming conventions, architectural patterns |
| **Technical Constraints** | Stack, versions, APIs, environment specifics |
| **Prior Decisions** | What was already tried, rejected, or decided — and why |
| **Reference Examples** | Examples of desired output style or structure |

### Quality Signals

A good Context Pack is:
- **Curated**: Only relevant information, no noise.
- **Non-contradictory**: No conflicting rules or examples.
- **Self-contained**: The agent should not need to ask for more information.

→ Template: [`templates/context-pack.md`](../../templates/context-pack.md)

---

## 3. Constraint Sheet

**Created in**: CONSTRAIN phase
**Purpose**: Encode every rule, boundary, and acceptance criterion the agent must respect.

### Contents

| Field | Description |
|---|---|
| **Format Constraints** | File structure, naming, code style, output format |
| **Behavioral Constraints** | What the output must do and must not do |
| **Quality Constraints** | Performance targets, error handling, edge cases |
| **Acceptance Criteria** | Specific, testable pass/fail conditions |
| **Forbidden Actions** | Things the agent must never do |

### Quality Signals

A good Constraint Sheet is:
- **Testable**: Every constraint can be verified as true or false.
- **Complete**: No implicit constraints — everything is written.
- **Non-contradictory**: No constraint conflicts with another.

→ Template: [`templates/constraint-sheet.md`](../../templates/constraint-sheet.md)

---

## 4. Validation Checklist

**Created in**: VERIFY phase
**Purpose**: Systematically verify the agent's output against all constraints and criteria.

### Contents

| Field | Description |
|---|---|
| **Acceptance Criteria** | Each criterion from the Constraint Sheet with PASS/FAIL status |
| **Hallucination Check** | Did the agent invent data, files, APIs, or dependencies? |
| **Scope Check** | Did the agent stay within the defined scope? |
| **Silent Failure Check** | Does the output contain subtle errors not caught by automated tools? |
| **Automated Checks** | Results of linting, type-checking, tests, builds |
| **Overall Verdict** | PASS / FAIL (binary — partial pass is a fail) |

### Quality Signals

A good Validation Checklist is:
- **Exhaustive**: Every criterion is checked, none skipped.
- **Binary**: No "maybe" or "close enough" — pass or fail.
- **Documented**: Failures include specific details, not just "FAIL."

→ Template: [`templates/validation-checklist.md`](../../templates/validation-checklist.md)

---

## 5. Execution Log

**Created in**: EXECUTE phase, completed in CONSOLIDATE phase
**Purpose**: Record exactly what happened for traceability and reproducibility.

### Contents

| Field | Description |
|---|---|
| **Task ID** | Links to the Agent Brief |
| **Timestamp** | Start and end time |
| **Model** | Model name and version (e.g., `claude-sonnet-4-20250514`) |
| **Prompt** | The exact prompt or command used |
| **Context Provided** | Summary of context pack contents |
| **Raw Output** | The agent's unmodified output |
| **Iteration Count** | How many cycles/retries were needed |
| **Final Status** | PASS / FAIL / PARTIAL |
| **Duration** | Total time from first execution to consolidation |
| **Notes** | Observations, surprises, learnings |

### Quality Signals

A good Execution Log is:
- **Reproducible**: Another engineer could replay the same execution.
- **Honest**: Raw output is captured, including failures.
- **Complete**: All metadata is filled, no blank fields.

→ Template: [`templates/execution-log.md`](../../templates/execution-log.md)

---

## 6. Failure Review

**Created in**: VERIFY phase (on failure)
**Purpose**: Analyze why the agent output failed and identify the root cause in the methodology.

### Contents

| Field | Description |
|---|---|
| **Task ID** | Links to the Agent Brief |
| **Failure Description** | What went wrong — specific and factual |
| **Root Cause Phase** | Which ADD phase failed: SCOPE, FRAME, CONSTRAIN, or EXECUTE? |
| **Root Cause Detail** | Why that phase failed (e.g., "missing file in context," "ambiguous acceptance criteria") |
| **Correction Plan** | Specific changes to make before re-executing |
| **Pattern Identified** | Is this a recurring failure? Should it become a template update? |

### Quality Signals

A good Failure Review is:
- **Blame-free**: Focuses on process, not on the agent or the engineer.
- **Specific**: Identifies the exact phase and the exact gap.
- **Actionable**: The correction plan is concrete enough to immediately re-enter the cycle.

→ Template: [`templates/failure-review.md`](../../templates/failure-review.md)

---

## Artifact Lifecycle

```
SCOPE      →  Agent Brief
FRAME      →  Context Pack
CONSTRAIN  →  Constraint Sheet
EXECUTE    →  Execution Log (started)
VERIFY     →  Validation Checklist  (+ Failure Review if FAIL)
CONSOLIDATE →  Execution Log (completed)
```

All artifacts are stored in the project's `.add/` directory (see [CLI Workflow](07-cli-workflow.md)) and versioned alongside code.

---

→ Next: [Maturity Model](04-maturity-model.md)
