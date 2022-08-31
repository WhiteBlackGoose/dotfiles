local cmd = vim.cmd
local opt = vim.opt

-- opt.cursorline = true
opt.number = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

-- By alphabet please
require('settings.airline')
require('settings.ale')
require('settings.alpha')
require('settings.asyncomplete')
require('settings.barbar')
require('settings.dap')
require('settings.deoplete')
require('settings.nvim-tree')
require('settings.omnisharp-vim')
