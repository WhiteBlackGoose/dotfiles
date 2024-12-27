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

-- Debugger and tools
local VSCODE_CODELLDB = os.getenv("VSCODE_CODELLDB")
if VSCODE_CODELLDB == nil then
    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        pattern = { "*.rs" },
        callback = function(_)
            print("VSCODE_CODELLDB is not set, Rust debugger won't work")
        end
    })
else
    local extension_path = VSCODE_CODELLDB .. "/share/vscode/extensions/vadimcn.vscode-lldb/"
    CODELLDB_PATH = extension_path .. 'adapter/codelldb'
    LIBLLDB_PATH = extension_path .. 'lldb/lib/liblldb.so'

    dap.adapters.codelldb = {
      type = 'server',
      port = "13000",
      executable = {
        command = CODELLDB_PATH,
        args = {"--port", "13000", "--liblldb", LIBLLDB_PATH},
      }
    }

    dap.adapters.codelldb_remote = {
      type = 'server',
      port = 14000,
      executable = {
        command = CODELLDB_PATH,
        args = {"--port", "14000", "--liblldb", LIBLLDB_PATH},
      }
    }
end

dap.adapters.codelldb_attach = {
  type = 'server',
  port = 13000,
}

dap.adapters.gdb_attach = {
  type = 'server',
  port = 13000,
}

dap.adapters.gdb = {
    id = 'gdb',
    type = 'executable',
    command = 'gdb',
    args = { '--quiet', '--interpreter=dap' },
}

dap.adapters.gdb_remote = {
    id = 'gdb',
    type = 'executable',
    command = 'gdb',
    args = {}
}

--- https://github.com/vadimcn/vscode-lldb/releases/download/v1.8.1/codelldb-x86_64-linux.vsix for 

local isCodelldbFound = CODELLDB_PATH ~= nil
local isGdbFound = vim.fn.executable('gdb') == 1

local executablePath = CacheFunction('program', function()
    return vim.fn.input({prompt = 'Path to executable: ', completion = 'file'})
end)

local function gen_cfg(name, type, request, langs)
    return {
            name = name,
            type = type,
            request = request,
            program = executablePath,
            cwd = '${workspaceFolder}',
            terminal = 'integrated',
            sourceLanguages = langs,
            stopOnEntry = false,
        }
end


local function dbg_bin(lang)
    local statusCodelldb
    if isCodelldbFound then
        statusCodelldb = ' ✅'
    else
        statusCodelldb = ' ❌<NOT AVAILABLE>'
    end

    local statusGdb
    if isGdbFound then
        statusGdb = ' ✅'
    else
        statusGdb = ' ❌<NOT AVAILABLE>'
    end

    return {
        gen_cfg("Launch GDB" .. statusGdb, 'gdb', 'launch', { lang }),
        gen_cfg("Launch LLDB" .. statusCodelldb, 'codelldb', 'launch', { lang }),

        -- make sure to start lldb-server platform select remote-linux --listen *:some-port
        {
            name = 'Remote LLDB' .. statusCodelldb,
            type = 'codelldb_remote',
            request = 'launch',
            program = executablePath,
            cwd = '.',
            terminal = 'console',
            sourceLanguages = { lang },
            stopOnEntry = false,
            initCommands = CacheFunction('settings', function()
                local plat
                vim.ui.select({'linux', 'macos', 'windows'}, {prompt = 'Platform: '},
                    function(c)
                        plat = c
                    end)
                local addr = vim.fn.input({prompt = 'Remote (host:port): '})
                return {
                    "platform select remote-" .. plat,
                    "platform connect connect://" .. addr,
                    "settings set target.inherit-env false",
                }
            end),
        },

        -- make sure to start gdbserver :some-port
        {
            name = "Remote GDB (non-working :[ )" .. statusGdb,
            type = 'gdb_remote',
            program = executablePath,
            cwd = '.',
            terminal = 'console',
            sourceLanguages = { lang },
            stopOnEntry = false,
        },

        gen_cfg("Attach to LLDB (TCP)", 'codelldb_attach', 'launch', { lang }),
    }
end

dap.configurations.rust = dbg_bin("rust")
dap.configurations.c = dbg_bin("c")
dap.configurations.cpp = dbg_bin("cpp")
dap.configurations.asm = dbg_bin("asm")

---Python------------------------------

dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/env';
  args = { 'python', '-m', 'debugpy.adapter' };
}

---Other-------------------------------

vim.g['dap_DapBreakpoint_sign'] = vim.g.gsign(' ', '->')
vim.fn.sign_define('DapBreakpoint', { text=vim.g.gsign(' ', 'B'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text=vim.g.gsign(' ', 'B?'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text=vim.g.gsign(' ', 'B!'), texthl='DapBreakpoint', linehl='DapBreakpointLine', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text=vim.g.gsign(' ', 'Bi'), texthl='DapLogPoint', linehl='DapLogPointLine', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text=vim.g.gsign(' ', '=>'), texthl='DapStopped', linehl='DapStoppedLine', numhl= 'DapStopped' })

