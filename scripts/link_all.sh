# !/bin/bash
source ./utils.sh

SOURCE=$HOME'/Github/dotfiles'

print 'Link Dotfiles'
./link_vim.sh
./link_neovim.sh
./link_ideavim.sh
./link_zsh.sh
./link_tmux.sh
./link_vifm.sh
./link_hyper.sh
