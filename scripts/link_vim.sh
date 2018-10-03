#! /bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Vim'
link_dir $SOURCE'/vim' $HOME'/.vim'
link_file $SOURCE'/vim/init.vim' $HOME'/.vimrc'
