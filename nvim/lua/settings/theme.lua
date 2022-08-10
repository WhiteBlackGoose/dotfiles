vim.cmd[[
set termguicolors
]]

vim.g.theme_dark = function()
    vim.cmd[[
    let g:airline_theme='violet'
    ]]
    vim.g.tokyonight_style = "storm"
    vim.cmd[[
    colorscheme tokyonight
    ]]
    vim.o.background = "dark"
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]  
end

vim.g.theme_dark()

