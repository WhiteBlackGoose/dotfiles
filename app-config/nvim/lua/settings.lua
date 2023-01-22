local cmd = vim.cmd
local opt = vim.opt

opt.clipboard = 'unnamedplus'
if vim.g.use_ide() then
    opt.cursorline = true
end
opt.number = true

vim.wo.fillchars='eob: '

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]
vim.cmd[[set relativenumber]]
vim.cmd[[set virtualedit=block]]

vim.g['python3_host_prog'] = 'python3'


-- By alphabet please
require('settings.airline')
require('settings.amcli')
require('settings.asciitree')
-- require('settings.barbar')
require('settings.image-nvim')
require('settings.mason')
require('settings.nvim-tree')
require('settings.telescope')
require('settings.template')
require('settings.undotree')
require('settings.wdiff')

if vim.g.use_ide() then
    require('settings.ale')
    require('settings.asyncomplete')
    require('settings.clang')
    require('settings.colortils')
    require('settings.dap')
    require('settings.dap-python')
    require('settings.dapui')
    require('settings.deoplete')
    require('settings.gitsigns')
    require('settings.ionide')
    require('settings.latex')
    require('settings.lua-lsp')
    require('settings.magma')
    require('settings.nvim-autopairs')
    require('settings.nvim-treesitter')
    require('settings.omnisharp-vim')
    require('settings.rust-lsp')
    require('settings.rust-tools')
    require('settings.toggler')
    require('settings.ufo')
    require('settings.vim-dadbod-ui')
    require('settings.vim-table-mode')
    require('settings.vim-test')
end


