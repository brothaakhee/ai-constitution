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

- name: brainstorm
  description: Guided idea exploration workflow that inspects the current project, asks one question at a time, and turns rough ideas into a confirmed design, spec, and implementation plan.
  path: .skills/brainstorm/SKILL.md
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

- name: copy-expert
  description: Messaging and branding review workflow that evaluates wording, tone, trust, persuasion, and clarity, then returns concrete suggestions without rewriting by default.
  path: .skills/copy-expert/SKILL.md
  tool_compatibility: claude, codex
  scope: repository

- name: bug-review
  description: Three-pass adversarial bug review workflow that uses a finder, challenger, and referee pass to identify the most credible bugs across all bug types.
  path: .skills/bug-review/SKILL.md
  tool_compatibility: claude, codex
  scope: repository

- name: ticket
  description: Zero-friction GitHub Issue filing from a screenshot, blurb, or quick description. Automatically generates structured title, description, labels, and priority.
  path: .skills/ticket/SKILL.md
  tool_compatibility: claude
  scope: repository

- name: backlog
  description: View, triage, and work from the GitHub Issues backlog. Show issues by priority, pick up the next ticket, or triage unprioritized items.
  path: .skills/backlog/SKILL.md
  tool_compatibility: claude
  scope: repository
