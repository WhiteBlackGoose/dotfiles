require'bufferline'.setup {
  auto_hide = true
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline = require('bufferline.api')

local function get_tree_size()
  return require"nvim-tree.view".View.width
end

nvim_tree_events.subscribe("TreeOpen", function()
  bufferline.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("Resize", function()
  bufferline.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe("TreeClose", function()
  bufferline.set_offset(0)
end)
