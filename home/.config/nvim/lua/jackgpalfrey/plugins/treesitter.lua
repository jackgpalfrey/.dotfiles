local opts = {
    ensure_installed = {"c", "cpp", "go", "lua", "python", "rust", "tsx", "javascript", "typescript", "vimdoc", "vim", "bash"},

    auto_install = true,

    highlight = { enable = true, additional_vim_regex_highlighting = false},
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremenatal = "<M-space>"
        }
    },
    textobjects = {
        select = { enable = true, lookahead = true, },
        move = { set_jumps = true },
        swap = { enable = true, },
    }
}

local setup = function()
    require("nvim-treesitter.configs").setup(opts)
end

local config = function()
    vim.defer_fn(setup,0)
end


return {
    "nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", },
    build = ":TSUpdate",
    config = config
}
