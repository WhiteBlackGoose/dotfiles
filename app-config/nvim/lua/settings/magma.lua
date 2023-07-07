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

function JupInit()
    local time = os.time(os.date("!*t"))
    vim.cmd(':!jupyter kernel -f /tmp/' .. time .. "-jup.json --kernel=python3 & disown")
    return time
end

function JupAttach(time)
    vim.cmd(':JupyterAttach /tmp/' .. time .. '-jup.json')
    vim.cmd(':MagmaInit /tmp/' .. time .. '-jup.json')
end

function JupRun()
    local time = JupInit()
    JupAttach(time)
end

function JupDefault()
    vim.cmd[[
    :JupyterAttach /tmp/j.json
    :MagmaInit /tmp/j.json
    ]]
end

vim.cmd[[
:command MagmaInitPython lua MagmaInitPython()
:command MagmaInitCSharp lua MagmaInitCSharp()
:command MagmaInitFSharp lua MagmaInitFSharp()
:command JupDefault lua JupDefault()
:command JupRun lua JupRun()
:command JupAttach -nargs=1 lua JupAttach(<q-args>)
]]

vim.g['magma_automatically_open_output'] = false
vim.g.magma_copy_output = true
