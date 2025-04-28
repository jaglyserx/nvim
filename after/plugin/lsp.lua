local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.on_attach(function(client, bufnr)
    -- if client.name == 'tsserver' then
    --     client.server_capabilities.documentFormattingProvider = false
    -- end
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
    vim.keymap.set('n', '<leader>fr', vim.lsp.buf.format)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
end)


cmp.setup({
    mapping = {
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = { 'ts_ls', 'rust_analyzer' },
    handlers = {
        function(server_name)
            if server_name == "clangd" then
                require('lspconfig')[server_name].setup {
                    cmd = {
                        "clangd",
                        "--fallback-style=webkit"
                    },
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
                }
                return
            end
            require('lspconfig')[server_name].setup({})
        end,
    },
})

require('lspconfig').clangd.setup {
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
}


lsp.setup()
