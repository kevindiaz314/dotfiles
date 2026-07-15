return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
  },

  -- Snacks: A collection of QoL plugins for Neovim
  "folke/snacks.nvim",
  keys = {
    -- Overwrite the default "Find Files (Root Dir)" mapping
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
  },

  -- Yazi: Blazing fast file manager
  {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      { "-", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open yazi at the current file" },
      { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open the file manager in nvim's working directory" },
      { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Resume the last yazi session" },
    },
    --- @type YaziConfig | {}
    opts = {
      -- Open Yazi instead of netrw
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
