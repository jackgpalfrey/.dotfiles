return {
    "nvimtools/none-ls.nvim",
    event = { "BufRead" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        local completion = null_ls.builtins.completion

        null_ls.setup({
            sources = {
                -- Lua
                formatting.stylua,

                -- Python
                diagnostics.mypy,
                diagnostics.ruff,
                formatting.black,

                -- Web Dev
                formatting.prettier,

                -- General
                completion.spell
            }
        })

    end
}
