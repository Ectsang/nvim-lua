return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = { enabled = false },
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<M-v>",
					accept_word = "<M-w>",
					accept_line = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<M-\\>",
				},
			},
			filetypes = {
				-- Enable Copilot for these filetypes.
				markdown = true,
				typescript = true,
        typescriptreact = true,
				javascript = true,
				python = true,
				rust = true,
				lua = true,
				-- Disable Copilot for these filetypes.
				["*"] = false,
			},
		},
		config = function(_, opts)
			local cmp = require("cmp")
			local copilot = require("copilot.suggestion")
			local luasnip = require("luasnip")

			require("copilot").setup(opts)

			local function set_trigger(trigger)
				vim.b.copilot_suggestion_auto_trigger = trigger
				vim.b.copilot_suggestion_hidden = not trigger
			end

			-- Hide suggestions when the completion menu is open.
			cmp.event:on("menu_opened", function()
				if copilot.is_visible() then
					copilot.dismiss()
				end
				set_trigger(false)
			end)

			-- Disable suggestions when inside a snippet.
			cmp.event:on("menu_closed", function()
				set_trigger(not luasnip.expand_or_locally_jumpable())
			end)
			vim.api.nvim_create_autocmd("User", {
				pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
				callback = function()
					set_trigger(not luasnip.expand_or_locally_jumpable())
				end,
			})
		end,
	},
}
