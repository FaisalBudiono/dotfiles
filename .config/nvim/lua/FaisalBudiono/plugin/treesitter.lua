return {
    {
        "ravsii/tree-sitter-d2",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        version = "*", -- use the latest git tag instead of main
        build = "make nvim-install",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        dependencies = {},
        config = function()
            local ts = require("nvim-treesitter")
            ts.setup({})

            ts.install({
                "c",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "php",
                "phpdoc",
                "query",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "*" },
                callback = function(args)
                    pcall(vim.treesitter.start, args.buf)
                end,
            })

            vim.treesitter.language.register("sql", { "sql", "mysql" })
        end,
    },
}
