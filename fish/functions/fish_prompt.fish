function fish_prompt
  set_color c0caf5
  echo -n "["(date "+%H:%M")"] "
  if [ $PWD != $HOME ]
    set_color e0af68
    echo -n (prompt_pwd)
  end
  set_color 9ece6a
  printf '%s ' (__fish_git_prompt)
  set_color c0caf5
  printf '\n'
  echo -n '$ '
end
