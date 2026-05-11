## MacOS
export ZSH="$HOME/.oh-my-zsh"
export VCPKG_ROOT="$HOME/vcpkg"
export LSCOLORS=Exbxexdxcxegedabagacad
export LS_COLORS="di=38;5;209:ln=31:so=32:pi=33:ex=32:bd=36;44:cd=33;45:su=30;31:sg=31;40:tw=30;36:ow=32;40"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 5
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'EZA_COLORS="da=36:di=38;5;209" eza -1 -a --icons --color=always $realpath'
# apply to all command
zstyle ':fzf-tab:*' popup-min-size 50 8
# only apply to 'diff'
zstyle ':fzf-tab:complete:diff:*' popup-min-size 80 12

HIST_STAMPS="dd.mm.yyyy"

plugins=(
    git
    zsh-autosuggestions
    zsh-lazyload
)

## Plugins
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(mise activate zsh)"

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.plugin.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


export EDITOR="nvim"

## Aliases
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

# eza
alias ls='eza'
alias ll='eza -la --icons'
alias lt='eza -a --tree --icons'


# npm
alias npmci='rm -rf node_modules/ package-lock.json && npm install'

alias pullall='find . -type d -name .git -exec zsh -i -c "cd \"{}\"/../ && pwd && git checkout master && gu" \;'
alias lport='netstat -Watnlv | grep LISTEN | awk '\''{ "ps -o comm= -p " $9 | getline procname; colred="\033[01;31m"; colclr="\033[0m"; print cred "proto: " colclr $1 colred " | addr.port: " colclr $4 colred " | pid: " colclr $9 colred " | name: " colclr procname; }'\'' | column -t -s "|"'


## Env Variables

export NPM_MAIN_REGISTRY="https://registry.npmjs.org/"



# override zsh-syntax-highlighting defaults
ZSH_HIGHLIGHT_STYLES[command]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#5ad4e6,underline
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#7bd88f,underline
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=#7bd88f,underline
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#fc618d,bold
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=#fc618d,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=#fce566
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=#fce566
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=#fce566
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=#fce566
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=#fce566,bold
ZSH_HIGHLIGHT_STYLES[redirection]=fg=#fce566
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[globbing]=fg=#948ae3
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=#948ae3
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=#948ae3,bold
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=#5ad4e6
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=#5ad4e6,bold
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=#fc618d
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=#fc618d
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=#fc618d
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=#7bd88f,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=#fc618d,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=#69676c,bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=#69676c,bold
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=none
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[line]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none



[ -f ~/.zshrc_work ] && source ~/.zshrc_work


