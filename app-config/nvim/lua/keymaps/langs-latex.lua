
require('utils')
function begin_end_insert(txt)
    write_to_cursor('\\begin{' .. txt .. '}\n\n\\end{' .. txt .. '}')
end

vim.cmd[[
:command! -nargs=? LatexBeginEnd :lua begin_end_insert(<f-args>)
]]
