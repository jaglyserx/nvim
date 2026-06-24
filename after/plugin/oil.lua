local plugin = require("jaglyser.plugin")
local oil = plugin.require("oil", "oil.nvim")
if not oil then
    return
end

if not plugin.safe_setup("oil.nvim", function()
    oil.setup({
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        }
    })
end) then
    return
end
vim.keymap.set("n", "<leader>å", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", oil.toggle_float)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
