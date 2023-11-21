-- https://github.com/windwp/nvim-autopairs#installation

-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require('nvim-autopairs')
-- 
-- npairs.add_rule(Rule("$$","$$","tex"))


require("nvim-autopairs").setup { map_cr = false }

require('nvim-autopairs').clear_rules()


local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rules({
    Rule("(", ")"),
    Rule("[", "]"),
})

function AddTexAutoPairRules()
    npairs.add_rules({
        Rule('{', '}'),
        Rule('$', '$')
        })
end

function AddRsAutoPairRules()
    npairs.add_rules({
        Rule('{', '}'),
        })
end

vim.cmd[[
:autocmd InsertEnter *.tex lua AddTexAutoPairRules()
:autocmd InsertEnter *.typ lua AddTexAutoPairRules()
:autocmd InsertEnter *.rs lua AddRsAutoPairRules()
]]




