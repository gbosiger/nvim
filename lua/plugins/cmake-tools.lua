local backend = vim.env.TMUX and "vimux" or vim.env.HERDR_ENV == "1" and "herdr" or "terminal"
local cmake_opts = {
  cmake_command = "cmake",
  ctest_command = "ctest",
  cmake_build_directory = "build/${variant:buildType}",
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  cmake_build_options = { "--parallel" },
  cmake_compile_commands_options = {
    action = "soft_link",
    target = vim.loop.cwd,
  },
  cmake_executor = { name = backend, default_opts = { herdr = {} } },
  cmake_runner = { name = backend, default_opts = { herdr = {} } },
}

return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "preservim/vimux", cond = function() return vim.env.TMUX ~= nil end },
    },
    ft = { "c", "cpp", "objc", "objcpp", "cmake" },
    opts = cmake_opts,
    config = function(_, opts)
      if vim.env.TMUX == nil and vim.env.HERDR_ENV == "1" then
        local executors = require("cmake-tools.executors")
        local runners = require("cmake-tools.runners")
        local herdr = require("config.cmake-herdr")
        executors.herdr = herdr
        runners.herdr = herdr
      end
      require("cmake-tools").setup(opts or cmake_opts)
    end,
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake generate" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake build" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake run" },
      { "<leader>ct", "<cmd>CMakeRunTest<cr>", desc = "CMake test" },
      { "<leader>cs", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake build type" },
    },
  },
}
