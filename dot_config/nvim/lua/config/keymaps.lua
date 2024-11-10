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

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>s-", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>s=", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Lazy
keymap.set("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
