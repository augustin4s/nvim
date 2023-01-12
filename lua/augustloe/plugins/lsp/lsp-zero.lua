-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local setup_lsp, lsp = pcall(require, "lsp-zero")
if not setup_lsp then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	-- Replace these with whatever servers you want to install
	"clangd",
	"rome",
	"sumneko_lua",
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	setup_servers_on_start = true,
	configure_diagnostics = true,
	cmp_capabilities = true,
	manage_nvim_cmp = true,
	call_servers = "local",
	sign_icons = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
	set_lsp_keymaps = { omit = { "<F2>", "<F4>", "K" } }
})

lsp.set_server_config({
	-- disable autostart
	autostart = false
})

-- Fix Undefined global "vim", "ngx"
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "ngx" },
			},
		},
	},
})

-- Add LspToggle option
vim.api.nvim_create_user_command('LspToggle', function()
	local force = true
	local current_buf = vim.api.nvim_get_current_buf()
	local servers_on_buffer = vim.lsp.get_active_clients({ bufnr = current_buf })

	if not servers_on_buffer[1] then
		-- No servers attached, execute LspStart
		local status, _ = pcall(vim.cmd, "LspStart")
		if not status then
			print("LspStart not found")
		end

		return
	end

	-- Servers are attached, stop each server
	for _, client in ipairs(servers_on_buffer) do
		if client.attached_buffers[current_buf] then
			client.stop(force)
		end
	end

end,
	{
		desc = "Toggle LSP On/Off for available language client(s)",
	}
)


lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end)

lsp.setup()

--[[
local setup_nls, null_ls = pcall(require, "null-ls")
if not setup_nls then
	return
end

--local mason_null_ls = require("mason-null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
	on_attach = function(client, bufnr)
		--if client.supports_method("textDocument/formatting") then
		--	if tostring(vim.filetype.match({buf = bufnr})) == "json" then
		null_opts.on_attach(client, bufnr)
		--	end
		--end
	end,
	sources = {
		null_ls.builtins.formatting.fixjson,
	},
})

mason_null_ls.setup({
	ensure_installed = { "fixjson" },
	automatic_installation = true,
	automatic_setup = true,
})
--]]
--mason_null_ls.setup_handlers({})
--]]
--]]
