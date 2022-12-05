
vim.cmd[[
let g:deoplete#enable_at_startup = 0
call deoplete#custom#option({
\    'auto_complete': v:true,
\})
autocmd InsertEnter * call deoplete#enable()
:command NoDeoplete call deoplete#custom#option('auto_complete', v:false)
]]

