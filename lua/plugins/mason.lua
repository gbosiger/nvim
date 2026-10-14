return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
        "clang-format",
        "clangd",
        "codelldb",
        "cmake-language-server",
        "lua-language-server",
        "luacheck",
        "rust-analyzer",
        "stylua",
      })
    end,
  },
}
