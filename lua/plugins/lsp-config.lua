return {
	-- Package manager (mason core does NOT honor ensure_installed — that's
	-- mason-tool-installer's job, below).
	{
		"mason-org/mason.nvim",
		opts = {},
	},

	-- Installs non-LSP tools: the debug adapter + every formatter/linter that
	-- none-ls references, so the config bootstraps on a fresh machine.
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"debugpy",
				"stylua",
				"prettierd",
				"eslint_d",
				"black",
				"isort",
				"editorconfig-checker",
				-- markdownlint + gitlint are intentionally omitted: they resolve
				-- from PATH (nvm / ~/.local/bin) for none-ls, and are peripheral.
			},
		},
	},

	-- Installs the servers below and auto-enables them via vim.lsp.enable()
	-- (automatic_enable defaults to true in mason-lspconfig v2).
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"lua_ls",
				"basedpyright", -- pyright fork: adds inlay hints (pyright has none)
				"ruff", -- Python linter (basedpyright does types; ruff does lint/fixes)
				"rust_analyzer",
				"ts_ls",
			},
		},
	},

	-- Server-specific defaults ship inside nvim-lspconfig's lsp/ directory and
	-- are picked up by the native vim.lsp.config / vim.lsp.enable API (0.11+).
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- Merge blink.cmp completion capabilities into every server.
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			-- Inlay hints: servers only emit them when asked. Opt in per server;
			-- LspAttach (below) turns the display on for any server that provides them.
			local ts_inlay_hints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}
			vim.lsp.config("ts_ls", {
				settings = {
					typescript = { inlayHints = ts_inlay_hints },
					javascript = { inlayHints = ts_inlay_hints },
				},
			})
			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							-- match pyright's default so basedpyright doesn't flood
							-- the buffer with stricter-than-before diagnostics.
							typeCheckingMode = "basic",
							inlayHints = {
								variableTypes = true,
								functionReturnTypes = true,
								callArgumentNames = true,
								genericTypes = false,
							},
						},
					},
				},
			})
			vim.lsp.config("lua_ls", {
				settings = { Lua = { hint = { enable = true } } },
			})

			-- Solidity (nomicfoundation) — only wire it up if the server binary
			-- is on PATH, otherwise enabling it just spams "cmd not found".
			if vim.fn.executable("nomicfoundation-solidity-language-server") == 1 then
				vim.lsp.config("solidity_ls_nomicfoundation", {
					cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
					filetypes = { "solidity" },
					root_markers = {
						"hardhat.config.js",
						"hardhat.config.ts",
						"foundry.toml",
						"package.json",
						".git",
					},
				})
				vim.lsp.enable("solidity_ls_nomicfoundation")
			end

			-- Buffer-local LSP keymaps, set once a server attaches.
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)

					-- Keep dedicated formatters (prettier for TS/JS, black/isort for
					-- Python) as the single formatter per language: strip the
					-- formatting capability off ts_ls and ruff so save-format runs
					-- exactly one formatter, not two.
					if client and (client.name == "ts_ls" or client.name == "ruff") then
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end

					-- Show inlay hints for any server that provides them.
					if client and client:supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end

					local opts = { buffer = args.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					-- Toggle inlay hints for the current buffer.
					vim.keymap.set("n", "<leader>ih", function()
						vim.lsp.inlay_hint.enable(
							not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
							{ bufnr = args.buf }
						)
					end, opts)
				end,
			})
		end,
	},
}
