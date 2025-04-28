-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('oxfist/night-owl.nvim')
    use { "diegoulloao/neofusion.nvim" }


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')

    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    require("mason").setup()

    use("christoomey/vim-tmux-navigator")
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "VimEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
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

    use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
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
        -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
        -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
        config = function()
            require('render-markdown').setup({})
        end,
    })
    use("lervag/vimtex")
    use("NeogitOrg/neogit")
    use("gilion-joel-b/UUID-Generator")
    use {
        'yetone/avante.nvim',
        branch = 'main',
        run = 'make', -- This builds the necessary binaries (or run `make BUILD_FROM_SOURCE=true` if needed)
        config = function()
            -- This line is crucial for loading required templates and tokenizers:
            require('avante_lib').load()
            -- Now set up the plugin; you can pass your custom options here
            require('avante').setup({
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-3-7-sonnet-20250219",
                    temperature = 0,
                    max_tokens = 4096,
                },
                -- add additional configuration options as needed
            })
        end,
        requires = {
            'stevearc/dressing.nvim',
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'MeanderingProgrammer/render-markdown.nvim',
            'hrsh7th/nvim-cmp',            -- optional: for command autocompletion
            'HakonHarnes/img-clip.nvim',   -- optional: for image pasting support
            'zbirenbaum/copilot.lua'       -- optional: for Copilot integration
        },
    }
end)
