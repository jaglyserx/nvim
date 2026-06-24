local function codediff_nightowl()
    vim.api.nvim_set_hl(0, "CodeDiffLineInsert", { bg = "#12301f" })
    vim.api.nvim_set_hl(0, "CodeDiffLineDelete", { bg = "#3a1f25" })
    vim.api.nvim_set_hl(0, "CodeDiffCharInsert", { bg = "#12301f" })
    vim.api.nvim_set_hl(0, "CodeDiffCharDelete", { bg = "#3a1f25" })
    vim.api.nvim_set_hl(0, "CodeDiffLineMove", { bg = "#1d2b3a" })
    vim.api.nvim_set_hl(0, "CodeDiffCharMove", { bg = "#1d2b3a" })
    vim.api.nvim_set_hl(0, "CodeDiffFiller", { fg = "#4b6479" })
end

codediff_nightowl()

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "night-owl",
    callback = codediff_nightowl,
})
