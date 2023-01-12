local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
                fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
                vim.cmd [[packadd packer.nvim]]
                return true
        end
        return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
        return
end

return packer.startup(function(use)

        -- Package manager
        use("wbthomason/packer.nvim")

        -- lua functions that many plugins use
        use("nvim-lua/plenary.nvim")

        use({
                'rose-pine/neovim',
                as = 'rose-pine'
        })

        -- tmux & split window navigation (see keymaps for key mapping)
        use("christoomey/vim-tmux-navigator")

        -- maximizes and restores current window
        use("szw/vim-maximizer")

        -- surround plugin
        -- cs"' to change "text" to 'text'
        -- ds" to change "text" to text
        -- cst" to change from <>hello<> to "hello"
        use("tpope/vim-surround")

        -- Comments with gc
        -- to comment more than one line: gc <line number> j
        use("numToStr/Comment.nvim")
        -- ?
        use("vim-scripts/ReplaceWithRegister")

        -- file explorer
        use("nvim-tree/nvim-tree.lua")

        -- icons
        use("kyazdani42/nvim-web-devicons")

        -- Tab indentation is guessed automatically based on current opened file indentation
        use("nmac427/guess-indent.nvim")

        -- statusline
        use("nvim-lualine/lualine.nvim")

        -- fuzzy finder
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
        use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

        -- treesitter configuration
        use({
                "nvim-treesitter/nvim-treesitter",
                run = function()
                        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                        ts_update()
                end,
        })
        --
        --         -- auto closing
        use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
        use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
        --
        --         -- git integration
        use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

        -- LSP configuration with lsp-zero
        use {
                'VonHeikemen/lsp-zero.nvim',
                requires = {
                        -- LSP Support
                        { 'neovim/nvim-lspconfig' },
                        { 'williamboman/mason.nvim' },
                        { 'williamboman/mason-lspconfig.nvim' },

                        -- Autocompletion
                        { 'hrsh7th/nvim-cmp' },
                        { 'hrsh7th/cmp-buffer' },
                        { 'hrsh7th/cmp-path' },
                        { 'saadparwaiz1/cmp_luasnip' },
                        { 'hrsh7th/cmp-nvim-lsp' },
                        { 'hrsh7th/cmp-nvim-lua' },

                        -- Snippets
                        { 'L3MON4D3/LuaSnip' },
                        -- Snippet Collection (Optional)
                        { 'rafamadriz/friendly-snippets' },
                }
        }

        -- Formatting and linting
        --use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
        --use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

        -- Json formatter via :FixJSON
        use("rhysd/vim-fixjson")

        if packer_bootstrap then
                require("packer").sync()
        end
end)
