local plugin = require("jaglyser.plugin")
local treesitter = plugin.require('nvim-treesitter', 'nvim-treesitter')
if not treesitter then
    return
end

if not plugin.safe_setup("nvim-treesitter", function()
    treesitter.setup {
    install_dir = vim.fn.stdpath('data') .. '/site',
    }
end) then
    return
end

treesitter.install { 'rust', 'javascript', 'zig', 'python', 'lua' }

local start_treesitter = function(buf, filetype)
    if not filetype or filetype == "" then
        return
    end

    if vim.bo[buf].buftype ~= "" then
        return
    end

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
        return
    end

    local added_ok, added = pcall(vim.treesitter.language.add, language)
    if not added_ok or added == false then
        return
    end

    if not pcall(vim.treesitter.start, buf, language) then
        return
    end

    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
        start_treesitter(args.buf, args.match)
    end,
})

start_treesitter(vim.api.nvim_get_current_buf(), vim.bo.filetype)
