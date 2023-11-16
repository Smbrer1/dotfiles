local vo = vim.opt_local
vo.tabstop = 2
vo.shiftwidth = 2
vo.softtabstop = 2

require("core.plugins.dap.dap").setup()
