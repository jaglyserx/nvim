local plugin = require("jaglyser.plugin")
local dap = plugin.require("dap", "nvim-dap")
if not dap then
    return
end

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Start/continue" })
vim.keymap.set("n", "<leader>dn", dap.step_over, { desc = "DAP: Step over" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step into" })
vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "DAP: Step out" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate" })
