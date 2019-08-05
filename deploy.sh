# !/bin/bash
cd scripts
source ./utils.sh

if [ $# -eq 0 ]; then
  print_error 'No Arguments'
  exit
fi;

bash ./install_homebrew.sh

if [ "$1" == "all" ]; then
  bash ./deploy_useful_homebrew_apps.sh
  bash ./deploy_vim.sh
  bash ./deploy_zsh.sh
  bash ./deploy_tmux.sh
  bash ./deploy_vifm.sh
  bash ./deploy_minimal_homebrew_cask_apps.sh
  bash ./deploy_fonts.sh
  zsh
elif [ "$1" == "cask" ]; then
  bash ./deploy_homebrew_cask_apps.sh
elif [ "$1" == "vim" ]; then
  bash ./deploy_vim.sh
elif [ "$1" == "zsh" ]; then
  bash ./deploy_zsh.sh
elif [ "$1" == "tmux" ]; then
  bash ./deploy_tmux.sh
elif [ "$1" == "vifm" ]; then
  bash ./deploy_vifm.sh
elif [ "$1" == "fonts" ]; then
  bash ./deploy_fonts.sh
fi;
