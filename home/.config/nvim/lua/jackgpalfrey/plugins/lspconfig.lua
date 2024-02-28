local map = vim.keymap.set

local all_servers = require("jackgpalfrey.lsp_settings.all_servers")

local config = function()
    local lspconfig = require("lspconfig")

    -- Global Diagnostic keymaps
    map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [d]iagnostic message' })
    map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [d]iagnostic message' })
    map('n', '<leader>de', vim.diagnostic.open_float, { desc = '[E]xpand floating [d]iagnostic message' })
    map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostics [q]uicklist' })

    -- Diagnostics Config
    vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = false,
        underline = true,
        float = {
            focusable = true,
            style = "minimal",
            source = "always",
            header = "",
            prefix = "",
        }
    })


    local default_capabilities = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        return capabilities
    end

    local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(bufnr, true)
        end
    end

    for _, server in pairs(all_servers) do
        local opts = {
            capabilities = default_capabilities(),
            on_attach = on_attach
        }

        local does_exist, settings = pcall(require, "jackgpalfrey.lsp_settings." .. server)
        if does_exist then
            opts = vim.tbl_deep_extend("force", opts, settings)
        end


        if server == "lua_ls" then
            require("neodev").setup({})
        end

        lspconfig[server].setup(opts)
    end
end


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local lsp = vim.lsp.buf
        local telebin = require("telescope.builtin")

        vim.api.nvim_buf_create_user_command(ev.buf, "Format", function()
            lsp.format({ async = true })
        end, { nargs = 0, })

        vim.api.nvim_buf_create_user_command(ev.buf, "ToggleInlayHints", function()
            vim.lsp.inlay_hint.enable(ev.buf, not vim.lsp.inlay_hint.is_enabled(ev.buf))
        end, { nargs = 0, })


        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        map('n', '<leader>rn', lsp.rename, { buffer = ev.buf, desc = "[R]e[n]ame" })
        map({ 'n', 'v' }, '<leader>ca', lsp.code_action, { buffer = ev.buf, desc = "[C]ode [A]ction" })

        map('n', 'gd', telebin.lsp_definitions, { buffer = ev.buf, desc = "[G]oto [D]efinition" })
        map('n', 'gr', telebin.lsp_references, { buffer = ev.buf, desc = "[G]oto [R]eferences" })
        map('n', 'gi', telebin.lsp_implementations, { buffer = ev.buf, desc = "[G]oto [I]mplementations" })
        map('n', 'gt', telebin.lsp_type_definitions, { buffer = ev.buf, desc = "[G]oto [T]ype Definitions" })
        map('n', 'gD', lsp.declaration, { buffer = ev.buf, desc = "[G]oto [D]eclaration" })

        map('n', 'K', lsp.hover, { buffer = ev.buf, desc = "[K] Hover Documentation" })
        map({ 'n', 'i' }, '<C-k>', lsp.signature_help, { buffer = ev.buf, desc = "[C-k] Signature Documentation" })

        map('n', '<leader>wa', lsp.add_workspace_folder, { buffer = ev.buf, desc = "[W]orkspace [A]dd folder" })
        map('n', '<leader>wr', lsp.remove_workspace_folder, { buffer = ev.buf, desc = "[W]orkspace [R]emove folder" })
        map('n', '<leader>wl', function()
            print(vim.inspect(lsp.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "[W]orkspace [L]ist Folders" })

        map('n', '<leader>f', vim.cmd.Format, { buffer = ev.buf, desc = "[F]ormat" })

        map('n', '<leader>th', vim.cmd.ToggleInlayHints, { buffer = ev.buf, desc = "[T]oggle Inlay [H]ints" })
    end,
})

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "folke/neodev.nvim", },
    config = config,
}
