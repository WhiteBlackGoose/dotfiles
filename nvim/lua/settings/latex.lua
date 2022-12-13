require'lspconfig'.texlab.setup{}
vim.g.vimtex_compiler_latexmk = {
    build_dir = '.out',
    options = {
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-interaction=nonstopmode',
        '-synctex=1'
    }
}
vim.g['vimtex_view_method'] = 'zathura'
