
local on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local map = function(mode, l, r, opts)
        opts = {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
    end

    map({"n", "v"}, "]c", function()
        if vim.wo.diff then return "]c" end

        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to next hunk" })

    map({"n", "v"}, "[c", function()
        if vim.wo.diff then return "[c" end

        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
    end, { expr = true, desc = "Jump to previous hunk" })

    map("v", "<leader>gsh", function()
        gs.stage_hunk({ vim.fn.line ".", vim.fn.line "v" })
    end, { desc = "[G]it [S]tage [H]unk" })

    map("v", "<leader>grh", function()
        gs.reset_hunk({ vim.fn.line ".", vim.fn.line "v" })
    end, { desc = "[G]it [R]eset [H]unk" })

    map("n", "<leader>gsh", gs.stage_hunk, { desc = "[G]it [S]tage [H]unk" })
    map("n", "<leader>grh", gs.reset_hunk, { desc = "[G]it [R]eset [H]unk" })
    map("n", "<leader>gsb", gs.stage_buffer, { desc = "[G]it [S]tage [B]uffer" })
    map("n", "<leader>grb", gs.reset_buffer, { desc = "[G]it [R]eset [B]uffer" })
    map("n", "<leader>gph", gs.preview_hunk, { desc = "[G]it [P]review [H]unk" })
    
    map("n", "<leader>gb", function() 
        gs.blame_line({full = false}) 
    end, { desc = "[G]it [B]lame Line" })

    map("n", "<leader>gd", gs.diffthis, { desc = "[G]it [D]iff against index" })
    map("n", "<leader>gD", function()
        gs.diffthis("~")
    end, { desc = "[G]it [D]iff against last commit" })

    map("n", "<leader>gB", gs.toggle_current_line_blame, 
        { desc = "Toggle [G]it [B]lame" })

    map("n", "<leader>gr", gs.toggle_deleted, { desc = "Toggle [G]it Show Deleted"})

    


end


return {
    "lewis6991/gitsigns.nvim",
    opts = {
        signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "-"},
        },
        on_attach = on_attach,
    }
}
