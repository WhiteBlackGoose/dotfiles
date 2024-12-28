vim.keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_enabled = true
-- enable copilot for all filetypes
local dic = {}
dic[''] = true
vim.g.copilot_filetypes = dic
-- assign a set with keys to a variable lua
