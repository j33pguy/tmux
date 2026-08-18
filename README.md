# tmux

one config file, no surprises. vi keys, `C-a` prefix, catppuccin-inspired
status bar, and a scrollback deep enough to find out what actually happened.

## what's inside

- **tpm** + tmux-sensible — plugin management without ceremony
- **tmux-which-key** — for the bindings I refuse to memorize
- vi copy mode, mouse on, 50k scrollback
- `C-a` prefix, windows numbered from 1, renumbered on close
- true color + fast escape time, so nvim inside tmux feels like nvim

## install

```bash
git clone https://github.com/j33pguy/tmux && cd tmux && ./install.sh
```

symlinks `tmux.conf`, clones tpm if it's missing, then `prefix + I` inside
tmux installs the plugins. part of the dotfiles suite
([zsh](https://github.com/j33pguy/zsh), [nvim](https://github.com/j33pguy/nvim),
[fonts](https://github.com/j33pguy/fonts)), wired together by home-manager.

---

<p align="center"><strong>Don't Panic. Hack the Planet.</strong></p>
