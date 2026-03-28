require("neodev").setup({})

vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      workspace = {
        checkThirdParty = false
      }
    }
  }
}
