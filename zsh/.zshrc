DEFAULT_USER=$USER

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
## Path
## ---------------------------
PATH=$HOME/.local/bin/:$PATH
PATH=$HOME/.local/scripts/:$PATH
export PATH

## ---------------------------
## Plugins
## ---------------------------
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# [ -f "$HOME/projects/zap/zap.zsh" ] && source "$HOME/projects/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
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

## ---------------------------
## Sourcing
## ---------------------------
[[ -f $HOME/.envs ]] && . $HOME/.envs
[[ -f $HOME/.zsh_aliases ]] && . $HOME/.zsh_aliases
source <(kubectl completion zsh)

# fzf
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='fd --type f'


keychain --nogui --noask --confhost --quiet id_rsa id_ed25519
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && . $HOME/.keychain/$HOSTNAME-sh
[ -f $HOME/.keychain/$HOSTNAME-sh-gpg ] && . $HOME/.keychain/$HOSTNAME-sh-gpg

