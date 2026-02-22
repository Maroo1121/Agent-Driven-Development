# Comparison: ADD vs TDD, DDD, and BDD

## Overview

ADD is not a replacement for TDD, DDD, or BDD. It operates at a different layer and solves a different class of problems. Understanding where ADD sits relative to these established methodologies clarifies its purpose and its boundaries.

---

## Structural Comparison

| Dimension | TDD | DDD | BDD | **ADD** |
|---|---|---|---|---|
| **Full name** | Test-Driven Development | Domain-Driven Design | Behavior-Driven Development | Agent-Driven Development |
| **Year introduced** | 2003 | 2003 | 2006 | 2025 |
| **Primary author** | Kent Beck | Eric Evans | Dan North | Community (open) |
| **What it structures** | Code testing | Domain modeling | Behavior specification | Agent-assisted development |
| **Core cycle** | Red → Green → Refactor | Explore → Model → Bind | Define → Automate → Validate | Scope → Frame → Constrain → Execute → Verify → Consolidate |
| **Core principle** | Write the test first | Model the domain first | Define behavior first | Define constraints first |
| **Key artifact** | Test suite | Ubiquitous Language, Bounded Context | Feature files (Gherkin) | Agent Brief, Execution Log, Constraint Sheet |
| **Applies to** | Any code | Complex domains | Requirements and acceptance | Any agent-assisted task |
| **Adoption signal** | Tests exist before code | Domain language is shared | Scenarios are executable | Artifacts exist for every agent task |

---

## Conceptual Equivalences

### ADD ↔ TDD

| TDD Concept | ADD Equivalent | Rationale |
|---|---|---|
| Write the test first | Write the Constraint Sheet first | Both define "correct" before producing output |
| Red (test fails) | VERIFY fails | Both start from a known failure state |
| Green (test passes) | VERIFY passes | Both target the minimum output to satisfy criteria |
| Refactor | CONSOLIDATE | Both improve quality after correctness is established |
| Test suite | Constraint Sheet + Validation Checklist | Both are executable specifications |
| Regression test | Execution Log | Both enable detection of future regressions |

**Key difference**: TDD verifies *code behavior*. ADD verifies *agent output quality*. TDD operates at the code level; ADD operates at the process level.

### ADD ↔ DDD

| DDD Concept | ADD Equivalent | Rationale |
|---|---|---|
| Ubiquitous Language | Context Pack (domain rules) | Both ensure shared understanding of domain concepts |
| Bounded Context | Scope (non-goals) | Both define explicit boundaries |
| Aggregate | Agent Brief (atomic scope) | Both enforce transactional consistency at a defined boundary |
| Domain Event | Execution Log entry | Both record what happened in a structured, traceable way |
| Anti-Corruption Layer | Constraint Sheet (forbidden actions) | Both protect system integrity from external inputs |

**Key difference**: DDD structures *domain knowledge*. ADD structures *agent interaction*. DDD is about what you model; ADD is about how you delegate.

### ADD ↔ BDD

| BDD Concept | ADD Equivalent | Rationale |
|---|---|---|
| Feature file | Agent Brief | Both define what should happen in structured format |
| Scenario (Given/When/Then) | Constraint Sheet (acceptance criteria) | Both define testable conditions for success |
| Step definition | Prompt composition | Both translate human intent into executable instructions |
| Living documentation | Execution Log archive | Both produce documentation as a byproduct of the process |

**Key difference**: BDD structures *communication between humans* (developers, QA, product). ADD structures *communication between humans and agents*.

---

## What ADD Solves That Others Don't

### Problem 1: Agent Output Verification

TDD tests verify that *code* works correctly. But who verifies that *the code the agent wrote* is correct before it enters the test cycle?

**ADD provides**: Pre-verification of agent output through the Constraint Sheet and Validation Checklist, before the output enters the TDD cycle.

### Problem 2: Context Management

DDD defines a shared language for the domain. But how does that language get communicated to an agent reliably?

**ADD provides**: The Context Pack artifact, which packages domain knowledge in a structured format consumable by agents.

### Problem 3: Reproducibility of AI-Assisted Work

BDD produces living documentation. But agent interactions — which increasingly produce significant portions of code — leave no trace.

**ADD provides**: The Execution Log, which ensures every agent-assisted decision is traceable and reproducible.

### Problem 4: Process Discipline for Non-Deterministic Tools

TDD, DDD, and BDD all assume deterministic tools: a test either passes or fails, a model either fits or doesn't, a scenario either matches or doesn't.

Agents are non-deterministic. The same prompt can produce different outputs. This fundamentally changes what "discipline" means.

**ADD provides**: A methodology specifically designed for non-deterministic outputs: constraints before execution, verification after execution, and structured iteration when output fails.

---

## How ADD Integrates With Each

### ADD + TDD

```
SCOPE → FRAME → CONSTRAIN → EXECUTE (agent writes code)
    → VERIFY (ADD verification)
        → if PASS → run TDD cycle on the code
            → Red → Green → Refactor
        → CONSOLIDATE
```

ADD ensures the agent's code is sound *before* it enters the TDD cycle. TDD ensures the code is *correct* at the unit level. They are complementary layers.

### ADD + DDD

```
DDD defines the domain model and ubiquitous language.
    → Domain knowledge feeds into ADD Context Packs.
    → ADD ensures agents respect domain boundaries (via Constraint Sheets).
    → Agent output is verified against domain rules (VERIFY phase).
```

DDD provides the *what* (domain knowledge). ADD provides the *how* (agent interaction discipline).

### ADD + BDD

```
BDD defines behavior scenarios (Given/When/Then).
    → Scenarios inform ADD Constraint Sheets (acceptance criteria).
    → Agent Brief references BDD feature files.
    → Agent output is verified against BDD scenarios.
```

BDD provides the *specification*. ADD provides the *delegation and verification process* for having an agent implement that specification.

---

## The Complete Stack

When all four are used together:

```
┌─────────────────────────────────────────┐
│  BDD  — Define behavior scenarios       │
├─────────────────────────────────────────┤
│  DDD  — Model the domain                │
├─────────────────────────────────────────┤
│  ADD  — Delegate to agents with rigor   │
├─────────────────────────────────────────┤
│  TDD  — Verify code correctness         │
└─────────────────────────────────────────┘
```

Each layer handles a different concern. None replaces the others.

---

→ Next: [CLI Workflow](07-cli-workflow.md)
