-- Tree
add('n', '<A-f>', ':NvimTreeFindFile<CR>')
add('n', '<A-t>', ':NvimTreeToggle<CR>')
-- Tabs
add('n', '<A-,>', ':BufferPrevious<CR>')
add('n', '<A-.>', ':BufferNext<CR>')
add('n', '<A-<>', ':BufferMovePrevious<CR>')
add('n', '<A->>', ':BufferMoveNext<CR>')
add('n', '<A-c>', ':BufferClose<CR>')
-- CtrlSF

add('n', '<leader>fff', '<Plug>CtrlSFPrompt')
add('n', '<leader>ffo', ':CtrlSFOpen<CR>')

-- Change themes
add('n', '<leader>the', ":lua vim.g.theme_toggle()<CR>")
