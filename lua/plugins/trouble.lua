return {
  {
    "folke/trouble.nvim",
    opts = { focus = true },
    cmd = "Trouble",
    keys = {
      { "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Document diagnostics" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
      { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "TODO comments" },
    },
  },
}
