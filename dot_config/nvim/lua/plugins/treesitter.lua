return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "OXY2DEV/markview.nvim",
  },
  main = "nvim-treesitter.configs",
  opts = {
    highlight = {
      enable = true,
    },
    -- enable indentation
    indent = { enable = true },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = {
      enable = true,
    },
    -- ensure these language parsers are installed
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "gitignore",
      "go",
      "hyprlang",
      "java",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "qmljs",
      "regex",
      "yaml"
    },

    textobjects = {
      select = {
        enable = true,
        loadhead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner"
        }
      }
    }
  }
}
