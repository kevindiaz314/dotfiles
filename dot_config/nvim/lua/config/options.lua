local opt = vim.opt

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = true
opt.number = true

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 10  -- Minimum number of screen lines to keep above and below the cursor
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.splitbelow = true -- Split new windows below current
opt.formatoptions = "jqlnt" -- tcqj
opt.splitright = true -- Split new windows right of current
opt.splitkeep = "screen"
opt.smoothscroll = true

-- From Avante's README
vim.opt.laststatus = 3

-- Set up diagnostics
vim.diagnostic.config({
  virtual_lines = true,
})
