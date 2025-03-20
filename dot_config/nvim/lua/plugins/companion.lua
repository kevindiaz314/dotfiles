return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    display = {
      chat = {
        show_settings = true,
      }
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
    },
    adapters = {
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "claude-3.7-sonnet",
            },
          },
        })
      end,
    },
  },
  keys = {
    { "<leader>cc", ":CodeCompanionChat Toggle<CR>", desc = "Open CodeCompanion" },
    { "<leader>ca", ":CodeCompanionAction<CR>", desc = "Perform CodeCompanion Action" },
  },
}
