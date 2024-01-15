return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>a",
            "<cmd>lua require('harpoon.mark').add_file()<cr>",
            desc = "[A]dd current file to harpoon" },

        { "<C-e>",
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            desc = "[e] Show all files in harpoon" },

        { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
            desc = "Navigate to page [1]" },
        { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
            desc = "Navigate to page [2]" },
        { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
            desc = "Navigate to page [3]" },
        { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
            desc = "Navigate to page [4]" },
        { "<leader>5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",
            desc = "Navigate to page [5]" },
        { "<leader>6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>",
            desc = "Navigate to page [6]" },
        { "<leader>7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>",
            desc = "Navigate to page [7]" },
        { "<leader>8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>",
            desc = "Navigate to page [8]" },
        { "<leader>9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>",
            desc = "Navigate to page [9]" },
        { "<leader>0", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>",
            desc = "Navigate to page 1[0]" },
    },
    opts = {}
}
