-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Local variable to simplify key mapping configurations
local keymap = vim.keymap

-- Save the current buffer
keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Yank to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
