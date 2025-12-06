return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- which LLM/backend to use
		strategies = {
			-- chat buffer (for “understand project”, refactors, etc.)
			chat = {
				adapter = "openai",
				model = "gpt-4.1-mini", -- good default: fast + cheap
			},
			-- inline ops on visual selection
			inline = {
				adapter = "openai",
				model = "gpt-4.1-mini",
			},
			-- agents (optional, but handy for bigger edits)
			agent = {
				adapter = "openai",
				model = "gpt-4.1-mini",
			},
		},

		-- general plugin opts
		opts = {
			log_level = "INFO",
		},
	},
}
