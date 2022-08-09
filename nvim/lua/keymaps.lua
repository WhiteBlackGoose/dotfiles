local map = vim.api.nvim_set_keymap

local norm = { noremap = true, silent = true }

map('n', '<down>', 'gj', norm)
map('n', '<up>', 'gk', norm)
map('n', '<A-t>', ':NvimTreeToggle<CR>', norm)

map('n', '<A-,>', ':BufferPrevious<CR>', norm)
map('n', '<A-.>', ':BufferNext<CR>', norm)
map('n', '<A-<>', ':BufferMovePrevious<CR>', norm)
map('n', '<A->>', ':BufferMoveNext<CR>', norm)
map('n', '<A-c>', ':BufferClose<CR>', norm)
map('n', '<A-f>', ':NvimTreeFindFile<CR>', norm)

-- Ctrl+C to copy to clipboard
map('v', '<C-C>', '"+y', norm)

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


