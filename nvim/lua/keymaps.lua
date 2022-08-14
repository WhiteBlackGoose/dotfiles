local map = vim.api.nvim_set_keymap

local norm = { noremap = true, silent = true }

-- Common
map('n', '<down>', 'gj', norm)
map('n', '<up>', 'gk', norm)
map('v', '<down>', 'gj', norm)
map('v', '<up>', 'gk', norm)
map('i', '<C-s>', '<ESC>:w<CR>i<right>', norm)
map('n', '<C-s>', ':w<CR>', norm)

-- Tabs
map('n', '<A-,>', ':BufferPrevious<CR>', norm)
map('n', '<A-.>', ':BufferNext<CR>', norm)
map('n', '<A-<>', ':BufferMovePrevious<CR>', norm)
map('n', '<A->>', ':BufferMoveNext<CR>', norm)
map('n', '<A-c>', ':BufferClose<CR>', norm)

-- Tree
map('n', '<A-f>', ':NvimTreeFindFile<CR>', norm)
map('n', '<A-t>', ':NvimTreeToggle<CR>', norm)

-- Ctrl+C to copy to clipboard
map('v', '<C-C>', '"+y', norm)
map('v', '<C-X>', '"+ygv<DEL>', norm)

-- German keys
map('i', '<A-u>', 'ü', norm)
map('i', '<A-o>', 'ö', norm)
map('i', '<A-a>', 'ä', norm)
map('i', '<A-s>', 'ß', norm)

map('i', '<A-U>', 'Ü', norm)
map('i', '<A-O>', 'Ö', norm)
map('i', '<A-A>', 'Ä', norm)
map('i', '<A-S>', 'ẞ', norm)

-- Change themes
map('n', '<A-[>', ":lua vim.g.theme_light()<CR>", norm)
map('n', '<A-]>', ":lua vim.g.theme_dark()<CR>", norm)

-- Debug
map('n', '<F5>', ":lua require'dap'.continue()<CR>", norm)
map('n', '<F9>', ":lua require'dap'.toggle_breakpoint()<CR>", norm)
map('n', '<F10>', ":lua require'dap'.step_over()<CR>", norm)
map('n', '<F11>', ":lua require'dap'.step_into()<CR>", norm)
map('n', '<F7>', ":lua require'dap'.repl.open()<CR><C-w><C-w>i", norm)
map('n', '<F8>', ":lua require'dap'.repl.close()<CR>", norm)
map('n', '<F4>', ":lua require'dap'.disconnect()<CR>", norm)

map('i', '<F5>',  "<ESC>:lua require'dap'.continue()<CR>i", norm)
map('i', '<F9>',  "<ESC>:lua require'dap'.toggle_breakpoint()<CR>i", norm)
map('i', '<F10>', "<ESC>:lua require'dap'.step_over()<CR>i", norm)
map('i', '<F11>', "<ESC>:lua require'dap'.step_into()<CR>i", norm)
map('i', '<F7>',  "<ESC>:lua require'dap'.repl.open()<CR><C-w><C-w>i", norm)
map('i', '<F8>',  "<ESC>:lua require'dap'.repl.close()<CR>i", norm)
map('i', '<F4>', "<ESC>:lua require'dap'.disconnect()<CR>i", norm)

-- Auto complete
vim.cmd[[inoremap <C-Space>  <Cmd>call deoplete#mapping#_rpcrequest_wrapper([])<CR>]]
-- vim.cmd[[inoremap <C-space><expr>  deoplete#manual_complete()]]
