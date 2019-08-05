#! /bin/bash
source ./utils.sh

print 'Install Useful Homebrew Apps'
brew_install 'duti'
brew_install 'pyenv'
brew_install 'mas'
brew_install 'tldr'
brew_install 'tree'
brew_install 'watch'
brew_install 'macvim'

print 'Homebrew Tap Fonts'
run_cmd 'brew tap caskroom/fonts'
cask_install 'font-hack-nerd-font'
