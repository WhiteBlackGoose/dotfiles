-- Hover
add('n', '<leader>dhd', ':OmniSharpDocumentation<CR>')
add('n', '<leader>dhp', ':OmniSharpPreviewDefinition<CR>')
add('n', '<leader>dgd', ':OmniSharpGotoDefinition<CR>')

-- Tests
add('n', '<leader>dta', ':OmniSharpRunTestsInFile %:p<CR>')
add('n', '<leader>dtt', ':OmniSharpRunTest<CR>')

-- Other
add('n', '<leader>drs', ':OmniSharpRename<CR>')

-- Build
add('n', '<leader>db', ':lua vim.g.dotnet_build_project()<CR>')

-- dotnet

add('n', '<leader>drr', ':FloatermNew --height=0.8 --width=0.8 --autoclose=0 dotnet run<CR>')
add('n', '<leader>dq', ':OmniSharpGetCodeActions<CR>')
