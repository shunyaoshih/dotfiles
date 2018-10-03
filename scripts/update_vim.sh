#! /bin/bash
source ./utils.sh

./check_vim_dependencies.sh

print "Update Vim Plugins"
cmd='vim +PlugUpdate +qall'
run_cmd '$cmd'
