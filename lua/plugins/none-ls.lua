return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd.with({ extra_args = { "--line-length=80" } }),
				null_ls.builtins.formatting.markdownlint,
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
				null_ls.builtins.formatting.isort.with({
					extra_args = { "--profile", "black" },
				}),
				null_ls.builtins.formatting.black.with({
					extra_args = { "--fast", "--quiet", "--line-length=80" },
				}),
				null_ls.builtins.diagnostics.editorconfig_checker,
				null_ls.builtins.diagnostics.gitlint,
				null_ls.builtins.diagnostics.markdownlint,
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
