-- https://github.com/neovim/nvim-lspconfig/

LspSigns = {
    Error = vim.g.gsign(' ', 'E'),
    Warn = vim.g.gsign(' ', 'E'),
    Info = vim.g.gsign(' ', 'I'),
    Hint = vim.g.gsign(' ', 'L'),
}

vim.cmd [[
:command LSPDeclaration lua vim.lsp.buf.declaration()
:command LSPDefinition lua vim.lsp.buf.definition()
:command LSPHover lua vim.lsp.buf.hover()
:command LSPSignature lua vim.lsp.buf.signature_help()
:command LSPRename lua vim.lsp.buf.rename()
:command LSPCodeActions lua vim.lsp.buf.code_action()
:command LSPReferences lua vim.lsp.buf.references()
:command LSPLocList lua vim.diagnostic.setloclist()
]]


local lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp.texlab.setup { capabilities = capabilities }
lsp.clangd.setup { capabilities = capabilities }
lsp.nil_ls.setup { capabilities = capabilities }
lsp.vuels.setup { capabilities = capabilities }
lsp.tsserver.setup { capabilities = capabilities }
lsp.rust_analyzer.setup { capabilities = capabilities }
-- lsp.csharp_ls.setup{capabilities = capabilities}
-- lsp.omnisharp.setup{
--     cmd = { "OmniSharp" },
--     enable_editorconfig_support = true,
--     capabilities = capabilities
--     }
lsp.idris2_lsp.setup { capabilities = capabilities }
lsp.hls.setup { capabilities = capabilities }
lsp.jedi_language_server.setup { capabilities = capabilities }
-- lsp.java_language_server.setup{
--     capabilities = capabilities,
--     cmd = {"java-language-server"}
-- }

local jdtls = require('jdtls')
if os.getenv("JDTLS") ~= nil then
    local jdtls_config = {
        cmd = { os.getenv("JDTLS"), '-data', '/home/goose/.jdtls/' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    }
    require('jdtls').start_or_attach(jdtls_config)
end
jdtls.setup_dap()
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = "java",
    callback = function()
        local root_dir = jdtls.setup.find_root({ "java-workspace" })
        jdtls.start_or_attach({
            capabilities = capabilities,
            cmd = {
                os.getenv("JDTLS"),
                "-data",
                '~/jdtls/',
            },
            -- init_options = {
            --   bundles = vim.fn.readfile("@jdtls_bundles@"),
            -- },
            on_attach = vim.on_attach,
            root_dir = root_dir,
            settings = {
                -- java = {
                --   configuration = {
                --     runtimes = {
                --       {
                --         name = "JavaSE-17",
                --         path = "@jdk@/lib/openjdk",
                --       },
                --     },
                --   },
                --   format = {
                --     settings = {
                --       url = "@jdtls_format@",
                --     },
                --   },
                -- },
            },
        })
    end,
})

local function define_lsp_signs()
for type, icon in pairs(LspSigns) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
end

define_lsp_signs()
