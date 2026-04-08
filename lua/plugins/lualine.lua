return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin-macchiato",
			},
			extensions = { "neo-tree", "trouble" },
		})
	end,
}
