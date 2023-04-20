return function()
	require("bufferline").setup({
		options = {
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			-- NOTE: this plugin is designed with this icon in mind,
			-- and so changing this is NOT recommended, this is intended
			-- as an escape hatch for people who cannot bear it for whatever reason
			indicator_icon = nil,
			indicator = { style = "icon", icon = "▎" },
			buffer_close_icon = "",
			-- buffer_close_icon = '',
			modified_icon = "●",
			close_icon = "",
			-- close_icon = '',
			left_trunc_marker = "",
			right_trunc_marker = "",
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = false, -- | "nvim_lsp" | "coc",
			diagnostics_update_in_insert = false,
			offsets = {
				{
					filetype = "undotree",
					text = "Undotree",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "neo-tree",
					text = "Explorer",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "DiffviewFiles",
					text = "Diff View",
					highlight = "PanelHeading",
					padding = 1,
				},
				{
					filetype = "flutterToolsOutline",
					text = "Flutter Outline",
					highlight = "PanelHeading",
				},
				{
					filetype = "lazy",
					text = "Lazy",
					highlight = "PanelHeading",
					padding = 1,
				},
			},
			color_icons = true, -- whether or not to add the filetype icon highlights
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
			enforce_regular_tabs = false,
			always_show_bufferline = true,
			hover = {
				enabled = false, -- requires nvim 0.8+
				delay = 200,
				reveal = { "close" },
			},
			sort_by = "id",
		},
	})
end
