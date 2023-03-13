local opt = vim.opt

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 8 -- lenght of an actual \t character
opt.shiftwidth = 0 -- use tabstop value
opt.expandtab = false -- use actual tab instead of spaces
--opt.autoindent = true
opt.softtabstop = -1 -- use tabstop value
--opt.cindent
--opt.smartindent = true
--opt.cpoptions+=I

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- cursor line
--opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "auto:4"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard (use system clipboard when yanking)
--opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- make - part of word
--opt.iskeyword:append("-")
