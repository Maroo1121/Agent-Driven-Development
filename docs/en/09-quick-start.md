# Quick Start — ADD in 15 Minutes

## Who This Is For

You use AI agents (Claude Code, Cursor, Copilot, Aider, or similar) in your development workflow. You want better, more consistent results without a steep learning curve. This guide gets you practicing ADD in 15 minutes.

---

## Step 0: Understand the Core Idea (2 minutes)

ADD has one core insight: **the quality of agent output is determined by your preparation, not your prompting.**

The ADD cycle:

```
SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY → CONSOLIDATE
```

For the quick start, focus on three phases: **SCOPE, CONSTRAIN, and VERIFY.** These alone will dramatically improve your results.

---

## Step 1: Set Up (3 minutes)

Create an `.add/` directory in your project:

```bash
mkdir -p .add/{briefs,constraints,validations,executions}
```

Or use the scaffold script:

```bash
git clone https://github.com/Pyro-IV/Agent-Driven-Development.git /tmp/add
/tmp/add/scaffold/init.sh .
```

---

## Step 2: Before Your Next Agent Task — Write a Brief (3 minutes)

Before you prompt the agent, create a file `.add/briefs/001-my-task.md`:

```markdown
# Agent Brief: 001-my-task

## Intent
The agent must [what it must produce].

## Non-Goals
- Must NOT [thing you don't want].
- Must NOT [another thing].

## Output Format
[e.g., TypeScript file, Markdown doc, JSON config]

## Success Criteria
- [ ] [Specific, testable criterion]
- [ ] [Another criterion]
- [ ] [Another criterion]
```

**This takes 3 minutes.** It saves 30 minutes of rework.

---

## Step 3: Add Constraints (2 minutes)

Create `.add/constraints/001-my-task.md`:

```markdown
# Constraints: 001-my-task

## Must
- [Required behavior or format]
- [Another required behavior]

## Must Not
- [Forbidden action]
- [Another forbidden action]

## Acceptance Criteria
- [ ] [Testable condition — pass/fail]
- [ ] [Another testable condition]
- [ ] [Another testable condition]
```

---

## Step 4: Execute (Normal)

Now prompt the agent as usual — but reference your brief and constraints:

```
Implement the task described in .add/briefs/001-my-task.md.
Follow all constraints in .add/constraints/001-my-task.md.
```

Or include the content directly in your prompt.

---

## Step 5: Verify (3 minutes)

After the agent produces output, create `.add/validations/001-my-task.md`:

```markdown
# Validation: 001-my-task

## Acceptance Criteria
- [ ] PASS / FAIL — [criterion from constraint sheet]
- [ ] PASS / FAIL — [criterion]
- [ ] PASS / FAIL — [criterion]

## Checks
- [ ] No hallucinated imports/dependencies?
- [ ] Stayed within scope (no extra features)?
- [ ] Code runs without errors?
- [ ] Tests pass?

## Verdict: PASS / FAIL
```

**If FAIL**: Identify what went wrong. Was the scope too broad? Context missing? Constraints ambiguous? Fix that specific thing and re-execute.

**If PASS**: Commit everything (code + artifacts).

---

## Step 6: Log (2 minutes)

Create `.add/executions/001-my-task.md`:

```markdown
# Execution Log: 001-my-task

- **Date**: 2025-01-15
- **Model**: Claude Sonnet 4
- **Iterations**: 1
- **Status**: PASS
- **Duration**: 12 minutes
- **Notes**: First-pass success. Constraints were tight enough.
```

---

## That's It.

You just completed your first ADD cycle. Six files, 15 minutes, dramatically better results.

---

## What You Just Did

| Phase | Time | Artifact |
|---|---|---|
| SCOPE | 3 min | Agent Brief |
| CONSTRAIN | 2 min | Constraint Sheet |
| EXECUTE | normal | — |
| VERIFY | 3 min | Validation Checklist |
| CONSOLIDATE | 2 min | Execution Log |

Total overhead: ~10 minutes on top of your normal workflow. Return: significantly higher first-pass success rate, reproducibility, and traceability.

---

## Next Steps

Once this feels natural (usually after 5–10 cycles):

1. **Add Context Packs** — Structure the context you provide to the agent (files, rules, decisions).
2. **Add Failure Reviews** — When output fails, analyze why systematically.
3. **Build your template library** — Customize templates for your common task types.
4. **Read the full documentation** — Start with [The ADD Cycle](02-cycle.md) and [Anti-Patterns](08-anti-patterns.md).

---

## ADD Lite Cheat Sheet

Print this and keep it visible:

```
┌─────────────────────────────────────────────┐
│              ADD LITE CHECKLIST              │
│                                             │
│  Before executing:                          │
│  □ Intent stated in one sentence            │
│  □ Non-goals listed                         │
│  □ Acceptance criteria written              │
│  □ Forbidden actions listed                 │
│                                             │
│  After executing:                           │
│  □ Each criterion checked: PASS/FAIL        │
│  □ No hallucinations detected               │
│  □ Scope respected                          │
│  □ Automated checks pass                    │
│  □ Execution logged                         │
│                                             │
│  If FAIL:                                   │
│  □ Identify which phase failed              │
│  □ Fix that specific phase                  │
│  □ Re-execute (do NOT just retry)           │
└─────────────────────────────────────────────┘
```

---

→ Full documentation: [Philosophy](01-philosophy.md) · [The ADD Cycle](02-cycle.md) · [Artifacts](03-artifacts.md)
