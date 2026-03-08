---
name: ux-eval
description: Launch a UX-review pass to evaluate a live or locally running UI strictly from the end-user perspective. Use for UI polish reviews, UX flow critiques, interaction quality checks, and heuristic evaluation of rendered product experiences. Do not use for code review.
---

# UX Eval

## When to use
Use this skill when the user wants a product-experience review of a rendered UI.

Use this skill to:
- review a live URL, staging app, or local dev build from the perspective of an end user
- identify UI polish issues such as spacing, alignment, hierarchy, contrast, clutter, and affordance problems
- identify UX issues such as confusing flows, high cognitive load, poor feedback, awkward sequencing, and trust gaps
- evaluate realistic user journeys on desktop and mobile when relevant

Do not use this skill for code review, implementation review, or architecture review.

## Core behavior
1. Run a dedicated UX-review pass.
2. Evaluate only the running product, not the code.
3. Prefer a provided URL. If none is provided, discover the lightest-weight way to run the UI locally.
4. Interact with the product like a real user, not like a DOM or component inspector.
5. Capture screenshots for concrete findings.
6. Return findings ordered by severity and user impact.

## Inputs to gather
Collect or infer:
- target URL or local run command
- authentication or seed credentials if required
- primary user persona
- primary flow or flows to evaluate
- target device scope: desktop, mobile, or both

If some inputs are missing, make reasonable assumptions, proceed with the highest-value pass available, and state assumptions clearly.

## Evaluation scope
Focus on:
- first impression and clarity
- visual polish and consistency
- typography and hierarchy
- spacing, alignment, and balance
- interaction affordance and control clarity
- form burden and error recovery
- navigation and flow naturalness
- loading, empty, success, and failure states
- trust, confidence, and comprehension
- responsiveness when relevant

Do not comment on source code quality unless the user explicitly asks for a separate code review.

## Tooling
Prefer the bundled Playwright scaffold in `scripts/` when Node.js and Playwright are available.
Use screenshots as evidence for concrete issues.
Use mobile emulation when the requested scope includes mobile.
Use trace capture only when a flow is difficult to explain without it.

Read references only as needed:
- `references/heuristics.md` for review dimensions and standards
- `references/output-format.md` for the required reporting contract

## Workflow
1. Identify the evaluation target.
2. If needed, discover the lightest-weight way to run the UI locally.
3. Launch the app or open the provided URL.
4. Walk through the primary user journey end to end.
5. Evaluate UI and UX together, but report them distinctly.
6. Capture screenshots for each concrete issue.
7. Return findings first, then assumptions, tested flows, and residual risks.

## Reporting contract
Findings must come first and be numbered.

Each finding should include:
- severity
- screen or flow location
- what the user experiences
- why it is a UI or UX problem
- recommended fix direction
- screenshot reference when available

After findings, include:
- what was evaluated
- assumptions
- notable strengths if there are any
- residual risks or untested areas

## Guardrails
- Never inspect source files for implementation critique as part of the review.
- Never anchor feedback on internal component structure.
- Prefer behavior- and perception-based language.
- Distinguish polish issues from flow issues.
- Prioritize issues that affect user confidence, comprehension, completion, or trust.
