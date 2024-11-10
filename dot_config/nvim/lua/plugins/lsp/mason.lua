return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()

    local mason = require("mason") -- Pull in mason
    local mason_lspconfig = require("mason-lspconfig") -- Pull in mason-lspconfig
    local lsp_config = require("lspconfig") -- Pull in nvim-lspconfig

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Initialize mason first: order matters
    mason.setup({
      ui = {
        icons = {
          package_installed = " ",
          package_pending = "➜",
          package_uninstalled = " ",
        }
      }
    })

    -- Initialize mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        -- Add other language servers you want to install here
      },
    })

    -- Setup handlers for mason-lspconfig
    -- From :h mason-lspconfig-automatic-server-setup
    mason_lspconfig.setup_handlers ({
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function (server_name) -- default handler (optional)
        lsp_config[server_name].setup({
          capabilities = capabilities,
        })
      end,
      -- Next, you can provide a dedicated handler for specific servers.
      -- For example, a handler override for the `rust_analyzer`:
      -- ["rust_analyzer"] = function ()
      --     require("rust-tools").setup {}
      -- end
    })

    -- lsp_config.lua_ls.setup({
    --   capabilities = capabilities
    -- })
  end
}
