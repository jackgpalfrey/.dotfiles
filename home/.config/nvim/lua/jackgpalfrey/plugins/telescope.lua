local find_git_root = function()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == '' then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
    end   
    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
    end
    return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        require('telescope.builtin').live_grep {
            search_dirs = { git_root },
        }
    end
end



local config = function()
    pcall(require("telescope").load_extension, "fzf")

    vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

    telebin = require("telescope.builtin")
    telethem = require("telescope.themes")
    nmap("<leader>?", telebin.oldfiles, "[?] Find recently opened files")
    nmap("<leader><space>", telebin.buffers, "[ ] Find existing buffers")
    nmap("<leader>/", function()
        telebin.current_buffer_fuzzy_find(telethem.get_dropdown({ winblend = 10, previewer = false}))
    end, "[/] Fuzzily search in current buffer")

    local live_grep_open_files = function()
        telebin.live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep In Open Files",
        })
    end

    nmap("<leader>s/", live_grep_open_files, "[S]earch [/] in Open Files")
    nmap("<leader>ss", telebin.builtin, "[S]earch [S]elect Telescope")
    nmap("<leader>gf", telebin.git_files, "Search [G]it [F]iles")
    nmap("<C-p>", telebin.git_files, "Search Git Files")
    nmap("<leader>pf", telebin.find_files, "Search [P]roject [F]iles")
    nmap("<leader>sh", telebin.help_tags, "[S]earch [H]elp")
    nmap("<leader>sw", telebin.grep_string, "[S]earch current [W]ord")
    nmap("<leader>sg", telebin.live_grep, "[S]earch by [G]rep")
    nmap("<leader>sG", ":LiveGrepGitRoot<CR>", "[S]earch by [G]rep on Git Root")
    nmap("<leader>sd", telebin.diagnostics, "[S]earch [D]iagnostics")
    nmap("<leader>sr", telebin.resume, "[S]earch [R]esume")
end


return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable "make" == 1 end,
        }
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-u>"] = false,
                    ["<C-d>"] = false
                }
            }
        }
    },
    config = config
}
