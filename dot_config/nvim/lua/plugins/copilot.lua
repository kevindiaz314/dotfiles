return {
  { "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Tab>"
        }
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
      }
    }
  },
  { 'AndreM222/copilot-lualine' },
}
