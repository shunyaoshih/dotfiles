# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Hyper'
link_file $SOURCE'/hyper/.hyper.js' $HOME'/.hyper.js'
