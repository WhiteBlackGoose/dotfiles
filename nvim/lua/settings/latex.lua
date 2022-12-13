require'lspconfig'.texlab.setup{}
vim.g.vimtex_compiler_latexmk = { build_dir = '.out', options = { '-shell-escape' } }
vim.g['vimtex_view_method'] = 'zathura'
