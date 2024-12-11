return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"jackielii/neo-tree-bufferline.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>")
		require("neo-tree").setup({
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
				file_size = {
					enabled = false,
				},
				type = {
					enabled = false,
				},
				last_modified = {
					enabled = false,
				},
				created = {
					enabled = false,
				},
			},
			window = {
				mappings = {
					["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
					["l"] = "focus_preview",
					["<C-b>"] = { "scroll_preview", config = { direction = 10 } },
					["<C-f>"] = { "scroll_preview", config = { direction = -10 } },
				},
			},
		})
	end,
}
