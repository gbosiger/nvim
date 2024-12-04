return {
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    lazy = false,
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.adapters.codelldb = {
        type = "server",
        host = "127.0.0.1",
        port = 13000,
        executable = {
          command = "codelldb",
          args = { "--port", "13000" },
        },
      }

      dap.configurations.cpp = {
        {
          type = "codelldb",
          request = "launch",
          program = function()
            -- Automatically find the executable in `target/debug`
            local output_file = vim.fn.getcwd()
                .. "/../out/host"
                .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

            if vim.fn.filereadable(output_file) == 1 then
              return output_file
            else
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end
          end,

          cwd = "${workspaceFolder}/../out/host/Debug/ara_Com",
          environment = {
            TSAN_OPTIONS = "suppressions=${workspaceFolder}/.tsan_suppressions",
          },
          stopOnEntry = false,
          args = {},
          sourceLanguages = { "cpp" },
          preRunCommands = "breakpoint name configure --disable cpp_throw",
        },
      }

      dap.configurations.rust = {
        {
          type = "codelldb",
          request = "launch",
          program = function()
            -- Build the project using `cargo build` - for now excluded so I can choose between the project debug or custom test path, which I can compile with cargo test --no-run
            --[[
            vim.fn.jobstart("cargo build", {
							on_exit = function()
								vim.notify("Build completed.")
							end,
						})
            --]]

            -- Automatically find the executable in `target/debug`
            local output_file = vim.fn.getcwd()
                .. "/target/debug/"
                .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

            if vim.fn.filereadable(output_file) == 1 then
              return output_file
            else
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end
          end,
          cwd = "${workspaceFolder}",
          terminal = "integrated",
          sourceLanguages = { "rust" },
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<F5>", function()
        require("dap").continue()
      end)
      vim.keymap.set("n", "<F10>", function()
        require("dap").step_over()
      end)
      vim.keymap.set("n", "<F11>", function()
        require("dap").step_into()
      end)
      vim.keymap.set("n", "<F12>", function()
        require("dap").step_out()
      end)
      vim.keymap.set("n", "<Leader>b", function()
        require("dap").toggle_breakpoint()
      end)
      vim.keymap.set("n", "<Leader>B", function()
        require("dap").set_breakpoint()
      end)
      vim.keymap.set("n", "<Leader>lp", function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end)
      vim.keymap.set("n", "<Leader>dr", function()
        require("dap").repl.open()
      end)
      vim.keymap.set("n", "<Leader>dl", function()
        require("dap").run_last()
      end)
      vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
        require("dap.ui.widgets").hover()
      end)
      vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
        require("dap.ui.widgets").preview()
      end)
      vim.keymap.set("n", "<Leader>df", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end)
      vim.keymap.set("n", "<Leader>ds", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
      end)
    end,
  },
}
