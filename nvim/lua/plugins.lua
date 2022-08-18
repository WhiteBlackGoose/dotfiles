local Plug = vim.fn['plug#']


vim.call('plug#begin')

-- Plug('Shougo/deoplete.nvim', { commit = '33ed4fa0cd704999f9f74b37640bf6d7334bac37' })
Plug 'Shougo/deoplete.nvim'

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'deoplete-plugins/deoplete-lsp'
Plug 'ionide/Ionide-vim'
 
Plug('mg979/vim-visual-multi', { branch = 'master' })
 
Plug 'kyazdani42/nvim-web-devicons'
 
-- Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
 
Plug 'romgrk/barbar.nvim'

Plug('folke/tokyonight.nvim', { branch = 'main' })

Plug 'ayu-theme/ayu-vim'

Plug 'mfussenegger/nvim-dap'

vim.call('plug#end')

