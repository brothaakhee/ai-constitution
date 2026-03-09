---
name: ticket
description: >
  File a GitHub Issue from a screenshot, blurb, or quick description. Automatically
  generates a well-structured title, description, labels, and priority. Use this
  skill whenever the user says things like "ticket this", "file a bug", "add to
  backlog", sends a screenshot with a complaint, or describes something that needs
  fixing/building. Also trigger when the user provides a screenshot + short blurb
  and expects it to become a tracked issue. The goal is zero-friction capture —
  the user gives raw signal, you produce a clean GitHub Issue.
---

# Ticket — Quick Issue Filing

Zero-friction issue capture. The user gives you a screenshot, blurb, or quick description and you turn it into a well-structured GitHub Issue.

## When to use

- User says "ticket", "file a bug", "add to backlog", "track this"
- User sends a screenshot with a short description
- User describes a bug, feature request, or improvement they noticed while testing
- User says something like "this is broken" or "we should add X"

## Workflow

### Step 1: Analyze the input

Examine what the user provided:
- **Screenshot**: Read it carefully. Identify the screen/page, the issue visible, any error messages, UI problems, or missing elements.
- **Blurb/description**: Extract the core issue or request.
- **Both**: Cross-reference the screenshot with the description for full context.

Determine the issue type:
- `bug` — Something is broken or wrong
- `feature` — New functionality requested
- `improvement` — Enhancement to existing functionality
- `ui/ux` — Visual or interaction issue
- `chore` — Maintenance, cleanup, tech debt

### Step 2: Generate the issue

Create a GitHub Issue with:

**Title**: Short, actionable, specific. Under 70 characters. Start with a verb when possible.
- Good: "Fix wallet balance not updating after transfer"
- Bad: "Wallet issue" or "Bug with the balance thing"

**Body**: Use this template:
```markdown
## What
[1-2 sentence description of what's wrong or what's needed]

## Context
[Where in the app this occurs — screen, flow, endpoint. Include screenshot if provided.]

## Expected behavior
[What should happen instead]

## Steps to reproduce (bugs only)
[If determinable from the screenshot/description]

## Acceptance criteria
- [ ] [Concrete, testable criteria for when this is done]
```

**Labels**: Apply appropriate labels from: `bug`, `feature`, `improvement`, `ui/ux`, `chore`, `priority:high`, `priority:medium`, `priority:low`

### Step 3: Create the issue

Use `gh issue create` to file it. Ensure labels exist first (create if needed).

```bash
# Create missing labels if needed
gh label create "bug" --color "d73a4a" --description "Something isn't working" 2>/dev/null || true
gh label create "feature" --color "0075ca" --description "New feature request" 2>/dev/null || true
gh label create "improvement" --color "a2eeef" --description "Enhancement to existing functionality" 2>/dev/null || true
gh label create "ui/ux" --color "7057ff" --description "Visual or interaction issue" 2>/dev/null || true
gh label create "chore" --color "fef2c0" --description "Maintenance and cleanup" 2>/dev/null || true
gh label create "priority:high" --color "b60205" --description "High priority" 2>/dev/null || true
gh label create "priority:medium" --color "fbca04" --description "Medium priority" 2>/dev/null || true
gh label create "priority:low" --color "0e8a16" --description "Low priority" 2>/dev/null || true
```

### Step 3a: Upload screenshot (if provided)

When a screenshot is provided, save it to the repo and embed it in the issue body:

1. Copy the screenshot to `.github/issue-assets/` with a descriptive kebab-case name:
   ```bash
   mkdir -p .github/issue-assets
   # macOS screenshot filenames contain Unicode narrow no-break spaces — use find to handle them:
   find <source-dir> -name "<pattern>" -exec cp {} .github/issue-assets/<descriptive-name>.png \;
   ```
2. Commit and push so the image is accessible via raw URL:
   ```bash
   git add .github/issue-assets/<name>.png
   git commit -m "Add screenshot for issue: <short-title>"
   git push
   ```
3. Reference in the issue body using:
   ```markdown
   ![Description](https://raw.githubusercontent.com/<owner>/<repo>/<branch>/.github/issue-assets/<name>.png)
   ```

### Step 3b: Create the issue

```bash
gh issue create --title "Title here" --label "bug,priority:medium" --body "$(cat <<'EOF'
## What
...

## Context
...
![Screenshot description](https://raw.githubusercontent.com/...)

## Expected behavior
...

## Acceptance criteria
- [ ] ...
EOF
)"
```

### Step 4: Report back

Show the user:
- Issue title and number
- Link to the issue
- Labels applied
- One-line summary of what you filed

Keep it brief. The user is in flow — don't interrupt them with a wall of text.

## Rules

- **Speed over perfection** — File quickly. The user is testing and wants to keep moving.
- **Infer intelligently** — If the user gives a vague blurb, use your knowledge of the codebase to fill in context, identify the likely screen/component, and write proper acceptance criteria.
- **Don't ask questions** — Unless the input is truly ambiguous (multiple possible interpretations), just file it. Err on the side of action.
- **Screenshot is gold** — When a screenshot is provided, describe what you see in the issue body. This is the primary evidence.
- **Codebase awareness** — Reference specific files, components, or endpoints when you can identify them from the screenshot or description. This helps when working the ticket later.
