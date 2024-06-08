function mfont --wraps='mv alacritty.toml temp && mv alacritty alacritty.toml' --description 'alias mfont mv alacritty.toml temp && mv alacritty alacritty.toml'
  set ala ~/.config/alacritty
  mv "$ala/alacritty.toml" "$ala/temp" && mv "$ala/alacritty" "$ala/alacritty.toml" $argv

end
