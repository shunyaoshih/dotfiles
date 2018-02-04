# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Vifm'
mkdir $HOME'/.vifm'
mkdir $HOME'/.vifm/colors'
link_file $SOURCE'/vifm/vifmrc' $HOME'/.vifm/vifmrc'
link_file $SOURCE'/vifm/Gantheory.vifm' $HOME'/.vifm/colors/Gantheory.vifm'
