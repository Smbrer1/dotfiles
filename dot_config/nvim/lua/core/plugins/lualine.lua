local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'kyazdani42/nvim-web-devicons',
      lazy = true,
    },
  },
  opts = {
    extensions = vim.g.config.plugins.lualine.extensions,
    sections = {
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          function()
            return ' zina '
          end,
        },
      },
      lualine_x = {},
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    winbar = {
      lualine_a = {
        { 'filename', path = 1 },
      },
      lualine_b = { 'encoding' },
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}
return M
