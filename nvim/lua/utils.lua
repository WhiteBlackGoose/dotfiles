
vim.g.use_simple = function()
    if vim.g['simple_sign_code'] then
        return true
    else
        return false
    end
end

vim.g.gsign = function(normal, simple)
    if vim.g.use_simple() then
        return simple
    else
        return normal
    end
end

vim.g.use_ide = function()
    if vim.g['is_ide_mode'] then
        return true
    else
        return false
    end
end

