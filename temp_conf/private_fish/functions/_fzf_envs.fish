function _fzf_envs
  set -gx FZF_DEFAULT_OPTS "\
  --color=fg:#d0d0d0,fg+:#f2f4f8,bg:#121212,bg+:#262626 \
  --color=hl:#78a9ff,hl+:#33b1ff,info:#ee5396,marker:#42be65 \
  --color=prompt:#be95ff,spinner:#ff7eb6,pointer:#ff7eb6,header:#82cfff \
  --color=border:#525252,label:#aeaeae,query:#dde1e6 \
  --border-label-pos='0' --preview-window='sharp' --padding='1' \
  --prompt='❯ ' --marker='❯ ' --pointer='❯ ' \
  --scrollbar='│' \
  --preview-window=right"

  set -gx _ZO_FZF_OPTS "
    --color=fg:#d0d0d0,fg+:#f2f4f8,bg:#121212,bg+:#262626 \
    --color=hl:#78a9ff,hl+:#33b1ff,info:#ee5396,marker:#42be65 \
    --color=prompt:#be95ff,spinner:#ff7eb6,pointer:#ff7eb6,header:#82cfff \
    --color=border:#525252,label:#aeaeae,query:#dde1e6 \
    --border-label-pos='0' --preview-window='border-bold' --padding='1' \
    --prompt='❯ ' --marker='❯ ' --pointer='❯ ' \
    --scrollbar='│' \

    --exact \
    --no-sort \
    --bind=ctrl-z:ignore,btab:up,tab:down \
    --cycle \
    --keep-right \
    --reverse \
    --border=sharp \
    --tabstop=1 \
    --select-1 \
    --preview='command -p eza --color=always --group-directories-first {2..}' \
    --preview-window=right,30%,sharp"
end
