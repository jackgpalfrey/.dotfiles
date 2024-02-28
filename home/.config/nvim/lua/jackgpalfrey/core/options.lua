vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- identation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.updatetime = 50
opt.colorcolumn = "80"

-- scrolling
opt.scrolloff = 8
opt.isfname:append("@-@")

-- input
opt.mouse = "a"
opt.timeoutlen = 300
opt.backspace = "indent,eol,start"
opt.completeopt = "menuone,noselect"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- backups and undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

