# !bin/bash
source ./utils.sh

print 'Install Homebrew Apps'
brew_install 'cmake'
brew_install 'clang-format'
brew_install 'cppcheck'
brew_install '--HEAD universal-ctags'
brew_install 'duti'
brew_install 'gcc'
brew_install 'git'
brew_install 'python'
brew_install 'python3'
pip3 install pylint
brew_install 'reattach-to-user-namespace'

brew_install 'vim'
brew_install 'neovim'
pip3 install neovim
brew_install 'zsh'
brew_install 'tmux'
brew_install 'vifm'
brew_install 'macvim'

cask_install 'iterm2'
cask_install 'skim'

brew_install 'tldr'
brew_install 'pandoc'
brew_install 'node'
gem install neovim
npm install -g neovim
