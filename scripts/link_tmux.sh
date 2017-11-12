# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Tmux'
link_file $SOURCE'/tmux/tmux.conf' $HOME'/.tmux.conf'
