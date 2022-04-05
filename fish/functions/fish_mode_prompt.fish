function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold 3688f7
      echo '[N]'
    case insert
      set_color --bold a7e069
      echo '[I]'
    case replace_one
      set_color --bold d77d71
      echo '[R]'
    case visual
      set_color --bold f4b13e
      echo '[V]'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end
