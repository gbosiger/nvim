return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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

			return "frappe"
		end

		local function setup_lualine_theme()
			local flavour = catppuccin_flavour_from_mode()
			local ok, ctp_lualine = pcall(require, "catppuccin.utils.lualine")
			local lualine_theme = ok and ctp_lualine(flavour) or "auto"

			require("lualine").setup({
				options = {
					theme = lualine_theme,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				extensions = { "neo-tree", "trouble" },
			})
			vim.cmd("redrawstatus")
		end

		setup_lualine_theme()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("LualineCatppuccinThemeSync", { clear = true }),
			callback = setup_lualine_theme,
		})
	end,
}
