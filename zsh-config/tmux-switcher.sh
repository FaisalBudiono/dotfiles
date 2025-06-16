#!/usr/bin/env bash
CHOOSEN=$(tmux ls | awk -F ":" '{print $1}' | fzf)

tmux switchc -t $CHOOSEN
