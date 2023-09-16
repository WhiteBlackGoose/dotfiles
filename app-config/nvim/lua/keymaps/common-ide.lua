-- Debug
function DapJumpTo()
    local dap = require'dap'
    dap.toggle_breakpoint()
    dap.continue()
    dap.toggle_breakpoint()
end
add('n', '<F5>', ":lua require'dap'.continue()<CR>")
add('n', '<F9>', ":lua require'dap'.toggle_breakpoint()<CR>")
add('n', '<F3>', ":lua DapJumpTo()<CR>")
add('n', '<F10>', ":lua require'dap'.step_over()<CR>")
add('n', '<F34>', ":lua require'dap'.step_into()<CR>")
add('n', '<F7>', ":lua require'dap'.repl.open()<CR><C-w><C-w>i")
add('n', '<F8>', ":lua require'dap'.repl.close()<CR>")
add('n', '<F4>', ":lua require'dap'.disconnect()<CR>")

add('i', '<F5>',  "<ESC>:lua require'dap'.continue()<CR>i")
add('i', '<F9>',  "<ESC>:lua require'dap'.toggle_breakpoint()<CR>i")
add('i', '<F10>', "<ESC>:lua require'dap'.step_over()<CR>i")
add('i', '<F34>', "<ESC>:lua require'dap'.step_into()<CR>i")
add('i', '<F7>',  "<ESC>:lua require'dap'.repl.open()<CR><C-w><C-w>i")
add('i', '<F8>',  "<ESC>:lua require'dap'.repl.close()<CR>i")
add('i', '<F4>', "<ESC>:lua require'dap'.disconnect()<CR>i")

add('n', '<leader>enat', ":lua require'dap'.run(require'dap'.configurations.native)<CR>")

add('n', '<leader>eh', '<Cmd>lua require("dap.ui.widgets").hover()<CR>')

-- For those with limited keyboard
add('n', '<leader>edc', ":lua require'dap'.continue()<CR>")
add('n', '<leader>edj', ":lua DapJumpTo()<CR>")
add('n', '<leader>edt', ":lua require'dap'.toggle_breakpoint()<CR>")
add('n', '<leader>edo', ":lua require'dap'.step_over()<CR>")
add('n', '<leader>edi', ":lua require'dap'.step_into()<CR>")
add('n', '<leader>edrepo', ":lua require'dap'.repl.open()<CR><C-w><C-w>i")
add('n', '<leader>edrepc', ":lua require'dap'.repl.close()<CR>")
add('n', '<leader>eds', ":lua require'dap'.disconnect()<CR>")

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = {"*.rs", "Cargo.*"},
    callback = function(_)
        add('n', '<F5>', ":RustDebuggables<CR>")
        add('n', '<leader>edc', ":RustDebuggables<CR>")
    end
})

local runCommands = {
    {{"*.sh"}, "!./%"},
    {{"*.rs", "Cargo.*"}, "!cargo run"},
    {{"*.cs", "*.csproj"}, "!dotnet run"},
    {{"*.fs", "*.fsproj"}, "!dotnet run"},
    {{"*.py"}, "!python %"},
    {{"*.fst"}, "!fstar.exe %"},
    {{"*.idr"}, "!idris2 % -o out && ./build/exec/out"},
    {{"*.hs"}, "!cabal run"},
    {{"*.md"}, "MdView"},
    {{"*.html"}, "!surf % & disown"},
}
for _, pair in pairs(runCommands) do
    vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = pair[1],
    callback = function(_)
        vim.keymap.set('n', '<leader>ex', ':' .. pair[2] .. "<CR>", { buffer = true })
    end
    })
end

-- Terminal
add('n', '<leader>tt', ':botr vsplit <bar> term<CR>i')
add('n', '<leader>tT', ':botr split <bar> term<CR>i')
add('n', '<leader>TT', ':tab term<CR>i')
add('n', '<leader>tg', ':botr vsplit <bar> term lazygit<CR>i')
add('n', '<leader>tG', ':botr split <bar> term lazygit<CR>i')
add('n', '<leader>TG', ':tab term lazygit<CR>i')
add('n', '<leader>tna', ':botr vsplit <bar> term sudo ./apply<CR>i')

-- nvim-toggler
if vim.g.use_ide() then
    vim.keymap.set({ 'n', 'v' }, '<leader>cl', require('nvim-toggler').toggle)
end

-- magma (interactive env)
add('n', '<leader>mag', '<Plug>MagmaInit')
add('n', '<leader>mm', ':MagmaEvaluateLine<CR>')
add('v', '<leader>mm', ':<C-u>MagmaEvaluateVisual<CR>')
add('n', '<leader>mh', 'viw:<C-u>MagmaEvaluateVisual<CR>')
add('n', '<leader>me', ':MagmaReevaluateCell<CR>')
add('n', '<leader>ms', ':MagmaShowOutput<CR>')
add('n', '<leader>mi', ':JupyterInspect<CR>')

-- markdown
add('n', 'K', ':lua require("toggle-checkbox").toggle()<CR>')
add('n', '<leader>tbt', ':TableModeToggle<CR>')
vim.keymap.set('v', '<leader>mdb', ":lua require('markdowny').bold()<cr>", { buffer = 0 })
vim.keymap.set('v', '<leader>mdi', ":lua require('markdowny').italic()<cr>", { buffer = 0 })
vim.keymap.set('v', '<leader>mdk', ":lua require('markdowny').link()<cr>", { buffer = 0 })

-- built-in LSP
add('n', '<leader>ldc', ":LSPDeclaration<CR>")
add('n', '<leader>ldf', ":LSPDefinition<CR>")
add('n', '<leader>lh', ":LSPHover<CR>")
add('n', '<leader>lH', ":LSPHover<CR>:LSPHover<CR>")
add('n', '<leader>ls', ":LSPSignature<CR>")
add('n', '<leader>lrn', ":LSPRename<CR>")
add('n', '<leader>lc', ":LSPCodeActions<CR>")
add('n', '<leader>lre', ":LSPReferences<CR>")
add('n', '<leader>lll', ":LSPLocList<CR>")
add('n', '<leader>lf', ":lua vim.lsp.buf.format()<CR>")

function LSPLines()
    vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text, })
    vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines, })
end
add('n', '<leader>lli', ":lua LSPLines()<CR>")

-- Clipboard into buffer
add('n', '<leader>nv', ":vert new<CR>p")
add('n', '<leader>ns', ":hor new<CR>p")

-- gpt4all autocomplete
add('i', '<C-e>', "<Esc>:ChatGPTCompleteCode<CR>")
add('v', '<C-e>', ":ChatGPTRun complete_code<CR>")
