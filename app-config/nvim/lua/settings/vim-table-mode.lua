vim.g['table_mode_corner'] = '|'
vim.cmd[[
:autocmd BufNewFile,BufRead *.org let g:table_mode_corner="+"
:autocmd BufNewFile,BufRead *.org TableModeToggle
]]
