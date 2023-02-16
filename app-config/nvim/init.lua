-- Look for logs here: /home/goose/.cache/nvim
-- /home/goose/.local/state/nvim/lsp.log
-- vim.lsp.set_log_level("TRACE")
vim.o.rtp = vim.fn.stdpath('data') .. '/plugged/impatient.nvim' ..','.. vim.o.rtp
require('utils')

require('plugins')
require('settings')
require('keymaps')

require('theme')
