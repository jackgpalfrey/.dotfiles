return {
    "tpope/vim-fugitive",
    config = function()
        nmap("<leader>gs", vim.cmd.Git, "[G]it [S]tatus")
    end
}
