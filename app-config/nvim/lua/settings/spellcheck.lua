function EnableSpellcheck()
    vim.opt.spelllang = "en_us,de_de"
    vim.opt.spell = true
end
vim.cmd[[
:autocmd BufNewFile,BufRead 1Vocabulary.md lua EnableSpellcheck()
:command EnableSpellcheck lua EnableSpellcheck()
]]
