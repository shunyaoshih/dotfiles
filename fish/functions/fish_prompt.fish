function fish_prompt
  set_color 808080
  echo -n "["(date "+%H:%M")"] "
  set_color 6c6c6c
  echo -n (hostname)
  if [ $PWD != $HOME ]
    set_color 808080
    echo -n ':'
    set_color fffc87
    echo -n (prompt_pwd)
  end
  set_color green
  printf '%s ' (__fish_git_prompt)
  set_color normal
  printf '\n' (fish_mode_prompt)
  echo -n '$ '
end
