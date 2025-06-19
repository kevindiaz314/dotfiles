return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufReadPre" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
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
      "c",
      "css",
      "dockerfile",
      "gitignore",
      "html",
      "hyprlang",
      "java",
      "json",
      -- "javascript",
      "lua",
      "markdown",
      "markdown_inline",
      "nix",
      -- "prisma",
      "python",
      "query",
      "regex",
      -- "svelte",
      -- "graphql",
      -- "typescript",
      -- "tsx",
      "vim",
      "vimdoc",
      "yaml",
    },

    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<C-space>",
    --     node_incremental = "<C-space>",
    --     scope_incremental = false,
    --     node_decremental = "<bs>",
    --   },
    -- },

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
          ["il"] = "@loop.inner",
        },
      },
    },
  },
}
