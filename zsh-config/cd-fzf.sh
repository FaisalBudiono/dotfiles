#!/usr/bin/env bash
FILE_SOURCE="$ZSH_CONFIG_PATH/zsh-config/local/fzf.txt"

[ -e $FILE_SOURCE ]
FILE_EXISTS=$?

if [ $FILE_EXISTS != 0 ]; then
	touch $FILE_SOURCE
fi

CHOOSEN_DIR=$(cat $FILE_SOURCE | fzf)

cd "$CHOOSEN_DIR"
