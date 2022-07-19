# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME="muse"
DEFAULT_USER=$USER

# Auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# oh-my-zsh plugins
plugins=(git kube-ps1 colored-man-pages kubectl)
source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

###############
### PROMPT ###
###############

PROMPT='$(kube_ps1)'$PROMPT

# kubectl autocompletion
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

###############
### Aliases ###
###############

alias tmux='tmux -u -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# Easy python venv activation /deactivation
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'

# Easy neovim
alias v='nvim'
alias vim='nvim'
alias \"vim\"='vim'

# Easy unset kube context
alias ku='kubectx -u'

###############
### Exports ###
###############

# Support for 256 color schemes
export TERM="xterm-256color"
export PATH="$PATH:$HOME/.local/bin"

envs=$HOME/.envs
if [[ -f "$envs" ]]; then
    source $envs
fi

