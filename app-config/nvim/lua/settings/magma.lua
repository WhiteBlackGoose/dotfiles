function MagmaInitCSharp()
    vim.cmd[[
    :MagmaInit .net-csharp
    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
    ]]
end

function MagmaInitFSharp()
    vim.cmd[[
    :MagmaInit .net-fsharp
    :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
    ]]
end

function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
end

vim.cmd[[
:command MagmaInitPython lua MagmaInitPython()
:command MagmaInitCSharp lua MagmaInitCSharp()
:command MagmaInitFSharp lua MagmaInitFSharp()
]]

vim.g['magma_automatically_open_output'] = false
