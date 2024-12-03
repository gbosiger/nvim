return {
  "Civitasv/cmake-tools.nvim",
  ft = "cpp",
  config = function()
     require("cmake-tools").setup({})
  end,
}
