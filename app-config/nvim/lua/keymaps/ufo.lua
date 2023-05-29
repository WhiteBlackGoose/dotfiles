add('n', '<leader>j', 'zc')
add('n', '<leader>k', 'zo:IndentBlanklineRefresh<CR>')
add('n', '<leader>K', 'zO:IndentBlanklineRefresh<CR>')
if vim.g.use_ide() then
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
end
