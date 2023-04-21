local component = require("ui.lualine.component")

local M = {
	options = {
		icons_enabled = true,
		globalstatus = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		-- component_separators = "",
		-- section_separators = "",
		disabled_filetypes = {
			statusline = { "alpha", "neo-tree" },
			winbar = {},
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			component.custom_icons,
			component.modes,
		},
		lualine_b = {},
		lualine_c = {
			component.spaces,
			component.python_env,
			{
				"filetype",
				icon_only = true,
				colored = true,
				padding = 1,
				color = { bg = "#2a2c3f" },
				separator = { left = "", right = " " },
			},
			{
				"filename",
				file_status = false,
				padding = 0.3,
				separator = { left = "", right = " " },
				color = { bg = "#2a2c3f" },
			},
			component.branch,
			component.diff,
		},
		lualine_x = {
			component.diagnostics,
			component.lsp_progess,
			{
				function()
					return "﬌"
				end,
				separator = { left = "", right = "" },
				color = { bg = "#8FBCBB", fg = "#000000" },
				padding = 0.3,
			},
			component.indent,
			{
				function()
					return ""
				end,
				separator = { left = "", right = "" },
				color = { bg = "#ECD3A0", fg = "#000000" },
				padding = 0.3,
			},
			{
				"filetype",
				icon_only = false,
				colored = true,
				padding = 1,
				-- color = { bg = "#2a2c3f" },
				-- separator = { left = "", right = " " },
			},
			{
				function()
					return ""
				end,
				separator = { left = "", right = "" },
				color = { bg = "#86AAEC", fg = "#000000" },
				padding = 0.1,
			},
			"progress",
			-- component.location,
		},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
}

return M
