return {
    "MysticalDevil/inlay-hints.nvim",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
    keys = {
        {
            "<leader>lih",
            function()
                vim.cmd("InlayHintsToggle")
            end,
            noremap = true,
            silent = true,
            desc = "Toggle Inlay Hints",
        },
    },
    config = function()
        require("inlay-hints").setup({
            commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
            autocmd = { enable = false }, -- Enable the inlay hints on `LspAttach` event
        })
    end,
}
