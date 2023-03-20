-- https://github.com/neovim/nvim-lspconfig/
vim.cmd[[
:command LSPDeclaration lua vim.lsp.buf.declaration()
:command LSPDefinition lua vim.lsp.buf.definition()
:command LSPHover lua vim.lsp.buf.hover()
:command LSPSignature lua vim.lsp.buf.signature_help()
:command LSPRename lua vim.lsp.buf.rename()
:command LSPCodeActions lua vim.lsp.buf.code_action()
:command LSPReferences lua vim.lsp.buf.references()
:command LSPLocList lua vim.diagnostic.setloclist()
]]


local lsp = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.texlab.setup{capabilities = capabilities}
lsp.clangd.setup{capabilities = capabilities}
lsp.nil_ls.setup{capabilities = capabilities}
lsp.jedi_language_server.setup{capabilities = capabilities}
lsp.java_language_server.setup{
    capabilities = capabilities,
    cmd = {"java-language-server"}
}
