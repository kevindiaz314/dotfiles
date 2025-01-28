return {
  -- Make sure to set this up properly if you have lazy=true
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  opts = {
    file_types = { "markdown", "Avante" },
    heading = {
      width = 'block',
      left_pad = 2,
      right_pad = 4,
      sign = false,
    },
    code = {
      sign = false,
    }
  },
  ft = { "markdown", "Avante" },
}
