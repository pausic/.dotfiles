eval "$(/opt/homebrew/bin/brew shellenv)"

export INIT_SHELL_LEVEL=$SHLVL

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"

ssh-add -A 2>/dev/null
