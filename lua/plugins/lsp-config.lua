return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "neocmake", "bashls" }, -- removed rust_analyzer due to conflicts with rustacean
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.offsetEncoding = "utf-8" -- resolves an issue with multiple different client offset encoding

			local isLspDiagnosticsVisible = true
			vim.diagnostic.config({
				virtual_text = isLspDiagnosticsVisible,
				underline = isLspDiagnosticsVisible,
			})

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>lx", function()
				isLspDiagnosticsVisible = not isLspDiagnosticsVisible
				vim.diagnostic.config({
					virtual_text = isLspDiagnosticsVisible,
					underline = isLspDiagnosticsVisible,
				})
			end)

			vim.lsp.config("neocmake", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--suggest-missing-includes",
					--"--compile-commands-dir=",
				},
			})
			vim.lsp.config("bashls", {})

			vim.lsp.enable({ "lua_ls", "neocmake", "clangd", "bashls" })

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
}
