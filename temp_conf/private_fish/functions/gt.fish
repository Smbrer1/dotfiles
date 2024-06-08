function gt --description 'jump to top level of git repo'
cd (git rev-parse --show-toplevel) $argv
end
