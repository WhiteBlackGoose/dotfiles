add('n', '<leader>j', 'zc')
add('n', '<leader>k', 'zo:IndentBlanklineRefresh<CR>')
if vim.g.use_ide() then
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end
