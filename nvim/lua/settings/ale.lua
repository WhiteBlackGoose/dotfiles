vim.b['ale_linters'] = { 'code_checker' }

vim.g['ale_lsp_suggestions'] = 1
vim.g['ale_lsp_show_message_severity'] = 'information'

vim.g['ale_sign_error'] = ' '
vim.g['ale_sign_warning'] = ' '
vim.g['ale_sign_info'] = ' '
vim.g['ale_sign_suggestion'] = ' '

vim.g['airline#extensions#ale#enabled'] = 1

vim.g['ale_echo_msg_format'] = '[%linter%] %s'


vim.g['ale_floating_window_border'] = { '│', '─', '╭', '╮', '╯', '╰', '│', '─' }

vim.g['ale_virtualtext_prefix'] = '    '
vim.g['ale_echo_cursor'] = 1
vim.g['ale_virtualtext_cursor'] = 1
vim.g['ale_hover'] = 1
