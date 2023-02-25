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
