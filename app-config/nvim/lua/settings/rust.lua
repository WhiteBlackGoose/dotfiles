vim.g.rustaceanvim = {
  config = function(_, opts)
  end,
  tools = {
    runnables = {
      use_telescope = true,
    },
    debuggables = {
      use_telescope = true,
    },
  },
  server = {
    on_attach = function(_, bufnr)
    end,
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        -- checkOnSave = {
        --   allFeatures = true,
        --   command = "clippy",
        --   extraArgs = { "--no-deps" },
        -- },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      }
    },
    dap = {
        adapter = require('rustaceanvim.config').get_codelldb_adapter(
            CODELLDB_PATH, LIBLLDB_PATH)
    }
  },
}

-- autoformat
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.rs"},
    callback = function(_)
        vim.lsp.buf.format()
    end
})
