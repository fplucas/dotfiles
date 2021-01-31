# Path to oh-my-zsh installation.
export ZSH="/home/lucas/.oh-my-zsh"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gentoo"

# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(asdf fzf git)

source $ZSH/oh-my-zsh.sh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
