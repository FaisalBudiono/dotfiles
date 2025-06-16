#!/usr/bin/env bash
CURRENT_DIRECTORY=$(pwd)

UPDATED="no"
runUpdate() {
    if [ $UPDATED = "no" ]; then
        apt-get update
        UPDATED="yes"
    fi
}

[ -e /usr/bin/curl ]
HAS_CURL=$?

if [ $HAS_CURL != 0 ]; then
    runUpdate
    apt-get install -y curl
fi

[ -e /usr/bin/git ]
HAS_GIT=$?

if [ $HAS_GIT != 0 ]; then
    runUpdate
    apt-get install -y git
fi

[ -e /usr/bin/zsh ]
HAS_ZSH=$?

if [ $HAS_ZSH != 0 ]; then
    runUpdate
    apt-get install -y zsh
fi

[ -d $HOME/.oh-my-zsh ]
HAS_OH_MY_ZSH=$?

if [ $HAS_OH_MY_ZSH != 0 ]; then
    yes Y | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

[ -d $HOME/.nvm ]
HAS_NVM=$?

if [ $HAS_NVM != 0 ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
fi

[ -d $HOME/antigen.zsh ]
HAS_ANTIGEN=$?
if [ $HAS_ANTIGEN != 0 ]; then
    curl -L git.io/antigen >$HOME/antigen.zsh
fi

mv $HOME/.zshrc $HOME/.zshrc.backup
ln -s $CURRENT_DIRECTORY/.zshrc $HOME/.zshrc

zsh
