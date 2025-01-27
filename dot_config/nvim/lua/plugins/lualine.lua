return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = { statusline = { "alpha", "Avante", "AvanteSelectedFiles", "AvanteInput" } },
    },
    sections = {
      lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' },
    }
  },
}
