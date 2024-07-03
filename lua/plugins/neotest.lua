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
			local path = ".venv/bin/python"
			-- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
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
	{
		"nvim-neotest/neotest",
		dependencies = { "nvim-neotest/nvim-nio" },
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-neotest/nvim-nio",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"nvim-neotest/neotest-plenary",
	-- 		"nvim-neotest/neotest-python",
	-- 		"nvim-neotest/neotest-jest",
	-- 	},
	-- 	config = function()
	-- 		require("neotest").setup({
	-- 			adapters = {
	-- 				require("neotest-python")({
	-- 					dap = { justMyCode = false },
	-- 					args = { "--log-level", "DEBUG" },
	-- 					runner = "pytest",
	-- 					python = ".venv/bin/python",
	-- 				}),
	-- 				require("neotest-plenary"),
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
