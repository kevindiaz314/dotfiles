return {
  "saghen/blink.cmp",
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    keymap = { preset = 'enter' }
  },

  -- Release tag downloads pre-built binaries
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts_extend = { "sources.default" }
}
