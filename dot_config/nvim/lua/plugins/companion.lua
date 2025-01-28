return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  keys = {
    { "<leader>cc", ":CodeCompanionChat Toggle<CR>", desc = "Open CodeCompanion" },
    { "<leader>ca", ":CodeCompanionAction<CR>", desc = "Perform CodeCompanion Action" },
  },
}
