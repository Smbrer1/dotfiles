local M = {
  "nvimtools/hydra.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    -- "anuvyklack/keymap-layer.nvim",
  },
  config = function()
    require("core.plugins.hydra.hydra")
  end,
}

return M
