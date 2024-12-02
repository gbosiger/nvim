return {
	{
		"rust-lang/rust.vim",
    ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
    ft = "rust",
		config = function()
			require("crates").setup({
				completion = {
					cmp = {
						enabled = true,
					},
				},
			})
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
    ft = "rust",
		config = function()
			local mason_registry = require("mason-registry")

			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>a", function()
				vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
				-- or vim.lsp.buf.codeAction() if you don't want grouping.
			end, { silent = true, buffer = bufnr })
			vim.keymap.set(
				"n",
				"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
				function()
					vim.cmd.RustLsp({ "hover", "actions" })
				end,
				{ silent = true, buffer = bufnr }
			)

			local cfg = require("rustaceanvim.config")
			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
}
