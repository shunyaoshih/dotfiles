# !/bin/bash
source ./scripts/utils.sh

if [ $# -eq 0 ]; then
  print_error 'No Arguments'
  exit
fi;

if [ "$1" == "all" ]; then
  cd scripts
  bash ./install_homebrew.sh
  bash ./install_homebrew_apps.sh
  bash ./install_python_packages.sh
  bash ./install_kitty.sh
  bash ./link_all.sh
  # bash ./change_default_apps.sh
  bash ./install_vim.sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  cd ..
  zsh
elif [ "$1" == "cask" ]; then
  cd scripts
  bash ./install_homebrew_cask_apps.sh
  cd ..
elif [ "$1" == "vim_only" ]; then
  cd scripts
  bash ./link_vim.sh
  bash ./install_vim.sh
  cd ..
elif [ "$1" == "workstation" ]; then
  cd scripts
  bash ./link_vim.sh
  bash ./link_tmux.sh
  bash ./install_vim.sh
  cd ..
elif [ "$1" == "update_vim" ]; then
  cd scripts
  bash ./update_vim.sh
  cd ..
elif [ "$1" == "clean_vim" ]; then
  cd scripts
  bash ./clean_vim.sh
  cd ..
fi;
