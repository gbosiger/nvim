return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      lua = { "luacheck" },
    },
  },
  keys = {
    {
      "<leader>ll",
      function() require("lint").try_lint() end,
      desc = "Trigger linting",
    },
  },
}
