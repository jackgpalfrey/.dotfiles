return {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
        plugin = require("onedark")
        vim.cmd.colorscheme("onedark")

        plugin.setup({style = "darker"})
        plugin.load()
    end,
}
