local M = {
  "ThePrimeagen/harpoon",
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    "gh",
    "gH",
  },
  config = function()
    require("harpoon").setup({
      global_settings = {
        mark_branch = true,
      },
    })

    local keymap = vim.keymap

    local function toggle_move()
      if vim.v.count > 0 then
        -- this does not work (yet?)
        -- require('harpoon.ui').nav_file(vim.v.count)
        return '<cmd>lua require("harpoon.ui").nav_file(vim.v.count)<CR>'
      else
        require("harpoon.mark").toggle_file()
      end
    end
    keymap.set("n", "gh", toggle_move, { expr = true })
    keymap.set("n", "gH", require("harpoon.ui").toggle_quick_menu)
  end,
}
return M
