return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  priority = 49,
  -- For blink.cmp's completion source
  dependencies = {
      "saghen/blink.cmp",
  },

  config = function()
    local preset = require("markview.presets").headings;
    require("markview").setup {
      markdown = {
        headings = preset.glow
      },
      preview = {
        filetypes = {
          "md",
          "markdown",
          "Avante"
        },
        ignore_buftypes = {}
      }
    }
  end
}
