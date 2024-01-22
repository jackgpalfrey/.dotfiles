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
            c   = { name = "[C]ode <A>ction",   mode = {"n", "v"} },
            d   = { name = "[D]iagnostics",     mode = {"n", "v"} },
            g   = { name = "[G]it",             mode = {"n", "v"} },
            p   = { name = "[P]roject",         mode = {"n", "v"} },
            pg  = { name = "[P]roject [G]rep",  mode = {"n", "v"} },
            r   = { name = "[R]e<N>ame",        mode = {"n", "v"} },
            s   = { name = "[S]earch (Misc)",   mode = {"n", "v"} },
            t   = { name = "[T]oggle",          mode = {"n", "v"} },
            w   = { name = "[W]orkspace",       mode = {"n"}},
        }, { prefix = "<leader>" })
    end
}
