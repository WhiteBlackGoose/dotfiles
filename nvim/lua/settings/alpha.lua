vim.cmd[[
lua << EOF
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF
]]

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

if not vim.g.use_simple() then
    -- Set header
    dashboard.section.header.val = {
        "                                                 ",
        "  ██◣   ◥██◤   ██      ██    ◥██◤    ██◣   ◢██   ",    
        "  ███◣   ██    ◥█◣    ◢█◤     ██     ███◣ ◢███   ",
        "  ██◥█◣  ██     ██    ██      ██     ██◥███◤██   ",
        "  ██ ◥█◣ ██     ◥█◣  ◢█◤      ██     ██ ◥█◤ ██   ",
        "  ██  ◥█◣██      ██  ██       ██     ██     ██   ",     
        " ◢██◣  ◥███      ◥█◣◢█◤      ◢██◣   ◢██◣   ◢██◣  ",  
        "                                                 ",
    }
end

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "i", vim.g.gsign(' ', 'File ') .. " > Proceed..." , ":ene <BAR> startinsert <CR>"),
}

