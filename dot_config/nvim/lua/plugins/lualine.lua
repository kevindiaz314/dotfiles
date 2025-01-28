return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = { statusline = { "snacks_dashboard", "Avante", "AvanteSelectedFiles", } },
    },
    sections = {
      lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' },
    },
    extensions = { "neo-tree" },
  },
}
