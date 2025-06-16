# Prerequisites

For every config it has their own prerequisites.

- stow
- git (**required** and for neovim)
- fzf (for zsh config)
- tmux (for zsh config)
- starship (for zsh config)
- readlink (for zsh config)
- npm (for neovim)
- go (for neovim)
- xclip (for neovim)
- ripgrep (for neovim)
- fzf (for neovim)
- nerdfont (for neovim)
- mysql-client (for neovim)
- postgresql-client (for neovim)
- rustfmt (for neovim)
- FiraMono Nerd Font (for ghostty)

> Install `rustfmt` using `rustup`

# How To Run

```bash
stow .
```

# Config Per Apps

## Rofi

WIP

## Waybar

WIP

## Ghostty

WIP

## TMUX

### Guide

1. Ensure to Install the latest [TMUX](https://github.com/tmux/tmux/wiki/Installing)
1. Ensure clone the [TPM](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)
1. Install the plugin (Using `CTRL-q`+`I`)

## NeoVim

### Gotcha

#### `node` and `go` not found

It because in the [.zshrc config](#zsh-config) we lazy load `nvm` and `gvm`. Run both of them using these commands:

| Command  | Version Manager |
| -------- | --------------- |
| cinitnvm | nvm             |
| cinitgvm | gvm             |

#### Installing `markdown-preview.nvim`

It will fail the installation because of npm issue. To fix this issue:

1. Go to `$HOME/.local/share/nvim/lazy/markdown-preview.nvim/app`
1. Then run `install.sh`

## ZSH Config

> NOTE:
> Still need to install the antigen and starship manually
