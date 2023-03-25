local component = require("plugins.lualine.component")

local M = {
	options = {
		icons_enabled = true,
		globalstatus = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = { "alpha" },
			winbar = {},
		},
		-- ignore_focus = {},
		-- always_divide_middle = true,
		-- refresh = {
		-- 	statusline = 1000,
		-- 	tabline = 1000,
		-- 	winbar = 1000,
		-- },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", component.python_env },
		lualine_x = {
			component.lsp,
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
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
