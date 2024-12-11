return {
  "ibhagwan/fzf-lua",
  lazy = false,
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { 
    files = {
      fd_opts = [[ --color=never --type f --hidden --follow -E Library -E .npm -E .DS_Store -E .git -E node_modules -E .cache -E .local -E .zsh -E .zsh_sessions -E .Trash -E '.nix*' -E raycast -E .tmux ]],
    }
  },
  keys = {
    { "<leader><leader>", "<cmd>FzfLua files<cr>", { desc = "Lists files in your cwd" } }, 
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Lists previously open files" } },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Lists previously open files" } },
  },
  -- config = function()
  --   -- calling `setup` is optional for customization
  --   require("fzf-lua").setup({})
  -- end
}
