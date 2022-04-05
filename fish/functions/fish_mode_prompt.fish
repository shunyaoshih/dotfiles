function fish_mode_prompt
  set_color --bold 000000
  switch $fish_bind_mode
    case default
      set_color -b 3688f7
      echo '[N]'
    case insert
      set_color -b a7e069
      echo '[I]'
    case replace_one
      set_color -b d77d71
      echo '[R]'
    case visual
      set_color -b f4b13e
      echo '[V]'
    case '*'
      set_color -b red
      echo '?'
  end
  set_color normal
end
