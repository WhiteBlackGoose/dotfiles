local add_tele = function(keys, commandname)
    add('n', '<leader>' .. keys, "<cmd>lua require('telescope.builtin')." .. commandname .. "()<cr>")
end

local add_tele_ext = function(keys, extname, commandname)
    add('n', '<leader>' .. keys, "<cmd>lua require('telescope').extensions." .. extname .. "." .. commandname .. "()<cr>")
end

local add_tele_ext_visual = function(keys, extname, commandname)
    add('v', '<leader>' .. keys, ":<C-u>lua require('telescope').extensions." .. extname .. "." .. commandname .. "()<cr>")
end

add_tele('F',  'find_files')
add_tele('fb',  'buffers')
add_tele('fh',  'help_tags')
add_tele('cc',  'commands')
add_tele('coc',  'git_commits')
add_tele('man', 'man_pages')
add_tele('ref', 'lsp_references')
add_tele('sy',  'lsp_workspace_symbols')
add_tele('zz',  'spell_suggest')
add_tele('tk',  'keymaps')

add_tele_ext('cof', "advanced_git_search", "diff_commit_file")
add_tele_ext('col', "advanced_git_search", "search_log_content")
add_tele_ext_visual('col', "advanced_git_search", "diff_commit_line")

add('n', '<leader>em', ":lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>")



local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

GreekTelescope = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = {
        {"alpha",   "α"},
        {"epsilon", "ɛ"},
        {"phi",     "φ"},
        {"delta",   "δ"},
        {"Delta",   "Δ"},
        {"in",      "∈"}
      },
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_put({ selection.value[2] }, "", true, true)
      end)
      return true
    end,
  }):find()
end

-- to execu
vim.cmd[[
:command Greek lua GreekTelescope()
]]

add('n', '<leader>gr', ':lua GreekTelescope()<CR>')

