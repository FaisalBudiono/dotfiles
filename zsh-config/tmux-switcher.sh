#!/usr/bin/env bash
CHOOSEN=$(tmux ls | awk -F ":" '{print $1}' | sort -r | fzf)

if [ -z "$CHOOSEN" ]; then
    echo "No session chosen"
    return
fi

tmux switchc -t $CHOOSEN
