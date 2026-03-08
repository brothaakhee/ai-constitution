---
name: e2e-loop
description: Use for end-to-end test work driven by user stories or user flows. Plan the stories for approval, implement approved e2e tests, then run and fix them iteratively until they pass.
---

# E2E Loop

## When to use
Use this skill when the goal is to turn a user story, bug report, or user flow into executable end-to-end coverage.

Use this skill to:
- identify the right end-to-end test cases from a user-facing flow
- present the planned stories or flows to the user for approval before writing tests
- implement only the approved end-to-end tests
- run the tests and fix failures iteratively until the approved suite passes or a real blocker remains

Do not use this skill for unit tests, integration tests, or exploratory UX review without a testing outcome.

## Inputs to gather
Collect or infer:
- target user story, requirement, bug, or flow
- app URL or local run command
- existing e2e framework, commands, fixtures, and conventions
- authentication, seed data, or environment requirements
- browser or device scope if it matters

If key environment details are missing, gather the minimum needed to plan safely. If execution is blocked by missing environment or credentials, stop and report that explicitly.

## Tool selection
Prefer the repo's existing e2e framework and conventions when they are usable.

If a different framework would be materially better, note that briefly but still default to the existing stack unless the user approves a switch.

If no suitable e2e setup exists, choose and introduce the best-fit tool for the repo.

Read `references/framework-selection.md` only when you need to choose or justify the framework.

## Workflow
1. Intake: identify the target flow, acceptance criteria, environment constraints, and current e2e setup.
2. Story planning: convert the request into a concise list of candidate user stories or flows.
3. Approval gate: present the planned stories and selected framework to the user, then wait for approval before writing tests.
4. Test authoring: implement only the approved stories using the chosen framework and existing repo conventions where possible.
5. Execution loop: run the relevant e2e tests and classify failures as test issues, environment issues, or real product bugs.
6. Iterative fixes: apply the smallest correct fix and rerun until green or until a real blocker remains.
7. Handoff: report implemented stories, changed files, commands run, pass status, and blockers or follow-ups.

## Story planning rules
For each proposed story, define:
- goal
- happy path
- critical assertions
- important edge or failure states worth covering
- priority

Keep the plan focused. Do not expand coverage beyond what the user asked for without approval.

## Execution rules
- Never write tests before user approval of the story list.
- Prefer incremental delivery: one story or one small batch at a time.
- Reuse existing helpers, fixtures, and test conventions when available.
- Do not hide flakiness. Call it out explicitly if a test is unstable or environment-dependent.
- When a failure exposes a non-trivial product or infrastructure issue, invoke `dev-loop`.
- When the e2e effort spans multiple flows or parallel workstreams, invoke `orchestrator`.
- Use `ux-eval` only if the visible flow is unclear and a rendered walkthrough is needed before planning tests.

## Reporting contract
Before implementation, return:
- proposed user stories
- selected framework or tool
- note about any better alternative, if relevant
- assumptions or blockers

After implementation and execution, return:
- approved stories implemented
- files changed
- framework or tool used
- commands run
- pass or fail status
- unresolved blockers, flaky behavior, or recommended follow-ups

Read `references/output-format.md` only when you need the exact response structure.
