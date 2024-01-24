return {
    "ray-x/go.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()',
}
