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
add_tele('rg',  'live_grep')

add_tele_ext('cof', "advanced_git_search", "diff_commit_file")
add_tele_ext('col', "advanced_git_search", "search_log_content")
add_tele_ext_visual('col', "advanced_git_search", "diff_commit_line")

add('n', '<leader>ee', ":lua require'telescope.builtin'.symbols{ sources = {'emoji','math'} }<CR>")

