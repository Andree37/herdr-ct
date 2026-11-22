#!/bin/sh
# The pane itself: ct watch, or a short note on what is missing.
export PATH="$HOME/go/bin:$HOME/.local/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
if ! command -v ct >/dev/null 2>&1; then
    echo "ct is not installed:"
    echo "  go install github.com/Andree37/code-tree/cmd/ct@latest"
elif ct watch; then
    exit 0
fi
printf '\npress enter to close '
read -r _
