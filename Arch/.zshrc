# ALIASES
# ------------------------------------------------------------ #
# Directory Navigation
alias ...='cd ../..'                        # Move up two directories
alias ....='cd ../../..'                    # Move up three directories
alias ~='cd ~'                              # Navigate to home directory
alias docs='cd ~/Documents'                 # Go to the Documents directory

# File Management
alias cp='cp -i'                            # Prompt before overwriting files
alias grep='grep --color=auto'              # Enable colored output for `grep`
alias l='ls -CF --color=auto'               # Short form list
alias la='ls -A --color=auto'               # Show all files including hidden, but not `.` and `..`
alias ll='ls -lah --color=auto'             # Detailed directory listing
alias ls='ls --color=auto'                  # Standard `ls` command with color output
alias mv='mv -i'                            # Prompt before moving files
alias rm='rm -i'                            # Prompt before removing files
alias tree='exa --tree'                     # Display a full tree view of the current directory
alias tree-1='exa --tree -L 1'              # Display a tree view up to 1 level deep
alias tree-2='exa --tree -L 2'              # Display a tree view up to 2 levels deep
alias tree-3='exa --tree -L 3'              # Display a tree view up to 3 levels deep

# Git
alias git-commit-all="git add -A && git commit -m"
alias git-push="git push origin $(git branch --show-current)"

# Networking
alias myip="curl ifconfig.me"               # Display the external IP address
alias nord-c="nordvpn connect --group p2p"
alias fast-mirror="sudo pacman-mirrors --country United_States && sudo pacman-mirrors -f 10 && sudo pacman -Syyu"

# Package Management:
# 1. clean cache (retaining 2 past versions), remove orphans, and refresh DBs
alias clean='sudo paccache -r && yay -Sc && sudo pacman -Rns $(pacman -Qdtq) && sudo pacman -Rns $(pacman -Qdttq) && yay -Yc && sudo updatedb && sudo mandb'
# 2. full cache clean, remove orphans, and refresh DBs
alias full-clean='sudo paccache -rk0 && yay -Sc && sudo pacman -Rns $(pacman -Qdtq) && sudo pacman -Rns $(pacman -Qdttq) && sudo updatedb && sudo mandb'
# 3. update system packages and AUR, then refresh DBs
alias update='sudo pacman -Syyu && yay -Syyu && sudo updatedb && sudo mandb'

# Python
alias py='python'

# Terminal Interface
alias cls='clear'                           # Clear terminal
alias h='history | less'                    # View command history with pagination
alias history='history | less'              # View command history with pagination
alias reload='source ~/.zshrc && clear'     # Reload Zsh configuration and clear terminal

# Terminal Screensavers
fire='aafire | while read -r line; do echo "$line"; sleep 0.02; done'
bonsai='cbonsai -S'
rain='rain -r'
alias fire=$fire
alias bonsai=$bonsai
alias screensaver='sh -c "$(shuf -n 1 -e htop $bonsai cmatrix asciiquarium pipes.sh $rain)"'

# TMUX Pane Management
alias tnew='tmux new'                       # Start a new tmux session
alias tsplit-v='tmux split-window -v'       # Split the current tmux pane vertically
alias tsplit-h='tmux split-window -h'       # Split the current tmux pane horizontally
alias tnext='tmux select-pane -t :.+'       # Move to the next tmux pane
alias tprev='tmux select-pane -t :.-'       # Move to the previous tmux pane
alias tkill='tmux kill-pane'                # Kill the current tmux pane
alias tquit='tmux kill-server'              # Kill the current tmux server and close all panes
alias tresize-u='tmux resize-pane -U 5'     # Resize tmux pane upwards by 5 cells
alias tresize-d='tmux resize-pane -D 5'     # Resize tmux pane downwards by 5 cells
alias tresize-l='tmux resize-pane -L 5'     # Resize tmux pane left by 5 cells
alias tresize-r='tmux resize-pane -R 5'     # Resize tmux pane right by 5 cells


# ENVIRONMENT VARIABLES
# ------------------------------------------------------------ #
export NVM_DIR="$HOME/.nvm"                 # Set the directory where NVM stores versions and related files
export PATH="$HOME/.npm/bin:$PATH"
export ZDOTDIR=$HOME


# ZSH HISTORY
# ------------------------------------------------------------ #
HISTFILE=~/.zsh_history                     # Set the location of the history file
HISTSIZE=10000                              # Set the maximum number of history entries
SAVEHIST=10000                              # Lines to save to the history file upon exiting the shell
setopt HIST_IGNORE_DUPS                     # Ignore duplicate commands in history
setopt SHARE_HISTORY                        # Share history between all zsh sessions
setopt APPEND_HISTORY                       # Append commands to the history file instead of overwriting it
setopt HIST_IGNORE_SPACE                    # Ignore commands that start with a space
setopt HIST_REDUCE_BLANKS                   # Remove excessive blank spaces from commands in the history


# CONFIGURATION SCRIPTS
# ------------------------------------------------------------ #
# Launch Zsh with Starship
eval "$(starship init zsh)"
# Set tmux to use ~/.zshrc instead of /tmp/scott-code-zsh/.zshrc
if [[ -n "$TMUX" ]]; then
    unset VSCODE_SHELL_INTEGRATION
fi
# Set NVM directory for managing node versions
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"