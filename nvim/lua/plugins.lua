local Plug = vim.fn['plug#']


vim.call('plug#begin')

Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-lsp'
Plug 'prabirshrestha/asyncomplete.vim'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


-- vim.cmd[[let g:OmniSharp_server_use_net6 = 1]]

Plug 'vim-syntastic/syntastic'

Plug 'OmniSharp/omnisharp-vim'
-- Plug 'OrangeT/vim-csharp'
Plug 'ionide/Ionide-vim'


Plug('mg979/vim-visual-multi', { branch = 'master' })
 
Plug 'kyazdani42/nvim-web-devicons'
 
-- Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
 
Plug 'romgrk/barbar.nvim'

Plug('folke/tokyonight.nvim', { branch = 'main' })

Plug 'ayu-theme/ayu-vim'

Plug 'mfussenegger/nvim-dap'

Plug 'goolord/alpha-nvim'


vim.call('plug#end')

