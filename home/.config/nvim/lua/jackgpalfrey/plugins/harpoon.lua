return {
    "ThePrimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        nmap("<leader>a", mark.add_file, "[A]dd current file to harpoon")
        nmap("<C-e>", ui.toggle_quick_menu, "[e] Show all files in harpoon")
        
        nmap("<leader>1", function() ui.nav_file(1) end,"")
        nmap("<leader>2", function() ui.nav_file(2) end,"")
        nmap("<leader>3", function() ui.nav_file(3) end,"")
        nmap("<leader>4", function() ui.nav_file(4) end,"")
        nmap("<leader>5", function() ui.nav_file(5) end,"")
        nmap("<leader>6", function() ui.nav_file(6) end,"")
        nmap("<leader>7", function() ui.nav_file(7) end,"")
        nmap("<leader>8", function() ui.nav_file(8) end,"")
        nmap("<leader>9", function() ui.nav_file(9) end,"")
        nmap("<leader>0", function() ui.nav_file(10) end,"")
    end
}
