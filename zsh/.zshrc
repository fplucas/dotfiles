autoload -Uz compinit && compinit

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTSIZE=10000
SAVEHIST=50000
HISTFILE=~/.zsh_history

setopt inc_append_history

# fix ctrl + arrow keys
bindkey ";5C" forward-word
bindkey ";5D" backward-word

bindkey -s ^f "~/tmux-sessionizer\n"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Kubectl completion
source <(kubectl completion zsh)

# Load asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

# Japanese input
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx

eval "$(starship init zsh)"

alias ls="ls --color"
alias grep="grep --color"
alias shiro="ssh 192.168.1.100"
alias gc="git commit -m"
alias ga="git add"
alias gpull="git pull"
alias gpush="git push"
alias gs="git status"
alias k="kubectl"
