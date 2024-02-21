return {

  {
    'echasnovski/mini.comment',
    event = { 'BufReadPre', 'BufNewFile' },
    -- is not loaded without explicitly saying it
    config = true,
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
          gogen = { pattern = '%f[%w]()go:generate()%f[%W]', group = 'MiniHipatternsNote' },
          hex_color = hi.gen_highlighter.hex_color(),
        },
      }
    end,
  },
  {
    'echasnovski/mini.files',
    version = '*',
    config = function()
      require('mini.files').setup {
        {
          -- Customization of shown content
          content = {
            -- Predicate for which file system entries to show
            filter = nil,
            -- What prefix to show to the left of file system entry
            prefix = nil,
            -- In which order to show file system entries
            sort = nil,
          },

          -- Module mappings created only inside explorer.
          -- Use `''` (empty string) to not create one.
          mappings = {
            close = 'q',
            go_in = 'l',
            go_in_plus = 'L',
            go_out = 'h',
            go_out_plus = 'H',
            reset = '<BS>',
            reveal_cwd = '@',
            show_help = 'g?',
            synchronize = '=',
            trim_left = '<',
            trim_right = '>',
          },

          -- General options
          options = {
            -- Whether to delete permanently or move into module-specific trash
            permanent_delete = false,
            -- Whether to use for editing directories
            use_as_default_explorer = true,
          },

          -- Customization of explorer windows
          windows = {
            -- Maximum number of windows to show side by side
            max_number = math.huge,
            -- Whether to show preview of file/directory under cursor
            preview = true,
            -- Width of focused window
            width_focus = 50,
            -- Width of non-focused window
            width_nofocus = 15,
            -- Width of preview window
            width_preview = 25,
          },
        },
      }
  local minifiles_toggle = function(...)
    if not MiniFiles.close() then MiniFiles.open(...) end
  end
      vim.keymap.set('n', '-', minifiles_toggle, { desc = 'Mini files' })
    end,
  },
}
