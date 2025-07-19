#!/usr/bin/env bash

SEARCH_NAME=$1
if [ -z "$SEARCH_NAME" ]; then
    echo "No search name given"
    exit 1
fi

CHOOSEN=$(tmux ls | awk -F ":" '{print $1}' | sort -r | grep -I $SEARCH_NAME)
if [ -z "$CHOOSEN" ]; then
    echo "No session found"
    exit 1
fi

tmux switchc -t $CHOOSEN
