vim.cmd[[
call deoplete#custom#option({
\    'auto_complete_popup': 'manual'
\})
]]

vim.g.auto_complete_popup_deoplete = function()
    vim.cmd[[call deoplete#manual_complete()]]
end

