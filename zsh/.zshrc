DEFAULT_USER=$USER
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

## ---------------------------
## Sourcing
## ---------------------------
[[ -f $HOME/.envs ]] && . $HOME/.envs
[[ -f $HOME/.zsh_aliases ]] && . $HOME/.zsh_aliases

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'

## ---------------------------
## Path
## ---------------------------
PATH=$HOME/.local/bin/:$PATH
PATH=$HOME/.local/scripts/:$PATH
PATH=$HOME/.krew/bin/:$PATH
export PATH

## ---------------------------
## Plugins
## ---------------------------
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# [ -f "$HOME/projects/zap/zap.zsh" ] && source "$HOME/projects/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "hlissner/zsh-autopair"
plug "DarrinTisdale/zsh-aliases-exa"

plug "zap-zsh/zap-prompt"

# keep these plugins at the end
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"

## ---------------------------
## Keymaps
## ---------------------------

# ctrl+f to tmux-sessionizer
bindkey -s '^f' "tmux-sessionizer\n"  

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data


