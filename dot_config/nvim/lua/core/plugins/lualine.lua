local M = {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    {
      'kyazdani42/nvim-web-devicons',
      'meuter/lualine-so-fancy.nvim',
      -- lazy = true,
    },
  },
  opts = {
    options = {
      component_separators = { left = '│', right = '│' },
    },
    extensions = vim.g.config.plugins.lualine.extensions,
    sections = {
      lualine_a = { { 'fancy_mode' } },
      lualine_b = { { 'fancy_branch' }, { 'fancy_searchcount' } },
      lualine_c = {
        { 'fancy_cwd' },
        -- {
        --   function()
        --     return ' zina '
        --   end,
        -- },
      },
      lualine_x = { 'fancy_macro' },
      lualine_y = { { 'fancy_progress' }, { 'fancy_location' } },
      lualine_z = { { 'fancy_lsp_servers' } },
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
        {
          'filename',
          file_status = true, -- Displays file status (readonly status, modified status)
          newfile_status = false, -- Display new file status (new file means no write after created)
          path = 1, -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          -- 4: Filename and parent dir, with tilde as the home directory

          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]', -- Text to show when the file is modified.
            readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]', -- Text to show for newly created file before first write
          },
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { { 'fancy_diff' }, { 'fancy_diagnostics' } },
      lualine_y = {},
      lualine_z = {},
    },
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}
return M
