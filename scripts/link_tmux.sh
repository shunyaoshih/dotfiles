#! /bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Tmux'
link_file $SOURCE'/tmux/tmux.conf' $HOME'/.tmux.conf'
link_file $SOURCE'/tmux/tmux_osx.conf' $HOME'/.tmux_osx.conf'
