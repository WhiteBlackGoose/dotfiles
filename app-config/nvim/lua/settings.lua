local cmd = vim.cmd
local opt = vim.opt

opt.shortmess:append('I')

local function TableToString(val)
    if type(val) == 'table' then
        return vim.inspect(val)
    else
        return tostring(val)
    end
end

function CacheFunction(name, fn)
    local val = nil
    return function()
        if val == nil then
            val = fn()
        else
            if vim.fn.confirm('Do you want to change:\n' .. name .. ': ' .. TableToString(val),
                '&yes\n&no', 2) == 1 then
                val = fn()
            end
        end
        return val
    end
end

opt.clipboard = 'unnamedplus'
if vim.g.use_ide() then
    opt.cursorline = true
    opt.number = true
    opt.relativenumber = true
end

opt.title = true

if vim.g.use_simple() then
end

vim.cmd[[
set nrformats+=alpha
]]

vim.wo.fillchars='eob: '

opt.ignorecase = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = false
vim.cmd[[filetype indent off]]

vim.cmd[[set nofixendofline]]
vim.cmd[[set virtualedit=block]]

vim.g.editorconfig = true

vim.g['python3_host_prog'] = 'python3'

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.html"},
    callback = function(_)
        vim.cmd[[command-buffer HtmlView !surf % & disown]]
    end
})



-- By alphabet please
require('settings.airline')
require('settings.auto-char')
require('settings.amcli')
require('settings.asciitree')
-- require('settings.barbar')
require('settings.image-nvim')
require('settings.nvim-tree')
require('settings.telescope')
require('settings.template')
require('settings.spellcheck')
require('settings.undotree')
require('settings.wdiff')

if vim.g.use_ide() then
    require('settings.colortils')
    require('settings.dap')
    LazyRequire('settings.dap-python', {'*.py'})
    require('settings.dapui')
    LazyRequire('settings.fstar-lsp', {'*.fst'})
    require('settings.gitsigns')
    LazyRequire('settings.ionide', {'*.fs', "*.fsproj"})
    require('settings.iron')
    LazyRequire('settings.latex', {"*.tex"})
    require('settings.lsp')
    LazyRequire('settings.lua-lsp', {"*.lua"})
    require('settings.magma')
    require('settings.markdown')
    require('settings.trans')
    require('settings.nvim-autopairs')
    require('settings.nvim-cmp')
    require('settings.nvim-treesitter')
    LazyRequire('settings.ale', {"*.csproj", "*.cs", "*.rs", "Cargo.*"})
    LazyRequire('settings.asyncomplete', {"*.csproj", "*.cs"})
    LazyRequire('settings.omnisharp-vim', {"*.csproj", "*.cs"})
    LazyRequire('settings.vim-test', {"*.csproj", "*.cs"})
    LazyRequire('settings.orgmode', {"*.org"})
    LazyRequire('settings.rust', {"*.rs", "Cargo.*"})
    LazyRequire('settings.python', {"*.py" })
    require('settings.toggler')
    require('settings.ufo')
    require('settings.vim-dadbod-ui')
    require('settings.vim-table-mode')
end

local function print_hex()
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))
    local current_line = vim.api.nvim_get_current_line()

    local function get_hex(coll)
        if coll < 0 then
            return "[--:-]"
        end
        if coll >= #current_line then
            return "[--:-]"
        end
        local c = current_line:sub(coll + 1, coll + 1)
        return string.format("[%02X:%s]", string.byte(c), c)
    end
    return string.format("HEX: %s %s %s <<%s>> %s %s %s", get_hex(col - 3), get_hex(col - 2), get_hex(col - 1), get_hex(col), get_hex(col + 1), get_hex(col + 2), get_hex(col + 3))
end

HEX_ID = nil
vim.api.nvim_create_user_command("HexViewEnable",
    function()
        if HEX_ID == nil then
            HEX_ID = vim.api.nvim_create_autocmd({ "CursorMoved" },
                {
                    callback = function()
                        print(print_hex())
                    end
                })
        end
    end, {})

vim.api.nvim_create_user_command("HexViewDisable",
    function()
        if HEX_ID ~= nil then
            vim.api.nvim_del_autocmd(HEX_ID)
            HEX_ID = nil
        end
    end, {})

vim.api.nvim_create_user_command('LogCollapseWrap', [[:%s/\n^\([^[]\)/\1]], {})

vim.api.nvim_create_user_command('LogFixWindowsShit', [[
    :set nobomb
    :%!iconv -f utf-16le -t cp437
    :set fileencoding=utf8
    :set fileformat=unix
    ]], {})

vim.api.nvim_set_hl(0, 'logLvDebug', { fg="gray" })
