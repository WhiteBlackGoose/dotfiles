
vim.cmd[[
let g:deoplete#enable_at_startup = 0
call deoplete#custom#option({
\    'auto_complete': v:false,
\})
autocmd InsertEnter * call deoplete#enable()
]]

