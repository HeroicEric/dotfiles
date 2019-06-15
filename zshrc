export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="frisk"

plugins=(asdf brew git)

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
# export PATH="$HOME/Library/Haskell/bin:$PATH"

# Enable IEx shell history
export ERL_AFLAGS="-kernel shell_history enabled"

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

. $(brew --prefix asdf)/asdf.sh
