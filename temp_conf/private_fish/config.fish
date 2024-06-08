if status is-interactive
  _bat_envs
  _fzf_envs
  # _nnn_envs
  _carbon_fox
  zoxide init fish | source
end

set -gx GOPATH $HOME/go
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin
set -gx PATH $PATH /home/sombrer01/.cargo/bin
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx EDITOR /usr/bin/nvim
set -gx FZF_TMUX_OPTS -p 80%, 60%
set -gx FZF_TMUX 1
set -gx MANPAGER 'nvim +Man!'
set -gx MANWIDTH 999

# starship init fish | source


# Created by `pipx` on 2024-04-11 07:42:24
set PATH $PATH /home/sombrer01/.local/bin
