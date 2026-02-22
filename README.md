<p align="center">
  <img src="assets/add-banner.svg" alt="ADD Framework" width="720"/>
</p>

<h1 align="center">Agent-Driven Development (ADD)</h1>

<p align="center">
  <strong>A rigorous engineering methodology for building software with AI agents.</strong><br/>
  The missing discipline between your agent framework and production-grade results.
</p>

<p align="center">
  <a href="MANIFESTO.md">Manifesto</a> ·
  <a href="docs/en/02-cycle.md">The ADD Cycle</a> ·
  <a href="docs/en/09-quick-start.md">Quick Start</a> ·
  <a href="docs/fr/">Version Française</a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-0.1.0-blue" alt="Version"/>
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License"/>
  <img src="https://img.shields.io/badge/status-RFC-orange" alt="Status"/>
</p>

---

## The Problem

Every engineering discipline has its methodology. Testing has **TDD**. Domain modeling has **DDD**. Behavior specification has **BDD**.

AI-agent development has... nothing.

We have powerful agent frameworks — LangChain, AutoGen, CrewAI, Semantic Kernel — but **zero standard methodology** for working with them reliably. The result: inconsistent outputs, context drift, hallucinated assumptions, unreproducible results, and teams that confuse "prompting" with "engineering."

**Agent-Driven Development (ADD)** fills this gap.

## What ADD Is

ADD is a **methodology**, not a framework. It doesn't replace your tools — it structures how you use them.

| | TDD | DDD | BDD | **ADD** |
|---|---|---|---|---|
| **Structures** | Testing | Domain modeling | Behavior specs | Agent-assisted development |
| **Core cycle** | Red → Green → Refactor | Explore → Model → Bind | Define → Automate → Validate | **Scope → Frame → Constrain → Execute → Verify → Consolidate** |
| **Key artifact** | Test suite | Ubiquitous Language | Feature files | Agent Brief + Execution Log |
| **Core principle** | Write the test first | Model the domain first | Define behavior first | **Define constraints first** |

ADD operates at the **process layer** — above your agent framework, below your product methodology.

```
┌─────────────────────────────────────┐
│         Product Methodology         │  (Scrum, Shape Up, Lean...)
├─────────────────────────────────────┤
│    Agent-Driven Development (ADD)   │  ← YOU ARE HERE
├─────────────────────────────────────┤
│         Agent Frameworks            │  (LangChain, AutoGen, Claude Code...)
├─────────────────────────────────────┤
│         LLM / Foundation Models     │  (Claude, GPT, Gemini...)
└─────────────────────────────────────┘
```

## The ADD Cycle

Six phases. Each has a defined input, output, and gate condition.

```
    ┌──────────┐
    │  SCOPE   │  Define intent & boundaries
    └────┬─────┘
         ▼
    ┌──────────┐
    │  FRAME   │  Package context & knowledge
    └────┬─────┘
         ▼
    ┌──────────┐
    │CONSTRAIN │  Encode rules & acceptance criteria
    └────┬─────┘
         ▼
    ┌──────────┐
    │ EXECUTE  │  Agent performs the task
    └────┬─────┘
         ▼
    ┌──────────┐
    │ VERIFY   │  Validate against constraints
    └────┬─────┘
         ▼        ╭─── FAIL ──→ back to SCOPE, FRAME, or CONSTRAIN
    ┌──────────┐  │
    │CONSOLIDATE│──╯  PASS → commit, log, learn
    └──────────┘
```

→ [Full cycle documentation](docs/en/02-cycle.md)

## The Manifesto

> **10 principles for disciplined agent-assisted engineering.**

1. **Context over prompt** — A well-framed context outperforms a clever prompt every time.
2. **Constraints over creativity** — Precision produces better results than open-ended freedom.
3. **Verification over trust** — Never ship agent output without explicit validation.
4. **Explicit intent over implicit assumption** — If the agent has to guess, you failed to scope.
5. **Structured iteration over random retry** — Every retry must change something specific.
6. **Artifacts over memory** — What isn't written down doesn't exist.
7. **Human gate over full autonomy** — Autonomy is earned through verified reliability.
8. **Scope control over scope creep** — One task, one cycle. Always.
9. **Failure analysis over blame** — Bad output is a methodology failure, not an agent failure.
10. **Reproducibility over brilliance** — A reproducible process beats a lucky prompt.

→ [Full Manifesto](MANIFESTO.md)

## Non-Negotiable Rules

The "Five Nevers" of ADD:

| Rule | Rationale |
|---|---|
| **Never execute without explicit validation criteria** | If you can't verify it, you can't ship it. |
| **Never prompt without structured context** | Context is the single biggest lever on output quality. |
| **Never iterate without formalized feedback** | Random retries are noise, not engineering. |
| **Never ship without an execution log** | Reproducibility requires traceability. |
| **Never trust without a verification gate** | Agent confidence ≠ output correctness. |

## Maturity Model

| Level | Name | Description |
|---|---|---|
| **L1** | Ad-hoc Prompting | Unstructured, conversational, no artifacts |
| **L2** | Structured Agent Usage | Briefs, constraints, validation checklists |
| **L3** | Systematic Orchestration | Full cycle, templates, execution logs, reviews |
| **L4** | Agent-Native Engineering | ADD integrated into CI/CD, metrics, team standards |

→ [Full maturity model](docs/en/04-maturity-model.md)

## Quick Start

### Option 1: Scaffold a project

```bash
git clone https://github.com/Pyro-IV/Agent-Driven-Development.git
cd ADD-framework
./scaffold/init.sh my-project
```

This creates an `.add/` directory in your project with all standard templates.

### Option 2: Start manually

1. Read the [Manifesto](MANIFESTO.md)
2. Copy `/templates` into your project
3. Before your next agent task, fill out an [Agent Brief](templates/agent-brief.md)
4. After execution, complete the [Validation Checklist](templates/validation-checklist.md)
5. Log everything in an [Execution Log](templates/execution-log.md)

→ [Full Quick Start guide](docs/en/09-quick-start.md)

## Documentation

| Document | Description |
|---|---|
| [Philosophy](docs/en/01-philosophy.md) | Why ADD exists and what problem it solves |
| [The ADD Cycle](docs/en/02-cycle.md) | Full specification of the 6-phase cycle |
| [Artifacts](docs/en/03-artifacts.md) | Standard deliverables and their schemas |
| [Maturity Model](docs/en/04-maturity-model.md) | L1→L4 progression framework |
| [Non-Negotiable Rules](docs/en/05-non-negotiable-rules.md) | The "Five Nevers" explained |
| [Comparison: TDD, DDD, BDD](docs/en/06-comparison-tdd-ddd.md) | How ADD relates to established methodologies |
| [CLI Workflow](docs/en/07-cli-workflow.md) | Adapting ADD for agentic CLI tools |
| [Anti-Patterns](docs/en/08-anti-patterns.md) | Common mistakes and how to avoid them |
| [Quick Start](docs/en/09-quick-start.md) | Get started in 15 minutes |

## Templates

Ready-to-use templates for every ADD artifact:

- [`agent-brief.md`](templates/agent-brief.md) — Define the mission before execution
- [`context-pack.md`](templates/context-pack.md) — Structure the knowledge the agent needs
- [`constraint-sheet.md`](templates/constraint-sheet.md) — Encode rules and acceptance criteria
- [`validation-checklist.md`](templates/validation-checklist.md) — Verify output systematically
- [`execution-log.md`](templates/execution-log.md) — Record what happened for traceability
- [`failure-review.md`](templates/failure-review.md) — Learn from failures structurally

## Examples

- [Simple Feature](examples/01-simple-feature/) — Adding a feature to a web app using ADD
- [Complex Refactor](examples/02-complex-refactor/) — Refactoring a module with multi-step agent orchestration

## Contributing

ADD is an open methodology. Contributions welcome.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT — See [LICENSE](LICENSE).

---

<p align="center">
  <strong>ADD is not about making agents smarter.<br/>It's about making engineers more disciplined.</strong>
</p>
