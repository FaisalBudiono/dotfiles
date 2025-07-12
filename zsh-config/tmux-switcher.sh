#!/usr/bin/env bash
CHOOSEN=$(tmux ls | awk -F ":" '{print $1}' | sort -r | fzf)

tmux switchc -t $CHOOSEN
