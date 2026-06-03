# Dotfiles

Personal configuration files stored under `~/.config`.

## Contents

- `nvim/` — Neovim config
- `ghostty/` — Ghostty terminal config
- `kitty/` — Kitty terminal config
- `aerospace/` and `.aerospace.toml` — AeroSpace window manager config
- `zed/` — Zed editor config
- `starship.toml` — Starship prompt config
- `.tmux.conf` — tmux config using TPM and Catppuccin

## tmux setup

This repo keeps the tmux config at:

```sh
~/.config/.tmux.conf
```

Symlink it to the location tmux reads by default:

```sh
# Back up any existing tmux config first, if needed
[ -e ~/.tmux.conf ] && [ ! -L ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.backup

# Create/update the symlink
ln -sfn ~/.config/.tmux.conf ~/.tmux.conf
```

Install tmux and TPM, the tmux plugin manager:

```sh
# macOS
brew install tmux

# TPM plugin manager
mkdir -p ~/.tmux/plugins
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start tmux and install plugins:

```sh
tmux
```

Inside tmux, press:

```text
Ctrl-s I
```

The prefix in this config is `Ctrl-s`, so `Ctrl-s I` runs TPM's plugin install binding. This installs the plugins declared in `.tmux.conf`, including Catppuccin.

Useful tmux bindings from this config:

- `Ctrl-s r` — reload `~/.tmux.conf`
- `Ctrl-s h/j/k/l` — move between panes
- `Ctrl-h/j/k/l` — smart pane switching with Vim awareness
- mouse support is enabled
- status bar is at the top

If Catppuccin does not load immediately after the first install, reload tmux:

```sh
tmux source-file ~/.tmux.conf
```

Or from inside tmux, press `Ctrl-s r`.

## Fresh machine checklist

```sh
# Clone this repo as ~/.config, if it is not already there
git clone <repo-url> ~/.config

# tmux config symlink
ln -sfn ~/.config/.tmux.conf ~/.tmux.conf

# TPM
mkdir -p ~/.tmux/plugins
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install tmux plugins from inside tmux
# Press: Ctrl-s I
```
