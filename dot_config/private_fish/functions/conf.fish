alias conf='z "$(fd . "$HOME/.config" --type d --exclude .git -d 1 | fzf --cycle --preview "eza --tree --color=always {}")"'
