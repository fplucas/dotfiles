#ZSH port of the FISH shell's history search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# keybindings
bindkey -v
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# huge history file
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# history options
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS

# prompt
source $HOME/.prompt.zsh

# aliases
source $HOME/.aliases

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# asdf
autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
