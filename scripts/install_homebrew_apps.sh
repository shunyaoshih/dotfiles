# !bin/bash
source ./utils.sh

print 'Install Homebrew Apps'
brew_install 'cmake'
brew_install 'gcc'
brew_install 'git'
brew_install 'python'
brew_install 'python3'
brew_install 'reattach-to-user-namespace'

brew_install 'vim'
brew_install 'neovim'
pip3 install neovim
brew_install 'zsh'
brew_install 'tmux'
brew_install 'vifm'
brew_install 'macvim'

cask_install 'iterm2'
