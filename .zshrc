HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# load aliases file
. $HOME/.aliases

fpath=(${ASDF_DIR}/completions $fpath)
. $HOME/.asdf/asdf.sh
. ~/.asdf/plugins/java/set-java-home.zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

autoload -Uz compinit && compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}
setopt prompt_subst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "[%b]"
PROMPT='%n@%m:%~ ${vcs_info_msg_0_} ム '
