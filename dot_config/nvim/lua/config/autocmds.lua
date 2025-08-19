-- Remove the autoformatting of comments
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})

-- Enable line wrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.wrap = true
  end,
})

-- Set per-filetype indentation rules
local indent_settings = {
  lua = 2,
  python = 4,
  java = 4,
  c = 4,
  nix = 2,
  go = 4,
  qml = 4,
  conf = 4
}

-- Set the indentation settings for the current buffer
vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(indent_settings),  -- Only apply to the filetypes in the indent_settings table
  callback = function()

    local ft = vim.bo.filetype
    local set = vim.opt_local
    local indent = indent_settings[ft]

    set.shiftwidth = indent    -- Number of spaces to use for each step of (auto)indent
    set.tabstop = indent       -- Number of spaces that a <Tab> in the file counts for
    set.softtabstop = indent   -- Number of spaces that a <Tab> key press in the file counts for
    set.expandtab = true       -- Convert tabs to spaces
    set.smartindent = true     -- Enable smart indentation
  end,
})
