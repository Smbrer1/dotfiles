function ts --wraps='tms start' --wraps='tmux -L default new -A -s first -t globalsesh' --description 'alias ts tmux -L default new -A -s first -t globalsesh'
  tmux -L default new -A -s first -t globalsesh $argv
        
end
