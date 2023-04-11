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

	require("dapui").setup({
		-- auto_open = true, -- because I set up on the which-key
		icons = { expanded = "", collapsed = "", circular = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		-- Use this to override mappings for specific elements
		element_mappings = {},
		expand_lines = true,
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.4,
					},
					{
						id = "breakpoints",
						size = 0.15,
					},
					{
						id = "watches",
						size = 0.25,
					},
					{
						id = "stacks",
						size = 0.2,
					},
				},
				position = "right",
				size = 35,
			},
			{
				elements = {
					{
						id = "repl",
						size = 0.5,
					},
					{
						id = "console",
						size = 0.5,
					},
				},
				position = "bottom",
				size = 10,
			},
		},
		controls = {
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				pause = "",
				play = "",
				step_into = "",
				step_over = "",
				step_out = "",
				step_back = "",
				run_last = "",
				terminate = "",
			},
		},
		floating = {
			max_height = 0.9,
			max_width = 0.5, -- Floats will be treated as percentage of your screen.
			border = "rounded", -- Border style. Can be 'single', 'double' or 'rounded'
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		},
	})
end

return M
