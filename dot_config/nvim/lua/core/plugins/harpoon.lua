local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = 'nvim-lua/plenary.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():append()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-t>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-m>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-g>', function()
      harpoon:list():select(4)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-R-P>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-R-N>', function()
      harpoon:list():next()
    end)
  end,
}
return M
