---
name: brainstorm
description: Use for early-stage idea exploration, design shaping, and spec discovery when the user wants to talk through an idea before implementation. Trigger on requests like "let's brainstorm", "help me think this through", "let's explore", "turn this idea into a design", or "help me write a spec". Inspect the current project state first, then guide the discussion with exactly one question per message, preferring multiple-choice questions when practical. Once the direction is clear, present the design in 200-300 word sections, ask for confirmation after each section, and then turn the confirmed design into a concrete spec and implementation plan.
---

# Brainstorm

## When to use
Use this skill when the user has an idea, feature, workflow, or product direction that is not yet fully formed and wants help refining it before implementation.

Use this skill to:
- turn a rough concept into a clearer product or technical direction
- identify the main decisions, tradeoffs, and unknowns
- shape a design before writing a spec
- convert a confirmed design into an implementation plan

Do not use this skill for direct implementation, bug fixing, or code review unless the brainstorming phase has clearly ended and the user asks to move forward.

## Core behavior
1. Inspect the current project state before asking the first question.
2. Ask exactly one question per message.
3. Prefer multiple-choice questions with clear tradeoffs when the choice space is known.
4. Use open-ended questions only when multiple-choice would force premature assumptions.
5. Ask the highest-leverage unresolved question first.
6. Continue until the design is coherent enough to explain confidently.
7. Stop asking questions and switch to synthesis when enough clarity exists.
8. Present the design in sections of roughly 200-300 words.
9. After each section, ask whether it looks right so far before continuing.
10. After the full design is confirmed, produce a concrete spec and then an implementation plan.

## Question design rules
- Ask one decision-bearing question at a time.
- Do not ask compound or bundled questions.
- Prefer 2-4 options when offering multiple choice.
- Make options concrete and mutually exclusive when possible.
- Include a short tradeoff for each option when useful.
- Base questions on evidence from the repo when the current codebase suggests constraints or opportunities.
- If the user changes direction, update the working understanding before asking the next question.

## Working model
Maintain a short rolling understanding of:
- objective
- target user or operator
- constraints
- key decisions made
- unresolved questions
- risks or dependencies

Keep this model concise. Use it to choose the next question and to structure the later design and spec.

## Synthesis flow
When questioning is complete, present the design in small confirmed sections. Common sections include:
- problem framing and goals
- user workflow or interaction model
- system behavior or architecture
- data, interfaces, or dependencies
- risks, edge cases, and rollout considerations

Pause after each section and ask whether it looks right so far.

After the full design is confirmed, convert it into:
1. a structured spec
2. an implementation plan with ordered steps

## Guardrails
- Do not start with a long interview.
- Do not ask more than one question per message.
- Do not pretend unresolved decisions are settled.
- Do not jump to code unless the user asks to move into implementation.
- Do not ignore the current repo state when it is relevant.
- Prefer clarity and momentum over exhaustive analysis.
