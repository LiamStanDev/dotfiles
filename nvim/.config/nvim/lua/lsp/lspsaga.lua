require("lspsaga").setup({})
local keymap = vim.keymap.set
-- C-t: go back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")
-- Go to definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")
--keymap("n", "gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "gh", "<cmd>Lspsaga hover_doc ++keep<CR>")
-- Go to type definition
-- keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")
