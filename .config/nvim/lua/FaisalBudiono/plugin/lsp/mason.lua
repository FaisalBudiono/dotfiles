return {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason" },
    event = { "VeryLazy" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({ automatic_enable = false })

        mason_tool_installer.setup({
            ensure_installed = {
                "bash-language-server",
                "biome",
                "css-lsp",
                "docker-compose-language-service",
                "dockerfile-language-server",
                "eslint-lsp",
                "eslint_d",
                "gofumpt",
                "goimports",
                "gopls",
                "htmx-lsp",
                "intelephense",
                "json-lsp",
                "lua-language-server",
                "php-cs-fixer",
                "prettier",
                "prettierd",
                "rust-analyzer",
                "selene",
                "shfmt",
                "sql-formatter",
                "sqlfmt",
                "sqls",
                "stylua",
                "tailwindcss-language-server",
                "taplo",
                "templ",
                "typescript-language-server",
                "yaml-language-server",
            },
        })

        vim.cmd("MasonToolsInstall")
    end,
}
