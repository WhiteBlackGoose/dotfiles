add('n', '<leader>rh', ':lua vim.diagnostic.open_float(nil, { focusable = false })<CR>')
add('n', '<leader>rd', ':RustDebuggables<CR>')

add('n', '<leader>rr', ':FloatermNew --height=0.8 --width=0.8 --autoclose=0 cargo run<CR>')
add('n', '<leader>rb', ':FloatermNew --height=0.8 --width=0.8 --autoclose=0 cargo build<CR>')
add('n', '<leader>rc', ':FloatermNew --height=0.8 --width=0.8 --autoclose=0 cargo check<CR>')

