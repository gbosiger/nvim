return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      default_component_configs = {
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
        created = { enabled = false },
      },
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false } },
          ["l"] = "focus_preview",
          ["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
          ["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
        },
      },
    },
    keys = {
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    opts = { hint = "floating-big-letter" },
  },
}
