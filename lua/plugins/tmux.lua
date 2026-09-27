return {
  "alexghergh/nvim-tmux-navigation",
  cond = function() return vim.env.TMUX ~= nil or vim.env.HERDR_ENV == "1" end,
  opts = {},
  keys = {
    {
      "<C-h>",
      function()
        if vim.env.TMUX ~= nil then
          vim.cmd("NvimTmuxNavigateLeft")
          return
        end
        local before = vim.fn.winnr()
        vim.cmd("wincmd h")
        if before == vim.fn.winnr() then vim.fn.system({ "herdr", "pane", "focus", "--current", "--direction", "left" }) end
      end,
      mode = { "n", "t" },
      desc = "Navigate left",
    },
    {
      "<C-j>",
      function()
        if vim.env.TMUX ~= nil then
          vim.cmd("NvimTmuxNavigateDown")
          return
        end
        local before = vim.fn.winnr()
        vim.cmd("wincmd j")
        if before == vim.fn.winnr() then vim.fn.system({ "herdr", "pane", "focus", "--current", "--direction", "down" }) end
      end,
      mode = { "n", "t" },
      desc = "Navigate down",
    },
    {
      "<C-k>",
      function()
        if vim.env.TMUX ~= nil then
          vim.cmd("NvimTmuxNavigateUp")
          return
        end
        local before = vim.fn.winnr()
        vim.cmd("wincmd k")
        if before == vim.fn.winnr() then vim.fn.system({ "herdr", "pane", "focus", "--current", "--direction", "up" }) end
      end,
      mode = { "n", "t" },
      desc = "Navigate up",
    },
    {
      "<C-l>",
      function()
        if vim.env.TMUX ~= nil then
          vim.cmd("NvimTmuxNavigateRight")
          return
        end
        local before = vim.fn.winnr()
        vim.cmd("wincmd l")
        if before == vim.fn.winnr() then vim.fn.system({ "herdr", "pane", "focus", "--current", "--direction", "right" }) end
      end,
      mode = { "n", "t" },
      desc = "Navigate right",
    },
  },
}
