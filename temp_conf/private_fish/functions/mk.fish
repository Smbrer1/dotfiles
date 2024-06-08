function mk --description "Run Makefile target"
  set target $(make -qp | grep '^[a-z0-9-]\+:' | fzf-tmux)
  set target $(string split : $target)
  make $target[1]
end
