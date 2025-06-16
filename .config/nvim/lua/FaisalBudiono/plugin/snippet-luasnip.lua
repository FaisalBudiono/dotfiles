return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        local snippet_path = vim.fn.stdpath("config") .. "/lua/FaisalBudiono/snippets"

        require("luasnip.loaders.from_lua").load({ paths = snippet_path })
    end,
}
