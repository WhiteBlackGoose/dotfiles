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

function set_wdiff_syn()
    vim.cmd[[
    " Vim syntax file
    " Language:     wDiff (wordwise diff)
    " Maintainer:   Gerfried Fuchs <alfie@ist.org>
    " Last Change:  25 Apr 2001
    " URL:		http://alfie.ist.org/vim/syntax/wdiff.vim
    "
    " Comments are very welcome - but please make sure that you are commenting on
    " the latest version of this file.
    " SPAM is _NOT_ welcome - be ready to be reported!
    
    
    " For version 5.x: Clear all syntax items
    " For version 6.x: Quit when a syntax file was already loaded
    if version < 600
      syn clear
    elseif exists("b:current_syntax")
      finish
    endif
    
    
    syn region wdiffOld start=+\[-+ end=+-]+
    syn region wdiffNew start="{+" end="+}"
    
    
    " Define the default highlighting.
    " For version 5.7 and earlier: only when not done already
    " For version 5.8 and later: only when an item doesn't have highlighting yet
    if version >= 508 || !exists("did_wdiff_syn_inits")
      let did_wdiff_syn_inits = 1
      if version < 508
        let did_wdiff_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
      else
        command -nargs=+ HiLink hi def link <args>
      endif
    
      HiLink wdiffOld       Special
      HiLink wdiffNew       Identifier
    
      delcommand HiLink
    endif
    
    let b:current_syntax = "wdiff"
    ]]
end

-- By alphabet please
require('settings.airline')
require('settings.amcli')
require('settings.asciitree')
require('settings.barbar')
require('settings.image-nvim')
require('settings.mason')
require('settings.nvim-tree')
require('settings.telescope')
require('settings.undotree')
require('settings.template')

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


