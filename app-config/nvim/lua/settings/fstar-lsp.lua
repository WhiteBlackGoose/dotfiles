require'lspconfig'.fstar.setup{
    root_dir = function (path)
        return "."
    end
}
vim.cmd[[
:au BufRead,BufNewFile *.fst set filetype=fstar
]]