function novim --wraps='NVIM_APPNAME=normalvim nvim' --description 'alias novim NVIM_APPNAME=normalvim nvim'
  NVIM_APPNAME=normalvim nvim $argv
        
end
