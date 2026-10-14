return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig.configs")

      if not configs.rune_ls then
        configs.rune_ls = {
          default_config = {
            cmd = { "rune-languageserver" },
            filetypes = { "rune" },
            root_dir = lspconfig.util.root_pattern("Rune.toml", ".git"),
            single_file_support = true,
          },
        }
      end

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        bashls = {},
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
          },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
          root_dir = lspconfig.util.root_pattern(
            "compile_commands.json",
            "compile_flags.txt",
            "CMakeLists.txt",
            ".git"
          ),
        },
        cmake = {
          cmd = { "cmake-language-server" },
          filetypes = { "cmake" },
          root_dir = lspconfig.util.root_pattern("CMakeLists.txt", ".git"),
        },
        lua_ls = {},
        rune_ls = {},
      })
    end,
  },
}
