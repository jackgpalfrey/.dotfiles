return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            icons_enabled = false,
            theme = "onedark",
            component_seperators = "|",
            section_seperators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "searchcount", "selectioncount", "progress" },
            lualine_z = { "location" }
        }
    }
}
