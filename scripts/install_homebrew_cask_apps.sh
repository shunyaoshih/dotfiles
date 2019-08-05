#! /bin/bash
source ./utils.sh

print 'Homebrew Tap Cask'
run_cmd 'brew tap caskroom/cask'

print 'Install Homebrew-Cask Apps'
cask_install 'alfred'
cask_install 'bettertouchtool'
cask_install 'google-chrome'
cask_install 'google-backup-and-sync'
cask_install 'istat-menus'
cask_install 'iterm2'
cask_install 'java'
# cask_install 'mactex'
cask_install 'skype'
cask_install 'slack'
cask_install 'spectacle'
cask_install 'spotify'
cask_install 'steam'
cask_install 'the-unarchiver'
