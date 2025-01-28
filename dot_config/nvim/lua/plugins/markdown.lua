return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
  opts = {
    file_types = { "markdown", "Avante", },
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
}
