function vim
  if test -n "$argv"
      set -l path (zoxide query $argv)
      z $path
  end
  nvim
end
