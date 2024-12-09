# ALIASES
# -------------------------------------------------- #
# Directory Navigation
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias docs='cd ~/storage/documents'

# File Management
alias cp='cp -i'
alias grep='grep --color=auto'
alias l='ls -CF --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -lah --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias tree='eza --tree'
alias tree-1='eza --tree -L 1'
alias tree-2='eza --tree -L 2'
alias tree-3='eza --tree -L 3'

# Git
alias git-commit-all="git add -A && git commit -m"

# Package Management:
alias update="pkg update && pkg upgrade && updatedb"

# Terminal Interface
alias cls='clear'
alias h='history | less'
alias history='history | less'
alias reload='clear && source ~/.zshrc'


# CONFIGURATION SCRIPTS
# -------------------------------------------------- #
eval "$(starship init zsh)"
autoload -U add-zsh-hook
add-zsh-hook precmd /data/data/com.termux/files/usr/bin/neofetch


# ENVIRONMENT VARIABLES
# -------------------------------------------------- #
export PATH=$PATH:/data/data/com.termux/files/usr/bin
export ZDOTDIR=$HOME


# ZSH HISTORY
# -------------------------------------------------- #
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS