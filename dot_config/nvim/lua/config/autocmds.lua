-- Remove the autoformatting of comments
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})
