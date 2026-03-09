---
name: bug-review
description: Use for high-fidelity bug identification through a three-pass adversarial review loop: a broad bug-finder pass, an aggressive challenger pass, and a referee pass that adjudicates likely truth and severity across code, product, security, data, and operational bugs.
---

# Bug Review

## When to use
Use this skill when the goal is to identify, challenge, and adjudicate bugs with higher fidelity than a single-pass review.

Use this skill to:
- review code, diffs, logs, incidents, features, data flows, or product behavior for likely bugs
- triage a large set of suspected bugs into more credible findings
- stress-test whether reported issues are real, impactful, and well-supported
- cover product bugs, logic bugs, security bugs, data-quality bugs, reliability bugs, and operational bugs in one review flow

Do not use this skill for generic style feedback or architecture commentary that is not tied to concrete defects.

## Core behavior
Run a three-pass adversarial review loop:

1. Finder pass: maximize recall and produce the superset of plausible bugs.
2. Challenger pass: aggressively try to disprove or weaken each bug using evidence.
3. Referee pass: adjudicate likely truth, severity, and confidence for each item.

Do not encode fake incentives or false claims about ground truth. Use the role objectives directly.

## Inputs to gather
Collect or infer:
- review target: repo, diff, logs, issue, incident, feature area, or dataset
- relevant files or artifacts
- expected behavior
- reproduction steps, if any
- user or business impact
- scope limits, if any

If evidence is insufficient, say so explicitly and recommend targeted follow-up instead of overstating certainty.

## Severity model
Use weighted severity internally to focus effort:
- low impact: 1
- medium impact: 5
- critical impact: 10

Use normal severity labels in the final report unless the user explicitly asks for score totals.

Read `references/severity-rubric.md` only when you need guidance on classifying impact.

## Role objectives

### Finder
- prioritize recall over precision
- enumerate every plausible defect, including edge cases and regressions
- include evidence, impact, and confidence for each candidate
- do not self-censor borderline cases

### Challenger
- attack every reported bug aggressively but evidence-first
- look for expected behavior, missing evidence, invalid assumptions, or alternative explanations
- try to reduce false positives without hand-waving away real defects

### Referee
- compare both sides claim by claim
- decide status, severity, confidence, and reasoning
- prefer evidence over rhetoric
- call out unresolved uncertainty when evidence is incomplete

## Workflow
1. Identify the review target and scope.
2. Gather only the evidence needed for the current area.
3. Run the finder pass and build the superset of plausible bugs.
4. Run the challenger pass against each candidate.
5. Run the referee pass to adjudicate each item.
6. Present referee-approved findings first.
7. Include disputed or rejected items separately when they are still worth monitoring.

## Finding schema
Each candidate bug should carry:
- title
- location
- bug type
- user or system impact
- severity
- evidence
- finder argument
- challenger argument
- referee decision
- referee confidence

## Reporting contract
Findings must come first and be ordered by severity and confidence.

Each confirmed finding should include:
- severity
- bug type
- location
- user-facing or system impact
- evidence
- why it is a bug
- any challenge that was considered and rejected

After confirmed findings, include:
- disputed items
- rejected items worth monitoring
- assumptions
- evidence gaps
- recommended next verification steps

Read `references/output-format.md` only when you need the exact report structure.

## Guardrails
- Do not present speculative issues as confirmed bugs.
- Do not let the challenger dismiss a bug without evidence.
- Do not let the finder's volume inflate the final result.
- Prefer concrete reproduction, logs, or code paths over intuition.
- Keep the output defect-focused rather than drifting into general review commentary.
