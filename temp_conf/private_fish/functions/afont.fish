function afont
  if $ALACRITTY_FONT
    pfont
    set -Ux ALACRITTY_FONT false
  else
    mfont
    set -Ux ALACRITTY_FONT true
  end
end
