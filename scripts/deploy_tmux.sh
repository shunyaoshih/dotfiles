#! /bin/bash
source ./utils.sh

print 'Deploy tmux'
brew_install 'reattach-to-user-namespace'
brew_install 'tmux'
