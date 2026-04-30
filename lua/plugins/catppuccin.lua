return {
	"catppuccin/nvim",
	config = function()
		local function catppuccin_scheme_from_mode()
			local mode_file = vim.fn.expand("~/.config/catppuccin-mode")
			local fd = io.open(mode_file, "r")
			if not fd then
				return "catppuccin-frappe"
			end

			local mode = fd:read("*l")
			fd:close()

			if mode == "latte" then
				return "catppuccin-latte"
			end

			if mode == "frappe" then
				return "catppuccin-frappe"
			end

			return "catppuccin-frappe"
		end

		require("catppuccin").setup({
			auto_integrations = true,
		})
		vim.cmd.colorscheme(catppuccin_scheme_from_mode())
	end,
}
