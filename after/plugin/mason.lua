local plugin = require("jaglyser.plugin")
local mason = plugin.require("mason", "mason.nvim")
if mason then
    plugin.safe_setup("mason.nvim", function()
        mason.setup()
    end)
end
