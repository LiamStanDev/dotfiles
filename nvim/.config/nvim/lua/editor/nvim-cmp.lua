return function()
	local cmp = require("cmp")

	--   פּ ﯟ   some other good icons
	local kind_icons = {
		Array = " ",
		Boolean = " ",
		Class = " ",
		Color = " ",
		Constant = " ",
		Constructor = " ",
		Copilot = " ",
		Enum = " ",
		EnumMember = " ",
		Event = " ",
		Field = " ",
		File = " ",
		Folder = " ",
		Function = " ",
		Interface = " ",
		Key = " ",
		Keyword = " ",
		Method = " ",
		Module = " ",
		Namespace = " ",
		Null = " ",
		Number = " ",
		Object = " ",
		Operator = " ",
		Package = " ",
		Property = " ",
		Reference = " ",
		Snippet = " ",
		String = " ",
		Struct = " ",
		Text = " ",
		TypeParameter = " ",
		Unit = " ",
		Value = " ",
		Variable = " ",
	}

	-- find more here: https://www.nerdfonts.com/cheat-sheet
	cmp.setup({
		active = true,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.select_next_item(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, item)
				-- Kind icons
				item.kind = string.format("%s", kind_icons[item.kind])
				-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				item.menu = ({
					nvim_lsp = "(LSP)",
					luasnip = "(Snippet)",
					buffer = "(Buffer)",
					path = "(Path)",
				})[entry.source.name]
				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end,
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			-- documentation = {
			-- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			-- },
			completion = require("cmp.config.window").bordered(),
			documentation = require("cmp.config.window").bordered(),
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})
end
