export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="frisk"

plugins=(git brew chruby)

source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR='vim'

# Aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

export PATH="$PATH:`yarn global bin`"

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
