return {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {},
    config = function()
      local telescope = require("telescope")
      telescope.setup({ extensions = { ["ui-select"] = require("telescope.themes").get_dropdown({}) } })
      telescope.load_extension("ui-select")
    end,
  },
}
