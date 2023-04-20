return function()
	local cmp = require("cmp")
	--   פּ ﯟ   some other good icons
	local kind_icons = {
		Namespace = "",
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
		Table = "",
		Object = "",
		Tag = "",
		Array = "[]",
		Boolean = "",
		Number = "",
		Null = "ﳠ",
		String = "",
		Calendar = "",
		Watch = "",
		Package = "",
		Copilot = "",
	}

	local border_opt = {
		border = "rounded", -- single, rounded
		winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
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
			source_names = {
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Snippet)",
				buffer = "(Buffer)",
				tmux = "(TMUX)",
				copilot = "(Copilot)",
				treesitter = "(TreeSitter)",
			},
			format = function(entry, item)
				-- Kind icons
				item.kind = string.format("%s", kind_icons[item.kind])
				-- item.kind = string.format('%s %s', kind_icons[item.kind], item.kind) -- This concatonates the icons with the name of the item kind
				if entry.completion_item.detail ~= nil and entry.completion_item ~= "" then
					item.menu = entry.completion_item.detail
				else
					item.menu = ({
						nvim_lsp = "(LSP)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
						path = "(Path)",
					})[entry.source.name]
				end

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
			completion = require("cmp.config.window").bordered(border_opt),
			documentation = require("cmp.config.window").bordered(border_opt),
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})
	-- nvim dap-cmp
	require("cmp").setup({
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
	})

	require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
		sources = {
			{ name = "dap" },
		},
	})
end
