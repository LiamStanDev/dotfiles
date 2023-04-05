return function()
	require("notify").setup({
		background_colour = "#000000",
		fps = 30,
		icons = {
			DEBUG = "",
			ERROR = "",
			INFO = "",
			TRACE = "✎",
			WARN = "",
		},
		level = vim.log.levels.TRACE,
		minimum_width = 25,
		render = "compact",
		stages = "fade",
		timeout = 2000,
		top_down = true,
	})
end
