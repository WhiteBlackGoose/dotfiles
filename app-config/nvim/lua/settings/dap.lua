local dap = require 'dap'

---.NET----------------------------


dap.adapters.coreclr = {
  type = 'executable',
  command = 'netcoredbg',
  args = {'--interpreter=vscode'}
}

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input({prompt = 'Path to your *proj file: ', default = default_path, completion = 'file'})
    vim.g['dotnet_last_proj_path'] = path
    -- local cmd = 'dotnet build -c Debug "' .. path .. '" 2> /tmp/dap-debug-nvim-dotnet.log'
    local cmd = 'dotnet build -c Debug "' .. path .. '"'
    print('\n')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ' .. vim.g.gsign('✔️ ', 'OK'))
    else
        print('\nBuild: ' .. vim.g.gsign('❌', 'ERR') .. '(code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input({prompt = 'Path to dll: ', default = vim.fn.getcwd() .. '/bin/Debug/', completion = 'file'})
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end
return vim.g['dotnet_last_dll_path'] end

local config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    console = "integratedTerminal",
    program = function()
        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
            vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
    end,
  },
}

dap.configurations.cs = config
dap.configurations.fsharp = config

---Rust/C/C++----------------------------

dap.adapters.codelldb = {
  type = 'server',
  -- host = '127.0.0.1',
  port = "13000",
  executable = {
    command = '/home/goose/programs/codelldb/extension/adapter/codelldb',
    args = {"--port", "13000"},
  }
}

--- https://github.com/vadimcn/vscode-lldb/releases/download/v1.8.1/codelldb-x86_64-linux.vsix for 
dap.configurations.rust = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input({prompt = 'Path to executable: ', default = vim.fn.getcwd()..'/', completion = 'file'})
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        sourceLanguages = { 'rust' },
        stopOnEntry = true
    }
}

dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

---Python------------------------------

dap.python = {
  type = 'executable';
  command = '/usr/bin/env';
  args = { 'python', '-m', 'debugpy.adapter' };
}

---Other-------------------------------

dap.adapters.gdb = {
  type = 'server',
  -- host = '127.0.0.1',
  port = "13000",
  executable = {
    command = 'gdb',
    args = {"--port", "13000"},
  }
}

dap.configurations.native = {
    {
        type = 'gdb',
        request = 'launch',
        program = function()
            -- return vim.fn.input('Path to native executable: ', vim.fn.getcwd()..'/', 'file')
            return '/home/goose/trash/InductiveVariadics/InductiveVariadics.Sample/bin/Debug/net7.0/InductiveVariadics.Sample'
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        sourceLanguages = { '*' },
        stopOnEntry = true
    }
}

vim.g['dap_DapBreakpoint_sign'] = vim.g.gsign(' ', '->')
vim.fn.sign_define('DapBreakpoint', { text=vim.g.gsign(' ', 'B'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=vim.g.gsign('ﳁ', 'B?'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=vim.g.gsign('', 'B!'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=vim.g.gsign('', 'Bi'), texthl='DapLogPoint', linehl='DapLogPointLine', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=vim.g.gsign('', '=>'), texthl='DapStopped', linehl='DapStoppedLine', numhl= 'DapStopped' })



