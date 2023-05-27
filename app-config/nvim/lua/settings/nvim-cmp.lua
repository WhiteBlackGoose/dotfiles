local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
    snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
    sources =  cmp.config.sources({
        { name = "jupyter" },
        { name = "nvim_lsp" },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'orgmode' },
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),

    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        before = function (entry, vim_item)
          return vim_item
        end
      })
    }
})
