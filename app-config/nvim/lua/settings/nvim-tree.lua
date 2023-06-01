local function on_attach(bufnr)
    require("keymaps.common-editor")
    Nvim_tree_keymaps(bufnr)
end

require("nvim-tree").setup({
    on_attach = on_attach
})


