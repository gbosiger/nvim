return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = false,
				gitcommit = true,
				["*"] = true, -- enable for everything else
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "zbirenbaum/copilot.lua" },
		event = "InsertEnter",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
