#!/bin/env bash

workspaceNumber=$(rofi -dmenu -p "Move to workspace")

# Abort if user cancels
[ -z "$workspaceNumber" ] && exit

if ! [[ "$workspaceNumber" =~ ^[0-9]+$ ]]; then
    exit
fi

hyprctl dispatch movetoworkspace $workspaceNumber
