return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
    },
    display = {
      diff = {
        provider = "mini_diff",
      },
      chat = {
        window = {
          layout = "float",
          width = 0.75,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>a",
      desc = "CodeCompanion",
    },
    {
      "<leader>ai",
      function()
        vim.cmd("CodeCompanion")
      end,
      mode = { "n" },
      desc = "CodeCompanion: Inline",
    },
    {
      "<leader>ai",
      function()
        -- Exit visual mode so that marks are set first
        vim.api.nvim_input("<ESC>")

        -- Schedule the call to wait for the above statement to finish first
        vim.schedule(function()
          vim.cmd("'<,'>CodeCompanion")
        end)
      end,
      mode = { "v" },
      desc = "CodeCompanion: Inline",
    },
    {
      "<leader>aa",
      function()
        require("codecompanion").actions({})
      end,
      mode = { "n", "v" },
      desc = "CodeCompanion: Actions",
    },
    {
      "<leader>ac",
      function()
        vim.cmd("CodeCompanionChat")
      end,
      mode = { "n" },
      desc = "CodeCompanion: Chat",
    },
  },
}
