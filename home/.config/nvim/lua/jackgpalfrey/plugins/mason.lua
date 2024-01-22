local all_servers = require("jackgpalfrey.lsp_settings.all_servers")

return {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufRead" },
    dependencies = {
        { "williamboman/mason.nvim", opts = { } },
        "nvim-lua/plenary.nvim",
    },
    opts = {
        ensure_installed = all_servers,
    },
}
