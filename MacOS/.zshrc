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
# alias rm='rm -i'                            # Prompt before removing files
alias tree='eza --tree'                     # Display a full tree view of the current directory
alias tree-1='eza --tree -L 1'              # Display a tree view up to 1 level deep
alias tree-2='eza --tree -L 2'              # Display a tree view up to 2 levels deep
alias tree-3='eza --tree -L 3'              # Display a tree view up to 3 levels deep

# Git
alias git-commit-all="git add -A && git commit -m"
alias gti="git"

git-pull() {
  local rebase=""
  local ff_only=""
  
  # Check for --rebase and --ff-only options
  for arg in "$@"; do
    case $arg in
      --rebase) rebase="--rebase" ;;
      --ff-only) ff_only="--ff-only" ;;
    esac
  done

  # Default branch is the current branch
  local branch=$(git symbolic-ref --short HEAD)

  # Execute the git pull command with the appropriate options
  git pull $rebase $ff_only origin "$branch"
}

git-hard-reset() {
  if [[ -z $1 ]]; then
    echo "Usage: git-hard-reset <number_of_commits>"
    return 1
  fi

  if [[ $1 =~ ^[0-9]+$ ]]; then
    git reset --hard HEAD~$1
    echo "Hard reset performed for the last $1 commit(s)."
  else
    echo "Error: Argument must be a positive integer."
    return 1
  fi
}

git-push() {
  local force=""
  local force_lease=""
  
  # Check for --force and --force-lease options
  for arg in "$@"; do
    case $arg in
      --force) force="--force" ;;
      --force-lease) force_lease="--force-with-lease" ;;
    esac
  done

  # Default branch is the current branch
  local branch=$(git symbolic-ref --short HEAD)

  # Execute the git push command with the appropriate options
  git push $force $force_lease origin "$branch"
}

git-soft-reset() {
  if [[ -z $1 ]]; then
    echo "Usage: git-soft-reset <number_of_commits>"
    return 1
  fi

  if [[ $1 =~ ^[0-9]+$ ]]; then
    git reset --soft HEAD~$1
    echo "Soft reset performed for the last $1 commit(s)."
  else
    echo "Error: Argument must be a positive integer."
    return 1
  fi
}


# Networking
alias ip-all="ifconfig -a"                  # Display all network interfaces and their IPs
alias ip-local="ipconfig getifaddr en0"     # Get local IP address on macOS (Wi-Fi)
alias ip-public="curl ifconfig.me"          # Get your public IP address
alias netstat-open='netstat -an | grep LISTEN' # Show all open listening ports
alias ports='lsof -i -P -n | grep LISTEN'   # Show all open listening ports

# Package Management:
# 1. Clean cache (retaining 2 past versions), remove orphans, and refresh DBs
alias clean='brew cleanup --prune=2 && brew autoremove && brew update && sudo /usr/libexec/locate.updatedb && sudo /usr/libexec/makewhatis /var/db/man'
# 2. Full cache clean, remove orphans, and refresh DBs
alias full-clean='brew cleanup --prune=0 && brew autoremove && brew update && sudo /usr/libexec/locate.updatedb && sudo /usr/libexec/makewhatis /var/db/man'
# 3. Update system packages and refresh DBs
alias update='brew update && brew upgrade && brew autoremove && sudo /usr/libexec/locate.updatedb && sudo /usr/libexec/makewhatis /var/db/man'

# Python
alias py="python3"
alias python="python3"

# System
alias lock='/usr/bin/python3 -c "import ctypes; ctypes.cdll.LoadLibrary(\"/System/Library/PrivateFrameworks/login.framework/Versions/Current/login\").SACLockScreenImmediate()"'
alias poweroff='sudo shutdown -h now'
alias reboot='sudo shutdown -r now'
alias restart='sudo shutdown -r now'
alias shutdown='sudo shutdown -h now'
alias sleep='pmset sleepnow'

# Terminal Interface
alias cls='clear'                           # Clear terminal
alias h='history | less'                    # View command history with pagination
alias history='history | less'              # View command history with pagination
alias reload='source ~/.zshrc && clear'     # Reload Zsh configuration and clear terminal

# Terminal Screensavers
rain='rain -r'
alias bonsai='cbonsai -S'
alias monitor='sh -c "$(shuf -n 1 -e btop gotop)"'
alias screensaver='sh -c "$(shuf -n 1 -e asciiquarium btop cmatrix gotop nyancat pipes.sh $rain)"'

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
export ZDOTDIR=$HOME
export PATH="/usr/local/bash5/bin:$PATH"    # Add GNU Bash 5 to PATH


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
# Set PATH and FPATH (for shell functions, like completions)
export PATH="$PATH:/Users/scott/.local/bin"
fpath+=~/.zfunc

# Set NVM directory for managing node versions
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Set tmux to use ~/.zshrc instead of /tmp/scott-code-zsh/.zshrc
if [[ -n "$TMUX" ]]; then
    unset VSCODE_SHELL_INTEGRATION
fi

# pipx shell completion
eval "$(register-python-argcomplete pipx)"

# Poetry shell completion
autoload -Uz compinit && compinit

# Set up shell with oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/night-owl.omp.json)"
fi