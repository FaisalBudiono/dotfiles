return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    config = function()
        require("gitsigns").setup()
    end,
    keys = {
        {
            "<leader>gsa",
            function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = { "v" },
            noremap = true,
            silent = true,
            desc = "Stage hunk in visual mode",
        },
        {
            "<leader>gd",
            function()
                require("gitsigns").diffthis()
            end,
            noremap = true,
            silent = true,
            desc = "Git diff between latest and stage",
        },
        {
            "<leader>gb",
            function()
                require("gitsigns").blame_line()
            end,
            noremap = true,
            silent = true,
            desc = "Git blame line",
        },
        {
            "<leader>gvb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
            noremap = true,
            silent = true,
            desc = "Git blame line (Verbose)",
        },
    },
}
