return {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = { "Neogit" },
    keys = {
        {
            "<leader>ggn",
            function()
                vim.cmd("Neogit kind=vsplit")
            end,
            noremap = true,
            silent = true,
            desc = "Open Neogit",
        },
        {
            "<leader>ggN",
            function()
                vim.cmd("Neogit")
            end,
            noremap = true,
            silent = true,
            desc = "Open Neogit in new tab",
        },
    },
    opts = {
        disable_line_numbers = false,
        disable_insert_on_commit = true,
        commit_editor = {
            kind = "split",
        },
    },
    config = true,
}
