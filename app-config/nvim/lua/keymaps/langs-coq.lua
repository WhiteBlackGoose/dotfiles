vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.v" },
    callback = function(_)
        print("hello")
        add('i', '<C-o>', '\\/')
        add('i', '<C-a>', '/\\')
        add('i', '<C-i>', '->')
    end
})

