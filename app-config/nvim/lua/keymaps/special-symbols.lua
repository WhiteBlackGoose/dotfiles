-- German keys
local keys = {
    { '\\in', '∈' },
    { '\\notin', '∉' },
    { '\\land', '∧' },
    { '\\lor', '∨' },
}
function SpecialSymbolsEnable()
    for _, pair in pairs(keys) do
        add('i', pair[1], pair[2])
    end
end
function SpecialSymbolsDisable()
    for _, pair in pairs(keys) do
        vim.cmd(':iunmap ' .. pair[1])
    end
end

vim.cmd[[
:command SpecialSymbolsEnable lua SpecialSymbolsEnable()
:command SpecialSymbolsDisable lua SpecialSymbolsDisable()
]]
