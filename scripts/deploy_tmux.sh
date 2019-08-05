#! /bin/bash
source ./utils.sh

print 'Deploy tmux'
brew_install 'reattach-to-user-namespace'
brew_install 'tmux'
run_cmd 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm'

SOURCE=$HOME'/Github/dotfiles'

print 'Link Tmux'
link_file $SOURCE'/tmux/tmux.conf' $HOME'/.tmux.conf'
link_file $SOURCE'/tmux/tmux_osx.conf' $HOME'/.tmux_osx.conf'
