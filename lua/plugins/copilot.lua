return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					markdown = true, -- overrides default
          typescript = true,
          javascript = true,
          python = true,
          rust = true,
					terraform = false, -- disallow specific filetype
          ["*"] = false,
				},
			})
		end,
	},
}
