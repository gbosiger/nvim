return {
  {
    "rust-lang/rust.vim",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml", "BufNewFile Cargo.toml" },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "*",
    keys = {
      {
        "<leader>ra",
        function() vim.cmd.RustLsp("codeAction") end,
        ft = "rust",
        desc = "Rust code action",
      },
      {
        "K",
        function() vim.cmd.RustLsp({ "hover", "actions" }) end,
        ft = "rust",
        desc = "Rust hover actions",
      },
    },
  },
}
