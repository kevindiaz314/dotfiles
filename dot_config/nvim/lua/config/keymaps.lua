vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Local variable to simplify key mapping configurations
local keymap = vim.keymap

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
keymap.set(
  "n",
  "<ESC>",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Lazy
keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Quit
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Write
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })

-- Duplicate current line below
keymap.set('n', '<leader>D', ':t.<CR>', { noremap = true, desc = "Duplicate line below" })

-- Copy entire file to system clipboard
-- keymap.set('n', '<leader>ya', ':%y+<CR>', { desc = "Copy entire file to clipboard" })

-- Yank to clipboard
keymap.set("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })

-- Paste from clipboard
keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
