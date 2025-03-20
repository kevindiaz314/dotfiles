return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "claude-3.7-sonnet", -- Check documentation for available models https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#models
      question_header = "  " .. (vim.env.USER:sub(1,1):upper() .. vim.env.USER:sub(2)) .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
    },
    keys = {
      { "<leader>ct", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
