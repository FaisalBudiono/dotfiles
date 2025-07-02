return {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
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
