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
      lualine_x = {
        { 'filename', path = 1 },
      },
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
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}
return M
