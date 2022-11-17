local cmd = vim.cmd
local opt = vim.opt

opt.clipboard = 'unnamedplus'
-- opt.cursorline = true
opt.number = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]

-- By alphabet please
require('settings.airline')
require('settings.barbar')
require('settings.deoplete')
require('settings.nvim-tree')
require('settings.mason')
require('settings.vimtex')
require('settings.telescope')

if vim.g.use_ide() then
    require('settings.asyncomplete')
    require('settings.ale')
    require('settings.omnisharp-vim')
    require('settings.ionide')
    require('settings.dap')
    require('settings.dapui')
    require('settings.dap-python')
    require('settings.vim-test')
    require('settings.nvim-treesitter')
    require('settings.gitsigns')
    require('settings.nvim-autopairs')
    require('settings.rust-tools')
    require('settings.rust-lsp')

    -- vim.cmd[[NvimTreeOpen]]
end


