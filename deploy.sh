# !/bin/bash
source ./scripts/utils.sh

if [ $# -eq 0 ]; then
  print_error 'No Arguments'
  exit
fi;

bash ./install_homebrew.sh

if [ "$1" == "all" ]; then
  cd scripts
  bash ./install_homebrew_apps.sh
  bash ./install_python_packages.sh
  bash ./link_all.sh
  # bash ./change_default_apps.sh
  bash ./install_vim.sh
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  zsh
elif [ "$1" == "cask" ]; then
  cd scripts
  bash ./install_homebrew_cask_apps.sh
elif [ "$1" == "vim" ]; then
  cd scripts
  bash ./deploy_vim.sh
elif [ "$1" == "zsh" ]; then
  cd scripts
  bash ./deploy_zsh.sh
elif [ "$1" == "tmux" ]; then
  cd scripts
  bash ./deploy_tmux.sh
fi;
