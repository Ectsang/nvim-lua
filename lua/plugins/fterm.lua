return {
	"numToStr/FTerm.nvim",
	config = function()
		require("FTerm").setup({
			dimensions = {
				height = 0.9,
				width = 0.9,
				x = 0.5,
				y = 0.5,
			},
			border = "double",
		})
	end,
	vim.keymap.set("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>'),
	vim.keymap.set("n", "<leader>T", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>'),
}
