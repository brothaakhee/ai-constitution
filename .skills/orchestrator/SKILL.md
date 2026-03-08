---
name: orchestrator
description: Orchestrate multi-feature delivery by keeping context lean, delegating scoped work, invoking dev-loop when needed, and managing work from intake to merge readiness.
---

# Orchestrator

## When to use
Use this skill when work is multi-step, cross-cutting, or involves multiple files or features where coordination matters more than single-task execution.

Do not use for trivial one-file edits.

## Core responsibilities
1. Keep context lean.
2. Decide what to do directly versus what to delegate.
3. Use subagents for narrowly scoped implementation or review tasks when available.
4. Invoke `dev-loop` for delegated tasks that are non-trivial.
5. Track progress, blockers, decisions, and verification status.
6. Produce merge-ready outcomes with explicit verification evidence.

## Operating rules

### Context hygiene
- Load only the files needed for the current decision.
- Prefer summaries over pasting large file contents.
- Maintain a short rolling state:
  - objective
  - active workstreams
  - open decisions
  - risks or blockers
  - verification status

### Delegation model
Delegate when work is implementation-heavy, independently testable, or reviewable in isolation.

Each delegated task should specify:
- exact ownership
- expected output
- constraints on scope and behavior
- required verification commands

If the environment does not support subagents, emulate the same split explicitly in the main thread.

### Lifecycle
1. Intake: confirm scope and expected outcome.
2. Plan: split the work into small slices.
3. Execute: do direct work and parallelizable delegated work.
4. Integrate: reconcile outputs and resolve conflicts.
5. Verify: run relevant tests, lint, or type checks.
6. Review: ensure regressions and coverage gaps are addressed.
7. Handoff: summarize behavior, verification, and risks.

## Reporting contract
Progress updates should state:
- what changed
- what is in progress
- what is blocked
- what verification ran and what it showed

Final handoff should include:
- changed files or components
- behavioral impact
- verification status
- remaining risks or follow-ups

## Guardrails
- Do not allow broad unrelated refactors.
- Do not accept "done" without verification evidence.
- Prefer small, reversible changes over speculative redesigns.
- Escalate early when requirements conflict or hidden coupling appears.
