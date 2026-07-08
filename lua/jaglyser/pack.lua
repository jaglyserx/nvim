local gh = function(repo)
    return "https://github.com/" .. repo
end

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(event)
        local name = event.data.spec.name
        local kind = event.data.kind

        if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
            vim.schedule(function()
                pcall(vim.cmd.TSUpdate)
            end)
        end

        if name == "codediff.nvim" and (kind == "install" or kind == "update") then
            vim.system({ "./build.sh" }, { cwd = event.data.path }, function(result)
                if result.code ~= 0 then
                    vim.schedule(function()
                        vim.notify("codediff.nvim build failed: " .. result.stderr, vim.log.levels.ERROR)
                    end)
                end
            end)
        end
    end,
})

vim.pack.add({
    gh("nvim-lua/plenary.nvim"),
    gh("nvim-telescope/telescope.nvim"),
    gh("oxfist/night-owl.nvim"),
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
    gh("mbbill/undotree"),
    gh("hrsh7th/nvim-cmp"),
    gh("hrsh7th/cmp-nvim-lsp"),
    gh("mfussenegger/nvim-jdtls"),
    gh("williamboman/mason.nvim"),
    gh("williamboman/mason-lspconfig.nvim"),
    gh("christoomey/vim-tmux-navigator"),
    { src = gh("ThePrimeagen/harpoon"), version = "harpoon2" },
    gh("sindrets/diffview.nvim"),
    gh("stevearc/oil.nvim"),
    gh("tpope/vim-fugitive"),
    gh("lervag/vimtex"),
    gh("gilion-joel-b/UUID-Generator"),
    gh("folke/snacks.nvim"),
}, { load = true, confirm = false })

vim.pack.add({
    gh("esmuellert/codediff.nvim"),
}, { load = false, confirm = false })

vim.api.nvim_create_user_command("CodeDiff", function(opts)
    vim.cmd.packadd("codediff.nvim")
    require("codediff.commands").vscode_diff(opts)
end, {
    nargs = "*",
    bang = true,
    range = true,
    desc = "VSCode-style diff view",
})
