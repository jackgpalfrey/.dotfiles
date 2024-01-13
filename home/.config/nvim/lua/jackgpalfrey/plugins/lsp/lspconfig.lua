local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        }
    },
    html = {
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx"
        },
    },
    emmet_ls = {
        init_options = {
            html = {
                options = {
                    ["bem.enabled"] = true,
                }
            }
        }
    },
    cssls = {},
    tsserver = {
        settings = {
            typescript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            javascript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            completions = {
                completeFunctionCalls = true,
            },
        },
    },
    -- ESLint
    eslint = {
        settings = {
            -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
            workingDirectory = { mode = "auto" },
        },
    },
    tailwindcss = { filetypes_exclude = { "mardown" } },
    pyright = {},
    svelte = {},
    pylsp = {
        pylsp = {
            plugins = {
                -- Formatters
                pyls_isort = { enabled = true },
                autopep8 = { enabled = true },
                yapf = { enabled = false },
                black = { enabled = false },
                -- Linters
                flake8 = { enabled = true },
                mccabe = { enabled = false },      -- Included in flake8
                pycodestyle = { enabled = false }, -- Included in flake8
                pyflakes = { enabled = false },    -- Included in flake8
                pydocstyle = { enabled = true },
                pylint = { enabled = false },      -- Disabled for time being
                -- Type Checking
                pylsp_mypy = {
                    enabled = true,
                    skip_token_initialization = true,
                    -- overrides = { "--python-executable", get_py_path(), true },
                    -- report_progress = true,
                },
                -- Import handling
                rope_autoimport = { enabled = false }, -- Bit slow requires further testing
                -- Autocompletion
                rope_completion = { enabled = false },
                jedi_completion = { fuzzy = true },
            }
        }
    }
}



local on_attach = function(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then desc = "LSP: " .. desc end
        local opts = { desc = desc }
        opts.silent = true
        opts.buffer = bufnr
        vim.keymap.set("n", keys, func, opts)
    end

    local lsp = vim.lsp.buf
    nmap("<leader>rn", lsp.rename, "[R]e[n]ame")
    nmap("<leader>ca", lsp.code_action, "[C]ode [A]ction")

    local telebin = require("telescope.builtin")
    nmap("gd", telebin.lsp_definitions, "[G]oto [D]efinitions")
    nmap("gr", telebin.lsp_references, "[G]oto [R]eferences")
    nmap("gi", telebin.lsp_implementations, "[G]oto [I]mplementations")
    nmap("gt", telebin.lsp_type_definitions, "[G]oto [T]ype Defintion")
    nmap("<leader>ds", telebin.lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", telebin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    --
    nmap("K", lsp.hover, "Hover Documentation")
    nmap("<C-k>", lsp.signature_help, "Signature Documentation")

    nmap("gD", lsp.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", lsp.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", lsp.remove_workspace_folder, "[W]orkspace [R]emove Folder")

    nmap("<leader>wl", function()
        print(vim.inspect(lsp.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

local config = function()
    local lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    lspconfig.setup()

    require("neodev").setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

    lspconfig.setup({ ensure_installed = vim.tbl_keys(servers) })

    lspconfig.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes
            })
        end
    })
end

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "folke/neodev.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true }
    },
    config = config
}
