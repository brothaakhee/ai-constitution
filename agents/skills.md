# Skills Registry

This repository ships portable skills directly in `.skills/`.

## Format
Each skill entry includes:
- name
- description
- path
- tool_compatibility
- scope

## Registry
- name: dev-loop
  description: Plan-first, red-green TDD workflow for non-trivial feature work, ending with a staff-level review pass.
  path: .skills/dev-loop/SKILL.md
  tool_compatibility: claude, codex
  scope: repository

- name: orchestrator
  description: Coordination layer for multi-step or cross-cutting work that delegates scoped tasks and invokes dev-loop when needed.
  path: .skills/orchestrator/SKILL.md
  tool_compatibility: claude, codex
  scope: repository

- name: ux-eval
  description: End-user UX and UI evaluation workflow for rendered products, with bundled heuristics and Playwright scaffolding.
  path: .skills/ux-eval/SKILL.md
  tool_compatibility: claude, codex
  scope: repository

- name: e2e-loop
  description: End-to-end test workflow that plans user stories for approval, implements approved coverage, and iterates on failures until the relevant tests pass.
  path: .skills/e2e-loop/SKILL.md
  tool_compatibility: claude, codex
  scope: repository
