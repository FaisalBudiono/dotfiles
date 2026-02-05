#!/bin/env bash

file=/home/ucul/script/kuda.txt
# echo "hoho" >> $file
# pwd >> $file
# echo $HOME >> $file

workspaceNumber=$(rofi -dmenu -p "Move to workspace")

# Abort if user cancels
[ -z "$workspaceNumber" ] && exit

echo $workspaceNumber >>$file

if ! [[ "$workspaceNumber" =~ ^[0-9]+$ ]]; then
    echo "Sorry integers only" >>$file
    exit
fi

hyprctl dispatch movetoworkspace $workspaceNumber
