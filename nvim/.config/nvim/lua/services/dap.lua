local M = {}
M.init = function()
	-- sign
	vim.fn.sign_define("DapBreakpoint", {
		text = "",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapBreakpointRejected", {
		text = "",
		texthl = "DiagnosticSignError",
		linehl = "",
		numhl = "",
	})
	vim.fn.sign_define("DapStopped", {
		text = "",
		texthl = "DiagnosticSignWarn",
		linehl = "Visual",
		numhl = "DiagnosticSignWarn",
	})
end

M.config = function()
	local server = require("core").dap_servers

	require("dap")
	require("mason-nvim-dap").setup({
		ensure_installed = server,
		automatic_installation = true,
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
			-- python = function(config)
			-- 	config.adapters = {
			-- 		type = "executable",
			-- 		command = "/usr/bin/python3",
			-- 		args = {
			-- 			"-m",
			-- 			"debugpy.adapter",
			-- 		},
			-- 	}
			-- 	require("mason-nvim-dap").default_setup(config) -- don't forget this!
			-- end,
		},
	})
end

return M
