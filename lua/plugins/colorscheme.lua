-- rose-pine is the active theme (highest priority + the only one that calls
-- vim.cmd.colorscheme at startup). The others stay installed and configured so
-- you can hot-swap any time with `:colorscheme <name>` — they just no longer
-- fight over which one wins on startup.
return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon or dawn
				dark_variant = "main",
				dim_inactive_windows = true,
				extend_background_behind_borders = true,
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
			})

			vim.cmd.colorscheme("rose-pine")
		end,
	},

	-- Alternates: installed + configured, available via `:colorscheme <name>`.
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{ "folke/tokyonight.nvim", name = "tokyonight", lazy = false, opts = {} },
	{ "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, opts = {} },
	{ "EdenEast/nightfox.nvim", name = "nightfox", lazy = false },
	{
		"sainnhe/sonokai",
		lazy = false,
		init = function()
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_better_performance = 1
			vim.g.sonokai_style = "maia" -- atlantis, andromeda, shusia, maia, espresso
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		init = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_background = "soft" -- hard, medium or soft
		end,
	},
	{
		"ayu-theme/ayu-vim",
		name = "ayu",
		lazy = false,
		init = function()
			vim.g.ayucolor = "dark"
		end,
	},
}
