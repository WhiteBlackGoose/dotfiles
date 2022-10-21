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
--    Rule("{", "}")
})




