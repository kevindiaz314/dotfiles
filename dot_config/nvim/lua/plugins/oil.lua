return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons" } },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      view_options = {
        show_hidden = true,
        natural_order = false,

        -- This function defines what will never be shown, even when 'show_hidden' is set
        is_always_hidden = function(name,_)
          return name == '..'
        end,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- padding aroud the floating window
        padding = 5,
        max_width = 75,
      },
      keymaps = {
        ["<esc>"] = "actions.close",
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,

    })

    -- Open parent directory in curren window
    -- vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in a floating window" })
  end,
}
