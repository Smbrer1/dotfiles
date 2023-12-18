local M = {
  "goolord/alpha-nvim",
  event = 'VimEnter',
  opts = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    local header = {
      '                                                                               ',
      '                         ░     ░░  ▄█▓▌ ░░ ░   ░                               ',
      '▄▄    ▀▀▓▓█▄▄▄   ▄▄███▄          ▄▓████▄                   ▄▄    ▀▀▓▓▄▄▄       ',
      ' ▀▓▓▓▄▄  ▀▓███▓▓▄ ▀██▓▓█▄▄▄    ▄▓▓▓▓█████▄▄    ▄ ■▄▓▄▄      ▀▓▓▓▄▄   ▀███▓▓▄   ',
      '  ▐▓████▓▄  ▀███▓▓▄ ██▓▌  ▀▓██▄ ▀▀▀████▓▀▀███▄▄▄   ▀████▄▄   ▐▓████▓▓▄ ▀███▓▓▄ ',
      '   ████▓▓▌   ▐███▓▓▌ ▀▀▀■  ▐█████▓▄ ▀ ▄▄▄████▓▀ ▄▀   █▓███▓▄  ████▓▓▌   ▐███▓▓▌',
      '   ▐████▓   ▄████▓▀ ▄▓▓▄    ███▓█▌ ▄██████▓▀▀ ▄▓▌    ▐▓████▓▓▄ ▀███▓   ▄████▓▀ ',
      '    ████▓ ▀▀▀▀▀▀ ▄▄███▀██▄▄ ▐█▓▓▓ ████▓▀▀  ▄██▓▓▌     █▀▓▀██▓▓▌ ███▓■▀██▀▀▀    ',
      '    ███▓▓▌■▀▓██▄▄ ▀██▄▓▄██▀▀■██▓▌  ▀██▄█▓▄▄ ▀▀█▓▓     ▐█▄███▓▓▌ ██▓▓  ▐███▄▄   ',
      '   ▐██▓▓▓▓  ▐███▓▓▄ ▀███▀    ██▓▓    ▀█████▓▓▄▄▄      ▐█████▓▓ ▐█▓▓▓   ▓███▓▓▄ ',
      '  ▄█████▓▓▓▄ ████▓▓▌ ██▓▌   ▐███▓▓     ▀██████▓▓▓▓▀  ▄█████▓▀ ▄████▓▌  ▐████▓▓▌',
      '■▀▀▀   ▀▀▓▀ ▐█████▓▓ ▐▓▓▓▓▄▄▓████▓▓      ▀███▓▓▀  ■▄▓██▓▓▀▀ ▄█▀   ▀▀▀  ▀▀▀███▓▓',
      '          ▄▓▓▓███▓▓▓▌ ▀▓▓▀▀     ▀█▓▓       ▓▓▀      ▀▀▀    ▄▀               ▀▀▓',
      '                ▀▀▀▓▓▄            ▀▓▓▄      ▀▄           ▄                     ',
      ' <cH!RiGOR>          ▀▓             ▀▓▌        ▀ ■ ▄ ■ ▀     1 9 1 1           ',
      '                      ▀▄             ▐▌                                        ',
      '                                                                               ', }

    local footer = [[
                                          [ZINA]
      ▀██████▓▓███████▓▓▓▓███████████▓▓▓▓▓███████▓▓▓▓██▄██████▓▓▓▓▓███████▄█▓▓▓▓██████▀
       ▐▀▓▓▀     ▀▀▄ ▀▀▀▀▀▀▀▄▀▀▀▀▀▀▀▀■▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▄▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█AS██
        ▐█▀▄      ▄▄ ▀                                                ▄▀▀▀▄▄   █▓▓█▌
        ▀   ▀▀▄▄▄■   ▀▄           -  N  E  O  V  i  M  -           ■▀       ▀▄▄███▀
       ▀                                                                         ▀▄
    ]]
    dashboard.section.header.val = header
    dashboard.section.footer.val = footer

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
      dashboard.button("c", "  > Config", ":e $MYVIMRC | :cd %:p:h | wincmd k | pwd<CR> "),
      dashboard.button("q", "󰗼  > Quit NVIM", ":qa<CR>"),
    }


    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = 'AlphaHeader'
      button.opts.hl_shortcut = 'AlphaHeader'
    end
    dashboard.opts.layout = {
      dashboard.section.header,
      -- { type = "padding", val = 4 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }
    -- Disable folding on alpha buffer
    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    ]])
    return dashboard
  end,
  config = function(_, dashboard)
    -- close lazy and re-open when the dashboard is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end
    require('alpha').setup(dashboard.opts)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
return M
