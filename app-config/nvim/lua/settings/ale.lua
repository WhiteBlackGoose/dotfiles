vim.g['ale_python_flake8_options'] = '--ignore=F,W1,E1,W2,E2,W3,E3,W4,E4,W5,E5,E125,E722,E402'
-- vim.b['ale_linters'] = { python = { 'flake8', 'jedils' } }
-- Add the C# one
vim.b['ale_linters'] = { python = { 'flake8' }, rust = { "rust-analyzer" } }
-- vim.g['ale_linters_explicit'] = 1

vim.g['ale_lsp_suggestions'] = 0
vim.g['ale_lsp_show_message_severity'] = 'information'

vim.g['ale_sign_error'] =          LspSigns.Error
vim.g['ale_sign_warning'] =        LspSigns.Warn
vim.g['ale_sign_info'] =           LspSigns.Info
vim.g['ale_sign_style_error'] =    LspSigns.Info
vim.g['ale_sign_style_warning'] =  LspSigns.Info
vim.g['ale_sign_suggestion'] =     LspSigns.Hint

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
