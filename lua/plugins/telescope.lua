return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			telescope.load_extension("live_grep_args")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				telescope.extensions.live_grep_args.live_grep_args,
				{ desc = "Fuzzy grep in cwd" }
			)
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find in recent files" })
			vim.keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under cursor in cwd" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			telescope.load_extension("ui-select")
		end,
	},
}
