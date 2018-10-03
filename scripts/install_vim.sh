#! /bin/bash
source ./utils.sh

./check_vim_dependencies.sh

print "Install Vim Plugins"
cmd='vim +PlugInstall +qall'
run_cmd '$cmd'
