return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },

  config = function()

    local mason = require("mason") -- Pull in mason
    local mason_lspconfig = require("mason-lspconfig") -- Pull in mason-lspconfig

    -- Initialize mason first: order matters
    mason.setup({
      ui = {
        icons = {
          package_installed = " ",
          package_pending = "➜",
          package_uninstalled = " ",
        }
      }
    })

    -- Initialize mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "clangd",
        "gopls"
      },
      -- Automatically install LSPs to stdpath for neovim
      automatic_installation = true,
    })

  end
}
