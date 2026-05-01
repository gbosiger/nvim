return {
	"catppuccin/nvim",
	config = function()
		local function catppuccin_flavour_from_mode()
			local mode_file = vim.fn.expand("~/.config/catppuccin-mode")
			local fd = io.open(mode_file, "r")
			if not fd then
				return "frappe"
			end

			local mode = fd:read("*l")
			fd:close()

			if mode == "latte" then
				return "latte"
			end

			if mode == "frappe" then
				return "frappe"
			end

			return "frappe"
		end

		local flavour = catppuccin_flavour_from_mode()

		require("catppuccin").setup({
			flavour = flavour,
			auto_integrations = true,
			integrations = {
				lualine = {},
			},
			color_overrides = {
				latte = {
					mauve = "#8839ef",
					lavender = "#8839ef",
					pink = "#8839ef",
				},
				frappe = {
					mauve = "#ca9ee6",
					lavender = "#ca9ee6",
					pink = "#ca9ee6",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-" .. flavour)
	end,
}
