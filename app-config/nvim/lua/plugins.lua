local Plug = vim.fn['plug#']

-- ~/.local/share/nvim/plugged

commonPlugins = {
    'lewis6991/impatient.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'https://github.com/vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'romgrk/barbar.nvim',
    { 'mg979/vim-visual-multi', branch = 'master' },
    'kyazdani42/nvim-web-devicons',
    'kyazdani42/nvim-tree.lua',
    {'folke/tokyonight.nvim', branch = 'main' },
    'ayu-theme/ayu-vim',
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope.nvim', tag = '0.1.0' },
    'lervag/vimtex',
    'voldikss/vim-floaterm',
    'dyng/ctrlsf.vim',
    'samodostal/image.nvim',
    'm00qek/baleia.nvim',
    'https://github.com/Draco-lang/draco-nvim',
    'https://github.com/ggandor/leap.nvim',
    'https://github.com/xorid/asciitree.nvim',
    'glepnir/template.nvim',
    'https://github.com/tpope/vim-surround',
    'https://github.com/mbbill/undotree',
    'https://github.com/lambdalisue/suda.vim',
    'https://github.com/LnL7/vim-nix',
    'https://github.com/AndrewRadev/linediff.vim',
    "olimorris/onedarkpro.nvim",
    'doums/darcula',
    { 'catppuccin/nvim', as = 'catppuccin' },
}

idePlugins = {
    'Shougo/deoplete.nvim',
    'deoplete-plugins/deoplete-lsp',
    'prabirshrestha/asyncomplete.vim',
    'dense-analysis/ale',
    'OmniSharp/omnisharp-vim',
    'ionide/Ionide-vim',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'lukas-reineke/indent-blankline.nvim',
    'vim-test/vim-test',
    'nvim-treesitter/nvim-treesitter',
    'p00f/nvim-ts-rainbow',
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'neovim/nvim-lspconfig' ,
    'simrat39/rust-tools.nvim',
    'zchee/deoplete-jedi',
    'mfussenegger/nvim-dap-python',
    'kevinhwang91/promise-async',
    'kevinhwang91/nvim-ufo',
    'nguyenvukhang/nvim-toggler',
    {'WhiteBlackGoose/magma-nvim-goose', branch = 'main' },
    'nvim-treesitter/nvim-treesitter-context',
    'tpope/vim-fugitive',
    'tpope/vim-dadbod',
    'https://github.com/kristijanhusak/vim-dadbod-ui',
    'https://github.com/kristijanhusak/vim-dadbod-completion',
    'https://github.com/folke/neodev.nvim',
    'https://github.com/nvim-colortils/colortils.nvim',
    'https://github.com/opdavies/toggle-checkbox.nvim',
    'dhruvasagar/vim-table-mode',
    'https://github.com/antonk52/markdowny.nvim',
    'https://github.com/hkupty/iron.nvim',
    'https://github.com/lkhphuc/jupyter-kernel.nvim',
    'https://github.com/hrsh7th/nvim-cmp',
}

if vim.g.use_ide() then
    require("lazy").setup(TableUnion(commonPlugins, idePlugins), {})
else
    require("lazy").setup(commonPlugins, {})
end

vim.g['python3_host_prog'] = '/usr/bin/python3'
require('impatient')
require('leap')

require('baleia').setup { }
if vim.g.use_ide() then
    require('markdowny').setup({filetypes = {'markdown'}})
end
