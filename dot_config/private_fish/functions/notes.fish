alias notes='z "$(fd . "$HOME/Notes" --type d --exclude .git -d 2 | fzf --cycle --preview "eza --tree --color=always {}")"'
