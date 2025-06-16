return {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-f>",
                clear_suggestion = "<C-e>",
                accept_word = "<C-j>",
            },
        })
    end,
}
