REAL_ZSHRC_PATH=$(readlink -f $HOME/.zshrc)
export ZSH_CONFIG_PATH=${REAL_ZSHRC_PATH%/*}

export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
)

ZVM_CURSOR_STYLE_ENABLED=true

source $ZSH/oh-my-zsh.sh

source $ZSH_CONFIG_PATH/zsh-config/modules/00-alias.zsh
source $ZSH_CONFIG_PATH/zsh-config/modules/01-antigen-setup.zsh
source $ZSH_CONFIG_PATH/zsh-config/modules/gvm-config.zsh
source $ZSH_CONFIG_PATH/zsh-config/modules/nvm-config.zsh
source $ZSH_CONFIG_PATH/zsh-config/modules/service.zsh

eval "$(starship init zsh)"
