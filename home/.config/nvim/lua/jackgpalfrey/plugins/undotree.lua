return {
    "mbbill/undotree",
    config = function()
        nmap("<leader>u", vim.cmd.UndotreeToggle, "Toggle [U]ndotree")
    end
}
