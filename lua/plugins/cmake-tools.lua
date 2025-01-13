return {
	"Civitasv/cmake-tools.nvim",
	dependencies = { "preservim/vimux" },
	ft = { "cpp", "cmake" },
	config = function()
		-- Set vimux only if inside a tmux session
		if os.getenv("TMUX") ~= nil then
			require("cmake-tools").setup({
				cmake_executor = {
					name = "vimux",
					opts = {},
					default_opts = {},
				},
				cmake_runner = {
					name = "vimux",
					opts = {},
					default_opts = {},
				},
			})
		else
			require("cmake-tools").setup({})
		end
	end,
}
