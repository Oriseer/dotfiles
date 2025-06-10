# Directory of zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"


# Download zinit, if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)" 
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Initialize oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::golang

# Keybindings
bindkey -v # Enable vi mode
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# Reduce the key timeout
export KEYTIMEOUT=1

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-zA-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias nvim='nvim'
alias c='clear'

# fzf integration
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


