#!/bin/env bash

# Get the selected client from rofi
selection=$(hyprctl clients -j |
    jq -r '.[] | "\(.workspace.id)::\(.title) [\(.class)]"' |
    rofi -dmenu -sync -i)

# Abort if user cancels
[ -z "$selection" ] && exit

# Extract workspace ID (everything before ::)
ws_id=$(echo "$selection" | cut -d':' -f1)

# Tell Hyprland to switch
hyprctl dispatch workspace "$ws_id"
