return {
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
      }
    },
  },
  { "saghen/blink.cmp",
    optional = true,
    dependencies = {
      "fang2hou/blink-copilot",
      opts = {
        max_completions = 1,
      }
    },
    opts = {
      sources = {
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
  { 'AndreM222/copilot-lualine' },
}
