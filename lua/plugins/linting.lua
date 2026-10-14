return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      objc = { "clangtidy" },
      objcpp = { "clangtidy" },
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
