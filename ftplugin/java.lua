local ok, jdtls = pcall(require, "jdtls")
if not ok then
    vim.notify("Plugin nvim-jdtls was not able to start: " .. jdtls, vim.log.levels.WARN)
    return
end

local root_dir = vim.fs.root(0, {
    "mvnw",
    "gradlew",
    "settings.gradle",
    "settings.gradle.kts",
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    ".git",
})

if not root_dir then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("cache") .. "/jdtls/workspace/" .. project_name

local config = {
    name = "jdtls",
    cmd = {
        "jdtls",
        "-data",
        workspace_dir,
    },
    root_dir = root_dir,
    settings = {
        java = {},
    },
    init_options = {
        bundles = {},
    },
}

jdtls.start_or_attach(config)

local opts = { buffer = true, silent = true }
vim.keymap.set("n", "<leader>jo", jdtls.organize_imports, opts)
vim.keymap.set("n", "<leader>jv", jdtls.extract_variable, opts)
vim.keymap.set("v", "<leader>jv", function()
    jdtls.extract_variable(true)
end, opts)
vim.keymap.set("n", "<leader>jc", jdtls.extract_constant, opts)
vim.keymap.set("v", "<leader>jc", function()
    jdtls.extract_constant(true)
end, opts)
vim.keymap.set("v", "<leader>jm", function()
    jdtls.extract_method(true)
end, opts)
