-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use "nvim-lua/popup.nvim"


    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorschemes
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use({ 'rebelot/kanagawa.nvim', as = 'kanagawa' })
    use({ 'lunarvim/darkplus.nvim', as = 'darkplus' })


     -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
            ts_update()
        end,
        requires = {
            {'JoosepAlviste/nvim-ts-context-commentstring'}
        }
    }

    use ('theprimeagen/harpoon')
    use ('theprimeagen/vim-be-good')
    use ('mbbill/undotree')
    use ('tpope/vim-fugitive')
    use { "lewis6991/gitsigns.nvim" }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use ('numToStr/Comment.nvim')
    use { "windwp/nvim-autopairs" }
    use { "kyazdani42/nvim-web-devicons"}
    use { "kyazdani42/nvim-tree.lua"}
    use { "akinsho/bufferline.nvim"}
    use { "jose-elias-alvarez/null-ls.nvim"}
    use { "akinsho/toggleterm.nvim"}
end)
