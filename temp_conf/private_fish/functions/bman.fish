function bman
  set -l page (man -k . | fzf-tmux --nth 1,2)
  echo $page | awk 'BEGIN {ORS=" "}; {print $2} {print $1}'| tr -d '()' | xargs man
end

