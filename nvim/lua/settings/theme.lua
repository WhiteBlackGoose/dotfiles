vim.cmd[[
set termguicolors
]]

vim.g.theme_dark = function()
    vim.o.background = "dark"
    vim.g.tokyonight_style = "storm"
    vim.cmd[[
    let g:airline_theme='violet'
    colorscheme tokyonight
    ]]
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]  
end

vim.g.theme_dark()

