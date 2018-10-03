#! /bin/bash
source ./utils.sh

UNDODIR=$HOME"/Github/dotfiles/vim/.undodir"
if [ ! -d "$UNDODIR" ]; then
  mkdir "$UNDODIR"
fi

if ! cmake --version > /dev/null; then
  if [ "$(uname)" == "Darwin" ]; then
    ./install_homebrew.sh
    brew_install 'cmake'
    brew_install 'gcc'
    brew_install 'python'
    brew_install 'python3'
    brew_install 'vim'
    cask_install 'skim'
  fi
fi
