return function()
	require("notify").setup({
		background_colour = "#000000",
		level = vim.log.levels.WARN,
	})
end
