local utils = require("ui.lualine.utils")

-- setup component
local component = {
	python_env = {
		function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "python" then
				local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
				if venv then
					local icons = require("nvim-web-devicons")
					local py_icon, _ = icons.get_icon(".py")
					return string.format(" " .. py_icon .. " (%s)", utils.env_cleanup(venv))
				end
			end
			return ""
		end,
		color = { fg = "#dbcd0b" },
	},
	lsp = {
		function()
			local msg = "[Inactive]"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype") -- get buffer filetype: string type
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			-- find correspond lsp
			local lsp_server_names = {}
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					table.insert(lsp_server_names, client.name)
				end
			end
			local client_names = {}
			local copilot_activate = false
			-- add lsp
			for _, lsp_server_name in ipairs(lsp_server_names) do
				if lsp_server_name ~= "null-ls" and lsp_server_name ~= "copilot" then
					table.insert(client_names, lsp_server_name)
				end
				if lsp_server_name == "copilot" then
					copilot_activate = true
				end
			end
			-- the following is very hard
			-- add formatter
			-- local active_formatters = require("null-ls.services").list_registered_providers_names(buf_ft)
			--          vim.list_extend(client_names, active_formatters)
			-- add linter
			-- local activate_linters = require("null-ls")
			-- for _, linter_name in ipairs(activate_linters) do
			-- 	table.insert(client_names, linter_name)
			-- end
			-- client_names = make_unique_list(client_names)
			-- if next(client_names) ~= nil then
			if #client_names ~= 0 then
				msg = "[" .. table.concat(client_names, ", ") .. "]"
			end
			if copilot_activate then
				msg = msg .. "%#SLCopilot#" .. " " .. "" .. "%*"
			end
			return msg
		end,
		icon = "",
		color = { gui = "bold" },
	},
	lsp_progess = {
		function()
			local msg = "Inactive"
			local buf_clients = vim.lsp.buf_get_clients()
			if next(buf_clients) == nil then
				-- TODO: clean up this if statement
				if type(msg) == "boolean" or #msg == 0 then
					return "Inactive"
				end
				return msg
			end
			local buf_ft = vim.bo.filetype
			local buf_client_names = {}
			local copilot_active = false
			local null_ls = require("null-ls")
			local alternative_methods = {
				null_ls.methods.DIAGNOSTICS,
				null_ls.methods.DIAGNOSTICS_ON_OPEN,
				null_ls.methods.DIAGNOSTICS_ON_SAVE,
			}

			-- add client
			for _, client in pairs(buf_clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_client_names, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			local function list_registered_providers_names(filetype)
				local s = require("null-ls.sources")
				local available_sources = s.get_available(filetype)
				local registered = {}
				for _, source in ipairs(available_sources) do
					for method in pairs(source.methods) do
						registered[method] = registered[method] or {}
						table.insert(registered[method], source.name)
					end
				end
				return registered
			end
			local function list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				local providers_for_methods = vim.tbl_flatten(vim.tbl_map(function(m)
					return registered_providers[m] or {}
				end, alternative_methods))
				return providers_for_methods
			end

			local function formatters_list_registered(filetype)
				local registered_providers = list_registered_providers_names(filetype)
				return registered_providers[null_ls.methods.FORMATTING] or {}
			end
			-- formatters
			local supported_formatters = formatters_list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_formatters)

			-- linters
			local supported_linters = list_registered(buf_ft)
			vim.list_extend(buf_client_names, supported_linters)
			local unique_client_names = vim.fn.uniq(buf_client_names)

			local language_servers = " " .. table.concat(unique_client_names, ", ") .. ""

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. ""
			end

			return language_servers
		end,
	},

	hide_in_width = {
		function()
			return vim.fn.winwidth(0) > 80
		end,
	},
	spaces = {
		function()
			return " "
		end,
		padding = -1,
	},

	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = {
			"error",
			"warn",
			"hint",
		},
		symbols = {
			error = " ",
			warn = " ",
			hint = " ",
			info = " ",
		},
		colored = true,
		always_visible = false,
	},

	branch = {
		"branch",
		icon = "",
		separator = { left = "", right = "" },
		padding = 0.1,
	},

	diff = {
		"diff",
		colored = true,
		symbols = {
			added = " ",
			modified = " ",
			removed = " ",
		},
		separator = { left = "", right = "" },
	},

	filetype = {
		"filetype",
		icons_enabled = true,
	},

	location = {
		"location",
	},

	custom_icons = {
		function()
			-- return ""
			return ""
		end,
		separator = { left = "", right = "" },
	},

	modes = {
		"mode",
		separator = { left = "", right = "" },
		padding = 0.8,
	},

	indent = {
		function()
			return "" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
		end,
	},
}
return component
