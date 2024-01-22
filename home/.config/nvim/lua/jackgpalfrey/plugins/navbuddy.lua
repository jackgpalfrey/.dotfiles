return {
    "SmiteshP/nvim-navbuddy",
    event = { "LspAttach" },
    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } },
    keys = {
        { "<leader>o", vim.cmd.Navbuddy, desc = "File [O]utline" },
    }
}
