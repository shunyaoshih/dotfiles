#! /bin/bash
source ./utils.sh

print 'Homebrew Tap Fonts'
run_cmd 'brew tap caskroom/fonts'
cask_install 'font-hack-nerd-font'
