local status_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not status_indent_blankline then
	print("indent_blankline not found")
	return
end
require("indent_blankline").setup({
	enabled = true,
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"lazy",
		"neogitstatus",
		"NvimTree",
		"Trouble",
		"text",
	},
	use_treesitter = true,
	show_current_context = true,
})
