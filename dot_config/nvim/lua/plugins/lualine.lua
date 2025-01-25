return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = { statusline = { "alpha", "Avante" } }, -- disable lualine for alpha buffer
    },
    sections = {
      lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' },
    }
  },
}
