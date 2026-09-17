return {
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Test nearest" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file" },
      { "<leader>ta", function() require("neotest").run.run(vim.fn.getcwd()) end, desc = "Test project" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
    },
  },
}
