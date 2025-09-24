local cmp = require('cmp')

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(e)
        local bufopts = { buffer = e.buf }
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format, bufopts)
        vim.keymap.set("n", "gca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
    end,
})

vim.diagnostic.config({
    float = {
        border = "rounded", -- other options: "single", "double", "solid", "shadow"
    },
})


cmp.setup({
    mapping = {
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})


--
-- lsp.on_attach(function(client, bufnr)
--     -- if client.name == 'tsserver' then
--     --     client.server_capabilities.documentFormattingProvider = false
--     -- end
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     lsp.default_keymaps({ buffer = bufnr })
--
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
--     vim.keymap.set('n', '<leader>fr', vim.lsp.buf.format)
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
-- end)
--
--
-- local function on_attach(client, bufnr)
--   local opts = { buffer = bufnr, silent = true }
--
--   -- Go to definition
--
--   -- Hover documentation
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--
--   -- Go to implementation
--   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--
--   -- Signature help
--   vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
--
--   -- Rename symbol
--   vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--
--   -- Code actions
--   vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--
--   -- Show diagnostics
--   vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
--
--   -- Go to next diagnostic
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
--
--   -- Format
--   vim.keymap.set("n", "<leader>f", function()
--     vim.lsp.buf.format({ async = true })
--   end, opts)
-- end


--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--     -- Replace the language servers listed here
--     -- with the ones you want to install
--     ensure_installed = { 'ts_ls', 'rust_analyzer' },
--     handlers = {
--         function(server_name)
--             if server_name == "clangd" then
--                 require('lspconfig')[server_name].setup {
--                     cmd = {
--                         "clangd",
--                         "--fallback-style=webkit"
--                     },
--                     filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
--                 }
--                 return
--             end
--             require('lspconfig')[server_name].setup({})
--         end,
--     },
-- })
--
-- require('lspconfig').clangd.setup {
--     cmd = {
--         "clangd",
--         "--fallback-style=webkit"
--     },
--     filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp", "h" },
-- }
--
--
-- lsp.setup()
