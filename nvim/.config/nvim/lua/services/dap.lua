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
	local server = {
		"coreclr",
		"python",
	}
	require("dap")
	require("mason-nvim-dap").setup({
		ensure_installed = server,
		automatic_installation = true,
		automatic_setup = true,
	})
	require("mason-nvim-dap").setup_handlers({})

	require("dapui").setup({
		-- auto_open = true, -- because I set up on the which-key
		notify = {
			threshold = vim.log.levels.INFO,
		},
		config = {
			icons = { expanded = "", collapsed = "", circular = "" },
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
						{ id = "scopes", size = 0.33 },
						{ id = "breakpoints", size = 0.17 },
						{ id = "stacks", size = 0.25 },
						{ id = "watches", size = 0.25 },
					},
					size = 0.33,
					position = "right",
				},
				{
					elements = {
						{ id = "repl", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					size = 0.27,
					position = "bottom",
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
				border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
			},
		},
	})
end

return M
