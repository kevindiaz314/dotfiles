return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = true,    -- Enable transparency
    style = "night",        -- Set the theme variant
  },
  init = function()
    -- Load the colorscheme
    vim.cmd[[colorscheme tokyonight]]
  end,
}
