return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"!
  opts = {
    provider = "copilot",
    copilot = {
      model = "claude-sonnet-4",
      max_tokens = 8192,
    },
    windows = {
      width = 40,
      input = {
        prefix = " ",
        height = 15,
      },
    },
    file_selector = {
      provider = "snacks"
    }
  },
  keys = {
    {"<space>aC", "<cmd>AvanteClear<cr>", desc = "avante: clear"}
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.icons",
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- Support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- Recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true
          }
        }
      }
    }
  }
}
