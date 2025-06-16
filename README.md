# Prerequisites

- git
- stow

# How To Run

```bash
stow .
```

# Config Per Apps

## Rofi

## Waybar

## Ghostty

### Prerequisites

- FiraMono Nerd Font

## TMUX

### Guide

1. Ensure to Install the latest [TMUX](https://github.com/tmux/tmux/wiki/Installing)
1. Ensure clone the [TPM](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installation)
1. Install the plugin (Using `CTRL-q`+`I`)

## NeoVim

### Prerequisites

- git
- npm
- go
- xclip
- ripgrep
- fzf
- nerdfont
- mysql-client
- postgresql-client
- rustfmt (install this using `rustup`)

### Gotcha

#### `node` and `go` not found

It because in the .zshrc config we lazy load `nvm` and `gvm`. Run both of them using these commands:

| Command  | Version Manager |
| -------- | --------------- |
| cinitnvm | nvm             |
| cinitgvm | gvm             |


#### Installing `markdown-preview.nvim`

It will fail the installation because of npm issue. To fix this issue:

1. Go to `$HOME/.local/share/nvim/lazy/markdown-preview.nvim/app`
1. Then run `install.sh`
