alias work='z "$(fd . "$HOME/Workspace" --type d --exclude .git -d 3 | fzf-tmux --cycle --preview "eza --tree --color=always {}")"'
