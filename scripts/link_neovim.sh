# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Neovim'
DIR=$HOME"/.test"
if [ ! -d "$DIR" ]; then
  mkdir "$DIR"
fi
link_dir $SOURCE'/vim' $HOME'/.config/nvim'
