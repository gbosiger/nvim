return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "frappe",
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		config = {
			update_interval = 200,
			set_dark_mode = function()
				vim.api.nvim_set_option("background", "dark")
			end,
			set_light_mode = function()
				vim.api.nvim_set_option("background", "light")
			end,
		},
	},
}
