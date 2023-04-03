function fish_mode_prompt
  set_color --bold 000000
  switch $fish_bind_mode
    case default
      set_color -b 81a3f1
      echo '[N]'
    case insert
      set_color -b 9ece6a
      echo '[I]'
    case replace_one
      set_color -b f7768e
      echo '[R]'
    case visual
      set_color -b 9d7cd8
      echo '[V]'
    case '*'
      set_color -b normal
      echo '?'
  end
  set_color normal
end
