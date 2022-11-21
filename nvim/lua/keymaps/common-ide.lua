-- Debug
add('n', '<F5>', ":lua require'dap'.continue()<CR>")
add('n', '<F9>', ":lua require'dap'.toggle_breakpoint()<CR>")
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

add('n', '<leader>eh', '<Cmd>lua require("dap.ui.widgets").hover()<CR>')

-- For those with limited keyboard

add('n', '<leader>edc', ":lua require'dap'.continue()<CR>")
add('n', '<leader>edt', ":lua require'dap'.toggle_breakpoint()<CR>")
add('n', '<leader>edo', ":lua require'dap'.step_over()<CR>")
add('n', '<leader>edi', ":lua require'dap'.step_into()<CR>")
add('n', '<leader>edrepo', ":lua require'dap'.repl.open()<CR><C-w><C-w>i")
add('n', '<leader>edrepc', ":lua require'dap'.repl.close()<CR>")
add('n', '<leader>eds', ":lua require'dap'.disconnect()<CR>")

-- Floaterm

add('n', '<leader>tty', ':FloatermNew --height=0.8 --width=0.8<CR>')


-- Git

add('n', '<leader>lg', ':FloatermNew --height=0.8 --width=0.8 lazygit<CR>')

