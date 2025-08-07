return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    -- Load obsidian.nvim for markdown files in your vault
    event = {
      -- Use vim.fn.expand to use ~ the Home shortcut
      "BufReadPre " .. vim.fn.expand "~" .. "/Nextcloud/Documents/kevin_vault/*.md",
      "BufNewFile " .. vim.fn.expand "~" .. "/Nextcloud/Documents/kevin_vault/*.md"
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Nextcloud/Documents/kevin_vault"
        },
      }
    }
  }
}
