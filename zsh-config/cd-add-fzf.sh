#!/usr/bin/env bash
DIR_PATH="$ZSH_CONFIG_PATH/zsh-config/local"
FILE_SOURCE="$DIR_PATH/fzf.txt"

[ -e $FILE_SOURCE ]
FILE_EXISTS=$?

if [ $FILE_EXISTS != 0 ]; then
	touch $FILE_SOURCE
fi

echo $(pwd) >> $FILE_SOURCE
cp "$FILE_SOURCE" "$FILE_SOURCE".bak
cat $FILE_SOURCE.bak | sort | uniq > $FILE_SOURCE
