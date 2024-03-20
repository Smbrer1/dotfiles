if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx GOPATH /home/sombrer01/go
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin
set -gx PATH $PATH /home/sombrer01/.cargo/bin
set -gx XDG_CONFIG_HOME /home/sombrer01/.config
set -gx EDITOR /usr/bin/nvim
# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually
# ~/.config/fish/config.fish):
#
zoxide init fish | source
