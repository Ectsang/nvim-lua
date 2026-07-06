return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mfussenegger/nvim-dap-python",
		filetype = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			-- Run the debug adapter from Mason's debugpy venv (always present).
			-- dap-python still runs the debuggee with the project's own venv
			-- (VIRTUAL_ENV / .venv) when one is active, so imports resolve.
			local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint<CR>"),
		vim.keymap.set("n", "<leader>dn", "<cmd> DapNew<CR>"),
		vim.keymap.set("n", "<leader>dq", "<cmd> DapTerminate<CR>"),
		vim.keymap.set("n", "<leader>dc", "<cmd> DapContinue<CR>"),
		vim.keymap.set("n", "<leader>do", "<cmd> DapStepOver<CR>"),
		vim.keymap.set("n", "<leader>di", "<cmd> DapStepInto<CR>"),
		vim.keymap.set("n", "<leader>dr", "<cmd> DapRestart<CR>"),
	},
}
