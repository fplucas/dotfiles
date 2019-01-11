#!/bin/bash
dotfiles_dir=$(pwd)
home_dir=$HOME

files=('.config/dunst'
       '.config/i3'
       '.config/mimeapps.list'
       '.config/nvim'
       '.config/polybar'
       '.config/ranger'
       '.config/termite'
       '.config/transmission-daemon/settings.json'
       '.aliases'
       '.fonts'
       '.gitconfig'
       '.inputrc'
       '.prompt.zsh'
       '.scripts'
       '.xinitrc'
       '.zprofile'
       '.zshenv'
       '.zshrc')

killall transmission-daemon
for file in ${files[@]}; do
  rm -rf $home_dir/${file}
  ln -sf $dotfiles_dir/${file} $home_dir/${file}
done
