-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Basic Keybinds
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = "[P]roject [V]iew" })


vim.keymap.set({ 'n', 'v', 'i' }, '<C-s>', function()
  vim.cmd.Format()
  vim.cmd.w()
  vim.cmd.stopinsert()
end, { desc = "Fomat and [S]ave" })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = '[O]pen floating [d]iagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = '[D]iagnostics [q]uicklist' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Supercharge Binds
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "[K] Move selection up 1" })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "[J] Move selection down 1" })


-- Modifier Rebinds
-- ( Binds that slightly change the original functionality of a bind )
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
        d = { name = "[D]iagnostics" },

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
