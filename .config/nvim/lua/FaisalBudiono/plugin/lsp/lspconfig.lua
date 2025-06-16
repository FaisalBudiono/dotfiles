return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "b0o/schemastore.nvim",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = false,
        })

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local mason_lspconfig = require("mason-lspconfig")
        local util = require("FaisalBudiono.util")

        local keymap = vim.keymap -- for conciseness

        local on_attach = function(_, bufnr)
            local function opts(desc)
                return { noremap = true, silent = true, buffer = bufnr, desc = desc }
            end

            -- set keybinds
            keymap.set("n", "gd", vim.lsp.buf.definition, opts("LSP go to definition"))
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts("LSP go to declaration"))

            keymap.set("n", "gr", vim.lsp.buf.references, opts("Show LSP references"))

            keymap.set(
                "n",
                "<leader>gt",
                vim.lsp.buf.type_definition,
                opts("Show LSP type references")
            )
            keymap.set(
                "n",
                "<space>gi",
                vim.lsp.buf.implementation,
                opts("Show LSP implementation")
            )

            keymap.set("n", "<leader>ldh", vim.diagnostic.open_float, opts("Show line diagnostic"))

            vim.keymap.set("n", "]d", function()
                vim.diagnostic.jump({ count = 1 })
            end, opts("Go to next diagnostic"))

            vim.keymap.set("n", "[d", function()
                vim.diagnostic.jump({ count = -1 })
            end, opts("Go to previous diagnostic"))

            keymap.set("n", "K", vim.lsp.buf.hover, opts("Show LSP hover doc"))

            keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts("Rename variable"))

            keymap.set("n", "<leader>l.", vim.lsp.buf.code_action, opts("LSP code action"))
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the Diagnostic symbols in the sign column (gutter)
        local signs = { Error = "", Warn = "", Hint = "", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local default_config = {
            capabilities = capabilities,
            on_attach = on_attach,
        }

        local servers = mason_lspconfig.get_installed_servers()

        for _, server_name in ipairs(servers) do
            local isSuccess, lang_config =
                pcall(require, "FaisalBudiono.plugin.lsp.lang." .. server_name)

            if isSuccess then
                local custom_config = util.table_expand(default_config, lang_config)

                lspconfig[server_name].setup(custom_config)
            else
                lspconfig[server_name].setup(default_config)
            end
        end
    end,
}
