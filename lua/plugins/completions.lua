return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	version = "1.*", -- release tag ships a prebuilt fuzzy-matcher binary (no build step)
	opts = {
		keymap = { preset = "default" }, -- <C-space> open, <C-y> accept, <C-n>/<C-p> nav, <C-e> hide, <C-k> signature
		appearance = { nerd_font_variant = "mono" },
		completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
		sources = { default = { "lsp", "path", "snippets", "buffer" } },
		signature = { enabled = true },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
