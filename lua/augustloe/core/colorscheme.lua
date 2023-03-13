-- local setup, _ = pcall(require, "rose-pine")
--
-- if not setup then
-- 	return
-- end
--
local default_color = "kanagawa"
 


local colorschemes = {
	"catppuccin",
	--"catppuccin-latte",
	--"catppuccin-frappe",
	--"catppuccin-macchiato",
	--"catppuccin-mocha",
	"rose-pine",
	"everforest",
	"kanagawa",
}

local function set_transparent()
	-- transparent windows TODO: Make other windows transparent as well, like telescope
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local function find_index(val)
	if not val then
		return 0
	end

	for i, new in ipairs(colorschemes) do
		if new == val then
			return i
		end
	end
	return 0
end

local function get_next_color(current_color)
	local i = find_index(current_color)
	if i == #colorschemes then
		i = 0
	end

	return colorschemes[i + 1]
end

local status, _ = pcall(vim.cmd, string.format("colorscheme %s", default_color))
if not status then
	vim.schedule(function()
		print("Colorscheme not found")
	end)
	return
end

set_transparent()

-- Add ColorschemeSwitch command
vim.api.nvim_create_user_command('ColorschemeSwitch', function()
	local current_color = vim.g.colors_name or nil
	local new_color = get_next_color(current_color)

	local status, _ = pcall(vim.cmd, string.format("colorscheme %s", new_color))
	if not status then
		vim.schedule(function()
			print("Colorscheme not found")
		end)
		return
	end

	set_transparent()

	vim.schedule(function()
		print(new_color)
	end)
end,
	{
		desc = "Switch to the next colorscheme in defined colorschemes table"
	}
)
