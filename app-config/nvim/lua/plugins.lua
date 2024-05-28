local commonPlugins = {
    'lewis6991/impatient.nvim',
    -- 'romgrk/barbar.nvim',
    { 'mg979/vim-visual-multi', branch = 'master' },
    {'kyazdani42/nvim-web-devicons', dev = false},
    'kyazdani42/nvim-tree.lua',
    {'folke/tokyonight.nvim', branch = 'main' },
    'ayu-theme/ayu-vim',
    'nvim-lua/plenary.nvim',
    {'nvim-telescope/telescope.nvim' },
    'nvim-telescope/telescope-symbols.nvim',
    'lervag/vimtex',
    'voldikss/vim-floaterm',
    'dyng/ctrlsf.vim',
    'samodostal/image.nvim',
    'm00qek/baleia.nvim',
    { 'https://github.com/Draco-lang/draco-nvim', dev=false },
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
    {'https://github.com/vim-airline/vim-airline'},
    'vim-airline/vim-airline-themes',
    'MunifTanjim/nui.nvim',
    'https://github.com/vonheikemen/fine-cmdline.nvim',
    -- { 'WhiteBlackGoose/power-char.nvim', dev=false,
    --     config = function (_)
    --         require('power-char').setup{}
    --     end
    -- }
    'eandrju/cellular-automaton.nvim',
    'WhiteBlackGoose/andromeda.nvim',
    'zanglg/nova.nvim',
    'Mofiqul/dracula.nvim',
    {
        "baliestri/aura-theme",
        lazy = false,
        priority = 1000,
        config = function(plugin)
          vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
          vim.cmd([[colorscheme aura-dark]])
        end
    },
    'projekt0n/github-nvim-theme',
    'navarasu/onedark.nvim',
    'Pocco81/high-str.nvim'
}

if vim.g.neovide == nil then
    commonPlugins = TableUnion(commonPlugins, {
    })
else
    commonPlugins = TableUnion(commonPlugins, {
    })
end

local idePlugins = {
    { 'Shougo/deoplete.nvim', build = ":UpdateRemotePlugins" },
    'deoplete-plugins/deoplete-lsp',
    'prabirshrestha/asyncomplete.vim',
    'dense-analysis/ale',
    'OmniSharp/omnisharp-vim',
    'ionide/Ionide-vim',
    'nvim-neotest/nvim-nio',
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'lukas-reineke/indent-blankline.nvim',
    'vim-test/vim-test',
    {'nvim-treesitter/nvim-treesitter', dev=false},
    'nvim-treesitter/playground',
    'lewis6991/gitsigns.nvim',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    {'neovim/nvim-lspconfig', dev=false },
    'simrat39/rust-tools.nvim',
    'zchee/deoplete-jedi',
    'mfussenegger/nvim-dap-python',
    'kevinhwang91/promise-async',
    'kevinhwang91/nvim-ufo',
    'nguyenvukhang/nvim-toggler',
    {'dccsillag/magma-nvim', dev=false, branch = 'main', build = ":UpdateRemotePlugins" },
    -- 'nvim-treesitter/nvim-treesitter-context',
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

    'https://github.com/hrsh7th/cmp-path',
    'https://github.com/hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'https://github.com/saadparwaiz1/cmp_luasnip',
    { 'https://github.com/hrsh7th/nvim-cmp' },

    { 'https://github.com/lkhphuc/jupyter-kernel.nvim', branch = "main", build = ":UpdateRemotePlugins", opts = {
    inspect = {
          -- opts for vim.lsp.util.open_floating_preview
          window = {
            max_width = 84,
          },
        },
        -- time to wait for kernel's response in seconds
        timeout = 0.5,
      }},

    { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',  config =
        function()
            require("lsp_lines").setup()
            vim.diagnostic.config({ virtual_lines = false })
        end },

    { 'aaronhallaert/ts-advanced-git-search.nvim', dev = false,
        config = function()
                require("telescope").load_extension("advanced_git_search")
            end, },

    { "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },

    {"https://github.com/WhiteBlackGoose/orgmode", dev=false },
    {"https://github.com/lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, },
    -- {"https://github.com/nvim-orgmode/orgmode" },
    'akinsho/org-bullets.nvim',
    -- "https://github.com/lukas-reineke/headlines.nvim",
    'mfussenegger/nvim-jdtls',
    'onsails/lspkind.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-pack/nvim-spectre',
    {
        'WhiteBlackGoose/gpt4all.nvim',
        dev=false,
        event = "VeryLazy",
        config = function()
          require("chatgpt").setup {
            openai_params = {
                model = "ggml-gpt4all-j",
            }
          }
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope.nvim"
        }
    },
    {
        "WhiteBlackGoose/markdown-preview.nvim",
        dev=false,
        ft = "markdown",
        build = function()
          vim.fn["mkdp#util#install"]()
        end
    },
}

local lazy_opt = {
    dev = {
        path = "~/prj",
        fallback = false
    }
}
if vim.g.use_ide() then
    require("lazy").setup(TableUnion(commonPlugins, idePlugins), lazy_opt)
else
    require("lazy").setup(commonPlugins, lazy_opt)
end

vim.g['python3_host_prog'] = '/usr/bin/python3'
require('impatient')
require('leap')

require('baleia').setup { }
if vim.g.use_ide() then
    require('markdowny').setup({filetypes = {'markdown'}})
end


