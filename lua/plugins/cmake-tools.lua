return {
	"Civitasv/cmake-tools.nvim",
--	dependencies = { "preservim/vimux" },
	ft = { "cpp", "cmake" },
	config = function()
		require("cmake-tools").setup({
      --[[
			cmake_executor = {
				name = "vimux",
				opt = {},
			},
			cmake_runner = {
				name = "vimux",
				opt = {},
			},
      --]]
		})
	end,
}
