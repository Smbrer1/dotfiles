local wk = require("which-key")

local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-python",
  },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup({
      -- your neotest config here
      adapters = {
        require("neotest-go"),
        require("neotest-python"),
      },
    })
    wk.register({
      c = {
        t = {},
      },
    }, { prefix = "<leader>", mode = "n" })
  end,
}
return M

-- map("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>", { desc = "[T]est [T]his" })
-- map("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "[T]est [F]ile" })
-- map("n", "<leader>tp", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", { desc = "[T]est [P]roject" })
-- map("n", "<leader>tw", "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>", { desc = "[T]est [W]atch" })
-- map("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "[T]est [S]ummary" })
-- map(
--   "n",
--   "<silent>[n",
--   '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>',
--   { desc = "Jump to prev failed test" }
-- )
-- map(
--   "n",
--   "<silent>]n",
--   '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>',
--   { desc = "Jump to next failed test" }
-- )
--
