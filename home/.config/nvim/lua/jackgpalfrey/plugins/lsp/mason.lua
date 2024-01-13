local ensure_installed = {}






local config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()
    mason_lspconfig.setup({
        ensure_installed = ensure_installed,
        automatic_installation = true,
    })
end


return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim"
    },
    config = config
}
