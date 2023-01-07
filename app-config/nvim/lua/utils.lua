
-- https://www.reddit.com/r/neovim/comments/psux8f/how_to_use_a_lua_function_to_insert_text/
function write_to_cursor(text)
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
end

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

