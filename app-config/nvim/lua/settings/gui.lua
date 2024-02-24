-- vim.o.guifont = "FiraCode Nerd Font:h9"
-- vim.o.guifont = "DejaVu Sans:h9"
-- RUN :set guifont=* to select
vim.o.guifont = "FantasqueSansM Nerd Font:h11"
-- vim.o.guifont = "DejaVu Sans Mono:h9"
vim.cmd[[set mouse=nv]]
-- vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_refresh_rate = 90
vim.g.neovide_input_use_logo = false
vim.g.neovide_scroll_animation_length = 0.2
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.opt.showmode = false

vim.api.nvim_create_autocmd(
    { "FileType" }, {
        pattern = ".*comic.*",
        callback = function ()
            vim.o.guifont = "ComicShannsMono Nerd Font"
        end
    })

vim.o.winblend = 30
vim.o.pumblend = 30
vim.g.neovide_floating_blur = 0.6
vim.g.neovide_floating_blur_amount_x = 5.0
vim.g.neovide_floating_blur_amount_y = 5.0
vim.o.linespace = 3


local function curr_mode_cute()
    -- local f=io.open("~/.config/i3/currmode", "r")
    io.input("/home/goose/.config/i3/currmode")
    local r = io.read()
    print(r)
    return r == "cute"
end

--if curr_mode_cute() then
    -- vim.g.neovide_transparency = 0.6
    vim.opt.cursorline = false
--end
