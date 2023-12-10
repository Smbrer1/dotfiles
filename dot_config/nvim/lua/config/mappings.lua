local utils = require("utils.functions")
local map = vim.keymap.set

-- local mapping = {
--   { "n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true } },
-- }

map("i", "jj", "<Esc>", { noremap = true })

-- Floating Comman Line
map("n", "<cmd>", "<cmd>FineCmdline<CR>", { noremap = true })

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- buffers
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>Bc", "<cmd>%bd|e#|bd#<cr>", { desc = "[C]lose all but the current [B]uffer" })
map("n", "<leader>Bd", "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "[D]elete current [B]uffer" })

-- Cancel search highlighting with ESC
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch and ESC" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
map("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Quickfix
map("n", "<leader>qj", "<cmd>cnext<cr>", { desc = "Next entry" })
map("n", "<leader>qk", "<cmd>cprevious<cr>", { desc = "Previous entry" })
map("n", "<leader>qq", "<cmd>lua require('utils.functions').toggle_qf()<cr>", { desc = "Toggle Quickfix" })
-- Search for 'FIXME', 'HACK', 'TODO', 'NOTE'
map("n", "<leader>qt", function()
  utils.search_todos()
end, { desc = "List TODOs" })

-- Tab Navigation
map("n", "<leader>tn", "gt", { desc = "[N]ext [T]ab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "[C]lose [T]ab" })

-- Buffer Navigation
-- resizing splits
map("n", "<a-c-h>", require("smart-splits").resize_left)
map("n", "<a-c-j>", require("smart-splits").resize_down)
map("n", "<a-c-k>", require("smart-splits").resize_up)
map("n", "<a-c-l>", require("smart-splits").resize_right)
-- moving between splits
map("n", "<c-h>", require("smart-splits").move_cursor_left)
map("n", "<c-j>", require("smart-splits").move_cursor_down)
map("n", "<c-k>", require("smart-splits").move_cursor_up)
map("n", "<c-l>", require("smart-splits").move_cursor_right)

-- Python fixtures
map("n", "gF", "<cmd>PytrizeJumpFixture<cr>", { desc = "Go to Fixture defenition" })

-- DataBase connect UI
map("n", "<leader>cd", "<cmd>DBUIToggle<cr>", { desc = "DataBase" })
-- Page Navigation
map("n", "<c-d>", "<c-d>zz")
map("n", "<c-u>", "<c-u>zz")

-- Inlay Hint
if vim.lsp.inlay_hint then
  map("n", "<leader>ch", function()
    if vim.lsp.inlay_hint.is_enabled(0) then
      vim.lsp.inlay_hint.enable(0, false)
    else
      vim.lsp.inlay_hint.enable(0, true)
    end
  end, { desc = "Inlay Hint" })
end

-- Terminal Management
map("t", "<esc>", "<c-\\><c-n>", { noremap = true })

-- LSP hover
map('n', 'K', vim.lsp.buf.hover, {desc="Hover doc"})


map('n', '<leader>th', "<cmd> Hardtime toggle<cr>", {desc = "Remove bad habbits"})
