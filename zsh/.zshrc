# MacOS
export ZSH="$HOME/.oh-my-zsh"
export VCPKG_ROOT="$HOME/vcpkg"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 5

autoload -U compinit; compinit
HIST_STAMPS="dd.mm.yyyy"

plugins=(
    git
    zsh-autosuggestions
    zsh-lazyload
)


export EDITOR="nvim"

# Aliases
alias k=kubectl
alias nv=nvim
alias oc=opencode

# zsh 
alias rl='source ~/.zshrc'
alias ..='cd ..'
alias c='clear'
alias h='history'
alias j='jobs'

# Git
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gpr='git pull --rebase'
alias gs='git switch'
alias gu='gf && gpr'
alias gup='git stash push --include-untracked && gu && git stash pop'

alias lg='lazygit'

# npm
alias npmci='rm -rf node_modules/ package-lock.json && npm install'

alias pullall='find . -type d -name .git -exec zsh -i -c "cd \"{}\"/../ && pwd && git checkout master && gu" \;'
alias lport='netstat -Watnlv | grep LISTEN | awk '\''{ "ps -o comm= -p " $9 | getline procname; colred="\033[01;31m"; colclr="\033[0m"; print cred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname; }'\'' | column -t -s "|"'


# Functions

if [[ "$TERM_PROGRAM" == "ghostty" ]]; then
    export TERM=xterm-256color
fi

#Env Variables

export NPM_MAIN_REGISTRY="https://registry.npmjs.org/"

#Plugins
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.plugin.zsh
[ -f ~/.zshrc_work ] && source ~/.zshrc_work


