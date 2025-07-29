#!/usr/bin/env bash

SESSION_LIST=$(tmux ls -F '#{session_name}')

TEMPFILE_EDITABLE=$ZSH_CONFIG_PATH/zsh-config/local/tmux-quick-rename.txt
TEMPFILE=$ZSH_CONFIG_PATH/zsh-config/local/tmux-quick-rename-list-raw.txt
TEMPFILE_BAK=$ZSH_CONFIG_PATH/zsh-config/local/tmux-quick-rename-list-raw.txt.bak

echo $SESSION_LIST >$TEMPFILE
echo $SESSION_LIST | tr ' ' '\n' | awk '{print $1";"$1}' | sort >$TEMPFILE_EDITABLE

EDITOR=nvim
$EDITOR $TEMPFILE_EDITABLE

while read p; do
    CHANGE_TO=$(echo $p | awk -F ";" '{print $1}')
    ORIGINAL_NAME=$(echo $p | awk -F ";" '{print $2}')

    tmux has-session -t $ORIGINAL_NAME 2>/dev/null
    EXIT_CODE=$?
    if [ $EXIT_CODE -eq 0 ]; then
        if [ -f $TEMPFILE_BAK ]; then
            rm $TEMPFILE_BAK
        fi

        cp $TEMPFILE $TEMPFILE_BAK

        cat $TEMPFILE_BAK | grep -v $ORIGINAL_NAME >$TEMPFILE
    fi

    tmux rename-session -t $ORIGINAL_NAME $CHANGE_TO
done <$TEMPFILE_EDITABLE

while read p; do
    ORIGINAL_NAME=$(echo $p | awk -F ";" '{print $1}')


    tmux has-session -t $ORIGINAL_NAME 2>/dev/null
    EXIT_CODE=$?
    if [ $EXIT_CODE -eq 0 ]; then
        tmux kill-session -t $ORIGINAL_NAME
    fi

    # tmux rename-session -t $ORIGINAL_NAME $CHANGE_TO
done <$TEMPFILE

if [ -f $TEMPFILE_EDITABLE ]; then
    rm $TEMPFILE_EDITABLE
fi

if [ -f $TEMPFILE ]; then
    rm $TEMPFILE
fi

if [ -f $TEMPFILE_BAK ]; then
    rm $TEMPFILE_BAK
fi
