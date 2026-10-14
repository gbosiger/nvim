return {
  "olimorris/codecompanion.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      acp = {
        codex = function()
          return require("codecompanion.adapters").extend("codex", {
            defaults = {
              auth_method = "chat-gpt",
              session_config_options = {
                model = "gpt-6.1-sol",
              },
            },
          })
        end,
      },
    },
    interactions = {
      chat = { adapter = "codex" },
      inline = { adapter = "codex" },
      cmd = { adapter = "codex" },
    },
    opts = { log_level = "INFO" },
  },
}
