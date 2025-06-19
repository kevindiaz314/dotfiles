local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlights
keymap("n", "<ESC>", ":noh<CR>", opts)

-- Write
keymap("n", "<leader>w", ":w<CR>")

-- Yank to Clipboard
keymap("v", "<leader>y", '"+y')

-- Paste from Clipboard
keymap("n", "<leader>p", '"+p', opts)

-- Toggle terminal
keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

-- Format document
keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
