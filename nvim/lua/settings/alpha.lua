vim.cmd[[
lua << EOF
  require'alpha'.setup(require'alpha.themes.dashboard'.config)
EOF
]]

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

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

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "i", "  > Proceed..." , ":ene <BAR> startinsert <CR>"),
}

