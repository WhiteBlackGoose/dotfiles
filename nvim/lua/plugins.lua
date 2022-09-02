local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romgrk/barbar.nvim'

-- DO NOT FORGET TO SWITCH BACK ONCE
-- https://github.com/dense-analysis/ale/pull/4289
-- IS MERGED
-- Plug 'dense-analysis/ale'
Plug('vimpostor/ale', { branch = 'virt_all' })
Plug 'OmniSharp/omnisharp-vim'
Plug 'ionide/Ionide-vim'

Plug('mg979/vim-visual-multi', { branch = 'master' })

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug('folke/tokyonight.nvim', { branch = 'main' })
Plug 'ayu-theme/ayu-vim'

Plug 'mfussenegger/nvim-dap'

Plug 'goolord/alpha-nvim'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })

Plug 'vim-test/vim-test'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'p00f/nvim-ts-rainbow'

Plug 'lewis6991/gitsigns.nvim'

-- How to enable **only** parens and only for a few file types?
-- Plug 'windwp/nvim-autopairs'

vim.call('plug#end')

