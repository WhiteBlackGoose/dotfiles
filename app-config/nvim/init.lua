-- Look for logs here: /home/goose/.cache/nvim
-- /home/goose/.local/state/nvim/lsp.log
-- vim.lsp.set_log_level("DEBUG")
vim.g["is_ide_mode"]=1

vim.o.rtp = vim.fn.stdpath('data') .. '/plugged/impatient.nvim' ..','.. vim.o.rtp

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require('utils')

require('plugins')
require('settings')
require('keymaps')

require('theme')


if vim.g['open_agenda'] == 1 then
    require('orgmode').action('agenda.agenda')
end


if vim.g.neovide then
    require('settings.gui')
end
