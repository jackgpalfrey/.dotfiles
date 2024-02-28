return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            conf = function()
                return vim.fn.executable "make" == 1
            end,
        },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false,
                },
            },
        },
    },
    config = function()
        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local telebin = require "telescope.builtin"
        local telethem = require "telescope.themes"
        vim.api.nvim_create_user_command("TelescopeGrepCurrentBuffer", function()
            telebin.current_buffer_fuzzy_find(telethem.get_dropdown { winblend = 10, previewer = false })
        end, {})
    end,
    keys = {
        { "<leader>?",   "<cmd>Telescope oldfiles<cr>",         desc = "[?] Search recently opened buffers", mode = { "n", "v" } },
        { "<leader>/",   "<cmd>TelescopeGrepCurrentBuffer<cr>", desc = "[/] Search grep in current buffer",  mode = { "n", "v" } },

        { "<leader>pf",  "<cmd>Telescope find_files<cr>",       desc = "Search [P]roject [F]iles",           mode = { "n", "v" } },
        { "<leader>pgf", "<cmd>Telescope live_grep<cr>",        desc = "Search [P]roject [G]rep [F]uzzy",    mode = { "n", "v" } },
        { "<leader>pgs", "<cmd>Telescope grep_string<cr>",      desc = "Search [P]roject [G]rep [S]tring",   mode = { "n", "v" } },

        { "<C-p>",       "<cmd>Telescope git_files<cr>",        desc = "Search Git Files",                   mode = { "n", "v" } },
        { "<leader>gf",  "<cmd>Telescope git_files<cr>",        desc = "Search [G]it [F]iles",               mode = { "n", "v" } },
        { "<leader>gc",  "<cmd>Telescope git_commits<cr>",      desc = "Search [G]it [C]ommits",             mode = { "n", "v" } },
        { "<leader>gb",  "<cmd>Telescope git_branches<cr>",     desc = "Search [G]it [B]ranches",            mode = { "n", "v" } },

        { "<leader>ss",  "<cmd>Telescope<cr>",                  desc = "[S]earch Telescope [S]earches",      mode = { "n", "v" } },
        { "<leader>sh",  "<cmd>Telescope help_tags<cr>",        desc = "[S]earch [H]elp",                    mode = { "n", "v" } },
    },
}
