function Colors(color)
    color = color or "night-owl"
    pcall(vim.cmd.colorscheme, color)
end
Colors()
