return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Nextcloud/Documents/kevin_vault/",
        },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },

      -- Completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = false,
      },
    },
  },

  -- {
  --   "iamcco/markdown-preview.nvim",
  --   build = function()
  --     vim.fn["mkdp#util#install"]()
  --   end,
  --   init = function()
  --     vim.g.mkdp_auto_start = 0
  --   end,
  --   ft = "markdown",
  -- },
}
