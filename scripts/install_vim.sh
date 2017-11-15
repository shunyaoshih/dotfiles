# !bin/bash
source ./utils.sh

UNDODIR=$HOME"/Github/dotfiles/vim/.undodir"
if [ ! -d "$UNDODIR" ]; then
  mkdir "$UNDODIR"
fi

print "Install Vim Plugins"
cmd='vim +PlugInstall +qall'
run_cmd '$cmd'
