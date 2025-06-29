# Prerequisites

- stow
- git

For every config it has their own prerequisites.

| Deps                        | Who Needs  | Description                                                  |
| --------------------------- | ---------- | ------------------------------------------------------------ |
| ghostty                     | hyprland   | main terminal                                                |
| waybar                      | hyprland   | status bar                                                   |
| xdg-desktop-portal-hyprland | hyprland   | Share screen helper                                          |
| swaync                      | hyprland   | hyprland notification                                        |
| hyprpolkitagent             | hyprland   | polkit agent for hyprland                                    |
| hyprpaper                   | hyprland   | wallpaper for hyprland                                       |
| hyprshot                    | hyprland   | for screenshot                                               |
| helvum                      | waybar     | sound wiring for wireplumber                                 |
| pavucontrol                 | waybar     | sound controller for pulseaudio                              |
| iwgtk                       | waybar     | GUI for iwd                                                  |
| otf-font-awesome            | waybar     | font helper                                                  |
| power-profiles-daemon       | waybar     | power profile manager                                        |
| fzf                         | zsh,neovim |                                                              |
| antigen                     | zsh        | Plugin manager                                               |
| oh-my-zsh                   | zsh        |                                                              |
| tmux                        | zsh        |                                                              |
| starship                    | zsh        |                                                              |
| readlink                    | zsh        |                                                              |
| npm                         | neovim     | use nvm instead, the nvm will be lazy loaded with `cinitnvm` |
| go                          | neovim     | use gvm instead, the nvm will be lazy loaded with `cinitgvm` |
| xclip                       | neovim     |                                                              |
| ripgrep                     | neovim     |                                                              |
| nerdfont                    | neovim     |                                                              |
| mysql-client                | neovim     |                                                              |
| postgresql-client           | neovim     |                                                              |
| rustfmt                     | neovim     |                                                              |
| FiraMono Nerd Font          | ghostty    |                                                              |
| montserrat                  | rofi       | font                                                         |
| Roboto Condensed            | rofi       | font                                                         |
| rofi emoji                  | rofi       | for emoji searcher                                           |
| wtype                       | rofi       | for inserting emoji from rofi                                |

> Install `rustfmt` using `rustup`

# How To Run

```bash
stow .
```

# Config Per Apps

## Hypr

Make sure all to copy the `.example` and remove the `.example` file from the copy and adjust the file

## Rofi

Need this fonts to be installed:
- Montserrat
- Roboto Condensed

Need `rofi emoji` to be able to use insert emoji and `wtype` to make sure the selected emoji can be inserted into screen

## Waybar

- `helvum` is just a tools to piping the input and output of the pipewire.
- `pavucontrol` is a controller for the sound
- `iwgtk` GUI for IWD
- `otf-font-awesome` the font that used by waybar
- `power-profiles-daemon` a daemon to change the power profile (especially useful in laptop)

## Ghostty

Need to install `FiraMono Nerd Font` font

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
