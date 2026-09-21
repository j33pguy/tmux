#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
XDG_TMUX_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/tmux"

# tmux sources EVERY file in its default config list, so linking both
# ~/.tmux.conf and the XDG path loads this config twice (duplicate -ag
# appends, tpm runs twice). Link exactly one. tmux >= 3.2 reads the XDG path.
tmux_supports_xdg() {
    local v
    v="$(tmux -V | grep -oE '[0-9]+\.[0-9]+' | head -1)"
    [ "$(printf '%s\n3.2\n' "$v" | sort -V | head -1)" = "3.2" ]
}

if tmux_supports_xdg; then
    mkdir -p "$XDG_TMUX_DIR"
    ln -sf "$REPO_DIR/tmux.conf" "$XDG_TMUX_DIR/tmux.conf"
    # drop the legacy link if a previous install left one pointing here
    if [ -L "$HOME/.tmux.conf" ] && [ "$(readlink "$HOME/.tmux.conf")" = "$REPO_DIR/tmux.conf" ]; then
        rm "$HOME/.tmux.conf"
    fi
else
    ln -sf "$REPO_DIR/tmux.conf" "$HOME/.tmux.conf"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# prefix + I needs a live session and a human; bootstrap runs unattended.
"$HOME/.tmux/plugins/tpm/bin/install_plugins" >/dev/null

echo "tmux config linked and plugins installed."
