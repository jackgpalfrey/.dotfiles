local next_hunk = function()
    require("gitsigns").next_hunk({navigation_message = false})
end

local prev_hunk = function()
    require("gitsigns").prev_hunk({navigation_message = false})
end

local preview_hunk = function() require("gitsigns").preview_hunk() end
local reset_hunk = function() require("gitsigns").reset_hunk() end
local reset_buffer = function() require("gitsigns").reset_buffer() end
local stage_hunk = function() require("gitsigns").stage_hunk() end
local stage_buffer = function() require("gitsigns").stage_buffer() end
local blame_line = function() require("gitsigns").blame_line() end
local diff_index = function() require("gitsigns").diffthis() end
local diff_commit = function() require("gitsigns").diffthis("~") end
local toggle_removed = function() require("gitsigns").toggle_deleted() end

return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    cmd = "Gitsigns",
    keys = {
        { "<leader>gj", next_hunk,      desc = "[G]it goto [j] next hunk" },
        { "<leader>gk", prev_hunk,      desc = "[G]it goto [k] prev hunk" },
        { "<leader>gp", preview_hunk,   desc = "[G]it [P]review Hunk" },
        { "<leader>gr", reset_hunk,     desc = "[G]it [R]eset Hunk" },
        { "<leader>gR", reset_buffer,   desc = "[G]it [R]eset Buffer" },
        { "<leader>ga", stage_hunk,     desc = "[G]it [A]dd Hunk" },
        { "<leader>gA", stage_buffer,   desc = "[G]it [A]dd Buffer" },
        { "<leader>gl", blame_line,     desc = "[G]it Blame [L]ine" },
        { "<leader>gd", diff_index,     desc = "[G]it [D]iff against index" },
        { "<leader>gD", diff_commit,    desc = "[G]it [D]iff against last commit" },
        { "<leader>gr", toggle_removed, desc = "Toggle [G]it Show [R]emoved" },
    },
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "-"},
        },
    },
}

