local M = {
  "rmagatti/session-lens",
  dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
  config = function()
    require("session-lens").setup({
      path_display = { "shorten" },
    })
  end,
}
return M
