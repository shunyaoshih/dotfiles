#! /bin/bash
source ./utils.sh

print 'Deploy Zsh'
brew_install 'zsh'
brew_install 'diff-so-fancy'
run_cmd 'git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"'
print 'Remember to source ~/.zshrc'
