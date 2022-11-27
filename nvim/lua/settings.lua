local cmd = vim.cmd
local opt = vim.opt

opt.clipboard = 'unnamedplus'
-- opt.cursorline = true
opt.number = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]
vim.cmd[[set relativenumber]]
vim.cmd[[set virtualedit=all]]

-- By alphabet please
require('settings.airline')
require('settings.amcli')
require('settings.barbar')
require('settings.image-nvim')
require('settings.mason')
require('settings.nvim-tree')
require('settings.telescope')

if vim.g.use_ide() then
    require('settings.ale')
    require('settings.asyncomplete')
    require('settings.dap')
    require('settings.dap-python')
    require('settings.dapui')
    require('settings.deoplete')
    require('settings.gitsigns')
    require('settings.ionide')
    require('settings.latex')
    require('settings.nvim-autopairs')
    require('settings.nvim-treesitter')
    require('settings.omnisharp-vim')
    require('settings.rust-lsp')
    require('settings.rust-tools')
    require('settings.toggler')
    require('settings.ufo')
    require('settings.vim-test')
    require('settings.vimtex')
end


