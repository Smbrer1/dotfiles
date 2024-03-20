alias conf='z "$(fd . "$HOME/.config" --type d --exclude .git -d 1 | fzf-tmux --cycle --preview "eza --tree --color=always {}")"'
