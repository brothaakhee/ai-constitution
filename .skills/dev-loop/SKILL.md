---
name: dev-loop
description: Use for non-trivial feature work. Enforces plan-first, TDD red-green, incremental implementation, then staff engineer review and iterative fixes.
---

# Dev Loop

## When to use
Use for non-trivial coding tasks such as new features, cross-cutting changes, migrations, new endpoints, or multi-file edits.

Do not use for trivial edits such as typos, small refactors, or one-file tweaks.

## Workflow
1. Clarify the task until the plan or spec is concrete enough to implement safely.
2. Write tests first and run them to confirm failure.
3. Implement the minimal code to pass the tests in small iterations.
4. Run the relevant verification again until the new behavior is green.
5. Run a staff-level review pass and present findings to the user as a numbered list.
6. If the user responds with changes, loop back to clarification and apply the same test-backed process.

## Operating rules
- Ask before using this workflow for a non-trivial task if the environment does not auto-invoke skills.
- Keep scope minimal and avoid unrelated refactors.
- Prefer subagents for implementation or review when the environment supports them.
- If subagents are unavailable, execute the same workflow sequentially in the main agent.
- Never skip the red-to-green verification step.
