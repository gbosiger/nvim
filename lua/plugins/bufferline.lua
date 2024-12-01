return {
  "akinsho/nvim-bufferline.lua",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup({
      options = {
        mode = "buffers",
        offsets = {
          {
            filetype = "neo-tree",
            --text = "File Explorer",
            highlight = "Directory",
            separator = false,
          },
        },
      },
      vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>"),
      vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>"),
    })
  end,
}
