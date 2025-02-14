return {
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<tab>",
          accept_word = "<M-tab>",
        },
      },
      filetypes = {
        markdown = true,
        yaml = true,
      }
    },
  },
  { 'AndreM222/copilot-lualine' },
}
