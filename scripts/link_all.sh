# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Dotfiles'
link_dir $SOURCE'/vim' $HOME'/.vim'
link_file $SOURCE'/vim/init.vim' $HOME'/.vimrc'

mkdir ~/.config
link_dir $SOURCE'/vim' $HOME'/.config/nvim'

copy_file $SOURCE"/idea/ideavimrc" $HOME"/.ideavimrc"

link_file $SOURCE'/zsh/zshrc' $HOME'/.zshrc'

link_file $SOURCE'/tmux/tmux.conf' $HOME'/.tmux.conf'
