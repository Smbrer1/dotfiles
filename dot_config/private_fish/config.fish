if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx GOPATH /home/sombrer01/go
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin
set -gx XDG_CONFIG_HOME /home/sombrer01/.config
set -gx EDITOR /usr/bin/nvim
