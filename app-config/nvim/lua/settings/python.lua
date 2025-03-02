-- autoformat
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.py"},
    callback = function(_)
        vim.lsp.buf.format()
    end
})
