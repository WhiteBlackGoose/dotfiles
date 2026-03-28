-- https://github.com/neovim/nvim-lspconfig/

LspSigns = {
    Error = vim.g.gsign(' ', 'E'),
    Warn = vim.g.gsign(' ', 'W'),
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


local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.texlab = { capabilities = capabilities }
vim.lsp.config.clangd = { capabilities = capabilities }
vim.lsp.config.nil_ls = {
    capabilities = capabilities,
    settings = {
        nix = {
          flake = {
            autoArchive = false,
            autoEvalInputs = false,
            enable = false
          }
        }
      }
}
vim.lsp.config.vuels = { capabilities = capabilities }
vim.lsp.config.idris2_lsp = { capabilities = capabilities }
vim.lsp.config.hls = { capabilities = capabilities }
vim.lsp.config.pyright = { capabilities = capabilities }
vim.lsp.config.ts_ls = { capabilities = capabilities }

vim.cmd [[ autocmd BufRead,BufNewFile *.slint set filetype=slint ]]
vim.lsp.config.slint_lsp = { capabilities = capabilities }
vim.lsp.config.solc = { capabilities = capabilities }
vim.lsp.config.cmake = { capabilities = capabilities }
vim.lsp.config.gleam = { capabilities = capabilities }

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
                '/home/goose/.jdtls/',
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


-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function ()
--     vim.diagnostic.open_float(nil, {focus=false})
--   end
-- })

-- LSP Diagnostics Options Setup 
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.lsp.inlay_hint.enable(true)
vim.cmd([[
command LspInlayHintsToggle lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
]])

vim.cmd([[
set signcolumn=yes
]])
