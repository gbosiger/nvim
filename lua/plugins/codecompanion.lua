return {
	"olimorris/codecompanion.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- which LLM/backend to use
		ignore_warnings = true, -- temporarily as it show a warning about braking changes and we pin the version for now
		strategies = {
			-- chat buffer (for “understand project”, refactors, etc.)
			chat = {
				adapter = "openai",
				-- model = "gpt-4.1-mini", -- good default: fast + cheap
				model = "gpt-5.1",
			},
			-- inline ops on visual selection
			inline = {
				adapter = "openai",
				-- model = "gpt-4.1-mini",
				model = "gpt-5.1",
			},
			-- agents (optional, but handy for bigger edits)
			agent = {
				adapter = "openai",
				-- model = "gpt-4.1-mini",
				model = "gpt-5.1",
			},
		},

		-- general plugin opts
		opts = {
			log_level = "INFO",
		},
	},
}
