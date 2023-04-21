return function()
	local g_config = require("core")
	require("lspsaga").setup({
		symbol_in_winbar = {
			enable = g_config.navigator_on,
			separator = " ",
			ignore_patterns = {},
			hide_keyword = true,
			show_file = true,
			folder_level = 2,
			respect_root = false,
			color_mode = true,
		},
		outline = {
			win_position = "right",
			win_with = "",
			win_width = 30,
			preview_width = 0.4,
			show_detail = true,
			auto_preview = true,
			auto_refresh = true,
			auto_close = true,
			custom_sort = nil,
			keys = {
				expand_or_jump = "<CR>",
				quit = "q",
			},
		},
		code_action = {
			num_shortcut = true,
			show_server_name = true,
			extend_gitsigns = true,
			keys = {
				-- string | table type
				quit = "q",
				exec = "<CR>",
			},
		},
		rename = {
			quit = "<C-c>",
			exec = "<CR>",
			mark = "x",
			confirm = "<CR>",
			in_select = true,
		},
		lightbulb = {
			enable = false,
			enable_in_insert = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
		},
	})
	local keymap = vim.keymap.set
	-- C-t: go back
	keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
	-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
	-- keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>")
	-- Go to definition
	keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

	-- Peek type definition
	-- You can edit the file containing the type definition in the floating window
	-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
	-- It also supports tagstack
	-- Use <C-t> to jump back
	keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")
	keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
	--keymap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
	keymap("n", "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
	keymap("n", "gh", "<cmd>Lspsaga hover_doc<CR>")
	-- Go to type definition
	-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
end
