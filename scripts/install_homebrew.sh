#! /bin/bash
source ./utils.sh

which -s brew
if [[ $? != 0 ]] ; then
    print 'Install Homebrew'
    run_cmd '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
else
    print 'Update Homebrew'
    brew update
  fi
