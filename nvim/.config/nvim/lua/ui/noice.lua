return function()
	require("noice").setup({
		lsp = {
			progress = {
				enabled = true,
				format = {
					-- {
					-- 	"{progress} ",
					-- 	key = "progress.percentage",
					-- 	contents = {
					-- 		{ "{data.progress.message} " },
					-- 	},
					-- },
					-- "({data.progress.percentage}%) ",
					{ "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.message} ", hl_group = "NoiceLspProgressClient" },
				},
				format_done = {
					{ "✔ ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.message} ", hl_group = "NoiceLspProgressClient" },
				},
				throttle = 1000 / 60, -- frequency to update lsp progress message
				view = "mini",
			},
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			-- inc_rename = true, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		views = {
			popup = {
				win_options = {
					winblend = 0,
				},
			},
			mini = {
				position = {
					row = -2,
					col = "100%",
				},
				border = { style = "rounded" },
				win_options = { winblend = 0 },
				size = "auto",
			},
		},
	})
end
