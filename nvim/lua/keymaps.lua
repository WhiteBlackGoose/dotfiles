local map = vim.api.nvim_set_keymap

local norm = { noremap = true, silent = true }

local add = function(mode, key, output)
    map(mode, key, output, norm)
end

add('i', '<C-a>', '<Cmd>')

-- Common
add('n', '<down>', 'gj')
add('n', '<up>', 'gk')
add('v', '<down>', 'gj')
add('v', '<up>', 'gk')
add('i', '<C-s>', '<ESC>:w<CR>i<right>')
add('n', '<C-s>', ':w<CR>')

add('n', '<A-">', '<C-y>')
add('n', '<A-:>', '<C-e>')

add('n', '<C-l>', 'zz')

add('i', '<C-t>', '<C-V><Tab>') -- inserts actual tab symbol

-- Tabs
add('n', '<A-,>', ':BufferPrevious<CR>')
add('n', '<A-.>', ':BufferNext<CR>')
add('n', '<A-<>', ':BufferMovePrevious<CR>')
add('n', '<A->>', ':BufferMoveNext<CR>')
add('n', '<A-c>', ':BufferClose<CR>')

-- Tree
add('n', '<A-f>', ':NvimTreeFindFile<CR>')
add('n', '<A-t>', ':NvimTreeToggle<CR>')
 
-- Regular clipboard operations (besides inner nvim's clipboard)
add('v', '<C-c>', '"+y')
add('v', '<C-x>', '"+ygv<DEL>')
add('n', '<C-v>', 'h"+p')
-- add('v', '<C-v>', '<DEL>h"+p') How to make it work for both forward and backward selection?

-- German keys
add('i', '<A-u>', 'ü')
add('i', '<A-o>', 'ö')
add('i', '<A-a>', 'ä')
add('i', '<A-s>', 'ß')

add('i', '<A-U>', 'Ü')
add('i', '<A-O>', 'Ö')
add('i', '<A-A>', 'Ä')
add('i', '<A-S>', 'ẞ')

-- Change themes
add('n', '<leader>the', ":lua vim.g.theme_toggle()<CR>")

-- Build
add('n', '<C-b>', ':lua vim.g.dotnet_build_project()<CR>')

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

add('n', '<leader>h', '<Cmd>lua require("dap.ui.widgets").hover()<CR>')


-- O#

-- Hover
add('n', '<leader>hd', ':OmniSharpDocumentation<CR>')
add('n', '<leader>hp', ':OmniSharpPreviewDefinition<CR>')
add('n', '<leader>hg', ':OmniSharpGotoDefinition<CR>')

-- Tests
add('n', '<leader>ta', ':OmniSharpRunTestsInFile %:p<CR>')
add('n', '<leader>tt', ':OmniSharpRunTest<CR>')


-- Auto complete
vim.cmd[[inoremap <C-Space>  <Cmd>call deoplete#mapping#_rpcrequest_wrapper([])<CR>]]
-- vim.cmd[[inoremap <C-Space> aaaaa]]
-- vim.cmd[[inoremap <C-space><expr>  deoplete#manual_complete()<CR>]]
-- vim.cmd[[inoremap <C-space> <Cmd>call deoplete#manual_complete()<CR>]]
-- vim.cmd[[inoremap <C-space> <Cmd>call asyncomplete#force_refresh()<CR>]]

-- ALE
add('n', '<C-q>', ':ALEToggle<CR>')
add('n', '<C-p>', ":ALEPopulateLocList<CR>")


-- Telescope

local addtele = function(keys, commandname)
    add('n', '<leader>' .. keys, "<cmd>lua require('telescope.builtin')." .. commandname .. "()<cr>")
end

addtele('ff',  'find_files')
addtele('fb',  'buffers')
addtele('fh',  'help_tags')
addtele('cc',  'commands')
addtele('co',  'git_commits')
addtele('man', 'man_pages')
addtele('ref', 'lsp_references')
addtele('sy',  'treesitter')

