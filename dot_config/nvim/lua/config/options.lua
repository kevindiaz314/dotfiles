local opt = vim.opt

-- vim.opt.signcolumn = 'yes'

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.relativenumber = true
opt.number = true

-- tabs 
opt.tabstop = 4         -- Number of spaces that a <Tab> in the file counts for
opt.softtabstop = 4     -- Number of spaces that a <Tab> key press in the file counts for
opt.shiftwidth = 4      -- Number of spaces to use for each step of (auto)indent
opt.expandtab = true    -- Convert tabs to spaces

-- opt.smartindent = true  -- Do smart autoindenting when starting a new line
-- opt.shiftround = true  -- Insert indents automatically

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- use system clipboard as default register
-- opt.clipboard:append("unnamedplus")              

opt.scrolloff = 10  -- Minimum number of screen lines to keep above and below the cursor
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.splitbelow = true -- Split new windows below current
opt.formatoptions = "jqlnt" -- tcqj
opt.splitright = true -- Split new windows right of current
opt.splitkeep = "screen"
opt.smoothscroll = true
