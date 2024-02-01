local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


cmp.setup({
  mapping = {
      ['<Enter>'] = cmp.mapping.confirm({select = true}),
      ['<Tab>'] = cmp_action.tab_complete(),
      ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
  }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
