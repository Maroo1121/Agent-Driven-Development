# CLI Workflow — ADD for Agentic CLI Tools

## Overview

ADD was designed with CLI-first agent usage in mind. Tools like Claude Code, Cursor, GitHub Copilot Workspace, and Aider operate in the terminal — not in a GUI. This changes how artifacts are created, stored, and referenced.

This document defines the standard project structure, file conventions, and workflow patterns for practicing ADD in a CLI environment.

---

## Project Structure

Every project practicing ADD includes an `.add/` directory at the project root:

```
my-project/
├── src/
├── tests/
├── .add/                          # ADD artifacts root
│   ├── briefs/                    # Agent Briefs
│   │   ├── 001-auth-refactor.md
│   │   └── 002-api-pagination.md
│   ├── context/                   # Context Packs
│   │   ├── 001-auth-refactor.md
│   │   └── 002-api-pagination.md
│   ├── constraints/               # Constraint Sheets
│   │   ├── 001-auth-refactor.md
│   │   └── 002-api-pagination.md
│   ├── executions/                # Execution Logs
│   │   ├── 001-auth-refactor.md
│   │   └── 002-api-pagination.md
│   ├── validations/               # Validation Checklists
│   │   ├── 001-auth-refactor.md
│   │   └── 002-api-pagination.md
│   ├── reviews/                   # Failure Reviews
│   │   └── 001-auth-refactor-r1.md
│   ├── metrics/                   # Aggregated metrics
│   │   └── 2025-01-summary.md
│   └── templates/                 # Project-specific templates
│       └── (overrides or extends global templates)
├── .gitignore
└── README.md
```

### Naming Convention

All artifacts for the same task share a numeric prefix:

```
briefs/001-auth-refactor.md
context/001-auth-refactor.md
constraints/001-auth-refactor.md
executions/001-auth-refactor.md
validations/001-auth-refactor.md
```

Failure Reviews add an iteration suffix: `reviews/001-auth-refactor-r1.md`, `reviews/001-auth-refactor-r2.md`.

### Git Integration

ADD artifacts **should be committed alongside code**. They are part of the project's engineering record.

Recommended `.gitignore` additions:

```
# ADD — ignore draft artifacts
.add/drafts/
```

---

## Workflow: A Complete CLI Cycle

Here is a complete ADD cycle as practiced in a CLI environment (using Claude Code as an example agent):

### Step 1: SCOPE — Create the Brief

```bash
# Create a new brief from template
cp .add/templates/agent-brief.md .add/briefs/003-user-search.md
# Edit the brief
$EDITOR .add/briefs/003-user-search.md
```

Fill in: intent, non-goals, output format, success criteria.

### Step 2: FRAME — Package Context

```bash
cp .add/templates/context-pack.md .add/context/003-user-search.md
$EDITOR .add/context/003-user-search.md
```

Reference specific files, domain rules, and prior decisions. You can embed file paths or inline short snippets.

### Step 3: CONSTRAIN — Define Constraints

```bash
cp .add/templates/constraint-sheet.md .add/constraints/003-user-search.md
$EDITOR .add/constraints/003-user-search.md
```

Write testable acceptance criteria, forbidden actions, format requirements.

### Step 4: EXECUTE — Run the Agent

Compose your prompt from the three artifacts. In practice:

```bash
# Option A: Reference files in your prompt
claude "Implement user search. See .add/briefs/003-user-search.md for scope,
.add/context/003-user-search.md for context, and
.add/constraints/003-user-search.md for constraints."

# Option B: Concatenate into a single prompt
cat .add/briefs/003-user-search.md \
    .add/context/003-user-search.md \
    .add/constraints/003-user-search.md | claude

# Option C: Use your agent's native context mechanism
# (e.g., CLAUDE.md, .cursorrules, etc.)
```

Start the execution log:

```bash
cp .add/templates/execution-log.md .add/executions/003-user-search.md
# Record: timestamp, model, prompt used
```

### Step 5: VERIFY — Validate Output

```bash
cp .add/templates/validation-checklist.md .add/validations/003-user-search.md
$EDITOR .add/validations/003-user-search.md
```

Walk through each acceptance criterion. Run automated checks:

```bash
# Lint
npm run lint

# Type-check
npm run typecheck

# Tests
npm test

# Build
npm run build
```

Record results in the Validation Checklist.

**If FAIL**: Create a Failure Review and loop back.

```bash
cp .add/templates/failure-review.md .add/reviews/003-user-search-r1.md
$EDITOR .add/reviews/003-user-search-r1.md
# Identify root cause, plan correction, re-enter cycle
```

### Step 6: CONSOLIDATE — Commit and Learn

```bash
# Complete the execution log
$EDITOR .add/executions/003-user-search.md
# Record: final status, iteration count, duration, notes

# Commit everything together
git add src/ tests/ .add/
git commit -m "feat: user search [ADD-003]"
```

---

## Context Drift Prevention

Context drift is the progressive loss of coherence during long agent sessions. In CLI environments, it is the most common failure mode.

### Strategies

**1. One task, one session.**
Start a new agent session for each ADD cycle. Do not carry conversation history from one task to another.

**2. Context reset checkpoints.**
For multi-step tasks, periodically re-inject the full Context Pack. Do not rely on the agent's conversational memory.

**3. Explicit state tracking.**
After each significant agent action, summarize the current state in a structured format. Feed this summary back as context for the next step.

**4. Session length limits.**
Set a maximum session length (e.g., 30 minutes or 20 exchanges). When reached, consolidate progress, save state, and start a new session.

---

## Memory Management

### Short-Term (Session)

- Use the agent's native context mechanism (CLAUDE.md, .cursorrules, system prompt).
- Front-load the most important context. Agents weight earlier context more heavily.
- Prune irrelevant context between iterations.

### Medium-Term (Task)

- The `.add/` directory is the task-level memory.
- Artifacts persist across sessions and can be re-loaded.
- Execution Logs provide continuity between sessions.

### Long-Term (Project)

- The template library evolves based on Failure Reviews.
- The metrics directory tracks trends over time.
- Git history provides a complete audit trail.

---

## Prompt Versioning

Prompts that prove effective should be versioned and reused:

```
.add/templates/
├── agent-brief.md           # Standard template
├── context-pack.md
├── prompts/                  # Proven prompt patterns
│   ├── refactor-module.md
│   ├── add-feature.md
│   ├── fix-bug.md
│   ├── write-tests.md
│   └── review-code.md
```

Each prompt template includes:
- The prompt text with `{{placeholders}}`.
- Usage notes (when to use, known limitations).
- Version history.

---

## Scaffold Script

The ADD framework provides an initialization script:

```bash
./scaffold/init.sh my-project
```

This creates the full `.add/` structure in the target project with all templates pre-populated.

See [`scaffold/init.sh`](../../scaffold/init.sh) for the implementation.

---

→ Next: [Anti-Patterns](08-anti-patterns.md)
