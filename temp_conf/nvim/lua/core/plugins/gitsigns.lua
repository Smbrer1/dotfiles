local M = {
  'lewis6991/gitsigns.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local function mappings()
      local wk = require 'which-key'
      local default_options = { silent = true }
      local gs = package.loaded.gitsigns
      local map = require('utils.functions').map

      wk.register({
        g = {
          name = 'Git',
          ['<Enter>'] = { "<cmd>lua require('neogit').open({kind='replace'})<cr>", 'Neogit' },
          S = { gs.stage_buffer, 'Stage buffer' },
          s = { gs.stage_hunk, 'Stage hunk', mode = { 'n', 'v' } },
          u = { gs.undo_stage_hunk, 'Undo stage hunk' },
          r = {
            name = 'Reset',
            R = { gs.reset_buffer, 'Reset buffer' },
            r = { gs.reset_hunk, 'Reset hunk', mode = { 'n', 'v' } },
          },
          p = { gs.preview_hunk, 'Preview hunk' },
          B = {
            function()
              gs.blame_line { full = true }
            end,
            'Blame full',
          },
          b = { gs.toggle_current_line_blame, 'Blame line' },
          D = { gs.diffthis, 'Diff' },
          d = { gs.toggle_deleted, 'Show deleted' },
        },
      }, { prefix = '<leader>', mode = 'n', default_options })

      wk.register {
        [']'] = {
          c = {
            function()
              if vim.wo.diff then
                return ']c'
              end
              vim.schedule(function()
                gs.next_hunk()
              end)
              return '<Ignore>'
            end,
            'Next hunk',
            expr = true,
          },
        },
        ['['] = {
          c = {
            function()
              if vim.wo.diff then
                return ']c'
              end
              vim.schedule(function()
                gs.next_hunk()
              end)
              return '<Ignore>'
            end,
            'Previous hunk',
            expr = true,
          },
        },
      }

      map({ 'o', 'x' }, 'gH', '<cmd><C-U>Gitsigns select_hunk<cr>', { desc = 'Select hunk' })
    end
    require('gitsigns').setup {
      signs = {
        add = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
    }
    mappings()
  end,
}

return M
