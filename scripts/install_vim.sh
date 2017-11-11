# !bin/bash
source ./utils.sh

print "Install Vim Plugins"
cmd='vim +PlugInstall +qall'
run_cmd '$cmd'
