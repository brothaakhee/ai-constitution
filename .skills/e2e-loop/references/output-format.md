# E2E Loop Output Format

Use this when presenting the approval plan or final execution result.

## Approval Plan
Return the story plan before writing tests.

For each story include:
1. Story title
Goal: what user outcome is being verified
Happy path: main steps covered
Critical assertions: what must be true
Edge coverage: optional failure or boundary cases
Priority: high, medium, or low

Then include:
- Selected framework or tool
- Better alternative, if relevant
- Assumptions
- Blockers, if any

## Final Execution Report
Return results in this order:
- Approved stories implemented
- Files changed
- Framework or tool used
- Commands run
- Pass or fail status
- Flaky behavior, blockers, or follow-ups

Keep the report concise and execution-focused.
