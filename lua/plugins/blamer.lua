return {
	{
		"braxtons12/blame_line.nvim",
		config = function()
			require("blame_line").setup({
				show_in_visual = true,
				template = "<author> • <author-time> • <summary>",
        prefix = "    ",
				-- The date format settings, for `"<author-time>"` and `"<committer-time>"`
				date = {
					-- whether the date should be relative instead of precise
					-- (I.E. "3 days ago" instead of "09-06-2022".
					relative = true,

					-- `strftime` compatible format string.
					-- Only used if `date.relative == false`
					format = "%d-%m-%y",
				},

				-- The highlight group to highlight the blame line with.
				-- The highlight of this group defaults to `Comment`.
				hl_group = "BlameLineNvim",

				-- The delay in milliseconds between a cursor movement and
				-- when the blame line should appear/update
				delay = 0,
			})
		end,
	},
}
