local M = {}

function M.require(name, label)
    local ok, module = pcall(require, name)
    if ok then
        return module
    end

    vim.schedule(function()
        vim.notify(
            ("Plugin %s was not able to start: %s"):format(label or name, module),
            vim.log.levels.WARN
        )
    end)
end

function M.safe_setup(label, setup)
    local ok, err = pcall(setup)
    if ok then
        return true
    end

    vim.schedule(function()
        vim.notify(
            ("Plugin %s was not able to start: %s"):format(label, err),
            vim.log.levels.WARN
        )
    end)

    return false
end

return M
