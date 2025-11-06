-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('oxfist/night-owl.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-nvim-lsp')
    use('williamboman/mason.nvim')
    use('williamboman/mason-lspconfig.nvim')
    require("mason").setup()
    use("christoomey/vim-tmux-navigator")
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VimEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-j>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                }
            })
        end,
    }

    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
    use "sindrets/diffview.nvim"
    use "stevearc/oil.nvim"
    use "tpope/vim-fugitive"
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
        config = function()
            require('render-markdown').setup({})
        end,
    })
    use("lervag/vimtex")
    use("gilion-joel-b/UUID-Generator")
    use("folke/snacks.nvim")
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }
end)
