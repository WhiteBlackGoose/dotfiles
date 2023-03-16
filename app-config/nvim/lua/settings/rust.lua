-- Debugger and tools
local extension_path = "/nix/store/ycm9v901bpnyk1383yzp1l8g80rrnacx-vscode-extension-vadimcn-vscode-lldb-1.8.1/share/vscode/extensions/vadimcn.vscode-lldb/"
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
-- local codelldb_path = "codelldb"
-- local liblldb_path = "liblldb.so"
local rt = require('rust-tools')

local opts = {
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ra", rt.code_action_group.code_action_group, { buffer = bufnr })
            -- require 'illuminate'.on_attach(client)
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            },
        }
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    }
}

-- Normal setup
rt.setup(opts)


-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
]])
