function vff --wraps='vf activate autotestsvc' --wraps='vf activate $(vf ls | fzf-tmux)' --description 'alias vff vf activate $(vf ls | fzf-tmux)'
  vf activate $(vf ls | fzf-tmux) $argv
        
end
