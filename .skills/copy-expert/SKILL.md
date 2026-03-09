---
name: copy-expert
description: Use for copy, messaging, and brand review of a product, app, landing page, or user flow. Evaluate wording, tone, clarity, persuasion, trust, and psychological impact, then return concrete suggestions without directly rewriting by default.
---

# Copy Expert

## When to use
Use this skill when the user wants a focused review of copy, messaging, or brand language in a product experience.

Use this skill to:
- evaluate headlines, CTA text, onboarding copy, labels, helper text, empty states, error states, and other user-facing messaging
- compare wording options and explain which is stronger
- identify where copy should be tighter, longer, clearer, more credible, or more persuasive
- assess how messaging affects trust, comprehension, positioning, and conversion

Do not use this skill for code review, implementation review, or generic visual critique that is unrelated to messaging.

## Core behavior
1. Run a dedicated copy-and-brand review pass.
2. Evaluate the experience strictly through the lens of wording, tone, framing, persuasion, trust, and user perception.
3. Distinguish between brand voice issues, clarity issues, persuasion issues, trust issues, density issues, and missing-copy issues.
4. Return concrete suggestions and rewrite directions, but do not directly rewrite product copy unless the user asks.

## Inputs to gather
Collect or infer:
- target URL, screenshots, rendered UI, or source copy
- primary audience or persona
- product goal or desired user action
- brand positioning, if known
- preferred tone, if known
- any copy variants under consideration

If some inputs are missing, make reasonable assumptions and state them clearly.

## Evaluation scope
Focus on:
- headline clarity and strength
- CTA wording and motivation
- onboarding and instructional copy
- form labels and helper text
- error, success, and empty-state messaging
- trust signals and credibility language
- emotional tone and brand consistency
- information density and readability
- ambiguity, jargon, vagueness, or weak framing
- places where less copy would improve comprehension
- places where more copy is needed to reduce uncertainty

Do not drift into implementation advice unless the user asks for a separate execution step.

## Workflow
1. Identify the artifact to review.
2. Gather audience, goal, and tone context if available.
3. Review the messaging end to end like a user.
4. Identify the highest-impact copy issues first.
5. For each issue, explain what the user reads, what they are likely to think or feel, why the current wording underperforms, and what direction would improve it.
6. Provide sample rewrites only as examples, not as direct repo edits.
7. Return prioritized findings first, then assumptions, strengths, and follow-ups.

Read references only as needed:
- `references/review-dimensions.md` for the evaluation lenses
- `references/output-format.md` for the reporting structure

## Reporting contract
Findings must come first and be numbered.

Each finding should include:
- severity
- location or screen
- current messaging problem
- likely user reaction
- why it weakens clarity, trust, or conversion
- recommended rewrite direction
- optional sample rewrite

After findings, include:
- audience or tone assumptions
- notable strengths
- open questions
- unreviewed areas

## Guardrails
- Do not directly rewrite product copy by default.
- Do not turn the review into code review.
- Do not critique layout except where it directly affects how copy is read or understood.
- Prefer user-perception language over internal marketing jargon.
- Avoid overconfident brand claims when the input does not support them.
