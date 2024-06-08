function fsb --description "Checkout branch with fzf"
  set --local pattern $argv
  set --local branches (git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
  set --local branch ( string join \n $branches | fzf-tmux -p --reverse -1 -0 +m)
  if [ "$branch" = "" ]
    echo "[$pattern] No branch matches the provided pattern"
    return
  end
  git checkout "$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"
end

