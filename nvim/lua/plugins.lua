local Plug = vim.fn['plug#']

-- ~/.local/share/nvim/plugged

vim.call('plug#begin')

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-lsp'

if vim.g.use_ide() then
    Plug 'prabirshrestha/asyncomplete.vim'
end

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romgrk/barbar.nvim'

-- DO NOT FORGET TO SWITCH BACK ONCE
-- https://github.com/dense-analysis/ale/pull/4289
-- IS MERGED
-- Plug 'dense-analysis/ale'
if vim.g.use_ide() then
    Plug('vimpostor/ale', { branch = 'virt_all' })
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'ionide/Ionide-vim'
end

Plug('mg979/vim-visual-multi', { branch = 'master' })

if not vim.g.use_simple() then
    Plug 'kyazdani42/nvim-web-devicons'
end
Plug 'kyazdani42/nvim-tree.lua'

Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'ayu-theme/ayu-vim'

if vim.g.use_ide() then
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
end

if vim.g.use_ide() then
    Plug 'lukas-reineke/indent-blankline.nvim'
end

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })

if vim.g.use_ide() then
    Plug 'vim-test/vim-test'

    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'p00f/nvim-ts-rainbow'

    Plug 'lewis6991/gitsigns.nvim'

    Plug 'windwp/nvim-autopairs'

    Plug 'windwp/nvim-ts-autotag'
end

Plug 'edluffy/hologram.nvim'

Plug 'lervag/vimtex'

if vim.g.use_ide() then
    Plug 'neovim/nvim-lspconfig' 
    Plug 'simrat39/rust-tools.nvim'
end

Plug 'voldikss/vim-floaterm'

Plug 'dyng/ctrlsf.vim'

vim.call('plug#end')

require('hologram').setup{
    auto_display = true
}
