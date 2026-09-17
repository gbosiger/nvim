return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "codelldb",
        "lua-language-server",
        "luacheck",
        "rust-analyzer",
        "stylua",
      })
    end,
  },
}
