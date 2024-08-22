return {
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			cmdline = {
				-- enable the cmdline view
				enabled = true,
				-- set the height of the cmdline view
				height = 10,
				-- set the position of the cmdline view
				position = "bottom",
				-- set the border style of the cmdline view
				border = "single",
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
					lsp_doc_position = "bottom", -- position of the hover docs and signature help
					lsp_doc_height = 20, -- height of the hover docs and signature help
					lsp_doc_width = 80, -- width of the hover docs and signature help
					delay = 10, -- delay in ms for the popup to show
				},
			})
		end,
	},
}
