local null_ls = require("null-ls")
local nullfmt = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
  "nvimtools/none-ls.nvim",
  opts = {
    sources = {
      -- Go formatting tools
      nullfmt.gofumpt,
      nullfmt.goimports_reviser,
      nullfmt.golines,
      -- Python formatting tools
      nullfmt.ruff,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end,
  },
}
