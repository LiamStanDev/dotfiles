local component = require("ui.lualine.component")

local M = {
	options = {
		icons_enabled = true,
		globalstatus = true,
		theme = "auto",
		-- theme = {
		-- 	normal = { c = { fg = "#bbc2cf", bg = "#202328" } },
		-- 	inactive = { c = { fg = "#bbc2cf", bg = "#202328" } },
		-- },
		-- component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = "",
		-- section_separators = "",
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
		lualine_b = { "branch", component.python_env },
		lualine_c = { "diff" },
		lualine_x = {
			"diagnostics",
			component.lsp,
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = {
			function()
				return " " .. os.date("%R")
			end,
		},
		-- lualine_z = { "location" },
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
