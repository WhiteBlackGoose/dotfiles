local mappings = {
    {'alpha', 'α'},
    {"beta", "β"},
    {'gamma', 'γ'},
    {'Gamma', 'Γ'},
    {'delta', 'δ'},
    {'Delta', 'Δ'},
    {"eps", "ε"},
    {'zeta', 'ζ'},
    {'eta', 'η'},
    {'theta', 'θ'},
    {'Theta', 'Θ'},
    {'iota', 'ι'},
    {"kappa", 'κ'},
    {"lambda", 'λ'},
    {"Lambda", 'Λ'},
    {'mu', 'μ'},
    {'nu', 'ν'},
    {'xi', 'ξ'},
    {'Xi', 'Ξ'},
    {"pi", "π"},
    {"Pi", "Π"},
    {"rho", "ρ"},
    {"Sigma", "Σ"},
    {"sigma", "σ"},
    {"tau", "τ"},
    {"upsilon", "υ"},
    {"phi", "ϕ"},
    {"Phi", "Φ"},
    {"chi", "𝝌"},
    {"psi", "ψ"},
    {"Psi", "Ψ"},
    {"omega", "ω"},
    {"Omega", "Ω"},
    {"=>", "⇒"},
    {"<=", "⇐"},
    {"->", "→"},
    {"<-", "←"},
    {"!=", "≠"},
    {">=", "⩾"},
    {"<=", "⩽"},
    {"sqrt", "⎷"},
}

function AutoCharEnable()
    for _, pair in pairs(mappings) do
        vim.keymap.set('i', pair[1], pair[2])
    end
end

function AutoCharDisable()
    for _, pair in pairs(mappings) do
        vim.keymap.del('i', pair[1])
    end
end

vim.cmd[[
:command AutoCharEnable lua AutoCharEnable()
:command AutoCharDisable lua AutoCharDisable()
]]
