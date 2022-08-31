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
    vim.highlight.create('SyntasticErrorSign', { guifg="#FF5555" })
    vim.highlight.create('SyntasticErrorLine', { guibg="#331111" })
    vim.highlight.create('SyntasticWarningSign', { guifg="#FFFF55" })
    vim.highlight.create('SyntasticWarningLine', { guibg="#2A2A11" })

    -- Dap
    vim.highlight.create('DapBreakpoint', { guifg='#AAAAFF' })
    vim.highlight.create('DapBreakpointLine', { guibg='#222244' })
    vim.highlight.create('DapStopped', { guifg='#228822' })
    vim.highlight.create('DapStoppedLine', { guibg='#224422' })
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]

    -- Syntastics
    vim.highlight.create('SyntasticErrorSign', { guifg="#FF5555" })
    vim.highlight.create('SyntasticErrorLine', { guibg="#FFEFEF" })
    vim.highlight.create('SyntasticWarningSign', { guifg="#FFA500" })
    vim.highlight.create('SyntasticWarningLine', { guibg="#FFF3D0" })

    -- Dap
    vim.highlight.create('DapBreakpoint', { guifg='#8888EE' })
    vim.highlight.create('DapBreakpointLine', { guibg='#EFEFFF' })
    vim.highlight.create('DapStopped', { guifg='#228822' })
    vim.highlight.create('DapStoppedLine', { guibg='#CCFFCC' })

end

vim.g.theme_dark()



