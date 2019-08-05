#! /bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Vim'
link_dir $SOURCE'/vim' $HOME'/.vim'
link_file $SOURCE'/vim/init.vim' $HOME'/.vimrc'

CONFIG_DIR=$HOME"/.config"
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
fi
link_dir $SOURCE'/vim' $CONFIG_DIR'/nvim'

UNDODIR=$HOME"/Github/dotfiles/vim/.undodir"
if [ ! -d "$UNDODIR" ]; then
  mkdir "$UNDODIR"
fi

brew_install 'cmake'
brew_install 'clang-format'
brew_install 'cppcheck'
brew_install 'gcc'
brew_install 'git'
brew_install 'pandoc'
brew_install 'python'
brew_install 'python3'
brew_install 'node'

brew_install 'vim'
brew_install 'neovim'

print 'Install Python Packages'
pip3 install pylint
pip3 install yapf
pip3 install neovim

print "Install Vim Plugins"
cmd='vim +PlugInstall +qall'
run_cmd '$cmd'
