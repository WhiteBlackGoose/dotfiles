vim.cmd[[
set termguicolors
]]

vim.g.theme_dark = function()
    vim.cmd[[
    let g:airline_theme='violet'
    ]]
    vim.g.tokyonight_style = "storm"
    -- vim.cmd[[colorscheme tokyonight]]
    vim.cmd[[
    let ayucolor="dark"
    colorscheme ayu
    ]]
    vim.o.background = "dark"

    -- Syntastics
    vim.cmd[[highlight SyntasticErrorSign guifg=#FF5555]]
    vim.cmd[[highlight SyntasticWarningSign guifg=#FFFF55]]


    -- Dap
    vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#5555DD', guibg='#31353f' }, false)
    vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
    vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#31353f' }, false)
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]

    -- Syntastics
    vim.cmd[[highlight SyntasticErrorSign guifg=#FF5555]]
    vim.cmd[[highlight SyntasticWarningSign guifg=#AAAA33]]

    -- Dap
    vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#8888EE', guibg='#E0E0E0' }, false)
    vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#E0E0E0' }, false)
    vim.highlight.create('DapStopped', { ctermbg=0, guifg='#228822', guibg='#E0E0E0' }, false)

end

vim.g.theme_dark()



