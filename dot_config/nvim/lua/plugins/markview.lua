return {
  "OXY2DEV/markview.nvim",
  lazy = false,

  -- For blink.cmp's completion source
  dependencies = {
      "saghen/blink.cmp"
  },

  config = function()
    local presets = require("markview.presets");
    require("markview").setup {
      markdown = {
        headings = presets.headings.glow_center
      }
    }
  end
}
