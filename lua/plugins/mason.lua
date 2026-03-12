return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	lazy = false,
	config = function()
		local mason = require("mason")
		mason.setup({})

		local mason_tool_installer = require("mason-tool-installer")
		mason_tool_installer.setup({
			ensure_installed = {
				"black",
				"clang-format",
				"clangd",
				"cmakelint",
				"cpplint",
				"isort",
				"lua-language-server",
				"rust-analyzer",
				"stylua",
				"gersemi",
			},
		})
	end,
}
