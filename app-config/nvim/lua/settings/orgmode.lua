require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_default_notes_file = '~/info/notes.org',
  -- win_split_mode = 'float',
  org_agenda_span = 'month',
})

require('org-bullets').setup()
-- require("headlines").setup()

-- This is a WORKAROUND of <https://github.com/nvim-orgmode/orgmode/issues/521>
norm = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'c1', 'i*<space>', norm)
vim.api.nvim_set_keymap('n', 'c2', 'i**<space>', norm)
vim.api.nvim_set_keymap('n', 'c3', 'i***<space>', norm)
vim.api.nvim_set_keymap('n', 'c4', 'i****<space>', norm)

vim.api.nvim_set_keymap('n', 't1', 'o*<space>', norm)
vim.api.nvim_set_keymap('n', 't2', 'o**<space>', norm)
vim.api.nvim_set_keymap('n', 't3', 'o***<space>', norm)
vim.api.nvim_set_keymap('n', 't4', 'o****<space>', norm)

vim.api.nvim_set_keymap('n', 'T1', 'O*<space>', norm)
vim.api.nvim_set_keymap('n', 'T2', 'O**<space>', norm)
vim.api.nvim_set_keymap('n', 'T3', 'O***<space>', norm)
vim.api.nvim_set_keymap('n', 'T4', 'O****<space>', norm)
