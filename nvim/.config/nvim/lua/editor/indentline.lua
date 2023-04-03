local status_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not status_indent_blankline then
	print("indent_blankline not found")
	return
end
indent_blankline.setup({
	enabled = true,
	buftype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	filetype_exclude = {
		"help",
		"startify",
		"dashboard",
		"lazy",
		"neogitstatus",
		"NvimTree",
		"neo-tree",
		"Trouble",
		"text",
		"alpha",
	},
	use_treesitter = true,
	show_current_context = false,
})
