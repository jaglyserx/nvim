require("oil").setup({
    view_options = {
    -- Show files and directories that start with "."
        show_hidden = true,
    }
})
vim.keymap.set("n", "<leader>å", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
