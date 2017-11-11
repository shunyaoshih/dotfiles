# !bin/bash
source ./utils.sh

print 'Install Homebrew'
run_cmd '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'

print 'Homebrew Tap Cask'
run_cmd 'brew tap caskroom/cask'
