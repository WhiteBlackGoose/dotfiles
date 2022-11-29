vim.cmd[[
set termguicolors
]]

vim.g.theme_dark = function()
    vim.cmd[[
    let g:airline_theme='violet'
    ]]
    -- vim.g.tokyonight_style = "storm"
    vim.cmd[[colorscheme tokyonight]]
    vim.cmd[[
    let ayucolor="dark"
    ]]
    -- vim.cmd[[colorscheme ayu]]
    vim.o.background = "dark"

    -- Syntastics
    vim.api.nvim_set_hl(0, 'ALEErrorSign', { fg="#FF5555" })
    vim.api.nvim_set_hl(0, 'ALEErrorLine', { bg="#331111" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextError', { fg="#777777", bg="#331111" })
    vim.api.nvim_set_hl(0, 'ALEWarningSign', { fg="#FFFF55" })
    vim.api.nvim_set_hl(0, 'ALEWarningLine', { bg="#2A2A11" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextWarning', { fg="#777777", bg="#2A2A11" })
    vim.api.nvim_set_hl(0, 'ALEStyleErrorSign', { fg="#FF5555" })
    vim.api.nvim_set_hl(0, 'ALEStyleErrorLine', { bg="#331111" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextStyleError', { fg="#777777", bg="#331111" })
    vim.api.nvim_set_hl(0, 'ALEStyleWarningSign', { fg="#6666CC" })
    vim.api.nvim_set_hl(0, 'ALEStyleWarningLine', { bg="#2A2A11" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextStyleWarning', { fg="#777777", bg="#2A2A11" })

    -- Dap
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='#AAAAFF' })
    vim.api.nvim_set_hl(0, 'DapBreakpointLine', { bg='#222244' })
    vim.api.nvim_set_hl(0, 'DapStopped', { fg='#228822' })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg='#224422' })

    vim.g['theme_current'] = 'dark'
end

vim.g.theme_light = function()
    vim.cmd[[
    let g:airline_theme='light'
    let ayucolor="light"
    colorscheme ayu
    ]]

    -- Syntastics
    vim.api.nvim_set_hl(0, 'ALEErrorSign', { fg="#FF5555" })
    vim.api.nvim_set_hl(0, 'ALEErrorLine', { bg="#FFEFEF" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextError', { fg="#AAAAAA", bg="#FFEFEF" })

    vim.api.nvim_set_hl(0, 'ALEWarningSign', { fg="#FFA500" })
    vim.api.nvim_set_hl(0, 'ALEWarningLine', { bg="#FFF3D0" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextWarning', { fg="#AAAAAA", bg="#FFF3D0" })
    vim.api.nvim_set_hl(0, 'ALEStyleErrorSign', { fg="#FF5555" })
    vim.api.nvim_set_hl(0, 'ALEStyleErrorLine', { bg="#FFEFEF" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextStyleError', { fg="#AAAAAA", bg="#FFEFEF" })
    vim.api.nvim_set_hl(0, 'ALEStyleWarningSign', { fg="#AAAAFF" })
    vim.api.nvim_set_hl(0, 'ALEStyleWarningLine', { bg="#FFF3D0" })
    vim.api.nvim_set_hl(0, 'ALEVirtualTextStyleWarning', { fg="#AAAAAA", bg="#FFF3D0" })

    -- Dap
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='#8888EE' })
    vim.api.nvim_set_hl(0, 'DapBreakpointLine', { bg='#EFEFFF' })
    vim.api.nvim_set_hl(0, 'DapStopped', { fg='#228822' })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg='#CCFFCC' })

    vim.g['theme_current'] = 'light'
end

vim.g.theme_toggle = function()
    if vim.g['theme_current'] == 'light' then
        vim.g.theme_dark()
    else
        vim.g.theme_light()
    end
end

if vim.g["startup_theme"] == "light" then
    vim.g.theme_light()
else
    vim.g.theme_dark()
end



