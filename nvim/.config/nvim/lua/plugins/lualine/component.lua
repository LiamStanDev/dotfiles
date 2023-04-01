-- util function
local function env_cleanup(venv)
	if string.find(venv, "/") then
		local final_venv = venv
		for w in venv:gmatch("([^/]+)") do
			final_venv = w
		end
		venv = final_venv
	end
	return venv
end

local function make_unique_list(list)
	local temp_talbe = {}
	for i, value in ipairs(list) do
		temp_talbe[value] = i
	end
	local unique_list = {}
	for key, value in pairs(temp_talbe) do
		table.insert(unique_list, { key = key, index = value })
	end
	table.sort(unique_list, function(a, b)
		return a.index < b.index
	end)
	return unique_list
end

local function env_cleanup(venv)
	if string.find(venv, "/") then
		local final_venv = venv
		for w in venv:gmatch("([^/]+)") do
			final_venv = w
		end
		venv = final_venv
	end
	return venv
end

-- setup component
local component = {
	python_env = {
		function()
			if vim.api.nvim_buf_get_option(0, "filetype") == "python" then
				local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
				if venv then
					local icons = require("nvim-web-devicons")
					local py_icon, _ = icons.get_icon(".py")
					return string.format(" " .. py_icon .. " (%s)", env_cleanup(venv))
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
	-- lsp = {
	-- 	function()
	-- 		local msg = "Inactive"
	-- 		local buf_clients = vim.lsp.buf_get_clients()
	-- 		if next(buf_clients) == nil then
	-- 			-- TODO: clean up this if statement
	-- 			if type(msg) == "boolean" or #msg == 0 then
	-- 				return "Inactive"
	-- 			end
	-- 			return msg
	-- 		end
	-- 		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	-- 		local buf_client_names = {}
	-- 		local copilot_active = false
	--
	-- 		-- add client
	-- 		for _, client in pairs(buf_clients) do
	-- 			if client.name ~= "null-ls" and client.name ~= "copilot" then
	-- 				table.insert(buf_client_names, client.name)
	-- 			end
	--
	-- 			if client.name == "copilot" then
	-- 				copilot_active = true
	-- 			end
	-- 		end
	--
	-- 		-- add formatter
	-- 		local formatters = require("lvim.lsp.null-ls.formatters")
	-- 		local supported_formatters = formatters.list_registered(buf_ft)
	-- 		vim.list_extend(buf_client_names, supported_formatters)
	--
	-- 		-- add linter
	-- 		local linters = require("lvim.lsp.null-ls.linters")
	-- 		local supported_linters = linters.list_registered(buf_ft)
	-- 		vim.list_extend(buf_client_names, supported_linters)
	--
	-- 		local unique_client_names = vim.fn.uniq(buf_client_names)
	--
	-- 		local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"
	--
	-- 		if copilot_active then
	-- 			language_servers = language_servers .. "%#SLCopilot#" .. " " .. lvim.icons.git.Octoface .. "%*"
	-- 		end
	--
	-- 		return language_servers
	-- 	end,
	-- 	color = { gui = "bold" },
	-- },
}
return component
