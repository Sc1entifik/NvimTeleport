local languages = {
    "python",
    "java",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "html",
}

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
    pattern = languages,
    callback = function()
        vim.treesitter.start()

        -- Treesitter indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

