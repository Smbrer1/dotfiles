local keymap = vim.keymap

-- Floating Comman Line
keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- NeoTree Mappings
keymap.set('n', '<leader>ft', '<cmd> Neotree toggle<cr>', { desc = '[F]ile [T]ree' })
keymap.set('n', '<leader>gs', '<cmd> Neotree git_status float<cr>', { desc = '[G]it [S]tatus' })

-- Tab Navigation
keymap.set('n', '<leader>nt', 'gt', { desc = "[N]ext [T]ab" })
keymap.set('n', '<leader>ct', ':tabclose<cr>', { desc = "[C]lose [T]ab" })

-- Buffer Navigation
-- resizing splits
keymap.set('n', '<a-h>', require('smart-splits').resize_left)
keymap.set('n', '<a-j>', require('smart-splits').resize_down)
keymap.set('n', '<a-k>', require('smart-splits').resize_up)
keymap.set('n', '<a-l>', require('smart-splits').resize_right)
-- moving between splits
keymap.set('n', '<c-h>', require('smart-splits').move_cursor_left)
keymap.set('n', '<c-j>', require('smart-splits').move_cursor_down)
keymap.set('n', '<c-k>', require('smart-splits').move_cursor_up)
keymap.set('n', '<c-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- Page Navigation
keymap.set('n', '<c-d>', '<c-d>zz')
keymap.set('n', '<c-u>', '<c-u>zz')

-- Formatting and LSP
keymap.set('n', '<leader>ff', '<cmd> Format <cr>', { desc = '[F]ormat [F]ile' })

-- Inlay Hint
if vim.lsp.inlay_hint then
  keymap.set(
    'n', '<leader>ih', function() vim.lsp.inlay_hint(0, nil) end,
    { desc = 'LSP: [I]nlay [H]int' }
  )
end

-- Telescope Extensions
keymap.set('n', '<leader>hl', ':Telescope harpoon marks<cr>', { desc = 'Telescope [H]arpoon marks [L]ist' })
keymap.set('n', '<leader>cy', ':Telescope neoclip <cr>', { desc = '[C]hange [Y]ank' })

-- Terminal Management
keymap.set('n', '<c-t>/', ':ToggleTerm direction=vertical<cr>', { desc = "Open [T]erminal Vertical" })
keymap.set('n', "<c-t>'", ':ToggleTerm direction=horizontal<cr>', { desc = "Open [T]erminal Horizontal" })
keymap.set('t', '<esc>', '<c-\\><c-n>', { noremap = true })

-- Neotest Config
keymap.set('n', '<leader>tt', "<cmd>lua require('neotest').run.run()<cr>",
  { desc = '[T]est [T]his' })
keymap.set('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
  { desc = '[T]est [F]ile' })
keymap.set('n', '<leader>tp', "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>",
  { desc = '[T]est [P]roject' })
keymap.set('n', '<leader>tw', "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>",
  { desc = '[T]est [W]atch' })
keymap.set('n', '<leader>ts', "<cmd>lua require('neotest').summary.toggle()<cr>",
  { desc = '[T]est [S]ummary' })
keymap.set('n', '<silent>[n', '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>',
  { desc = "Jump to prev failed test" })
keymap.set('n', '<silent>]n', '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>',
  { desc = "Jump to next failed test" })

-- NavBuddy Mappings
keymap.set('n', '<leader>nb', ":lua require('nvim-navbuddy').open()<cr>", { desc = 'Open [N]av[B]uddy' })

-- Trouble Mappings
keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,
  { desc = "Toggle Trouble [W]orkspace" })
keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,
  { desc = "Toggle Trouble [D]iagnostics" })
keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Toggle Trouble [Q]uicfix" })
keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Toggle Trouble [L]oclist" })
keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end,
  { desc = "Toggle Trouble LSP [R]eference" })

-- DataBase Integration
keymap.set('n', "<leader>db", "<cmd>DBUIToggle<cr>", { desc = "Toggle [D]ata [B]ase UI" })

-- QuickFix and LocationList
local noremap_silent = { noremap = true, silent = true, desc = "Toggle List" }

keymap.set('n', '=l', function()
  local win = vim.api.nvim_get_current_win()
  local qf_winid = vim.fn.getloclist(win, { winid = 0 }).winid
  local action = qf_winid > 0 and 'lclose' or 'lopen'
  vim.cmd(action)
end, noremap_silent)

keymap.set('n', '=q', function()
  local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
  local action = qf_winid > 0 and 'cclose' or 'copen'
  vim.cmd('botright ' .. action)
end, noremap_silent)

-- vim: ts=2 sts=2 sw=2 et
