#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 <url> <output-dir> [desktop|mobile|both]"
  exit 1
fi

URL="$1"
OUTPUT_DIR="$2"
DEVICE_SCOPE="${3:-both}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$OUTPUT_DIR"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required to run ux-eval Playwright scaffolding."
  exit 1
fi

node "$SCRIPT_DIR/ux_eval_playwright.mjs" "$URL" "$OUTPUT_DIR" "$DEVICE_SCOPE"
