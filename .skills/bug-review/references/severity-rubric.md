# Severity Rubric

Use this when classifying impact across product, security, data, or operational bugs.

## Low
- limited user impact
- small workflow annoyance
- localized incorrect behavior
- minor data inconsistency with low blast radius
- low-risk security weakness without realistic exploitation path

Weight: 1

## Medium
- meaningful user friction or repeated failure
- incorrect business logic with noticeable impact
- data corruption or integrity risk in a bounded scope
- security issue with plausible exploitation or clear policy violation
- reliability or operational issue that degrades important behavior

Weight: 5

## Critical
- severe user harm, blocked core workflows, or major revenue impact
- high-risk security vulnerability
- broad or irreversible data corruption
- major outage or reliability failure
- bug with large blast radius across customers, systems, or environments

Weight: 10
