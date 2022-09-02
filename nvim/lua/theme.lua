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
    vim.highlight.create('ALEErrorSign', { guifg="#FF5555" })
    vim.highlight.create('ALEErrorLine', { guibg="#331111" })
    vim.highlight.create('ALEVirtualTextError', { guifg="#777777", guibg="#331111" })
    vim.highlight.create('ALEWarningSign', { guifg="#FFFF55" })
    vim.highlight.create('ALEWarningLine', { guibg="#2A2A11" })
    vim.highlight.create('ALEVirtualTextWarning', { guifg="#777777", guibg="#2A2A11" })
    vim.highlight.create('ALEStyleErrorSign', { guifg="#FF5555" })
    vim.highlight.create('ALEStyleErrorLine', { guibg="#331111" })
    vim.highlight.create('ALEVirtualTextStyleError', { guifg="#777777", guibg="#331111" })
    vim.highlight.create('ALEStyleWarningSign', { guifg="#6666CC" })
    vim.highlight.create('ALEStyleWarningLine', { guibg="#2A2A11" })
    vim.highlight.create('ALEVirtualTextStyleWarning', { guifg="#777777", guibg="#2A2A11" })

    -- Dap
    vim.highlight.create('DapBreakpoint', { guifg='#AAAAFF' })
    vim.highlight.create('DapBreakpointLine', { guibg='#222244' })
    vim.highlight.create('DapStopped', { guifg='#228822' })
    vim.highlight.create('DapStoppedLine', { guibg='#224422' })

    vim.g['theme_current'] = 'dark'
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]

    -- Syntastics
    vim.highlight.create('ALEErrorSign', { guifg="#FF5555" })
    vim.highlight.create('ALEErrorLine', { guibg="#FFEFEF" })
    vim.highlight.create('ALEVirtualTextError', { guifg="#AAAAAA", guibg="#FFEFEF" })

    vim.highlight.create('ALEWarningSign', { guifg="#FFA500" })
    vim.highlight.create('ALEWarningLine', { guibg="#FFF3D0" })
    vim.highlight.create('ALEVirtualTextWarning', { guifg="#AAAAAA", guibg="#FFF3D0" })
    vim.highlight.create('ALEStyleErrorSign', { guifg="#FF5555" })
    vim.highlight.create('ALEStyleErrorLine', { guibg="#FFEFEF" })
    vim.highlight.create('ALEVirtualTextStyleError', { guifg="#AAAAAA", guibg="#FFEFEF" })
    vim.highlight.create('ALEStyleWarningSign', { guifg="#AAAAFF" })
    vim.highlight.create('ALEStyleWarningLine', { guibg="#FFF3D0" })
    vim.highlight.create('ALEVirtualTextStyleWarning', { guifg="#AAAAAA", guibg="#FFF3D0" })

    -- Dap
    vim.highlight.create('DapBreakpoint', { guifg='#8888EE' })
    vim.highlight.create('DapBreakpointLine', { guibg='#EFEFFF' })
    vim.highlight.create('DapStopped', { guifg='#228822' })
    vim.highlight.create('DapStoppedLine', { guibg='#CCFFCC' })

    vim.g['theme_current'] = 'light'
end

vim.g.theme_toggle = function()
    if vim.g['theme_current'] == 'light' then
        vim.g.theme_dark()
    else
        vim.g.theme_light()
    end
end

vim.g.theme_dark()
-- vim.g.theme_light()



