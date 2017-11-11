# !bin/bash
source ./utils.sh

print "Update Vim Plugins"
cmd='vim +PlugUpdate +qall'
run_cmd '$cmd'
