return {
	{
		"rust-lang/rust.vim",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"saecki/crates.nvim",
		config = function()
			require("crates").setup({})
			-- If cmp isn't loaded yet, don't crash
			pcall(function()
				require("cmp").setup.buffer({
					sources = { { name = "crates" } },
				})
			end)
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "*",
		lazy = false,
		init = function()
			-- Build desired config without indexing vim.g.rustaceanvim directly
			local desired = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
						},
					},
				},
			}

			local current = vim.g.rustaceanvim
			if type(current) ~= "table" then
				current = {}
			end

			vim.g.rustaceanvim = vim.tbl_deep_extend("force", current, desired)
		end,

		config = function()
			-- Optional: configure codelldb adapter if installed via Mason.
			local ok_reg, mason_registry = pcall(require, "mason-registry")
			if not ok_reg then
				return
			end

			local ok_pkg, codelldb = pcall(mason_registry.get_package, "codelldb")
			if not ok_pkg or not codelldb then
				return
			end

			if codelldb.is_installed and not codelldb:is_installed() then
				return
			end

			local extension_path = vim.fn.stdpath("data") .. "/mason/"
			local codelldb_path = extension_path .. "bin/codelldb"
			local liblldb_path = extension_path .. "opt/lldb/lib/liblldb.so"

			local ok_cfg, cfg = pcall(require, "rustaceanvim.config")
			if not ok_cfg then
				return
			end

			-- Add dap adapter into rustaceanvim config (again, without unsafe indexing)
			local desired = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}

			local current = vim.g.rustaceanvim
			if type(current) ~= "table" then
				current = {}
			end

			vim.g.rustaceanvim = vim.tbl_deep_extend("force", current, desired)

			-- Your keymaps (keep simple; they’ll exist when you’re in a Rust buffer)
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>ra", function()
				vim.cmd.RustLsp("codeAction")
			end, { silent = true, buffer = bufnr })

			vim.keymap.set("n", "K", function()
				vim.cmd.RustLsp({ "hover", "actions" })
			end, { silent = true, buffer = bufnr })
		end,
	},
}
