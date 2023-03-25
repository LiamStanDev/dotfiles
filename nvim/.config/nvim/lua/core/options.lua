local opt = vim.opt

-- line number
opt.relativenumber = false
opt.number = true

-- indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true -- highlight search

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.signcolumn = "yes"

-- typing
vim.opt.undofile = true -- can persistent undo

-- split windows
opt.splitbelow = true
opt.splitright = true

-- clipboard
opt.clipboard = "unnamedplus"

-- mouse
vim.opt.mouse = "a"
