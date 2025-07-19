#!/usr/bin/env bash

SESSION_LIST=$(tmux ls -F '#{session_name}')

TEMPFILE=$ZSH_CONFIG_PATH/zsh-config/local/tmux-quick-rename.txt

echo $SESSION_LIST | tr ' ' '\n' | awk '{print $1";"$1}' | sort > $TEMPFILE

EDITOR=nvim
$EDITOR $TEMPFILE

while read p; do
    CHANGE_TO=$(echo $p | awk -F ";" '{print $1}')
    ORIGINAL_NAME=$(echo $p | awk -F ";" '{print $2}')

    tmux rename-session -t $ORIGINAL_NAME $CHANGE_TO
done <$TEMPFILE

if [ -f $TEMPFILE ]; then
    rm $TEMPFILE
fi
