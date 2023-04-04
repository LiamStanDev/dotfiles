return function()
	require("luasnip").setup({
		history = true,
		delete_check_events = "TextChanged",
	})

	local snippet_loader = require("luasnip.loaders.from_vscode")
	-- snipet from friendly-snippet
	snippet_loader.lazy_load()
	-- my custom snippet(I don't know why the following not working)
	snippet_loader.lazy_load({ paths = { "./lua/editor/snippets" } }) -- csharp snippets
end
