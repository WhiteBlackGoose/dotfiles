require'lspconfig'.texlab.setup{}

-- chktex is in my way
vim.g['ale_tex_chktex_executable'] = 'aaa'
vim.g['ale_tex_lacheck_executable'] = 'aaa'

function TexMoveOut(path)
    vim.g.vimtex_compiler_latexmk = {
        build_dir = path,
        options = {
            '-shell-escape',
            '-verbose',
            '-file-line-error',
            '-interaction=nonstopmode',
            '-synctex=1'
        }
    }
end

function TexMoveOutAbove()
    TexMoveOut('../.out')
    vim.cmd[[:VimtexReload]]
end

TexMoveOut('.out')
vim.g['vimtex_view_method'] = 'zathura'
vim.cmd[[
:command TexMoveOutAbove lua TexMoveOutAbove()<CR>
]]
