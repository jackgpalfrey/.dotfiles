return {
    "nvimtools/none-ls.nvim",
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

                -- Web Dev
                formatting.prettier,

                -- Python
                formatting.black,
                diagnostics.flake8,

                -- General
                completion.spell
            }
        })

    end
}