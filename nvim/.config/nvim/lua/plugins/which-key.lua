local status_which_key, which_key = pcall(require, "which-key")
if not status_which_key then
	print("which_key not found")
	return
end

which_key.setup({
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true,
			suggestions = 20,
		}, -- use which-key for spelling hints
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ...
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = false, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = false, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by deafult for Telescope
	disable = {
		buftypes = {},
		filetypes = { "TelescopePrompt" },
	},
})

-- normal mode
local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = false, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local mappings = {
	[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
	["w"] = { "<cmd>w!<CR>", "Save" }, -- Format command is from lsp/handler
	["q"] = { "<cmd>confirm q<CR>", "Quit" },
	-- ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["f"] = {
		function()
			require("telescope.builtin").find_files(
				require("telescope.themes").get_dropdown({ previewer = false, hidden = true })
			)
		end,
		"Find File",
	},
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	b = {
		name = "Buffers",
		j = { "<cmd>BufferLinePick<cr>", "Jump" },
		f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
		h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
	},
	d = {
		name = "Debug",
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		l = { "<cmd>:Telescope dap list_breakpoints<cr>", "List Breakpoints" },
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		-- C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		C = { "<cmd>:Telescope dap configurations<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<CR><cmd>lua require('dapui').open({reset = true})<CR>", "Start" },
		x = { "<cmd>lua require'dap'.close()<CR><cmd>lua require('dapui').close()<CR>", "Quit" },
		-- U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
	},
	p = {
		name = "Plugins",
		i = { "<cmd>Lazy install<cr>", "Install" },
		s = { "<cmd>Lazy sync<cr>", "Sync" },
		S = { "<cmd>Lazy clear<cr>", "Status" },
		c = { "<cmd>Lazy clean<cr>", "Clean" },
		u = { "<cmd>Lazy update<cr>", "Update" },
		p = { "<cmd>Lazy profile<cr>", "Profile" },
		l = { "<cmd>Lazy log<cr>", "Log" },
		d = { "<cmd>Lazy debug<cr>", "Debug" },
	},
	g = {
		name = "Git",
		g = { "<cmd>lua require('telescope').extensions.lazygit.lazygit()<CR>", "Lazygit Chooser" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	l = {
		name = "LSP",
		f = { "<cmd>Lspsaga Lspsaga lsp_finder<CR>", "Finder" },
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		p = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
		b = { "<cmd>Lspsaga show_buf_diagnostics<cr>", "Buffer Diagnostics" },
		w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Workspace Diagnostics" },
		R = { "<cmd>LspRestart<cr>", "Restart LSP" },
		j = {
			"<cmd>Lspsaga diagnostic_jump_next<cr>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>Lspsaga diagnostic_jump_prev<cr>",
			"Prev Diagnostic",
		},
		J = {
			function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end,
			"Next Error",
		},
		K = {
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
			"Prev Error",
		},
		l = { "<cmd>Telescope diagnostic" },
		-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		-- q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>Lspsaga rename ++project<cr>", "Rename" },
		-- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		-- S = {
		-- 	"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		-- 	"Workspace Symbols",
		-- },
		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
		o = { "<cmd>Lspsaga outline<CR>", "Outline" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = { "<cmd>Telescope find_files<cr>", "Find File" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		t = { "<cmd>Telescope live_grep<cr>", "Text" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		l = { "<cmd>Telescope resume<cr>", "Resume last search" },
		m = { "<cmd>Telescope media_files<CR>", "Media" },
		p = {
			"<cmd>Telescope projects<cr>",
			"Projects",
		},
	},
	-- T = {
	-- 	name = "Treesitter",
	-- 	i = { ":TSConfigInfo<cr>", "Info" },
	-- },
	-- t = {
	-- 	name = "Toggle Term",
	-- 	-- g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazy git" },
	-- 	g = { "<cmd>LazyGit<CR>", "Lazygit" },
	-- 	-- p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "python console" },
	-- 	b = { "<cmd>lua _BTOP_TOGGLE()<CR>", "Btop" },
	-- 	n = { "<cmd>lua _NODE_TOGGLE()<CR>", "node" },
	-- 	q = { "<cmd>1 ToggleTerm<CR>", "terminal 1" },
	-- 	w = { "<cmd>2 ToggleTerm<CR>", "terminal 2" },
	-- 	e = { "<cmd>3 ToggleTerm<CR>", "terminal 3" },
	-- 	r = { "<cmd>4 ToggleTerm<CR>", "terminal 4" },
	-- },
}

-- visual mode
local vopts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
	-- ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
}

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
