 DracoRunServer = function()
    -- vim.lsp.start_client({
    --     name = 'draco',
    --     cmd={'/home/goose/Downloads/Compiler/src/Draco.LanguageServer/bin/Debug/net7.0/Draco.LanguageServer'},
    --     root_dir=vim.fs.dirname('.'),
    --     detached=true,
    --     on_attach = function(_, bufnr)
    --         print('hello')
    --     end,
    --     })
    vim.lsp.rpc.start(
        '/home/goose/Downloads/Compiler/src/Draco.LanguageServer/bin/Debug/net7.0/Draco.LanguageServer',
        {}
        )
    print('Server is started')
 end
 vim.cmd[[
 :command DracoRunServer lua DracoRunServer()
 ]]
 vim.cmd[[
 :au BufRead,BufNewFile *.draco set filetype=draco
 :autocmd FileType draco DracoRunServer
 ]]
