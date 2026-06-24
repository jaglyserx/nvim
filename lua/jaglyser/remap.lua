vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.keymap.set("n", "<leader>å", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "L", "xp`[v`]")
vim.keymap.set("v", "J", "xhhp`[v`]")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<localleader>yp", function() vim.fn.setreg('+', vim.fn.expand('%:p:.')) end)
