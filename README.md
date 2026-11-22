# herdr-ct

A [herdr](https://herdr.dev) plugin that opens a live [code-tree](https://github.com/Andree37/code-tree)
pane (`ct watch`) next to the agent you are working with.

From the pane you see what needs you, what agents proposed, what is ready or stale, and act with single
keys: answer, accept, reject, decide, add sub-tasks, and **talk to the agent in the same tab about the
selected node** (through [intercom](https://github.com/Andree37/intercom)). `n` starts a separate agent
on a node in its own tab, when you want one.

## Install

```sh
go install github.com/Andree37/code-tree/cmd/ct@latest
go install github.com/Andree37/intercom/cmd/ic@latest && ic install claude
herdr plugin install Andree37/herdr-ct
```

Bind a key in `~/.config/herdr/config.toml`:

```toml
[[keys.command]]
key = "prefix+t"
type = "plugin_action"
command = "andree37.ct.open"          # or andree37.ct.open-below
description = "code-tree beside this agent"
```

The pane opens in the focused pane's folder, so it shows that project's `.tree/`. Close it like any pane;
nothing keeps running.

## Keys (in the pane)

`↑ ↓` move · `tab` Next / Tree · `enter` full node · `a` answer · `y` accept / done / still holds ·
`x` reject / send back · `c` decide · `t` talk · `w` ask the agent to work on it · `n` new agent ·
`+` sub-task · `e` note · `m` your intercom inbox · `s` sync · `?` help · `q` quit
