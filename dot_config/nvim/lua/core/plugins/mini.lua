local plugins = vim.g.config.plugins

return {

  {
    'echasnovski/mini.comment',
    event = { 'BufReadPre', 'BufNewFile' },
    -- is not loaded without explicitly saying it
    config = true,
  },

  {
    'echasnovski/mini.align',
    event = { 'BufReadPre', 'BufNewFile' },
    -- is not loaded without explicitly saying it
    config = true,
  },

  {
    'echasnovski/mini.test',
    event = { 'BufReadPre', 'BufNewFile' },
  },

  {
    'echasnovski/mini.hipatterns',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local hi = require 'mini.hipatterns'
      return {
        highlighters = {
          -- Highlight 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
          hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
          todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
          note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
          hex_color = hi.gen_highlighter.hex_color(),
          -- TODO: tailwind integration?
        },
      }
    end,
  },

  {
    'echasnovski/mini.files',
    event = { 'VimEnter' },
    opts = {
      windows = {
        -- Whether to show preview of directory under cursor
        preview = true,
      },
    },
    config = function(_, opts)
      local show_dotfiles = true
      local filter_show = function()
        return true
      end
      local filter_hide = function(fs_entry)
        return not vim.startswith(fs_entry.name, '.')
      end
      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        MiniFiles.refresh { content = { filter = new_filter } }
      end
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesBufferCreate',
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set('n', 'H', toggle_dotfiles, { desc = 'Toggle hidden files', buffer = buf_id })
        end,
      })
      require('mini.files').setup(opts)
    end,
    keys = {
      {
        '-',
        function()
          MiniFiles.open()
        end,
        desc = 'Open Mini Files',
      },
    },
  },

  {
    'echasnovski/mini.pick',
    event = { 'VimEnter' },
    opts = {
      mappings = plugins.mini_pick.mappings,
    },
    config = function(_, opts)
      require('mini.pick').setup(opts)
    end,
  },
}
