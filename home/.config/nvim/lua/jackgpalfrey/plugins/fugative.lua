return {
    "tpope/vim-fugitive",
    event = { "VeryLazy" },
    keys = {
        { "<leader>gs", vim.cmd.Git, desc = "[G]it [S]tatus" },
    },
}
