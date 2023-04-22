return function()
	require("nvim-autopairs").setup({
		active = true,
		on_config_done = nil,
		map_char = {
			all = "(",
			tex = "{",
		},
		enable_check_bracket_line = false,
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
		enable_moveright = true,
		disable_in_macro = false,
		enable_afterquote = true,
		map_bs = true,
		map_c_w = false,
		disable_in_visualblock = false,
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0, -- Offset from pattern match
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	local cmp = require("cmp")
	-- Add parentheses after selecting function or method
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
