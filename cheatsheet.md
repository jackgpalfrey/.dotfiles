# Tmux

## Commands

`tmux`                  = Creates and attaches to new session
`tmux new -s <name>`    = Create a named session
`tmux new -d`           = Creates a session without attaching
`tmux kill-server`      = Ends tmux server

`tmux ls`               = List all sessions
`tmux a`                = Attach to last session 
`tmux a -t <target>`    = Attach to specific session
`tmux detach`           = Detach from session


## Binds
`<C-b>`             = Prefix

`<prefix>c`         = Create new window
`<prefix>n`         = Goto next window
`<prefix>p`         = Goto prev window
`<prefix>1-9`       = Jump to window

`<prefix>(`         = Switch to next session
`<prefix>)`         = Switch to prev session

`<prefix>d`         = Detach from tmux
`<prefix>w`         = List all sessions

`<prefix>%`         = Split vertically
`<prefix>"`         = Split horizontally
`<prefix>x`         = Close pane

`<prefix>l`         = Alternate window
`<prefix><C-f>`     = Fuzzy find sessions
`<prefix><C-m>`     = Cht.sh

`<prefix><prefix>`  = Reload config
