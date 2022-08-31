vim.cmd[[
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
]]

vim.g.toggle_synt = function()
    if vim.g['syntastic_always_populate_loc_list'] == 1 then 
        vim.g['syntastic_always_populate_loc_list'] = 0
        vim.g['syntastic_auto_loc_list'] = 0
        vim.g['syntastic_check_on_open'] = 0
    else
        vim.g['syntastic_always_populate_loc_list'] = 1
        vim.g['syntastic_auto_loc_list'] = 1
        vim.g['syntastic_check_on_open'] = 1
    end
end

vim.g['syntastic_always_populate_loc_list'] = 0
vim.g['syntastic_auto_loc_list'] = 0
vim.g['syntastic_check_on_open'] = 0
vim.g['syntastic_check_on_wq'] = 0
vim.g['syntastic_cs_checkers'] = { 'code_checker' }

vim.g['syntastic_error_symbol'] = ' '
vim.g['syntastic_warning_symbol'] = ' '

vim.g['syntastic_style_error_symbol'] = ''
vim.g['syntastic_style_warning_symbol'] = ''


