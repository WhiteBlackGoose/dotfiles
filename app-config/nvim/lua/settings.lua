local cmd = vim.cmd
local opt = vim.opt

opt.clipboard = 'unnamedplus'
if vim.g.use_ide() then
    opt.cursorline = true
    opt.number = true
    opt.relativenumber = true
end

vim.wo.fillchars='eob: '

opt.ignorecase = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]
vim.cmd[[set virtualedit=block]]

vim.g.editorconfig = true

vim.g['python3_host_prog'] = 'python3'

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.html"},
    callback = function(_)
        vim.cmd[[command HtmlView !surf % & disown]]
    end
})

-- By alphabet please
require('settings.airline')
require('settings.auto-char')
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
    require('settings.colortils')
    require('settings.dap')
    LazyRequire('settings.dap-python', {'*.py'})
    require('settings.dapui')
    LazyRequire('settings.fstar-lsp', {'*.fst'})
    require('settings.gitsigns')
    LazyRequire('settings.ionide', {'*.fs', "*.fsproj"})
    require('settings.iron')
    LazyRequire('settings.latex', {"*.tex"})
    require('settings.lsp')
    LazyRequire('settings.lua-lsp', {"*.lua"})
    require('settings.magma')
    require('settings.trans')
    require('settings.nvim-autopairs')
    require('settings.nvim-cmp')
    require('settings.nvim-treesitter')
    LazyRequire('settings.ale', {"*.csproj", "*.cs"})
    LazyRequire('settings.asyncomplete', {"*.csproj", "*.cs"})
    LazyRequire('settings.omnisharp-vim', {"*.csproj", "*.cs"})
    LazyRequire('settings.vim-test', {"*.csproj", "*.cs"})
    LazyRequire('settings.orgmode', {"*.org"})
    LazyRequire('settings.rust', {"*.rs", "Cargo.*"})
    require('settings.toggler')
    require('settings.ufo')
    require('settings.vim-dadbod-ui')
    require('settings.vim-table-mode')
end

