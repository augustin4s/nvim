--local setup, nightfox = pcall(require, "nightfox")
--local setup, nightfly = pcall(require, "nightfly")
--local setup, gruvbox = pcall(require, "gruvbox")
local setup, _ = pcall(require, "rose-pine")

if not setup then
	return
end

-- For nightfly
--vim.g.nightflyTransparent = true -- enable transparent windows

--local status, _ = pcall(vim.cmd, "colorscheme nightfly")
--if not status then
--	print("Colorscheme not found")
--	return
--end


local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
	print("Colorscheme not found")
	return
end

-- transparent windows TODO: Make other windows transparent as well, like telescope
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
