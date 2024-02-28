nmap = function(keys, func, desc)
    if desc then
        desc = "LSP: " .. desc
    end

    vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
end

vmap = function(keys, func, desc)
    if desc then
        desc = "LSP: " .. desc
    end

    vim.keymap.set("v", keys, func, {buffer = bufnr, desc = desc})
end


executable_exists = function(name)
    return vim.fn.executable(name) > 0
end

get_py_path = function()
    local venv_path = os.getenv("VIRTUAL_ENV")
    local py_path = nil

    if venv_path ~= nil then
        py_path = venv_path .. "bin/python3"
    else
        py_path = vim.g.python3_host_prog or "/usr"
    end
    print(py_path)
    return py_path
end

function DEPR(func)
    vim.api.nvim_echo({{"DEPRECATED - Remove this depr() from config if used.", "error"}}, false, {})
    pcall(func)
end
