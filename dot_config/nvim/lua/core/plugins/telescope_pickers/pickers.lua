local dc = vim.deepcopy
local M = {}

local center_list = require("telescope.themes").get_dropdown({
  winblend = 10,
  line_number = false,
  width = 0.5,
  prompt = " ",
  results_height = 15,
  previewer = false,
})

M.find_buffers = function()
  local opts = dc(center_list)
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

return M
