return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
  },

  -- Release tag downloads pre-built binaries
  version = '*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'super-tab' },
    cmdline = {
      keymap = {
        ['<Tab>'] = { 'accept' },
        ['<CR>'] = { 'accept_and_enter', 'fallback' },
      },
      completion = {
        ghost_text = { enabled = false },
        menu = { auto_show = true },
      }
    },
  },
  opts_extend = { "sources.default" }
}
