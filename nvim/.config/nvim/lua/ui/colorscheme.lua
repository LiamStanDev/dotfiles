local M = {}
M.setup = function()
	local g_configs = require("core")
	local colorscheme = g_configs.colorscheme or "onedark"

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end
end

return M
