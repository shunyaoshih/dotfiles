#! /bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Dotfiles'

print 'Link Vim'
link_dir $SOURCE'/vim' $HOME'/.vim'
link_file $SOURCE'/vim/init.vim' $HOME'/.vimrc'

CONFIG_DIR=$HOME"/.config"
if [ ! -d "$CONFIG_DIR" ]; then
  mkdir "$CONFIG_DIR"
fi
link_dir $SOURCE'/vim' $CONFIG_DIR'/nvim'

print 'Link IDEA Vim'
link_file $SOURCE"/idea/ideavimrc" $HOME"/.ideavimrc"

print 'Link Zsh'
link_file $SOURCE'/zsh/zshrc' $HOME'/.zshrc'

print 'Link Tmux'
link_file $SOURCE'/tmux/tmux.conf' $HOME'/.tmux.conf'
link_file $SOURCE'/tmux/tmux_osx.conf' $HOME'/.tmux_osx.conf'

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

print 'Link Kitty'
link_file $SOURCE'/kitty/kitty.conf' $CONFIG_DIR'/kitty/kitty.conf'

