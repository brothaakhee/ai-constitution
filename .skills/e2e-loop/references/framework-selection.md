# Framework Selection

Use this only when the repo does not already have a clear e2e default or when the current setup is a poor fit.

## Decision order
1. If the repo already has a working e2e framework, use it.
2. If the existing framework is usable but not ideal, use it for the current task and note the better option separately.
3. If there is no suitable e2e setup, choose the tool that best matches the app and environment.

## Selection guidance

### Prefer Playwright when
- the app is a modern web app and no e2e framework is already established
- cross-browser support matters
- network control, tracing, screenshots, and strong locator ergonomics are useful
- the repo already uses TypeScript or Node-based tooling

### Prefer Cypress when
- Cypress is already established in the repo
- the team relies on Cypress-specific workflows or plugins
- browser support expectations fit Cypress's model

### Prefer framework-native or existing tooling when
- the repo already has stable helpers, fixtures, CI jobs, and conventions around it
- introducing a new framework would add cost without clear short-term benefit

### Consider another tool when
- the product is not primarily a browser app
- mobile-native, desktop-native, or API-driven end-to-end coverage requires a different stack
- environment constraints make the common browser tools impractical

## When introducing a new tool
Explain briefly:
- why this tool fits the app
- what commands will run the tests
- what dependencies or config are being added
- what the migration cost would be if the team later standardizes on something else
