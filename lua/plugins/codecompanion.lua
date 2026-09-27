return {
  "olimorris/codecompanion.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      http = {
        ollama_chat = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = { model = { default = "qwen3:8b" } },
          })
        end,
        ollama_code = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = { model = { default = "qwen2.5-coder:7b" } },
          })
        end,
      },
    },
    interactions = {
      chat = { adapter = "ollama_chat" },
      inline = { adapter = "ollama_code" },
      cmd = { adapter = "ollama_chat" },
    },
    opts = { log_level = "INFO" },
  },
}
