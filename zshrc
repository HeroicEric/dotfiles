export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="steeef"

plugins=(git brew chruby)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR='vim'

# Aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# nvm
export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh
