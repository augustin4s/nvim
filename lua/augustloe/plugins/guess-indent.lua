local setup, guess_indent = pcall(require, "guess-indent")

if not setup then
	return
end

local opts = {}

opts.auto_cmd = true -- Set to false to disable automatic execution
opts.filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
	"test",
}
opts.buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
	"nofile",
}

guess_indent.setup(opts)
