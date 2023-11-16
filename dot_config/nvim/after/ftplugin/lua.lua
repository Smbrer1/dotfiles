local wk = require("which-key")
wk.register({
  c = {
    name = "Coding",
    r = {
      function()
        require("luapad.run").run()
      end,
      "Run buffer content",
    },
    l = {
      function()
        require("luapad").init()
      end,
      "Luapad",
    },
  },
}, { prefix = "<leader>", mode = "n" })
