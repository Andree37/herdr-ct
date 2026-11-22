#!/bin/sh
# Open the code-tree pane beside the focused pane, in that pane's folder, so it
# follows the agent in that tab.
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
herdr="${HERDR_BIN_PATH:-herdr}"
pane="$HERDR_PANE_ID"
# a real JSON parser, so folders with quotes or backslashes in their names work
cwd=$("$herdr" pane get "$pane" 2>/dev/null | jq -r '.result.pane | .foreground_cwd // .cwd // empty' 2>/dev/null)
if [ "$1" = tab ]; then
    exec "$herdr" plugin pane open --plugin andree37.ct --entrypoint tree \
        --placement tab ${cwd:+--cwd "$cwd"} --focus
fi
exec "$herdr" plugin pane open \
    --plugin andree37.ct \
    --entrypoint tree \
    --placement split \
    --direction "${1:-right}" \
    --target-pane "$pane" \
    ${cwd:+--cwd "$cwd"} \
    --focus
