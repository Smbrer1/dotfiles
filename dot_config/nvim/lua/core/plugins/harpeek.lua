return {
  'WolfeCub/harpeek.nvim',
  dir = '~/Workspace/personal/lua/harpeek.nvim/',
  config = function()
    local harpeek = require('harpeek')
    harpeek.setup({
      format = "filename"
    })
    harpeek.open()

    vim.keymap.set('n', '<leader>h', function()
      harpeek.toggle()
    end,
      { desc = 'Harpeek' })
  end,
}
