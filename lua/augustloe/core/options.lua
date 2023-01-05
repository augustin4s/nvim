local opt = vim.opt

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 8
opt.shiftwidth = 8
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
--opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
--opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard (use system clipboard when yanking)
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- make - part of word
--opt.iskeyword:append("-")


