function pfont --wraps='mv alacritty.toml alacritty && temp alacritty.toml' --wraps='mv alacritty.toml alacritty && mv temp alacritty.toml' --description 'alias pfont mv alacritty.toml alacritty && mv temp alacritty.toml'
  set ala ~/.config/alacritty
  mv "$ala/alacritty.toml" "$ala/alacritty" && mv "$ala/temp" "$ala/alacritty.toml" $argv

end
