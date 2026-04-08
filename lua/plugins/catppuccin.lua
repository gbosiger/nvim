return {
	"catppuccin/nvim",
	config = function()
		require("catppuccin").setup({
			auto_integrations = true,
		})
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
