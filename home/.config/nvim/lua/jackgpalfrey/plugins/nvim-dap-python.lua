return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "nfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
    end,

}
