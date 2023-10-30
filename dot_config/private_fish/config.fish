if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
set -gx GOPATH /home/asombrer01/go
set -gx PATH $PATH /usr/local/bin/go $GOPATH/bin
