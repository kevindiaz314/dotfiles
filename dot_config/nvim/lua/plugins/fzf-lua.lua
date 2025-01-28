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
    { "<leader><leader>", "<cmd>FzfLua files<cr>", desc = "Lists files in your cwd" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Lists previously open files" },
    { "<leader>,", "<cmd>FzfLua buffers<cr>", desc = "Lists previously open files" },
    { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
    { "<leader>fc", "<cmd>lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })<cr>", desc = "Lists config files" },
    { "<leader>fz", "<cmd>lua require('fzf-lua').files({ cwd = '~/.local/share/chezmoi' })<cr>", desc = "Lists Chezmoi files" },
  },
}