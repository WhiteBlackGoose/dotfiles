local cmd = vim.cmd
local opt = vim.opt

opt.clipboard = 'unnamedplus'
if vim.g.use_ide() then
    opt.cursorline = true
    opt.number = true
    vim.cmd[[set relativenumber]]
end

vim.wo.fillchars='eob: '

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]
vim.cmd[[set virtualedit=block]]

vim.g['python3_host_prog'] = 'python3'


-- By alphabet please
require('settings.airline')
require('settings.amcli')
require('settings.asciitree')
require('settings.barbar')
require('settings.image-nvim')
require('settings.nvim-tree')
require('settings.telescope')
require('settings.template')
require('settings.spellcheck')
require('settings.undotree')
require('settings.wdiff')

if vim.g.use_ide() then
    require('settings.ale')
    require('settings.asyncomplete')
    require('settings.colortils')
    require('settings.dap')
    require('settings.dap-python')
    require('settings.dapui')
    require('settings.fstar-lsp')
    require('settings.gitsigns')
    require('settings.ionide')
    require('settings.iron')
    require('settings.latex')
    require('settings.lsp')
    require('settings.lua-lsp')
    require('settings.magma')
    require('settings.nvim-autopairs')
    require('settings.nvim-cmp')
    require('settings.nvim-treesitter')
    require('settings.omnisharp-vim')
    require('settings.orgmode')
    require('settings.rust-lsp')
    require('settings.rust-tools')
    require('settings.toggler')
    require('settings.ufo')
    require('settings.vim-dadbod-ui')
    require('settings.vim-table-mode')
    require('settings.vim-test')
end


