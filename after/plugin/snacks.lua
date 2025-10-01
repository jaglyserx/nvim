require("snacks").setup({
    animate = { enabled = false },
    bigfile = { enabled = true },
    bufdelete = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = false },
    input = { enabled = true },
    picker = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = false },
    styles = {
        input = {
            relative = "cursor",
            keys = {
                n_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                i_esc = {
                    "<esc>",
                    { "cmp_close", "stopinsert", "<cmd>redraw!<cr>" },
                    mode = "i",
                    expr = true,
                },
                i_cr = { "<cr>", { "cmp_accept", "confirm" }, mode = { "i", "n" }, expr = true },
                i_tab = { "<tab>", { "cmp_select_next", "cmp" }, mode = "i", expr = true },
                i_ctrl_w = { "<c-w>", "<c-s-w>", mode = "i", expr = true },
                i_up = { "<up>", { "hist_up" }, mode = { "i", "n" } },
                i_down = { "<down>", { "hist_down" }, mode = { "i", "n" } },
                q = "cancel",
            },
        }
    }
})
