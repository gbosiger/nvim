return {
	{
		"rouge8/neotest-rust",
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
     	"rouge8/neotest-rust",
		},
    ft = "rust",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust")
				},
			})
		end,
	},
}
