local M = {}

M.init = function()
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"lazy",
			"mason",
			"dapui_scopes",
			"dapui_breakpooints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_repl",
			"dapui_console",
			"toggleterm",
			"NvimTree",
		},
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})
end

M.config = function()
	require("mini.indentscope").setup({
		-- symbol = "▏",
		symbol = "│",
		options = { try_as_border = true },

		mappings = {
			-- Textobjects
			object_scope = "",
			object_scope_with_border = "",

			-- Motions (jump to respective border line; if not present - body line)
			goto_top = "[[",
			goto_bottom = "]]",
		},
	})
end

return M
