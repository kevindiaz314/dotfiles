return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" } -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-sonnet-4", -- Check documentation for available models https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#models
      headers = {
        user = "  " .. (vim.env.USER:sub(1,1):upper() .. vim.env.USER:sub(2)) .. " ",
        assistant = "  Copilot ",
      },
      window = {
        width = 0.4,
      }
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    }
  },
}
