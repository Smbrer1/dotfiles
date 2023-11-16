local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    {
      "kyazdani42/nvim-web-devicons",
      lazy = true,
    },
  },
  opts = {
    extensions = vim.g.config.plugins.lualine.extensions,
    sections = {
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        {
          function()
            return " zina "
          end,

          function()
            return require("auto-session.lib").current_session_name()
          end,
        },
      },
      lualine_x = { "buffers" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
return M
