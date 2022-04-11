function fish_mode_prompt
  set_color --bold 000000
  switch $fish_bind_mode
    case default
      set_color -b 0080CB
      echo '[N]'
    case insert
      set_color -b 87D700
      echo '[I]'
    case replace_one
      set_color -b FF548C
      echo '[R]'
    case visual
      set_color -b FFAF5F
      echo '[V]'
    case '*'
      set_color -b 9F0036
      echo '?'
  end
  set_color normal
end
