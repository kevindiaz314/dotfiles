return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    -- Load obsidian.nvim for markdown files in your vault
    event = {
      -- Use vim.fn.expand to use ~ the Home shortcut
      "BufReadPre " .. vim.fn.expand "~" .. "/Nextcloud/Documents/kevin_vault/*.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Nextcloud/Documents/kevin_vault/*.md",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- Disable UI to avoid conflicts with markview
      ui = {
        enable = false,
      },
      workspaces = {
        {
          name = "personal",
          path = "~/Nextcloud/Documents/kevin_vault/",
        },
      },
    },
  },
}
