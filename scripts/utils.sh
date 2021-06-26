#! /bin/bash
function _print {
  now_str=$1
  strlen=${#now_str}
  prefix=""
  suffix=" "

  if [ $(($strlen%2)) -eq 1 ]
  then
    prefix="="
    strlen=$(($strlen+1))
  fi
  strlen=$(((80-$strlen)/2-1))
  for (( i=1; i<=$strlen; i++ ))
  do
    prefix+="="
    suffix+="="
  done
  prefix+=" "

  echo $prefix$1$suffix
}

function print {
  echo -e "\033[1;36m"
  _print "$*"
  echo -e "\033[0m"
}

function print_success {
  echo -e "\033[1;32m"
  _print "$*"
  echo -e "\033[0m"
}

function print_error {
  echo -e "\033[1;31m"
  _print "$*"
  echo -e "\033[0m"
}

function print_installed {
  echo -e "\033[1;32m"
  str=$*" is already installed!"
  _print "$str"
  echo -e "\033[0m"
}

function run_cmd {
  eval $1
  if [ $? -eq 0 ]; then
    print_success "Success!"
  else
    print_error "Fail!"
  fi
}

function _brew_install {
  if brew ls --versions $1 > /dev/null; then
    print_installed $1
  else
    run_cmd "$2"
  fi
}

function brew_install {
  print "brew install "$1
  cmd="brew install $1"
  _brew_install "$1" "$cmd"
}

function cask_install {
  print "brew install --cask "$1
  cmd="brew install --cask $1"
  _brew_install "$1" "$cmd"
}

function link_dir {
  source_dir="$1"
  target_dir="$2"
  if [ -d "$target_dir" ]; then
    echo "target directory ("$target_dir") exists!"
    if [ -L "$target_dir" ]; then
      echo "remove "$target_dir
      rm "$target_dir"
    else
      target_dir_old="$target_dir"".old"
      echo "move "$target_dir" to "$target_dir_old
      mv "$target_dir" "$target_dir_old"
    fi
  fi
  ln -s "$source_dir" "$target_dir"
}

function link_file {
  source_file="$1"
  target_file="$2"
  if [ -f "$target_file" ]; then
    echo "target file ("$target_file") exists!"
    if [ -L "$target_file" ]; then
      echo "remove "$target_file
      rm "$target_file"
    else
      target_file_old="$target_file"".old"
      echo "move "$target_file" to "$target_file_old
      mv "$target_file" "$target_file_old"
    fi
  fi
  ln -s "$source_file" "$target_file"
}

function copy_file {
  source_file="$1"
  target_file="$2"
  if [ -f "$target_file" ]; then
    echo "target file ("$target_file") exists!"
    if [ -L "$target_file" ]; then
      echo "remove "$target_file
      rm "$target_file"
    else
      target_file_old="$target_file"".old"
      echo "move "$target_file" to "$target_file_old
      mv "$target_file" "$target_file_old"
    fi
  fi
  cp "$source_file" "$target_file"
}
