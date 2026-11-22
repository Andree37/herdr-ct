#!/bin/sh
# Open `ct watch` beside the focused pane, in that pane's folder, so it finds the
# project's .tree/ and its "tab" is the agent's tab.
herdr="${HERDR_BIN_PATH:-herdr}"
pane="$HERDR_PANE_ID"
cwd=$("$herdr" pane get "$pane" 2>/dev/null | sed -n 's/.*"foreground_cwd":"\([^"]*\)".*/\1/p')
[ -n "$cwd" ] || cwd=$("$herdr" pane get "$pane" 2>/dev/null | sed -n 's/.*"cwd":"\([^"]*\)".*/\1/p')
exec "$herdr" plugin pane open \
    --plugin andree37.ct \
    --entrypoint tree \
    --placement split \
    --direction "${1:-right}" \
    --target-pane "$pane" \
    ${cwd:+--cwd "$cwd"} \
    --focus
