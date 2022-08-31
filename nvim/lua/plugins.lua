local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romgrk/barbar.nvim'

Plug 'dense-analysis/ale'
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

vim.call('plug#end')

