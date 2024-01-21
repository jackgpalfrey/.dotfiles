return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = { },
  config = function()
    local wk = require("which-key")
    wk.register({
        p = { name = "[P]roject",       mode = {"n", "v"} },
        g = { name = "[G]it",           mode = {"n", "v"} },
        s = { name = "[S]earch (Misc)", mode = {"n", "v"} },
        d = { name = "[D]iagnostics",   mode = {"n", "v"} },
    }, { prefix = "<leader>" })
  end
}
