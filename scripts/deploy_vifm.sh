#! /bin/bash
source ./utils.sh

print 'Deploy vifm'
brew_install 'vifm'

SOURCE=$HOME'/Github/dotfiles'

print 'Link Vifm'
VIFM_DIR=$HOME"/.vifm"
if [ ! -d "$VIFM_DIR" ]; then
  mkdir "$VIFM_DIR"
fi
VIFM_COLOR_DIR=$HOME'/.vifm/colors'
if [ ! -d "$VIFM_COLOR_DIR" ]; then
  mkdir "$VIFM_COLOR_DIR"
fi
link_file $SOURCE'/vifm/vifmrc' $VIFM_DIR'/vifmrc'
link_file $SOURCE'/vifm/Gantheory.vifm' $VIFM_COLOR_DIR'/Gantheory.vifm'
