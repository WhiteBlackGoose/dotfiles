local cmp = require('cmp')

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
        { name = 'path' }
    }),
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    })
})

