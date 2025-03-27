return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>a", group = "ai"},
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search", icon = " " },
      { "<leader>u", group = "ui", icon = "󰙵 " },
      { "<leader>b", group = "buffer"},
      { "<leader>f", group = "file/find"},
    },
  },
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Keymaps (which-key)", }
  },
}
