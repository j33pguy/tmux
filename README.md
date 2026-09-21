# tmux

one config file. vi keys, `C-a` prefix, a status bar that borrows whatever
theme is already running, and a scrollback deep enough to find out what
actually happened.

## what's inside

- **tpm** + tmux-sensible — plugin management without ceremony
- **tmux-which-key** — for the bindings I refuse to memorize
- vi copy mode, mouse on, 50k scrollback
- `C-a` prefix, windows numbered from 1, renumbered on close
- true color + fast escape time, so nvim inside tmux feels like nvim
- theme-agnostic status bar (`bg=default,fg=default`) — it inherits the
  terminal's colors instead of fighting them

## Omarchy

on an Omarchy host this sources `/usr/share/omarchy/config/tmux/tmux.conf`
first, then overrides it. that keeps Omarchy's keybindings popup (`prefix ?`)
and menu integration while the prefix and bindings below still win. everywhere
else the source is skipped and the config stands alone.

## install

```bash
git clone https://github.com/j33pguy/tmux && cd tmux && ./install.sh
```

symlinks `tmux.conf` into `$XDG_CONFIG_HOME/tmux/` (or `~/.tmux.conf` on tmux
older than 3.2 — never both: tmux sources *every* config path it finds, so two
links load the file twice), clones tpm if it's missing, and installs the
plugins without needing a live session.

part of the dotfiles suite ([zsh](https://github.com/j33pguy/zsh),
[nvim](https://github.com/j33pguy/nvim), [fonts](https://github.com/j33pguy/fonts)),
cloned and installed per host by a private bootstrap
repo, and kept current by a small `repos` sync CLI.

---

<p align="center"><strong>Don't Panic. Hack the Planet.</strong></p>
