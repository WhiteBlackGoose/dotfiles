require('orgmode').setup_ts_grammar()
require('orgmode').setup({
  org_default_notes_file = '~/me/_org/notes.org',
  org_agenda_files = {"~/me/_org/**"},
  win_split_mode = 'horizontal',
  org_agenda_span = 'month',
})
--
-- :autocmd BufNewFile,BufRead *.org fold
vim.cmd[[
:autocmd BufNewFile,BufRead *.org setlocal conceallevel=2
:autocmd BufNewFile,BufRead *.org setlocal concealcursor=nc
:autocmd BufNewFile,BufRead *.org setlocal nowrap
:autocmd BufNewFile,BufRead *.org setlocal foldlevel=99
]]

vim.cmd(":command MdToOrgLinks s/\\[\\(.*\\)\\](\\(.*\\))/[[\2][\1]]")

require("org-bullets").setup {
  concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
  symbols = {
    list = "•",
    headlines = { "◉", "○", "✸", "✿" },
    checkboxes = {
      half = { "", "OrgTSCheckboxHalfChecked" },
      done = { "✓", "OrgDone" },
      todo = { "×", "OrgTODO" },
    },
  }
}
-- require("headlines").setup()

-- This is a WORKAROUND of <https://github.com/nvim-orgmode/orgmode/issues/521>
norm = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'c1', 'i*<space>', norm)
vim.api.nvim_set_keymap('n', 'c2', 'i**<space>', norm)
vim.api.nvim_set_keymap('n', 'c3', 'i***<space>', norm)
vim.api.nvim_set_keymap('n', 'c4', 'i****<space>', norm)
vim.api.nvim_set_keymap('n', 'c5', 'i*****<space>', norm)
vim.api.nvim_set_keymap('n', 'c6', 'i******<space>', norm)

vim.api.nvim_set_keymap('n', 't1', 'o*<space>', norm)
vim.api.nvim_set_keymap('n', 't2', 'o**<space>', norm)
vim.api.nvim_set_keymap('n', 't3', 'o***<space>', norm)
vim.api.nvim_set_keymap('n', 't4', 'o****<space>', norm)
vim.api.nvim_set_keymap('n', 't5', 'o*****<space>', norm)
vim.api.nvim_set_keymap('n', 't6', 'o******<space>', norm)

vim.api.nvim_set_keymap('n', 'T1', 'O*<space>', norm)
vim.api.nvim_set_keymap('n', 'T2', 'O**<space>', norm)
vim.api.nvim_set_keymap('n', 'T3', 'O***<space>', norm)
vim.api.nvim_set_keymap('n', 'T4', 'O****<space>', norm)
vim.api.nvim_set_keymap('n', 'T5', 'O*****<space>', norm)
vim.api.nvim_set_keymap('n', 'T6', 'O******<space>', norm)

