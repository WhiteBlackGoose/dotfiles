vim.b['ale_linters'] = { 'code_checker' }

vim.g['ale_lsp_suggestions'] = 1
vim.g['ale_lsp_show_message_severity'] = 'information'

vim.g['ale_sign_error'] =          vim.g.gsign(' ', 'E')
vim.g['ale_sign_warning'] =        vim.g.gsign(' ', 'W')
vim.g['ale_sign_info'] =           vim.g.gsign(' ', 'I')
vim.g['ale_sign_style_error'] =    vim.g.gsign(' ', 'I')
vim.g['ale_sign_style_warning'] =  vim.g.gsign(' ', 'I')
vim.g['ale_sign_suggestion'] =     vim.g.gsign(' ', 'L')

vim.g['airline#extensions#ale#enabled'] = 1

vim.g['ale_echo_msg_format'] = '[%linter%] %s [%severity%]'

vim.g['spacegray_use_italics'] = 1
vim.g['ale_floating_window_border'] = { '│', '─', '╭', '╮', '╯', '╰', '│', '─' }

vim.g['ale_virtualtext_prefix'] = vim.g.gsign('    ', '    > ')
vim.g['ale_echo_cursor'] = 1
vim.g['ale_virtualtext_cursor'] = 2

vim.g['ale_hover_to_floating_preview'] = 1
vim.g['ale_hover_to_preview'] = 1
vim.g['ale_floating_preview'] = 1
vim.g['ale_hover'] = 1
