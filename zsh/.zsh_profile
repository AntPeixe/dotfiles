# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'

## ---------------------------
## Aliases
## ---------------------------
# tmux
alias tmux='tmux -u -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'

# python venvs
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'

# neovim
alias v='nvim'
alias vim='nvim'
alias \"vim\"='vim'

# kubectl / kubectx
alias ku='kubectx -u'  # unset context
alias krc='kubectl resource-capacity'

## ---------------------------
## Path
## ---------------------------
PATH=$HOME/.local/bin/:$PATH
PATH=$HOME/.local/scripts/:$PATH
PATH=$HOME/.krew/bin/:$PATH
export PATH

## ---------------------------
## Keymaps
## ---------------------------
bindkey -s ^f "tmux-sessionizer\n"  # bind ctrl+f to to tmux-sessionizer
