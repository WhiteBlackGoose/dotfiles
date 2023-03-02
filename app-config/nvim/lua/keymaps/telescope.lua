local addtele = function(keys, commandname)
    add('n', '<leader>' .. keys, "<cmd>lua require('telescope.builtin')." .. commandname .. "()<cr>")
end

addtele('F',  'find_files')
addtele('fb',  'buffers')
addtele('fh',  'help_tags')
addtele('cc',  'commands')
addtele('co',  'git_commits')
addtele('man', 'man_pages')
addtele('ref', 'lsp_references')
addtele('sy',  'lsp_workspace_symbols')
addtele('zz',  'spell_suggest')
