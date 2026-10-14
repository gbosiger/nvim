return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "bash",
        "c",
        "cmake",
        "cpp",
        "lua",
        "markdown",
        "markdown_inline",
        "rust",
        "toml",
      })
    end,
  },
}
