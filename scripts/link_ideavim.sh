# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link IDEA Vim'
link_file $SOURCE"/idea/ideavimrc" $HOME"/.ideavimrc"
