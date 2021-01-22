#!/bin/bash
dotfiles_dir=$(pwd)
home_dir=$HOME

files=('.config/nvim'
       '.config/ranger'
       '.config/termite'
       '.gitconfig'
       '.inputrc'
       '.xinitrc'
       '.zshrc')

for file in ${files[@]}; do
  rm -rf $home_dir/${file}
  ln -sf $dotfiles_dir/${file} $home_dir/${file}
done
