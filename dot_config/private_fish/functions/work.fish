alias work='z "$(fd . "$HOME/Workspace" --type d --exclude .git -d 3 | fzf --cycle --preview "exa --tree --color=always {}")"'
