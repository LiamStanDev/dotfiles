local options = {
	-- line number
	relativenumber = false,
	number = true,

	-- indentation
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	autoindent = true,

	-- line wrapping
	wrap = false,

	-- search settings
	ignorecase = true,
	smartcase = true,
	hlsearch = true, -- highlight search

	-- cursor line
	cursorline = true,

	-- appearance
	termguicolors = true,
	signcolumn = "yes",

	-- typing
	undofile = true, -- can persistent undo

	-- split windows
	splitbelow = true,
	splitright = true,

	-- clipboard
	clipboard = "unnamedplus",

	-- mouse
	mouse = "a",
}

for option, val in pairs(options) do
	vim.opt[option] = val
end

-- python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if conda_prefix ~= nil then
	vim.g.python_host_prog = conda_prefix .. "/bin/python"
	vim.g.python3_host_prog = conda_prefix .. "/bin/python"
else
	vim.g.python_host_prog = "/usr/bin/python"
	vim.g.python3_host_prog = "/usr/bin/python3"
end
