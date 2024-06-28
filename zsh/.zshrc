autoload -Uz compinit && compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats " %F{cyan}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats " %F{cyan}%c%u(%b)%f %a"
zstyle ':vcs_info:*' stagedstr "%F{green}"
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' check-for-changes true

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked() {
  if git --no-optional-locks status --porcelain 2> /dev/null | grep -q "^??"; then
    hook_com[staged]+="%F{red}"
  fi
}

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

HISTSIZE=10000
HISTFILE=~/.zsh_history

setopt prompt_subst

PROMPT='%n@%M %F{blue}%B%~%b%F{white}${vcs_info_msg_0_} %# '

# fix ctrl + arrow keys
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Kubectl completion
source <(kubectl completion zsh)

# Load asdf
. /opt/asdf-vm/asdf.sh

# Japanese input
GTK_IM_MODULE=ibus
QT_IM_MODULE=ibus
XMODIFIERS=@im=ibus

# tokyonight colorscheme for fzf https://github.com/folke/tokyonight.nvim/blob/main/extras/fzf/tokyonight_night.zsh
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# colors
LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias ls="ls --color"
alias grep="grep --color"
