#! /bin/bash
source ./utils.sh

print "Clean Unused Vim Plugins"
cmd='vim +PlugClean +qall'
run_cmd '$cmd'
