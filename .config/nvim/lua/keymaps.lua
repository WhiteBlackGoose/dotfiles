map = vim.api.nvim_set_keymap

norm = { noremap = true, silent = true }

add = function(mode, key, output)
    map(mode, key, output, norm)
end

vim.cmd[[set mouse=]]

-- Common
add('n', '<space>', '<nop>')
vim.cmd[[let mapleader=" "]]

add('n', '<A-">', '<C-y>')
add('n', '<A-:>', '<C-e>')

add('n', '<C-l>', 'zz')

add('i', '<C-t>', '<C-V><Tab>') -- inserts actual tab symbol
add('i', 'jk', '<Esc>')
add('i', 'kj', '<Esc>')
add('n', '<esc>', ':noh<CR>')

add('i', '<A-9>', '();<Esc>hi');

-- Auto complete
vim.cmd[[inoremap <C-Space>  <Cmd>call deoplete#mapping#_rpcrequest_wrapper([])<CR>]]


require('keymaps.ale')
require('keymaps.amcli')
require('keymaps.common-editor')
require('keymaps.common-ide')
require('keymaps.langs-dotnet')
require('keymaps.langs-latex')
require('keymaps.langs-rust')
require('keymaps.leap')
require('keymaps.special-symbols')
require('keymaps.telescope')
require('keymaps.ufo')
require('keymaps.windows')
