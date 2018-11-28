#! /bin/bash
source ./utils.sh

print 'Install Homebrew Apps'
brew_install 'cmake'
brew_install 'clang-format'
brew_install 'cppcheck'
brew_install '--HEAD universal-ctags'
# unsupported in Mojave
# brew_install 'duti'
brew_install 'gcc'
brew_install 'git'
brew_install 'pandoc'
brew_install 'python'
brew_install 'python3'
brew_install 'mas'
brew_install 'node'
brew_install 'tldr'
brew_install 'reattach-to-user-namespace'
brew_install 'watch'

brew_install 'vim'
brew_install 'neovim'
brew_install 'zsh'
brew_install 'tmux'
brew_install 'vifm'
brew_install 'macvim'
