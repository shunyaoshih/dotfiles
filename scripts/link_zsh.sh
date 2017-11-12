# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Zsh'
link_file $SOURCE'/zsh/zshrc' $HOME'/.zshrc'
