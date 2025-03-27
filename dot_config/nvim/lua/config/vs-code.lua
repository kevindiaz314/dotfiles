local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Clear search highlights
keymap("n", "<leader>c", ":noh<CR>", opts)

-- Write
keymap("n", "<leader>w", ":w<CR>")

-- Yank to Clipboard
keymap("v", "<leader>y", '"+y')
