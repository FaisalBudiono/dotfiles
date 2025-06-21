# Prerequisites

- stow
- git

For every config it has their own prerequisites.

| Deps                | Who Needs  | Description                                                  |
| ------------------- | ---------- | ------------------------------------------------------------ |
| ghostty             | hyprland   | main terminal                                                |
| waybar              | hyprland   | status bar                                                   |
| xwaylandvideobridge | hyprland   | fixing hyprland sharescreen                                  |
| swaync              | hyprland   | hyprland notification                                        |
| hyprpolkitagent     | hyprland   | polkit agent for hyprland                                    |
| helvum              | waybar     | sound wiring for wireplumber                                 |
| pavucontrol         | waybar     | sound controller for pulseaudio                              |
| iwgtk               | waybar     | GUI for iwd                                                  |
| fzf                 | zsh,neovim |                                                              |
| tmux                | zsh        |                                                              |
| starship            | zsh        |                                                              |
| readlink            | zsh        |                                                              |
| npm                 | neovim     | use nvm instead, the nvm will be lazy loaded with `cinitnvm` |
| go                  | neovim     | use gvm instead, the nvm will be lazy loaded with `cinitgvm` |
| xclip               | neovim     |                                                              |
| ripgrep             | neovim     |                                                              |
| nerdfont            | neovim     |                                                              |
| mysql-client        | neovim     |                                                              |
| postgresql-client   | neovim     |                                                              |
| rustfmt             | neovim     |                                                              |
| FiraCode Nerd Font  | ghostty    |                                                              |
| rofi emoji          | rofi       | for emoji searcher                                           |

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
