#! /bin/bash
source ./utils.sh

print 'Deploy Zsh'

print 'Homebrew Tap universal-ctags/universal-ctags'
run_cmd 'brew tap universal-ctags/universal-ctags'
brew_install '--HEAD universal-ctags'

brew_install 'zsh'
brew_install 'diff-so-fancy'
run_cmd 'git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"'
print 'Remember to source ~/.zshrc'
