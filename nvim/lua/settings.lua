local cmd = vim.cmd
local opt = vim.opt

-- opt.cursorline = true
opt.number = true

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false

require('settings.barbar')
require('settings.nvim-tree')
require('settings.theme')
require('settings.airline')
