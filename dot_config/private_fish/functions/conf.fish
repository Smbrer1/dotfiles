alias conf='z "$(fd . "$HOME/.config" --type d --exclude .git -d 1 | fzf --cycle --preview "exa --tree --color=always {}")"'
