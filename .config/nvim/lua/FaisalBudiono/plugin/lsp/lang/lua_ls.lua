return {
    settings = { -- custom settings for lua
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim", "Snacks" },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
                    vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
                },
            },
        },
    },
}
