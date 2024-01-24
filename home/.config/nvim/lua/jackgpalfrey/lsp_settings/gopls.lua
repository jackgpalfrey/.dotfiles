return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            completeUnimported = true,
            gofumpt = true,
            analyses = {
                unusedvariable = true,
                unusedparam = true,
                staticcheck = true, -- EXPERIMENTAL
                vulncheck = true, -- EXPERIMENTAL
            },
        },
    },
}
