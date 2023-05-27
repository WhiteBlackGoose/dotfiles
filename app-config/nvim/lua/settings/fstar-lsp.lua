vim.cmd[[
:au BufRead,BufNewFile *.fst set filetype=fstar
:au BufRead,BufNewFile *.fst set syntax=fsharp
]]
require'lspconfig'.fstar.setup{
    root_dir = function (path)
        return "."
    end
}
-- function RunFStar()
--    vim.lsp.start({
--        name = 'fstar',
--        cmd={"fstar.exe", "--lsp"},
--        root_dir='.',
--        detached=false,
--        on_attach = function(_, bufnr)
--           print('FStar server is running')
--        end,
--        autostart=true
--        })
-- end
-- 
-- vim.cmd[[
-- :command RunFStar lua RunFStar()
-- :au BufRead,BufNewFile *.fst set filetype=fstar
-- :autocmd FileType fstar RunFStar
-- ]]