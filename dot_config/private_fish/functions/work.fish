alias work='cd "$(fd . "$HOME/Workspace" --type d --exclude .git | fzf --cycle --preview "tree -C {}")"'
